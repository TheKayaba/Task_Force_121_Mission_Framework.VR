if (!hasInterface) exitwith {};

player allowDamage true;

player removeEventHandler ["Fired", safeZoneEH];

["ace_firedPlayer", disableAdvancedThrowing] call CBA_fnc_removeEventHandler;

["ace_firedPlayerVehicle", disableVehFire] call CBA_fnc_removeEventHandler;

hint "You have exited the safe zone";