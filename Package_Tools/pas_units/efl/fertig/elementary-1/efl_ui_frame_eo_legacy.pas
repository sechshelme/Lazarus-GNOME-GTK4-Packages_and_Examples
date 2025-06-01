unit efl_ui_frame_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Frame = ^TEfl_Ui_Frame;
  TEfl_Ui_Frame = TEo;

procedure elm_frame_collapse_set(obj: PEfl_Ui_Frame; collapse: TEina_Bool); cdecl; external libelementary;
function elm_frame_collapse_get(obj: PEfl_Ui_Frame): TEina_Bool; cdecl; external libelementary;
procedure elm_frame_autocollapse_set(obj: PEfl_Ui_Frame; autocollapse: TEina_Bool); cdecl; external libelementary;
function elm_frame_autocollapse_get(obj: PEfl_Ui_Frame): TEina_Bool; cdecl; external libelementary;
procedure elm_frame_collapse_go(obj: PEfl_Ui_Frame; collapse: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:16:57 ===


implementation



end.
