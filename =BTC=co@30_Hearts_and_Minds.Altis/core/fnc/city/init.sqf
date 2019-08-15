
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_init

Description:
    Create cities all over the map and store those properties.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_city_init;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

private _locations = configfile >> "cfgworlds" >> worldname >> "names";

private _cities = ["NameVillage", "NameCity", "NameCityCapital", "NameLocal", "Hill", "Airport"];

if (btc_p_sea) then {_cities pushBack "NameMarine";};

btc_city_all = [];

for "_i" from 0 to (count _locations - 1) do {
    private _current = _locations select _i;

    private _type = getText (_current >> "type");

    if (_type in _cities) then {
        private _position = getArray (_current >> "position");
        if (surfaceIsWater _position) then {
            if !(_type isEqualTo "NameMarine") then {
                private _church = nearestTerrainObjects [_position, ["CHURCH"], 470];
                if (_church isEqualTo []) then {
                    private _area = 50;
                    for "_i" from 0 to 3 do {
                        private _new_position = [_position, 0, _area, 0.5, 0, -1, 0] call BIS_fnc_findSafePos;
                        if (count _new_position isEqualTo 2) exitWith {
                            _position = _new_position;
                        };
                        _area = _area * 2;
                    };
                } else {
                    _position = getPos (_church select 0);
                };
            };
        };
        private _name = getText(_current >> "name");
        private _radius_x = getNumber(_current >> "RadiusA");
        private _radius_y = getNumber(_current >> "RadiusB");

        if (btc_city_blacklist find _name >= 0) exitWith {};

        /*
        //if you want a safe area
        if ((getMarkerPos "YOUR_MARKER_AREA") inArea [_position, 500, 500, 0, false]) exitWith {};
        */
        // Edited: Add safezones
        if ((getMarkerPos "safezone_1") inArea [_position, 100, 100, 0, false]) exitWith {};
        if ((getMarkerPos "safezone_2") inArea [_position, 100, 100, 0, false]) exitWith {};
        if ((getMarkerPos "safezone_3") inArea [_position, 100, 100, 0, false]) exitWith {};
        if ((getMarkerPos "safezone_4") inArea [_position, 250, 250, 0, false]) exitWith {};
        if ((getMarkerPos "safezone_5") inArea [_position, 100, 100, 0, false]) exitWith {};

        if (_radius_x < 500 || _radius_y < 500) then { // Edited: Add city radius check, if radius is too small, force it to 500m, default = 80
            _radius_x = 500;
            _radius_y = 500;
        };
        
        [_position, _type, _name, _radius_x, _radius_y, true] call btc_fnc_city_create; // Edited: Default = random 1 > 0.45
    };
};

if !(isNil "btc_custom_loc") then {
    {_x call btc_fnc_city_create} forEach btc_custom_loc;
};
