unit efl_ui_layout_part_bg_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Layout_Part_Bg = ^TEfl_Ui_Layout_Part_Bg;
  TEfl_Ui_Layout_Part_Bg = TEo;

function EFL_UI_LAYOUT_PART_BG_CLASS: PEfl_Class;

function efl_ui_layout_part_bg_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:36:53 ===


implementation


function EFL_UI_LAYOUT_PART_BG_CLASS: PEfl_Class;
begin
  EFL_UI_LAYOUT_PART_BG_CLASS := efl_ui_layout_part_bg_class_get;
end;


end.
