if (!hasInterface) exitwith {};

_unit = player;

//ACE advanced throwing
disableAdvancedThrowing = ["ace_firedPlayer", {

_grenade = _this select 6;
private _throwableMag = (currentThrowable _unit) select 0;
private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");

//_unit addMagazine _throwableType;

deleteVehicle _grenade;

"safeLayer1" cutText ["SAFEZONE ACTIVE!", "PLAIN", 0];
"safeLayer1" cutFadeOut 3;

}] call CBA_fnc_addEventHandler;

//ACE vehicle fire
disableVehFire = ["ace_firedPlayerVehicle", {

_bullet = _this select 6;

deleteVehicle _bullet;

"safeLayer1" cutText ["SAFEZONE ACTIVE!", "PLAIN", 0];
"safeLayer1" cutFadeOut 3;

}] call CBA_fnc_addEventHandler;