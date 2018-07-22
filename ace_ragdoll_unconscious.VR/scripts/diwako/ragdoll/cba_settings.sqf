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
    if ((_value isEqualTo true) && !diwako_ragdoll_server_only) then {
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

[
  "diwako_ragdoll_server_only", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "CHECKBOX", // setting type
  ["Server only mode", "Sets the mod only to be required to run on server. Only vanilla Arma3 animations wil be used! This mode is only useful for the mod version, leave it disabled for script version!"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  SETTINGS, // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
  false, // data for this setting
  true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {
    params ["_value"];
    if ((_value isEqualTo true) && diwako_ragdoll_ragdolling && isServer) then {
      publicVariable "diwako_ragdoll_fnc_initRagdoll";
      publicVariable "diwako_ragdoll_fnc_animChangedEH";
      publicVariable "diwako_ragdoll_server_only";
      publicVariable "diwako_ragdoll_ragdolling";
      publicVariable "diwako_ragdoll_ai";
      [0,{
        waitUntil { !(isNil "diwako_ragdoll_fnc_initRagdoll") && !(isNil "diwako_ragdoll_fnc_animChangedEH") && !(isNil "diwako_ragdoll_server_only") && !(isNil "diwako_ragdoll_ragdolling") && !(isNil "diwako_ragdoll_ai") };
        [] call diwako_ragdoll_fnc_initRagdoll;
      }] remoteExec ["spawn",0,true];
    };
  } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;