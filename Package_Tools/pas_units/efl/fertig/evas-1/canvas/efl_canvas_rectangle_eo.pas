unit efl_canvas_rectangle_eo;

interface

uses
  ctypes, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Rectangle = ^TEfl_Canvas_Rectangle;
  TEfl_Canvas_Rectangle = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_RECTANGLE_CLASS: PEfl_Class;

function efl_canvas_rectangle_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:36:16 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_RECTANGLE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_RECTANGLE_CLASS := efl_canvas_rectangle_class_get;
end;
{$endif}


end.
