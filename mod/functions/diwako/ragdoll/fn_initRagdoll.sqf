/*
  Author: diwako

  Description:
  Adds ragdolling for players upon going unconscious

  Parameter(s):
  none

  Examples:
  (begin)
    [] call diwako_ragdoll_fnc_initRagdoll;
  (end)

  Returns:
    none
*/

if(!hasInterface) exitWith {};

// no need to initialise ragdolling twice!
if (!isNil 'diwako_ragdoll_ragdollRunning') exitWith {};
diwako_ragdoll_ragdollRunning = true;

["ace_unconscious", {
  params [["_unit", objNull],["_state", false]];
  if(!diwako_ragdoll_ragdolling) exitWith {}; // ragdolling if it active
  if( (_unit != player && {!diwako_ragdoll_ai}) || (!local _unit)) exitWith {}; // only ragdoll players and only ragdolling if it active
  if(_state && {vehicle _unit == _unit && {!([_unit] call ace_medical_fnc_isBeingCarried) && {!([_unit] call ace_medical_fnc_isBeingDragged)}}}) then {
    // ragdoll player
    _unit setUnconscious true;
  };
  if(!_state) then {
    // player woke up before ragdolling was finished
    _unit setUnconscious false;
  };
}] call CBA_fnc_addEventHandler;

["CAManBase", "AnimChanged", {
	params ["_unit","_anim"];
  if(!diwako_ragdoll_ragdolling) exitWith {}; // disable ragdolling mid mission
  if( (_unit != player && {!diwako_ragdoll_ai}) || !(local _unit)) exitWith {}; // only run on players if ai setting is disabled
  if(_anim == "unconsciousrevivedefault" && {alive _unit && {_unit getVariable ["ACE_isUnconscious",false] && {vehicle _unit == _unit}}}) then {
    // unit stopped ragdolling, apply ace_death animation to unit
    _unit setUnconscious false;
    [_unit, [_unit] call ace_common_fnc_getDeathAnim, 2, true] call ace_common_fnc_doAnimation;
    if(isMultiplayer) then {
      // combat sync issues
      [
        {
          params ["_unit"];
          if(!(_unit getVariable ["ACE_isUnconscious",false])) then {
            // unit is not unconscious anymore
            _unit setUnconscious false;
          } else {
            // unit is still unconscious, reapply death animation just in case and sync it again to all clients
            [_unit, [_unit] call ace_common_fnc_getDeathAnim, 2, true] call ace_common_fnc_doAnimation;
          };
        }, // code
        [_unit], // params
        5 // delay
      ] call CBA_fnc_waitAndExecute;
    };
  };
}] call CBA_fnc_addClassEventHandler;

player createDiaryRecord ["CBA_docs", ["Ragdolling", "Ragdolling has been activated in this mission! Better check those bodies!"]];