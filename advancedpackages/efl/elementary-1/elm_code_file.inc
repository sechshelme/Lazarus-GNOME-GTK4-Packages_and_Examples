{$IFDEF read_interface}


function elm_code_file_new(code: PElm_Code): PElm_Code_File; cdecl; external libelementary;
function elm_code_file_open(code: PElm_Code; path: pchar): PElm_Code_File; cdecl; external libelementary;
procedure elm_code_file_save(file_: PElm_Code_File); cdecl; external libelementary;
procedure elm_code_file_free(file_: PElm_Code_File); cdecl; external libelementary;
procedure elm_code_file_close(file_: PElm_Code_File); cdecl; external libelementary;
function elm_code_file_filename_get(file_: PElm_Code_File): pchar; cdecl; external libelementary;
function elm_code_file_path_get(file_: PElm_Code_File): pchar; cdecl; external libelementary;
function elm_code_file_line_ending_get(file_: PElm_Code_File): TElm_Code_File_Line_Ending; cdecl; external libelementary;
function elm_code_file_line_ending_chars_get(file_: PElm_Code_File; length: Psmallint): pchar; cdecl; external libelementary;
procedure elm_code_file_clear(file_: PElm_Code_File); cdecl; external libelementary;
function elm_code_file_lines_get(file_: PElm_Code_File): dword; cdecl; external libelementary;
procedure elm_code_file_line_append(file_: PElm_Code_File; line: pchar; length: longint; data: pointer); cdecl; external libelementary;
procedure elm_code_file_line_insert(file_: PElm_Code_File; row: dword; line: pchar; length: longint; data: pointer); cdecl; external libelementary;
procedure elm_code_file_line_remove(file_: PElm_Code_File; row: dword); cdecl; external libelementary;
function elm_code_file_line_get(file_: PElm_Code_File; line: dword): PElm_Code_Line; cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:44:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
