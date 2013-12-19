/*

Zombie Hell - Generic Defines script
Created April 15 2013
Description - Variables, defines

*/


#define function%0(%1) forward%0(%1);public%0(%1)
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define HOLDING(%0) ((newkeys & (%0)) == (%0))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define GATE_EDF1 0
#define GATE_EDF2 1

#define COL_WHITE          "{FFFFFF}"
#define COL_GREY           "{C3C3C3}"
#define COL_GREEN          "{37DB45}"
#define COL_RED            "{F81414}"
#define COL_YELLOW         "{F3FF02}"
#define COL_ORANGE         "{F9B857}"
#define COL_BLUE           "{0049FF}"
#define COL_PINK           "{FF00EA}"
#define COL_LIGHTBLUE      "{00C0FF}"
#define COL_LGREEN         "{C9FFAB}"

#define COLOR_RED 0xAA333300
#define COLOR_BLUE 0x33CCFF00
#define COLOR_WHITE 0xFFFFFF00
#define COLOR_PINK 0xFFC0CB00
#define COLOR_BROWN 0xA9A9A900
#define COLOR_GREY 0xAFAFAFAA

#define XP 0
#define LEVEL 1
#define MONEY 2

#define CreatedBy "Kitten"
#define Version "Alpha 0.1"

#define MAX_ZONE_NAME 28
#define MAX_HUMAN_HEALTH 300

#define FACTION_EDF 0
#define FACTION_REBEL 1
#define FACTION_USARMY 2

#define BODY_PART_HEAD (1)
#define BODY_PART_TORSO (2)
#define BODY_PART_LEGS (3)

#define DIALOG_REGISTER 0
#define DIALOG_LOGIN 1
#define DIALOG_INTRO 2
#define DIALOG_SHOP 3
#define DIALOG_WEAPONS 4
#define DIALOG_FACTIONS 5
#define DIALOG_ADMINS 6
#define DIALOG_WARN 7

#define ARMEDBODY_USE_HEAVY_WEAPON (true)
new armedbody_pTick[MAX_PLAYERS];
new pName[24];
new playedtimer[MAX_PLAYERS];
new IntroTime[MAX_PLAYERS];
new oocSpam[MAX_PLAYERS];

new Bar:playerXP[MAX_PLAYERS];

new GateID[999];
new Float:GatePos[999][6];
new Float:GateMoveLimit[999];
new Float:GateSpeed[999];
new GateType[999];
new MAX_GATES = 0;

new PlayerText:zSign[MAX_PLAYERS];
new PlayerText:xpView[MAX_PLAYERS];
new PlayerText:playerMoney[MAX_PLAYERS];
new PlayerText:Box[MAX_PLAYERS];
new PlayerText:BoxInfo1[MAX_PLAYERS];
new PlayerText:BoxInfo2[MAX_PLAYERS];
new PlayerText:BoxInfo3[MAX_PLAYERS];
new PlayerText:BoxInfo4[MAX_PLAYERS];
new PlayerText:BoxInfo5[MAX_PLAYERS];
new PlayerText:BoxInfo6[MAX_PLAYERS];
new PlayerText:playerHealth[MAX_PLAYERS];
new PlayerText:playerHPBox[MAX_PLAYERS];

new Text:HellraizerLogo;

new Float:SpecX[MAX_PLAYERS];
new Float:SpecY[MAX_PLAYERS];
new Float:SpecZ[MAX_PLAYERS];
new vWorld[MAX_PLAYERS];
new Inter[MAX_PLAYERS];
new IsSpecing[MAX_PLAYERS];
new IsBeingSpeced[MAX_PLAYERS];
new spectatorid[MAX_PLAYERS];

enum playerinfo
{
	Username[24],
	Password[128],
	zMoney,
	pLevel,
	pXP,
	Headshots,
	PlayersKilled,
	ZombiesKilled,
	pAdminLevel,
	pPremium,
 	Float:pX,
	Float:pY,
	Float:pZ,
	pWeap1,
	pAmmo1,
	pWeap2,
	pAmmo2,
	pWeap3,
	pAmmo3,
	pWeap4,
	pAmmo4,
	pWeap5,
	pAmmo5,
	pWeap6,
	pAmmo6,
	pWeap7,
	pAmmo7,
	pWeap8,
	pAmmo8,
	pWeap9,
	pAmmo9,
	pHour,
	pMin,
	pSec,
	pHealth,
	pFirstSpawn,
	pAliveTime,
	pSkin,
	pIsInFaction,
	pFactionID,
	IfSeenIntro,
	IsPlayerSpawned,
	IsPlayerMuted,
	pPM,
	pWarnings,
	pUserID,
	pTemp,
	pProne,
	pSaveSpam,
	IsBoxLine,
	pLogged
};
new pInfo[MAX_PLAYERS][playerinfo];

