unit elm_code_text;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_line;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELM_CODE_TEXT_NOT_FOUND = -(1);

function elm_code_line_text_get(line: PElm_Code_Line; length: Pdword): pchar; cdecl; external libelementary;
procedure elm_code_line_text_set(line: PElm_Code_Line; chars: pchar; length: dword); cdecl; external libelementary;
function elm_code_line_text_strpos(line: PElm_Code_Line; search: pchar; offset: longint): longint; cdecl; external libelementary;
function elm_code_line_text_contains(line: PElm_Code_Line; search: pchar): TEina_Bool; cdecl; external libelementary;
function elm_code_line_text_substr(line: PElm_Code_Line; position: dword; length: longint): pchar; cdecl; external libelementary;
procedure elm_code_line_text_insert(line: PElm_Code_Line; position: dword; _string: pchar; length: longint); cdecl; external libelementary;
procedure elm_code_line_text_remove(line: PElm_Code_Line; position: dword; length: longint); cdecl; external libelementary;
procedure elm_code_line_text_leading_whitespace_strip(line: PElm_Code_Line); cdecl; external libelementary;
procedure elm_code_line_text_trailing_whitespace_strip(line: PElm_Code_Line); cdecl; external libelementary;
function elm_code_text_strnpos(text: pchar; length: dword; search: pchar; offset: longint): longint; cdecl; external libelementary;
function elm_code_text_newlinenpos(text: pchar; length: dword; nllen: Psmallint): longint; cdecl; external libelementary;
function elm_code_text_is_whitespace(text: pchar; length: dword): dword; cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:44:53 ===


implementation



end.
