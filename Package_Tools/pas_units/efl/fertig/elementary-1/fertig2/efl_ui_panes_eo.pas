unit efl_ui_panes_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Panes = ^TEfl_Ui_Panes;
  TEfl_Ui_Panes = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PANES_CLASS: PEfl_Class;

function efl_ui_panes_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_panes_split_ratio_set(obj: PEo; ratio: double); cdecl; external libelementary;
function efl_ui_panes_split_ratio_get(obj: PEo): double; cdecl; external libelementary;
procedure efl_ui_panes_fixed_set(obj: PEo; fixed: TEina_Bool); cdecl; external libelementary;
function efl_ui_panes_fixed_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 19:28:00 ===


implementation


{ was #define dname def_expr }
function EFL_UI_PANES_CLASS: PEfl_Class;
begin
  EFL_UI_PANES_CLASS := efl_ui_panes_class_get;
end;


end.
