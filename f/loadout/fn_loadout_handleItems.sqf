if (isNil "m_loadout_unitLevel") then {
    m_loadout_unitLevel = 0;
};

// Radio
if (m_loadout_radio <= m_loadout_unitLevel) then {
    if !("ItemRadio" in (assignedItems player)) then {
        player linkItem "ItemRadio";
    };
} else {
    player unlinkItem "ItemRadio";
};

// Map
if (m_loadout_map <= m_loadout_unitLevel) then {
    if !("ItemMap" in (assignedItems player)) then {
        player linkItem "ItemMap";
    };
} else {
    player unlinkItem "ItemMap";
    player unlinkItem "ItemGPS";
};

// GPS
if (m_loadout_gps <= m_loadout_unitLevel) then {
    if !("ItemGPS" in (assignedItems player)) then {
        player linkItem "ItemGPS";
    };
} else {
    player unlinkItem "ItemGPS";
};

// Watch
if (m_loadout_watch <= m_loadout_unitLevel) then {
    if !("ItemWatch" in (assignedItems player)) then {
        player linkItem "ItemWatch";
    };
} else {
    player unlinkItem "ItemWatch";
};

// Compass
if (m_loadout_compass <= m_loadout_unitLevel) then {
    if !("ItemCompass" in (assignedItems player)) then {
        player linkItem "ItemCompass";
    };
} else {
    player unlinkItem "ItemCompass";
};

// Binocular
m_loadout_binocularArray = ["Binocular", "Laserdesignator_02", "Laserdesignator_03","Laserdesignator", "lerca_1200_black", "lerca_1200_tan", "Leupold_Mk4", "rhs_pdu4", "Rangefinder", "rhs_tr8_periscope", "rhs_tr8_periscope_pip"]; // An array of all binocular classnames in the modset
if ((missionNamespace getVariable ["m_loadout_addBinocular",false]) isEqualType "") then {
    private _hasBinocular = false;
    {
        if (_x in (weapons player)) then {
            if (_x isEqualTo m_loadout_addBinocular) then {
                _hasBinocular = true;
            } else {
                player removeWeapon _x;
            };
        };
    } forEach m_loadout_binocularArray;
    if !(_hasBinocular) then {
        player addWeapon m_loadout_addBinocular;
    };
} else {
    {
        if (_x in (weapons player)) then {
            player removeWeapon _x;
        };
    } forEach m_loadout_binocularArray;
};

// NVG
m_loadout_nvgoggleArray = ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "rhsusf_ANPVS_15", "rhsusf_ANPVS_14", "rhs_1PN138"]; // An array of all NVG classnames in the modset
if ((missionNamespace getVariable ["m_loadout_addNVG",false]) isEqualType "") then {
    private _hasNVG = false;
    {
        if (_x in (assignedItems player)) then {
            if (_x isEqualTo m_loadout_addNVG) then {
                _hasNVG = true;
            } else {
                player unlinkItem _x;
            };
        };
    } forEach m_loadout_nvgoggleArray;
    if !(_hasNVG) then {
        player linkItem m_loadout_addNVG;
    };
} else {
    {
        if (_x in (assignedItems player)) then {
            player unlinkItem _x;
        };
    } forEach m_loadout_nvgoggleArray;
};

// Flashlight
if ((missionNamespace getVariable ["m_loadout_addAttachment",false]) isEqualType "") then {
    player addPrimaryWeaponItem m_loadout_addAttachment;
};
