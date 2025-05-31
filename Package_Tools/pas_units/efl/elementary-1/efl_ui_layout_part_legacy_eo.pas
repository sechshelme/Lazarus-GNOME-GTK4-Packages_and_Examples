unit efl_ui_layout_part_legacy_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Layout_Part_Legacy = ^TEfl_Ui_Layout_Part_Legacy;
  TEfl_Ui_Layout_Part_Legacy = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LAYOUT_PART_LEGACY_CLASS: PEfl_Class;

function efl_ui_layout_part_legacy_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:37:04 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LAYOUT_PART_LEGACY_CLASS: PEfl_Class;
begin
  EFL_UI_LAYOUT_PART_LEGACY_CLASS := efl_ui_layout_part_legacy_class_get;
end;
{$endif}


end.
