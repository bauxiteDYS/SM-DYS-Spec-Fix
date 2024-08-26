public Plugin myinfo = {
	name = "Dys Spec Fix",
	author = "bauxite",
	description = "Fix for spectators after map_restart",
	version = "0.2.0",
	url = "",
};

public void OnPluginStart()	
{
	if(!HookEventEx("round_restart", OnRoundStart, EventHookMode_PostNoCopy))
	{
		SetFailState("Failed to hook event");
	}
}

public void OnRoundStart(Event event, const char[] name, bool dontBroadcast)
{
	//PrintToServer("map restart event");
	
	RequestFrame(SetObserverMode);
}

void SetObserverMode() 
{
	//need to make sure we don't set obs mode for players not in spec team
	
	for(int client = 1; client <= MaxClients; client++)
	{
		if(IsClientInGame(client) && GetClientTeam(client) == 1) 
		{
			SetEntProp(client, Prop_Data, "m_iObserverMode", 7);
		}
	}
}
