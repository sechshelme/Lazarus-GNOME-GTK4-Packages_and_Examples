unit gskpath;

interface

uses
  fp_glib2, fp_cairo, fp_graphene, fp_gtk4, gsktypes, gskenums, gskpathpoint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGskPathForeachFlags = ^TGskPathForeachFlags;
  TGskPathForeachFlags = longint;
const
  GSK_PATH_FOREACH_ALLOW_ONLY_LINES = 0;
  GSK_PATH_FOREACH_ALLOW_QUAD = 1 shl 0;
  GSK_PATH_FOREACH_ALLOW_CUBIC = 1 shl 1;
  GSK_PATH_FOREACH_ALLOW_CONIC = 1 shl 2;

type
  TGskPathForeachFunc = function(op: TGskPathOperation; pts: Pgraphene_point_t; n_pts: Tgsize; weight: single; user_data: Tgpointer): Tgboolean; cdecl;

function gsk_path_get_type: TGType; cdecl; external libgtk4;
function gsk_path_ref(self: PGskPath): PGskPath; cdecl; external libgtk4;
procedure gsk_path_unref(self: PGskPath); cdecl; external libgtk4;
procedure gsk_path_print(self: PGskPath; _string: PGString); cdecl; external libgtk4;
function gsk_path_to_string(self: PGskPath): pchar; cdecl; external libgtk4;
function gsk_path_parse(_string: pchar): PGskPath; cdecl; external libgtk4;
procedure gsk_path_to_cairo(self: PGskPath; cr: Pcairo_t); cdecl; external libgtk4;
function gsk_path_is_empty(self: PGskPath): Tgboolean; cdecl; external libgtk4;
function gsk_path_is_closed(self: PGskPath): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_bounds(self: PGskPath; bounds: Pgraphene_rect_t): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_tight_bounds(self: PGskPath; bounds: Pgraphene_rect_t): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_stroke_bounds(self: PGskPath; stroke: PGskStroke; bounds: Pgraphene_rect_t): Tgboolean; cdecl; external libgtk4;
function gsk_path_in_fill(self: PGskPath; point: Pgraphene_point_t; fill_rule: TGskFillRule): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_start_point(self: PGskPath; result: PGskPathPoint): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_end_point(self: PGskPath; result: PGskPathPoint): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_next(self: PGskPath; point: PGskPathPoint): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_previous(self: PGskPath; point: PGskPathPoint): Tgboolean; cdecl; external libgtk4;
function gsk_path_get_closest_point(self: PGskPath; point: Pgraphene_point_t; threshold: single; result: PGskPathPoint; distance: Psingle): Tgboolean; cdecl; external libgtk4;
function gsk_path_foreach(self: PGskPath; flags: TGskPathForeachFlags; func: TGskPathForeachFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgtk4;
function gsk_path_equal(path1: PGskPath; path2: PGskPath): Tgboolean; cdecl; external libgtk4;

type
  PGskPathIntersection = ^TGskPathIntersection;
  TGskPathIntersection = longint;
const
  GSK_PATH_INTERSECTION_NONE = 0;
  GSK_PATH_INTERSECTION_NORMAL = 1;
  GSK_PATH_INTERSECTION_START = 2;
  GSK_PATH_INTERSECTION_END = 3;

type
  TGskPathIntersectionFunc = function(path1: PGskPath; point1: PGskPathPoint; path2: PGskPath; point2: PGskPathPoint; kind: TGskPathIntersection; user_data: Tgpointer): Tgboolean; cdecl;

function gsk_path_foreach_intersection(path1: PGskPath; path2: PGskPath; func: TGskPathIntersectionFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:29 ===

function GSK_TYPE_PATH: TGType;

implementation

function GSK_TYPE_PATH: TGType;
begin
  GSK_TYPE_PATH := gsk_path_get_type;
end;



end.
