/*

Zombie Hell - Commands script
Created April 24 2013
Description - Generic commands, admin commands

*/


CMD:shout(playerid, params[])
{
    new string[128],shout[100];
    if(sscanf(params, "s[100]", shout))
    {
        SendClientMessage(playerid, -1, ""COL_GREY" /(s)hout [message]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "%s shouts: %s!",PlayerName(playerid),shout);
        SendLocalMessage(playerid, COLOR_GREY, 80.0, string);
    }
    return 1;
}

CMD:local(playerid,params[])
{
    if(isnull(params)) return SendClientMessage(playerid, -1,""COL_GREY" /l(ocal) [local ooc chat]");
    new string[128];

    format(string, sizeof(string), "((LOCAL)) %s Says: (( %s ))", PlayerName(playerid), params);
    SendLocalMessage(playerid, COLOR_GREY, 35.0, string);
    return 1;
}

CMD:ooc(playerid,params[])
{
    if(isnull(params)) return SendClientMessage(playerid, -1,""COL_GREY" /o(oc) [global ooc chat]");
    if(gettime() - 60 < oocSpam[playerid]) return GameTextForPlayer(playerid,"~w~Wait before infecting again!",1000,5);
    {
		new string[128];
	    format(string, sizeof(string), "((GLOBAL)) %s Says: (( %s ))", PlayerName(playerid), params);
	    SendLocalMessage(playerid, COLOR_GREY, 800.0, string);
	    oocSpam[playerid] = gettime();
	}
    return 1;
}

CMD:shop(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_SHOP, DIALOG_STYLE_LIST, ""COL_WHITE"Shop Menu!",""COL_WHITE"Buy Weapons\nBuy Faction", "Select", "Cancel");
	return 1;
}

CMD:version(playerid,params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" /version [playerid]");

 	new string[128];
    GetPlayerVersion(targetid, string, sizeof(string));
    format(string, sizeof(string), "*"COL_RED" Player %s SA-MP version"COL_WHITE" %s",PlayerName(targetid),string);
    SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:acmds(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
		new str[500];
		strcat(str,""COL_WHITE"level1 - /clearanim,/getid, /cc, /wslap, /a, /warn, /akill, /mute, /unmute, /kick\nlevel2 - /ban, /unban, /slap, /givemoney, /setweather, /get, /goto, /respawncars\n\
		level3 - /ann2, /respawncars, /respawnallcars/ip\nlevel4 - /ann\nlevel5 - Private");
		ShowPlayerDialog(playerid,6755,DIALOG_STYLE_MSGBOX,"Admin Command List!",str,"Close","");
	}
	else return SendClientMessage(playerid,-1,""COL_RED" You are not in the staff team!");
	return 1;
}

CMD:respawnallcars(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 3)
	{
		for(new i=0;i<MAX_VEHICLES;i++)
		{
	        if(IsVehicleOccupied(i) == 0)
			{
	            SetVehicleToRespawn(i);
				SetVehicleHealth(i,800.0);
	        }
	    }

		new str[256];
		format(str,sizeof(str),""COL_LGREEN" %s %s have respawned all unoccupied vehicles!",GetAdminName(playerid),PlayerName(playerid));
		SendMessageToAllAdmins(str,-1);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not meet the requirements of the admin level");
	}
	return 1;
}

CMD:respawncars(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 3)
	{
		new Float:range;
		if(sscanf(params, "f", range)) return SendClientMessage(playerid,-1," /respawncars [range]");

		for(new i=0;i<MAX_VEHICLES;i++)
		{
		    if(IsPlayerNearVehicle(playerid, i, range))
		    {
		        if(IsVehicleOccupied(i) == 0)
				{
		            SetVehicleToRespawn(i);
					SetVehicleHealth(i,800.0);
				}
			}
	    }

		new str[256];
		format(str,sizeof(str),""COL_LGREEN" %s %s have respawned all unoccupied vehicles in range of %.2f!",GetAdminName(playerid),PlayerName(playerid),range);
		SendMessageToAllAdmins(str,-1);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not meet the requirements of the admin level");
	}
	return 1;
}

CMD:report(playerid,params[])
{
	new targetid,reason[105],reportstring[256];
	if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1," /report [playerid] [reason]");
	if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

	if(pInfo[playerid][IsPlayerMuted] == 0)
	{
		SendClientMessage(playerid,-1,""COL_LGREEN" Your report has been sent to the online admins!");

		format(reportstring,sizeof(reportstring), ""COL_YELLOW" Player %s(%d) reported %s(%d)"COL_WHITE" [Reason: %s]", PlayerName(playerid),playerid,PlayerName(targetid),targetid,reason);
		SendMessageToAllAdmins(reportstring,-1);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You cannot report a player while be muted");
	}
	return 1;
}

CMD:admins(playerid, params[])
{
	if(pInfo[playerid][pHour] >= 4)
	{
	    new adminstring[128];
	    if(IsPlayerConnected(playerid))
	    {
	        for (new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
	                if(pInfo[i][pAdminLevel] > 0)
	                {
	                    format(adminstring, sizeof(adminstring),"%s%s: %s\n", adminstring, GetAdminName(i), PlayerName(i));
	                }
	            }
	        }
	        ShowPlayerDialog(playerid,DIALOG_ADMINS,DIALOG_STYLE_MSGBOX,"Online admins",adminstring,"Close","");
		}
 		else return SendClientMessage(playerid,-1,""COL_LGREEN" No admins online");
	}
	else return SendClientMessage(playerid,-1,""COL_LGREEN" You cannot view admins online (You need 4 hours IG time)");
    return 1;
}

CMD:ban(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2)
    {
        if(IsPlayerConnected(playerid))
        {
			new targetid,reason[105],string[256];
			if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1," /ban [playerid] [reason]");
			if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

			format(string, sizeof(string), ""COL_RED" %s %s has banned %s"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
			SendClientMessageToAll(-1,string);

			BanEx(targetid, reason);
		}
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:getid(playerid,params[])
{
	new found, string[128], playername[MAX_PLAYER_NAME];
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    if(isnull(params)) return SendClientMessage(playerid, -1, " /getid [PartOfName] ");
	    format(string,sizeof(string)," Searched for: \"%s\"",params);
	    SendClientMessage(playerid, -1,string);
	    for(new i=0; i <= MAX_PLAYERS; i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            GetPlayerName(i, playername, MAX_PLAYER_NAME);
	            new namelen = strlen(playername);
	            new bool:searched=false;
	            for(new pos=0; pos <= namelen; pos++)
	            {
	                if(searched != true)
	                {
	                    if(strfind(playername,params,true) == pos)
	                    {
	                        found++;
	                        format(string,sizeof(string)," %d. %s (ID: %d)",found,playername,i);
	                        SendClientMessage(playerid, -1 ,string);
	                        searched = true;
	                    }
	                }
	            }
	        }
	    }
	    if(found == 0)
	    SendClientMessage(playerid, -1, " No Players Localized!");
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:cc(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
		new reason[105], string[256];
	    if(sscanf(params, "s[105]", reason)) return SendClientMessage(playerid,-1," /clearchat [reason]");

		ClearChat();
		format(string,sizeof(string), ""COL_RED" %s %s cleared the chat"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),reason);
		SendClientMessageToAll(-1,string);
	}
	else {
	    SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:setlevel(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5 || IsPlayerAdmin(playerid))
	{
		new targetid,level,string[256];
		if(sscanf(params, "ud", targetid, level)) return  SendClientMessage(playerid,-1," /setlevel [playerid] [level]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");
		if(level < 0 || level > 5) return SendClientMessage(playerid,-1,"  Admin levels are ONLY between 1-5");

        pInfo[targetid][pAdminLevel] = level;

		format(string, sizeof(string), ""COL_RED" %s %s have given admin status of %d to %s",GetAdminName(playerid),PlayerName(playerid),level,PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:setpremium(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5)
	{
		new targetid,level,string[256];
		if(sscanf(params, "ud", targetid, level)) return  SendClientMessage(playerid,-1," /setpremium [playerid] [level]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");
		if(level < 0 || level > 4) return SendClientMessage(playerid,-1," Premium levels are ONLY between 1-4");

        pInfo[targetid][pPremium] = level;
		format(string, sizeof(string), ""COL_RED" %s %s have given premium status of %d to %s",GetAdminName(playerid),PlayerName(playerid),level,PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:slap(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 2 || IsPlayerAdmin(playerid))
	{
	    new targetid,string[256];
		if(sscanf(params, "u", targetid)) return  SendClientMessage(playerid,-1," /slap [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		new Float:posxx[3];
		GetPlayerPos(targetid, posxx[0], posxx[1], posxx[2]);
		SetPlayerPos(targetid, posxx[0], posxx[1], posxx[2]+40);

		if(IsPlayerAdmin(playerid))
		{
	   		format(string, sizeof(string), ""COL_RED" RCON Admin has slapped %s",PlayerName(targetid));
			SendClientMessageToAll(-1,string);
		}
		else
		{
			format(string, sizeof(string), ""COL_RED" %s %s has slapped %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
			SendClientMessageToAll(-1,string);
		}
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:wslap(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new targetid,string[256];
		if(sscanf(params, "u", targetid)) return  SendClientMessage(playerid,-1," /wslap [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		new Float:posxx[3];

		GetPlayerPos(targetid, posxx[0], posxx[1], posxx[2]);
		SetPlayerPos(targetid, posxx[0], posxx[1], posxx[2]+4);

		format(string, sizeof(string), ""COL_RED" %s %s has warned slapped %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:a(playerid,params[])
{
	new adminstring[256];
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    if(!strlen(params))
	    {
	        SendClientMessage(playerid, -1, " /a [message]");
	        return 1;
		}
		format(adminstring, sizeof(adminstring), ""COL_LIGHTBLUE"[Admin Chat] %s %s[%d]: %s",GetAdminName(playerid),PlayerName(playerid), playerid, params);
		SendMessageToAllAdmins(adminstring, -1);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:pm(playerid,params[])
{
	new targetid,message[256],pmstring[256],string[128];

 	if(sscanf(params,"us[256]", targetid, message)) return SendClientMessage(playerid,-1," /pm [playerid] [message]");
	if(pInfo[playerid][pLogged] == 1)
	{
		if(pInfo[targetid][pPM] == 0)
		{
			format(pmstring,sizeof(pmstring),""COL_LIGHTBLUE" PM From %s[%d] Message: %s",PlayerName(playerid),playerid,message);
			SendClientMessage(targetid,-1,pmstring);
			format(string,sizeof(string),""COL_LIGHTBLUE" Sucessfuly Sent a pm to %s", PlayerName(targetid));
			SendClientMessage(playerid,-1,string);
		}
		else {
			SendClientMessage(playerid,-1,""COL_RED" This player is not accepting any personal messages");
		}
	}
	return 1;
}

CMD:blockpm(playerid) return pInfo[playerid][pPM] = 1, SendClientMessage(playerid,-1,""COL_LGREEN" You are now blocking personal messages");
CMD:unblockpm(playerid) return pInfo[playerid][pPM] = 0, SendClientMessage(playerid,-1,""COL_LGREEN" You are not blocking any more personal messages");

CMD:ann(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 4 || IsPlayerAdmin(playerid))
	{
	    if(isnull(params)) return SendClientMessage(playerid, -1, " /ann [Text]");
    	GameTextForAll(params,5000,3);
	}
	else {
		SendClientMessage(playerid,-1,""COL_LGREEN" You must be a level 4 admin");
	}
	return 1;
}

CMD:ann2(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 3 || IsPlayerAdmin(playerid))
	{
	    if(isnull(params)) return SendClientMessage(playerid, -1, " /ann2 [Text]");
    	SendClientMessageToAll(-1,params);
	}
	else {
		SendClientMessage(playerid,-1,""COL_LGREEN" You must be a level 3 admin");
	}
	return 1;
}

CMD:warn(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1 || IsPlayerAdmin(playerid))
	{
	    new targetid,reason[105],string[256];
	    if(sscanf(params, "us[105]", targetid, reason)) return SendClientMessage(playerid,-1," /warn [playerid] [reason]");
	    if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		new sentstring[128];

        pInfo[targetid][pWarnings]++;

	    format(string,sizeof(string), "%s %s warned you\nReason: %s\nWarning Number: %i",GetAdminName(playerid),PlayerName(playerid), reason, pInfo[targetid][pWarnings]);
		ShowPlayerDialog(targetid,DIALOG_WARN,DIALOG_STYLE_MSGBOX,"Warning",string,"I Understand","");
		format(sentstring,sizeof(sentstring), ""COL_RED" %s %s has warned %s"COL_WHITE" Reason: %s (%i / 3)",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason,pInfo[targetid][pWarnings]);
		SendClientMessageToAll(-1,sentstring);

		if(pInfo[targetid][pWarnings] >= 3)
		{
			format(string, sizeof(string), ""COL_RED" %s %s has kicked %s"COL_WHITE" [Reason: %s][Three Warning Have Exceeded!]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
			SendClientMessageToAll(-1,string);
			Kick(targetid);
		}
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:givemoney(playerid,params[])
{
    if(pInfo[playerid][pLogged] == 1)
    {
		if(pInfo[playerid][pAdminLevel] >= 2)
		{
		    new targetid,givemoney,string[256];
			if(sscanf(params, "ui", targetid, givemoney)) return SendClientMessage(playerid,-1," /givezmoney [playerid] [amount]");
		    if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

            if(givemoney < -6000 || givemoney > 10000) return SendClientMessage(playerid,-1,"  You can only give zMoney between Negative 6000 - Positive 10000");
			pInfo[targetid][zMoney] += givemoney;

			format(string, sizeof(string), ""COL_RED" %s %s has given %s %d zMoney",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),givemoney);
			SendClientMessageToAll(-1,string);
		}
		else {
			SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
		}
	}
	else {
	    SendClientMessage(playerid,-1,""COL_RED" Your not logged in");
	    Kick(playerid);
	}
	return 1;
}

CMD:savestats(playerid)
{
	if(pInfo[playerid][pLogged] == 1)
    {
		SaveStats(playerid);
		SendClientMessage(playerid,-1," Saved Stats");
    }
    return 1;
}

CMD:ss(playerid) return cmd_savestats(playerid);

CMD:sharezmoney(playerid,params[])
{
	if(pInfo[playerid][pLogged] == 1)
	{
		if(pInfo[playerid][pHour] >= 1)
		{
			new targetid,givemoney,reason[105],stringmoney[256];
			if(sscanf(params,"uis[105]", targetid,givemoney,reason)) return SendClientMessage(playerid,-1," /sharezmoney [playerid] [amount] [reason]");
			if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");
			if(targetid == playerid) return SendClientMessage(playerid,-1," You cannot give zMoney to yourself");
			if (givemoney > 0 && pInfo[playerid][zMoney] >= givemoney)
			{
				pInfo[targetid][zMoney] += givemoney;
				pInfo[playerid][zMoney] -= givemoney;
				format(stringmoney,sizeof(stringmoney),""COL_LGREEN" Player %s has shared"COL_RED" z%d"COL_LGREEN" to %s [Reason: %s]", PlayerName(playerid), givemoney, PlayerName(targetid), reason);
				SendClientMessageToAll(-1,stringmoney);
			}
			else
			{
				SendClientMessage(playerid,-1," You don't have enough zMoney");
			}
		}
		else
		{
			SendClientMessage(playerid,-1," You must have atleast 1 hours ingame");
		}
	}
	return 1;
}

CMD:setweather(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2 || IsPlayerAdmin(playerid))
    {
		new weather,string[128];
		if(sscanf(params, "i", weather)) return SendClientMessage(playerid,-1," /setweather [weather id]");

		SetWeather(weather);

		if(IsPlayerAdmin(playerid))
		{
			format(string, sizeof(string), ""COL_RED" Weather Changed to %d",weather);
			SendClientMessageToAll(-1,string);
		}
		else
		{
			format(string, sizeof(string), ""COL_RED" %s %s has changed the weather to %d",GetAdminName(playerid),PlayerName(playerid),weather);
			SendClientMessageToAll(-1,string);
		}
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:ip(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 3)
    {
		new targetid,playerip[16],string[128];
		if(sscanf(params, "u", targetid, playerip)) return SendClientMessage(playerid,-1," /ip [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		GetPlayerIp(targetid, playerip, sizeof(playerip));
		format(string, sizeof(string), ""COL_RED" IP of %s %s", PlayerName(targetid), playerip);
		SendClientMessage(playerid, -1, string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:akill(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
		new targetid,string[256];
		if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1," /akill [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		SetPlayerHealth(targetid,0.0);

		format(string, sizeof(string), ""COL_RED" %s %s has killed %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:nuke(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5)
    {
		new targetid,string[256];
		if(sscanf(params, "u", targetid)) SendClientMessage(playerid,-1," /nuke [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		new Float:x,Float:y,Float:z;
		GetPlayerPos(targetid,Float:x,Float:y,Float:z);
		CreateExplosion(Float:x,Float:y,Float:z,0,5.0);

		format(string, sizeof(string), ""COL_RED" %s %s has blown up %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:get(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2)
    {
		new targetid;
		if(sscanf(params, "u", targetid)) SendClientMessage(playerid,-1," /get [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

        new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
    	SetPlayerPos(targetid, x+1, y+1, z);

		if(IsPlayerInAnyVehicle(targetid))
  		{
  		    SetVehiclePos(GetPlayerVehicleID(targetid),x,y,z);
		}
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:goto(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2)
    {
		new targetid;
		if(sscanf(params, "u", targetid)) SendClientMessage(playerid,-1," /goto [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		new Float:x,Float:y,Float:z,inter;
		GetPlayerPos(targetid,Float:x,Float:y,Float:z);
		inter = GetPlayerInterior(targetid);
        SetPlayerPos(playerid,Float:x,Float:y,Float:z);
        SetPlayerInterior(playerid, inter);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:mute(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new targetid,reason[105],string[128];
	    if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1," /mute [playerid] [reason]");
   		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		pInfo[targetid][IsPlayerMuted] = 1;

		format(string,sizeof(string),""COL_RED" %s %s muted %s [Reason: %s]", GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
		SendMessageToAllAdmins(string,-1);

		format(string,sizeof(string),""COL_RED" %s %s muted you for [Reason %s]",GetAdminName(playerid), PlayerName(playerid),reason);
		SendClientMessage(targetid,-1,string);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:unmute(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new targetid,string[128];
	    if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1," /unmute [playerid]");
   		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		if(pInfo[targetid][IsPlayerMuted] == 1)
		{
			format(string,sizeof(string),""COL_RED" %s %s unmuted you",GetAdminName(playerid),PlayerName(playerid));
			SendClientMessage(targetid,-1,string);
			format(string,sizeof(string),""COL_RED" You unmuted %s",PlayerName(targetid));
			SendClientMessage(playerid,-1,string);
			pInfo[targetid][IsPlayerMuted] = 0;
		}
		else
		{
		    SendClientMessage(playerid,-1,""COL_RED" Player isn't muted");
		}
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:spec(playerid, params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new id2;
	    if(sscanf(params,"u", id2)) return SendClientMessage(playerid,-1, ""COL_GREEN" /spec [playerid]");
	    if(id2 == playerid) return SendClientMessage(playerid,-1, ""COL_GREEN" You cannot spec yourself.");
	    if(id2 == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, ""COL_GREEN" Player not found!");
	    if(IsSpecing[playerid] == 1) return SendClientMessage(playerid,-1, ""COL_GREEN" You are already specing someone.");
	    GetPlayerPos(playerid,SpecX[playerid],SpecY[playerid],SpecZ[playerid]);
	    Inter[playerid] = GetPlayerInterior(playerid);
	    vWorld[playerid] = GetPlayerVirtualWorld(playerid);
	    TogglePlayerSpectating(playerid, true);
	    if(IsPlayerInAnyVehicle(id2))
	    {
	        if(GetPlayerInterior(id2) > 0)
	        {
	            SetPlayerInterior(playerid,GetPlayerInterior(id2));
	        }
	        if(GetPlayerVirtualWorld(id2) > 0)
	        {
	            SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id2));
	        }
	        PlayerSpectateVehicle(playerid,GetPlayerVehicleID(id2));
	    }

	    else
	    {
	        if(GetPlayerInterior(id2) > 0)
	        {
	            SetPlayerInterior(playerid,GetPlayerInterior(id2));
	        }
	        if(GetPlayerVirtualWorld(id2) > 0)
	        {
	            SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id2));
	        }
	        PlayerSpectatePlayer(playerid,id2);
	    }

		new String[150];
	    format(String, sizeof(String),""COL_LIGHTBLUE" You have started to spectate %s.",PlayerName(id2));
	    SendClientMessage(playerid,-1,String);
	    IsSpecing[playerid] = 1;
	    IsBeingSpeced[id2] = 1;
	    spectatorid[playerid] = id2;
	    SaveStats(playerid);
    }
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
    return 1;
}

CMD:specoff(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
	{
    	if(IsSpecing[playerid] == 0) return SendClientMessage(playerid,-1,""COL_RED" You are not spectating anyone.");
    	TogglePlayerSpectating(playerid, 0);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}


CMD:kick(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
		new targetid,reason[105],string[256];
		if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1," /kick [playerid] [reason]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		format(string, sizeof(string), ""COL_RED" %s %s has kicked %s"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
		SendClientMessageToAll(-1,string);

		Kick(targetid);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:clearanim(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
		new targetid,reason[105],string[256];
		if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1," /clearanim [playerid] [reason]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1," Player is not online");

		format(string, sizeof(string), ""COL_RED" %s %s has cleared %s animations"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
		SendClientMessageToAll(-1,string);

		ClearAnimations(targetid);
	}
	else {
		SendClientMessage(playerid,-1,""COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

