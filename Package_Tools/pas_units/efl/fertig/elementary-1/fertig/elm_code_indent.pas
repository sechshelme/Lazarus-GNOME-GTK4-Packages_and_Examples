unit elm_code_indent;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_line;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function elm_code_line_indent_get(line:PElm_Code_Line):Pchar;cdecl;external libelementary;
function elm_code_line_indent_matching_braces_get(line:PElm_Code_Line; length:Pdword):Pchar;cdecl;external libelementary;

// === Konventiert am: 26-5-25 16:41:36 ===


implementation



end.
