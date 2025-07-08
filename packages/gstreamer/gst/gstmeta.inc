
{$IFDEF read_interface}

const
  GST_META_TAG_MEMORY_STR = 'memory';

var
  _gst_meta_transform_copy: TGQuark; cvar;external libgstreamer;


type
  PGstMetaTransformCopy = ^TGstMetaTransformCopy;

  TGstMetaTransformCopy = record
    region: Tgboolean;
    offset: Tgsize;
    size: Tgsize;
  end;

type
  PGstMetaFlags = ^TGstMetaFlags;
  TGstMetaFlags = longint;

const
  GST_META_FLAG_NONE = 0;
  GST_META_FLAG_READONLY = 1 shl 0;
  GST_META_FLAG_POOLED = 1 shl 1;
  GST_META_FLAG_LOCKED = 1 shl 2;
  GST_META_FLAG_LAST = 1 shl 16;

type
  TGstMeta = record
    flags: TGstMetaFlags;
    info: ^TGstMetaInfo;
  end;
  PGstMeta = ^TGstMeta;
  PPGstMeta = ^PGstMeta;

  TGstCustomMeta = record
    meta: TGstMeta;
    structure: PGstStructure;
  end;

  PGstMetaInfo = ^TGstMetaInfo;
  PGstCustomMeta = ^TGstCustomMeta;
  TGstMetaInitFunction = function(meta: PGstMeta; params: Tgpointer; buffer: PGstBuffer): Tgboolean; cdecl;
  TGstMetaFreeFunction = procedure(meta: PGstMeta; buffer: PGstBuffer); cdecl;

  TGstMetaTransformFunction = function(transbuf: PGstBuffer; meta: PGstMeta; buffer: PGstBuffer; _type: TGQuark; Data: Tgpointer): Tgboolean; cdecl;
  TGstCustomMetaTransformFunction = function(transbuf: PGstBuffer; meta: PGstCustomMeta; buffer: PGstBuffer; _type: TGQuark; Data: Tgpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGstMetaSerializeFunction = function(meta: PGstMeta; Data: PGstByteArrayInterface; version: Pguint8): Tgboolean; cdecl;

  PGstMetaDeserializeFunction = ^TGstMetaDeserializeFunction;
  TGstMetaDeserializeFunction = function(info: PGstMetaInfo; buffer: PGstBuffer; Data: Pguint8; size: Tgsize; version: Tguint8): PGstMeta; cdecl;
  TGstMetaClearFunction = procedure(buffer: PGstBuffer; meta: PGstMeta); cdecl;

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


function gst_meta_api_type_register(api: Pgchar; tags: PPgchar): TGType; cdecl; external libgstreamer;
function gst_meta_api_type_has_tag(api: TGType; tag: TGQuark): Tgboolean; cdecl; external libgstreamer;
function gst_meta_register(api: TGType; impl: Pgchar; size: Tgsize; init_func: TGstMetaInitFunction; free_func: TGstMetaFreeFunction;
  transform_func: TGstMetaTransformFunction): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_info_new(api: TGType; impl: Pgchar; size: Tgsize): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_info_register(info: PGstMetaInfo): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_register_custom(Name: Pgchar; tags: PPgchar; transform_func: TGstCustomMetaTransformFunction; user_data: Tgpointer; destroy_data: TGDestroyNotify): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_register_custom_simple(Name: Pgchar): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_info_is_custom(info: PGstMetaInfo): Tgboolean; cdecl; external libgstreamer;
function gst_custom_meta_get_structure(meta: PGstCustomMeta): PGstStructure; cdecl; external libgstreamer;
function gst_custom_meta_has_name(meta: PGstCustomMeta; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_meta_get_info(impl: Pgchar): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_api_type_get_tags(api: TGType): PPgchar; cdecl; external libgstreamer;
function gst_meta_get_seqnum(meta: PGstMeta): Tguint64; cdecl; external libgstreamer;
function gst_meta_compare_seqnum(meta1: PGstMeta; meta2: PGstMeta): Tgint; cdecl; external libgstreamer;
function gst_meta_serialize(meta: PGstMeta; Data: PGstByteArrayInterface): Tgboolean; cdecl; external libgstreamer;
function gst_meta_serialize_simple(meta: PGstMeta; Data: PGByteArray): Tgboolean; cdecl; external libgstreamer;
function gst_meta_deserialize(buffer: PGstBuffer; Data: Pguint8; size: Tgsize; consumed: Pguint32): PGstMeta; cdecl; external libgstreamer;

var
  _gst_meta_tag_memory: TGQuark; cvar;external libgstreamer;
  _gst_meta_tag_memory_reference: TGQuark; cvar;external libgstreamer;

function GST_META_TAG_MEMORY: TGQuark;

function GST_META_CAST(meta: Pointer): PGstMeta;
function GST_META_FLAGS(meta: Pointer): TGstMetaFlags;
function GST_META_FLAG_IS_SET(meta: Pointer; flag: longint): Tgboolean;
procedure GST_META_FLAG_SET(var meta: PGstMeta; flag: TGstMetaFlags);
procedure GST_META_FLAG_UNSET(var meta: PGstMeta; flag: TGstMetaFlags);

function GST_META_TRANSFORM_IS_COPY(t: TGQuark): Tgboolean;

// === Konventiert am: 13-9-24 15:49:20 ===


{$ENDIF read_interface}


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
