["ace_unconscious", {
	params [["_unit", objNull],["_state", false]];
	// if(_unit != player) exitWith {}; // only ragdoll players
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
	if(_anim == "unconsciousrevivedefault" && {alive _unit && {_unit getVariable ["ACE_isUnconscious",false] && {vehicle _unit == _unit}}}) then {
		// unit stopped ragdolling, apply ace_death animation to unit
		_unit setUnconscious false;
		[_unit, [_unit] call ace_common_fnc_getDeathAnim, 2, true] call ace_common_fnc_doAnimation;
		if(isMultiplayer) then {
			// combat sync issues
			[_unit] spawn {
				params["_unit"];
				sleep 5;
				// in some cases the server does not sync that a unit is up and running or still down but with wrong animations, so reapply some things
				if(!(_unit getVariable ["ACE_isUnconscious",false])) then {
					// unit is not unconscious anymore
					_unit setUnconscious false;
				} else {
					// unit is still unconscious, reapply death animation just in case and sync it again to all clients
					[_unit, [_unit] call ace_common_fnc_getDeathAnim, 2, true] call ace_common_fnc_doAnimation;
				};
			};
		};
	};
}] call CBA_fnc_addClassEventHandler;