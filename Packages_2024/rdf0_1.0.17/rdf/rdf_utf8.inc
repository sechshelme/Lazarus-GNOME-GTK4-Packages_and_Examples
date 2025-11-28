{$IFDEF read_interface}


type
  Plibrdf_unichar = ^Tlibrdf_unichar;
  Tlibrdf_unichar = Traptor_unichar;

function librdf_unicode_char_to_utf8(c: Tlibrdf_unichar; output: pbyte; length: longint): longint; cdecl; external librdf; deprecated;
function librdf_utf8_to_unicode_char(output: Plibrdf_unichar; input: pbyte; length: longint): longint; cdecl; external librdf; deprecated;
function librdf_latin1_to_utf8_2(input: pbyte; length: Tsize_t; output_length: Psize_t): pbyte; cdecl; external librdf;
function librdf_utf8_to_latin1_2(input: pbyte; length: Tsize_t; discard: byte; output_length: Psize_t): pbyte; cdecl; external librdf;
function librdf_utf8_to_latin1(input: pbyte; length: longint; output_length: Plongint): pbyte; cdecl; external librdf; deprecated;
function librdf_latin1_to_utf8(input: pbyte; length: longint; output_length: Plongint): pbyte; cdecl; external librdf; deprecated;
procedure librdf_utf8_print(input: pbyte; length: longint; stream: PFILE); cdecl; external librdf;

// === Konventiert am: 27-11-25 17:38:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
