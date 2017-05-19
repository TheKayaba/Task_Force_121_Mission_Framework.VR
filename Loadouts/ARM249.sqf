sleep 2;

_unit = _this select 0;

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
//removeAllAssignedItems _unit;
//removeUniform _unit;
//removeVest _unit;
//removeBackpack _unit;
//removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
//_unit forceAddUniform "rhs_uniform_FROG01_d";
_unit addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
_unit addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_FMJ";};
_unit addItemToUniform "rhs_mag_m67";
_unit addItemToUniform "ACE_M84";
_unit addItemToUniform "SmokeShellBlue";
//_unit addVest "rhsusf_spc_mg";
_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_200rnd_556x45_B_SAW";};
//_unit addHeadgear "rhsusf_ech_helmet_marpatd";

comment "Add weapons";
_unit addWeapon "rhs_weap_m249_pip_L";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
