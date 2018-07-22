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

// no need to initialise ragdolling twice!
if (!isNil 'diwako_ragdoll_ragdollRunning') exitWith {};
diwako_ragdoll_ragdollRunning = true;

["ace_unconscious", {
  params [["_unit", objNull],["_state", false]];
  // if(!local _unit || {!diwako_ragdoll_ragdolling}) exitWith {}; // ragdolling if it's active and unit local
  if(!diwako_ragdoll_ragdolling) exitWith {}; // ragdolling if it's active
  if((!(isPlayer _unit) && {!diwako_ragdoll_ai})) exitWith {}; // only ragdoll players and only ragdolling AI if that option is set active
  if(_state && {(isNull objectParent _unit) && {!([_unit] call ace_medical_fnc_isBeingCarried) && {!([_unit] call ace_medical_fnc_isBeingDragged)}}}) then {
    // ragdoll unit
    _unit setUnconscious true;
  };
  if(!_state) then {
    // unit woke up before ragdolling was finished
    _unit setUnconscious false;
  };
}] call CBA_fnc_addEventHandler;

["CAManBase", "AnimChanged", {
	_this call diwako_ragdoll_fnc_animChangedEH;
}] call CBA_fnc_addClassEventHandler;

player createDiaryRecord ["CBA_docs", ["Ragdolling", "Ragdolling has been activated in this mission! Better check those bodies!"]];