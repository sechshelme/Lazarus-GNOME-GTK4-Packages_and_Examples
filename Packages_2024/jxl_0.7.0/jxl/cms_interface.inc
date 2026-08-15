{$IFDEF read_interface}


type
  PJxlColorProfile = ^TJxlColorProfile;
  TJxlColorProfile = record
    icc: record
      data: Puint8_t;
      size: Tsize_t;
      end;
    color_encoding: TJxlColorEncoding;
    num_channels: Tsize_t;
  end;

  Tjpegxl_cms_init_func = function(init_data: pointer; num_threads: Tsize_t; pixels_per_thread: Tsize_t; input_profile: PJxlColorProfile; output_profile: PJxlColorProfile; intensity_target: single): pointer; cdecl;
  Tjpegxl_cms_get_buffer_func = function(user_data: pointer; thread: Tsize_t): Psingle; cdecl;
  Tjpegxl_cms_run_func = function(user_data: pointer; thread: Tsize_t; input_buffer: Psingle; output_buffer: Psingle; num_pixels: Tsize_t): TJXL_BOOL; cdecl;
  Tjpegxl_cms_destroy_func = procedure(para1: pointer); cdecl;

  PJxlCmsInterface = ^TJxlCmsInterface;
  TJxlCmsInterface = record
    init_data: pointer;
    init: Tjpegxl_cms_init_func;
    get_src_buf: Tjpegxl_cms_get_buffer_func;
    get_dst_buf: Tjpegxl_cms_get_buffer_func;
    run: Tjpegxl_cms_run_func;
    destroy: Tjpegxl_cms_destroy_func;
  end;

  // === Konventiert am: 14-8-26 19:29:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
