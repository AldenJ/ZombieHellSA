/* Zombie Hell SA:MP*/

#define BUD_USE_WHIRLPOOL                       true
#define BUD_MAX_COLUMNS                         60
#define BUD_MULTIGET_MAX_ENTRIES                60
#define BUD_MULTISET_MAX_ENTRIES                60

#include <a_samp> // Thanks to SA:MP Team
#include <sscanf2> // Thanks to Y_Less
#include <streamer> // Thanks to Incognito
#include <blaze> // Thanks to Slice
#include <zcmd> // Thanks to Zeex
#include <FCNPC> // Thanks to OrMisicL
#include <YSI\y_timers> // Thanks to Y_less
#include <progressbar> // Thanks to Toribio

#define Name "Zombie Hell RPG [ZOMBIE AI/LEVEL/RANK]"
#define Gamemode "ZombieHell "Version""

#include "ZombieHell/GenericDefines.pwn"
#include "ZombieHell/ServerDB.pwn"
#include "ZombieHell/Commands.pwn"
#include "ZombieHell/ServerCore.pwn"
#include "ZombieHell/Textdraws.pwn"
#include "ZombieHell/Coordinates.pwn"
#include "ZombieHell/ZombieAI.pwn"
#include "ZombieHell/Functions.pwn"
#include "ZombieHell/PlayerDamage.pwn"

main()
{
	print("\n----------------------------------");
	print(" Zombie Hell script loaded");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	ZombieInit();
    ZombieHellInit();
	return 1;
}

public OnGameModeExit()
{
	ZombieHellExit();
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
   	if(!IsPlayerNPC(playerid))
	{
		SetPlayerColor(playerid, 0x0000BB66);
 		ClearChatPlayer(playerid);
 		ResetVars(playerid);
 		
		new string[128];
		if(BUD::IsNameRegistered(PlayerName(playerid)))
		{
			format(string,sizeof(string)," Welcome back %s to "Name"\nPlease login to contiune.",PlayerName(playerid));
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Account Access Panel",string,"Login","Quit");
	    }
	    else
	    {
			format(string,sizeof(string)," Welcome %s to "Name"\nPlease register to contiune.",PlayerName(playerid));
			ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,""COL_WHITE"Account Register Panel",string,"Register","Quit");
	    }
	    
		SetPlayerTeam(playerid, 0);
		RemoveBuildings(playerid);
		CreatePlayerTD(playerid);

		PlayerTextDrawShow(playerid, playerHPBox[playerid]);
		PlayerTextDrawShow(playerid, xpView[playerid]);
		PlayerTextDrawShow(playerid, zSign[playerid]);
		PlayerTextDrawShow(playerid, playerMoney[playerid]);
		PlayerTextDrawShow(playerid, Box[playerid]);
		PlayerTextDrawShow(playerid, playerHealth[playerid]);
		TextDrawShowForPlayer(playerid, HellraizerLogo);
	}
	else
	{
		return 1;
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(!IsPlayerNPC(playerid))
	{
		if(pInfo[playerid][pLogged] == 1) { SaveStats(playerid); } 
		if(pInfo[playerid][IfSeenIntro] == 3) { pInfo[playerid][IfSeenIntro] = 0; }
	    ResetVars(playerid);

    	if(IsBeingSpeced[playerid] == 1)
	    {
	    	foreach(Player,i)
	     	{
	      		if(spectatorid[i] == playerid)
	        	{
	         		TogglePlayerSpectating(i,false);
	           	}
	        }
	    }
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
    if(!IsPlayerNPC(playerid))
    {
		SpawnVariables(playerid);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    if(!IsPlayerNPC(killerid))
    {
        if(killerid != INVALID_PLAYER_ID)
	    {
	        if(playerid <= 100)
	        {
	  			new randommoney = random(300);
				new randomxp = random(120);
		 		SendDeathMessage(killerid, playerid, reason);
		 		GivePlayerValue(killerid, MONEY, randommoney);
		 		GivePlayerValue(killerid, XP, randomxp);
		 		pInfo[killerid][PlayersKilled]++;
			}
		}
	}

	if(!IsPlayerNPC(playerid))
    {
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
		pInfo[playerid][pHealth] = MAX_HUMAN_HEALTH;
		pInfo[playerid][pFirstSpawn] = 1;
		pInfo[playerid][pAliveTime] = 0;
		pInfo[playerid][IsPlayerSpawned] = 0;

		if(IsBeingSpeced[playerid] == 1)
	    {
	        foreach(Player,i)
	        {
	            if(spectatorid[i] == playerid)
	            {
	                TogglePlayerSpectating(i,false);
	            }
	        }
	    }
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(pInfo[playerid][IsPlayerMuted] == 0)
	{
		if(pInfo[playerid][pLogged] == 1)
		{
	        new stringbig[356];
 			format(stringbig, sizeof(stringbig), "%s says: %s", PlayerName(playerid), text);
	    	SendLocalMessage(playerid, COLOR_GREY, 20.0, stringbig);
		}
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You are muted!");
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerNPC(playerid))
    {
        return 1;
	}
	else
	{
		if(pInfo[playerid][pLogged] == 0)
		{
			new string[128];
			if(BUD::IsNameRegistered(PlayerName(playerid)))
			{
				format(string,sizeof(string)," Welcome back %s to "Name"\nPlease login to contiune.",PlayerName(playerid));
				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Account Access Panel",string,"Login","Quit");
		    }
		    else
		    {
				format(string,sizeof(string)," Welcome %s to "Name"\nPlease register to contiune.",PlayerName(playerid));
				ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,""COL_WHITE"Account Register Panel",string,"Register","Quit");
		    }
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
    if(tickcount() - armedbody_pTick[playerid] > 113)
	{ 
		new weaponid[13],weaponammo[13],pArmedWeapon;
		pArmedWeapon = GetPlayerWeapon(playerid);
		GetPlayerWeaponData(playerid,1,weaponid[1],weaponammo[1]);
		GetPlayerWeaponData(playerid,2,weaponid[2],weaponammo[2]);
		GetPlayerWeaponData(playerid,4,weaponid[4],weaponammo[4]);
		GetPlayerWeaponData(playerid,5,weaponid[5],weaponammo[5]);
		#if ARMEDBODY_USE_HEAVY_WEAPON
		GetPlayerWeaponData(playerid,7,weaponid[7],weaponammo[7]);
		#endif
		if(weaponid[1] && weaponammo[1] > 0){
			if(pArmedWeapon != weaponid[1]){
				if(!IsPlayerAttachedObjectSlotUsed(playerid,0)){
					SetPlayerAttachedObject(playerid,0,GetWeaponModel(weaponid[1]),1, 0.199999, -0.139999, 0.030000, 0.500007, -115.000000, 0.000000, 1.000000, 1.000000, 1.000000);
				}
			}
			else {
				if(IsPlayerAttachedObjectSlotUsed(playerid,0)){
					RemovePlayerAttachedObject(playerid,0);
				}
			}
		}
		else if(IsPlayerAttachedObjectSlotUsed(playerid,0)){
			RemovePlayerAttachedObject(playerid,0);
		}
		if(weaponid[2] && weaponammo[2] > 0){
			if(pArmedWeapon != weaponid[2]){
				if(!IsPlayerAttachedObjectSlotUsed(playerid,1)){
					SetPlayerAttachedObject(playerid,1,GetWeaponModel(weaponid[2]),8, -0.079999, -0.039999, 0.109999, -90.100006, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
				}
			}
			else {
				if(IsPlayerAttachedObjectSlotUsed(playerid,1)){
					RemovePlayerAttachedObject(playerid,1);
				}
			}
		}
		else if(IsPlayerAttachedObjectSlotUsed(playerid,1)){
			RemovePlayerAttachedObject(playerid,1);
		}
		if(weaponid[4] && weaponammo[4] > 0){
			if(pArmedWeapon != weaponid[4]){
				if(!IsPlayerAttachedObjectSlotUsed(playerid,2)){
					SetPlayerAttachedObject(playerid,2,GetWeaponModel(weaponid[4]),7, 0.000000, -0.100000, -0.080000, -95.000000, -10.000000, 0.000000, 1.000000, 1.000000, 1.000000);
				}
			}
			else {
				if(IsPlayerAttachedObjectSlotUsed(playerid,2)){
					RemovePlayerAttachedObject(playerid,2);
				}
			}
		}
		else if(IsPlayerAttachedObjectSlotUsed(playerid,2)){
			RemovePlayerAttachedObject(playerid,2);
		}
		if(weaponid[5] && weaponammo[5] > 0){
			if(pArmedWeapon != weaponid[5]){
				if(!IsPlayerAttachedObjectSlotUsed(playerid,3)){
					SetPlayerAttachedObject(playerid,3,GetWeaponModel(weaponid[5]),1, 0.200000, -0.119999, -0.059999, 0.000000, 206.000000, 0.000000, 1.000000, 1.000000, 1.000000);
				}
			}
			else {
				if(IsPlayerAttachedObjectSlotUsed(playerid,3)){
					RemovePlayerAttachedObject(playerid,3);
				}
			}
		}
		else if(IsPlayerAttachedObjectSlotUsed(playerid,3)){
			RemovePlayerAttachedObject(playerid,3);
		}
		#if ARMEDBODY_USE_HEAVY_WEAPON
		if(weaponid[7] && weaponammo[7] > 0){
			if(pArmedWeapon != weaponid[7]){
				if(!IsPlayerAttachedObjectSlotUsed(playerid,4)){
					SetPlayerAttachedObject(playerid,4,GetWeaponModel(weaponid[7]),1,-0.100000, 0.000000, -0.100000, 84.399932, 112.000000, 10.000000, 1.099999, 1.000000, 1.000000);
				}
			}
			else {
				if(IsPlayerAttachedObjectSlotUsed(playerid,4)){
					RemovePlayerAttachedObject(playerid,4);
				}
			}
		}
		else if(IsPlayerAttachedObjectSlotUsed(playerid,4)){
			RemovePlayerAttachedObject(playerid,4);
		}
		#endif
		armedbody_pTick[playerid] = GetTickCount();
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
    {
	    
   		case DIALOG_LOGIN:
        {
        	if(!response)
	        {
 				ShowPlayerDialog(playerid,DIALOG_REGISTER,DIALOG_STYLE_MSGBOX,"Kicked"," You must login to play at "Name"","Close","");
				Kick(playerid);
	        }

            if(BUD::CheckAuth(PlayerName(playerid), inputtext))
            {
				pInfo[playerid][pLogged] = 1;
				SendClientMessage(playerid,-1,"*"COL_GREEN" You have been successfully logged in.");
				LoadPlayerStats(playerid);
            }
            else
            {
            	new string[128];
	 			format(string,sizeof(string)," Welcome back %s to "Name"\nPlease login to contiune.",PlayerName(playerid));
				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Account Access Panel",string,"Login","Quit");
                SendClientMessage(playerid,-1,"*"COL_RED" Wrong password!");
            }
        }

        case DIALOG_REGISTER:
        {
	        if(!response)
	        {
 				ShowPlayerDialog(playerid,DIALOG_REGISTER,DIALOG_STYLE_MSGBOX,"Kicked"," You must login to play at "Name"","Close","");
				Kick(playerid);
	        }

			if(BUD::RegisterName(PlayerName(playerid),inputtext))
			    SendClientMessage(playerid,-1,"*"COL_GREEN" You have been successfully registered!"),PlayerPlaySound(playerid,1057,0,0,0);
			else
			    SendClientMessage(playerid,-1,"*"COL_RED" Some error occured while registering (Possible invalid db entry)");

			new IP[16];
			GetPlayerIp(playerid, IP, sizeof(IP));
            BUD::SetStringEntry(ReturnID(playerid), "IP", IP);

			playedtimer[playerid] = SetTimerEx("TimeOnServer", 1000, 1, "i", playerid);
		    pInfo[playerid][pLogged] = 1;
		    ClearChatPlayer(playerid);
		    pInfo[playerid][pFirstSpawn] = 1;
		    pInfo[playerid][zMoney] += 500;
		 	pInfo[playerid][pHealth] = MAX_HUMAN_HEALTH;
		    ShowPlayerDialog(playerid,4235, DIALOG_STYLE_MSGBOX, ""COL_GREEN"Registered!",""COL_WHITE"You have finished registering and have been procressed\nIn reward you have recieved"COL_GREEN" z500 zMoney\n"COL_RED"Your account has been added to our database!","Play","");
		}

		case 4235:
		{
			if(response)
			{
	  			ShowPlayerDialog(playerid, DIALOG_INTRO, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Server Intro", ""COL_WHITE"Would you like to listen to the server intro?", "Yes", "No");
		    }
		}

		case DIALOG_INTRO:
		{
		    if(response)
		    {
		        IntroTime[playerid] = 108;
		        pInfo[playerid][IfSeenIntro] = 3;
		        StartIntro(playerid);
		    }

		    if(!response)
		    {
				pInfo[playerid][IfSeenIntro] = 2;
				SendClientMessage(playerid, -1, "*"COL_RED" You have skipped server intro!");
				SpawnPlayer(playerid);
			}

		}

		case DIALOG_SHOP:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						new tolong[612];
						strcat(tolong, ""COL_WHITE"Grenade x1 - z1000\nSniper Rifle x100 bullets - z6500\nCountry Rifle x75 bullets - z3000\nAK-47 x200 bullets - z2250\n\
						M4 Carbine x200 bullets - z2500\nCombat Shotgun x150 bullets - z3000\nSawnoff Shotgun x200 bullets - z1500\nShotgun x100 bullets - z1500\n\
						MP5 x200 bullets - z700\nMicro SMG x200 bullets - z600\nTec-9 x200 bullets - z600\n");
						strcat(tolong, "9mm Pistol x100 bullets - z150\nChainsaw - z5000\nKatana - z500\nKnife - z100\nShovel - z100\nGolf Club - z100\nPool Cue - z100\n\
						Nightstick - z100\nBaseball Bat - z100\nPurple Dildo - z500000\nSilver Vibrator - z250000\n");

					    ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_LIST, ""COL_WHITE"Weapons Shop", tolong, "Buy", "Close");
					}

					case 1:
					{
					    new strfactions[98];
					    strcat(strfactions, "Earth Defense Forces - z500000\nU.S Army - z50000\nRebels - z10000");

						ShowPlayerDialog(playerid, DIALOG_FACTIONS, DIALOG_STYLE_LIST, ""COL_WHITE"Factions Shop", strfactions, "Buy", "Close");
					}
				}
			}
		}

		case DIALOG_FACTIONS:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
					case 0:
					{
						if(pInfo[playerid][zMoney] >= 500000)
						{
						    pInfo[playerid][zMoney] -= 500000;
							pInfo[playerid][pIsInFaction] = 1;
							pInfo[playerid][pFactionID] = 1;
			    			SetPlayerPos(playerid,2784.0496,-2458.2656,13.6346);
							SendClientMessage(playerid,-1,"*"COL_RED" You spawned at Earth Defense Forces Headquarter!");
						}
						else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
					}

					case 1:
					{
						if(pInfo[playerid][zMoney] >= 50000)
						{
						    pInfo[playerid][zMoney] -= 50000;
							pInfo[playerid][pIsInFaction] = 1;
							pInfo[playerid][pFactionID] = 2;
				    		SetPlayerPos(playerid,1598.9003,-1629.4093,13.4537);
							SendClientMessage(playerid,-1,"*"COL_RED" You spawned at U.S Army LSPD Headquarter!");
						}
						else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
					}

					case 2:
					{
						if(pInfo[playerid][zMoney] >= 10000)
						{
						    pInfo[playerid][zMoney] -= 10000;
							pInfo[playerid][pIsInFaction] = 1;
							pInfo[playerid][pFactionID] = 3;
						    SetPlayerPos(playerid,2516.0950,-1682.2524,13.4006);
							SendClientMessage(playerid,-1,"*"COL_RED" You spawned at Rebels Headquarters!");
						}
						else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
					}
				}
			}
		}

		case DIALOG_WEAPONS:
		{
		    if(response)
			{
			    switch(listitem)
				{
				    case 0: if(pInfo[playerid][zMoney] >= 1000) { pInfo[playerid][zMoney] -= 1000, GivePlayerWeapon(playerid, 16, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 1: if(pInfo[playerid][zMoney] >= 6500) { pInfo[playerid][zMoney] -= 6500, GivePlayerWeapon(playerid, 34, 100); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 2: if(pInfo[playerid][zMoney] >= 3000) { pInfo[playerid][zMoney] -= 3000, GivePlayerWeapon(playerid, 33, 75); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 3: if(pInfo[playerid][zMoney] >= 2250) { pInfo[playerid][zMoney] -= 2250, GivePlayerWeapon(playerid, 30, 200); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 4: if(pInfo[playerid][zMoney] >= 2500) { pInfo[playerid][zMoney] -= 2500, GivePlayerWeapon(playerid, 31, 200); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 5: if(pInfo[playerid][zMoney] >= 3000) { pInfo[playerid][zMoney] -= 3000, GivePlayerWeapon(playerid, 27, 150); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 6: if(pInfo[playerid][zMoney] >= 1500) { pInfo[playerid][zMoney] -= 1500, GivePlayerWeapon(playerid, 26, 200); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 7: if(pInfo[playerid][zMoney] >= 1500) { pInfo[playerid][zMoney] -= 1500, GivePlayerWeapon(playerid, 25, 100); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 8: if(pInfo[playerid][zMoney] >= 700) { pInfo[playerid][zMoney] -= 700, GivePlayerWeapon(playerid, 29, 200); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 9: if(pInfo[playerid][zMoney] >= 600) { pInfo[playerid][zMoney] -= 600, GivePlayerWeapon(playerid, 28, 200); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 10: if(pInfo[playerid][zMoney] >= 600) { pInfo[playerid][zMoney] -= 600, GivePlayerWeapon(playerid, 32, 200); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 11: if(pInfo[playerid][zMoney] >= 150) { pInfo[playerid][zMoney] -= 150, GivePlayerWeapon(playerid, 22, 150); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 12: if(pInfo[playerid][zMoney] >= 5000) { pInfo[playerid][zMoney] -= 5000, GivePlayerWeapon(playerid, 9, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 13: if(pInfo[playerid][zMoney] >= 500) { pInfo[playerid][zMoney] -= 500, GivePlayerWeapon(playerid, 8, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 14: if(pInfo[playerid][zMoney] >= 100) { pInfo[playerid][zMoney] -= 100, GivePlayerWeapon(playerid, 4, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 15: if(pInfo[playerid][zMoney] >= 100) { pInfo[playerid][zMoney] -= 100, GivePlayerWeapon(playerid, 6, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 16: if(pInfo[playerid][zMoney] >= 100) { pInfo[playerid][zMoney] -= 100, GivePlayerWeapon(playerid, 2, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 17: if(pInfo[playerid][zMoney] >= 100) { pInfo[playerid][zMoney] -= 100, GivePlayerWeapon(playerid, 7, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 18: if(pInfo[playerid][zMoney] >= 100) { pInfo[playerid][zMoney] -= 100, GivePlayerWeapon(playerid, 3, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 19: if(pInfo[playerid][zMoney] >= 100) { pInfo[playerid][zMoney] -= 100, GivePlayerWeapon(playerid, 5, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 20: if(pInfo[playerid][zMoney] >= 500000) { pInfo[playerid][zMoney] -= 500000, GivePlayerWeapon(playerid, 10, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				    case 21: if(pInfo[playerid][zMoney] >= 250000) { pInfo[playerid][zMoney] -= 250000, GivePlayerWeapon(playerid, 13, 1); } else { SendClientMessage(playerid, -1, "*"COL_RED" You do not have enough money!"); }
				}
			}
		}
	}
	return 1;
}

stock SpawnVariables(playerid)
{
	if(!IsPlayerNPC(playerid))
	{
	    pInfo[playerid][IsPlayerSpawned] = 1;
	    if(pInfo[playerid][pFirstSpawn] == 1)
	    {
	        pInfo[playerid][pHealth] = MAX_HUMAN_HEALTH;
	        ResetPlayerWeapons(playerid);
		    pInfo[playerid][pFirstSpawn] = 2;
		    SetPlayerSkin(playerid,pInfo[playerid][pSkin]);
		    SendClientMessage(playerid,-1,"*"COL_RED" Want more weapons? /shop!");

		    if(pInfo[playerid][pIsInFaction] == 1)
		    {
				if(pInfo[playerid][pFactionID] == 1)
				{
				    SetPlayerPos(playerid,2784.0496,-2458.2656,13.6346);
					SendClientMessage(playerid,-1,"*"COL_RED" You spawned at Earth Defense Forces Headquarter!");
				}

				if(pInfo[playerid][pFactionID] == 2)
				{
				    SetPlayerPos(playerid,1598.9003,-1629.4093,13.4537);
					SendClientMessage(playerid,-1,"*"COL_RED" You spawned at U.S Army LSPD Headquarter!");
				}

				if(pInfo[playerid][pFactionID] == 3)
				{
				    SetPlayerPos(playerid,2516.0950,-1682.2524,13.4006);
					SendClientMessage(playerid,-1,"*"COL_RED" You spawned at Rebels Headquarters!");
				}
			}
			else
			{
			    new randSpawn = random(sizeof(randomSpawns_ZombieHell));
				SetPlayerPos(playerid,randomSpawns_ZombieHell[randSpawn][0],randomSpawns_ZombieHell[randSpawn][1],randomSpawns_ZombieHell[randSpawn][2]);
				SetPlayerFacingAngle(playerid,randomSpawns_ZombieHell[randSpawn][3]);
			}
			SetPlayerSkinByFaction(playerid);
			GivePlayerWeapon(playerid, 6, 1);
			GivePlayerWeapon(playerid, 29, 450);
		}

		else if(pInfo[playerid][pFirstSpawn] == 2)
		{
  			SetPlayerSkin(playerid,pInfo[playerid][pSkin]);
  			GivePlayerWeapon(playerid,pInfo[playerid][pWeap1],pInfo[playerid][pAmmo1]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap2],pInfo[playerid][pAmmo2]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap3],pInfo[playerid][pAmmo3]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap4],pInfo[playerid][pAmmo4]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap5],pInfo[playerid][pAmmo5]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap6],pInfo[playerid][pAmmo6]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap7],pInfo[playerid][pAmmo7]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap8],pInfo[playerid][pAmmo8]);
		    GivePlayerWeapon(playerid,pInfo[playerid][pWeap9],pInfo[playerid][pAmmo9]);
			SetPlayerPos(playerid,pInfo[playerid][pX],pInfo[playerid][pY],pInfo[playerid][pZ]+0.7);
		}

		SetProgressValue(playerid);

		if(IsSpecing[playerid] == 1)
	    {
	        SetPlayerPos(playerid,SpecX[playerid],SpecY[playerid],SpecZ[playerid]);
	        SetPlayerInterior(playerid,Inter[playerid]);
	        SetPlayerVirtualWorld(playerid,vWorld[playerid]);
	        IsSpecing[playerid] = 0;
	        IsBeingSpeced[spectatorid[playerid]] = 0;
	    }
	}
	return 1;
}
