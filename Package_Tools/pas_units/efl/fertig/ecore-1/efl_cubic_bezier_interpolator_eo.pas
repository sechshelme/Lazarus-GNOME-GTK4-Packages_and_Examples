unit efl_cubic_bezier_interpolator_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Cubic_Bezier_Interpolator = ^TEfl_Cubic_Bezier_Interpolator;
  TEfl_Cubic_Bezier_Interpolator = TEo;

function EFL_CUBIC_BEZIER_INTERPOLATOR_CLASS: PEfl_Class;

function efl_cubic_bezier_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_cubic_bezier_interpolator_control_points_set(obj: PEo; p1: TEina_Vector2; p2: TEina_Vector2); cdecl; external libecore;
procedure efl_cubic_bezier_interpolator_control_points_get(obj: PEo; p1: PEina_Vector2; p2: PEina_Vector2); cdecl; external libecore;

// === Konventiert am: 21-5-25 15:43:53 ===


implementation


function EFL_CUBIC_BEZIER_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_CUBIC_BEZIER_INTERPOLATOR_CLASS := efl_cubic_bezier_interpolator_class_get;
end;


end.
