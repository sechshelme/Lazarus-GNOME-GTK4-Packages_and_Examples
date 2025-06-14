{$IFDEF read_interface}


type
  PEfl_Canvas_Wl_Surface = ^TEfl_Canvas_Wl_Surface;
  TEfl_Canvas_Wl_Surface = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_WL_SURFACE_CLASS: PEfl_Class;

function efl_canvas_wl_surface_class_get: PEfl_Class; cdecl; external libefl_canvas_wl;
function efl_canvas_wl_surface_extract(obj: PEo): TEina_Bool; cdecl; external libefl_canvas_wl;
function efl_canvas_wl_surface_pid_get(obj: PEo): longint; cdecl; external libefl_canvas_wl;
function efl_canvas_wl_surface_parent_surface_get(obj: PEo): PEfl_Canvas_Wl_Surface; cdecl; external libefl_canvas_wl;
function efl_canvas_wl_surface_extracted_get(obj: PEo): TEina_Bool; cdecl; external libefl_canvas_wl;
{$endif}

// === Konventiert am: 14-6-25 16:27:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_WL_SURFACE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_WL_SURFACE_CLASS := efl_canvas_wl_surface_class_get;
end;
{$endif}


{$ENDIF read_implementation}
