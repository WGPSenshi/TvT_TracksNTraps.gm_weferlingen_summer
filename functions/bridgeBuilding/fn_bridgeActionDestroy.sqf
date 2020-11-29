params ["_bridge"];

private _helperObject = _bridge getVariable ["gradSB_bridgeHelper", objNull];

private _destroyAction = [
    "DestroyBridge",
    "Destroy Bridge",
    "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    {
        private _bridge = _target getVariable ["gradSB_bridgeHelperBridge", objNull];
        [player, _bridge] remoteExec ["gradSB_fnc_bridgeDestroy", 2];
    }, {
        private _bridge = _target getVariable ["gradSB_bridgeHelperBridge", objNull];
        !(_bridge getVariable ["gradSB_bridgeDestroyed", false])
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;


[_helperObject, 0, ["ACE_MainActions"], _destroyAction] call ace_interact_menu_fnc_addActionToObject;