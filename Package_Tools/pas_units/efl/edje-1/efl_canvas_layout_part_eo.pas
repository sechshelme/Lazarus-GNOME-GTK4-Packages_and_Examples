unit efl_canvas_layout_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Layout_Part = ^TEfl_Canvas_Layout_Part;
  TEfl_Canvas_Layout_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_CLASS: PEfl_Class;

function efl_canvas_layout_part_class_get: PEfl_Class; cdecl; external libedje;
procedure efl_canvas_layout_part_state_get(obj: PEo; state: PPchar; val: Pdouble); cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:41:01 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_CLASS: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_CLASS := efl_canvas_layout_part_class_get;
end;
{$endif}


end.
