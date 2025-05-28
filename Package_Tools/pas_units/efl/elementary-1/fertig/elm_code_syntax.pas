unit elm_code_syntax;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_common, elm_code_line;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Code_Syntax = record
  end;
  PElm_Code_Syntax = ^TElm_Code_Syntax;

function elm_code_syntax_for_mime_get(mime: pchar): PElm_Code_Syntax; cdecl; external libelementary;
procedure elm_code_syntax_parse_line(syntax: PElm_Code_Syntax; line: PElm_Code_Line); cdecl; external libelementary;
procedure elm_code_syntax_parse_file(syntax: PElm_Code_Syntax; file_: PElm_Code_File); cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:41:42 ===


implementation



end.
