
{$IFDEF read_interface}


type
  TGstStreamCollectionPrivate = record
  end;
  PGstStreamCollectionPrivate = ^TGstStreamCollectionPrivate;

  TGstStreamCollection = record
    obj: TGstObject;
    upstream_id: Pgchar;
    priv: PGstStreamCollectionPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstStreamCollection = ^TGstStreamCollection;
  PPGstStreamCollection = ^PGstStreamCollection;

  TGstStreamCollectionClass = record
    parent_class: TGstObjectClass;
    stream_notify: procedure(collection: PGstStreamCollection; stream: PGstStream; pspec: PGParamSpec); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstStreamCollectionClass = ^TGstStreamCollectionClass;

function gst_stream_collection_get_type: TGType; cdecl; external libgstreamer;
function gst_stream_collection_new(upstream_id: Pgchar): PGstStreamCollection; cdecl; external libgstreamer;
function gst_stream_collection_get_upstream_id(collection: PGstStreamCollection): Pgchar; cdecl; external libgstreamer;
function gst_stream_collection_get_size(collection: PGstStreamCollection): Tguint; cdecl; external libgstreamer;
function gst_stream_collection_get_stream(collection: PGstStreamCollection; index: Tguint): PGstStream; cdecl; external libgstreamer;
function gst_stream_collection_add_stream(collection: PGstStreamCollection; stream: PGstStream): Tgboolean; cdecl; external libgstreamer;

function GST_STREAM_COLLECTION_CAST(obj: Pointer): PGstStreamCollection;


// === Konventiert am: 14-9-24 16:55:12 ===

function GST_TYPE_STREAM_COLLECTION: TGType;
function GST_STREAM_COLLECTION(obj: Pointer): PGstStreamCollection;
function GST_STREAM_COLLECTION_CLASS(klass: Pointer): PGstStreamCollectionClass;
function GST_IS_STREAM_COLLECTION(obj: Pointer): Tgboolean;
function GST_IS_STREAM_COLLECTION_CLASS(klass: Pointer): Tgboolean;
function GST_STREAM_COLLECTION_GET_CLASS(obj: Pointer): PGstStreamCollectionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_STREAM_COLLECTION: TGType;
begin
  GST_TYPE_STREAM_COLLECTION := gst_stream_collection_get_type;
end;

function GST_STREAM_COLLECTION(obj: Pointer): PGstStreamCollection;
begin
  Result := PGstStreamCollection(g_type_check_instance_cast(obj, GST_TYPE_STREAM_COLLECTION));
end;

function GST_STREAM_COLLECTION_CLASS(klass: Pointer): PGstStreamCollectionClass;
begin
  Result := PGstStreamCollectionClass(g_type_check_class_cast(klass, GST_TYPE_STREAM_COLLECTION));
end;

function GST_IS_STREAM_COLLECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_STREAM_COLLECTION);
end;

function GST_IS_STREAM_COLLECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_STREAM_COLLECTION);
end;

function GST_STREAM_COLLECTION_GET_CLASS(obj: Pointer): PGstStreamCollectionClass;
begin
  Result := PGstStreamCollectionClass(PGTypeInstance(obj)^.g_class);
end;

function GST_STREAM_COLLECTION_CAST(obj: Pointer): PGstStreamCollection;
begin
  GST_STREAM_COLLECTION_CAST := PGstStreamCollection(obj);
end;


{$ENDIF read_implementation}
