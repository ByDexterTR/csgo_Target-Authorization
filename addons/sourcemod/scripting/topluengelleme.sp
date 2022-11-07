#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Target Authorization", 
	author = "ByDexter", 
	description = "Officials without the letter Z cannot target", 
	version = "1.3", 
	url = "https://steamcommunity.com/id/ByDexterTR - ByDexter#5494"
};

public void OnPluginStart()
{
	LoadTranslations("topluengelleme.phrases");
}

public void OnMapStart()
{
	KeyValues Kv = new KeyValues("ByDexter");
	
	char sBuffer[256];
	BuildPath(Path_SM, sBuffer, sizeof(sBuffer), "configs/dexter/command_list.ini");
	if (!FileToKeyValues(Kv, sBuffer))SetFailState("%s dosyası bulunamadı.", sBuffer);
	
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

public Action Control_CommandX(int client, const char[] command, int args)
{
	if (client > 0 && !CheckCommandAccess(client, "not_a_command", ADMFLAG_ROOT, true))
	{
		char arg1[12];
		GetCmdArg(1, arg1, 12);
		if (strncmp(arg1, "@all", 4) == 0 || strncmp(arg1, "@bots", 5) == 0 || strncmp(arg1, "@alive", 6) == 0 || strncmp(arg1, "@dead", 5) == 0 || strncmp(arg1, "@humans", 7) == 0 || strncmp(arg1, "@aim", 4) == 0 || strncmp(arg1, "@!me", 4) == 0 || strncmp(arg1, "@ct", 3) == 0 || strncmp(arg1, "@t", 2) == 0)
		{
			ReplyToCommand(client, "[SM] %t", "NoAccessTarget");
			return Plugin_Stop;
		}
	}
	return Plugin_Continue;
} 