{$IFDEF read_interface}



function elm_code_line_indent_get(line:PElm_Code_Line):Pchar;cdecl;external libelementary;
function elm_code_line_indent_matching_braces_get(line:PElm_Code_Line; length:Pdword):Pchar;cdecl;external libelementary;

// === Konventiert am: 26-5-25 16:41:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
