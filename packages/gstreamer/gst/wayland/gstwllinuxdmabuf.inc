/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   15:12                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


const
  GST_CAPS_FEATURE_MEMORY_DMABUF = 'memory:DMABuf';

procedure gst_wl_linux_dmabuf_init_once; cdecl; external libgstwayland;
function gst_wl_linux_dmabuf_construct_wl_buffer(buf: PGstBuffer; display: PGstWlDisplay; drm_info: PGstVideoInfoDmaDrm): Pwl_buffer; cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:15:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
