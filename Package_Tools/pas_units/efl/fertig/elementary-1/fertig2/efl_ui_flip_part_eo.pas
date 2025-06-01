unit efl_ui_flip_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Flip_Part = ^TEfl_Ui_Flip_Part;
  TEfl_Ui_Flip_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FLIP_PART_CLASS: PEfl_Class;

function efl_ui_flip_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 19:37:20 ===


implementation


function EFL_UI_FLIP_PART_CLASS: PEfl_Class;
begin
  EFL_UI_FLIP_PART_CLASS := efl_ui_flip_part_class_get;
end;


end.
