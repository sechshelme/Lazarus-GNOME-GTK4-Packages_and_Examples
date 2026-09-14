{$IFDEF read_interface}


type
  Pg2d_line_t = ^Tg2d_line_t;
  Tg2d_line_t = record
    p: array[0..1] of Tdouble;
    u: array[0..1] of Tdouble;
  end;

procedure g2d_line_init_from_points(line: Pg2d_line_t; p0: Pdouble; p1: Pdouble); cdecl; external libapriltag;
function g2d_line_get_coordinate(line: Pg2d_line_t; q: Pdouble): Tdouble; cdecl; external libapriltag;
function g2d_line_intersect_line(linea: Pg2d_line_t; lineb: Pg2d_line_t; p: Pdouble): longint; cdecl; external libapriltag;

type
  Pg2d_line_segment_t = ^Tg2d_line_segment_t;
  Tg2d_line_segment_t = record
    line: Tg2d_line_t;
    p1: array[0..1] of Tdouble;
  end;

procedure g2d_line_segment_init_from_points(seg: Pg2d_line_segment_t; p0: Pdouble; p1: Pdouble); cdecl; external libapriltag;
function g2d_line_segment_intersect_segment(sega: Pg2d_line_segment_t; segb: Pg2d_line_segment_t; p: Pdouble): longint; cdecl; external libapriltag;
procedure g2d_line_segment_closest_point(seg: Pg2d_line_segment_t; q: Pdouble; p: Pdouble); cdecl; external libapriltag;
function g2d_line_segment_closest_point_distance(seg: Pg2d_line_segment_t; q: Pdouble): Tdouble; cdecl; external libapriltag;

function g2d_polygon_create_data(v: Pdouble; sz: longint): Pzarray_t; cdecl; external libapriltag;
function g2d_polygon_create_zeros(sz: longint): Pzarray_t; cdecl; external libapriltag;
function g2d_polygon_create_empty: Pzarray_t; cdecl; external libapriltag;
procedure g2d_polygon_add(poly: Pzarray_t; v: Pdouble); cdecl; external libapriltag;
procedure g2d_polygon_make_ccw(poly: Pzarray_t); cdecl; external libapriltag;
function g2d_polygon_contains_point(poly: Pzarray_t; q: Pdouble): longint; cdecl; external libapriltag;
function g2d_polygon_intersects_polygon(polya: Pzarray_t; polyb: Pzarray_t): longint; cdecl; external libapriltag;
function g2d_polygon_contains_polygon(polya: Pzarray_t; polyb: Pzarray_t): longint; cdecl; external libapriltag;
function g2d_polygon_overlaps_polygon(polya: Pzarray_t; polyb: Pzarray_t): longint; cdecl; external libapriltag;
function g2d_polygon_rasterize(poly: Pzarray_t; y: Tdouble; x: Pdouble): longint; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:14:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
