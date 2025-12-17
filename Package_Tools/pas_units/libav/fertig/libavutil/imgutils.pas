unit imgutils;

interface

uses
  fp_ffmpeg, pixfmt, pixdesc, rational;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure av_image_fill_max_pixsteps(max_pixsteps: Plongint; max_pixstep_comps: Plongint; pixdesc: PAVPixFmtDescriptor); cdecl; external libavutil;
function av_image_get_linesize(pix_fmt: TAVPixelFormat; width: longint; plane: longint): longint; cdecl; external libavutil;
function av_image_fill_linesizes(linesizes: Plongint; pix_fmt: TAVPixelFormat; width: longint): longint; cdecl; external libavutil;
function av_image_fill_plane_sizes(size: Psize_t; pix_fmt: TAVPixelFormat; height: longint; linesizes: Pptrdiff_t): longint; cdecl; external libavutil;
function av_image_fill_pointers(data: PPuint8_t; pix_fmt: TAVPixelFormat; height: longint; ptr: Puint8_t; linesizes: Plongint): longint; cdecl; external libavutil;
function av_image_alloc(pointers: PPuint8_t; linesizes: Plongint; w: longint; h: longint; pix_fmt: TAVPixelFormat; align: longint): longint; cdecl; external libavutil;
procedure av_image_copy_plane(dst: Puint8_t; dst_linesize: longint; src: Puint8_t; src_linesize: longint; bytewidth: longint; height: longint); cdecl; external libavutil;
procedure av_image_copy_plane_uc_from(dst: Puint8_t; dst_linesize: Tptrdiff_t; src: Puint8_t; src_linesize: Tptrdiff_t; bytewidth: Tptrdiff_t; height: longint); cdecl; external libavutil;
procedure av_image_copy(dst_data: PPuint8_t; dst_linesizes: Plongint; src_data: PPuint8_t; src_linesizes: Plongint; pix_fmt: TAVPixelFormat; width: longint; height: longint); cdecl; external libavutil;
procedure av_image_copy_uc_from(dst_data: PPuint8_t; dst_linesizes: Pptrdiff_t; src_data: PPuint8_t; src_linesizes: Pptrdiff_t; pix_fmt: TAVPixelFormat; width: longint; height: longint); cdecl; external libavutil;
function av_image_fill_arrays(dst_data: PPuint8_t; dst_linesize: Plongint; src: Puint8_t; pix_fmt: TAVPixelFormat; width: longint; height: longint; align: longint): longint; cdecl; external libavutil;
function av_image_get_buffer_size(pix_fmt: TAVPixelFormat; width: longint; height: longint; align: longint): longint; cdecl; external libavutil;
function av_image_copy_to_buffer(dst: Puint8_t; dst_size: longint; src_data: PPuint8_t; src_linesize: Plongint; pix_fmt: TAVPixelFormat; width: longint; height: longint; align: longint): longint; cdecl; external libavutil;
function av_image_check_size(w: dword; h: dword; log_offset: longint; log_ctx: pointer): longint; cdecl; external libavutil;
function av_image_check_size2(w: dword; h: dword; max_pixels: Tint64_t; pix_fmt: TAVPixelFormat; log_offset: longint; log_ctx: pointer): longint; cdecl; external libavutil;
function av_image_check_sar(w: dword; h: dword; sar: TAVRational): longint; cdecl; external libavutil;
function av_image_fill_black(dst_data: PPuint8_t; dst_linesize: Pptrdiff_t; pix_fmt: TAVPixelFormat; range: TAVColorRange; width: longint; height: longint): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:32 ===


implementation



end.
