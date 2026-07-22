{$IFDEF read_interface}


function gst_hip_rtc_load_library(vendor: TGstHipVendor): Tgboolean; cdecl; external libgsthip;
function gst_hip_rtc_compile(device: PGstHipDevice; source: Pgchar; options: PPgchar; num_options: Tguint): Pgchar; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
