{$IFDEF read_interface}


type
  PEfl_Canvas_Polygon = ^TEfl_Canvas_Polygon;
  TEfl_Canvas_Polygon = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_POLYGON_CLASS: PEfl_Class;

function efl_canvas_polygon_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_polygon_point_add(obj: PEo; pos: TEina_Position2D); cdecl; external libevas;
procedure efl_canvas_polygon_points_clear(obj: PEo); cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:27:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CANVAS_POLYGON_CLASS: PEfl_Class;
begin
  EFL_CANVAS_POLYGON_CLASS := efl_canvas_polygon_class_get;
end;


{$ENDIF read_implementation}
