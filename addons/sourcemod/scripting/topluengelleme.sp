#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>
#include <multicolors>

#pragma semicolon 1
#pragma newdecls required

#define DEBUG
#define PLUGIN_AUTHOR "ByDexter"
#define PLUGIN_VERSION "1.0"

public Plugin myinfo = 
{
	name = "Target Authorization", 
	author = PLUGIN_AUTHOR, 
	description = "Officials without the letter Z cannot target", 
	version = PLUGIN_VERSION, 
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnPluginStart()
{
	LoadTranslations("topluengelleme.phrases.txt");
	AddCommandListener(Control_CommandX, "sm_kick");
	AddCommandListener(Control_CommandX, "sm_beacon");
	AddCommandListener(Control_CommandX, "sm_timebomb");
	AddCommandListener(Control_CommandX, "sm_burn");
	AddCommandListener(Control_CommandX, "sm_firebomb");
	AddCommandListener(Control_CommandX, "sm_freeze");
	AddCommandListener(Control_CommandX, "sm_freezebomb");
	AddCommandListener(Control_CommandX, "sm_gravity");
	AddCommandListener(Control_CommandX, "sm_blind");
	AddCommandListener(Control_CommandX, "sm_noclip");
	AddCommandListener(Control_CommandX, "sm_drug");
	AddCommandListener(Control_CommandX, "sm_slap");
	AddCommandListener(Control_CommandX, "sm_slay");
	AddCommandListener(Control_CommandX, "sm_rename");
	AddCommandListener(Control_CommandX, "sm_team");
	AddCommandListener(Control_CommandX, "sm_swap");
	AddCommandListener(Control_CommandX, "sm_hp");
	AddCommandListener(Control_CommandX, "sm_respawn");
	AddCommandListener(Control_CommandX, "sm_strip");
	AddCommandListener(Control_CommandX, "sm_stripall");
	AddCommandListener(Control_CommandX, "sm_krediver");
	AddCommandListener(Control_CommandX, "sm_givecredits");
} 

public Action Control_CommandX(int client, char []command, int args)
{
	if(client)
	{
		if(CheckCommandAccess(client, "root_admin", ADMFLAG_ROOT, false))
		{
			// Boş aynı nora gibi
		}
		else 
		{
			char arg2[192];
			char arg1[192];
			GetCmdArg(1, arg1, 192);
			GetCmdArg(1, arg2, 192);
			if (StrEqual(arg1, "@all", true) || StrEqual(arg1, "@bots", true) || StrEqual(arg1, "@alive", true) || StrEqual(arg1, "@dead", true) || StrEqual(arg1, "@humans", true) || StrEqual(arg1, "@aim", true) || StrEqual(arg1, "@!me", true) || StrEqual(arg1, "@ct", true) || StrEqual(arg1, "@t", true))
			{
				ReplyToCommand(client, "[SM] %t", "NoAccessTarget");
				return Plugin_Stop;
			}
			if (StrEqual(arg1, "@all", true) || StrEqual(arg1, "@bots", true) || StrEqual(arg1, "@alive", true) || StrEqual(arg1, "@dead", true) || StrEqual(arg1, "@humans", true) || StrEqual(arg1, "@aim", true) || StrEqual(arg1, "@!me", true) || StrEqual(arg1, "@ct", true) || StrEqual(arg1, "@t", true))
			{
				ReplyToCommand(client, "[SM] %t", "NoAccessTarget");
				return Plugin_Stop;
			}
		}
	}
	return Plugin_Continue;
}