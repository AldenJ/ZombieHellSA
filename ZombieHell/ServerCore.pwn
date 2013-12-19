/*

Zombie Hell - Server Core Script
Created April 14 2013
Description - Start up, server name, player updates, server updates self explanatory

*/

stock ZombieHellInit()
{
	SetGameModeText(""Gamemode"");
	SendRconCommand("hostname "Name"");

	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

	SetWeather(4);
	SetWorldTime(18);
    ShowPlayerMarkers(1);
    UsePlayerPedAnims();
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
    CreateServerVehicles();
    CreateServerObjects();
	CreateGlobalTD();
	WeatherUpdate();
	ChangeServerTime();
	DatabaseInit();
	
 	repeat UpdateZombieMovement();
 	repeat UpdatePlayer();
 	repeat UpdateServerTime();
 	repeat UpdateServerWeather();
	repeat MoveGates();
	return 1;
}

function ZombieHellExit()
{
	ZombieExit();
	DatabaseExit();
	DestroyGlobalTD();
	return 1;
}

timer MoveGates[1000]()
{
	for(new gateid = 0; gateid < MAX_GATES; gateid ++)
	{
		new IsPlayerCloseToGate = 0;
		foreach(Player,i)
		{
		    if(GateType[gateid] == GATE_EDF1)
		    {
			    if(pInfo[i][pFactionID] == 1)
			    {
					if(GetDistanceToPoint(i, GatePos[gateid][0], GatePos[gateid][1] , GatePos[gateid][2]) < GateMoveLimit[gateid])
					{
						IsPlayerCloseToGate = 1;
					}

					if(IsPlayerCloseToGate == 1)
					{
						//MoveObject(GateID[gateid], GatePos[gateid][3], GatePos[gateid][4], GatePos[gateid][5], GateSpeed[gateid]);
						MoveDynamicObject(GateID[gateid], GatePos[gateid][3], GatePos[gateid][4], GatePos[gateid][5], GateSpeed[gateid], 0.0, 0.0, 318.0);
					}
					else
					{
						//MoveObject(GateID[gateid], GatePos[gateid][0], GatePos[gateid][1], GatePos[gateid][2], GateSpeed[gateid]);
						MoveDynamicObject(GateID[gateid], GatePos[gateid][0], GatePos[gateid][1], GatePos[gateid][2], GateSpeed[gateid], 0.0, 0.0, 318.0);
					}
				}
			}

   			else if(GateType[gateid] == GATE_EDF2)
		    {
			    if(pInfo[i][pFactionID] == 1)
			    {
					if(GetDistanceToPoint(i, GatePos[gateid][0], GatePos[gateid][1] , GatePos[gateid][2]) < GateMoveLimit[gateid])
					{
						IsPlayerCloseToGate = 1;
					}

					if(IsPlayerCloseToGate == 1)
					{
						//MoveObject(GateID[gateid], GatePos[gateid][3], GatePos[gateid][4], GatePos[gateid][5], GateSpeed[gateid]);
						MoveDynamicObject(GateID[gateid], GatePos[gateid][3], GatePos[gateid][4], GatePos[gateid][5], GateSpeed[gateid], 0.0, 0.0, 0.0);
					}
					else
					{
						//MoveObject(GateID[gateid], GatePos[gateid][0], GatePos[gateid][1], GatePos[gateid][2], GateSpeed[gateid]);
						MoveDynamicObject(GateID[gateid], GatePos[gateid][0], GatePos[gateid][1], GatePos[gateid][2], GateSpeed[gateid], 0.0, 0.0, 0.0);
					}
				}
			}
		}
	}
}


timer UpdateServerTime[60000]()
{
    ChangeServerTime();
	return 1;
}

timer UpdateServerWeather[900000]()
{
    WeatherUpdate();
	return 1;
}

timer UpdatePlayer[1000]()
{
    new strdamage[180];
	foreach(Player, i)
	{
	    if(pInfo[i][pLogged] == 1)
	    {
	        if(pInfo[i][IsPlayerSpawned] == 1)
	        {
				SetPlayerScore(i, pInfo[i][pLevel]);
				CheckPlayerLevelXP(i);
				SendUpdatedViewMessage(i);
				SetPlayerColorByFaction(i);
				SetPlayerHealth(i, 100.0);

				format(strdamage,sizeof(strdamage),"Health:~r~ %i", pInfo[i][pHealth]);
				PlayerTextDrawSetString(i, playerHealth[i], strdamage);

				if(pInfo[i][pHealth] <= 0)
				{
				    SetPlayerHealth(i, 0.0);
				}
			}

			if(pInfo[i][IfSeenIntro] == 3)
			{
 			   	IntroTime[i]--;
 	 			if(IntroTime[i] == 0)
	  			{
		  		    TogglePlayerSpectating(i, 0);
		    	    SetCameraBehindPlayer(i);
					SpawnPlayer(i);
					SendClientMessage(i, -1, "*"COL_RED" Congratulation You've listened to the server intro! Free "COL_WHITE"z"COL_RED"2500 zMoney!");
					StopAudioStreamForPlayer(i);
					pInfo[i][zMoney] += 2500;
					pInfo[i][IfSeenIntro] = 1;
				}
			}
		}
	}
	return 1;
}
