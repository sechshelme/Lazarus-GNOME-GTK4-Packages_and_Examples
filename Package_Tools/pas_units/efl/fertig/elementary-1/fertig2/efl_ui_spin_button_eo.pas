unit efl_ui_spin_button_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Spin_Button = ^TEfl_Ui_Spin_Button;
  TEfl_Ui_Spin_Button = TEo;

function EFL_UI_SPIN_BUTTON_CLASS: PEfl_Class;

function efl_ui_spin_button_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_spin_button_wraparound_set(obj: PEo; circulate: TEina_Bool); cdecl; external libelementary;
function efl_ui_spin_button_wraparound_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_spin_button_direct_text_input_set(obj: PEo; direct_text_input: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_spin_button_direct_text_input_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 29-5-25 19:47:05 ===


implementation


function EFL_UI_SPIN_BUTTON_CLASS: PEfl_Class;
begin
  EFL_UI_SPIN_BUTTON_CLASS := efl_ui_spin_button_class_get;
end;


end.
