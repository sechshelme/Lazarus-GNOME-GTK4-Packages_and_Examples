/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_webrtc_nice_stream_get_type: TGType; cdecl; external libgstwebrtcnice;

type
  TGstWebRTCNiceStreamPrivate = record
  end;
  PGstWebRTCNiceStreamPrivate = ^TGstWebRTCNiceStreamPrivate;

  TGstWebRTCNiceStream = record
    parent: TGstWebRTCICEStream;
    priv: PGstWebRTCNiceStreamPrivate;
  end;
  PGstWebRTCNiceStream = ^TGstWebRTCNiceStream;

  TGstWebRTCNiceStreamClass = record
    parent_class: TGstWebRTCICEStreamClass;
  end;
  PGstWebRTCNiceStreamClass = ^TGstWebRTCNiceStreamClass;

function gst_webrtc_nice_stream_new(ice: PGstWebRTCICE; stream_id: Tguint): PGstWebRTCNiceStream; cdecl; external libgstwebrtcnice;

// === Konventiert am: 5-10-24 17:20:33 ===

function GST_TYPE_WEBRTC_NICE_STREAM: TGType;
function GST_WEBRTC_NICE_STREAM(obj: Pointer): PGstWebRTCNiceStream;
function GST_WEBRTC_NICE_STREAM_CLASS(klass: Pointer): PGstWebRTCNiceStreamClass;
function GST_IS_WEBRTC_NICE_STREAM(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_NICE_STREAM_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_NICE_STREAM_GET_CLASS(obj: Pointer): PGstWebRTCNiceStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_NICE_STREAM: TGType;
begin
  GST_TYPE_WEBRTC_NICE_STREAM := gst_webrtc_nice_stream_get_type;
end;

function GST_WEBRTC_NICE_STREAM(obj: Pointer): PGstWebRTCNiceStream;
begin
  Result := PGstWebRTCNiceStream(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_NICE_STREAM));
end;

function GST_WEBRTC_NICE_STREAM_CLASS(klass: Pointer): PGstWebRTCNiceStreamClass;
begin
  Result := PGstWebRTCNiceStreamClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_NICE_STREAM));
end;

function GST_IS_WEBRTC_NICE_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_NICE_STREAM);
end;

function GST_IS_WEBRTC_NICE_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_NICE_STREAM);
end;

function GST_WEBRTC_NICE_STREAM_GET_CLASS(obj: Pointer): PGstWebRTCNiceStreamClass;
begin
  Result := PGstWebRTCNiceStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
