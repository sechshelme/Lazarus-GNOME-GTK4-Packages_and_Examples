{$IFDEF read_interface}


function TCOD_random_get_instance: TTCOD_random_t; cdecl; external libtcod;
function TCOD_random_new(algo: TTCOD_random_algo_t): TTCOD_random_t; cdecl; external libtcod;
function TCOD_random_save(mersenne: TTCOD_random_t): TTCOD_random_t; cdecl; external libtcod;
procedure TCOD_random_restore(mersenne: TTCOD_random_t; backup: TTCOD_random_t); cdecl; external libtcod;
function TCOD_random_new_from_seed(algo: TTCOD_random_algo_t; seed: Tuint32_t): TTCOD_random_t; cdecl; external libtcod;
procedure TCOD_random_delete(mersenne: TTCOD_random_t); cdecl; external libtcod;
procedure TCOD_random_set_distribution(mersenne: TTCOD_random_t; distribution: TTCOD_distribution_t); cdecl; external libtcod;
function TCOD_random_get_int(mersenne: TTCOD_random_t; min: longint; max: longint): longint; cdecl; external libtcod;
function TCOD_random_get_float(mersenne: TTCOD_random_t; min: single; max: single): single; cdecl; external libtcod;
function TCOD_random_get_double(mersenne: TTCOD_random_t; min: double; max: double): double; cdecl; external libtcod;
function TCOD_random_get_int_mean(mersenne: TTCOD_random_t; min: longint; max: longint; mean: longint): longint; cdecl; external libtcod;
function TCOD_random_get_float_mean(mersenne: TTCOD_random_t; min: single; max: single; mean: single): single; cdecl; external libtcod;
function TCOD_random_get_double_mean(mersenne: TTCOD_random_t; min: double; max: double; mean: double): double; cdecl; external libtcod;
function TCOD_random_dice_new(s: pchar): TTCOD_dice_t; cdecl; external libtcod;
function TCOD_random_dice_roll(mersenne: TTCOD_random_t; dice: TTCOD_dice_t): longint; cdecl; external libtcod;
function TCOD_random_dice_roll_s(mersenne: TTCOD_random_t; s: pchar): longint; cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:53:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
