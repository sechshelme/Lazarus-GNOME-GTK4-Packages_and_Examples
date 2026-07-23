{$IFDEF read_interface}


type
  PGstWebRTCNiceTransportPrivate = type Pointer;

  PGstWebRTCNiceTransport = ^TGstWebRTCNiceTransport;
  TGstWebRTCNiceTransport = record
    parent: TGstWebRTCICETransport;
    stream: PGstWebRTCNiceStream;
    priv: PGstWebRTCNiceTransportPrivate;
  end;

  PGstWebRTCNiceTransportClass = ^TGstWebRTCNiceTransportClass;
  TGstWebRTCNiceTransportClass = record
    parent_class: TGstWebRTCICETransportClass;
  end;

function gst_webrtc_nice_transport_get_type: TGType; cdecl; external libgstwebrtcnice;
function gst_webrtc_nice_transport_new(stream: PGstWebRTCNiceStream; component: TGstWebRTCICEComponent): PGstWebRTCNiceTransport; cdecl; external libgstwebrtcnice;
procedure gst_webrtc_nice_transport_update_buffer_size(nice: PGstWebRTCNiceTransport); cdecl; external libgstwebrtcnice;

// === Konventiert am: 23-7-26 14:05:54 ===

function GST_TYPE_WEBRTC_NICE_TRANSPORT: TGType;
function GST_WEBRTC_NICE_TRANSPORT(obj: Pointer): PGstWebRTCNiceTransport;
function GST_WEBRTC_NICE_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCNiceTransportClass;
function GST_IS_WEBRTC_NICE_TRANSPORT(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_NICE_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_NICE_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCNiceTransportClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_NICE_TRANSPORT: TGType;
begin
  GST_TYPE_WEBRTC_NICE_TRANSPORT := gst_webrtc_nice_transport_get_type;
end;

function GST_WEBRTC_NICE_TRANSPORT(obj: Pointer): PGstWebRTCNiceTransport;
begin
  Result := PGstWebRTCNiceTransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_NICE_TRANSPORT));
end;

function GST_WEBRTC_NICE_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCNiceTransportClass;
begin
  Result := PGstWebRTCNiceTransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_NICE_TRANSPORT));
end;

function GST_IS_WEBRTC_NICE_TRANSPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_NICE_TRANSPORT);
end;

function GST_IS_WEBRTC_NICE_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_NICE_TRANSPORT);
end;

function GST_WEBRTC_NICE_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCNiceTransportClass;
begin
  Result := PGstWebRTCNiceTransportClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
