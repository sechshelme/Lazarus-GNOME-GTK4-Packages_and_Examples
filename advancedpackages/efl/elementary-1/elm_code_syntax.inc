{$IFDEF read_interface}


type
  TElm_Code_Syntax = record
  end;
  PElm_Code_Syntax = ^TElm_Code_Syntax;

function elm_code_syntax_for_mime_get(mime: pchar): PElm_Code_Syntax; cdecl; external libelementary;
procedure elm_code_syntax_parse_line(syntax: PElm_Code_Syntax; line: PElm_Code_Line); cdecl; external libelementary;
procedure elm_code_syntax_parse_file(syntax: PElm_Code_Syntax; file_: PElm_Code_File); cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:41:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
