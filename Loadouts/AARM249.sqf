sleep 2;

_unit = _this select 0;

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
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
_unit addItemToUniform "ACE_M84";
_unit addItemToUniform "rhs_mag_m67";
_unit addItemToUniform "SmokeShellBlue";
//_unit addVest "rhsusf_spc_iar";
for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_200rnd_556x45_B_SAW";};
//_unit addHeadgear "rhsusf_ech_helmet_marpatd";

comment "Add weapons";
_unit addWeapon "rhs_weap_m4";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
