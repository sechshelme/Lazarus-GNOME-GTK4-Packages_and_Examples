

  {$IFDEF read_struct}
type
  PGstRTSPMediaFactoryURIPrivate = type Pointer;

  PGstRTSPMediaFactoryURI = ^TGstRTSPMediaFactoryURI;
  TGstRTSPMediaFactoryURI = record
    parent: TGstRTSPMediaFactory;
    priv: PGstRTSPMediaFactoryURIPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPMediaFactoryURIClass = ^TGstRTSPMediaFactoryURIClass;
  TGstRTSPMediaFactoryURIClass = record
    parent_class: TGstRTSPMediaFactoryClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_media_factory_uri_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_media_factory_uri_new: PGstRTSPMediaFactoryURI; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_factory_uri_set_uri(factory: PGstRTSPMediaFactoryURI; uri: Pgchar); cdecl; external libgstrtspserver;
function gst_rtsp_media_factory_uri_get_uri(factory: PGstRTSPMediaFactoryURI): Pgchar; cdecl; external libgstrtspserver;

// === Konventiert am: 20-7-26 13:45:27 ===

function GST_TYPE_RTSP_MEDIA_FACTORY_URI: TGType;
function GST_RTSP_MEDIA_FACTORY_URI(obj: Pointer): PGstRTSPMediaFactoryURI;
function GST_RTSP_MEDIA_FACTORY_URI_CLASS(klass: Pointer): PGstRTSPMediaFactoryURIClass;
function GST_IS_RTSP_MEDIA_FACTORY_URI(obj: Pointer): Tgboolean;
function GST_IS_RTSP_MEDIA_FACTORY_URI_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_MEDIA_FACTORY_URI_GET_CLASS(obj: Pointer): PGstRTSPMediaFactoryURIClass;
function GST_RTSP_MEDIA_FACTORY_URI_CAST(obj: Pointer): PGstRTSPMediaFactoryURI;
function GST_RTSP_MEDIA_FACTORY_URI_CLASS_CAST(klass: Pointer): PGstRTSPMediaFactoryURIClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_MEDIA_FACTORY_URI: TGType;
begin
  Result := gst_rtsp_media_factory_uri_get_type;
end;

function GST_RTSP_MEDIA_FACTORY_URI(obj: Pointer): PGstRTSPMediaFactoryURI;
begin
  Result := PGstRTSPMediaFactoryURI(g_type_check_instance_cast(obj, GST_TYPE_RTSP_MEDIA_FACTORY_URI));
end;

function GST_RTSP_MEDIA_FACTORY_URI_CLASS(klass: Pointer): PGstRTSPMediaFactoryURIClass;
begin
  Result := PGstRTSPMediaFactoryURIClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_MEDIA_FACTORY_URI));
end;

function GST_IS_RTSP_MEDIA_FACTORY_URI(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_MEDIA_FACTORY_URI);
end;

function GST_IS_RTSP_MEDIA_FACTORY_URI_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_MEDIA_FACTORY_URI);
end;

function GST_RTSP_MEDIA_FACTORY_URI_GET_CLASS(obj: Pointer): PGstRTSPMediaFactoryURIClass;
begin
  Result := PGstRTSPMediaFactoryURIClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_MEDIA_FACTORY_URI_CAST(obj: Pointer): PGstRTSPMediaFactoryURI;
begin
  Result := PGstRTSPMediaFactoryURI(obj);
end;

function GST_RTSP_MEDIA_FACTORY_URI_CLASS_CAST(klass: Pointer): PGstRTSPMediaFactoryURIClass;
begin
  Result := PGstRTSPMediaFactoryURIClass(klass);
end;

{$ENDIF read_implementation}
