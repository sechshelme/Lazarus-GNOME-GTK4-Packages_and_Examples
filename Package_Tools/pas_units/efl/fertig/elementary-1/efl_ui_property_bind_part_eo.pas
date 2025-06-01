unit efl_ui_property_bind_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Property_Bind_Part = ^TEfl_Ui_Property_Bind_Part;
  TEfl_Ui_Property_Bind_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PROPERTY_BIND_PART_CLASS: PEfl_Class;

function efl_ui_property_bind_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:22:11 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PROPERTY_BIND_PART_CLASS: PEfl_Class;
begin
  EFL_UI_PROPERTY_BIND_PART_CLASS := efl_ui_property_bind_part_class_get;
end;
{$endif}


end.
