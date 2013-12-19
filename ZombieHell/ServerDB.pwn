/*

Zombie Hell - Server DB
Created April 21 2013
Description - User Stats database creation

*/


function DatabaseInit()
{
   	BUD::Setting(opt.Database, "ZombieHell_Users.db");
	BUD::Setting(opt.Asynchronous, true);
	BUD::Setting(opt.KeepAliveTime, 3000);
	BUD::Setting(opt.CheckForUpdates, true);
	BUD::Initialize();

	BUD::VerifyColumn("zMoney", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("pLevel", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("pXP", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("Headshots", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("PlayersKilled", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("ZombiesKilled", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("pAdminLevel", BUD::TYPE_NUMBER);
	BUD::VerifyColumn("pPremium", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pX", BUD::TYPE_FLOAT);
    BUD::VerifyColumn("pY", BUD::TYPE_FLOAT);
    BUD::VerifyColumn("pZ", BUD::TYPE_FLOAT);
    BUD::VerifyColumn("pWeap1", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo1", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap2", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo2", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap3", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo3", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap4", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo4", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap5", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo5", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap6", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo6", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap7", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo7", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap8", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo8", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pWeap9", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAmmo9", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pHour", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pMin", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pSec", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pHealth", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pFirstSpawn", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pAliveTime", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pSkin", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pIsInFaction", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("pFactionID", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("IfSeenIntro", BUD::TYPE_NUMBER);
    BUD::VerifyColumn("IP", BUD::TYPE_STRING);

    print("[Zombie Hell SQL] Connected Succesfully`");
	return 1;
}

function DatabaseExit()
{
    BUD::Exit();
    return 1;
}

function ReturnID(playerid)
{
	return BUD::GetNameUID(PlayerName(playerid));
}

function SaveStats(playerid)
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,Float:x,Float:y,Float:z);
	
	GetPlayerWeaponData(playerid, 1, pInfo[playerid][pWeap1], pInfo[playerid][pAmmo1]);
	GetPlayerWeaponData(playerid, 2, pInfo[playerid][pWeap2], pInfo[playerid][pAmmo2]);
	GetPlayerWeaponData(playerid, 3, pInfo[playerid][pWeap3], pInfo[playerid][pAmmo3]);
	GetPlayerWeaponData(playerid, 4, pInfo[playerid][pWeap4], pInfo[playerid][pAmmo4]);
	GetPlayerWeaponData(playerid, 5, pInfo[playerid][pWeap5], pInfo[playerid][pAmmo5]);
	GetPlayerWeaponData(playerid, 6, pInfo[playerid][pWeap6], pInfo[playerid][pAmmo6]);
	GetPlayerWeaponData(playerid, 7, pInfo[playerid][pWeap7], pInfo[playerid][pAmmo7]);
	GetPlayerWeaponData(playerid, 8, pInfo[playerid][pWeap8], pInfo[playerid][pAmmo8]);
	GetPlayerWeaponData(playerid, 9, pInfo[playerid][pWeap9], pInfo[playerid][pAmmo9]);

    BUD::MultiSet(ReturnID(playerid),"iiiiiiiifffiiiiiiiiiiiiiiiiiiiiiiiiiiii",
	"zMoney", pInfo[playerid][zMoney],
	"pLevel", pInfo[playerid][pLevel],
	"pXP", pInfo[playerid][pXP],
	"Headshots", pInfo[playerid][Headshots],
	"PlayersKilled", pInfo[playerid][PlayersKilled],
	"ZombiesKilled", pInfo[playerid][ZombiesKilled],
	"pAdminLevel", pInfo[playerid][pAdminLevel],
	"pPremium", pInfo[playerid][pPremium],
	"pX", x,
	"pY", y,
	"pZ", z,
	"pWeap1", pInfo[playerid][pWeap1],
	"pAmmo1", pInfo[playerid][pAmmo1],
	"pWeap2", pInfo[playerid][pWeap2],
	"pAmmo2", pInfo[playerid][pAmmo2],
	"pWeap3", pInfo[playerid][pWeap3],
	"pAmmo3", pInfo[playerid][pAmmo3],
	"pWeap4", pInfo[playerid][pWeap4],
	"pAmmo4", pInfo[playerid][pAmmo4],
	"pWeap5", pInfo[playerid][pWeap5],
	"pAmmo5", pInfo[playerid][pAmmo5],
	"pWeap6", pInfo[playerid][pWeap6],
	"pAmmo6", pInfo[playerid][pAmmo6],
	"pWeap7", pInfo[playerid][pWeap7],
	"pAmmo7", pInfo[playerid][pAmmo7],
	"pWeap8", pInfo[playerid][pWeap8],
	"pAmmo8", pInfo[playerid][pAmmo8],
	"pWeap9", pInfo[playerid][pWeap9],
	"pAmmo9", pInfo[playerid][pAmmo9],
	"pHour", pInfo[playerid][pHour],
	"pMin", pInfo[playerid][pMin],
	"pSec", pInfo[playerid][pSec],
	"pHealth", pInfo[playerid][pHealth],
	"pFirstSpawn", pInfo[playerid][pFirstSpawn],
	"pAliveTime", pInfo[playerid][pAliveTime],
	"pSkin", GetPlayerSkin(playerid),
	"pIsInFaction", pInfo[playerid][pIsInFaction],
	"pFactionID", pInfo[playerid][pFactionID],
	"IfSeenIntro", pInfo[playerid][IfSeenIntro]);
	printf("Called saved");
	return 1;
}

function LoadPlayerStats(playerid)
{
	BUD::MultiGet(ReturnID(playerid),"iiiiiiiifffiiiiiiiiiiiiiiiiiiiiiiiiiiii",
	"zMoney", pInfo[playerid][zMoney],
	"pLevel", pInfo[playerid][pLevel],
	"pXP", pInfo[playerid][pXP],
	"Headshots", pInfo[playerid][Headshots],
	"PlayersKilled", pInfo[playerid][PlayersKilled],
	"ZombiesKilled", pInfo[playerid][ZombiesKilled],
	"pAdminLevel", pInfo[playerid][pAdminLevel],
	"pPremium", pInfo[playerid][pPremium],
	"pX", pInfo[playerid][pX],
	"pY", pInfo[playerid][pY],
	"pZ", pInfo[playerid][pZ],
	"pWeap1", pInfo[playerid][pWeap1],
	"pAmmo1", pInfo[playerid][pAmmo1],
	"pWeap2", pInfo[playerid][pWeap2],
	"pAmmo2", pInfo[playerid][pAmmo2],
	"pWeap3", pInfo[playerid][pWeap3],
	"pAmmo3", pInfo[playerid][pAmmo3],
	"pWeap4", pInfo[playerid][pWeap4],
	"pAmmo4", pInfo[playerid][pAmmo4],
	"pWeap5", pInfo[playerid][pWeap5],
	"pAmmo5", pInfo[playerid][pAmmo5],
	"pWeap6", pInfo[playerid][pWeap6],
	"pAmmo6", pInfo[playerid][pAmmo6],
	"pWeap7", pInfo[playerid][pWeap7],
	"pAmmo7", pInfo[playerid][pAmmo7],
	"pWeap8", pInfo[playerid][pWeap8],
	"pAmmo8", pInfo[playerid][pAmmo8],
	"pWeap9", pInfo[playerid][pWeap9],
	"pAmmo9", pInfo[playerid][pAmmo9],
	"pHour", pInfo[playerid][pHour],
	"pMin", pInfo[playerid][pMin],
	"pSec", pInfo[playerid][pSec],
	"pHealth", pInfo[playerid][pHealth],
	"pFirstSpawn", pInfo[playerid][pFirstSpawn],
	"pAliveTime", pInfo[playerid][pAliveTime],
	"pSkin", pInfo[playerid][pSkin],
	"pIsInFaction", pInfo[playerid][pIsInFaction],
	"pFactionID", pInfo[playerid][pFactionID],
	"IfSeenIntro", pInfo[playerid][IfSeenIntro]);

    pInfo[playerid][pLogged] = 1;
	if(pInfo[playerid][IfSeenIntro] == 0)
	{
	    ShowPlayerDialog(playerid, DIALOG_INTRO, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Server Intro", ""COL_WHITE"Would you like to listen to the server intro?", "Yes", "No");
	}

	if(pInfo[playerid][IfSeenIntro] == 1 || pInfo[playerid][IfSeenIntro] == 3)
	{
	    defer SpawnEx(playerid);
	}

    playedtimer[playerid] = SetTimerEx("TimeOnServer", 1000, 1, "i", playerid);
    ClearChatPlayer(playerid);
    return 1;
}
