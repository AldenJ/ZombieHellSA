/*

Zombie Hell - Zombies AI script
Created April 27 2013
Description - Zombie attack, zombie movement, generic zombie functions

*/


#define MAX_ZOMBIES 500

enum zombieinfo
{
	ZombieAttackPlayer,
	IsFollowing,
	nodeStop,
}
new Zombie[MAX_ZOMBIES][zombieinfo];

stock ZombieInit()
{
	FCNPC_SetUpdateRate(80);
	for(new i = 0; i < MAX_NODES; i++)
	{
	    if(!FCNPC_IsNodeOpen(i) && !FCNPC_OpenNode(i))
 		{
 		    printf("Error: Failed to open node %d from (scriptfiles/FCNPC/Nodes/NODES%d.DAT)", i, i);
 		    return 0;
   		}
	}

	for(new i = 0; i < MAX_ZOMBIES; i++)
	{
		new name[24];
  		format(name, 24, "Zombie_%d", i + 1);
		new npcid = FCNPC_Create(name);
		FCNPC_Spawn(npcid, random(299), 0, 0, 0);
		FCNPC_SetHealth(npcid, 100);
		Zombie[i][ZombieAttackPlayer] = -1;
		Zombie[i][IsFollowing] = -1;
		Zombie[i][nodeStop] = -1;

		new node = random(MAX_NODES);
		while(!LosSantosNodes(node))
		    node = random(MAX_NODES);

		new vehnodes, pednodes, navinodes;
		FCNPC_GetNodeInfo(node, vehnodes, pednodes, navinodes);

		new point;
		if(random(2) == 1 && pednodes != 0)
			point = random(pednodes) + pednodes;
	    else
	        point = random(pednodes);

		FCNPC_SetNodePoint(node, point);

		if(point < vehnodes)
		{
			new Float:x, Float:y, Float:z;
			FCNPC_GetNodePointPosition(node, x, y, z);
			FCNPC_SetPosition(npcid, x, y, z+1);
  		}
		FCNPC_PlayNode(npcid, node, point < pednodes ? NODE_TYPE_PED : NODE_TYPE_PED);
		SetPlayerColor(npcid, 0xAA333300);
	}
	return 1;
}

timer UpdateZombieMovement[800]()
{
    new Float:x, Float:y, Float:z, Float:fPos[3];
	foreach(Player, i)
	{
	    if(pInfo[i][pLogged] == 1)
	    {
	        if(pInfo[i][IsPlayerSpawned] == 1)
	        {
				for(new j = 0; j != MAX_ZOMBIES; j++)
			    {
					FCNPC_GetPosition(j, x, y, z);
					Zombie[j][ZombieAttackPlayer] = GetNearest_Player(i, 4.2);
					if(IsPlayerInRangeOfPoint(i, 50.0, x, y, z))
					{
 						GetPlayerPos(i, fPos[0], fPos[1], fPos[2]);
						FCNPC_GoTo(j, fPos[0], fPos[1], fPos[2], MOVE_TYPE_SPRINT, 5.6, 1);

						Zombie[j][IsFollowing] = 1;
						Zombie[j][nodeStop] = 1;
						if(GetDistanceBetweenPlayers(i,j) < 1.7)
						{
		    				if(!FCNPC_IsDead(j))
						    {
						        //FCNPC_Stop(j);
					    		pInfo[i][pHealth] -= random(50);
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

public FCNPC_OnTakeDamage(npcid, damagerid, weaponid, bodypart)
{
    new Float:HP = FCNPC_GetHealth(npcid);
    if(weaponid == 34) FCNPC_SetHealth(npcid, HP-120) ; // Sniper
	return 1;
}

public FCNPC_OnDeath(npcid, killerid, weaponid)
{
	new randommoney = random(150);
	new randomxp = random(60);
 	new randommoneyfac = random(350);
 	new randomxpfac = random(230);

	if(pInfo[killerid][pIsInFaction] == 1)
	{
		GivePlayerValue(killerid, MONEY, randommoneyfac);
		GivePlayerValue(killerid, XP, randomxpfac);
	}
	else
	{
		GivePlayerValue(killerid, MONEY, randommoney);
		GivePlayerValue(killerid, XP, randomxp);
	}


	if(IsPlayerAimingTargetBodyPart(killerid, npcid, BODY_PART_HEAD))
	{
		GameTextForPlayer(killerid, "~r~~h~Headshot!", 3000, 3);
		pInfo[killerid][Headshots]++;
	}

	pInfo[killerid][ZombiesKilled]++;
	SendDeathMessage(killerid, npcid, weaponid);


	new zkilled[64];
	format(zkilled, sizeof(zkilled), "~w~+ ~r~ZKilled: %i", pInfo[killerid][ZombiesKilled]);
	SendBoxMessage(killerid, zkilled);
	defer RespawnZ(npcid);
	return 1;
}

timer RespawnZ[6000](npcid)
{
	new node = random(MAX_NODES);
	while(!LosSantosNodes(node))
		node = random(MAX_NODES);

	new vehnodes, pednodes, navinodes;
	FCNPC_GetNodeInfo(node, vehnodes, pednodes, navinodes);

	new point;
	if(random(2) == 1 && pednodes != 0)
		point = random(pednodes) + vehnodes;
	else
		point = random(vehnodes);

	FCNPC_Respawn(npcid);
	FCNPC_SetNodePoint(node, point);

	if(point < vehnodes)
	{
		new Float:x, Float:y, Float:z;
		FCNPC_GetNodePointPosition(node, x, y, z);
		FCNPC_SetPosition(npcid, x, y, z+1);
	}
	FCNPC_PlayNode(npcid, node, point < vehnodes ? NODE_TYPE_PED : NODE_TYPE_PED);
	Zombie[npcid][ZombieAttackPlayer] = -1;
	Zombie[npcid][IsFollowing] = -1;
	Zombie[npcid][nodeStop] = -1;
    return 1;
}

stock ZombieExit()
{
	for(new i = 0; i < MAX_NODES; i++)
	{
	    if(FCNPC_IsNodeOpen(i))
			FCNPC_CloseNode(i);
	}
	return 1;
}

public FCNPC_OnCreate(npcid)
{
	Zombie[npcid][ZombieAttackPlayer] = -1;
	Zombie[npcid][IsFollowing] = -1;
	Zombie[npcid][nodeStop] = -1;
	return 1;
}

public FCNPC_OnChangeNode(playerid, nodeid)
{
 	return LosSantosNodes(nodeid) ? 1 : 0;
}

stock LosSantosNodes(zoneid)
{
	if((zoneid >= 5 && zoneid <= 7) || (zoneid >= 12 && zoneid <= 15) || (zoneid >= 20 && zoneid <= 23)) return 1;
	return 0;
}
