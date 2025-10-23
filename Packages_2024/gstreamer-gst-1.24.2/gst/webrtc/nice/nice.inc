
{$IFDEF read_interface}


function gst_webrtc_nice_get_type: TGType; cdecl; external libgstwebrtcnice;

type
  TGstWebRTCNicePrivate = record
  end;
  PGstWebRTCNicePrivate = ^TGstWebRTCNicePrivate;

  TGstWebRTCNice = record
    parent: TGstWebRTCICE;
    priv: PGstWebRTCNicePrivate;
  end;
  PGstWebRTCNice = ^TGstWebRTCNice;

  TGstWebRTCNiceClass = record
    parent_class: TGstWebRTCICEClass;
  end;
  PGstWebRTCNiceClass = ^TGstWebRTCNiceClass;


function gst_webrtc_nice_new(Name: Pgchar): PGstWebRTCNice; cdecl; external libgstwebrtcnice;

// === Konventiert am: 5-10-24 17:20:25 ===

function GST_TYPE_WEBRTC_NICE: TGType;
function GST_WEBRTC_NICE(obj: Pointer): PGstWebRTCNice;
function GST_WEBRTC_NICE_CLASS(klass: Pointer): PGstWebRTCNiceClass;
function GST_IS_WEBRTC_NICE(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_NICE_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_NICE_GET_CLASS(obj: Pointer): PGstWebRTCNiceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_NICE: TGType;
begin
  GST_TYPE_WEBRTC_NICE := gst_webrtc_nice_get_type;
end;

function GST_WEBRTC_NICE(obj: Pointer): PGstWebRTCNice;
begin
  Result := PGstWebRTCNice(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_NICE));
end;

function GST_WEBRTC_NICE_CLASS(klass: Pointer): PGstWebRTCNiceClass;
begin
  Result := PGstWebRTCNiceClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_NICE));
end;

function GST_IS_WEBRTC_NICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_NICE);
end;

function GST_IS_WEBRTC_NICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_NICE);
end;

function GST_WEBRTC_NICE_GET_CLASS(obj: Pointer): PGstWebRTCNiceClass;
begin
  Result := PGstWebRTCNiceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
