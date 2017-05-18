#include "..\f\loadout\cfgLoadouts.hpp"

class Params {
    // Radios
    // ============================================================================================

    // F3 - Radio Systems Support
    // Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

    class m_param_radios {
      title = "Radio System";
      values[] = {0,1,2};
      texts[] = {"Off","TFAR","ACRE2"};
      default = 1;
    };
    // Equipment
    class m_loadout_blufor_uniform {
      title = "BLUFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_MARPAT_WD;
    };
	// Environment
    class m_core_timeOfDay {
        title = "Time of Day:";
        values[] = {-1, 0, 1, 2, 3};
        texts[] = {"Mission Time (DEFAULT)", "Sunrise", "Noon", "Sunset", "Midnight"};
        default = -1;
    };
	class m_core_weatherSettings {
        title = "Weather:";
        values[] = {-1, 0, 1, 2, 3, 4};
        texts[] = {"Mission Weather (DEFAULT)", "Light Fog", "Fog", "Light Rain", "Rain", "Clear"};
        default = -1;
    };
    // Safestart
    class f_param_mission_timer {
        title = "Safe Start (Minutes)";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,15,20};
        texts[] = {"Off","1","2","3","4","5","6","7","8","9","10","15 (default)","20"};
        default = 15;
        code = "f_param_mission_timer = %1";
    };
    class m_missionTimelimit {
        title = "Time Limit:";
        values[] = {5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,9999};
        texts[] = {"5 minutes","10 minutes","15 minutes","20 minutes","25 minutes","30 minutes","35 minutes","40 minutes","45 minutes","50 minutes","55 minutes","60 minutes","65 minutes","70 minutes","75 minutes","80 minutes","85 minutes","90 minutes","infinite (default)"};
        default = 9999;
    };
    // Other Template Scripts
    class m_gps_markersEnabledParam {
        title = "GPS Map Markers:";
        values[] = {0,1};
        texts[] = {"Disabled (default)","Enabled"};
        default = 0;
    };
    class m_param_enableRadioPreset {
        title = "Enable Preset Radios:";
        values[] = {true,false};
        texts[] = {"Enabled","Disabled"};
        default = true;
    };
};
