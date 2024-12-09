
{$IFDEF read_interface}

var
  _gst_buffer_type: TGType; cvar;external libgstreamer;

type
  PGstBufferFlags = ^TGstBufferFlags;
  TGstBufferFlags = longint;

const
  GST_BUFFER_FLAG_LIVE = GST_MINI_OBJECT_FLAG_LAST shl 0;
  GST_BUFFER_FLAG_DECODE_ONLY = GST_MINI_OBJECT_FLAG_LAST shl 1;
  GST_BUFFER_FLAG_DISCONT = GST_MINI_OBJECT_FLAG_LAST shl 2;
  GST_BUFFER_FLAG_RESYNC = GST_MINI_OBJECT_FLAG_LAST shl 3;
  GST_BUFFER_FLAG_CORRUPTED = GST_MINI_OBJECT_FLAG_LAST shl 4;
  GST_BUFFER_FLAG_MARKER = GST_MINI_OBJECT_FLAG_LAST shl 5;
  GST_BUFFER_FLAG_HEADER = GST_MINI_OBJECT_FLAG_LAST shl 6;
  GST_BUFFER_FLAG_GAP = GST_MINI_OBJECT_FLAG_LAST shl 7;
  GST_BUFFER_FLAG_DROPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 8;
  GST_BUFFER_FLAG_DELTA_UNIT = GST_MINI_OBJECT_FLAG_LAST shl 9;
  GST_BUFFER_FLAG_TAG_MEMORY = GST_MINI_OBJECT_FLAG_LAST shl 10;
  GST_BUFFER_FLAG_SYNC_AFTER = GST_MINI_OBJECT_FLAG_LAST shl 11;
  GST_BUFFER_FLAG_NON_DROPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 12;
  GST_BUFFER_FLAG_LAST = GST_MINI_OBJECT_FLAG_LAST shl 16;

function gst_buffer_get_type: TGType; cdecl; external libgstreamer;
function gst_buffer_get_max_memory: Tguint; cdecl; external libgstreamer;
function gst_buffer_new: PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_new_allocate(allocator: PGstAllocator; size: Tgsize; params: PGstAllocationParams): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_new_wrapped_full(flags: TGstMemoryFlags; Data: Tgpointer; maxsize: Tgsize; offset: Tgsize; size: Tgsize;
  user_data: Tgpointer; notify: TGDestroyNotify): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_new_wrapped(Data: Tgpointer; size: Tgsize): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_new_wrapped_bytes(bytes: PGBytes): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_new_memdup(Data: Tgconstpointer; size: Tgsize): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_n_memory(buffer: PGstBuffer): Tguint; cdecl; external libgstreamer;
procedure gst_buffer_insert_memory(buffer: PGstBuffer; idx: Tgint; mem: PGstMemory); cdecl; external libgstreamer;
procedure gst_buffer_replace_memory_range(buffer: PGstBuffer; idx: Tguint; length: Tgint; mem: PGstMemory); cdecl; external libgstreamer;
function gst_buffer_peek_memory(buffer: PGstBuffer; idx: Tguint): PGstMemory; cdecl; external libgstreamer;
function gst_buffer_get_memory_range(buffer: PGstBuffer; idx: Tguint; length: Tgint): PGstMemory; cdecl; external libgstreamer;
procedure gst_buffer_remove_memory_range(buffer: PGstBuffer; idx: Tguint; length: Tgint); cdecl; external libgstreamer;
procedure gst_buffer_prepend_memory(buffer: PGstBuffer; mem: PGstMemory); cdecl; external libgstreamer;
procedure gst_buffer_append_memory(buffer: PGstBuffer; mem: PGstMemory); cdecl; external libgstreamer;
procedure gst_buffer_replace_memory(buffer: PGstBuffer; idx: Tguint; mem: PGstMemory); cdecl; external libgstreamer;
procedure gst_buffer_replace_all_memory(buffer: PGstBuffer; mem: PGstMemory); cdecl; external libgstreamer;
function gst_buffer_get_memory(buffer: PGstBuffer; idx: Tguint): PGstMemory; cdecl; external libgstreamer;
function gst_buffer_get_all_memory(buffer: PGstBuffer): PGstMemory; cdecl; external libgstreamer;
procedure gst_buffer_remove_memory(buffer: PGstBuffer; idx: Tguint); cdecl; external libgstreamer;
procedure gst_buffer_remove_all_memory(buffer: PGstBuffer); cdecl; external libgstreamer;
function gst_buffer_find_memory(buffer: PGstBuffer; offset: Tgsize; size: Tgsize; idx: Pguint; length: Pguint;
  skip: Pgsize): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_is_memory_range_writable(buffer: PGstBuffer; idx: Tguint; length: Tgint): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_is_all_memory_writable(buffer: PGstBuffer): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_fill(buffer: PGstBuffer; offset: Tgsize; src: Tgconstpointer; size: Tgsize): Tgsize; cdecl; external libgstreamer;
function gst_buffer_extract(buffer: PGstBuffer; offset: Tgsize; dest: Tgpointer; size: Tgsize): Tgsize; cdecl; external libgstreamer;
function gst_buffer_memcmp(buffer: PGstBuffer; offset: Tgsize; mem: Tgconstpointer; size: Tgsize): Tgint; cdecl; external libgstreamer;
function gst_buffer_memset(buffer: PGstBuffer; offset: Tgsize; val: Tguint8; size: Tgsize): Tgsize; cdecl; external libgstreamer;
function gst_buffer_get_sizes_range(buffer: PGstBuffer; idx: Tguint; length: Tgint; offset: Pgsize; maxsize: Pgsize): Tgsize; cdecl; external libgstreamer;
function gst_buffer_resize_range(buffer: PGstBuffer; idx: Tguint; length: Tgint; offset: Tgssize; size: Tgssize): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_get_sizes(buffer: PGstBuffer; offset: Pgsize; maxsize: Pgsize): Tgsize; cdecl; external libgstreamer;
function gst_buffer_get_size(buffer: PGstBuffer): Tgsize; cdecl; external libgstreamer;
procedure gst_buffer_resize(buffer: PGstBuffer; offset: Tgssize; size: Tgssize); cdecl; external libgstreamer;
procedure gst_buffer_set_size(buffer: PGstBuffer; size: Tgssize); cdecl; external libgstreamer;
function gst_buffer_map_range(buffer: PGstBuffer; idx: Tguint; length: Tgint; info: PGstMapInfo; flags: TGstMapFlags): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_map(buffer: PGstBuffer; info: PGstMapInfo; flags: TGstMapFlags): Tgboolean; cdecl; external libgstreamer;
procedure gst_buffer_unmap(buffer: PGstBuffer; info: PGstMapInfo); cdecl; external libgstreamer;
procedure gst_buffer_extract_dup(buffer: PGstBuffer; offset: Tgsize; size: Tgsize; dest: Pgpointer; dest_size: Pgsize); cdecl; external libgstreamer;
function gst_buffer_get_flags(buffer: PGstBuffer): TGstBufferFlags; cdecl; external libgstreamer;
function gst_buffer_has_flags(buffer: PGstBuffer; flags: TGstBufferFlags): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_set_flags(buffer: PGstBuffer; flags: TGstBufferFlags): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_unset_flags(buffer: PGstBuffer; flags: TGstBufferFlags): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_ref(buf: PGstBuffer): PGstBuffer; cdecl; external libgstreamer;
procedure gst_buffer_unref(buf: PGstBuffer); cdecl; external libgstreamer;
procedure gst_clear_buffer(buf_ptr: PPGstBuffer); cdecl; external libgstreamer;
function gst_buffer_copy(buf: PGstBuffer): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_copy_deep(buf: PGstBuffer): PGstBuffer; cdecl; external libgstreamer;

type
  PGstBufferCopyFlags = ^TGstBufferCopyFlags;
  TGstBufferCopyFlags = longint;

const
  GST_BUFFER_COPY_NONE = 0;
  GST_BUFFER_COPY_FLAGS = 1 shl 0;
  GST_BUFFER_COPY_TIMESTAMPS = 1 shl 1;
  GST_BUFFER_COPY_META = 1 shl 2;
  GST_BUFFER_COPY_MEMORY = 1 shl 3;
  GST_BUFFER_COPY_MERGE = 1 shl 4;
  GST_BUFFER_COPY_DEEP_ = 1 shl 5;

function gst_buffer_copy_into(dest: PGstBuffer; src: PGstBuffer; flags: TGstBufferCopyFlags; offset: Tgsize; size: Tgsize): Tgboolean; cdecl; external libgstreamer;

function gst_buffer_replace(obuf: PPGstBuffer; nbuf: PGstBuffer): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_copy_region(parent: PGstBuffer; flags: TGstBufferCopyFlags; offset: Tgsize; size: Tgsize): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_append_region(buf1: PGstBuffer; buf2: PGstBuffer; offset: Tgssize; size: Tgssize): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_append(buf1: PGstBuffer; buf2: PGstBuffer): PGstBuffer; cdecl; external libgstreamer;

type
  TGstBufferForeachMetaFunc = function(buffer: PGstBuffer; meta: PPGstMeta; user_data: Tgpointer): Tgboolean; cdecl;

function gst_buffer_get_meta(buffer: PGstBuffer; api: TGType): PGstMeta; cdecl; external libgstreamer;
function gst_buffer_get_n_meta(buffer: PGstBuffer; api_type: TGType): Tguint; cdecl; external libgstreamer;
function gst_buffer_add_meta(buffer: PGstBuffer; info: PGstMetaInfo; params: Tgpointer): PGstMeta; cdecl; external libgstreamer;
function gst_buffer_remove_meta(buffer: PGstBuffer; meta: PGstMeta): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_iterate_meta(buffer: PGstBuffer; state: Pgpointer): PGstMeta; cdecl; external libgstreamer;
function gst_buffer_iterate_meta_filtered(buffer: PGstBuffer; state: Pgpointer; meta_api_type: TGType): PGstMeta; cdecl; external libgstreamer;
function gst_buffer_foreach_meta(buffer: PGstBuffer; func: TGstBufferForeachMetaFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_add_custom_meta(buffer: PGstBuffer; Name: Pgchar): PGstCustomMeta; cdecl; external libgstreamer;
function gst_buffer_get_custom_meta(buffer: PGstBuffer; Name: Pgchar): PGstCustomMeta; cdecl; external libgstreamer;

type
  PGstParentBufferMeta = ^TGstParentBufferMeta;

  TGstParentBufferMeta = record
    parent: TGstMeta;
    buffer: PGstBuffer;
  end;

function gst_parent_buffer_meta_api_get_type: TGType; cdecl; external libgstreamer;

function gst_buffer_add_parent_buffer_meta(buffer: PGstBuffer; ref: PGstBuffer): PGstParentBufferMeta; cdecl; external libgstreamer;

type
  PGstReferenceTimestampMeta = ^TGstReferenceTimestampMeta;

  TGstReferenceTimestampMeta = record
    parent: TGstMeta;
    reference: PGstCaps;
    timestamp: TGstClockTime;
    duration: TGstClockTime;
  end;

function gst_buffer_add_reference_timestamp_meta(buffer: PGstBuffer; reference: PGstCaps; timestamp: TGstClockTime; duration: TGstClockTime): PGstReferenceTimestampMeta; cdecl; external libgstreamer;
function gst_buffer_get_reference_timestamp_meta(buffer: PGstBuffer; reference: PGstCaps): PGstReferenceTimestampMeta; cdecl; external libgstreamer;

type
  PGstBufferMapInfo = ^TGstBufferMapInfo;
  TGstBufferMapInfo = TGstMapInfo;


function gst_parent_buffer_meta_get_info: PGstMetaInfo; cdecl; external libgstreamer;
function gst_reference_timestamp_meta_api_get_type: TGType; cdecl; external libgstreamer;
function gst_reference_timestamp_meta_get_info: PGstMetaInfo; cdecl; external libgstreamer;

procedure _gst_buffer_map_info_clear(info: PGstBufferMapInfo);

function GST_TYPE_BUFFER: TGType;

function GST_IS_BUFFER(obj: Pointer): Tgboolean;
function GST_BUFFER_CAST(obj: Pointer): PGstBuffer;
function GST_BUFFER(obj: Pointer): PGstBuffer;
function GST_BUFFER_FLAGS(buf: Pointer): Tguint32;
function GST_BUFFER_FLAG_IS_SET(buf: Pointer; flag: Tguint32): Tgboolean;
procedure GST_BUFFER_FLAG_SET(var buf: Pointer; flag: Tguint32);
procedure GST_BUFFER_FLAG_UNSET(var buf: Pointer; flag: Tguint32);
function GST_BUFFER_PTS(buf: PGstBuffer): TGstClockTime;
function GST_BUFFER_DTS(buf: PGstBuffer): TGstClockTime;
function GST_BUFFER_DTS_OR_PTS(buf: PGstBuffer): TGstClockTime;
function GST_BUFFER_DURATION(buf: PGstBuffer): TGstClockTime;
function GST_BUFFER_OFFSET(buf: PGstBuffer): Tguint64;
function GST_BUFFER_OFFSET_END(buf: PGstBuffer): Tguint64;
function GST_BUFFER_OFFSET_NONE: Tguint64;
function GST_BUFFER_DURATION_IS_VALID(buffer: PGstBuffer): Tgboolean;
function GST_BUFFER_PTS_IS_VALID(buffer: PGstBuffer): Tgboolean;
function GST_BUFFER_DTS_IS_VALID(buffer: PGstBuffer): Tgboolean;
function GST_BUFFER_OFFSET_IS_VALID(buffer: PGstBuffer): Tgboolean;
function GST_BUFFER_OFFSET_END_IS_VALID(buffer: PGstBuffer): Tgboolean;
function GST_BUFFER_IS_DISCONT(buffer: PGstBuffer): Tgboolean;

function GST_BUFFER_COPY_METADATA: TGstBufferCopyFlags;
function GST_BUFFER_COPY_ALL: TGstBufferCopyFlags;

function gst_buffer_is_writable(buf: PGstBuffer): Tgboolean;
function gst_buffer_make_writable(buf: PGstBuffer): PGstBuffer;

procedure gst_value_set_buffer(v: PGValue; b: Tgconstpointer);
procedure gst_value_take_buffer(v: PGValue; b: Tgconstpointer);
function gst_value_get_buffer(v: PGValue): PGstBuffer;

function GST_PARENT_BUFFER_META_API_TYPE: TGType;
function gst_buffer_get_parent_buffer_meta(b: PGstBuffer): PGstParentBufferMeta;

function GST_PARENT_BUFFER_META_INFO: PGstMetaInfo;

function GST_REFERENCE_TIMESTAMP_META_API_TYPE: TGType;
function GST_REFERENCE_TIMESTAMP_META_INFO: PGstMetaInfo;


function GST_TYPE_PARENT_BUFFER_META_API_TYPE: TGType;


// === Konventiert am: 12-9-24 17:55:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PARENT_BUFFER_META_API_TYPE: TGType;
begin
  Result := GST_PARENT_BUFFER_META_API_TYPE;
end;

procedure _gst_buffer_map_info_clear(info: PGstBufferMapInfo);
begin
  if info^.memory <> nil then begin
    gst_memory_unmap(info^.memory, info);
    gst_memory_unref(info^.memory);
  end;
end;


function GST_TYPE_BUFFER: TGType;
begin
  Result := _gst_buffer_type;
end;

function GST_IS_BUFFER(obj: Pointer): Tgboolean;
begin
  GST_IS_BUFFER := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_BUFFER);
end;

function GST_BUFFER_CAST(obj: Pointer): PGstBuffer;
begin
  GST_BUFFER_CAST := PGstBuffer(obj);
end;

function GST_BUFFER(obj: Pointer): PGstBuffer;
begin
  GST_BUFFER := GST_BUFFER_CAST(obj);
end;

function GST_BUFFER_FLAGS(buf: Pointer): Tguint32;
begin
  GST_BUFFER_FLAGS := GST_MINI_OBJECT_FLAGS(buf);
end;

function GST_BUFFER_FLAG_IS_SET(buf: Pointer; flag: Tguint32): Tgboolean;
begin
  GST_BUFFER_FLAG_IS_SET := GST_MINI_OBJECT_FLAG_IS_SET(buf, flag);
end;

procedure GST_BUFFER_FLAG_SET(var buf: Pointer; flag: Tguint32);
begin
  GST_MINI_OBJECT_FLAG_SET(buf, flag);
end;

procedure GST_BUFFER_FLAG_UNSET(var buf: Pointer; flag: Tguint32);
begin
  GST_MINI_OBJECT_FLAG_UNSET(buf, flag);
end;

function GST_BUFFER_PTS(buf: PGstBuffer): TGstClockTime;
begin
  GST_BUFFER_PTS := (GST_BUFFER_CAST(buf))^.pts;
end;

function GST_BUFFER_DTS(buf: PGstBuffer): TGstClockTime;
begin
  GST_BUFFER_DTS := (GST_BUFFER_CAST(buf))^.dts;
end;

function GST_BUFFER_DTS_OR_PTS(buf: PGstBuffer): TGstClockTime;
begin
  if GST_BUFFER_DTS_IS_VALID(buf) then begin
    Result := GST_BUFFER_DTS(buf);
  end else begin
    Result := GST_BUFFER_PTS(buf);
  end;
end;

function GST_BUFFER_DURATION(buf: PGstBuffer): TGstClockTime;
begin
  GST_BUFFER_DURATION := (GST_BUFFER_CAST(buf))^.duration;
end;

function GST_BUFFER_OFFSET(buf: PGstBuffer): Tguint64;
begin
  GST_BUFFER_OFFSET := (GST_BUFFER_CAST(buf))^.offset;
end;

function GST_BUFFER_OFFSET_END(buf: PGstBuffer): Tguint64;
begin
  GST_BUFFER_OFFSET_END := (GST_BUFFER_CAST(buf))^.offset_end;
end;

function GST_BUFFER_OFFSET_NONE: Tguint64;
begin
  GST_BUFFER_OFFSET_NONE := Tguint64(-(1));
end;

function GST_BUFFER_DURATION_IS_VALID(buffer: PGstBuffer): Tgboolean;
begin
  GST_BUFFER_DURATION_IS_VALID := GST_CLOCK_TIME_IS_VALID(GST_BUFFER_DURATION(buffer));
end;

function GST_BUFFER_PTS_IS_VALID(buffer: PGstBuffer): Tgboolean;
begin
  GST_BUFFER_PTS_IS_VALID := GST_CLOCK_TIME_IS_VALID(GST_BUFFER_PTS(buffer));
end;

function GST_BUFFER_DTS_IS_VALID(buffer: PGstBuffer): Tgboolean;
begin
  GST_BUFFER_DTS_IS_VALID := GST_CLOCK_TIME_IS_VALID(GST_BUFFER_DTS(buffer));
end;

function GST_BUFFER_OFFSET_IS_VALID(buffer: PGstBuffer): Tgboolean;
begin
  GST_BUFFER_OFFSET_IS_VALID := (GST_BUFFER_OFFSET(buffer)) <> GST_BUFFER_OFFSET_NONE;
end;

function GST_BUFFER_OFFSET_END_IS_VALID(buffer: PGstBuffer): Tgboolean;
begin
  GST_BUFFER_OFFSET_END_IS_VALID := (GST_BUFFER_OFFSET_END(buffer)) <> GST_BUFFER_OFFSET_NONE;
end;

function GST_BUFFER_IS_DISCONT(buffer: PGstBuffer): Tgboolean;
begin
  GST_BUFFER_IS_DISCONT := GST_BUFFER_FLAG_IS_SET(buffer, GST_BUFFER_FLAG_DISCONT);
end;

function GST_BUFFER_COPY_METADATA: TGstBufferCopyFlags;
begin
  GST_BUFFER_COPY_METADATA := TGstBufferCopyFlags((GST_BUFFER_COPY_FLAGS or GST_BUFFER_COPY_TIMESTAMPS) or GST_BUFFER_COPY_META);
end;

function GST_BUFFER_COPY_ALL: TGstBufferCopyFlags;
begin
  GST_BUFFER_COPY_ALL := TGstBufferCopyFlags(GST_BUFFER_COPY_METADATA or GST_BUFFER_COPY_MEMORY);
end;

function gst_buffer_is_writable(buf: PGstBuffer): Tgboolean;
begin
  gst_buffer_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(buf));
end;

function gst_buffer_make_writable(buf: PGstBuffer): PGstBuffer;
begin
  gst_buffer_make_writable := GST_BUFFER_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(buf)));
end;

procedure gst_value_set_buffer(v: PGValue; b: Tgconstpointer);
begin
  g_value_set_boxed(v, b);
end;

procedure gst_value_take_buffer(v: PGValue; b: Tgconstpointer);
begin
  g_value_take_boxed(v, b);
end;

function gst_value_get_buffer(v: PGValue): PGstBuffer;
begin
  gst_value_get_buffer := GST_BUFFER_CAST(g_value_get_boxed(v));
end;

function GST_PARENT_BUFFER_META_API_TYPE: TGType;
begin
  GST_PARENT_BUFFER_META_API_TYPE := gst_parent_buffer_meta_api_get_type;
end;

function gst_buffer_get_parent_buffer_meta(b: PGstBuffer): PGstParentBufferMeta;
begin
  gst_buffer_get_parent_buffer_meta := PGstParentBufferMeta(gst_buffer_get_meta(b, GST_PARENT_BUFFER_META_API_TYPE));
end;

function GST_PARENT_BUFFER_META_INFO: PGstMetaInfo;
begin
  GST_PARENT_BUFFER_META_INFO := gst_parent_buffer_meta_get_info;
end;

function GST_REFERENCE_TIMESTAMP_META_API_TYPE: TGType;
begin
  GST_REFERENCE_TIMESTAMP_META_API_TYPE := gst_reference_timestamp_meta_api_get_type;
end;

function GST_REFERENCE_TIMESTAMP_META_INFO: PGstMetaInfo;
begin
  GST_REFERENCE_TIMESTAMP_META_INFO := gst_reference_timestamp_meta_get_info;
end;


{$ENDIF read_implementation}
