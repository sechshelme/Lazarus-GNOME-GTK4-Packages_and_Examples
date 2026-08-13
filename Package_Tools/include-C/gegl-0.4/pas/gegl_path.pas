unit gegl_path;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl, gegl_matrix;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglPathClass = type Pointer;

  PGeglPath = ^TGeglPath;
  TGeglPath = record
    parent_instance: TGObject;
  end;

function gegl_path_get_type: TGType; cdecl; external libgegl;

type
  PGeglPathPoint = ^TGeglPathPoint;
  TGeglPathPoint = record
    x: Tgfloat;
    y: Tgfloat;
  end;

  PGeglPathItem = ^TGeglPathItem;
  TGeglPathItem = record
    _type: Tgchar;
    point: array[0..3] of TGeglPathPoint;
  end;

type
  TGeglNodeFunction = procedure(node: PGeglPathItem; user_data: Tgpointer); cdecl;

type
  PGeglPathList = ^TGeglPathList;
  TGeglPathList = record
    next: PGeglPathList;
    d: TGeglPathItem;
  end;

type
  TGeglFlattenerFunc = function(original: PGeglPathList): PGeglPathList; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_path_new: PGeglPath; cdecl; external libgegl;
function gegl_path_new_from_string(instructions: Pgchar): PGeglPath; cdecl; external libgegl;
function gegl_path_is_empty(path: PGeglPath): Tgboolean; cdecl; external libgegl;
function gegl_path_get_n_nodes(path: PGeglPath): Tgint; cdecl; external libgegl;
function gegl_path_get_length(path: PGeglPath): Tgdouble; cdecl; external libgegl;
function gegl_path_get_node(path: PGeglPath; index: Tgint; node: PGeglPathItem): Tgboolean; cdecl; external libgegl;
function gegl_path_to_string(path: PGeglPath): Pgchar; cdecl; external libgegl;
procedure gegl_path_set_matrix(path: PGeglPath; matrix: PGeglMatrix3); cdecl; external libgegl;
procedure gegl_path_get_matrix(path: PGeglPath; matrix: PGeglMatrix3); cdecl; external libgegl;
function gegl_path_closest_point(path: PGeglPath; x: Tgdouble; y: Tgdouble; on_path_x: Pgdouble; on_path_y: Pgdouble;
  node_pos_before: Pgint): Tgdouble; cdecl; external libgegl;
function gegl_path_calc_y_for_x(path: PGeglPath; x: Tgdouble; y: Pgdouble): Tgint; cdecl; external libgegl;
function gegl_path_calc(path: PGeglPath; pos: Tgdouble; x: Pgdouble; y: Pgdouble): Tgboolean; cdecl; external libgegl;
procedure gegl_path_calc_values(path: PGeglPath; num_samples: Tguint; xs: Pgdouble; ys: Pgdouble); cdecl; external libgegl;
procedure gegl_path_get_bounds(self: PGeglPath; min_x: Pgdouble; max_x: Pgdouble; min_y: Pgdouble; max_y: Pgdouble); cdecl; external libgegl;

procedure gegl_path_foreach(path: PGeglPath; each_item: TGeglNodeFunction; user_data: Tgpointer); cdecl; external libgegl;
procedure gegl_path_foreach_flat(path: PGeglPath; each_item: TGeglNodeFunction; user_data: Tgpointer); cdecl; external libgegl;
procedure gegl_path_clear(path: PGeglPath); cdecl; external libgegl;
procedure gegl_path_insert_node(path: PGeglPath; pos: Tgint; node: PGeglPathItem); cdecl; external libgegl;
procedure gegl_path_replace_node(path: PGeglPath; pos: Tgint; node: PGeglPathItem); cdecl; external libgegl;
procedure gegl_path_remove_node(path: PGeglPath; pos: Tgint); cdecl; external libgegl;
procedure gegl_path_parse_string(path: PGeglPath; instructions: Pgchar); cdecl; external libgegl;
procedure gegl_path_append(path: PGeglPath); cdecl; varargs; external libgegl;
procedure gegl_path_freeze(path: PGeglPath); cdecl; external libgegl;
procedure gegl_path_thaw(path: PGeglPath); cdecl; external libgegl;
function gegl_param_spec_path(name: Pgchar; nick: Pgchar; blurb: Pgchar; default_path: PGeglPath; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;

function gegl_param_path_get_type: TGType; cdecl; external libgegl;
procedure gegl_path_add_type(_type: Tgchar; items: Tgint; description: Pgchar); cdecl; external libgegl;

function gegl_path_list_append(head: PGeglPathList): PGeglPathList; cdecl; varargs; external libgegl;
function gegl_path_list_destroy(path: PGeglPathList): PGeglPathList; cdecl; external libgegl;

procedure gegl_path_add_flattener(func: TGeglFlattenerFunc); cdecl; external libgegl;
function gegl_path_get_path(path: PGeglPath): PGeglPathList; cdecl; external libgegl;
function gegl_path_get_flat_path(path: PGeglPath): PGeglPathList; cdecl; external libgegl;
procedure gegl_path_point_lerp(dest: PGeglPathPoint; a: PGeglPathPoint; b: PGeglPathPoint; t: Tgfloat); cdecl; external libgegl;
function gegl_path_point_dist(a: PGeglPathPoint; b: PGeglPathPoint): Tgdouble; cdecl; external libgegl;
procedure gegl_path_dirty(path: PGeglPath); cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:24:11 ===

function GEGL_TYPE_PATH: TGType;
function GEGL_PATH(obj: Pointer): PGeglPath;
function GEGL_PATH_CLASS(klass: Pointer): PGeglPathClass;
function GEGL_IS_PATH(obj: Pointer): Tgboolean;
function GEGL_IS_PATH_CLASS(klass: Pointer): Tgboolean;
function GEGL_PATH_GET_CLASS(obj: Pointer): PGeglPathClass;

function GEGL_TYPE_PARAM_PATH: TGType;
function GEGL_IS_PARAM_PATH(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GEGL_TYPE_PATH: TGType;
begin
  GEGL_TYPE_PATH := gegl_path_get_type;
end;

function GEGL_PATH(obj: Pointer): PGeglPath;
begin
  Result := PGeglPath(g_type_check_instance_cast(obj, GEGL_TYPE_PATH));
end;

function GEGL_PATH_CLASS(klass: Pointer): PGeglPathClass;
begin
  Result := PGeglPathClass(g_type_check_class_cast(klass, GEGL_TYPE_PATH));
end;

function GEGL_IS_PATH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_PATH);
end;

function GEGL_IS_PATH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_PATH);
end;

function GEGL_PATH_GET_CLASS(obj: Pointer): PGeglPathClass;
begin
  Result := PGeglPathClass(PGTypeInstance(obj)^.g_class);
end;


function GEGL_TYPE_PARAM_PATH: TGType;
begin
  GEGL_TYPE_PARAM_PATH := gegl_param_path_get_type;
end;

function GEGL_IS_PARAM_PATH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_PARAM_PATH);
end;

end.
