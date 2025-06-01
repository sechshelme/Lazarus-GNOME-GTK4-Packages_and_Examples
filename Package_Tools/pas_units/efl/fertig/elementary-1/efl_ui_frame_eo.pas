unit efl_ui_frame_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Frame = ^TEfl_Ui_Frame;
  TEfl_Ui_Frame = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FRAME_CLASS: PEfl_Class;

function efl_ui_frame_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_frame_collapse_set(obj: PEo; collapse: TEina_Bool); cdecl; external libelementary;
function efl_ui_frame_collapse_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_frame_autocollapse_set(obj: PEo; autocollapse: TEina_Bool); cdecl; external libelementary;
function efl_ui_frame_autocollapse_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_frame_collapse_go(obj: PEo; collapse: TEina_Bool); cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:16:54 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FRAME_CLASS: PEfl_Class;
begin
  EFL_UI_FRAME_CLASS := efl_ui_frame_class_get;
end;
{$endif}


end.
