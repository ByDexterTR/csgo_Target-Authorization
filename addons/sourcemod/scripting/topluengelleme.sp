#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>
#include <multicolors>

#pragma semicolon 1
#pragma newdecls required

#define DEBUG
#define PLUGIN_AUTHOR "ByDexter"
#define PLUGIN_VERSION "1.1b"

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
}

void LoadConfig()
{
	KeyValues Kv = new KeyValues("ByDexter");
	
	char sBuffer[256];
	BuildPath(Path_SM, sBuffer, sizeof(sBuffer), "configs/dexter/command_list.ini");
	if (!FileToKeyValues(Kv, sBuffer)) SetFailState("%s dosyası bulunamadı.", sBuffer);
	
	if (Kv.GotoFirstSubKey())
	{
		do
		{
			if (Kv.GetSectionName(sBuffer, sizeof(sBuffer)))
			{
				AddCommandListener(Control_CommandX, sBuffer);
			}
		} 
		while (Kv.GotoNextKey());
	}
	delete Kv;
}

public void OnMapStart()
{
	LoadConfig();
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
			char arg1[192];
			GetCmdArg(1, arg1, 192);
			if (StrContains(arg1, "@all", true) || StrContains(arg1, "@bots", true) || StrContains(arg1, "@alive", true) || StrContains(arg1, "@dead", true) || StrContains(arg1, "@humans", true) || StrContains(arg1, "@aim", true) || StrContains(arg1, "@!me", true) || StrContains(arg1, "@ct", true) || StrContains(arg1, "@t", true))
			{
				ReplyToCommand(client, "[SM] %t", "NoAccessTarget");
				return Plugin_Stop;
			}
		}
	}
	return Plugin_Continue;
}