unit efl_ui_focus_composition_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Focus_Composition = ^TEfl_Ui_Focus_Composition;
  TEfl_Ui_Focus_Composition = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_COMPOSITION_MIXIN: PEfl_Class;

function efl_ui_focus_composition_mixin_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_focus_composition_elements_set(obj: PEo; logical_order: PEina_List); cdecl; external libelementary;
function efl_ui_focus_composition_elements_get(obj: PEo): PEina_List; cdecl; external libelementary;
procedure efl_ui_focus_composition_dirty(obj: PEo); cdecl; external libelementary;
procedure efl_ui_focus_composition_prepare(obj: PEo); cdecl; external libelementary;
procedure efl_ui_focus_composition_logical_mode_set(obj: PEo; logical_mode: TEina_Bool); cdecl; external libelementary;
function efl_ui_focus_composition_logical_mode_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:16:15 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_COMPOSITION_MIXIN: PEfl_Class;
begin
  EFL_UI_FOCUS_COMPOSITION_MIXIN := efl_ui_focus_composition_mixin_get;
end;
{$endif}


end.
