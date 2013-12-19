/*

Zombie Hell - Functions script
Created April 17 2013
Description - Generic server functions, player functions, server functions

*/


stock SendBoxMessage(playerid, messagebox[])
{
    if(pInfo[playerid][IsBoxLine] == 0)
    {
        PlayerTextDrawSetString(playerid, BoxInfo1[playerid], messagebox);
		PlayerTextDrawShow(playerid, BoxInfo1[playerid]);
        pInfo[playerid][IsBoxLine]++;
    }

    else if(pInfo[playerid][IsBoxLine] == 1)
    {
        PlayerTextDrawSetString(playerid, BoxInfo2[playerid], messagebox);
        PlayerTextDrawShow(playerid, BoxInfo2[playerid]);
        pInfo[playerid][IsBoxLine]++;
    }

    else if(pInfo[playerid][IsBoxLine] == 2)
    {
        PlayerTextDrawSetString(playerid, BoxInfo3[playerid], messagebox);
        PlayerTextDrawShow(playerid, BoxInfo3[playerid]);
        pInfo[playerid][IsBoxLine]++;
    }

    else if(pInfo[playerid][IsBoxLine] == 3)
    {
        PlayerTextDrawSetString(playerid, BoxInfo4[playerid], messagebox);
        PlayerTextDrawShow(playerid, BoxInfo4[playerid]);
        pInfo[playerid][IsBoxLine]++;
    }

    else if(pInfo[playerid][IsBoxLine] == 4)
    {
        PlayerTextDrawSetString(playerid, BoxInfo5[playerid], messagebox);
        PlayerTextDrawShow(playerid, BoxInfo5[playerid]);
        pInfo[playerid][IsBoxLine]++;
    }

    else if(pInfo[playerid][IsBoxLine] == 5)
    {
        PlayerTextDrawSetString(playerid, BoxInfo6[playerid], messagebox);
        PlayerTextDrawShow(playerid, BoxInfo6[playerid]);
        pInfo[playerid][IsBoxLine]++;
    }

    else if(pInfo[playerid][IsBoxLine] >= 6)
    {
        new reset[64];
        format(reset, sizeof(reset), "~n~");
        PlayerTextDrawHide(playerid, BoxInfo1[playerid]);
        PlayerTextDrawHide(playerid, BoxInfo2[playerid]);
        PlayerTextDrawHide(playerid, BoxInfo3[playerid]);
        PlayerTextDrawHide(playerid, BoxInfo4[playerid]);
        PlayerTextDrawHide(playerid, BoxInfo5[playerid]);
        PlayerTextDrawHide(playerid, BoxInfo6[playerid]);
        PlayerTextDrawSetString(playerid, BoxInfo1[playerid], reset);
        PlayerTextDrawSetString(playerid, BoxInfo2[playerid], reset);
        PlayerTextDrawSetString(playerid, BoxInfo3[playerid], reset);
        PlayerTextDrawSetString(playerid, BoxInfo4[playerid], reset);
        PlayerTextDrawSetString(playerid, BoxInfo5[playerid], reset);
        PlayerTextDrawSetString(playerid, BoxInfo6[playerid], reset);
        pInfo[playerid][IsBoxLine] = 0;
    }
	return 1;
}

function WeatherUpdate()
{
    new Weathers[] =
	{
		1,
		2,
		9,
	};
	new id;
	id = Weathers[random(sizeof Weathers)];
	for(new i; i < MAX_PLAYERS; i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	    SetPlayerWeather(i,id);
	}
	return 1;
}

function ChangeServerTime()
{
	new hour,minute,second;
	gettime(hour,minute,second);
	new string[128];
	new string2[128];
	if (minute <= 9)
	{
 		format(string,25,"%d:0%d",hour,minute);
	}
	else
	{
 		format(string,25,"%d:%d",hour,minute);
	}
	new day,month,year;
	getdate(year,month,day);

	if (day <= 9){
		format(string2,25,"0%d.%d.%d",day,month,year);
	}
	else if (month <= 9 && day >= 9) {
		format(string2,25,"%d.0%d.%d",day,month,year);
	}
	else {
		format(string2,25,"%d.%d.%d",day,month,year);
	}

	if (hour == 0){SetWorldTime(0);}
	if (hour == 1){SetWorldTime(1);}
	if (hour == 2){SetWorldTime(2);}
	if (hour == 3){SetWorldTime(3);}
	if (hour == 4){SetWorldTime(4);}
	if (hour == 5){SetWorldTime(5);}
	if (hour == 6){SetWorldTime(6);}
	if (hour == 7){SetWorldTime(7);}
	if (hour == 8){SetWorldTime(8);}
	if (hour == 9){SetWorldTime(9);}
	if (hour == 10){SetWorldTime(10);}
	if (hour == 11){SetWorldTime(11);}
	if (hour == 12){SetWorldTime(12);}
	if (hour == 13){SetWorldTime(13);}
	if (hour == 14){SetWorldTime(14);}
	if (hour == 15){SetWorldTime(15);}
	if (hour == 16){SetWorldTime(16);}
	if (hour == 17){SetWorldTime(17);}
	if (hour == 18){SetWorldTime(18);}
	if (hour == 19){SetWorldTime(19);}
	if (hour == 20){SetWorldTime(20);}
	if (hour == 21){SetWorldTime(21);}
	if (hour == 22){SetWorldTime(22);}
	if (hour == 23){SetWorldTime(23);}
	if (hour == 24){SetWorldTime(24);}

	new strsa[128];
	format(strsa,sizeof(strsa),"mapname Time %s",string);
	SendRconCommand(strsa);
	return 1;
}

stock SetPlayerColorByFaction(playerid)
{
	if(!IsPlayerNPC(playerid))
	{
		if(pInfo[playerid][pIsInFaction] == 1)
		{
			switch(pInfo[playerid][pFactionID])
			{
			    case 1: SetPlayerColor(playerid, 0x00FFFF00);
			    case 2: SetPlayerColor(playerid, 0xFFFFFF00);
			    case 3: SetPlayerColor(playerid, 0x00640000);
			}
		}
		else
		{
		    SetPlayerColor(playerid, 0xF8F8FF00);
		}
	}
	return 1;
}

stock SetPlayerSkinByFaction(playerid)
{
	if(!IsPlayerNPC(playerid))
	{
	    if(pInfo[playerid][pAdminLevel] == 0)
	    {
			if(pInfo[playerid][pIsInFaction] == 1)
			{
				switch(pInfo[playerid][pFactionID])
				{
				    case 1: SetPlayerSkin(playerid, 287);

				    case 2:
				    {
						switch(random(4))
						{
							case 0: SetPlayerSkin(playerid, 150);
							case 1: SetPlayerSkin(playerid, 166);
							case 2: SetPlayerSkin(playerid, 165);
							case 3: SetPlayerSkin(playerid, 141);
						}
					}

					case 3:
					{
						switch(random(8))
						{
							case 0: SetPlayerSkin(playerid, 122);
							case 1: SetPlayerSkin(playerid, 121);
							case 2: SetPlayerSkin(playerid, 143);
							case 3: SetPlayerSkin(playerid, 176);
							case 4: SetPlayerSkin(playerid, 192);
							case 5: SetPlayerSkin(playerid, 29);
							case 6: SetPlayerSkin(playerid, 101);
							case 7: SetPlayerSkin(playerid, 242);
					    }
					}
				}
			}
			else
			{
			    switch(random(11))
				{
					case 0: SetPlayerSkin(playerid, 120);
					case 1: SetPlayerSkin(playerid, 23);
					case 2: SetPlayerSkin(playerid, 26);
					case 3: SetPlayerSkin(playerid, 45);
					case 4: SetPlayerSkin(playerid, 42);
					case 5: SetPlayerSkin(playerid, 45);
					case 6: SetPlayerSkin(playerid, 56);
					case 7: SetPlayerSkin(playerid, 190);
					case 8: SetPlayerSkin(playerid, 191);
					case 9: SetPlayerSkin(playerid, 192);
					case 10: SetPlayerSkin(playerid, 193);
				}
			}
		}
		else
		{
		    SetPlayerSkin(playerid, 217);
		}
	}
	return 1;
}

stock SendLocalMessage(playerid, color, Float:radius, string[])
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    foreach(Player,i)
    {
        if(IsPlayerInRangeOfPoint(i,radius,x,y,z))
        {
            SendClientMessage(i,color,string);
        }
    }
}

stock GetDistanceToPoint(playerid , Float: x2 ,Float: y2 , Float:z2 )
{
	new Float:dis;
	new Float:x1, Float: y1 ,Float: z1;

	GetPlayerPos(playerid , x1 , y1 , z1 );
	dis = floatsqroot((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)+(z2-z1)*(z2-z1));
	return floatround (dis);
}

stock CreateGates(type, modelid , Float: X , Float: Y , Float: Z , Float: XR , Float: YR , Float: ZR , Float: MoveX , Float: MoveY , Float: MoveZ , Float: Move_Distance , Float: Move_Speed)
{
    GatePos[MAX_GATES] [0] = X;
    GatePos[MAX_GATES] [1] = Y;
    GatePos[MAX_GATES] [2] = Z;
    GatePos[MAX_GATES] [3] = MoveX;
    GatePos[MAX_GATES] [4] = MoveY;
    GatePos[MAX_GATES] [5] = MoveZ;
    GateType[MAX_GATES] = type;
    GateSpeed[MAX_GATES] = Move_Speed;
    GateMoveLimit[MAX_GATES] = Move_Distance;
    GateID[MAX_GATES] = CreateDynamicObject(modelid, X, Y, Z, XR, YR, ZR, -1, -1, -1, 1000.0);
    MAX_GATES = MAX_GATES += 1;
    return MAX_GATES - 1;
}

stock GetAdminName(playerid)
{
	new adminname[128];
	switch(pInfo[playerid][pAdminLevel])
	{
		case 0: adminname = "Not Admin";
		case 1: adminname = "Trial Moderator";
		case 2: adminname = "Moderator";
		case 3: adminname = "Admin";
		case 4: adminname = "Management";
		case 5: adminname = "Owner";
	}
	return adminname;
}

stock escstring(stri[])
{
	new escstr[200];
	mysql_real_escape_string(stri, escstr);
	return escstr;
}

stock IsPlayerNearVehicle(playerid, vehicleid, Float:distance)
{
    new m = GetVehicleModel(vehicleid);
    if(m == 0) return 0;
    new Float:x, Float:y, Float:z;
    GetVehiclePos(vehicleid, x, y, z);
    if(!IsPlayerInRangeOfPoint(playerid, distance, x, y, z)) return 0;
    return 1;
}

stock GetNearest_Player(playerid, Float:distance)
{
	new Float:xX, Float:yY, Float:zZ, retElement = -1;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
    	if((i == playerid) || (i == INVALID_PLAYER_ID)) continue;
        GetPlayerPos(i, xX, yY, zZ);
        new Float:odist = GetPlayerDistanceFromPoint(playerid, xX, yY, zZ);
        if (retElement == -1)
        {
            retElement = i;
            distance = odist;
        }
        else if (odist < distance)
        {
            retElement = i;
            distance = odist;
        }
    }
    return retElement;
}

stock PlayerName(playerid)
{
	GetPlayerName(playerid, pName, 24);
 	return pName;
}

stock GivePlayerValue(playerid, value, amount)
{
	new msg[64];
	switch(value)
	{
	    case XP:
		{
			pInfo[playerid][pXP] += amount;
   			SetProgressBarValue(playerXP[playerid], pInfo[playerid][pXP]);
			ShowProgressBarForPlayer(playerid, playerXP[playerid]);
			format(msg, sizeof(msg), "~w~+ ~r~%i xp!", amount);
            SendBoxMessage(playerid, msg);
			//SendClientMessage(playerid, -1, msg);
   		}

	    case LEVEL:
		{
			pInfo[playerid][pLevel] = amount;
			format(msg, sizeof(msg), "~w~+ ~r~Level up: %i", pInfo[playerid][pLevel]);
            SendBoxMessage(playerid, msg);
			//SendClientMessage(playerid, -1, msg);
		}

		case MONEY:
		{
			pInfo[playerid][zMoney] += amount;
	 		format(msg, sizeof(msg), "~w~+ ~y~%i zMoney", amount);
            SendBoxMessage(playerid, msg);
			 //GameTextForPlayer(playerid, msg, 2800, 5);
		}
	}
	return 1;
}

stock SendUpdatedViewMessage(playerid)
{
	new strxp[128];
	format(strxp, sizeof(strxp), "   ~w~ %i /~r~ %i XP~w~ | LEVEL:~p~ %i~w~ | Headshots:~p~ %i~w~ | Zombies Killed:~r~ %i~w~ | Players Killed:~r~ %i",
 	pInfo[playerid][pXP], GetPlayerNextLevelXP(playerid), pInfo[playerid][pLevel], pInfo[playerid][Headshots], pInfo[playerid][ZombiesKilled], pInfo[playerid][PlayersKilled]);
	PlayerTextDrawSetString(playerid, xpView[playerid], strxp);

 	new strmoney[128];
    format(strmoney, sizeof(strmoney), "%08d", pInfo[playerid][zMoney]);
    PlayerTextDrawSetString(playerid, playerMoney[playerid], strmoney);
	return 1;
}

stock SetProgressValue(playerid)
{
    playerXP[playerid] = CreateProgressBar(160.00, 439.00, 348.50, 3.20, 1266631167, 1000000.0);
	SetProgressBarValue(playerXP[playerid], pInfo[playerid][pXP]);
	ShowProgressBarForPlayer(playerid, playerXP[playerid]);
	return 1;
}

stock GetPlayerNextLevelXP(playerid)
{
	new playerNextXP;
	switch(pInfo[playerid][pLevel])
	{
	    case 0: playerNextXP = 200;
	    case 1: playerNextXP = 500;
	    case 2: playerNextXP = 1000;
	    case 3: playerNextXP = 1500;
	    case 4: playerNextXP = 2000;
	    case 5: playerNextXP = 2500;
	    case 6: playerNextXP = 3000;
	    case 7: playerNextXP = 3500;
	    case 8: playerNextXP = 4000;
	    case 9: playerNextXP = 4500;
	    case 10: playerNextXP = 5000;
	    case 11: playerNextXP = 5500;
	    case 12: playerNextXP = 6000;
	    case 13: playerNextXP = 6500;
	    case 14: playerNextXP = 7000;
	    case 15: playerNextXP = 7500;
	    case 16: playerNextXP = 8000;
	    case 17: playerNextXP = 8500;
	    case 18: playerNextXP = 9000;
	    case 19: playerNextXP = 9500;
	    case 20: playerNextXP = 10000;
	    case 21: playerNextXP = 15000;
	    case 22: playerNextXP = 20000;
	    case 23: playerNextXP = 25000;
	    case 24: playerNextXP = 30000;
	    case 25: playerNextXP = 35000;
	    case 26: playerNextXP = 40000;
	    case 27: playerNextXP = 45000;
	    case 28: playerNextXP = 50000;
	    case 29: playerNextXP = 100000;
	    case 30: playerNextXP = 200000;
	    case 31: playerNextXP = 500000;
	    case 32: playerNextXP = 1000000;
	}
	return playerNextXP;
}

stock CheckPlayerLevelXP(playerid)
{
	switch(pInfo[playerid][pLevel])
	{
	    case 0: if(pInfo[playerid][pXP] >= 200) { pInfo[playerid][pXP] = 201, GivePlayerValue(playerid, LEVEL, 1); }
	    case 1: if(pInfo[playerid][pXP] >= 500) { pInfo[playerid][pXP] = 501, GivePlayerValue(playerid, LEVEL, 2); }
	    case 2: if(pInfo[playerid][pXP] >= 1000) { pInfo[playerid][pXP] = 1001, GivePlayerValue(playerid, LEVEL, 3); }
	    case 3: if(pInfo[playerid][pXP] >= 1500) { pInfo[playerid][pXP] = 1501, GivePlayerValue(playerid, LEVEL, 4); }
	    case 4: if(pInfo[playerid][pXP] >= 2000) { pInfo[playerid][pXP] = 2001, GivePlayerValue(playerid, LEVEL, 5); }
	    case 5: if(pInfo[playerid][pXP] >= 2500) { pInfo[playerid][pXP] = 2501, GivePlayerValue(playerid, LEVEL, 6); }
	    case 6: if(pInfo[playerid][pXP] >= 3000) { pInfo[playerid][pXP] = 3001, GivePlayerValue(playerid, LEVEL, 7); }
	    case 7: if(pInfo[playerid][pXP] >= 3500) { pInfo[playerid][pXP] = 3501, GivePlayerValue(playerid, LEVEL, 8); }
	    case 8: if(pInfo[playerid][pXP] >= 4000) { pInfo[playerid][pXP] = 4001, GivePlayerValue(playerid, LEVEL, 9); }
	    case 9: if(pInfo[playerid][pXP] >= 4500) { pInfo[playerid][pXP] = 4501, GivePlayerValue(playerid, LEVEL, 10); }
	    case 10: if(pInfo[playerid][pXP] >= 5000) { pInfo[playerid][pXP] = 5001, GivePlayerValue(playerid, LEVEL, 11); }
	    case 11: if(pInfo[playerid][pXP] >= 5500) { pInfo[playerid][pXP] = 5501, GivePlayerValue(playerid, LEVEL, 12); }
	    case 12: if(pInfo[playerid][pXP] >= 6000) { pInfo[playerid][pXP] = 6001, GivePlayerValue(playerid, LEVEL, 13); }
	    case 13: if(pInfo[playerid][pXP] >= 6500) { pInfo[playerid][pXP] = 6501, GivePlayerValue(playerid, LEVEL, 14); }
	    case 14: if(pInfo[playerid][pXP] >= 7000) { pInfo[playerid][pXP] = 7001, GivePlayerValue(playerid, LEVEL, 15); }
	    case 15: if(pInfo[playerid][pXP] >= 7500) { pInfo[playerid][pXP] = 7501, GivePlayerValue(playerid, LEVEL, 16); }
		case 16: if(pInfo[playerid][pXP] >= 8000) { pInfo[playerid][pXP] = 8001, GivePlayerValue(playerid, LEVEL, 17); }
		case 17: if(pInfo[playerid][pXP] >= 8500) { pInfo[playerid][pXP] = 8501, GivePlayerValue(playerid, LEVEL, 18); }
		case 18: if(pInfo[playerid][pXP] >= 9000) { pInfo[playerid][pXP] = 9001, GivePlayerValue(playerid, LEVEL, 19); }
		case 19: if(pInfo[playerid][pXP] >= 9500) { pInfo[playerid][pXP] = 9501, GivePlayerValue(playerid, LEVEL, 20); }
		case 20: if(pInfo[playerid][pXP] >= 10000) { pInfo[playerid][pXP] = 10001, GivePlayerValue(playerid, LEVEL, 21); }
		case 21: if(pInfo[playerid][pXP] >= 15000) { pInfo[playerid][pXP] = 15001, GivePlayerValue(playerid, LEVEL, 22); }
		case 22: if(pInfo[playerid][pXP] >= 20000) { pInfo[playerid][pXP] = 20001, GivePlayerValue(playerid, LEVEL, 23); }
		case 23: if(pInfo[playerid][pXP] >= 25000) { pInfo[playerid][pXP] = 25001, GivePlayerValue(playerid, LEVEL, 24); }
		case 24: if(pInfo[playerid][pXP] >= 30000) { pInfo[playerid][pXP] = 30001, GivePlayerValue(playerid, LEVEL, 25); }
		case 25: if(pInfo[playerid][pXP] >= 35000) { pInfo[playerid][pXP] = 35001, GivePlayerValue(playerid, LEVEL, 26); }
		case 26: if(pInfo[playerid][pXP] >= 40000) { pInfo[playerid][pXP] = 40001, GivePlayerValue(playerid, LEVEL, 27); }
		case 27: if(pInfo[playerid][pXP] >= 45000) { pInfo[playerid][pXP] = 45001, GivePlayerValue(playerid, LEVEL, 28); }
		case 28: if(pInfo[playerid][pXP] >= 50000) { pInfo[playerid][pXP] = 50001, GivePlayerValue(playerid, LEVEL, 29); }
		case 29: if(pInfo[playerid][pXP] >= 100000) { pInfo[playerid][pXP] = 100001, GivePlayerValue(playerid, LEVEL, 30); }
		case 30: if(pInfo[playerid][pXP] >= 200000) { pInfo[playerid][pXP] = 200001, GivePlayerValue(playerid, LEVEL, 31); }
		case 31: if(pInfo[playerid][pXP] >= 500000) { pInfo[playerid][pXP] = 500001, GivePlayerValue(playerid, LEVEL, 32); }
		case 32: if(pInfo[playerid][pXP] >= 1000000) { pInfo[playerid][pXP] = 1000001, GivePlayerValue(playerid, LEVEL, 33); }
	}
	return 1;
}

stock RemoveBuildings(playerid)
{
	RemoveBuildingForPlayer(playerid, 1266, 1538.5234, -1609.8047, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 4229, 1597.9063, -1699.7500, 30.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 4230, 1597.9063, -1699.7500, 30.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 4206, 1479.5547, -1639.6094, 13.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1541.4453, -1713.3047, 14.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1709.6406, 13.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1541.2969, -1702.6016, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1693.3906, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1689.9844, 13.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1687.1016, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 646, 1545.5234, -1678.8438, 14.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 646, 1553.8672, -1677.7266, 16.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 646, 1553.8672, -1673.4609, 16.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 646, 1545.5625, -1672.2188, 14.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1664.6250, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1658.3438, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1661.0313, 13.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1541.4766, -1648.4531, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1642.0313, 13.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1260, 1538.5234, -1609.8047, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 3689, 2685.3828, -2366.0547, 19.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 3707, 2716.2344, -2452.5938, 20.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3707, 2720.3203, -2530.9141, 19.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 3690, 2685.3828, -2366.0547, 19.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 3710, 2788.1563, -2417.7891, 16.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3710, 2788.1563, -2455.8828, 16.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3710, 2788.1563, -2493.9844, 16.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3709, 2660.4766, -2429.2969, 17.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 3708, 2720.3203, -2530.9141, 19.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 3708, 2716.2344, -2452.5938, 20.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2771.0703, -2372.4453, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2789.2109, -2377.6250, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2774.7969, -2386.8516, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2771.0703, -2520.5469, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2774.7969, -2534.9531, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3746, 2814.2656, -2356.5703, 25.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 3746, 2814.2656, -2521.4922, 25.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 3758, 2748.0156, -2571.5938, 3.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 3770, 2795.8281, -2394.2422, 14.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3770, 2746.4063, -2453.4844, 14.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2592.4922, -2359.4219, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2626.2344, -2391.5234, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2674.5234, -2557.4922, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1306, 2669.9063, -2518.6641, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2674.2656, -2508.3047, 16.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2713.0625, -2508.3047, 16.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2672.5938, -2506.8594, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2680.8594, -2493.0781, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1635, 2704.3672, -2487.8672, 20.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 1306, 2742.2656, -2481.5156, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2696.0234, -2474.8594, 16.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2675.5703, -2466.8516, 16.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 5326, 2661.5156, -2465.1406, 20.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1306, 2669.9063, -2447.2891, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2696.0234, -2446.6250, 16.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3623, 2660.4766, -2429.2969, 17.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2686.7578, -2416.6250, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2672.5938, -2408.2500, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1306, 2742.2656, -2416.5234, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2639.1953, -2392.8203, 13.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2663.8359, -2392.8203, 13.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2637.1719, -2385.8672, 16.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 1306, 2669.9063, -2394.5078, 19.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2692.6797, -2387.4766, 16.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2708.4063, -2391.5234, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3753, 2748.0156, -2571.5938, 3.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2774.7969, -2534.9531, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2771.0703, -2520.5469, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2783.7813, -2501.8359, 14.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 3624, 2788.1563, -2493.9844, 16.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2783.7813, -2486.9609, 14.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2747.0078, -2480.2422, 13.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2783.7813, -2463.8203, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2773.3438, -2479.9688, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3624, 2788.1563, -2455.8828, 16.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3626, 2746.4063, -2453.4844, 14.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2783.7813, -2448.4766, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2773.3438, -2443.1719, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3577, 2744.5703, -2436.1875, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 3577, 2744.5703, -2427.3203, 13.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2783.7813, -2425.3516, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2774.7969, -2386.8516, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2771.0703, -2372.4453, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2783.7813, -2410.2109, 14.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3624, 2788.1563, -2417.7891, 16.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2789.2109, -2377.6250, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2802.4297, -2556.5234, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2791.9531, -2501.8359, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2797.5156, -2486.8281, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2791.9531, -2486.9609, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2791.9531, -2463.8203, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2797.5156, -2448.3438, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2791.9531, -2448.4766, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2791.9531, -2425.3516, 14.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2791.9531, -2410.2109, 14.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 3761, 2797.5156, -2410.0781, 14.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3626, 2795.8281, -2394.2422, 14.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3620, 2814.2656, -2521.4922, 25.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 3620, 2814.2656, -2356.5703, 25.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2762.7578, -2333.3828, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2804.2422, -2333.3828, 26.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3654, 2517.4766, -1644.6953, 15.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2511.5000, -1654.1563, 13.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2509.0156, -1652.1719, 13.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2509.1719, -1648.7031, 13.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, 2522.1016, -1665.6484, 15.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 645, 2518.6484, -1655.5234, 12.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, 2520.6016, -1652.5938, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2514.7344, -1654.1875, 13.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, 2524.4063, -1648.8516, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2517.4766, -1644.6953, 15.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 669, 2530.4766, -1636.7031, 12.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 17879, 2484.5313, -1667.6094, 21.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1236.2031, -826.3594, 1082.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 2124, 1254.9688, -825.2734, 1083.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 14388, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14389, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14390, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14417, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14418, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14419, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14420, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14421, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14422, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14423, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14424, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14425, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14426, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14427, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14428, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14429, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14430, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14431, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14484, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14485, 1255.0313, -812.4688, 1086.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14403, 1270.3594, -809.4922, 1084.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 14456, 1282.2500, -805.2266, 1093.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 2307, 1291.2188, -810.3672, 1088.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 2307, 1289.1875, -810.3672, 1088.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 2230, 1296.0781, -835.1875, 1084.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 14393, 1251.5234, -803.9297, 1085.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 14401, 1264.6016, -781.0078, 1083.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 14470, 1258.4141, -775.3047, 1089.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 2629, 1233.6641, -770.2578, 1083.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 2630, 1242.0625, -767.1953, 1083.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 2240, 1259.2031, -766.7891, 1083.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2240, 1252.8750, -766.7734, 1083.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2240, 1260.4609, -764.7266, 1083.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2627, 1226.5078, -764.1094, 1083.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 14488, 1233.8594, -763.5625, 1085.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 14486, 1233.9766, -763.3047, 1084.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 14487, 1234.0938, -763.3672, 1087.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 1985, 1243.5938, -759.6484, 1085.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1985, 1241.3047, -759.6406, 1085.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1985, 1240.7891, -756.4531, 1085.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 2631, 1226.6172, -754.9844, 1083.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1985, 1240.7891, -754.1719, 1085.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 947, 1234.0703, -753.5156, 1085.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 2292, 1268.7813, -796.3672, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1268.7891, -795.8828, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2104, 1273.2891, -795.0000, 1083.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1268.7891, -794.9063, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2296, 1277.2813, -794.6875, 1083.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1268.7891, -793.9219, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1268.7891, -792.9453, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1275.2266, -791.4766, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1274.2500, -791.4766, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2292, 1273.7656, -791.4766, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1278.1719, -791.4766, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1277.1875, -791.4766, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1276.2109, -791.4766, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2292, 1279.6484, -791.4688, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2292, 1268.7813, -791.4609, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1269.2656, -791.4609, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2291, 1270.2500, -791.4609, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2292, 1271.7266, -791.4609, 1083.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2227, 1273.5234, -784.9688, 1088.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 14387, 1269.7266, -781.2266, 1089.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 14400, 1280.3984, -777.1953, 1090.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 14469, 1275.2188, -777.1563, 1090.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 2240, 1267.4531, -764.7266, 1083.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2298, 1289.6172, -804.6250, 1088.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 14455, 1287.5234, -799.6953, 1090.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 14398, 1291.7344, -766.2578, 1088.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 14462, 1293.5703, -791.5703, 1090.8672, 0.25);
	return 1;
}

stock CreateServerObjects()
{
	// Gates Objects
	CreateGates(GATE_EDF1, 976, 2719.6999511719, -2508.5, 12.5, 0.0, 0.0, 87.994995117188, 2719.1999511719, -2517.0, 12.5, 15.0, 2.0);
	CreateGates(GATE_EDF2, 976, 2719.6999511719, -2409.8000488281, 12.5, 0.0, 0.0, 88, 2720.0, -2400.8000488281, 12.5, 15.0, 2.0);
	
	// Enviromental Objects
	CreateDynamicObject(1337,2491.3000500,-1686.8000500,13.2000000,0.0000000,0.0000000,0.0000000); //object(binnt07_la) (1)
	CreateDynamicObject(8229,2430.6999500,-1629.8000500,15.1000000,0.0000000,0.0000000,0.0000000); //object(vgsbikeschl02) (1)
	CreateDynamicObject(11474,2418.0000000,-1698.5000000,13.6000000,0.0000000,0.0000000,0.0000000); //object(des_swtfence2) (1)
	CreateDynamicObject(11474,2415.1001000,-1698.5000000,13.6000000,0.0000000,0.0000000,8.0000000); //object(des_swtfence2) (2)
	CreateDynamicObject(11474,2409.8999000,-1698.5999800,13.6000000,0.0000000,0.0000000,6.0000000); //object(des_swtfence2) (3)
	CreateDynamicObject(11474,2370.6001000,-1698.3000500,13.6000000,0.0000000,0.0000000,5.9970000); //object(des_swtfence2) (4)
	CreateDynamicObject(11474,2373.3999000,-1698.5000000,13.6000000,0.0000000,0.0000000,11.9940000); //object(des_swtfence2) (5)
	CreateDynamicObject(11474,2370.5000000,-1693.3000500,13.6000000,0.0000000,0.0000000,1.9940000); //object(des_swtfence2) (6)
	CreateDynamicObject(4100,2409.1001000,-1670.5000000,14.1000000,0.0000000,0.0000000,140.0000000); //object(meshfence1_lan) (1)
	CreateDynamicObject(4100,2540.6001000,-1712.3000500,14.4000000,0.0000000,0.0000000,48.0000000); //object(meshfence1_lan) (3)
	CreateDynamicObject(4100,2521.6999500,-1721.8000500,14.4000000,0.0000000,0.0000000,323.9990000); //object(meshfence1_lan) (4)
	CreateDynamicObject(4100,2534.3000500,-1628.1999500,18.6000000,0.0000000,0.0000000,320.0000000); //object(meshfence1_lan) (5)
	CreateDynamicObject(4100,2522.6001000,-1628.1999500,18.6000000,0.0000000,0.0000000,319.9990000); //object(meshfence1_lan) (6)
	CreateDynamicObject(4100,2509.0000000,-1628.0999800,18.1000000,0.0000000,0.0000000,319.9990000); //object(meshfence1_lan) (7)
	CreateDynamicObject(4100,2495.1999500,-1628.0000000,17.6000000,0.0000000,0.0000000,319.9990000); //object(meshfence1_lan) (8)
	CreateDynamicObject(4100,2482.3000500,-1627.9000200,17.1000000,0.0000000,0.0000000,317.9990000); //object(meshfence1_lan) (9)
	CreateDynamicObject(4100,2470.6999500,-1628.0999800,16.6000000,0.0000000,0.0000000,317.9940000); //object(meshfence1_lan) (10)
	CreateDynamicObject(4100,2457.1001000,-1628.1999500,15.7000000,0.0000000,0.0000000,321.9940000); //object(meshfence1_lan) (11)
	CreateDynamicObject(4100,2446.3000500,-1628.6999500,15.2000000,0.0000000,0.0000000,321.9940000); //object(meshfence1_lan) (12)
	CreateDynamicObject(8615,2526.1999500,-1669.4000200,16.9000000,0.0000000,0.0000000,178.0000000); //object(vgssstairs04_lvs) (1)
	CreateDynamicObject(4100,2416.5000000,-1677.1999500,14.1000000,0.0000000,0.0000000,51.9990000); //object(meshfence1_lan) (13)
	CreateDynamicObject(11474,2415.6001000,-1689.3000500,13.6000000,0.0000000,0.0000000,73.9980000); //object(des_swtfence2) (9)
	CreateDynamicObject(11474,2416.5000000,-1685.9000200,13.6000000,0.0000000,0.0000000,79.9930000); //object(des_swtfence2) (11)
	CreateDynamicObject(11474,2417.0000000,-1684.8000500,13.6000000,0.0000000,0.0000000,95.9930000); //object(des_swtfence2) (12)
	CreateDynamicObject(3279,2410.8999000,-1657.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (1)
	CreateDynamicObject(4100,2398.5000000,-1664.4000200,14.1000000,0.0000000,0.0000000,79.9990000); //object(meshfence1_lan) (16)
	CreateDynamicObject(4100,2398.8999000,-1652.5999800,14.2000000,0.0000000,0.0000000,21.9970000); //object(meshfence1_lan) (17)
	CreateDynamicObject(4100,2408.3999000,-1643.9000200,14.1000000,0.0000000,0.0000000,345.9940000); //object(meshfence1_lan) (18)
	CreateDynamicObject(3927,2389.5000000,-1659.0000000,15.0000000,0.0000000,0.0000000,270.0000000); //object(d_sign01) (1)
	CreateDynamicObject(967,2351.8000500,-1692.5999800,12.5000000,0.0000000,0.0000000,180.0000000); //object(bar_gatebox01) (1)
	CreateDynamicObject(967,2351.8999000,-1698.9000200,12.5000000,0.0000000,0.0000000,179.9950000); //object(bar_gatebox01) (2)
	CreateDynamicObject(4100,2540.8999000,-1681.0000000,18.9000000,0.0000000,0.0000000,52.0000000); //object(meshfence1_lan) (19)
	CreateDynamicObject(4100,2540.6999500,-1668.5999800,18.9000000,0.0000000,0.0000000,51.9980000); //object(meshfence1_lan) (20)
	CreateDynamicObject(4100,2484.8994100,-1708.7998000,14.2000000,0.0000000,0.0000000,323.9980000); //object(meshfence1_lan) (21)
	CreateDynamicObject(3279,2517.6992200,-1644.7998000,13.2000000,0.0000000,0.0000000,227.9950000); //object(a51_spottower) (2)
	CreateDynamicObject(1337,2508.2966300,-1583.2616000,30.5215800,0.0000000,0.0000000,0.0000000); //object(binnt07_la) (7)
	CreateDynamicObject(3864,2518.3999000,-1665.5000000,19.4000000,0.0000000,0.0000000,0.0000000); //object(ws_floodlight) (1)
	CreateDynamicObject(3864,2393.0000000,-1652.3000500,18.6000000,0.0000000,0.0000000,24.0000000); //object(ws_floodlight) (2)
	CreateDynamicObject(3864,2391.6001000,-1665.1999500,18.6000000,0.0000000,0.0000000,332.0000000); //object(ws_floodlight) (3)
	CreateDynamicObject(3864,2457.6999500,-1719.4000200,18.6000000,0.0000000,0.0000000,270.0000000); //object(ws_floodlight) (4)
	CreateDynamicObject(4100,2470.3999000,-1721.8000500,15.6000000,0.0000000,0.0000000,321.9980000); //object(meshfence1_lan) (21)
	CreateDynamicObject(4100,2457.0000000,-1722.1999500,15.6000000,0.0000000,0.0000000,319.9930000); //object(meshfence1_lan) (21)
	CreateDynamicObject(4100,2448.3999000,-1722.1999500,15.6000000,0.0000000,0.0000000,319.9880000); //object(meshfence1_lan) (21)
	CreateDynamicObject(4100,2442.1001000,-1715.0999800,15.6000000,0.0000000,0.0000000,43.9880000); //object(meshfence1_lan) (21)
	CreateDynamicObject(4100,2477.5000000,-1714.5999800,15.6000000,0.0000000,0.0000000,45.9930000); //object(meshfence1_lan) (21)
	CreateDynamicObject(987,1550.9000200,-1618.4000200,12.5000000,0.0000000,0.0000000,180.0000000); //object(elecfence_bar) (1)
	CreateDynamicObject(987,1538.9000200,-1618.1999500,12.5000000,0.0000000,0.0000000,89.9950000); //object(elecfence_bar) (2)
	CreateDynamicObject(987,1539.1999500,-1614.0000000,12.5000000,0.0000000,0.0000000,89.9940000); //object(elecfence_bar) (3)
	CreateDynamicObject(987,1539.4000200,-1602.0000000,12.5000000,0.0000000,0.0000000,359.9890000); //object(elecfence_bar) (4)
	CreateDynamicObject(987,1551.5000000,-1602.0000000,12.5000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (5)
	CreateDynamicObject(987,1562.9000200,-1602.0000000,12.5000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (6)
	CreateDynamicObject(987,1574.8000500,-1601.9000200,12.5000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (7)
	CreateDynamicObject(987,1586.8000500,-1601.9000200,12.5000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (8)
	CreateDynamicObject(987,1595.9000200,-1602.0000000,12.7000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (9)
	CreateDynamicObject(987,1608.4000200,-1601.9000200,12.7000000,0.0000000,0.0000000,269.9840000); //object(elecfence_bar) (10)
	CreateDynamicObject(987,1608.4000200,-1613.5000000,12.7000000,0.0000000,0.0000000,269.9780000); //object(elecfence_bar) (11)
	CreateDynamicObject(987,1608.5000000,-1625.3000500,12.7000000,0.0000000,0.0000000,269.9780000); //object(elecfence_bar) (12)
	CreateDynamicObject(987,1608.5999800,-1637.6999500,12.7000000,0.0000000,0.0000000,183.9780000); //object(elecfence_bar) (13)
	CreateDynamicObject(987,1550.3000500,-1634.1999500,12.5000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (14)
	CreateDynamicObject(987,1538.5000000,-1634.1999500,12.5000000,0.0000000,0.0000000,269.9950000); //object(elecfence_bar) (15)
	CreateDynamicObject(987,1538.4000200,-1645.8000500,12.5000000,0.0000000,0.0000000,269.9890000); //object(elecfence_bar) (16)
	CreateDynamicObject(987,1538.1999500,-1657.6999500,12.5000000,0.0000000,0.0000000,269.9890000); //object(elecfence_bar) (17)
	CreateDynamicObject(987,1538.0000000,-1669.0999800,12.5000000,0.0000000,0.0000000,359.9890000); //object(elecfence_bar) (18)
	CreateDynamicObject(987,1550.0000000,-1669.3000500,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (19)
	CreateDynamicObject(987,1539.0999800,-1623.0999800,12.4000000,0.0000000,0.0000000,89.9950000); //object(elecfence_bar) (20)
	CreateDynamicObject(987,1538.9000200,-1631.1999500,12.4000000,0.0000000,0.0000000,267.9950000); //object(elecfence_bar) (21)
	CreateDynamicObject(8613,1582.3000500,-1660.0000000,23.3000000,0.0000000,0.0000000,90.0000000); //object(vgssstairs03_lvs) (1)
	CreateDynamicObject(1337,1597.5986300,-1637.8261700,13.5476900,0.0000000,0.0000000,0.0000000); //object(binnt07_la) (2)
	CreateDynamicObject(5130,1599.5000000,-1632.0000000,15.4000000,0.0000000,0.0000000,44.0000000); //object(imcompstrs02) (1)
	CreateDynamicObject(987,1602.3000500,-1638.1999500,16.5000000,0.0000000,0.0000000,269.9770000); //object(elecfence_bar) (22)
	CreateDynamicObject(987,1602.1999500,-1650.1999500,16.5000000,0.0000000,0.0000000,269.9730000); //object(elecfence_bar) (23)
	CreateDynamicObject(987,1602.3000500,-1661.8000500,16.5000000,0.0000000,0.0000000,269.9730000); //object(elecfence_bar) (24)
	CreateDynamicObject(987,1602.3000500,-1673.6999500,16.5000000,0.0000000,0.0000000,269.9730000); //object(elecfence_bar) (25)
	CreateDynamicObject(987,1602.4000200,-1685.4000200,16.5000000,0.0000000,0.0000000,269.9730000); //object(elecfence_bar) (26)
	CreateDynamicObject(987,1602.3000500,-1697.3000500,16.5000000,0.0000000,0.0000000,269.9730000); //object(elecfence_bar) (27)
	CreateDynamicObject(987,1602.3000500,-1701.5000000,16.5000000,0.0000000,0.0000000,271.9730000); //object(elecfence_bar) (28)
	CreateDynamicObject(987,1602.0999800,-1712.9000200,16.5000000,0.0000000,0.0000000,179.9720000); //object(elecfence_bar) (29)
	CreateDynamicObject(987,1591.5999800,-1713.1999500,16.5000000,0.0000000,0.0000000,179.9670000); //object(elecfence_bar) (30)
	CreateDynamicObject(987,1579.8000500,-1712.8000500,16.5000000,0.0000000,0.0000000,179.9670000); //object(elecfence_bar) (31)
	CreateDynamicObject(987,1597.0000000,-1638.9000200,16.5000000,0.0000000,0.0000000,179.9730000); //object(elecfence_bar) (32)
	CreateDynamicObject(987,1585.1999500,-1638.5999800,16.5000000,0.0000000,0.0000000,179.9730000); //object(elecfence_bar) (33)
	CreateDynamicObject(987,1576.3994100,-1638.2998000,26.0000000,0.0000000,0.0000000,179.9730000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1564.5000000,-1638.0999800,26.0000000,0.0000000,0.0000000,179.9730000); //object(elecfence_bar) (35)
	CreateDynamicObject(987,1555.9000200,-1638.1999500,26.0000000,0.0000000,0.0000000,179.9730000); //object(elecfence_bar) (36)
	CreateDynamicObject(987,1543.6999500,-1638.0000000,26.0000000,0.0000000,0.0000000,269.9730000); //object(elecfence_bar) (37)
	CreateDynamicObject(987,1543.6999500,-1649.8000500,26.0000000,0.0000000,0.0000000,359.9670000); //object(elecfence_bar) (38)
	CreateDynamicObject(987,1554.4000200,-1650.1999500,26.0000000,0.0000000,0.0000000,271.9670000); //object(elecfence_bar) (39)
	CreateDynamicObject(987,1554.5000000,-1661.6999500,26.0000000,0.0000000,0.0000000,297.9670000); //object(elecfence_bar) (40)
	CreateDynamicObject(987,1576.3000500,-1650.0000000,26.0000000,0.0000000,0.0000000,89.9730000); //object(elecfence_bar) (41)
	CreateDynamicObject(987,1576.0000000,-1661.6999500,26.0000000,0.0000000,0.0000000,269.9670000); //object(elecfence_bar) (42)
	CreateDynamicObject(987,1576.0000000,-1673.4000200,26.0000000,0.0000000,0.0000000,269.9620000); //object(elecfence_bar) (43)
	CreateDynamicObject(987,1576.1999500,-1685.1999500,26.0000000,0.0000000,0.0000000,269.9620000); //object(elecfence_bar) (44)
	CreateDynamicObject(987,1576.3000500,-1697.0999800,26.0000000,0.0000000,0.0000000,269.9620000); //object(elecfence_bar) (45)
	CreateDynamicObject(987,1576.3000500,-1701.5000000,26.0000000,0.0000000,0.0000000,269.9620000); //object(elecfence_bar) (46)
	CreateDynamicObject(987,1575.9000200,-1712.8000500,26.0000000,0.0000000,0.0000000,179.9620000); //object(elecfence_bar) (47)
	CreateDynamicObject(987,1564.0999800,-1712.6999500,26.0000000,0.0000000,0.0000000,179.9620000); //object(elecfence_bar) (48)
	CreateDynamicObject(987,1556.0000000,-1712.5000000,26.0000000,0.0000000,0.0000000,179.9620000); //object(elecfence_bar) (49)
	CreateDynamicObject(987,1544.6999500,-1713.1999500,26.0000000,0.0000000,0.0000000,89.9620000); //object(elecfence_bar) (50)
	CreateDynamicObject(987,1544.5999800,-1701.8000500,26.0000000,0.0000000,0.0000000,359.9560000); //object(elecfence_bar) (51)
	CreateDynamicObject(987,1555.9000200,-1701.9000200,26.0000000,0.0000000,0.0000000,87.9560000); //object(elecfence_bar) (52)
	CreateDynamicObject(987,1555.9000200,-1690.0000000,26.0000000,0.0000000,0.0000000,63.9510000); //object(elecfence_bar) (53)
	CreateDynamicObject(987,1549.3000500,-1682.0999800,12.5000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (54)
	CreateDynamicObject(987,1538.4000200,-1681.9000200,12.5000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (55)
	CreateDynamicObject(987,1538.5000000,-1694.0000000,12.5000000,0.0000000,0.0000000,89.9840000); //object(elecfence_bar) (56)
	CreateDynamicObject(987,1538.0999800,-1705.5999800,12.5000000,0.0000000,0.0000000,89.9840000); //object(elecfence_bar) (57)
	CreateDynamicObject(987,1537.9000200,-1717.0000000,12.5000000,0.0000000,0.0000000,89.9840000); //object(elecfence_bar) (58)
	CreateDynamicObject(987,1549.8000500,-1717.0999800,12.5000000,0.0000000,0.0000000,179.9840000); //object(elecfence_bar) (59)
	CreateDynamicObject(987,1561.0999800,-1713.5000000,12.5000000,0.0000000,0.0000000,199.9840000); //object(elecfence_bar) (60)
	CreateDynamicObject(987,1588.0999800,-1732.5000000,27.9000000,0.0000000,0.0000000,95.9730000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1587.0000000,-1720.8000500,28.0000000,0.0000000,0.0000000,95.9710000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1585.9000200,-1709.4000200,28.0000000,0.0000000,0.0000000,93.9710000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1585.0999800,-1698.0999800,28.0000000,0.0000000,0.0000000,89.9710000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1585.0999800,-1686.5999800,28.0000000,0.0000000,0.0000000,89.9670000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1585.0000000,-1674.5999800,27.8000000,0.0000000,0.0000000,89.9670000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1584.9000200,-1662.4000200,27.8000000,0.0000000,0.0000000,91.9670000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1584.5000000,-1650.5999800,27.8000000,0.0000000,0.0000000,91.9670000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1584.5999800,-1643.6999500,27.8000000,0.0000000,0.0000000,91.9670000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1584.0999800,-1631.8000500,27.8000000,0.0000000,0.0000000,121.9670000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1578.1999500,-1621.4000200,27.8000000,0.0000000,0.0000000,117.9650000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1572.5999800,-1611.0999800,27.8000000,0.0000000,0.0000000,119.9600000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1566.6999500,-1601.0000000,27.8000000,0.0000000,0.0000000,119.9600000); //object(elecfence_bar) (34)
	CreateDynamicObject(987,1558.8000500,-1585.4000200,27.8000000,0.0000000,0.0000000,293.9600000); //object(elecfence_bar) (34)
	CreateDynamicObject(3279,1548.5000000,-1643.4000200,27.4000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (3)
	CreateDynamicObject(3279,1549.0999800,-1706.4000200,27.4000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (4)
	CreateDynamicObject(3928,1565.3613300,-1655.4462900,27.2262600,0.0000000,0.0000000,0.0000000); //object(helipad) (1)
	CreateDynamicObject(3928,1564.8000500,-1653.8000500,28.0000000,0.0000000,0.0000000,270.0000000); //object(helipad) (2)
	CreateDynamicObject(3928,1566.9000200,-1696.5000000,28.0000000,0.0000000,0.0000000,270.0000000); //object(helipad) (3)
	CreateDynamicObject(987,2719.1999500,-2499.6001000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (61)
	CreateDynamicObject(987,2719.1001000,-2488.5000000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (62)
	CreateDynamicObject(987,2719.1001000,-2476.6001000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (64)
	CreateDynamicObject(987,2719.1001000,-2464.6001000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (65)
	CreateDynamicObject(987,2719.0000000,-2453.1001000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (66)
	CreateDynamicObject(987,2719.0000000,-2443.8000500,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (67)
	CreateDynamicObject(987,2719.1001000,-2433.1999500,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (68)
	CreateDynamicObject(987,2719.3999000,-2410.1001000,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (69)
	CreateDynamicObject(987,2719.1001000,-2401.0000000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (70)
	CreateDynamicObject(987,2718.8999000,-2389.1001000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (71)
	CreateDynamicObject(987,2718.8999000,-2377.6001000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (73)
	CreateDynamicObject(987,2719.0000000,-2353.6999500,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (75)
	CreateDynamicObject(987,2718.8994100,-2341.7998000,12.4000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2718.8999000,-2330.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (77)
	CreateDynamicObject(987,2729.3999000,-2330.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (78)
	CreateDynamicObject(987,2740.8999000,-2330.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (79)
	CreateDynamicObject(987,2752.6001000,-2330.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (80)
	CreateDynamicObject(987,2764.1001000,-2330.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (81)
	CreateDynamicObject(987,2775.6001000,-2330.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (82)
	CreateDynamicObject(987,2787.0000000,-2330.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (83)
	CreateDynamicObject(987,2797.8999000,-2330.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (84)
	CreateDynamicObject(987,2809.5000000,-2330.5000000,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (85)
	CreateDynamicObject(987,2809.3999000,-2342.3000500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (86)
	CreateDynamicObject(987,2809.3000500,-2354.6001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (87)
	CreateDynamicObject(987,2809.1999500,-2365.1999500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (88)
	CreateDynamicObject(987,2809.1999500,-2377.1999500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (89)
	CreateDynamicObject(987,2809.1999500,-2389.1999500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (90)
	CreateDynamicObject(987,2809.1999500,-2399.8999000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (91)
	CreateDynamicObject(987,2809.1999500,-2411.6001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (92)
	CreateDynamicObject(987,2809.1001000,-2422.8000500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (93)
	CreateDynamicObject(987,2809.0000000,-2433.5000000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (94)
	CreateDynamicObject(987,2809.0000000,-2446.1001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (95)
	CreateDynamicObject(987,2808.8999000,-2457.6001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (96)
	CreateDynamicObject(987,2809.0000000,-2469.5000000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (97)
	CreateDynamicObject(987,2809.1001000,-2480.1001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (98)
	CreateDynamicObject(987,2809.1999500,-2491.6001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (99)
	CreateDynamicObject(987,2809.3000500,-2503.1001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (100)
	CreateDynamicObject(987,2808.8999000,-2514.1001000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (101)
	CreateDynamicObject(987,2808.8000500,-2525.1999500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (102)
	CreateDynamicObject(987,2808.8999000,-2536.0000000,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (103)
	CreateDynamicObject(987,2808.6999500,-2547.3000500,12.6000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (104)
	CreateDynamicObject(987,2808.8999000,-2564.1999500,12.6000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (105)
	CreateDynamicObject(987,2796.8000500,-2564.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (106)
	CreateDynamicObject(987,2784.8999000,-2564.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (107)
	CreateDynamicObject(987,2773.3999000,-2564.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (108)
	CreateDynamicObject(987,2761.5000000,-2564.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (109)
	CreateDynamicObject(987,2749.6001000,-2564.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (110)
	CreateDynamicObject(987,2737.6999500,-2564.3999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (111)
	CreateDynamicObject(987,2728.6001000,-2564.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (112)
	CreateDynamicObject(987,2719.5000000,-2564.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (113)
	CreateDynamicObject(987,2719.6001000,-2508.6999500,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (115)
	CreateDynamicObject(987,2719.6001000,-2520.1999500,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (116)
	CreateDynamicObject(987,2719.6001000,-2531.6999500,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (117)
	CreateDynamicObject(987,2719.5000000,-2542.6999500,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (118)
	CreateDynamicObject(987,2719.8000500,-2552.3000500,12.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (119)
	CreateDynamicObject(987,2707.5000000,-2330.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2686.1999500,-2330.3999000,12.6000000,0.0000000,0.0000000,180.0000000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2674.3000500,-2330.5000000,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2662.5000000,-2330.5000000,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2650.6001000,-2330.3999000,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2638.5000000,-2330.3000500,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2626.5000000,-2330.3999000,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2614.8000500,-2330.3999000,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2602.8999000,-2330.3000500,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2591.0000000,-2330.1999500,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2579.1999500,-2330.1999500,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2567.3000500,-2330.3999000,12.6000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2555.3994100,-2330.5000000,12.6000000,0.0000000,0.0000000,291.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2559.6999500,-2341.8000500,12.6000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2568.0000000,-2349.8000500,12.6000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2576.6001000,-2358.1999500,12.6000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2585.1001000,-2366.5000000,12.6000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2593.6001000,-2374.8999000,12.6000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2602.1999500,-2383.1001000,12.6000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2610.6999500,-2391.6999500,12.6000000,0.0000000,0.0000000,347.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2622.0000000,-2394.3000500,12.6000000,0.0000000,0.0000000,359.9860000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2633.6999500,-2394.3999000,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2645.3000500,-2394.6999500,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2656.8999000,-2394.6001000,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2669.0000000,-2394.8999000,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2680.3999000,-2394.8999000,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2691.5000000,-2394.8000500,12.6000000,0.0000000,0.0000000,359.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2703.1001000,-2394.6999500,12.6000000,0.0000000,0.0000000,337.9840000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2707.8999000,-2396.6999500,12.6000000,0.0000000,0.0000000,339.9830000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2676.1999500,-2316.8999000,2.4000000,0.0000000,0.0000000,270.0000000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2688.1999500,-2316.8999000,2.4000000,0.0000000,0.0000000,180.0000000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2699.7998000,-2317.1992200,2.4000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2712.1001000,-2317.1999500,2.4000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2723.6001000,-2317.0000000,2.4000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2727.3999000,-2316.8999000,2.4000000,0.0000000,0.0000000,179.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2727.6001000,-2328.8000500,2.4000000,0.0000000,0.0000000,89.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(3279,2728.5000000,-2413.5996100,12.6000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (5)
	CreateDynamicObject(3279,2728.3999000,-2396.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (6)
	CreateDynamicObject(3279,2728.8000500,-2494.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (7)
	CreateDynamicObject(3279,2728.3000500,-2511.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower) (8)
	CreateDynamicObject(987,2541.6999500,-2325.1999500,22.2000000,0.0000000,0.0000000,315.9950000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2549.3000500,-2333.1001000,20.3000000,0.0000000,0.0000000,313.9940000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2557.5000000,-2341.3000500,18.9000000,0.0000000,0.0000000,313.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2563.6999500,-2347.6001000,17.9000000,0.0000000,0.0000000,313.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2566.8000500,-2351.1001000,16.0000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2574.5000000,-2358.8999000,14.6000000,0.0000000,0.0000000,313.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2590.3999000,-2374.8999000,14.1000000,0.0000000,0.0000000,135.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(987,2595.0000000,-2379.1999500,14.1000000,0.0000000,0.0000000,135.9890000); //object(elecfence_bar) (76)
	CreateDynamicObject(3279,2616.5000000,-2387.5000000,12.6000000,0.0000000,0.0000000,76.0000000); //object(a51_spottower) (9)
	CreateDynamicObject(3795,2625.0000000,-2390.6999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(missile_04_sfxr) (1)
	CreateDynamicObject(3795,2628.8000500,-2391.3999000,13.0000000,0.0000000,0.0000000,0.0000000); //object(missile_04_sfxr) (2)
	CreateDynamicObject(2035,2728.8999000,-2392.6001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_m16) (1)
	CreateDynamicObject(2035,2728.1001000,-2392.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_m16) (2)
	CreateDynamicObject(2035,2727.5000000,-2392.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_m16) (3)
	CreateDynamicObject(2035,2728.3999000,-2392.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_m16) (4)
	CreateDynamicObject(2035,2727.1001000,-2392.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_m16) (5)
	CreateDynamicObject(2035,2725.8999000,-2391.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_m16) (6)
	CreateDynamicObject(2060,2705.1001000,-2390.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_sandbag) (1)
	CreateDynamicObject(13629,2709.1001000,-2453.8999000,25.3000000,0.0000000,0.0000000,0.0000000); //object(8screen01) (1)
	CreateDynamicObject(5138,2822.6999500,-2454.0000000,20.9000000,0.0000000,0.0000000,270.0000000); //object(snpdoldwrhs2_las2) (1)
	CreateDynamicObject(944,2787.1001000,-2414.8999000,13.5000000,0.0000000,0.0000000,0.0000000); //object(packing_carates04) (1)
	CreateDynamicObject(944,2787.8000500,-2416.8999000,13.5000000,0.0000000,0.0000000,0.0000000); //object(packing_carates04) (2)
	CreateDynamicObject(944,2787.6001000,-2418.3000500,13.5000000,0.0000000,0.0000000,0.0000000); //object(packing_carates04) (3)
	CreateDynamicObject(944,2787.3999000,-2419.6999500,13.5000000,0.0000000,0.0000000,0.0000000); //object(packing_carates04) (4)
	CreateDynamicObject(944,2783.3999000,-2417.3000500,13.5000000,0.0000000,0.0000000,60.0000000); //object(packing_carates04) (5)
	CreateDynamicObject(3630,2795.8000500,-2334.3999000,14.1000000,0.0000000,0.0000000,0.0000000); //object(crdboxes2_las) (1)
	CreateDynamicObject(3630,2785.1999500,-2334.5000000,14.1000000,0.0000000,0.0000000,0.0000000); //object(crdboxes2_las) (2)
	CreateDynamicObject(3630,2790.6001000,-2340.1001000,14.1000000,0.0000000,0.0000000,0.0000000); //object(crdboxes2_las) (3)
	CreateDynamicObject(3633,2723.6999500,-2333.1999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(imoildrum4_las) (1)
	CreateDynamicObject(3633,2721.8999000,-2333.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(imoildrum4_las) (2)
	CreateDynamicObject(3633,2723.8999000,-2335.1001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(imoildrum4_las) (3)
	CreateDynamicObject(3722,2802.0000000,-2357.6001000,17.0000000,0.0000000,0.0000000,0.0000000); //object(laxrf_scrapbox) (1)
	CreateDynamicObject(3796,2722.6001000,-2371.6999500,12.6000000,0.0000000,0.0000000,182.0000000); //object(acbox1_sfs) (1)
	CreateDynamicObject(3798,2722.0000000,-2351.6001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (1)
	CreateDynamicObject(3798,2722.6001000,-2349.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (2)
	CreateDynamicObject(3798,2722.1999500,-2346.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (3)
	CreateDynamicObject(3798,2721.8000500,-2343.8999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (4)
	CreateDynamicObject(3798,2725.1999500,-2344.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (5)
	CreateDynamicObject(3798,2725.6999500,-2347.6001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (6)
	CreateDynamicObject(3798,2726.1001000,-2350.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (7)
	CreateDynamicObject(3798,2729.3000500,-2345.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (8)
	CreateDynamicObject(5132,2764.8999000,-2338.8999000,14.3000000,0.0000000,0.0000000,270.0000000); //object(las2dkwar107) (1)
	CreateDynamicObject(5262,2800.0000000,-2375.6999500,15.6000000,0.0000000,0.0000000,0.0000000); //object(las2dkwar04) (1)
	CreateDynamicObject(7040,2781.8000500,-2486.3000500,16.1000000,0.0000000,0.0000000,0.0000000); //object(vgnplcehldbox01) (1)
	CreateDynamicObject(3798,2723.8999000,-2467.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (9)
	CreateDynamicObject(3798,2723.0000000,-2464.3999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (10)
	CreateDynamicObject(3798,2722.1001000,-2461.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (11)
	CreateDynamicObject(3798,2726.8999000,-2462.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (12)
	CreateDynamicObject(3798,2727.8000500,-2465.3999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (13)
	CreateDynamicObject(3798,2726.1001000,-2459.8999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (14)
	CreateDynamicObject(3798,2723.5000000,-2456.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(acbox3_sfs) (15)
	CreateDynamicObject(3666,2665.8999000,-2371.1001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (1)
	CreateDynamicObject(3666,2667.1999500,-2350.1999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (2)
	CreateDynamicObject(3666,2645.8999000,-2350.3999000,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (3)
	CreateDynamicObject(3666,2624.1999500,-2350.5000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (4)
	CreateDynamicObject(3666,2644.3999000,-2370.3000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (5)
	CreateDynamicObject(3666,2624.3000500,-2369.6001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (6)
	CreateDynamicObject(3666,2606.0000000,-2350.1999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (7)
	CreateDynamicObject(3666,2604.8999000,-2368.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(airuntest_las) (8)
	CreateDynamicObject(11474,2414.1999500,-1692.1999500,13.6000000,0.0000000,0.0000000,57.9930000); //object(des_swtfence2) (9)
	CreateDynamicObject(3041,2726.1999500,-2447.8000500,13.1000000,0.0000000,0.0000000,274.0000000); //object(ct_table) (1)
	CreateDynamicObject(4504,77.7000000,-1534.0999800,6.7000000,0.0000000,0.0000000,0.0000000); //object(cuntw_roadblockld) (1)
	CreateDynamicObject(987,36.7000000,-1517.4000200,4.4000000,0.0000000,0.0000000,258.0000000); //object(elecfence_bar) (63)
	CreateDynamicObject(987,34.3000000,-1528.6999500,4.4000000,0.0000000,0.0000000,273.9950000); //object(elecfence_bar) (72)
	CreateDynamicObject(987,36.0000000,-1543.0000000,4.4000000,0.0000000,0.0000000,97.9940000); //object(elecfence_bar) (74)
	CreateDynamicObject(987,600.5999800,-1203.6999500,17.4000000,0.0000000,0.0000000,20.0000000); //object(elecfence_bar) (114)
	CreateDynamicObject(987,610.0000000,-1200.6999500,17.4000000,0.0000000,0.0000000,19.9950000); //object(elecfence_bar) (120)
	CreateDynamicObject(987,619.7999900,-1196.8000500,17.4000000,0.0000000,0.0000000,21.9950000); //object(elecfence_bar) (121)
	CreateDynamicObject(987,630.2999900,-1192.6999500,17.4000000,0.0000000,0.0000000,27.9950000); //object(elecfence_bar) (122)
	CreateDynamicObject(987,678.5999800,-819.7000100,40.0000000,0.0000000,0.0000000,6.0000000); //object(elecfence_bar) (123)
	CreateDynamicObject(987,689.5999800,-818.5000000,40.0000000,0.0000000,0.0000000,7.9990000); //object(elecfence_bar) (124)
	CreateDynamicObject(987,701.0000000,-816.9000200,40.0000000,0.0000000,0.0000000,7.9980000); //object(elecfence_bar) (125)
	CreateDynamicObject(987,712.4000200,-815.2999900,40.0000000,0.0000000,0.0000000,7.9980000); //object(elecfence_bar) (126)
	CreateDynamicObject(987,723.7999900,-814.2000100,40.0000000,0.0000000,0.0000000,7.9980000); //object(elecfence_bar) (127)
	CreateDynamicObject(987,2826.8000500,-736.5999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (128)
	CreateDynamicObject(987,2837.6001000,-736.5000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (129)
	CreateDynamicObject(987,2820.1999500,-736.2999900,13.2000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (130)
	CreateDynamicObject(987,2815.3999000,-736.5000000,18.0000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (131)
	CreateDynamicObject(987,2802.5000000,-736.9000200,28.5000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (132)
	CreateDynamicObject(987,2812.8000500,-736.5000000,21.3000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (133)
	CreateDynamicObject(987,2809.3999000,-736.7000100,24.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (134)
	CreateDynamicObject(987,2848.6999500,-736.5000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (135)
	CreateDynamicObject(987,2859.1999500,-736.4000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (136)
	CreateDynamicObject(987,2872.1001000,-736.4000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (137)
	CreateDynamicObject(987,2884.0000000,-736.4000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (138)
	CreateDynamicObject(987,2894.6001000,-736.5000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (139)
	CreateDynamicObject(987,2905.1999500,-736.5999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (140)
	CreateDynamicObject(987,2916.6999500,-736.0999800,8.5000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (141)
	CreateDynamicObject(987,2922.5000000,-735.4000200,5.6000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (142)
	CreateDynamicObject(987,2931.5000000,-736.4000200,2.7000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (143)
	CreateDynamicObject(987,2939.6001000,-737.2999900,-1.1000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (144)
	CreateDynamicObject(987,2939.5996100,-737.2998000,-1.1000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (145)
	CreateDynamicObject(987,2184.3000500,-700.7000100,47.0000000,0.0000000,0.0000000,52.0000000); //object(elecfence_bar) (146)
	CreateDynamicObject(987,611.0999800,-866.0999800,29.6000000,0.0000000,0.0000000,16.0000000); //object(elecfence_bar) (147)
	CreateDynamicObject(987,622.4000200,-863.9000200,29.6000000,0.0000000,0.0000000,15.9960000); //object(elecfence_bar) (148)
	CreateDynamicObject(987,89.4000000,-1026.6999500,20.8000000,0.0000000,0.0000000,90.0000000); //object(elecfence_bar) (149)
	CreateDynamicObject(987,2794.8999000,-736.4000200,32.8000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (150)
	CreateDynamicObject(987,2791.0000000,-736.7000100,37.1000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (151)
	CreateDynamicObject(987,2787.6999500,-736.7999900,41.4000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (152)
	CreateDynamicObject(987,2785.5000000,-736.9000200,45.7000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (153)
	CreateDynamicObject(987,2778.8000500,-736.7999900,50.5000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (154)
	CreateDynamicObject(987,2769.6999500,-736.7000100,53.8000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (155)
	CreateDynamicObject(987,2758.6001000,-736.7999900,56.2000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar) (156)
	CreateDynamicObject(987,2748.1999500,-735.5999800,56.2000000,0.0000000,0.0000000,354.0000000); //object(elecfence_bar) (157)
	CreateDynamicObject(987,2738.6999500,-734.5000000,59.5000000,0.0000000,0.0000000,353.9960000); //object(elecfence_bar) (158)
	CreateDynamicObject(987,2733.5000000,-733.9000200,64.8000000,0.0000000,0.0000000,353.9960000); //object(elecfence_bar) (159)
	CreateDynamicObject(987,2731.1001000,-733.7999900,70.1000000,0.0000000,0.0000000,353.9960000); //object(elecfence_bar) (160)
	CreateDynamicObject(987,2727.3000500,-733.7000100,74.4000000,0.0000000,0.0000000,353.9960000); //object(elecfence_bar) (161)
	CreateDynamicObject(987,2719.1999500,-733.5000000,77.7000000,0.0000000,0.0000000,353.9960000); //object(elecfence_bar) (162)
	CreateDynamicObject(987,2709.1999500,-726.9000200,77.7000000,0.0000000,0.0000000,327.9960000); //object(elecfence_bar) (163)
	CreateDynamicObject(987,2699.0000000,-720.5999800,77.7000000,0.0000000,0.0000000,327.9910000); //object(elecfence_bar) (164)
	CreateDynamicObject(987,2690.6001000,-712.5999800,81.0000000,0.0000000,0.0000000,315.9910000); //object(elecfence_bar) (165)
	CreateDynamicObject(987,2685.8000500,-707.9000200,84.8000000,0.0000000,0.0000000,315.9890000); //object(elecfence_bar) (166)
	CreateDynamicObject(987,2678.3999000,-702.5000000,87.7000000,0.0000000,0.0000000,321.9890000); //object(elecfence_bar) (167)
	CreateDynamicObject(987,2671.8999000,-696.5999800,90.6000000,0.0000000,0.0000000,319.9890000); //object(elecfence_bar) (168)
	CreateDynamicObject(987,2664.8999000,-690.5999800,95.4000000,0.0000000,0.0000000,319.9880000); //object(elecfence_bar) (169)
	CreateDynamicObject(987,2658.1001000,-684.9000200,98.7000000,0.0000000,0.0000000,319.9880000); //object(elecfence_bar) (170)
	CreateDynamicObject(987,2651.6999500,-681.7000100,100.6000000,0.0000000,0.0000000,331.9880000); //object(elecfence_bar) (171)
	CreateDynamicObject(987,2647.3999000,-679.2999900,104.9000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (172)
	CreateDynamicObject(987,2642.6999500,-676.5000000,109.2000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (173)
	CreateDynamicObject(987,2637.3999000,-673.9000200,114.0000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (174)
	CreateDynamicObject(987,2632.8000500,-671.5999800,118.3000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (175)
	CreateDynamicObject(987,2623.8000500,-667.0000000,122.1000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (176)
	CreateDynamicObject(987,2618.3999000,-664.2000100,125.9000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (177)
	CreateDynamicObject(987,2610.6999500,-660.5999800,129.2000000,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (178)
	CreateDynamicObject(987,2601.8000500,-655.4000200,131.6000100,0.0000000,0.0000000,331.9850000); //object(elecfence_bar) (179)
	CreateDynamicObject(987,2592.1001000,-653.2000100,133.0000000,0.0000000,0.0000000,347.9850000); //object(elecfence_bar) (180)
	CreateDynamicObject(987,2582.0000000,-650.7000100,133.0000000,0.0000000,0.0000000,347.9810000); //object(elecfence_bar) (181)
	CreateDynamicObject(987,2571.0000000,-647.7000100,135.3999900,0.0000000,0.0000000,347.9810000); //object(elecfence_bar) (182)
	CreateDynamicObject(987,2559.8999000,-646.9000200,135.3999900,0.0000000,0.0000000,355.9810000); //object(elecfence_bar) (183)
	CreateDynamicObject(987,2548.3999000,-645.7999900,133.5000000,0.0000000,0.0000000,355.9790000); //object(elecfence_bar) (184)
	CreateDynamicObject(987,2538.6001000,-647.2999900,129.7000000,0.0000000,0.0000000,7.9790000); //object(elecfence_bar) (185)
	CreateDynamicObject(987,2533.3000500,-648.2000100,125.4000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (186)
	CreateDynamicObject(987,2526.6001000,-649.0000000,121.6000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (187)
	CreateDynamicObject(987,2518.6001000,-649.5999800,119.2000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (188)
	CreateDynamicObject(987,2513.3999000,-650.7000100,115.3000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (189)
	CreateDynamicObject(987,2506.0000000,-651.0000000,111.5000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (191)
	CreateDynamicObject(987,2501.3000500,-651.9000200,108.6000000,0.0000000,0.0000000,9.9760000); //object(elecfence_bar) (192)
	CreateDynamicObject(987,2496.6999500,-653.2000100,106.7000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (193)
	CreateDynamicObject(987,2485.6001000,-654.5000000,109.6000000,0.0000000,0.0000000,7.9760000); //object(elecfence_bar) (194)
	CreateDynamicObject(987,2474.6999500,-658.0999800,112.9000000,0.0000000,0.0000000,17.9760000); //object(elecfence_bar) (195)
	CreateDynamicObject(987,2463.6001000,-661.0999800,114.8000000,0.0000000,0.0000000,15.9740000); //object(elecfence_bar) (196)
	CreateDynamicObject(987,2453.1001000,-664.4000200,117.2000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (197)
	CreateDynamicObject(987,2442.8000500,-667.9000200,119.1000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (198)
	CreateDynamicObject(987,2432.8000500,-671.4000200,121.0000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (199)
	CreateDynamicObject(987,2422.1001000,-675.0000000,123.4000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (200)
	CreateDynamicObject(987,2411.6001000,-678.2000100,125.8000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (201)
	CreateDynamicObject(987,2400.6001000,-681.5999800,125.8000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (202)
	CreateDynamicObject(987,2389.6001000,-685.0000000,125.8000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (203)
	CreateDynamicObject(987,2379.1999500,-688.7000100,125.8000000,0.0000000,0.0000000,17.9740000); //object(elecfence_bar) (204)
	CreateDynamicObject(987,2368.6999500,-691.9000200,128.2000000,0.0000000,0.0000000,15.9740000); //object(elecfence_bar) (205)
	CreateDynamicObject(987,2357.6999500,-695.2999900,130.1000100,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (206)
	CreateDynamicObject(987,2346.8000500,-698.7000100,130.1000100,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (207)
	CreateDynamicObject(987,2336.0000000,-702.2000100,131.5000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (208)
	CreateDynamicObject(987,2324.5000000,-705.5999800,131.5000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (209)
	CreateDynamicObject(987,2313.3999000,-707.5999800,130.1000100,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (210)
	CreateDynamicObject(987,2302.3000500,-710.4000200,128.7000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (212)
	CreateDynamicObject(987,2291.3999000,-713.7000100,128.7000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (213)
	CreateDynamicObject(987,2280.3000500,-716.5000000,128.7000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (214)
	CreateDynamicObject(987,2268.8999000,-720.0999800,128.2000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (215)
	CreateDynamicObject(987,2257.6999500,-723.4000200,125.8000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (216)
	CreateDynamicObject(987,2247.5000000,-726.4000200,122.9000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (217)
	CreateDynamicObject(987,2236.6999500,-728.5000000,119.1000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (218)
	CreateDynamicObject(987,2230.8999000,-730.7000100,114.8000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (219)
	CreateDynamicObject(987,2225.3999000,-732.2999900,111.0000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (220)
	CreateDynamicObject(987,2219.8999000,-733.9000200,107.7000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (221)
	CreateDynamicObject(987,2213.8999000,-735.5999800,104.4000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (222)
	CreateDynamicObject(987,2208.8999000,-737.0999800,101.1000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (223)
	CreateDynamicObject(987,2199.3000500,-740.2999900,98.2000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (224)
	CreateDynamicObject(987,2190.8999000,-742.2999900,96.3000000,0.0000000,0.0000000,15.9690000); //object(elecfence_bar) (225)
	CreateDynamicObject(987,2180.6001000,-748.0999800,96.3000000,0.0000000,0.0000000,27.9690000); //object(elecfence_bar) (226)
	CreateDynamicObject(987,2170.5000000,-753.5999800,96.3000000,0.0000000,0.0000000,27.9660000); //object(elecfence_bar) (227)
	CreateDynamicObject(987,2160.3999000,-759.0999800,96.3000000,0.0000000,0.0000000,27.9660000); //object(elecfence_bar) (228)
	CreateDynamicObject(987,2150.1001000,-764.2000100,96.3000000,0.0000000,0.0000000,27.9660000); //object(elecfence_bar) (229)
	CreateDynamicObject(987,2140.8999000,-771.4000200,97.7000000,0.0000000,0.0000000,37.9660000); //object(elecfence_bar) (230)
	CreateDynamicObject(987,2131.6999500,-778.5999800,97.7000000,0.0000000,0.0000000,37.9630000); //object(elecfence_bar) (231)
	CreateDynamicObject(987,2114.0000000,-792.7999900,99.6000000,0.0000000,0.0000000,37.9630000); //object(elecfence_bar) (232)
	CreateDynamicObject(987,2122.5000000,-785.7998000,97.7000000,0.0000000,0.0000000,37.9630000); //object(elecfence_bar) (233)
	CreateDynamicObject(987,2103.3999000,-796.4000200,101.5000000,0.0000000,0.0000000,11.9630000); //object(elecfence_bar) (234)
	CreateDynamicObject(987,2092.8999000,-799.0000000,102.9000000,0.0000000,0.0000000,11.9590000); //object(elecfence_bar) (235)
	CreateDynamicObject(987,2085.1999500,-800.7999900,107.2000000,0.0000000,0.0000000,11.9590000); //object(elecfence_bar) (236)
	CreateDynamicObject(987,2078.6999500,-802.4000200,111.0000000,0.0000000,0.0000000,11.9590000); //object(elecfence_bar) (237)
	CreateDynamicObject(987,2070.3000500,-804.4000200,114.3000000,0.0000000,0.0000000,11.9590000); //object(elecfence_bar) (238)
	CreateDynamicObject(987,2062.8999000,-806.2000100,117.2000000,0.0000000,0.0000000,11.9590000); //object(elecfence_bar) (239)
	CreateDynamicObject(987,2054.5000000,-808.2000100,120.5000000,0.0000000,0.0000000,11.9590000); //object(elecfence_bar) (240)
	CreateDynamicObject(987,2045.8000500,-807.4000200,123.8000000,0.0000000,0.0000000,355.9590000); //object(elecfence_bar) (241)
	CreateDynamicObject(987,2036.1999500,-806.7999900,126.2000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (242)
	CreateDynamicObject(987,2026.8000500,-807.2000100,128.6000100,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (243)
	CreateDynamicObject(987,2015.6999500,-806.7999900,128.6000100,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (244)
	CreateDynamicObject(987,2004.0999800,-806.2999900,129.6000100,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (245)
	CreateDynamicObject(987,1993.0000000,-805.9000200,129.6000100,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (246)
	CreateDynamicObject(987,1980.9000200,-805.2999900,129.6000100,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (247)
	CreateDynamicObject(987,1969.9000200,-804.4000200,129.6000100,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (248)
	CreateDynamicObject(987,1959.0000000,-803.2000100,126.3000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (249)
	CreateDynamicObject(987,1948.6999500,-801.0999800,124.9000000,0.0000000,0.0000000,349.9570000); //object(elecfence_bar) (250)
	CreateDynamicObject(987,1938.6999500,-800.0000000,122.5000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (251)
	CreateDynamicObject(987,1928.1999500,-799.2000100,121.1000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (252)
	CreateDynamicObject(987,1923.4000200,-798.4000200,119.2000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (253)
	CreateDynamicObject(987,1912.4000200,-796.4000200,116.8000000,0.0000000,0.0000000,351.9570000); //object(elecfence_bar) (254)
	CreateDynamicObject(987,1902.1999500,-795.0999800,113.9000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (255)
	CreateDynamicObject(987,1897.5000000,-795.4000200,109.1000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (256)
	CreateDynamicObject(987,1890.5999800,-795.5999800,107.2000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (257)
	CreateDynamicObject(987,1887.6999500,-795.4000200,104.3000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (258)
	CreateDynamicObject(987,1883.9000200,-795.0999800,101.9000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (259)
	CreateDynamicObject(987,1878.1999500,-794.0999800,99.5000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (260)
	CreateDynamicObject(987,1873.9000200,-793.7000100,96.2000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (261)
	CreateDynamicObject(987,1867.6999500,-793.2000100,92.9000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (262)
	CreateDynamicObject(987,1864.4000200,-792.4000200,88.6000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (263)
	CreateDynamicObject(987,1857.9000200,-792.0000000,86.7000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (264)
	CreateDynamicObject(987,1852.3000500,-791.4000200,84.3000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (265)
	CreateDynamicObject(987,1847.6999500,-790.5000000,81.4000000,0.0000000,0.0000000,355.9570000); //object(elecfence_bar) (266)
	CreateDynamicObject(987,1837.0999800,-787.2999900,80.4000000,0.0000000,0.0000000,343.9570000); //object(elecfence_bar) (267)
	CreateDynamicObject(987,1831.9000200,-784.9000200,78.0000000,0.0000000,0.0000000,339.9540000); //object(elecfence_bar) (268)
	CreateDynamicObject(987,1826.6999500,-782.5000000,74.7000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (269)
	CreateDynamicObject(987,1819.8000500,-779.2999900,72.8000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (270)
	CreateDynamicObject(987,1812.1999500,-776.2999900,68.5000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (271)
	CreateDynamicObject(987,1802.0000000,-772.2000100,67.1000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (272)
	CreateDynamicObject(987,1795.0999800,-769.9000200,65.7000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (273)
	CreateDynamicObject(987,1791.6999500,-768.2999900,63.3000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (274)
	CreateDynamicObject(987,1786.0000000,-765.7999900,61.4000000,0.0000000,0.0000000,339.9500000); //object(elecfence_bar) (275)
	CreateDynamicObject(987,1778.6999500,-762.2000100,60.0000000,0.0000000,0.0000000,337.9500000); //object(elecfence_bar) (276)
	CreateDynamicObject(987,1771.8000500,-759.0000000,58.1000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (277)
	CreateDynamicObject(987,1762.9000200,-755.5000000,55.7000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (278)
	CreateDynamicObject(987,1755.8000500,-752.7000100,53.3000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (279)
	CreateDynamicObject(987,1747.0999800,-748.7999900,51.4000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (280)
	CreateDynamicObject(987,1737.0000000,-744.2999900,51.4000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (281)
	CreateDynamicObject(987,1726.1999500,-740.2000100,50.4000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (282)
	CreateDynamicObject(987,1715.8000500,-736.7000100,49.9000000,0.0000000,0.0000000,337.9450000); //object(elecfence_bar) (283)
	CreateDynamicObject(987,1704.4000200,-735.2000100,49.9000000,0.0000000,0.0000000,353.9450000); //object(elecfence_bar) (284)
	CreateDynamicObject(987,1693.5000000,-733.5999800,49.9000000,0.0000000,0.0000000,351.9410000); //object(elecfence_bar) (285)
	CreateDynamicObject(987,1682.8000500,-731.2000100,49.9000000,0.0000000,0.0000000,347.9360000); //object(elecfence_bar) (286)
	CreateDynamicObject(987,1671.5999800,-728.7000100,49.9000000,0.0000000,0.0000000,347.9320000); //object(elecfence_bar) (287)
	CreateDynamicObject(987,1660.4000200,-727.2000100,50.9000000,0.0000000,0.0000000,347.9320000); //object(elecfence_bar) (288)
	CreateDynamicObject(987,1653.0999800,-718.7999900,52.8000000,0.0000000,0.0000000,313.9320000); //object(elecfence_bar) (289)
	CreateDynamicObject(987,1645.3000500,-710.9000200,53.8000000,0.0000000,0.0000000,313.9290000); //object(elecfence_bar) (290)
	CreateDynamicObject(987,1638.5999800,-703.5999800,54.8000000,0.0000000,0.0000000,313.9290000); //object(elecfence_bar) (291)
	CreateDynamicObject(987,1632.1999500,-694.2999900,56.7000000,0.0000000,0.0000000,303.9290000); //object(elecfence_bar) (292)
	CreateDynamicObject(987,1626.6999500,-687.0000000,58.6000000,0.0000000,0.0000000,305.9260000); //object(elecfence_bar) (293)
	CreateDynamicObject(987,1620.3000500,-679.5999800,60.0000000,0.0000000,0.0000000,307.9210000); //object(elecfence_bar) (294)
	CreateDynamicObject(987,1615.0000000,-672.2000100,62.4000000,0.0000000,0.0000000,303.9210000); //object(elecfence_bar) (295)
	CreateDynamicObject(987,1604.3000500,-655.7999900,66.7000000,0.0000000,0.0000000,299.9210000); //object(elecfence_bar) (296)
	CreateDynamicObject(987,1608.7998000,-663.6992200,64.8000000,0.0000000,0.0000000,303.9210000); //object(elecfence_bar) (297)
	CreateDynamicObject(987,1599.0999800,-646.7000100,69.6000000,0.0000000,0.0000000,299.9160000); //object(elecfence_bar) (298)
	CreateDynamicObject(987,1594.1999500,-637.7000100,71.5000000,0.0000000,0.0000000,299.9160000); //object(elecfence_bar) (299)
	CreateDynamicObject(987,1588.5000000,-627.9000200,72.9000000,0.0000000,0.0000000,299.9160000); //object(elecfence_bar) (300)
	CreateDynamicObject(987,1582.8000500,-618.0999800,72.9000000,0.0000000,0.0000000,299.9160000); //object(elecfence_bar) (301)
	CreateDynamicObject(987,1577.0000000,-608.5999800,73.9000000,0.0000000,0.0000000,299.9160000); //object(elecfence_bar) (302)
	CreateDynamicObject(987,1571.0000000,-598.9000200,73.9000000,0.0000000,0.0000000,301.9160000); //object(elecfence_bar) (303)
	CreateDynamicObject(987,1562.5999800,-591.7000100,74.9000000,0.0000000,0.0000000,317.9150000); //object(elecfence_bar) (304)
	CreateDynamicObject(987,1553.0000000,-586.2000100,77.8000000,0.0000000,0.0000000,327.9110000); //object(elecfence_bar) (305)
	CreateDynamicObject(987,1543.5999800,-581.4000200,80.2000000,0.0000000,0.0000000,331.9090000); //object(elecfence_bar) (306)
	CreateDynamicObject(987,1533.8000500,-575.5999800,81.6000000,0.0000000,0.0000000,331.9090000); //object(elecfence_bar) (307)
	CreateDynamicObject(987,1524.0999800,-570.2000100,84.5000000,0.0000000,0.0000000,331.9080000); //object(elecfence_bar) (308)
	CreateDynamicObject(987,1524.0996100,-570.1992200,84.5000000,0.0000000,0.0000000,331.9080000); //object(elecfence_bar) (309)
	CreateDynamicObject(987,1514.5000000,-566.0999800,85.5000000,0.0000000,0.0000000,337.9080000); //object(elecfence_bar) (310)
	CreateDynamicObject(987,1503.3000500,-565.5999800,85.5000000,0.0000000,0.0000000,357.9060000); //object(elecfence_bar) (311)
	CreateDynamicObject(987,1492.0999800,-565.0999800,85.5000000,0.0000000,0.0000000,357.9020000); //object(elecfence_bar) (312)
	CreateDynamicObject(987,1480.9000200,-564.5999800,85.5000000,0.0000000,0.0000000,357.9020000); //object(elecfence_bar) (313)
	CreateDynamicObject(987,1471.0999800,-564.0000000,85.5000000,0.0000000,0.0000000,357.9020000); //object(elecfence_bar) (314)
	CreateDynamicObject(987,1461.9000200,-563.5999800,85.5000000,0.0000000,0.0000000,357.9020000); //object(elecfence_bar) (315)
	CreateDynamicObject(987,1449.8000500,-565.7000100,85.5000000,0.0000000,0.0000000,7.9020000); //object(elecfence_bar) (316)
	CreateDynamicObject(987,1438.5000000,-567.0999800,84.5000000,0.0000000,0.0000000,7.8990000); //object(elecfence_bar) (317)
	CreateDynamicObject(987,1428.6999500,-568.4000200,83.5000000,0.0000000,0.0000000,7.8990000); //object(elecfence_bar) (318)
	CreateDynamicObject(987,1417.9000200,-570.5000000,81.6000000,0.0000000,0.0000000,7.8990000); //object(elecfence_bar) (319)
	CreateDynamicObject(987,1395.1999500,-574.5999800,79.6000000,0.0000000,0.0000000,7.8990000); //object(elecfence_bar) (320)
	CreateDynamicObject(987,1406.5996100,-572.6992200,80.6000000,0.0000000,0.0000000,11.8990000); //object(elecfence_bar) (321)
	CreateDynamicObject(987,1384.6999500,-579.2000100,79.6000000,0.0000000,0.0000000,23.8990000); //object(elecfence_bar) (322)
	CreateDynamicObject(987,1377.6999500,-582.7000100,79.6000000,0.0000000,0.0000000,25.8950000); //object(elecfence_bar) (323)
	CreateDynamicObject(987,1370.0000000,-585.9000200,82.5000000,0.0000000,0.0000000,23.8950000); //object(elecfence_bar) (324)
	CreateDynamicObject(987,1364.8000500,-589.0999800,87.3000000,0.0000000,0.0000000,27.8950000); //object(elecfence_bar) (325)
	CreateDynamicObject(987,1358.6999500,-592.7999900,91.1000000,0.0000000,0.0000000,29.8950000); //object(elecfence_bar) (326)
	CreateDynamicObject(987,1351.0999800,-596.7000100,94.4000000,0.0000000,0.0000000,29.8940000); //object(elecfence_bar) (327)
	CreateDynamicObject(987,1347.0999800,-598.7999900,97.7000000,0.0000000,0.0000000,29.8940000); //object(elecfence_bar) (328)
	CreateDynamicObject(987,1343.6999500,-600.7000100,102.5000000,0.0000000,0.0000000,29.8940000); //object(elecfence_bar) (329)
	CreateDynamicObject(987,1335.5999800,-598.0999800,105.8000000,0.0000000,0.0000000,351.8940000); //object(elecfence_bar) (330)
	CreateDynamicObject(987,1328.5000000,-601.2000100,106.3000000,0.0000000,0.0000000,17.8920000); //object(elecfence_bar) (331)
	CreateDynamicObject(987,1318.1999500,-607.2999900,104.9000000,0.0000000,0.0000000,31.8900000); //object(elecfence_bar) (332)
	CreateDynamicObject(987,1306.8000500,-612.2999900,103.9000000,0.0000000,0.0000000,23.8860000); //object(elecfence_bar) (333)
	CreateDynamicObject(987,1298.4000200,-616.0999800,103.9000000,0.0000000,0.0000000,23.8840000); //object(elecfence_bar) (334)
	CreateDynamicObject(987,1287.4000200,-617.2999900,103.9000000,0.0000000,0.0000000,7.8840000); //object(elecfence_bar) (335)
	CreateDynamicObject(987,1280.0000000,-609.9000200,101.5000000,0.0000000,0.0000000,317.8830000); //object(elecfence_bar) (336)
	CreateDynamicObject(987,1278.0999800,-600.5000000,99.1000000,0.0000000,0.0000000,287.8780000); //object(elecfence_bar) (337)
	CreateDynamicObject(987,1275.3000500,-590.2000100,100.1000000,0.0000000,0.0000000,283.3750000); //object(elecfence_bar) (338)
	CreateDynamicObject(987,1265.4000200,-584.5999800,99.1000000,0.0000000,0.0000000,329.3700000); //object(elecfence_bar) (339)
	CreateDynamicObject(987,1260.5999800,-594.4000200,101.0000000,0.0000000,0.0000000,61.3700000); //object(elecfence_bar) (340)
	CreateDynamicObject(987,1257.0999800,-604.7000100,101.0000000,0.0000000,0.0000000,71.3700000); //object(elecfence_bar) (341)
	CreateDynamicObject(987,1257.0996100,-604.6992200,101.0000000,0.0000000,0.0000000,71.3670000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1252.5999800,-613.0999800,102.9000000,0.0000000,0.0000000,63.3670000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1241.0000000,-615.2999900,102.9000000,0.0000000,0.0000000,11.3640000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1229.6999500,-617.2999900,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1218.8000500,-619.5000000,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1207.1999500,-621.7999900,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1196.9000200,-623.7999900,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1187.5000000,-625.5999800,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1175.6999500,-627.5999800,102.9000000,0.0000000,0.0000000,9.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1166.5000000,-629.0000000,102.9000000,0.0000000,0.0000000,9.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1155.4000200,-631.2999900,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1155.3994100,-631.2998000,102.9000000,0.0000000,0.0000000,11.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1148.5000000,-622.2999900,102.9000000,0.0000000,0.0000000,307.3600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1146.8000500,-611.2999900,102.9000000,0.0000000,0.0000000,279.3590000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1144.9000200,-600.4000200,103.9000000,0.0000000,0.0000000,279.3550000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1140.0000000,-590.0000000,103.9000000,0.0000000,0.0000000,295.3550000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1129.1999500,-585.7999900,103.9000000,0.0000000,0.0000000,337.3510000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1117.1999500,-584.7999900,103.9000000,0.0000000,0.0000000,355.3460000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1105.7998000,-586.5996100,103.9000000,0.0000000,0.0000000,9.3380000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1083.2998000,-586.3994100,101.5000000,0.0000000,0.0000000,11.3330000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1094.5000000,-584.5000000,102.0000000,0.0000000,0.0000000,349.3380000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1072.1999500,-588.0999800,102.4000000,0.0000000,0.0000000,9.3380000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1061.4000200,-589.7000100,102.4000000,0.0000000,0.0000000,9.3380000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1049.5999800,-587.4000200,102.4000000,0.0000000,0.0000000,351.3380000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1037.8000500,-585.9000200,102.4000000,0.0000000,0.0000000,351.3370000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1025.0999800,-585.0999800,102.4000000,0.0000000,0.0000000,353.3370000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1013.5000000,-583.5999800,102.4000000,0.0000000,0.0000000,353.3370000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,1002.7000100,-580.4000200,102.4000000,0.0000000,0.0000000,341.3370000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,993.3994100,-581.7998000,104.8000000,0.0000000,0.0000000,3.3370000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,984.2000100,-584.0999800,106.2000000,0.0000000,0.0000000,15.3310000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,973.0999800,-587.0000000,106.7000000,0.0000000,0.0000000,15.3310000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,963.7999900,-589.0000000,108.6000000,0.0000000,0.0000000,13.3310000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,955.7999900,-591.2000100,111.0000000,0.0000000,0.0000000,13.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,945.0999800,-593.4000200,112.4000000,0.0000000,0.0000000,13.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,934.4000200,-595.5999800,112.9000000,0.0000000,0.0000000,13.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,924.0999800,-597.7999900,112.9000000,0.0000000,0.0000000,13.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,913.7999900,-600.0999800,112.9000000,0.0000000,0.0000000,13.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,903.5000000,-602.4000200,112.9000000,0.0000000,0.0000000,13.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,897.5999800,-612.0999800,112.9000000,0.0000000,0.0000000,59.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,891.7000100,-621.5999800,112.9000000,0.0000000,0.0000000,59.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,885.5000000,-631.7000100,112.9000000,0.0000000,0.0000000,59.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,882.4000200,-642.0000000,110.0000000,0.0000000,0.0000000,67.3260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,877.7000100,-652.5000000,107.6000000,0.0000000,0.0000000,65.3240000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,873.4000200,-662.0999800,105.7000000,0.0000000,0.0000000,65.3190000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,867.7999900,-671.9000200,105.7000000,0.0000000,0.0000000,61.3190000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,861.7999900,-681.5999800,104.3000000,0.0000000,0.0000000,61.3150000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,859.0999800,-687.4000200,100.5000000,0.0000000,0.0000000,61.3150000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,855.4000200,-694.2000100,98.6000000,0.0000000,0.0000000,61.3150000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,849.7000100,-704.2999900,98.6000000,0.0000000,0.0000000,61.3150000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,843.9000200,-714.0000000,95.7000000,0.0000000,0.0000000,61.3150000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,837.2999900,-722.2000100,93.3000000,0.0000000,0.0000000,51.3150000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,832.7000100,-728.2999900,90.4000000,0.0000000,0.0000000,51.3120000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,825.5999800,-737.2999900,88.5000000,0.0000000,0.0000000,51.3120000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,818.5999800,-746.0999800,86.1000000,0.0000000,0.0000000,51.3120000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,806.7999900,-743.2999900,83.2000000,0.0000000,0.0000000,347.3120000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,798.7999900,-741.2000100,81.8000000,0.0000000,0.0000000,347.3110000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,789.0999800,-747.9000200,79.4000000,0.0000000,0.0000000,35.3110000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,784.7999900,-750.9000200,77.0000000,0.0000000,0.0000000,35.3100000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,779.7000100,-754.4000200,74.1000000,0.0000000,0.0000000,35.3100000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,775.5000000,-758.4000200,72.2000000,0.0000000,0.0000000,35.3100000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,775.2000100,-777.7000100,69.3000000,0.0000000,0.0000000,69.3100000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,779.0999800,-767.2999900,69.3000000,0.0000000,0.0000000,97.3100000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,771.5999800,-787.0999800,67.4000000,0.0000000,0.0000000,69.3070000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,763.4000200,-793.4000200,64.1000000,0.0000000,0.0000000,41.3070000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,752.2999900,-794.7999900,65.5000000,0.0000000,0.0000000,9.3030000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,741.2000100,-796.5999800,66.5000000,0.0000000,0.0000000,9.3000000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,729.9000200,-799.2000100,67.0000000,0.0000000,0.0000000,13.3000000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,718.5000000,-801.4000200,68.0000000,0.0000000,0.0000000,13.2990000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,709.0000000,-808.2000100,69.4000000,0.0000000,0.0000000,37.2990000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,701.2999900,-815.7000100,69.4000000,0.0000000,0.0000000,43.2990000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,693.7999900,-823.7000100,69.4000000,0.0000000,0.0000000,47.2970000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,686.5000000,-831.7999900,69.4000000,0.0000000,0.0000000,49.2960000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,678.9000200,-841.0999800,69.4000000,0.0000000,0.0000000,51.2960000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,667.9000200,-841.9000200,73.2000000,0.0000000,0.0000000,353.2950000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,663.0000000,-841.2000100,76.1000000,0.0000000,0.0000000,353.2930000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,654.2999900,-840.2999900,78.5000000,0.0000000,0.0000000,353.2930000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,653.2000100,-852.5999800,79.0000000,0.0000000,0.0000000,83.2930000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,652.0000000,-859.2999900,76.1000000,0.0000000,0.0000000,83.2870000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,650.2999900,-866.5999800,73.7000000,0.0000000,0.0000000,83.2870000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,651.4000200,-874.2999900,71.3000000,0.0000000,0.0000000,97.2870000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,650.4000200,-879.2000100,68.4000000,0.0000000,0.0000000,89.2840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,649.4000200,-882.9000200,65.1000000,0.0000000,0.0000000,85.2810000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,645.7000100,-892.0999800,62.7000000,0.0000000,0.0000000,69.2810000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,635.7999900,-897.5000000,62.7000000,0.0000000,0.0000000,29.2800000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,625.2999900,-902.2999900,63.2000000,0.0000000,0.0000000,19.2790000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,613.7999900,-903.7000100,63.2000000,0.0000000,0.0000000,11.2760000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,602.2999900,-902.7999900,63.2000000,0.0000000,0.0000000,357.2720000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,591.0000000,-900.4000200,63.2000000,0.0000000,0.0000000,347.2700000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,671.7000100,-841.7999900,69.4000000,0.0000000,0.0000000,21.2930000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,581.2000100,-896.5999800,63.2000000,0.0000000,0.0000000,339.2670000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,571.7999900,-893.9000200,64.6000000,0.0000000,0.0000000,339.2630000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,560.9000200,-892.0000000,66.5000000,0.0000000,0.0000000,345.2630000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,549.5999800,-890.0000000,67.0000000,0.0000000,0.0000000,349.2620000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,538.0996100,-889.7998000,68.9000000,0.0000000,0.0000000,355.2600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,527.2000100,-892.2999900,69.4000000,0.0000000,0.0000000,11.2600000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,516.7999900,-896.0999800,70.4000000,0.0000000,0.0000000,19.2550000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,509.2999900,-904.0000000,70.4000000,0.0000000,0.0000000,45.2540000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,507.1000100,-915.0999800,71.8000000,0.0000000,0.0000000,77.2530000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,506.2000100,-925.0999800,73.4000000,0.0000000,0.0000000,83.2500000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,506.1992200,-925.0996100,73.4000000,0.0000000,0.0000000,83.2490000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,505.1000100,-935.2999900,75.3000000,0.0000000,0.0000000,83.2490000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,505.1000100,-944.5999800,76.3000000,0.0000000,0.0000000,89.2490000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,505.2000100,-956.2000100,78.7000000,0.0000000,0.0000000,89.2470000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,503.5000000,-966.7999900,80.1000000,0.0000000,0.0000000,81.2470000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,501.0000000,-977.0999800,82.5000000,0.0000000,0.0000000,77.2440000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,496.2000100,-987.2000100,85.4000000,0.0000000,0.0000000,65.2390000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,490.2999900,-994.4000200,88.3000000,0.0000000,0.0000000,51.2370000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,479.6000100,-999.2999900,89.7000000,0.0000000,0.0000000,25.2350000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,469.0000000,-1004.0999800,90.7000000,0.0000000,0.0000000,25.2300000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,458.1000100,-1007.7999900,91.7000000,0.0000000,0.0000000,21.2300000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,446.5000000,-1009.0000000,91.7000000,0.0000000,0.0000000,9.2260000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,435.2999900,-1010.0000000,91.7000000,0.0000000,0.0000000,7.2230000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,423.7999900,-1009.9000200,91.7000000,0.0000000,0.0000000,359.2180000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,412.7000100,-1009.7000100,91.7000000,0.0000000,0.0000000,359.2140000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,402.0000000,-1009.4000200,91.7000000,0.0000000,0.0000000,359.2140000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,391.2000100,-1009.0999800,91.2000000,0.0000000,0.0000000,359.2140000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,378.8999900,-1009.0999800,91.2000000,0.0000000,0.0000000,359.2140000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,367.2000100,-1009.7999900,91.2000000,0.0000000,0.0000000,3.2140000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,355.6000100,-1010.9000200,91.7000000,0.0000000,0.0000000,5.2140000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,344.7999900,-1014.5999800,92.6000000,0.0000000,0.0000000,21.2130000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,334.2000100,-1018.0999800,92.6000000,0.0000000,0.0000000,21.2110000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,323.1000100,-1020.4000200,91.6000000,0.0000000,0.0000000,13.2090000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,314.1000100,-1025.6999500,91.6000000,0.0000000,0.0000000,33.2060000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,305.8999900,-1032.5000000,91.1000000,0.0000000,0.0000000,41.2010000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,262.7999900,-1019.4000200,54.7000000,0.0000000,0.0000000,347.1880000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,252.1000100,-1015.0999800,54.7000000,0.0000000,0.0000000,337.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,241.7000000,-1010.0999800,54.7000000,0.0000000,0.0000000,335.1810000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,231.8000000,-1005.2000100,56.6000000,0.0000000,0.0000000,335.1760000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,219.8000000,-1003.5000000,54.7000000,0.0000000,0.0000000,355.1760000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,268.2999900,-1020.7999900,59.0000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,273.3999900,-1022.5000000,62.3000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,280.2000100,-1023.9000200,66.6000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,283.8999900,-1024.5000000,70.4000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,288.7999900,-1025.6999500,74.7000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,293.0000000,-1026.5999800,79.5000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,296.6000100,-1027.9000200,83.3000000,0.0000000,0.0000000,347.1840000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,298.2999900,-1039.1999500,89.2000000,0.0000000,0.0000000,43.1990000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,215.7000000,-1013.7000100,54.7000000,0.0000000,0.0000000,71.1720000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,212.2000000,-1024.3000500,56.6000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,209.8999900,-1031.0000000,59.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,207.1000100,-1039.8000500,60.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,203.5000000,-1050.0999800,60.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,199.5000000,-1060.5000000,60.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,196.0000000,-1071.3000500,60.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,191.7000000,-1082.6999500,60.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,188.2000000,-1093.5000000,61.9000000,0.0000000,0.0000000,71.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,186.1000100,-1103.5999800,61.9000000,0.0000000,0.0000000,75.1690000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,183.2000000,-1114.5999800,61.9000000,0.0000000,0.0000000,75.1680000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,177.6000100,-1124.5000000,61.9000000,0.0000000,0.0000000,61.1680000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,172.0000000,-1134.8000500,61.4000000,0.0000000,0.0000000,61.1660000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,167.3999900,-1145.3000500,60.9000000,0.0000000,0.0000000,67.1660000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,164.8999900,-1156.5999800,60.4000000,0.0000000,0.0000000,75.1650000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,161.3999900,-1167.1999500,59.4000000,0.0000000,0.0000000,73.1630000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,159.3000000,-1174.4000200,58.0000000,0.0000000,0.0000000,73.1580000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,154.6000100,-1183.5999800,56.6000000,0.0000000,0.0000000,65.1580000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,152.7000000,-1186.9000200,54.2000000,0.0000000,0.0000000,67.1540000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,147.2000000,-1193.6999500,52.8000000,0.0000000,0.0000000,55.1540000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,141.8999900,-1202.4000200,50.9000000,0.0000000,0.0000000,55.1510000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,137.5000000,-1210.0000000,49.0000000,0.0000000,0.0000000,57.1510000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,134.3999900,-1218.3000500,47.1000000,0.0000000,0.0000000,69.1510000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,131.3999900,-1225.3000500,45.7000000,0.0000000,0.0000000,69.1480000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,127.6000000,-1234.0000000,46.2000000,0.0000000,0.0000000,67.1480000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,123.0000000,-1244.5000000,46.2000000,0.0000000,0.0000000,67.1430000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,118.1000000,-1255.4000200,46.2000000,0.0000000,0.0000000,69.1430000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,113.8000000,-1266.5000000,46.2000000,0.0000000,0.0000000,69.1420000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,111.4000000,-1277.3000500,46.2000000,0.0000000,0.0000000,75.1420000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,110.2000000,-1288.1999500,45.8000000,0.0000000,0.0000000,85.1410000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,110.8000000,-1299.0999800,45.8000000,0.0000000,0.0000000,95.1390000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,114.2000000,-1309.6999500,45.3000000,0.0000000,0.0000000,107.1360000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,117.4000000,-1319.6999500,46.3000000,0.0000000,0.0000000,107.1330000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,119.8000000,-1330.8000500,47.7000000,0.0000000,0.0000000,101.1330000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,121.3000000,-1342.0000000,47.7000000,0.0000000,0.0000000,97.1290000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,122.5000000,-1353.0999800,47.7000000,0.0000000,0.0000000,97.1250000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,126.3000000,-1364.1999500,48.2000000,0.0000000,0.0000000,109.1250000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,131.3999900,-1374.6999500,49.2000000,0.0000000,0.0000000,117.1220000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,136.8000000,-1384.9000200,49.2000000,0.0000000,0.0000000,117.1200000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,142.8999900,-1394.3000500,47.3000000,0.0000000,0.0000000,117.1200000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,150.8000000,-1403.0000000,45.9000000,0.0000000,0.0000000,131.1200000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,152.8000000,-1412.1999500,44.0000000,0.0000000,0.0000000,103.1160000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,149.0000000,-1421.0999800,41.1000000,0.0000000,0.0000000,71.1120000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,143.8000000,-1426.1999500,39.2000000,0.0000000,0.0000000,59.1090000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,140.3000000,-1431.9000200,36.3000000,0.0000000,0.0000000,59.1060000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,135.3000000,-1438.9000200,32.5000000,0.0000000,0.0000000,57.1060000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,130.0000000,-1446.3000500,30.6000000,0.0000000,0.0000000,57.1060000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,127.1000000,-1451.3000500,28.7000000,0.0000000,0.0000000,59.1060000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,123.9000000,-1456.3000500,26.3000000,0.0000000,0.0000000,59.1060000); //object(elecfence_bar) (342)
	CreateDynamicObject(987,12.4000000,-1337.9000200,9.2000000,0.0000000,0.0000000,308.0000000); //object(elecfence_bar) (533)
	CreateDynamicObject(987,23.0000000,-1350.8000500,9.2000000,0.0000000,0.0000000,130.2460000); //object(elecfence_bar) (534)
	CreateDynamicObject(987,-2.1000000,-1312.8000500,10.2000000,0.0000000,0.0000000,307.9960000); //object(elecfence_bar) (535)
	CreateDynamicObject(987,8.6000000,-1325.5000000,10.2000000,0.0000000,0.0000000,129.9960000); //object(elecfence_bar) (536)
	CreateDynamicObject(987,1032.1999500,-586.7000100,102.4000000,0.0000000,0.0000000,5.3320000); //object(elecfence_bar) (342)

	/*
	Objects converted: 699
	Vehicles converted: 131
	Vehicle models found: 50
	----------------------
	In the time this conversion took to finish light could have travelled around the world 1.38 times!
	*/
	return 1;
}

stock CreateServerVehicles()
{
	CreateVehicle(487,2530.1001000,-1677.3000500,20.2000000,90.0000000,4,4,0); //Maverick
	CreateVehicle(492,2508.3999000,-1685.9000200,13.4000000,54.0000000,3,1,0); //Greenwood
	CreateVehicle(492,2508.0000000,-1666.0000000,13.4000000,21.9980000,4,2,0); //Greenwood
	CreateVehicle(545,2506.6999500,-1676.5000000,13.3000000,328.0000000,4,1,0); //Hustler
	CreateVehicle(568,2460.3000500,-1672.9000200,13.4000000,12.0000000,2,2,0); //Bandito
	CreateVehicle(568,2457.1999500,-1673.0999800,13.4000000,357.9970000,0,0,0); //Bandito
	CreateVehicle(515,2481.3000500,-1746.8000500,14.7000000,0.0000000,5,1,0); //Roadtrain
	CreateVehicle(405,2486.5000000,-1654.5000000,13.2000000,92.0000000,4,1,0); //Sentinel
	CreateVehicle(422,2482.8000500,-1685.8000500,13.6000000,354.0000000,4,4,0); //Bobcat
	CreateVehicle(413,2498.3000500,-1654.0000000,13.6000000,0.0000000,9,4,0); //Pony
	CreateVehicle(554,2443.3000500,-1647.0000000,13.6000000,0.0000000,4,4,0); //Yosemite
	CreateVehicle(416,2432.1999500,-1640.0999800,13.8000000,174.0000000,1,4,0); //Ambulance
	CreateVehicle(405,2424.1999500,-1637.6999500,13.5000000,0.0000000,4,4,0); //Sentinel
	CreateVehicle(405,2427.1001000,-1637.5000000,13.5000000,6.0000000,4,4,0); //Sentinel
	CreateVehicle(542,2437.1999500,-1672.3000500,13.4000000,0.0000000,1,4,0); //Clover
	CreateVehicle(579,2432.8000500,-1672.4000200,13.7000000,12.0000000,4,6,0); //Huntley
	CreateVehicle(579,2428.5000000,-1673.6999500,13.7000000,356.0000000,1,4,0); //Huntley
	CreateVehicle(468,2449.3000500,-1671.4000200,13.3000000,0.0000000,4,4,0); //Sanchez
	CreateVehicle(468,2446.8999000,-1671.3000500,13.3000000,0.0000000,4,0,0); //Sanchez
	CreateVehicle(468,2444.5000000,-1671.1999500,13.3000000,0.0000000,1,4,0); //Sanchez
	CreateVehicle(468,2467.5000000,-1668.8000500,13.3000000,0.0000000,1,1,0); //Sanchez
	CreateVehicle(596,2468.5000000,-1652.0000000,13.3000000,90.0000000,1,0,0); //Police Car (LSPD)
	CreateVehicle(565,2471.6999500,-1676.0999800,13.0000000,20.0000000,4,1,0); //Flash
	CreateVehicle(587,2470.3000500,-1669.1999500,13.1000000,0.0000000,5,1,0); //Euros
	CreateVehicle(550,2449.8000500,-1715.3000500,13.6000000,320.0000000,2,1,0); //Sunrise
	CreateVehicle(581,2470.3000500,-1717.6999500,13.6000000,0.0000000,4,1,0); //BF-400
	CreateVehicle(581,2467.6001000,-1717.5000000,13.6000000,342.0000000,3,1,0); //BF-400
	CreateVehicle(548,1566.4000200,-1698.1999500,30.3000000,0.0000000,0,0,0); //Cargobob
	CreateVehicle(487,1564.8994100,-1655.5000000,28.7000000,0.0000000,0,0,0); //Maverick
	CreateVehicle(433,1549.1999500,-1613.6999500,14.0000000,270.0000000,0,0,0); //Barracks
	CreateVehicle(433,1548.9000200,-1607.5000000,14.0000000,270.0000000,0,0,0); //Barracks
	CreateVehicle(470,1564.9000200,-1615.0000000,13.5000000,0.0000000,0,0,0); //Patriot
	CreateVehicle(470,1570.1999500,-1614.9000200,13.5000000,0.0000000,0,0,0); //Patriot
	CreateVehicle(470,1575.9000200,-1614.6999500,13.5000000,0.0000000,0,0,0); //Patriot
	CreateVehicle(470,1591.4000200,-1606.6999500,13.5000000,182.0000000,0,0,0); //Patriot
	CreateVehicle(470,1598.1999500,-1606.9000200,13.5000000,182.0000000,0,0,0); //Patriot
	CreateVehicle(470,1586.9000200,-1671.4000200,5.9000000,272.0000000,0,0,0); //Patriot
	CreateVehicle(470,1578.3000500,-1709.0999800,5.9000000,360.0000000,0,0,0); //Patriot
	CreateVehicle(470,1570.9000200,-1709.1999500,5.9000000,360.0000000,0,0,0); //Patriot
	CreateVehicle(470,1583.5000000,-1709.3000500,5.9000000,359.9950000,0,0,0); //Patriot
	CreateVehicle(470,1591.5000000,-1709.1999500,5.9000000,359.9950000,0,0,0); //Patriot
	CreateVehicle(470,1600.1999500,-1700.5000000,5.9000000,89.9950000,0,0,0); //Patriot
	CreateVehicle(433,1564.8000500,-1709.1999500,6.2000000,0.0000000,0,0,0); //Barracks
	CreateVehicle(433,1530.8000500,-1684.0000000,6.2000000,270.0000000,0,0,0); //Barracks
	CreateVehicle(468,1558.4000200,-1693.8000500,5.7000000,0.0000000,0,0,0); //Sanchez
	CreateVehicle(468,1560.9000200,-1693.6999500,5.7000000,0.0000000,0,0,0); //Sanchez
	CreateVehicle(468,1563.9000200,-1693.4000200,5.7000000,0.0000000,0,0,0); //Sanchez
	CreateVehicle(468,1566.8000500,-1693.5000000,5.7000000,0.0000000,0,0,0); //Sanchez
	CreateVehicle(468,1569.6999500,-1693.5999800,5.7000000,0.0000000,0,0,0); //Sanchez
	CreateVehicle(471,1530.4000200,-1675.3000500,5.5000000,270.0000000,0,0,0); //Quad
	CreateVehicle(471,1530.1999500,-1678.6999500,5.5000000,270.0000000,0,0,0); //Quad
	CreateVehicle(470,1534.9000200,-1646.8000500,6.0000000,0.0000000,0,0,0); //Patriot
	CreateVehicle(470,1544.6999500,-1651.3000500,6.0000000,90.0000000,0,0,0); //Patriot
	CreateVehicle(470,1544.0999800,-1658.9000200,6.0000000,90.0000000,0,0,0); //Patriot
	CreateVehicle(470,1544.0000000,-1662.6999500,6.0000000,90.0000000,0,0,0); //Patriot
	CreateVehicle(470,1544.3000500,-1667.5000000,6.0000000,90.0000000,0,0,0); //Patriot
	CreateVehicle(470,1543.9000200,-1676.6999500,6.0000000,90.0000000,0,0,0); //Patriot
	CreateVehicle(470,1543.8000500,-1684.3000500,6.0000000,90.0000000,0,0,0); //Patriot
	CreateVehicle(470,1545.8000500,-1694.0000000,6.0000000,182.0000000,0,0,0); //Patriot
	CreateVehicle(471,1586.3000500,-1679.1999500,5.5000000,0.0000000,0,0,0); //Quad
	CreateVehicle(521,2727.0000000,-2389.1999500,13.3000000,264.0000000,0,0,0); //FCR-900
	CreateVehicle(521,2727.1001000,-2387.3000500,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(521,2727.1999500,-2385.3999000,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(521,2727.3000500,-2383.5000000,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(521,2727.3000500,-2383.5000000,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(490,2797.3000500,-2557.0000000,14.0000000,0.0000000,0,0,0); //FBI Rancher
	CreateVehicle(490,2792.3999000,-2556.8999000,14.0000000,0.0000000,0,0,0); //FBI Rancher
	CreateVehicle(490,2787.8999000,-2556.6999500,14.0000000,0.0000000,0,0,0); //FBI Rancher
	CreateVehicle(490,2783.3999000,-2556.8000500,14.0000000,0.0000000,0,0,0); //FBI Rancher
	CreateVehicle(490,2779.0000000,-2556.8000500,14.0000000,0.0000000,0,0,0); //FBI Rancher
	CreateVehicle(490,2774.8000500,-2556.6999500,14.0000000,0.0000000,0,0,0); //FBI Rancher
	CreateVehicle(596,2766.3999000,-2557.3000500,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2762.6001000,-2557.1999500,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2758.8000500,-2557.6001000,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2755.0000000,-2557.5000000,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2750.6999500,-2557.8999000,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2746.8999000,-2557.8000500,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2743.1001000,-2557.6999500,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(596,2738.8999000,-2558.1001000,13.5000000,0.0000000,0,0,0); //Police Car (LSPD)
	CreateVehicle(415,2805.3999000,-2540.3000500,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.3999000,-2536.3999000,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.3000500,-2532.6999500,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.3999000,-2529.0000000,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.5000000,-2525.3999000,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.3999000,-2521.8000500,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.3999000,-2518.1999500,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.6001000,-2544.1999500,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(415,2805.3000500,-2514.1999500,13.5000000,90.0000000,0,0,0); //Cheetah
	CreateVehicle(523,2726.8999000,-2422.1999500,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(523,2727.0000000,-2424.6001000,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(523,2727.1001000,-2427.0000000,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(523,2727.1999500,-2429.3999000,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(523,2727.3000500,-2431.8000500,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(523,2727.3999000,-2434.1999500,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(523,2727.5000000,-2437.1001000,13.3000000,270.0000000,0,0,0); //HPV1000
	CreateVehicle(521,2727.3000500,-2381.6001000,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(521,2727.3000500,-2379.1999500,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(521,2727.3000500,-2376.8000500,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(521,2727.2998000,-2376.7998000,13.3000000,263.9960000,0,0,0); //FCR-900
	CreateVehicle(511,2687.1999500,-2360.0000000,15.1000000,90.0000000,0,0,0); //Beagle
	CreateVehicle(497,2661.1001000,-2382.0000000,13.9000000,0.0000000,0,0,0); //Police Maverick
	CreateVehicle(497,2644.8000500,-2382.3000500,13.9000000,0.0000000,0,0,0); //Police Maverick
	CreateVehicle(487,2661.1999500,-2341.1999500,13.9000000,180.0000000,0,0,0); //Maverick
	CreateVehicle(487,2643.3000500,-2341.5000000,13.9000000,179.9950000,0,0,0); //Maverick
	CreateVehicle(405,2473.8999000,-1691.5000000,13.9000000,0.0000000,0,0,0); //Sentinel
	CreateVehicle(562,2219.8000500,-2062.8999000,13.4000000,0.0000000,0,0,0); //Elegy
	CreateVehicle(426,2060.6001000,-2241.5000000,13.4000000,0.0000000,0,0,0); //Premier
	CreateVehicle(553,1496.0000000,-2627.3999000,15.8000000,0.0000000,0,0,0); //Nevada
	CreateVehicle(500,1566.5000000,-2627.1999500,17.9000000,0.0000000,0,0,0); //Mesa
	CreateVehicle(481,1579.0999800,-2423.0000000,14.8000000,0.0000000,0,0,0); //BMX
	CreateVehicle(456,1559.0999800,-2448.6001000,13.8000000,0.0000000,0,0,0); //Yankee
	CreateVehicle(402,1263.4000200,-2011.3000500,59.3000000,0.0000000,0,0,0); //Buffalo
	CreateVehicle(587,1257.5000000,-2011.3000500,59.3000000,0.0000000,0,0,0); //Euros
	CreateVehicle(506,1084.5999800,-2268.3999000,43.6000000,0.0000000,0,0,0); //Super GT
	CreateVehicle(475,1975.9000200,-1658.5000000,15.9000000,90.0000000,0,0,0); //Sabre
	CreateVehicle(550,1671.4000200,-1716.0999800,20.4000000,0.0000000,0,0,0); //Sunrise
	CreateVehicle(561,1609.3000500,-1581.6999500,28.5000000,338.0000000,0,0,0); //Stratum
	CreateVehicle(447,1101.0999800,-826.0000000,114.5000000,0.0000000,0,0,0); //Seasparrow
	CreateVehicle(422,1489.8000500,-703.2000100,94.8000000,0.0000000,0,0,0); //Bobcat
	CreateVehicle(407,1459.8000500,-687.5999800,95.1000000,0.0000000,0,0,0); //Firetruck
	CreateVehicle(541,1315.1999500,-806.2999900,78.1000000,0.0000000,0,0,0); //Bullet
	CreateVehicle(412,1014.7999900,-1361.9000200,13.3000000,0.0000000,0,0,0); //Voodoo
	CreateVehicle(603,999.4000200,-2155.3999000,13.1000000,0.0000000,0,0,0); //Phoenix
	CreateVehicle(575,837.0999800,-2061.1001000,12.6000000,0.0000000,0,0,0); //Broadway
	CreateVehicle(468,154.2000000,-1958.6999500,3.5000000,280.0000000,0,0,0); //Sanchez
	CreateVehicle(473,167.3000000,-1895.0000000,0.0000000,0.0000000,0,0,0); //Dinghy
	CreateVehicle(516,2407.8000500,-1234.5999800,23.7000000,0.0000000,0,0,0); //Nebula
	CreateVehicle(535,2793.3000500,-1286.0000000,43.1000000,0.0000000,0,0,0); //Slamvan
	CreateVehicle(540,2119.3000500,-1126.9000200,25.3000000,0.0000000,0,0,0); //Vincent
	CreateVehicle(585,483.8999900,-1484.0000000,19.4000000,0.0000000,0,0,0); //Emperor
	CreateVehicle(518,196.6000100,-1498.4000200,12.5000000,0.0000000,0,0,0); //Buccaneer
	return 1;
}

function IsPlayerAimingTargetBodyPart(playerid, targetid, bodypart)
{
	new Float:x, Float:y, Float:z;
	new Float:vx, Float:vy, Float:vz;
	new Float:cx, Float:cy, Float:cz;
	GetPlayerCameraFrontVector(playerid, vx, vy, vz);
	GetPlayerCameraPos(playerid, cx, cy, cz);
	new Float:px, Float:py, Float:pz;
	GetPlayerPos(targetid, px, py, pz);
	new Float:dist = floatsqroot(((cx-px)*(cx-px)) + ((cy-py)*(cy-py)) + ((cz-pz)*(cz-pz)));
    x = vx*dist+cx;
    y = vy*dist+cy;
    z = vz*dist+cz;
    new Float:offset;
	switch (GetPlayerWeapon(playerid))
	{
	    case 24, 29, 22, 23, 25, 26, 27, 28, 32: offset = 0.1122047500310059125919013005129;
	    case 30, 31: offset = 0.07867820613690007867820613690008;
	    case 33, 34: offset = 0.0;
	}
	new Float:height;
	if (z > cz) height = z-cz;
	else height = cz-z;
	offset *= dist;
	height /= dist;
	new Float:part;
	if (bodypart == BODY_PART_HEAD) part = -0.4;
	else if (bodypart == BODY_PART_TORSO) part = 0.3;
	else if (bodypart == BODY_PART_LEGS) part = 1.0;
	z = z+offset-height+part;
    if (IsPlayerInRangeOfPoint(targetid, 0.5, x, y, z-0.5)) return 1;
	return 0;
}

stock IsVehicleOccupied(vehid)
{
    for(new i; i <= MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i)) {
            if(IsPlayerInVehicle(i, vehid)) return 1;
        }
    }
    return 0;
}

stock IsPlayerInZone(playerid, zone[])
{
	new TmpZone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, TmpZone, sizeof(TmpZone));
	for(new i = 0; i != sizeof(gSAZones); i++)
	{
		if(strfind(TmpZone, zone, true) != -1)
			return 1;
	}
	return 0;
}

stock GetPlayer2DZone(playerid, zone[], len)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 	for(new i = 0; i != sizeof(gSAZones); i++ )
 	{
		if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4])
		{
		    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
		}
	}
	return 0;
}

stock GetPlayer3DZone(playerid, zone[], len)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 	for(new i = 0; i != sizeof(gSAZones); i++ )
 	{
		if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4] && z >= gSAZones[i][SAZONE_AREA][2] && z <= gSAZones[i][SAZONE_AREA][5])
		{
		    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
		}
	}
	return 0;
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
	    case 1:
	        return 331;

		case 2..8:
		    return weaponid+331;

        case 9:
		    return 341;

		case 10..15:
			return weaponid+311;

		case 16..18:
		    return weaponid+326;

		case 22..29:
		    return weaponid+324;

		case 30,31:
		    return weaponid+325;

		case 32:
		    return 372;

		case 33..45:
		    return weaponid+324;

		case 46:
		    return 371;
	}
	return 0;
}

stock SendMessageToAllAdmins(message[], color)
{
	foreach(Player, i)
	{
		if(pInfo[i][pAdminLevel] >= 1 || IsPlayerAdmin(i))
		{
	 	    SendClientMessage(i, color, message);
	 	}
 	}
	return 1;
}

timer SpawnEx[1000](playerid)
{
	SpawnPlayer(playerid);
	return 1;
}

stock StartIntro(playerid)
{
	new Float:fPos[3];
	FCNPC_GetPosition(100, fPos[0], fPos[1], fPos[2]);
	PlayAudioStreamForPlayer(playerid, "http://k007.kiwi6.com/hotlink/lat0jcgsof/serverintro.mp3");
 	TogglePlayerSpectating(playerid, 1);
  	InterpolateCameraPos(playerid, fPos[0], fPos[1], fPos[2]+30 , 1404.6999511719, -812.40002441406, 100.09999847412, 108000, CAMERA_MOVE);
  	SetPlayerWeather(playerid, 17);
  	SetPlayerTime(playerid, 18, 10); // -2235.6999511719, -2251.0, 72.699996948242
	return 1;
}

stock ClearChat()
{
	for(new a = 0; a < 20; a++) SendClientMessageToAll(-1, " ");
	return 1;
}

stock ResetVars(playerid)
{
	pInfo[playerid][Username] = 0;
	pInfo[playerid][Password] = 0;
	pInfo[playerid][zMoney] = 0;
	pInfo[playerid][Headshots] = 0;
	pInfo[playerid][PlayersKilled] = 0;
	pInfo[playerid][ZombiesKilled] = 0;
	pInfo[playerid][pAdminLevel] = 0;
	pInfo[playerid][pPremium] = 0;
	pInfo[playerid][pX] = 0.0;
	pInfo[playerid][pY] = 0.0;
	pInfo[playerid][pZ] = 0.0;
	pInfo[playerid][pWeap1] = 0;
	pInfo[playerid][pAmmo1] = 0;
	pInfo[playerid][pWeap2] = 0;
	pInfo[playerid][pAmmo2] = 0;
	pInfo[playerid][pWeap3] = 0;
	pInfo[playerid][pAmmo3] = 0;
	pInfo[playerid][pWeap4] = 0;
	pInfo[playerid][pAmmo4] = 0;
	pInfo[playerid][pWeap5] = 0;
	pInfo[playerid][pAmmo5] = 0;
	pInfo[playerid][pWeap6] = 0;
	pInfo[playerid][pAmmo6] = 0;
	pInfo[playerid][pWeap7] = 0;
	pInfo[playerid][pAmmo7] = 0;
	pInfo[playerid][pWeap8] = 0;
	pInfo[playerid][pAmmo8] = 0;
	pInfo[playerid][pWeap9] = 0;
	pInfo[playerid][pAmmo9] = 0;
	pInfo[playerid][pHour] = 0;
	pInfo[playerid][pMin] = 0;
	pInfo[playerid][pSec] = 0;
	pInfo[playerid][pHealth] = 0;
	pInfo[playerid][pFirstSpawn] = 0;
	pInfo[playerid][pIsInFaction] = 0;
	pInfo[playerid][pFactionID] = 0;
	pInfo[playerid][pLogged] = 0;
	pInfo[playerid][IsPlayerSpawned] = 0;
	pInfo[playerid][pAliveTime] = 0;
	pInfo[playerid][pSaveSpam] = 0;
	pInfo[playerid][pSkin] = 0;
	pInfo[playerid][pLevel] = 0;
	pInfo[playerid][pXP] = 0;
	pInfo[playerid][IsBoxLine] = 0;
	oocSpam[playerid] = 0;
	KillTimer(playedtimer[playerid]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
	return 1;
}

stock ClearChatPlayer(playerid)
{
	for(new a = 0; a < 20; a++) SendClientMessage(playerid,-1, " ");
	return 1;
}

function TimeOnServer(playerid)
{
	pInfo[playerid][pSec] ++;
	if(pInfo[playerid][pSec] >= 60)
 	{
  		pInfo[playerid][pMin]++;
    	pInfo[playerid][pSec]=0;

    }
	if(pInfo[playerid][pMin] >= 60)
 	{
  		pInfo[playerid][pMin]=0;
    	pInfo[playerid][pHour]++;
    }
    return 1;
}

stock GetTotalAccounts()
{
	mysql_query("SELECT * FROM users");
	mysql_store_result();
 	new rows = mysql_num_rows();
	mysql_free_result();
	return rows;
}

function GetClosestPlayer(p1)
{
    new x,Float:dis,Float:dis2,player;
    player = -1;
    dis = 99999.99;
    for (x=0;x<MAX_PLAYERS;x++) {
        if(IsPlayerConnected(x)) {
            if(x != p1) {
                dis2 = GetDistanceBetweenPlayers(x,p1);
                if(dis2 < dis && dis2 != -1.00) {
                    dis = dis2;
                    player = x;
                }
            }
        }
    }
    return player;
}

function Float:GetDistanceBetweenPlayers(p1,p2)
{
    new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
    if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2)) {
        return -1.00;
    }
    GetPlayerPos(p1,x1,y1,z1);
    GetPlayerPos(p2,x2,y2,z2);
    return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

