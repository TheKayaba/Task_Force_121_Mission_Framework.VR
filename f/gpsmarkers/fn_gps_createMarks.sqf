//_this select 0 params [m_ignoreMarkerArray];
//FUNCTIONS
fn_m_createVehMarks={
    private ["_vehArray","_markerName","_markerPos","_markerFaction","_marker","_markerString","_vehSide","_veh","_type"];
    _vehArray = _this select 0;
    { //forEach _vehArray
        _veh = _x select 0;
        _type = (_x select 1)+1;
        _markerName = str(_veh) + "_marker";
        _markerPos = getPos _veh;
        _vehSide = _veh getVariable ["m_vehSide",(side player)];
        _markerFaction = switch (_vehSide) do {
            case west: { ["ColorBLUFOR","b_armor","b_air","b_plane","b_unknown"] };
            case east: { ["ColorOPFOR","b_armor","b_air","b_plane","b_unknown"] };
            case independent: { ["ColorGUER","b_armor","b_air","b_plane","b_unknown"] };
            default { ["ColorCivilian","c_car","c_air","c_plane","c_unknown"] };
        };
        _marker = createMarkerLocal [_markerName,_markerPos];
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerColorLocal (_markerFaction select 0);
        _marker setMarkerTypeLocal (_markerFaction select _type);
        _markerString = _veh getVariable "m_MarkerName";
        if (!isNil "_markerString") then {
            _marker setMarkerTextLocal _markerString;
        } else {
            _marker setMarkerTextLocal str(_veh);
            _veh setVariable ["m_MarkerName",str(_veh)];
        };
        _marker setMarkerSizeLocal [.75,.75];
        _marker setMarkerAlphaLocal 0;
    } forEach _vehArray;
};

_sizeMarkOptions = ["group_0","group_2","group_3","group_4","Empty"]; //Creates NATO pips above unit markers. If the unit's size isn't set it displays no pip
m_gps_iteration = 0;

//CREATE NEW MARKERS
//Infantry
{ //forEach allGroups
    private _groupIdent = _x getVariable ["m_groupIdentifier",groupID _x];
    if !( ((_groupIdent) in m_ignoreMarkerArray) || {((groupID _x) in m_ignoreMarkerArray)} ) then {
        _markerName = str(m_gps_iteration) + "_marker";
        _groupSize = _x getVariable ["m_gps_groupSize",4];
        _x setVariable ["m_gps_markerName",_markerName];
        _markerPos = getPos (leader _x);
        _markerFaction = switch (side (leader _x)) do {
            case west: { ["ColorBLUFOR","b_inf","b_hq"] };
            case east: { ["ColorOPFOR","b_inf","b_hq"] };
            case independent: { ["ColorGUER","b_inf","b_hq"] };
            default { ["ColorCivilian","mil_box","mil_triangle"] };
        };
        _marker = createMarkerLocal [_markerName,_markerPos];
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerColorLocal (_markerFaction select 0);
        _marker setMarkerTypeLocal (_markerFaction select 1);
        _marker setMarkerAlphaLocal 0;
        _marker setMarkerSizeLocal [.75,.75];
        _marker setMarkerTextLocal (groupID _x);
        //Group Size Marker
        _markerName2 = _markerName + "Size";
        _sizeMarker = createMarkerLocal [_markerName2,_markerPos];
        _sizeMarker setMarkerShapeLocal "ICON";
        _sizeMarker setMarkerTypeLocal (_sizeMarkOptions select _groupSize);
        _sizeMarker setMarkerSizeLocal [.75,.75];
        _sizeMarker setMarkerAlphaLocal 0;
        
        m_gps_iteration = m_gps_iteration + 1;
    };
} forEach allGroups;

//Vehicles
if (!isNil "m_sideVehArray") then {[m_sideVehArray] call fn_m_createVehMarks;};
//DONE CREATING MARKERS

m_gps_iteration = nil; //might as well destroy this variable since it's not used again

m_gpsHandle = [m_fnc_gps_updateMarks, 2, []] call CBA_fnc_addPerFrameHandler;