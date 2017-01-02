state("Bastion")
{
	string26 m_nextMap : "steam_api.dll", 0x00019250, 0xa4, 0x3b8, 0x32c, 0x310, 0x78;
	byte m_allowInput : "steam_api.dll", 0x0001924C, 0x138, 0x54, 0x1c0, 0x300, 0x2ec;
}

startup
{
	//Runs on script load
	refreshRate = 60;
	//Load settings
	settings.Add("town", true, "Split upon returning to The Bastion");
	settings.Add("rockinsky", false, "Split Rock in the Sky");
	settings.Add("langston", true, "Split when entering Prosper");
	settings.Add("ura", true, "Split after Burstone Quarry");
	settings.Add("tazal", true, "Split Tazal I");
	settings.Add("start", true, "Begin Splits");
	settings.Add("end", true, "End Splits");
	settings.Add("reset", true, "Auto Reset");
}

init
{
	//Runs upon hooking onto game.
	vars.oldLevel = "ProtoIntro01";
}

update
{
}

start
{
	if (settings["start"] && vars.oldLevel.Equals("ProtoIntro01") && old.m_allowInput == 0 && current.m_allowInput == 1)
		return true;
}

reset
{
	if (settings["reset"] && current.m_nextMap.Contains("ProtoIntro01") && !vars.oldLevel.Contains("ProtoIntro01")) {
		vars.oldLevel = "ProtoIntro01";
		return true;
	}
}

split {
	// Runs every refresh when splits are active
	// print("m_nextMap : " + current.m_nextMap);
	
	//Final Split!
	if (settings["end"] && vars.oldLevel.Equals("End01") && old.m_allowInput == 1 && current.m_allowInput == 0)
		return true;
		
	//Update our current level and split if appropriate
	else if (current.m_nextMap.Contains("ProtoIntro01a") && !vars.oldLevel.Contains("ProtoIntro01a")) {
		vars.oldLevel = "ProtoIntro01a";
		return false;
	}
	else if (current.m_nextMap.Contains("ProtoIntro01b") && !vars.oldLevel.Contains("ProtoIntro01b")) {
		vars.oldLevel = "ProtoIntro01b";
		if (settings["rockinsky"])
			return true;
		return false;
	}
	else if (current.m_nextMap.Contains("ProtoTown03") && !vars.oldLevel.Contains("ProtoTown03")) {
		if (!vars.oldLevel.Equals("Attack01") && settings["town"])
			{
			vars.oldLevel = "ProtoTown03";
			return true;
			}
			
		vars.oldLevel = "ProtoTown03";
		return false;
	}
	else if (current.m_nextMap.Contains("Crossroads01") && !vars.oldLevel.Contains("Crossroads01")) {
		vars.oldLevel = "Crossroads01";
		return false;
	}
	else if (current.m_nextMap.Contains("Holdout01") && !vars.oldLevel.Contains("Holdout01")) {
		vars.oldLevel = "Holdout01";
		return false;
	}
	else if (current.m_nextMap.Contains("Falling01") && !vars.oldLevel.Contains("Falling01")) {
		vars.oldLevel = "Falling01";
		return false;
	}
	else if (current.m_nextMap.Contains("Survivor01") && !vars.oldLevel.Contains("Survivor01")) {
		vars.oldLevel = "Survivor01";
		return false;
	}
	else if (current.m_nextMap.Contains("Siege01") && !vars.oldLevel.Contains("Siege01")) {
		vars.oldLevel = "Siege01";
		return false;
	}
	else if (current.m_nextMap.Contains("Shrine01") && !vars.oldLevel.Contains("Shrine01")) {
		vars.oldLevel = "Shrine01";
		return false;
	}
	else if (current.m_nextMap.Contains("Moving01") && !vars.oldLevel.Contains("Moving01")) {
		vars.oldLevel = "Moving01";
		return false;
	}
	else if (current.m_nextMap.Contains("Survivor02") && !vars.oldLevel.Contains("Survivor02")) {
		vars.oldLevel = "Survivor02";
		if (settings["langston"])
			return true;

		return false;
	}
	else if (current.m_nextMap.Contains("Crossroads02") && !vars.oldLevel.Contains("Crossroads02")) {
		vars.oldLevel = "Crossroads02";
		return false;
	}
	else if (current.m_nextMap.Contains("Scenes02") && !vars.oldLevel.Contains("Scenes02")) {
		vars.oldLevel = "Scenes02";
		return false;
	}
	else if (current.m_nextMap.Contains("Scenes01") && !vars.oldLevel.Contains("Scenes01")) {
		vars.oldLevel = "Scenes01";
		return false;
	}
	else if (current.m_nextMap.Contains("Hunt01") && !vars.oldLevel.Contains("Hunt01")) {
		vars.oldLevel = "Hunt01";
		return false;
	}
	else if (current.m_nextMap.Contains("Platforms01") && !vars.oldLevel.Contains("Platforms01")) {
		vars.oldLevel = "Platforms01";
		return false;
	}
	else if (current.m_nextMap.Contains("Scorched01") && !vars.oldLevel.Contains("Scorched01")) {
		vars.oldLevel = "Scorched01";
		return false;
	}
	else if (current.m_nextMap.Contains("Fortress01") && !vars.oldLevel.Contains("Fortress01")) {
		vars.oldLevel = "Fortress01";
		return false;
	}
	else if (current.m_nextMap.Contains("Gauntlet01") && !vars.oldLevel.Contains("Gauntlet01")) {
		vars.oldLevel = "Gauntlet01";
		return false;
	}
	else if (current.m_nextMap.Contains("Attack01") && !vars.oldLevel.Contains("Attack01")) {
		vars.oldLevel = "Attack01";
		if (settings["ura"])
			return true;
		return false;
	}
	else if (current.m_nextMap.Contains("Voyage01") && !vars.oldLevel.Contains("Voyage01")) {
		vars.oldLevel = "Voyage01";
		return false;
	}
	else if (current.m_nextMap.Contains("Rescue01") && !vars.oldLevel.Contains("Rescue01")) {
		vars.oldLevel = "Rescue01";
		return false;
	}
	else if (current.m_nextMap.Contains("FinalArena01") && !vars.oldLevel.Contains("FinalArena01")) {
		vars.oldLevel = "FinalArena01";
		return false;
	}
	else if (current.m_nextMap.Contains("FinalChase01") && !vars.oldLevel.Contains("FinalChase01")) {
		vars.oldLevel = "FinalChase01";
		return false;
	}
	else if (current.m_nextMap.Contains("FinalRam01") && !vars.oldLevel.Contains("FinalRam01")) {
		vars.oldLevel = "FinalRam01";
		if (settings["tazal"])
			return true;
		return false;
	}
	else if (current.m_nextMap.Contains("FinalZulf01") && !vars.oldLevel.Contains("FinalZulf01")) {
		vars.oldLevel = "FinalZulf01";
		return false;
	}
	else if (current.m_nextMap.Contains("End01") && !vars.oldLevel.Contains("End01")) {
		vars.oldLevel = "End01";
		return false;
	}
}