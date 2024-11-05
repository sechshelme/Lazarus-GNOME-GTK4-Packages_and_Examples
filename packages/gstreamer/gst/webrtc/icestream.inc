/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_webrtc_ice_stream_get_type: TGType; cdecl; external libgstwebrtc;

type
  TGstWebRTCICEStream = record
    parent: TGstObject;
    stream_id: Tguint;
  end;
  PGstWebRTCICEStream = ^TGstWebRTCICEStream;

  TGstWebRTCICEStreamClass = record
    parent_class: TGstObjectClass;
    find_transport: function(stream: PGstWebRTCICEStream; component: TGstWebRTCICEComponent): PGstWebRTCICETransport; cdecl;
    gather_candidates: function(ice: PGstWebRTCICEStream): Tgboolean; cdecl;
  end;
  PGstWebRTCICEStreamClass = ^TGstWebRTCICEStreamClass;


function gst_webrtc_ice_stream_find_transport(stream: PGstWebRTCICEStream; component: TGstWebRTCICEComponent): PGstWebRTCICETransport; cdecl; external libgstwebrtc;
function gst_webrtc_ice_stream_gather_candidates(ice: PGstWebRTCICEStream): Tgboolean; cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:12:58 ===

function GST_TYPE_WEBRTC_ICE_STREAM: TGType;
function GST_WEBRTC_ICE_STREAM(obj: Pointer): PGstWebRTCICEStream;
function GST_WEBRTC_ICE_STREAM_CLASS(klass: Pointer): PGstWebRTCICEStreamClass;
function GST_IS_WEBRTC_ICE_STREAM(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_ICE_STREAM_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_ICE_STREAM_GET_CLASS(obj: Pointer): PGstWebRTCICEStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_ICE_STREAM: TGType;
begin
  GST_TYPE_WEBRTC_ICE_STREAM := gst_webrtc_ice_stream_get_type;
end;

function GST_WEBRTC_ICE_STREAM(obj: Pointer): PGstWebRTCICEStream;
begin
  Result := PGstWebRTCICEStream(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_ICE_STREAM));
end;

function GST_WEBRTC_ICE_STREAM_CLASS(klass: Pointer): PGstWebRTCICEStreamClass;
begin
  Result := PGstWebRTCICEStreamClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_ICE_STREAM));
end;

function GST_IS_WEBRTC_ICE_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_ICE_STREAM);
end;

function GST_IS_WEBRTC_ICE_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_ICE_STREAM);
end;

function GST_WEBRTC_ICE_STREAM_GET_CLASS(obj: Pointer): PGstWebRTCICEStreamClass;
begin
  Result := PGstWebRTCICEStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
