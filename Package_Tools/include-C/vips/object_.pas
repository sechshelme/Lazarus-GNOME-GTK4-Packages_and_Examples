unit object_;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, buf, fp_vips;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PVipsArgumentFlags = ^TVipsArgumentFlags;
  TVipsArgumentFlags = longint;

const
  VIPS_ARGUMENT_NONE = 0;
  VIPS_ARGUMENT_REQUIRED = 1;
  VIPS_ARGUMENT_CONSTRUCT = 2;
  VIPS_ARGUMENT_SET_ONCE = 4;
  VIPS_ARGUMENT_SET_ALWAYS = 8;
  VIPS_ARGUMENT_INPUT = 16;
  VIPS_ARGUMENT_OUTPUT = 32;
  VIPS_ARGUMENT_DEPRECATED = 64;
  VIPS_ARGUMENT_MODIFY = 128;
  VIPS_ARGUMENT_NON_HASHABLE = 256;

const
  VIPS_ARGUMENT_REQUIRED_INPUT = (VIPS_ARGUMENT_INPUT or VIPS_ARGUMENT_REQUIRED) or VIPS_ARGUMENT_CONSTRUCT;
  VIPS_ARGUMENT_OPTIONAL_INPUT = VIPS_ARGUMENT_INPUT or VIPS_ARGUMENT_CONSTRUCT;
  VIPS_ARGUMENT_REQUIRED_OUTPUT = (VIPS_ARGUMENT_OUTPUT or VIPS_ARGUMENT_REQUIRED) or VIPS_ARGUMENT_CONSTRUCT;
  VIPS_ARGUMENT_OPTIONAL_OUTPUT = VIPS_ARGUMENT_OUTPUT or VIPS_ARGUMENT_CONSTRUCT;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PVipsArgumentTable = ^TVipsArgumentTable;
  TVipsArgumentTable = TGHashTable;

  TVipsObject = record
    parent_instance: TGObject;
    constructed: Tgboolean;
    static_object: Tgboolean;
    argument_table: PVipsArgumentTable;
    nickname: pchar;
    description: pchar;
    preclose: Tgboolean;
    close: Tgboolean;
    postclose: Tgboolean;
    local_memory: Tsize_t;
  end;
  PVipsObject = ^TVipsObject;
  PPVipsObject = ^PVipsObject;

  PVipsObjectClass = ^TVipsObjectClass;

  TVipsObjectClass = record
    parent_class: TGObjectClass;
    build: function(obj: PVipsObject): longint; cdecl;
    postbuild: function(obj: PVipsObject; data: pointer): longint; cdecl;
    summary_class: procedure(cls: PVipsObjectClass; buf: PVipsBuf); cdecl;
    summary: procedure(obj: PVipsObject; buf: PVipsBuf); cdecl;
    dump: procedure(obj: PVipsObject; buf: PVipsBuf); cdecl;
    sanity: procedure(obj: PVipsObject; buf: PVipsBuf); cdecl;
    rewind: procedure(obj: PVipsObject); cdecl;
    preclose: procedure(obj: PVipsObject); cdecl;
    close: procedure(obj: PVipsObject); cdecl;
    postclose: procedure(obj: PVipsObject); cdecl;
    new_from_string: function(_string: pchar): PVipsObject; cdecl;
    to_string: procedure(obj: PVipsObject; buf: PVipsBuf); cdecl;
    output_needs_arg: Tgboolean;
    output_to_arg: function(obj: PVipsObject; _string: pchar): longint; cdecl;
    nickname: pchar;
    description: pchar;
    argument_table: PVipsArgumentTable;
    argument_table_traverse: PGSList;
    argument_table_traverse_gtype: TGType;
    deprecated: Tgboolean;
    _vips_reserved1: procedure; cdecl;
    _vips_reserved2: procedure; cdecl;
    _vips_reserved3: procedure; cdecl;
    _vips_reserved4: procedure; cdecl;
  end;

  TVipsArgument = record
    pspec: PGParamSpec;
  end;
  PVipsArgument = ^TVipsArgument;

  TVipsArgumentClass = record
    parent: TVipsArgument;
    object_class: PVipsObjectClass;
    flags: TVipsArgumentFlags;
    priority: longint;
    offset: Tguint;
  end;
  PVipsArgumentClass = ^TVipsArgumentClass;
  PPVipsArgumentClass = ^PVipsArgumentClass;

  TVipsArgumentInstance = record
    parent: TVipsArgument;
    argument_class: PVipsArgumentClass;
    obj: PVipsObject;
    assigned: Tgboolean;
    close_id: Tgulong;
    invalidate_id: Tgulong;
  end;
  PVipsArgumentInstance = ^TVipsArgumentInstance;
  PPVipsArgumentInstance = ^PVipsArgumentInstance;

  TVipsArgumentMapFn = function(obj: PVipsObject; pspec: PGParamSpec; argument_class: PVipsArgumentClass; argument_instance: PVipsArgumentInstance; a: pointer; b: pointer): pointer; cdecl;
  TVipsArgumentClassMapFn = function(object_class: PVipsObjectClass; pspec: PGParamSpec; argument_class: PVipsArgumentClass; a: pointer; b: pointer): pointer; cdecl;
  TVipsObjectSetArguments = function(obj: PVipsObject; a: pointer; b: pointer): pointer; cdecl;

  TVipsTypeMapFn = function(_type: TGType; a: pointer): pointer; cdecl;
  TVipsTypeMap2Fn = function(_type: TGType; a: pointer; b: pointer): pointer; cdecl;
  TVipsClassMapFn = function(cls: PVipsObjectClass; a: pointer): pointer; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_argument_get_id: longint; cdecl; external libvips;
procedure vips__object_set_member(obj: PVipsObject; pspec: PGParamSpec; member: PPGObject; argument: PGObject); cdecl; external libvips;

function vips_argument_map(obj: PVipsObject; fn: TVipsArgumentMapFn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_object_get_args(obj: PVipsObject; names: PPPchar; flags: PPlongint; n_args: Plongint): longint; cdecl; external libvips;

function vips_argument_class_map(object_class: PVipsObjectClass; fn: TVipsArgumentClassMapFn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_argument_class_needsstring(argument_class: PVipsArgumentClass): Tgboolean; cdecl; external libvips;
function vips_object_get_argument(obj: PVipsObject; name: pchar; pspec: PPGParamSpec; argument_class: PPVipsArgumentClass; argument_instance: PPVipsArgumentInstance): longint; cdecl; external libvips;
function vips_object_argument_isset(obj: PVipsObject; name: pchar): Tgboolean; cdecl; external libvips;
function vips_object_get_argument_flags(obj: PVipsObject; name: pchar): TVipsArgumentFlags; cdecl; external libvips;
function vips_object_get_argument_priority(obj: PVipsObject; name: pchar): longint; cdecl; external libvips;
function vips_value_is_null(psoec: PGParamSpec; value: PGValue): Tgboolean; cdecl; external libvips;
procedure vips_object_set_property(gobject: PGObject; property_id: Tguint; value: PGValue; pspec: PGParamSpec); cdecl; external libvips;
procedure vips_object_get_property(gobject: PGObject; property_id: Tguint; value: PGValue; pspec: PGParamSpec); cdecl; external libvips;
procedure vips_object_preclose(obj: PVipsObject); cdecl; external libvips;
function vips_object_build(obj: PVipsObject): longint; cdecl; external libvips;
procedure vips_object_summary_class(klass: PVipsObjectClass; buf: PVipsBuf); cdecl; external libvips;
procedure vips_object_summary(obj: PVipsObject; buf: PVipsBuf); cdecl; external libvips;
procedure vips_object_dump(obj: PVipsObject; buf: PVipsBuf); cdecl; external libvips;
procedure vips_object_print_summary_class(klass: PVipsObjectClass); cdecl; external libvips;
procedure vips_object_print_summary(obj: PVipsObject); cdecl; external libvips;
procedure vips_object_print_dump(obj: PVipsObject); cdecl; external libvips;
procedure vips_object_print_name(obj: PVipsObject); cdecl; external libvips;
function vips_object_sanity(obj: PVipsObject): Tgboolean; cdecl; external libvips;
function vips_object_get_type: TGType; cdecl; external libvips;
procedure vips_object_class_install_argument(cls: PVipsObjectClass; pspec: PGParamSpec; flags: TVipsArgumentFlags; priority: longint; offset: Tguint); cdecl; external libvips;
function vips_object_set_argument_from_string(obj: PVipsObject; name: pchar; value: pchar): longint; cdecl; external libvips;
function vips_object_argument_needsstring(obj: PVipsObject; name: pchar): Tgboolean; cdecl; external libvips;
function vips_object_get_argument_to_string(obj: PVipsObject; name: pchar; arg: pchar): longint; cdecl; external libvips;
function vips_object_set_required(obj: PVipsObject; value: pchar): longint; cdecl; external libvips;
function vips_object_new(_type: TGType; set_: TVipsObjectSetArguments; a: pointer; b: pointer): PVipsObject; cdecl; external libvips;
function vips_object_set_valist(obj: PVipsObject; ap: Tva_list): longint; cdecl; external libvips;
function vips_object_set(obj: PVipsObject): longint; varargs; cdecl; external libvips;
function vips_object_set_from_string(obj: PVipsObject; _string: pchar): longint; cdecl; external libvips;
function vips_object_new_from_string(object_class: PVipsObjectClass; p: pchar): PVipsObject; cdecl; external libvips;
procedure vips_object_to_string(obj: PVipsObject; buf: PVipsBuf); cdecl; external libvips;
function vips_object_map(fn: TVipsSListMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;

function vips_type_map(base: TGType; fn: TVipsTypeMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_type_map_all(base: TGType; fn: TVipsTypeMapFn; a: pointer): pointer; cdecl; external libvips;
function vips_type_depth(_type: TGType): longint; cdecl; external libvips;
function vips_type_find(basename: pchar; nickname: pchar): TGType; cdecl; external libvips;
function vips_nickname_find(_type: TGType): pchar; cdecl; external libvips;
function vips_class_map_all(_type: TGType; fn: TVipsClassMapFn; a: pointer): pointer; cdecl; external libvips;
function vips_class_find(basename: pchar; nickname: pchar): PVipsObjectClass; cdecl; external libvips;
function vips_object_local_array(parent: PVipsObject; n: longint): PPVipsObject; cdecl; external libvips;
procedure vips_object_local_cb(vobj: PVipsObject; gobject: PGObject); cdecl; external libvips;
function vips_object_local(V, G: Pointer): Tgulong;

procedure vips_object_set_static(obj: PVipsObject; static_object: Tgboolean); cdecl; external libvips;
procedure vips_object_print_all; cdecl; external libvips;
procedure vips_object_sanity_all; cdecl; external libvips;
procedure vips_object_rewind(obj: PVipsObject); cdecl; external libvips;
procedure vips_object_unref_outputs(obj: PVipsObject); cdecl; external libvips;
function vips_object_get_description(obj: PVipsObject): pchar; cdecl; external libvips;

// === Konventiert am: 26-4-26 16:11:30 ===

function VIPS_TYPE_OBJECT: TGType;
function VIPS_OBJECT(obj: Pointer): PVipsObject;
function VIPS_OBJECT_CLASS(klass: Pointer): PVipsObjectClass;
function VIPS_IS_OBJECT(obj: Pointer): Tgboolean;
function VIPS_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function VIPS_OBJECT_GET_CLASS(obj: Pointer): PVipsObjectClass;
{$ENDIF read_function}

implementation

function VIPS_TYPE_OBJECT: TGType;
begin
  VIPS_TYPE_OBJECT := vips_object_get_type;
end;

function VIPS_OBJECT(obj: Pointer): PVipsObject;
begin
  Result := PVipsObject(g_type_check_instance_cast(obj, VIPS_TYPE_OBJECT));
end;

function VIPS_OBJECT_CLASS(klass: Pointer): PVipsObjectClass;
begin
  Result := PVipsObjectClass(g_type_check_class_cast(klass, VIPS_TYPE_OBJECT));
end;

function VIPS_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_OBJECT);
end;

function VIPS_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_OBJECT);
end;

function VIPS_OBJECT_GET_CLASS(obj: Pointer): PVipsObjectClass;
begin
  Result := PVipsObjectClass(PGTypeInstance(obj)^.g_class);
end;



function vips_object_local(V, G: Pointer): Tgulong;
begin
  vips_object_local := g_signal_connect(V, 'close', G_CALLBACK(@vips_object_local_cb), G);
end;


end.
