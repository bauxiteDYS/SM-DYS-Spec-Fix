public Plugin myinfo = {
	name = "Dys Spec Fix",
	author = "bauxite",
	description = "Fix for spectators after map_restart",
	version = "0.1.0",
	url = "",
};

public void OnPluginStart()	
{
	if(!AddCommandListener(OnMapRestart, "map_restart"))
	{
		SetFailState("Failed to add command listener");
	}
}

public Action OnMapRestart(int client, const char[] command, int argc)
{
	for(int i = 1; i <= MaxClients; i++)
	{
		if(IsClientInGame(i) && GetClientTeam(i) == 1)
		{
			RequestFrame(SetObserverMode, i);
		}
	}
	
	return Plugin_Continue;
}

void SetObserverMode(int client)
{
	SetEntProp(client, Prop_Data, "m_iObserverMode", 7);
}
