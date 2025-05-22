unit efl_canvas_layout_part_box_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Layout_Part_Box = ^TEfl_Canvas_Layout_Part_Box;
  TEfl_Canvas_Layout_Part_Box = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_BOX_CLASS: PEfl_Class;

function efl_canvas_layout_part_box_class_get: PEfl_Class; cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:56:23 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_BOX_CLASS: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_BOX_CLASS := efl_canvas_layout_part_box_class_get;
end;
{$endif}


end.
