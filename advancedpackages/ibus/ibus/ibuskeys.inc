{$IFDEF read_interface}


function ibus_keyval_name(keyval: Tguint): Pgchar; cdecl; external libibus;
function ibus_keyval_from_name(keyval_name: Pgchar): Tguint; cdecl; external libibus;
function ibus_unicode_to_keyval(wc: Tgunichar): Tguint; cdecl; external libibus;
function ibus_keyval_to_unicode(keyval: Tguint): Tgunichar; cdecl; external libibus;
function ibus_keyval_to_upper(keyval: Tguint): Tguint; cdecl; external libibus;
function ibus_keyval_to_lower(keyval: Tguint): Tguint; cdecl; external libibus;
procedure ibus_keyval_convert_case(symbol: Tguint; lower: Pguint; upper: Pguint); cdecl; external libibus;

// === Konventiert am: 26-7-25 16:17:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
