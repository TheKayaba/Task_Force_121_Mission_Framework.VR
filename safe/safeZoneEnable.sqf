if (!hasInterface) exitwith {};

player allowDamage false;

safeZoneEH = player addEventHandler["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

	deletevehicle _projectile;
	"safeLayer1" cutText ["SAFEZONE ACTIVE!", "PLAIN", 0];
	"safeLayer1" cutFadeOut 3;
	if (_weapon isEqualTo "Throw" || {_weapon isEqualTo "Put"}) then {
		//player addMagazine _magazine;
	} else {
		private _ammo = player ammo _weapon;
		if (_ammo > 0) then {
			player setAmmo [_weapon, _ammo+1];
		} else {
			player addMagazine _magazine;
			player removeWeapon _weapon;
			player addWeapon _weapon;
		};
	};
}];

hint "You have entered the safe zone";