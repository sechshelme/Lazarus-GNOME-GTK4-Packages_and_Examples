{$IFDEF read_interface}

type
  PEfl_Canvas_Vg_Gradient_Radial = ^TEfl_Canvas_Vg_Gradient_Radial;
  TEfl_Canvas_Vg_Gradient_Radial = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_GRADIENT_RADIAL_CLASS: PEfl_Class;

function efl_canvas_vg_gradient_radial_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:37:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_GRADIENT_RADIAL_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_GRADIENT_RADIAL_CLASS := efl_canvas_vg_gradient_radial_class_get;
end;
{$endif}


{$ENDIF read_implementation}
