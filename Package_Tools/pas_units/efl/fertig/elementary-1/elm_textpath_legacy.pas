unit elm_textpath_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Textpath = ^TElm_Textpath;
  TElm_Textpath = TEo;

function elm_textpath_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_textpath_text_user_style_set(obj: PEvas_Object; style: pchar); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:28:32 ===


implementation



end.
