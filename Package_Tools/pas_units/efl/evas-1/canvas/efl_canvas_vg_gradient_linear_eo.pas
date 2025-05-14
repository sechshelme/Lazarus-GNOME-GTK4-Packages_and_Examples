unit efl_canvas_vg_gradient_linear_eo;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Vg_Gradient_Linear = ^TEfl_Canvas_Vg_Gradient_Linear;
  TEfl_Canvas_Vg_Gradient_Linear = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_GRADIENT_LINEAR_CLASS: PEfl_Class;

function efl_canvas_vg_gradient_linear_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:36:23 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_GRADIENT_LINEAR_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_GRADIENT_LINEAR_CLASS := efl_canvas_vg_gradient_linear_class_get;
end;
{$endif}


end.
