unit elm_code_file;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_common, elm_code_line;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Code_File_Line_Ending = ^TElm_Code_File_Line_Ending;
  TElm_Code_File_Line_Ending = longint;

const
  ELM_CODE_FILE_LINE_ENDING_UNIX = 0;
  ELM_CODE_FILE_LINE_ENDING_WINDOWS = 1;

type
  TElm_Code_File = record
    parent: pointer;
    lines: PEina_List;
    file_: PEina_File;
    map: pointer;
    mime: pchar;
    line_ending: TElm_Code_File_Line_Ending;
  end;
  PElm_Code_File = ^TElm_Code_File;

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


implementation



end.
