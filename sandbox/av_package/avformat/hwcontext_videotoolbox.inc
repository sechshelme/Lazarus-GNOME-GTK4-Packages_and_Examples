{$IFDEF read_interface}


function av_map_videotoolbox_format_to_pixfmt(cv_fmt: Tuint32_t): TAVPixelFormat; cdecl; external libavutil;
function av_map_videotoolbox_format_from_pixfmt(pix_fmt: TAVPixelFormat): Tuint32_t; cdecl; external libavutil;
function av_map_videotoolbox_format_from_pixfmt2(pix_fmt: TAVPixelFormat; full_range: Boolean): Tuint32_t; cdecl; external libavutil;
function av_map_videotoolbox_chroma_loc_from_av(loc: TAVChromaLocation): TCFStringRef; cdecl; external libavutil;
function av_map_videotoolbox_color_matrix_from_av(space: TAVColorSpace): TCFStringRef; cdecl; external libavutil;
function av_map_videotoolbox_color_primaries_from_av(pri: TAVColorPrimaries): TCFStringRef; cdecl; external libavutil;
function av_map_videotoolbox_color_trc_from_av(trc: TAVColorTransferCharacteristic): TCFStringRef; cdecl; external libavutil;
function av_vt_pixbuf_set_attachments(log_ctx: pointer; pixbuf: TCVPixelBufferRef; src: PAVFrame): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:14:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
