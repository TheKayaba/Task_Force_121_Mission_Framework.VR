//if (isServer) then {m_fnc_init_server call CBA_fnc_directCall;};

if (hasInterface) then {
	[{!isNull player}, {call m_fnc_init_client;}, []] call CBA_fnc_waitUntilAndExecute;
};