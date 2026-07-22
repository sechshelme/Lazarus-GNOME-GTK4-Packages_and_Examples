{$IFDEF read_interface}


type
  PGstHipStream = type Pointer;
  PPGstHipStream = ^PGstHipStream;

function gst_hip_stream_get_type: TGType; cdecl; external libgsthip;
function gst_hip_stream_new(vendor: TGstHipVendor; device_id: Tguint): PGstHipStream; cdecl; external libgsthip;
function gst_hip_stream_get_vendor(stream: PGstHipStream): TGstHipVendor; cdecl; external libgsthip;
function gst_hip_stream_get_device_id(stream: PGstHipStream): Tguint; cdecl; external libgsthip;
function gst_hip_stream_get_handle(stream: PGstHipStream): ThipStream_t; cdecl; external libgsthip;
function gst_hip_stream_record_event(stream: PGstHipStream; event: PPGstHipEvent): Tgboolean; cdecl; external libgsthip;
function gst_hip_stream_ref(stream: PGstHipStream): PGstHipStream; cdecl; external libgsthip;
procedure gst_hip_stream_unref(stream: PGstHipStream); cdecl; external libgsthip;
procedure gst_clear_hip_stream(stream: PPGstHipStream); cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
