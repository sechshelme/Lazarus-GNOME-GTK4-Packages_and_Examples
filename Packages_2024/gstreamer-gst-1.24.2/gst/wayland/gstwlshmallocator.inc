
{$IFDEF read_interface}


function gst_wl_shm_memory_construct_wl_buffer(mem: PGstMemory; display: PGstWlDisplay; info: PGstVideoInfo): Pwl_buffer; cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:15:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
