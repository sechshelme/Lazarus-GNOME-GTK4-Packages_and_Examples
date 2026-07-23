{$IFDEF read_interface}


const
  GST_CAPS_FEATURE_MEMORY_DMABUF = 'memory:DMABuf';

procedure gst_wl_linux_dmabuf_init_once; cdecl; external libgstwayland;
function gst_wl_linux_dmabuf_construct_wl_buffer(buf: PGstBuffer; display: PGstWlDisplay; drm_info: PGstVideoInfoDmaDrm): Pwl_buffer; cdecl; external libgstwayland;

// === Konventiert am: 23-7-26 19:13:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
