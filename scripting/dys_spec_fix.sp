public Plugin myinfo = {
	name = "Dys Spec Fix",
	author = "bauxite",
	description = "Fix for spectators after map_restart",
	version = "0.1.1",
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
		
		RequestFrame(SetObserverMode, i);
	}
	
	return Plugin_Continue;
}

void SetObserverMode(int client) 
{
	if(IsClientInGame(client) && GetClientTeam(client) == 1) //need to make sure we don't set obs mode for alive players not in spec team
	{
		SetEntProp(client, Prop_Data, "m_iObserverMode", 7);
	}
}
