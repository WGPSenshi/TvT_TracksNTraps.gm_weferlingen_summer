["gradTnT_points", ["crew", [side player] call gradTnT_fnc_getOpposingSide]] call CBA_fnc_serverEvent; // score for enemy
[player, player] call ace_medical_treatment_fnc_fullHeal; // bc one bug report of non-fully-healed respawn