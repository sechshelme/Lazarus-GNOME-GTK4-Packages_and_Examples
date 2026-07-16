

  {$IFDEF read_enum}
type
  PGstMetaFlags = ^TGstMetaFlags;
  TGstMetaFlags = longint;
const
  GST_META_FLAG_NONE = 0;
  GST_META_FLAG_READONLY = 1 shl 0;
  GST_META_FLAG_POOLED = 1 shl 1;
  GST_META_FLAG_LOCKED = 1 shl 2;
  GST_META_FLAG_LAST = 1 shl 16;

  GST_META_TAG_MEMORY_REFERENCE_STR = 'memory-reference';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstBuffer_ = type Pointer;

  PGstMeta = ^TGstMeta;
  PPGstMeta = ^PGstMeta;
  PGstMetaInfo = ^TGstMetaInfo;
  PGstCustomMeta = ^TGstCustomMeta;

  TGstMetaTransformFunction = function(transbuf: PGstBuffer_; meta: PGstMeta; buffer: PGstBuffer_; _type: TGQuark; data: Tgpointer): Tgboolean; cdecl;
  TGstCustomMetaTransformFunction = function(transbuf: PGstBuffer_; meta: PGstCustomMeta; buffer: PGstBuffer_; _type: TGQuark; data: Tgpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGstMetaSerializeFunction = function(meta: PGstMeta; data: PGstByteArrayInterface; version: Pguint8): Tgboolean; cdecl;
  TGstMetaDeserializeFunction = function(info: PGstMetaInfo; buffer: PGstBuffer_; data: Pguint8; size: Tgsize; version: Tguint8): PGstMeta; cdecl;
  TGstMetaClearFunction = procedure(buffer: PGstBuffer_; meta: PGstMeta); cdecl;
  TGstAllocationMetaParamsAggregator = function(aggregated_params: PPGstStructure; params0: PGstStructure; params1: PGstStructure): Tgboolean; cdecl;

  TGstMetaInitFunction = function(meta: PGstMeta; params: Tgpointer; buffer: PGstBuffer_): Tgboolean; cdecl;
  TGstMetaFreeFunction = procedure(meta: PGstMeta; buffer: PGstBuffer_); cdecl;

  TGstMetaInfo = record
    api: TGType;
    _type: TGType;
    size: Tgsize;
    init_func: TGstMetaInitFunction;
    free_func: TGstMetaFreeFunction;
    transform_func: TGstMetaTransformFunction;
    serialize_func: TGstMetaSerializeFunction;
    deserialize_func: TGstMetaDeserializeFunction;
    clear_func: TGstMetaClearFunction;
  end;

  TGstMeta = record
    flags: TGstMetaFlags;
    info: PGstMetaInfo;
  end;

  TGstCustomMeta = record
    meta: TGstMeta;
    structure: PGstStructure;
  end;

  PGstMetaTransformCopy = ^TGstMetaTransformCopy;
  TGstMetaTransformCopy = record
    region: Tgboolean;
    offset: Tgsize;
    size: Tgsize;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_meta_tag_memory: TGQuark; cvar;external libgstreamer;
  _gst_meta_tag_memory_reference: TGQuark; cvar;external libgstreamer;
  _gst_meta_transform_copy: TGQuark; cvar;external libgstreamer;

function gst_meta_api_type_register(api: Pgchar; tags: PPgchar): TGType; cdecl; external libgstreamer;
function gst_meta_api_type_has_tag(api: TGType; tag: TGQuark): Tgboolean; cdecl; external libgstreamer;
function gst_meta_api_type_aggregate_params(api: TGType; aggregated_params: PPGstStructure; params0: PGstStructure; params1: PGstStructure): Tgboolean; cdecl; external libgstreamer;
procedure gst_meta_api_type_set_params_aggregator(api: TGType; aggregator: TGstAllocationMetaParamsAggregator); cdecl; external libgstreamer;
function gst_meta_register(api: TGType; impl: Pgchar; size: Tgsize; init_func: TGstMetaInitFunction; free_func: TGstMetaFreeFunction;
  transform_func: TGstMetaTransformFunction): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_info_new(api: TGType; impl: Pgchar; size: Tgsize): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_info_register(info: PGstMetaInfo): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_register_custom(name: Pgchar; tags: PPgchar; transform_func: TGstCustomMetaTransformFunction; user_data: Tgpointer; destroy_data: TGDestroyNotify): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_register_custom_simple(name: Pgchar): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_info_is_custom(info: PGstMetaInfo): Tgboolean; cdecl; external libgstreamer;
function gst_custom_meta_get_structure(meta: PGstCustomMeta): PGstStructure; cdecl; external libgstreamer;
function gst_custom_meta_has_name(meta: PGstCustomMeta; name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_meta_get_info(impl: Pgchar): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_api_type_get_tags(api: TGType): PPgchar; cdecl; external libgstreamer;
function gst_meta_api_type_tags_contain_only(api: TGType; valid_tags: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_meta_get_seqnum(meta: PGstMeta): Tguint64; cdecl; external libgstreamer;
function gst_meta_compare_seqnum(meta1: PGstMeta; meta2: PGstMeta): Tgint; cdecl; external libgstreamer;
function gst_meta_serialize(meta: PGstMeta; data: PGstByteArrayInterface): Tgboolean; cdecl; external libgstreamer;
function gst_meta_serialize_simple(meta: PGstMeta; data: PGByteArray): Tgboolean; cdecl; external libgstreamer;
function gst_meta_deserialize(buffer: PGstBuffer; data: Pguint8; size: Tgsize; consumed: Pguint32): PGstMeta; cdecl; external libgstreamer;

function GST_META_TAG_MEMORY: TGQuark;

function GST_META_CAST(meta: Pointer): PGstMeta;
function GST_META_FLAGS(meta: Pointer): TGstMetaFlags;
function GST_META_FLAG_IS_SET(meta: Pointer; flag: longint): Tgboolean;
procedure GST_META_FLAG_SET(var meta: PGstMeta; flag: TGstMetaFlags);
procedure GST_META_FLAG_UNSET(var meta: PGstMeta; flag: TGstMetaFlags);

function GST_META_TRANSFORM_IS_COPY(t: TGQuark): Tgboolean;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 15:18:37 ===



{$IFDEF read_implementation}

function GST_META_TAG_MEMORY: TGQuark;
begin
  Result := _gst_meta_tag_memory;
end;

function GST_META_CAST(meta: Pointer): PGstMeta;
begin
  GST_META_CAST := PGstMeta(meta);
end;

function GST_META_FLAGS(meta: Pointer): TGstMetaFlags;
begin
  GST_META_FLAGS := (GST_META_CAST(meta))^.flags;
end;

function GST_META_FLAG_IS_SET(meta: Pointer; flag: longint): Tgboolean;
begin
  GST_META_FLAG_IS_SET := not (not ((GST_META_FLAGS(meta)) and flag)) <> 0;
end;

procedure GST_META_FLAG_SET(var meta: PGstMeta; flag: TGstMetaFlags);
begin
  meta^.flags := meta^.flags or flag;
end;

procedure GST_META_FLAG_UNSET(var meta: PGstMeta; flag: TGstMetaFlags);
begin
  meta^.flags := meta^.flags and not flag;
end;

function GST_META_TRANSFORM_IS_COPY(t: TGQuark): Tgboolean;
begin
  Result := t = _gst_meta_transform_copy;
end;

{$ENDIF read_implementation}
