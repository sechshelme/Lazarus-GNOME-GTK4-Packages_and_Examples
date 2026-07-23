{$IFDEF read_interface}


procedure gst_wl_shm_init_once; cdecl; external libgstwayland;
function gst_wl_shm_memory_construct_wl_buffer(mem: PGstMemory; display: PGstWlDisplay; info: PGstVideoInfo): Pwl_buffer; cdecl; external libgstwayland;

// === Konventiert am: 23-7-26 19:12:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
