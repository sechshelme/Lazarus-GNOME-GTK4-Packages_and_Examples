{$IFDEF read_interface}



procedure xb_string_append_union(xpath: PGString; fmt: Pgchar); cdecl; varargs; external libxmlb;
function xb_string_escape(str: Pgchar): Pgchar; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
