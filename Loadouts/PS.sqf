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
_unit addItemToUniform "ItemcTabHCam";
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_M84";
_unit addItemToUniform "rhs_mag_m67";
_unit addItemToUniform "rhs_mag_m18_green";
_unit addItemToUniform "SmokeShellOrange";
//_unit addVest "rhsusf_spc_squadleader";
_unit addItemToVest "ACE_Clacker";
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "DemoCharge_Remote_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
//_unit addBackpack "tfw_ilbe_dd_coy";
//_unit addHeadgear "rhsusf_ech_helmet_headset_marpatd";

comment "Add weapons";
_unit addWeapon "rhs_weap_m4";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
