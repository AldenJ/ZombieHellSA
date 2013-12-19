/*

Zombie Hell - Textdraws script
Created April 22 2013
Description - Player/Global textdraws creation.

*/


stock CreatePlayerTD(playerid)
{
	xpView[playerid] = CreatePlayerTextDraw(playerid,158.000000, 426.000000, "~w~ 0 /~r~ 0 XP~w~ | LEVEL:~p~ 0");
	PlayerTextDrawBackgroundColor(playerid,xpView[playerid], 255);
	PlayerTextDrawFont(playerid,xpView[playerid], 2);
	PlayerTextDrawLetterSize(playerid,xpView[playerid], 0.149998, 1.000000);
	PlayerTextDrawColor(playerid,xpView[playerid], -1);
	PlayerTextDrawSetOutline(playerid,xpView[playerid], 1);
	PlayerTextDrawSetProportional(playerid,xpView[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,xpView[playerid], 0);

	playerHPBox[playerid] = CreatePlayerTextDraw(playerid,495.000000, 79.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,playerHPBox[playerid], 255);
	PlayerTextDrawFont(playerid,playerHPBox[playerid], 1);
	PlayerTextDrawLetterSize(playerid,playerHPBox[playerid], 0.500000, 2.299999);
	PlayerTextDrawColor(playerid,playerHPBox[playerid], -1);
	PlayerTextDrawSetOutline(playerid,playerHPBox[playerid], 0);
	PlayerTextDrawSetProportional(playerid,playerHPBox[playerid], 1);
	PlayerTextDrawSetShadow(playerid,playerHPBox[playerid], 1);
	PlayerTextDrawUseBox(playerid,playerHPBox[playerid], 1);
	PlayerTextDrawBoxColor(playerid,playerHPBox[playerid], 255);
	PlayerTextDrawTextSize(playerid,playerHPBox[playerid], 610.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,playerHPBox[playerid], 0);

	zSign[playerid] = CreatePlayerTextDraw(playerid,493.000000, 73.000000, "~r~z");
	PlayerTextDrawBackgroundColor(playerid,zSign[playerid], 255);
	PlayerTextDrawFont(playerid,zSign[playerid], 0);
	PlayerTextDrawLetterSize(playerid,zSign[playerid], 1.260000, 2.499999);
	PlayerTextDrawColor(playerid,zSign[playerid], -1);
	PlayerTextDrawSetOutline(playerid,zSign[playerid], 1);
	PlayerTextDrawSetProportional(playerid,zSign[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,zSign[playerid], 0);

	playerMoney[playerid] = CreatePlayerTextDraw(playerid,512.000000, 76.000000, "00000000");
	PlayerTextDrawBackgroundColor(playerid,playerMoney[playerid], 255);
	PlayerTextDrawFont(playerid,playerMoney[playerid], 3);
	PlayerTextDrawLetterSize(playerid,playerMoney[playerid], 0.570000, 2.600000);
	PlayerTextDrawColor(playerid,playerMoney[playerid], 1266631167);
	PlayerTextDrawSetOutline(playerid,playerMoney[playerid], 1);
	PlayerTextDrawSetProportional(playerid,playerMoney[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,playerMoney[playerid], 0);

    Box[playerid] = CreatePlayerTextDraw(playerid,514.000000, 370.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,Box[playerid], 255);
	PlayerTextDrawFont(playerid,Box[playerid], 1);
	PlayerTextDrawLetterSize(playerid,Box[playerid], 0.400000, 8.000000);
	PlayerTextDrawColor(playerid,Box[playerid], -1);
	PlayerTextDrawSetOutline(playerid,Box[playerid], 0);
	PlayerTextDrawSetProportional(playerid,Box[playerid], 1);
	PlayerTextDrawSetShadow(playerid,Box[playerid], 1);
	PlayerTextDrawUseBox(playerid,Box[playerid], 1);
	PlayerTextDrawBoxColor(playerid,Box[playerid], 120);
	PlayerTextDrawTextSize(playerid,Box[playerid], 635.000000, -4.000000);
	PlayerTextDrawSetSelectable(playerid,Box[playerid], 0);

	BoxInfo1[playerid] = CreatePlayerTextDraw(playerid,514.000000, 371.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,BoxInfo1[playerid], 255);
	PlayerTextDrawFont(playerid,BoxInfo1[playerid], 2);
	PlayerTextDrawLetterSize(playerid,BoxInfo1[playerid], 0.310000, 0.899999);
	PlayerTextDrawColor(playerid,BoxInfo1[playerid], -1);
	PlayerTextDrawSetOutline(playerid,BoxInfo1[playerid], 0);
	PlayerTextDrawSetProportional(playerid,BoxInfo1[playerid], 1);
	PlayerTextDrawSetShadow(playerid,BoxInfo1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,BoxInfo1[playerid], 0);

	BoxInfo2[playerid] = CreatePlayerTextDraw(playerid,514.000000, 382.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,BoxInfo2[playerid], 255);
	PlayerTextDrawFont(playerid,BoxInfo2[playerid], 2);
	PlayerTextDrawLetterSize(playerid,BoxInfo2[playerid], 0.310000, 0.899999);
	PlayerTextDrawColor(playerid,BoxInfo2[playerid], -1);
	PlayerTextDrawSetOutline(playerid,BoxInfo2[playerid], 0);
	PlayerTextDrawSetProportional(playerid,BoxInfo2[playerid], 1);
	PlayerTextDrawSetShadow(playerid,BoxInfo2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,BoxInfo2[playerid], 0);

	BoxInfo3[playerid] = CreatePlayerTextDraw(playerid,514.000000, 392.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,BoxInfo3[playerid], 255);
	PlayerTextDrawFont(playerid,BoxInfo3[playerid], 2);
	PlayerTextDrawLetterSize(playerid,BoxInfo3[playerid], 0.310000, 0.899999);
	PlayerTextDrawColor(playerid,BoxInfo3[playerid], -1);
	PlayerTextDrawSetOutline(playerid,BoxInfo3[playerid], 0);
	PlayerTextDrawSetProportional(playerid,BoxInfo3[playerid], 1);
	PlayerTextDrawSetShadow(playerid,BoxInfo3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,BoxInfo3[playerid], 0);

	BoxInfo4[playerid] = CreatePlayerTextDraw(playerid,514.000000, 403.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,BoxInfo4[playerid], 255);
	PlayerTextDrawFont(playerid,BoxInfo4[playerid], 2);
	PlayerTextDrawLetterSize(playerid,BoxInfo4[playerid], 0.310000, 0.899999);
	PlayerTextDrawColor(playerid,BoxInfo4[playerid], -1);
	PlayerTextDrawSetOutline(playerid,BoxInfo4[playerid], 0);
	PlayerTextDrawSetProportional(playerid,BoxInfo4[playerid], 1);
	PlayerTextDrawSetShadow(playerid,BoxInfo4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,BoxInfo4[playerid], 0);

	BoxInfo5[playerid] = CreatePlayerTextDraw(playerid,514.000000, 415.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,BoxInfo5[playerid], 255);
	PlayerTextDrawFont(playerid,BoxInfo5[playerid], 2);
	PlayerTextDrawLetterSize(playerid,BoxInfo5[playerid], 0.310000, 0.899999);
	PlayerTextDrawColor(playerid,BoxInfo5[playerid], -1);
	PlayerTextDrawSetOutline(playerid,BoxInfo5[playerid], 0);
	PlayerTextDrawSetProportional(playerid,BoxInfo5[playerid], 1);
	PlayerTextDrawSetShadow(playerid,BoxInfo5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,BoxInfo5[playerid], 0);

	BoxInfo6[playerid] = CreatePlayerTextDraw(playerid,514.000000, 426.000000, "~n~");
	PlayerTextDrawBackgroundColor(playerid,BoxInfo6[playerid], 255);
	PlayerTextDrawFont(playerid,BoxInfo6[playerid], 2);
	PlayerTextDrawLetterSize(playerid,BoxInfo6[playerid], 0.310000, 0.899999);
	PlayerTextDrawColor(playerid,BoxInfo6[playerid], -1);
	PlayerTextDrawSetOutline(playerid,BoxInfo6[playerid], 0);
	PlayerTextDrawSetProportional(playerid,BoxInfo6[playerid], 1);
	PlayerTextDrawSetShadow(playerid,BoxInfo6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,BoxInfo6[playerid], 0);

	playerHealth[playerid] = CreatePlayerTextDraw(playerid,576.000000, 67.000000, "Player HP:~r~ 0");
	PlayerTextDrawAlignment(playerid,playerHealth[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,playerHealth[playerid], 255);
	PlayerTextDrawFont(playerid,playerHealth[playerid], 2);
	PlayerTextDrawLetterSize(playerid,playerHealth[playerid], 0.190000, 1.000000);
	PlayerTextDrawColor(playerid,playerHealth[playerid], -1);
	PlayerTextDrawSetOutline(playerid,playerHealth[playerid], 0);
	PlayerTextDrawSetProportional(playerid,playerHealth[playerid], 1);
	PlayerTextDrawSetShadow(playerid,playerHealth[playerid], 1);
	PlayerTextDrawUseBox(playerid,playerHealth[playerid], 1);
	PlayerTextDrawBoxColor(playerid,playerHealth[playerid], 255);
	PlayerTextDrawTextSize(playerid,playerHealth[playerid], 600.000000, 68.000000);
	PlayerTextDrawSetSelectable(playerid,playerHealth[playerid], 0);
	return 1;
}

stock CreateGlobalTD()
{
	HellraizerLogo = TextDrawCreate(15.000000, 427.000000, "Project Zombie Hell");
	TextDrawBackgroundColor(HellraizerLogo, 255);
	TextDrawFont(HellraizerLogo, 0);
	TextDrawLetterSize(HellraizerLogo, 0.449999, 1.700000);
	TextDrawColor(HellraizerLogo, -16776961);
	TextDrawSetOutline(HellraizerLogo, 0);
	TextDrawSetProportional(HellraizerLogo, 1);
	TextDrawSetShadow(HellraizerLogo, 1);
	TextDrawSetSelectable(HellraizerLogo, 0);
	return 1;
}

stock DestroyGlobalTD()
{
	TextDrawHideForAll(HellraizerLogo);
	TextDrawDestroy(HellraizerLogo);
	return 1;
}

