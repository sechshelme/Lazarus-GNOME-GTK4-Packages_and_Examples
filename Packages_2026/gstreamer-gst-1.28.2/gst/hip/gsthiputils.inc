{$IFDEF read_interface}


function _gst_hip_result(result: ThipError_t; vendor: TGstHipVendor; cat: PGstDebugCategory; file_: Pgchar; _function: Pgchar;
  line: Tgint): Tgboolean; cdecl; external libgsthip;
function gst_hip_ensure_element_data(element: PGstElement; vendor: TGstHipVendor; device_id: Tgint; device: PPGstHipDevice): Tgboolean; cdecl; external libgsthip;
function gst_hip_handle_set_context(element: PGstElement; context: PGstContext; vendor: TGstHipVendor; device_id: Tgint; device: PPGstHipDevice): Tgboolean; cdecl; external libgsthip;
function gst_hip_handle_context_query(element: PGstElement; query: PGstQuery; device: PGstHipDevice): Tgboolean; cdecl; external libgsthip;
function gst_context_new_hip_device(device: PGstHipDevice): PGstContext; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
