unit efl_ui_focus_layer_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Focus_Layer = ^TEfl_Ui_Focus_Layer;
  TEfl_Ui_Focus_Layer = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_LAYER_MIXIN: PEfl_Class;

function efl_ui_focus_layer_mixin_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_focus_layer_enable_set(obj: PEo; v: TEina_Bool); cdecl; external libelementary;
function efl_ui_focus_layer_enable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_focus_layer_behaviour_set(obj: PEo; enable_on_visible: TEina_Bool; cycle: TEina_Bool); cdecl; external libelementary;
procedure efl_ui_focus_layer_behaviour_get(obj: PEo; enable_on_visible: PEina_Bool; cycle: PEina_Bool); cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:16:19 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_LAYER_MIXIN: PEfl_Class;
begin
  EFL_UI_FOCUS_LAYER_MIXIN := efl_ui_focus_layer_mixin_get;
end;
{$endif}


end.
