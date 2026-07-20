unit rtsp_onvif_media;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, rtsp_media;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPOnvifMediaClass = ^TGstRTSPOnvifMediaClass;
  TGstRTSPOnvifMediaClass = record
    parent: TGstRTSPMediaClass;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstRTSPOnvifMediaPrivate = type Pointer;

  PGstRTSPOnvifMedia = ^TGstRTSPOnvifMedia;
  TGstRTSPOnvifMedia = record
    parent: TGstRTSPMedia;
    priv: PGstRTSPOnvifMediaPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_onvif_media_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_collect_backchannel(media: PGstRTSPOnvifMedia): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_onvif_media_set_backchannel_bandwidth(media: PGstRTSPOnvifMedia; bandwidth: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_get_backchannel_bandwidth(media: PGstRTSPOnvifMedia): Tguint; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:07 ===

function GST_TYPE_RTSP_ONVIF_MEDIA: TGType;
function GST_RTSP_ONVIF_MEDIA(obj: Pointer): PGstRTSPOnvifMedia;
function GST_RTSP_ONVIF_MEDIA_CLASS(klass: Pointer): PGstRTSPOnvifMediaClass;
function GST_IS_RTSP_ONVIF_MEDIA(obj: Pointer): Tgboolean;
function GST_IS_RTSP_ONVIF_MEDIA_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_ONVIF_MEDIA_GET_CLASS(obj: Pointer): PGstRTSPOnvifMediaClass;
function GST_RTSP_ONVIF_MEDIA_CAST(obj: Pointer): PGstRTSPOnvifMedia;
function GST_RTSP_ONVIF_MEDIA_CLASS_CAST(klass: Pointer): PGstRTSPOnvifMediaClass;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_ONVIF_MEDIA: TGType;
begin
  Result := gst_rtsp_onvif_media_get_type;
end;

function GST_RTSP_ONVIF_MEDIA(obj: Pointer): PGstRTSPOnvifMedia;
begin
  Result := PGstRTSPOnvifMedia(g_type_check_instance_cast(obj, GST_TYPE_RTSP_ONVIF_MEDIA));
end;

function GST_RTSP_ONVIF_MEDIA_CLASS(klass: Pointer): PGstRTSPOnvifMediaClass;
begin
  Result := PGstRTSPOnvifMediaClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_ONVIF_MEDIA));
end;

function GST_IS_RTSP_ONVIF_MEDIA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_ONVIF_MEDIA);
end;

function GST_IS_RTSP_ONVIF_MEDIA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_ONVIF_MEDIA);
end;

function GST_RTSP_ONVIF_MEDIA_GET_CLASS(obj: Pointer): PGstRTSPOnvifMediaClass;
begin
  Result := PGstRTSPOnvifMediaClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_ONVIF_MEDIA_CAST(obj: Pointer): PGstRTSPOnvifMedia;
begin
  Result := PGstRTSPOnvifMedia(obj);
end;

function GST_RTSP_ONVIF_MEDIA_CLASS_CAST(klass: Pointer): PGstRTSPOnvifMediaClass;
begin
  Result := PGstRTSPOnvifMediaClass(klass);
end;

end.
