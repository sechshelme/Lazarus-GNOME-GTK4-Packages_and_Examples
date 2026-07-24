{$IFDEF read_interface}


function gst_cuda_nvrtc_load_library: Tgboolean; cdecl; external libgstcuda;
function gst_cuda_nvrtc_compile(source: Pgchar): Pgchar; cdecl; external libgstcuda;
function gst_cuda_nvrtc_compile_cubin(source: Pgchar; device: Tgint): Pgchar; cdecl; external libgstcuda;

// === Konventiert am: 24-7-26 15:39:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
