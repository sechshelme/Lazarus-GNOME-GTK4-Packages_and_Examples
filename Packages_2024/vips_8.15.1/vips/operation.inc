

  {$IFDEF read_enum}
type
  PVipsOperationFlags = ^TVipsOperationFlags;
  TVipsOperationFlags = longint;

const
  VIPS_OPERATION_NONE = 0;
  VIPS_OPERATION_SEQUENTIAL = 1;
  VIPS_OPERATION_SEQUENTIAL_UNBUFFERED = 2;
  VIPS_OPERATION_NOCACHE = 4;
  VIPS_OPERATION_DEPRECATED = 8;
  VIPS_OPERATION_UNTRUSTED = 16;
  VIPS_OPERATION_BLOCKED = 32;
  VIPS_OPERATION_REVALIDATE = 64;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsOperationBuildFn = function(obj: PVipsObject): Tgboolean; cdecl;

  TVipsOperation = record
    parent_instance: TVipsObject;
    hash: Tguint;
    found_hash: Tgboolean;
    pixels: longint;
  end;
  PVipsOperation = ^TVipsOperation;
  PPVipsOperation = ^PVipsOperation;

  PVipsOperationClass = ^TVipsOperationClass;

  TVipsOperationClass = record
    parent_class: TVipsObjectClass;
    usage: procedure(cls: PVipsOperationClass; buf: PVipsBuf); cdecl;
    get_flags: function(operation: PVipsOperation): TVipsOperationFlags; cdecl;
    flags: TVipsOperationFlags;
    invalidate: procedure(operation: PVipsOperation); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_operation_get_type: TGType; cdecl; external libvips;
function vips_operation_get_flags(operation: PVipsOperation): TVipsOperationFlags; cdecl; external libvips;
procedure vips_operation_class_print_usage(operation_class: PVipsOperationClass); cdecl; external libvips;
procedure vips_operation_invalidate(operation: PVipsOperation); cdecl; external libvips;
function vips_operation_call_valist(operation: PVipsOperation; ap: Tva_list): longint; cdecl; external libvips;
function vips_operation_new(name: pchar): PVipsOperation; cdecl; external libvips;
function vips_call_required_optional(operation: PPVipsOperation; required: Tva_list; optional: Tva_list): longint; cdecl; external libvips;
function vips_call(operation_name: pchar): longint; varargs; cdecl; external libvips;
function vips_call_split(operation_name: pchar; optional: Tva_list): longint; varargs; cdecl; external libvips;
function vips_call_split_option_string(operation_name: pchar; option_string: pchar; optional: Tva_list): longint; varargs; cdecl; external libvips;
procedure vips_call_options(group: PGOptionGroup; operation: PVipsOperation); cdecl; external libvips;
function vips_call_argv(operation: PVipsOperation; argc: longint; argv: PPchar): longint; cdecl; external libvips;
procedure vips_cache_drop_all; cdecl; external libvips;
function vips_cache_operation_lookup(operation: PVipsOperation): PVipsOperation; cdecl; external libvips; deprecated;
procedure vips_cache_operation_add(operation: PVipsOperation); cdecl; external libvips; deprecated;
function vips_cache_operation_buildp(operation: PPVipsOperation): longint; cdecl; external libvips;
function vips_cache_operation_build(operation: PVipsOperation): PVipsOperation; cdecl; external libvips;
procedure vips_cache_print; cdecl; external libvips;
procedure vips_cache_set_max(max: longint); cdecl; external libvips;
procedure vips_cache_set_max_mem(max_mem: Tsize_t); cdecl; external libvips;
function vips_cache_get_max: longint; cdecl; external libvips;
function vips_cache_get_size: longint; cdecl; external libvips;
function vips_cache_get_max_mem: Tsize_t; cdecl; external libvips;
function vips_cache_get_max_files: longint; cdecl; external libvips;
procedure vips_cache_set_max_files(max_files: longint); cdecl; external libvips;
procedure vips_cache_set_dump(dump: Tgboolean); cdecl; external libvips;
procedure vips_cache_set_trace(trace: Tgboolean); cdecl; external libvips;
procedure vips_concurrency_set(concurrency: longint); cdecl; external libvips;
function vips_concurrency_get: longint; cdecl; external libvips;
procedure vips_operation_block_set(name: pchar; state: Tgboolean); cdecl; external libvips;

// === Konventiert am: 26-4-26 16:11:14 ===

function VIPS_TYPE_OPERATION: TGType;
function VIPS_OPERATION(obj: Pointer): PVipsOperation;
function VIPS_OPERATION_CLASS(klass: Pointer): PVipsOperationClass;
function VIPS_IS_OPERATION(obj: Pointer): Tgboolean;
function VIPS_IS_OPERATION_CLASS(klass: Pointer): Tgboolean;
function VIPS_OPERATION_GET_CLASS(obj: Pointer): PVipsOperationClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function VIPS_TYPE_OPERATION: TGType;
begin
  VIPS_TYPE_OPERATION := vips_operation_get_type;
end;

function VIPS_OPERATION(obj: Pointer): PVipsOperation;
begin
  Result := PVipsOperation(g_type_check_instance_cast(obj, VIPS_TYPE_OPERATION));
end;

function VIPS_OPERATION_CLASS(klass: Pointer): PVipsOperationClass;
begin
  Result := PVipsOperationClass(g_type_check_class_cast(klass, VIPS_TYPE_OPERATION));
end;

function VIPS_IS_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_OPERATION);
end;

function VIPS_IS_OPERATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_OPERATION);
end;

function VIPS_OPERATION_GET_CLASS(obj: Pointer): PVipsOperationClass;
begin
  Result := PVipsOperationClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
