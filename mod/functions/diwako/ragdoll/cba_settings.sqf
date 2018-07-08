#define SETTINGS "Diwako's ACE Ragdolling"

[
  "diwako_ragdoll_ragdolling", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "CHECKBOX", // setting type
  ["Enable ragdolling", "Enables ragdolling for players upon going unconscious"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  SETTINGS, // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
  false, // data for this setting
  true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {
      params ["_value"];
      if (_value isEqualTo true) then {
          [] call diwako_ragdoll_fnc_initRagdoll;
      };
  } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
  "diwako_ragdoll_ai", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "CHECKBOX", // setting type
  ["Enable for AI", "Enables ragdolling for AI as well"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  SETTINGS, // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
  false, // data for this setting
  true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;