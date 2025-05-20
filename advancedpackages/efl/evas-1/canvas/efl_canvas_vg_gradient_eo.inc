{$IFDEF read_interface}


type
  PEfl_Canvas_Vg_Gradient = ^TEfl_Canvas_Vg_Gradient;
  TEfl_Canvas_Vg_Gradient = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_GRADIENT_CLASS: PEfl_Class;

function efl_canvas_vg_gradient_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:36:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_GRADIENT_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_GRADIENT_CLASS := efl_canvas_vg_gradient_class_get;
end;
{$endif}


{$ENDIF read_implementation}
