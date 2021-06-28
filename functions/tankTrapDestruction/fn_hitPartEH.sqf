params ["_tanktrap"];

if (_tanktrap getVariable ["gradTnT_hitHandler", false]) exitWith { 
    diag_log format ["hitEH","not adding hit handler, already there"];
};

_tanktrap setVariable ["gradTnT_hitHandler", true];


_tanktrap addEventHandler ["HitPart", {
    (_this select 0) params ["_tanktrap", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

    // filter locally and broadcast only when necessary
    if (_isDirect) then {
        // add cooldown after indirect
        _ammo params ["", "", "_splashDamage", "", "_type"];

        // main gun of tanks
        if (_velocity#0 > 1000) then {
            [ASLtoAGL _position] remoteExec ["gradTnT_fnc_explodeFX"];
            deleteVehicle _tanktrap;
        };
    };
}];