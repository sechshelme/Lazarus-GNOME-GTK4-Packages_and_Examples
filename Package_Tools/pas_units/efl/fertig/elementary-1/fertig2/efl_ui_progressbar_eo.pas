unit efl_ui_progressbar_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Progressbar = ^TEfl_Ui_Progressbar;
  TEfl_Ui_Progressbar = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PROGRESSBAR_CLASS: PEfl_Config;

function efl_ui_progressbar_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_progressbar_infinite_mode_set(obj: PEo; state: TEina_Bool); cdecl; external libelementary;
function efl_ui_progressbar_infinite_mode_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_progressbar_show_progress_label_set(obj: PEo; show: TEina_Bool); cdecl; external libelementary;
function efl_ui_progressbar_show_progress_label_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 15:25:46 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PROGRESSBAR_CLASS: PEfl_Config;
begin
  EFL_UI_PROGRESSBAR_CLASS := efl_ui_progressbar_class_get;
end;
{$endif}


end.
