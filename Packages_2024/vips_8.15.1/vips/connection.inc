
  {$IFDEF read_struct}
type
  TVipsConnection = record
    parent_object: TVipsObject;
    descriptor: longint;
    tracked_descriptor: longint;
    close_descriptor: longint;
    filename: pchar;
  end;
  PVipsConnection = ^TVipsConnection;

  TVipsConnectionClass = record
    parent_class: TVipsObjectClass;
  end;
  PVipsConnectionClass = ^TVipsConnectionClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_connection_get_type: TGType; cdecl; external libvips;
function vips_connection_filename(connection: PVipsConnection): pchar; cdecl; external libvips;
function vips_connection_nick(connection: PVipsConnection): pchar; cdecl; external libvips;
procedure vips_pipe_read_limit_set(limit: Tgint64); cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsSource = record
    parent_object: TVipsConnection;
    decode: Tgboolean;
    have_tested_seek: Tgboolean;
    is_pipe: Tgboolean;
    read_position: Tgint64;
    length: Tgint64;
    data: pointer;
    header_bytes: PGByteArray;
    sniff: PGByteArray;
    blob: PVipsBlob;
    mmap_baseaddr: pointer;
    mmap_length: Tsize_t;
  end;
  PVipsSource = ^TVipsSource;

  TVipsSourceClass = record
    parent_class: TVipsConnectionClass;
    read: function(para1: PVipsSource; para2: pointer; para3: Tsize_t): Tgint64; cdecl;
    seek: function(para1: PVipsSource; para2: Tgint64; para3: longint): Tgint64; cdecl;
  end;
  PVipsSourceClass = ^TVipsSourceClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_source_get_type: TGType; cdecl; external libvips;
function vips_source_new_from_descriptor(descriptor: longint): PVipsSource; cdecl; external libvips;
function vips_source_new_from_file(filename: pchar): PVipsSource; cdecl; external libvips;
function vips_source_new_from_blob(blob: PVipsBlob): PVipsSource; cdecl; external libvips;
function vips_source_new_from_target(target: PVipsTarget): PVipsSource; cdecl; external libvips;
function vips_source_new_from_memory(data: pointer; size: Tsize_t): PVipsSource; cdecl; external libvips;
function vips_source_new_from_options(options: pchar): PVipsSource; cdecl; external libvips;
procedure vips_source_minimise(source: PVipsSource); cdecl; external libvips;
function vips_source_unminimise(source: PVipsSource): longint; cdecl; external libvips;
function vips_source_decode(source: PVipsSource): longint; cdecl; external libvips;
function vips_source_read(source: PVipsSource; data: pointer; length: Tsize_t): Tgint64; cdecl; external libvips;
function vips_source_is_mappable(source: PVipsSource): Tgboolean; cdecl; external libvips;
function vips_source_is_file(source: PVipsSource): Tgboolean; cdecl; external libvips;
function vips_source_map(source: PVipsSource; length: Psize_t): pointer; cdecl; external libvips;
function vips_source_map_blob(source: PVipsSource): PVipsBlob; cdecl; external libvips;
function vips_source_seek(source: PVipsSource; offset: Tgint64; whence: longint): Tgint64; cdecl; external libvips;
function vips_source_rewind(source: PVipsSource): longint; cdecl; external libvips;
function vips_source_sniff_at_most(source: PVipsSource; data: PPbyte; length: Tsize_t): Tgint64; cdecl; external libvips;
function vips_source_sniff(source: PVipsSource; length: Tsize_t): pbyte; cdecl; external libvips;
function vips_source_length(source: PVipsSource): Tgint64; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsSourceCustom = record
    parent_object: TVipsSource;
  end;
  PVipsSourceCustom = ^TVipsSourceCustom;

  TVipsSourceCustomClass = record
    parent_class: TVipsSourceClass;
    read: function(para1: PVipsSourceCustom; para2: pointer; para3: Tgint64): Tgint64; cdecl;
    seek: function(para1: PVipsSourceCustom; para2: Tgint64; para3: longint): Tgint64; cdecl;
  end;
  PVipsSourceCustomClass = ^TVipsSourceCustomClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_source_custom_get_type: TGType; cdecl; external libvips;
function vips_source_custom_new: PVipsSourceCustom; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsGInputStream = record
    parent_instance: TGInputStream;
    source: PVipsSource;
  end;
  PVipsGInputStream = ^TVipsGInputStream;

  TVipsGInputStreamClass = record
    parent_class: TGInputStreamClass;
  end;
  PVipsGInputStreamClass = ^TVipsGInputStreamClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_g_input_stream_new_from_source(source: PVipsSource): PGInputStream; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsSourceGInputStream = record
    parent_instance: TVipsSource;
    stream: PGInputStream;
    seekable: PGSeekable;
    info: PGFileInfo;
  end;
  PVipsSourceGInputStream = ^TVipsSourceGInputStream;

  TVipsSourceGInputStreamClass = record
    parent_class: TVipsSourceClass;
  end;
  PVipsSourceGInputStreamClass = ^TVipsSourceGInputStreamClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_source_g_input_stream_new(stream: PGInputStream): PVipsSourceGInputStream; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  VIPS_TARGET_BUFFER_SIZE = 8500;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsTarget = record
    parent_object: TVipsConnection;
    memory: Tgboolean;
    ended: Tgboolean;
    memory_buffer: PGString;
    blob: PVipsBlob;
    output_buffer: array[0..(VIPS_TARGET_BUFFER_SIZE) - 1] of byte;
    write_point: longint;
    position: Toff_t;
    delete_on_close: Tgboolean;
    delete_on_close_filename: pchar;
  end;
  PVipsTarget = ^TVipsTarget;

  TVipsTargetClass = record
    parent_class: TVipsConnectionClass;
    write: function(para1: PVipsTarget; para2: pointer; para3: Tsize_t): Tgint64; cdecl;
    finish: procedure(para1: PVipsTarget); cdecl;
    read: function(para1: PVipsTarget; para2: pointer; para3: Tsize_t): Tgint64; cdecl;
    seek: function(para1: PVipsTarget; offset: Toff_t; whence: longint): Toff_t; cdecl;
    end_: function(para1: PVipsTarget): longint; cdecl;
  end;
  PVipsTargetClass = ^TVipsTargetClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_target_get_type: TGType; cdecl; external libvips;
function vips_target_new_to_descriptor(descriptor: longint): PVipsTarget; cdecl; external libvips;
function vips_target_new_to_file(filename: pchar): PVipsTarget; cdecl; external libvips;
function vips_target_new_to_memory: PVipsTarget; cdecl; external libvips;
function vips_target_new_temp(target: PVipsTarget): PVipsTarget; cdecl; external libvips;
function vips_target_write(target: PVipsTarget; data: pointer; length: Tsize_t): longint; cdecl; external libvips;
function vips_target_read(target: PVipsTarget; buffer: pointer; length: Tsize_t): Tgint64; cdecl; external libvips;
function vips_target_seek(target: PVipsTarget; offset: Toff_t; whence: longint): Toff_t; cdecl; external libvips;
function vips_target_end(target: PVipsTarget): longint; cdecl; external libvips;
procedure vips_target_finish(target: PVipsTarget); cdecl; external libvips; deprecated;
function vips_target_steal(target: PVipsTarget; length: Psize_t): pbyte; cdecl; external libvips;
function vips_target_steal_text(target: PVipsTarget): pchar; cdecl; external libvips;
function vips_target_putc(target: PVipsTarget; ch: longint): longint; cdecl; external libvips;
function vips_target_writes(target: PVipsTarget; str: pchar): longint; cdecl; external libvips;
function vips_target_writef(target: PVipsTarget; fmt: pchar; args: array of const): longint; cdecl; external libvips;
function vips_target_writef(target: PVipsTarget; fmt: pchar): longint; cdecl; external libvips;
function vips_target_write_amp(target: PVipsTarget; str: pchar): longint; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  VIPS_TARGET_CUSTOM_BUFFER_SIZE = 4096;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsTargetCustom = record
    parent_object: TVipsTarget;
  end;
  PVipsTargetCustom = ^TVipsTargetCustom;

  TVipsTargetCustomClass = record
    parent_class: TVipsTargetClass;
    write: function(para1: PVipsTargetCustom; para2: pointer; para3: Tgint64): Tgint64; cdecl;
    finish: procedure(para1: PVipsTargetCustom); cdecl;
    read: function(para1: PVipsTargetCustom; para2: pointer; para3: Tgint64): Tgint64; cdecl;
    seek: function(para1: PVipsTargetCustom; para2: Tgint64; para3: longint): Tgint64; cdecl;
    end_: function(para1: PVipsTargetCustom): longint; cdecl;
  end;
  PVipsTargetCustomClass = ^TVipsTargetCustomClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_target_custom_get_type: TGType; cdecl; external libvips;
function vips_target_custom_new: PVipsTargetCustom; cdecl; external libvips;

// === Konventiert am: 26-4-26 16:15:01 ===

function VIPS_TYPE_CONNECTION: TGType;
function VIPS_CONNECTION(obj: Pointer): PVipsConnection;
function VIPS_CONNECTION_CLASS(klass: Pointer): PVipsConnectionClass;
function VIPS_IS_CONNECTION(obj: Pointer): Tgboolean;
function VIPS_IS_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function VIPS_CONNECTION_GET_CLASS(obj: Pointer): PVipsConnectionClass;

function VIPS_TYPE_SOURCE: TGType;
function VIPS_SOURCE(obj: Pointer): PVipsSource;
function VIPS_SOURCE_CLASS(klass: Pointer): PVipsSourceClass;
function VIPS_IS_SOURCE(obj: Pointer): Tgboolean;
function VIPS_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
function VIPS_SOURCE_GET_CLASS(obj: Pointer): PVipsSourceClass;

function VIPS_TYPE_SOURCE_CUSTOM: TGType;
function VIPS_SOURCE_CUSTOM(obj: Pointer): PVipsSourceCustom;
function VIPS_SOURCE_CUSTOM_CLASS(klass: Pointer): PVipsSourceCustomClass;
function VIPS_IS_SOURCE_CUSTOM(obj: Pointer): Tgboolean;
function VIPS_IS_SOURCE_CUSTOM_CLASS(klass: Pointer): Tgboolean;
function VIPS_SOURCE_CUSTOM_GET_CLASS(obj: Pointer): PVipsSourceCustomClass;

function VIPS_TYPE_G_INPUT_STREAM: TGType;
function VIPS_G_INPUT_STREAM(obj: Pointer): PVipsGInputStream;
function VIPS_G_INPUT_STREAM_CLASS(klass: Pointer): PVipsGInputStreamClass;
function VIPS_IS_G_INPUT_STREAM(obj: Pointer): Tgboolean;
function VIPS_IS_G_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function VIPS_G_INPUT_STREAM_GET_CLASS(obj: Pointer): PVipsGInputStreamClass;

function VIPS_TYPE_SOURCE_G_INPUT_STREAM: TGType;
function VIPS_SOURCE_G_INPUT_STREAM(obj: Pointer): PVipsSourceGInputStream;
function VIPS_SOURCE_G_INPUT_STREAM_CLASS(klass: Pointer): PVipsSourceGInputStreamClass;
function VIPS_IS_SOURCE_G_INPUT_STREAM(obj: Pointer): Tgboolean;
function VIPS_IS_SOURCE_G_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function VIPS_SOURCE_G_INPUT_STREAM_GET_CLASS(obj: Pointer): PVipsSourceGInputStreamClass;

function VIPS_TYPE_TARGET: TGType;
function VIPS_TARGET(obj: Pointer): PVipsTarget;
function VIPS_TARGET_CLASS(klass: Pointer): PVipsTargetClass;
function VIPS_IS_TARGET(obj: Pointer): Tgboolean;
function VIPS_IS_TARGET_CLASS(klass: Pointer): Tgboolean;
function VIPS_TARGET_GET_CLASS(obj: Pointer): PVipsTargetClass;

function VIPS_TYPE_TARGET_CUSTOM: TGType;
function VIPS_TARGET_CUSTOM(obj: Pointer): PVipsTargetCustom;
function VIPS_TARGET_CUSTOM_CLASS(klass: Pointer): PVipsTargetCustomClass;
function VIPS_IS_TARGET_CUSTOM(obj: Pointer): Tgboolean;
function VIPS_IS_TARGET_CUSTOM_CLASS(klass: Pointer): Tgboolean;
function VIPS_TARGET_CUSTOM_GET_CLASS(obj: Pointer): PVipsTargetCustomClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function VIPS_TYPE_CONNECTION: TGType;
begin
  VIPS_TYPE_CONNECTION := vips_connection_get_type;
end;

function VIPS_CONNECTION(obj: Pointer): PVipsConnection;
begin
  Result := PVipsConnection(g_type_check_instance_cast(obj, VIPS_TYPE_CONNECTION));
end;

function VIPS_CONNECTION_CLASS(klass: Pointer): PVipsConnectionClass;
begin
  Result := PVipsConnectionClass(g_type_check_class_cast(klass, VIPS_TYPE_CONNECTION));
end;

function VIPS_IS_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_CONNECTION);
end;

function VIPS_IS_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_CONNECTION);
end;

function VIPS_CONNECTION_GET_CLASS(obj: Pointer): PVipsConnectionClass;
begin
  Result := PVipsConnectionClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_SOURCE: TGType;
begin
  Result := vips_source_get_type;
end;

function VIPS_SOURCE(obj: Pointer): PVipsSource;
begin
  Result := PVipsSource(g_type_check_instance_cast(obj, VIPS_TYPE_SOURCE));
end;

function VIPS_SOURCE_CLASS(klass: Pointer): PVipsSourceClass;
begin
  Result := PVipsSourceClass(g_type_check_class_cast(klass, VIPS_TYPE_SOURCE));
end;

function VIPS_IS_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_SOURCE);
end;

function VIPS_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_SOURCE);
end;

function VIPS_SOURCE_GET_CLASS(obj: Pointer): PVipsSourceClass;
begin
  Result := PVipsSourceClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_SOURCE_CUSTOM: TGType;
begin
  Result := vips_source_custom_get_type;
end;

function VIPS_SOURCE_CUSTOM(obj: Pointer): PVipsSourceCustom;
begin
  Result := PVipsSourceCustom(g_type_check_instance_cast(obj, VIPS_TYPE_SOURCE_CUSTOM));
end;

function VIPS_SOURCE_CUSTOM_CLASS(klass: Pointer): PVipsSourceCustomClass;
begin
  Result := PVipsSourceCustomClass(g_type_check_class_cast(klass, VIPS_TYPE_SOURCE_CUSTOM));
end;

function VIPS_IS_SOURCE_CUSTOM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_SOURCE_CUSTOM);
end;

function VIPS_IS_SOURCE_CUSTOM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_SOURCE_CUSTOM);
end;

function VIPS_SOURCE_CUSTOM_GET_CLASS(obj: Pointer): PVipsSourceCustomClass;
begin
  Result := PVipsSourceCustomClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_G_INPUT_STREAM: TGType;
begin
  //  Result := vips_g_input_stream_get_type;   Bei Mint nicht dabei
end;

function VIPS_G_INPUT_STREAM(obj: Pointer): PVipsGInputStream;
begin
  Result := PVipsGInputStream(g_type_check_instance_cast(obj, VIPS_TYPE_G_INPUT_STREAM));
end;

function VIPS_G_INPUT_STREAM_CLASS(klass: Pointer): PVipsGInputStreamClass;
begin
  Result := PVipsGInputStreamClass(g_type_check_class_cast(klass, VIPS_TYPE_G_INPUT_STREAM));
end;

function VIPS_IS_G_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_G_INPUT_STREAM);
end;

function VIPS_IS_G_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_G_INPUT_STREAM);
end;

function VIPS_G_INPUT_STREAM_GET_CLASS(obj: Pointer): PVipsGInputStreamClass;
begin
  Result := PVipsGInputStreamClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_SOURCE_G_INPUT_STREAM: TGType;
begin
  //   Result := vips_source_g_input_stream_get_type;   Bei Mint nicht dabei
end;

function VIPS_SOURCE_G_INPUT_STREAM(obj: Pointer): PVipsSourceGInputStream;
begin
  Result := PVipsSourceGInputStream(g_type_check_instance_cast(obj, VIPS_TYPE_SOURCE_G_INPUT_STREAM));
end;

function VIPS_SOURCE_G_INPUT_STREAM_CLASS(klass: Pointer): PVipsSourceGInputStreamClass;
begin
  Result := PVipsSourceGInputStreamClass(g_type_check_class_cast(klass, VIPS_TYPE_SOURCE_G_INPUT_STREAM));
end;

function VIPS_IS_SOURCE_G_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_SOURCE_G_INPUT_STREAM);
end;

function VIPS_IS_SOURCE_G_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_SOURCE_G_INPUT_STREAM);
end;

function VIPS_SOURCE_G_INPUT_STREAM_GET_CLASS(obj: Pointer): PVipsSourceGInputStreamClass;
begin
  Result := PVipsSourceGInputStreamClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_TARGET: TGType;
begin
  Result := vips_target_get_type;
end;

function VIPS_TARGET(obj: Pointer): PVipsTarget;
begin
  Result := PVipsTarget(g_type_check_instance_cast(obj, VIPS_TYPE_TARGET));
end;

function VIPS_TARGET_CLASS(klass: Pointer): PVipsTargetClass;
begin
  Result := PVipsTargetClass(g_type_check_class_cast(klass, VIPS_TYPE_TARGET));
end;

function VIPS_IS_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_TARGET);
end;

function VIPS_IS_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_TARGET);
end;

function VIPS_TARGET_GET_CLASS(obj: Pointer): PVipsTargetClass;
begin
  Result := PVipsTargetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_TARGET_CUSTOM: TGType;
begin
  Result := vips_target_custom_get_type;
end;

function VIPS_TARGET_CUSTOM(obj: Pointer): PVipsTargetCustom;
begin
  Result := PVipsTargetCustom(g_type_check_instance_cast(obj, VIPS_TYPE_TARGET_CUSTOM));
end;

function VIPS_TARGET_CUSTOM_CLASS(klass: Pointer): PVipsTargetCustomClass;
begin
  Result := PVipsTargetCustomClass(g_type_check_class_cast(klass, VIPS_TYPE_TARGET_CUSTOM));
end;

function VIPS_IS_TARGET_CUSTOM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_TARGET_CUSTOM);
end;

function VIPS_IS_TARGET_CUSTOM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_TARGET_CUSTOM);
end;

function VIPS_TARGET_CUSTOM_GET_CLASS(obj: Pointer): PVipsTargetCustomClass;
begin
  Result := PVipsTargetCustomClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
