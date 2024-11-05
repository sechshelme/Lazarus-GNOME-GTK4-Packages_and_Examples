/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   12:06                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstRTSPExtension = record
  end;
  PGstRTSPExtension = ^TGstRTSPExtension;

  TGstRTSPExtensionInterface = record
    parent: TGTypeInterface;
    detect_server: function(ext: PGstRTSPExtension; resp: PGstRTSPMessage): Tgboolean; cdecl;
    before_send: function(ext: PGstRTSPExtension; req: PGstRTSPMessage): TGstRTSPResult; cdecl;
    after_send: function(ext: PGstRTSPExtension; req: PGstRTSPMessage; resp: PGstRTSPMessage): TGstRTSPResult; cdecl;
    parse_sdp: function(ext: PGstRTSPExtension; sdp: PGstSDPMessage; s: PGstStructure): TGstRTSPResult; cdecl;
    setup_media: function(ext: PGstRTSPExtension; media: PGstSDPMedia): TGstRTSPResult; cdecl;
    configure_stream: function(ext: PGstRTSPExtension; caps: PGstCaps): Tgboolean; cdecl;
    get_transports: function(ext: PGstRTSPExtension; protocols: TGstRTSPLowerTrans; transport: PPgchar): TGstRTSPResult; cdecl;
    stream_select: function(ext: PGstRTSPExtension; url: PGstRTSPUrl): TGstRTSPResult; cdecl;
    send: function(ext: PGstRTSPExtension; req: PGstRTSPMessage; resp: PGstRTSPMessage): TGstRTSPResult; cdecl;
    receive_request: function(ext: PGstRTSPExtension; req: PGstRTSPMessage): TGstRTSPResult; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstRTSPExtensionInterface = ^TGstRTSPExtensionInterface;

function gst_rtsp_extension_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_extension_detect_server(ext: PGstRTSPExtension; resp: PGstRTSPMessage): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_extension_before_send(ext: PGstRTSPExtension; req: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_after_send(ext: PGstRTSPExtension; req: PGstRTSPMessage; resp: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_parse_sdp(ext: PGstRTSPExtension; sdp: PGstSDPMessage; s: PGstStructure): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_setup_media(ext: PGstRTSPExtension; media: PGstSDPMedia): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_configure_stream(ext: PGstRTSPExtension; caps: PGstCaps): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_extension_get_transports(ext: PGstRTSPExtension; protocols: TGstRTSPLowerTrans; transport: PPgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_stream_select(ext: PGstRTSPExtension; url: PGstRTSPUrl): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_receive_request(ext: PGstRTSPExtension; req: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_extension_send(ext: PGstRTSPExtension; req: PGstRTSPMessage; resp: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;

// === Konventiert am: 8-10-24 11:22:06 ===

function GST_TYPE_RTSP_EXTENSION: TGType;
function GST_RTSP_EXTENSION(obj: Pointer): PGstRTSPExtension;
function GST_IS_RTSP_EXTENSION(obj: Pointer): Tgboolean;
function GST_RTSP_EXTENSION_GET_INTERFACE(obj: Pointer): PGstRTSPExtensionInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_EXTENSION: TGType;
begin
  GST_TYPE_RTSP_EXTENSION := gst_rtsp_extension_get_type;
end;

function GST_RTSP_EXTENSION(obj: Pointer): PGstRTSPExtension;
begin
  Result := PGstRTSPExtension(g_type_check_instance_cast(obj, GST_TYPE_RTSP_EXTENSION));
end;

function GST_IS_RTSP_EXTENSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_EXTENSION);
end;

function GST_RTSP_EXTENSION_GET_INTERFACE(obj: Pointer): PGstRTSPExtensionInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_RTSP_EXTENSION);
end;



{$ENDIF read_implementation}
