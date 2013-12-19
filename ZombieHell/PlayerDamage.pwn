/*

Zombie Hell - Player Damage Script
Created April 21 2013
Description - Player Health Damage, Player Self Damage

*/


public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
   	if(issuerid == INVALID_PLAYER_ID)
	{
		pInfo[playerid][pHealth] -= random(70);
	}
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid)
{
	if(!IsPlayerNPC(playerid) || !IsPlayerNPC(damagedid))
	{
		if(damagedid != INVALID_PLAYER_ID)
		{
			if(weaponid == 0) { pInfo[damagedid][pHealth] -= 5; }
			if(weaponid == 1) { pInfo[damagedid][pHealth] -= 8; }
			if(weaponid == 2) { pInfo[damagedid][pHealth] -= 10; }
			if(weaponid == 3) { pInfo[damagedid][pHealth] -= 10; }
			if(weaponid == 4) { pInfo[damagedid][pHealth] -= 12; }
			if(weaponid == 5) { pInfo[damagedid][pHealth] -= 13; }
			if(weaponid == 6) { pInfo[damagedid][pHealth] -= 10; }
			if(weaponid == 7) { pInfo[damagedid][pHealth] -= 10; }
			if(weaponid == 8) { pInfo[damagedid][pHealth] -= 20; }
			if(weaponid == 9) { pInfo[damagedid][pHealth] -= 25; }
			if(weaponid == 10) { pInfo[damagedid][pHealth] -= 50; }
			if(weaponid == 11) { pInfo[damagedid][pHealth] -= 20; }
			if(weaponid == 12) { pInfo[damagedid][pHealth] -= 25; }
			if(weaponid == 13) { pInfo[damagedid][pHealth] -= 25; }
			if(weaponid == 16) { pInfo[damagedid][pHealth] -= 70; }
			if(weaponid == 22) { pInfo[damagedid][pHealth] -= 25; }
			if(weaponid == 25) { pInfo[damagedid][pHealth] -= 35; }
			if(weaponid == 26) { pInfo[damagedid][pHealth] -= 30; }
			if(weaponid == 27) { pInfo[damagedid][pHealth] -= 35; }
			if(weaponid == 28) { pInfo[damagedid][pHealth] -= 15; }
			if(weaponid == 29) { pInfo[damagedid][pHealth] -= 25; }
			if(weaponid == 30) { pInfo[damagedid][pHealth] -= 25; }
			if(weaponid == 31) { pInfo[damagedid][pHealth] -= 30; }
			if(weaponid == 32) { pInfo[damagedid][pHealth] -= 15; }
			if(weaponid == 33) { pInfo[damagedid][pHealth] -= 35; }
			if(weaponid == 34) { pInfo[damagedid][pHealth] -= 50; }
			if(IsPlayerConnected(playerid))
			{
				PlayerPlaySound(playerid, 17802, 0.0, 0.0, 0.0);
			}
		}
	}
	return 1;
}
