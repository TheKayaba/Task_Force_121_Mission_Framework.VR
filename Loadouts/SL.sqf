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
_unit addItemToUniform "ItemcTabHCam";
_unit addItemToUniform "ACE_M84";
_unit addItemToUniform "rhs_mag_m67";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_M433_HEDP";};
//_unit addVest "rhsusf_spc_squadleader";
_unit addItemToVest "ACE_Clacker";
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_m714_White";};
_unit addItemToVest "DemoCharge_Remote_Mag";
//_unit addHeadgear "rhsusf_ech_helmet_headset_ess_marpatd";

comment "Add weapons";
_unit addWeapon "rhs_weap_m4_m203";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemAndroid";