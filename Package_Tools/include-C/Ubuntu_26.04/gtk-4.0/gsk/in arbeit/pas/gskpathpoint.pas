unit gskpathpoint;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4, gsktypes, gskenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGskPathPoint = ^TGskPathPoint;
  TGskPathPoint = record
    case integer of
      0: (contour: PtrUInt;  idx: PtrUInt;  t: single;);
      1: (padding: array[0..7] of Tgpointer;);
      2: (alignment: Tgraphene_vec4_t;);
  end;

function gsk_path_point_get_type: TGType; cdecl; external libgtk4;
function gsk_path_point_copy(point: PGskPathPoint): PGskPathPoint; cdecl; external libgtk4;
procedure gsk_path_point_free(point: PGskPathPoint); cdecl; external libgtk4;
function gsk_path_point_equal(point1: PGskPathPoint; point2: PGskPathPoint): Tgboolean; cdecl; external libgtk4;
function gsk_path_point_compare(point1: PGskPathPoint; point2: PGskPathPoint): longint; cdecl; external libgtk4;
procedure gsk_path_point_get_position(point: PGskPathPoint; path: PGskPath; position: Pgraphene_point_t); cdecl; external libgtk4;
procedure gsk_path_point_get_tangent(point: PGskPathPoint; path: PGskPath; direction: TGskPathDirection; tangent: Pgraphene_vec2_t); cdecl; external libgtk4;
function gsk_path_point_get_rotation(point: PGskPathPoint; path: PGskPath; direction: TGskPathDirection): single; cdecl; external libgtk4;
function gsk_path_point_get_curvature(point: PGskPathPoint; path: PGskPath; direction: TGskPathDirection; center: Pgraphene_point_t): single; cdecl; external libgtk4;
function gsk_path_point_get_distance(point: PGskPathPoint; measure: PGskPathMeasure): single; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:36:57 ===

function GSK_TYPE_PATH_POINT: TGType;

implementation

function GSK_TYPE_PATH_POINT: TGType;
begin
  GSK_TYPE_PATH_POINT := gsk_path_point_get_type;
end;



end.
