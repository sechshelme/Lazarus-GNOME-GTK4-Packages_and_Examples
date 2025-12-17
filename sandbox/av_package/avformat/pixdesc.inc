{$IFDEF read_interface}


type
  TAVComponentDescriptor = record
    plane: longint;
    step: longint;
    offset: longint;
    shift: longint;
    depth: longint;
  end;
  PAVComponentDescriptor = ^TAVComponentDescriptor;

  TAVPixFmtDescriptor = record
    name: pchar;
    nb_components: Tuint8_t;
    log2_chroma_w: Tuint8_t;
    log2_chroma_h: Tuint8_t;
    flags: Tuint64_t;
    comp: array[0..3] of TAVComponentDescriptor;
    alias: pchar;
  end;
  PAVPixFmtDescriptor = ^TAVPixFmtDescriptor;

const
  AV_PIX_FMT_FLAG_BE = 1 shl 0;
  AV_PIX_FMT_FLAG_PAL = 1 shl 1;
  AV_PIX_FMT_FLAG_BITSTREAM = 1 shl 2;
  AV_PIX_FMT_FLAG_HWACCEL = 1 shl 3;
  AV_PIX_FMT_FLAG_PLANAR = 1 shl 4;
  AV_PIX_FMT_FLAG_RGB = 1 shl 5;
  AV_PIX_FMT_FLAG_ALPHA = 1 shl 7;
  AV_PIX_FMT_FLAG_BAYER = 1 shl 8;
  AV_PIX_FMT_FLAG_FLOAT = 1 shl 9;

function av_get_bits_per_pixel(pixdesc: PAVPixFmtDescriptor): longint; cdecl; external libavutil;
function av_get_padded_bits_per_pixel(pixdesc: PAVPixFmtDescriptor): longint; cdecl; external libavutil;
function av_pix_fmt_desc_get(pix_fmt: TAVPixelFormat): PAVPixFmtDescriptor; cdecl; external libavutil;
function av_pix_fmt_desc_next(prev: PAVPixFmtDescriptor): PAVPixFmtDescriptor; cdecl; external libavutil;
function av_pix_fmt_desc_get_id(desc: PAVPixFmtDescriptor): TAVPixelFormat; cdecl; external libavutil;
function av_pix_fmt_get_chroma_sub_sample(pix_fmt: TAVPixelFormat; h_shift: Plongint; v_shift: Plongint): longint; cdecl; external libavutil;
function av_pix_fmt_count_planes(pix_fmt: TAVPixelFormat): longint; cdecl; external libavutil;
function av_color_range_name(range: TAVColorRange): pchar; cdecl; external libavutil;
function av_color_range_from_name(name: pchar): longint; cdecl; external libavutil;
function av_color_primaries_name(primaries: TAVColorPrimaries): pchar; cdecl; external libavutil;
function av_color_primaries_from_name(name: pchar): longint; cdecl; external libavutil;
function av_color_transfer_name(transfer: TAVColorTransferCharacteristic): pchar; cdecl; external libavutil;
function av_color_transfer_from_name(name: pchar): longint; cdecl; external libavutil;
function av_color_space_name(space: TAVColorSpace): pchar; cdecl; external libavutil;
function av_color_space_from_name(name: pchar): longint; cdecl; external libavutil;
function av_chroma_location_name(location: TAVChromaLocation): pchar; cdecl; external libavutil;
function av_chroma_location_from_name(name: pchar): longint; cdecl; external libavutil;
function av_chroma_location_enum_to_pos(xpos: Plongint; ypos: Plongint; pos: TAVChromaLocation): longint; cdecl; external libavutil;
function av_chroma_location_pos_to_enum(xpos: longint; ypos: longint): TAVChromaLocation; cdecl; external libavutil;
function av_get_pix_fmt(name: pchar): TAVPixelFormat; cdecl; external libavutil;
function av_get_pix_fmt_name(pix_fmt: TAVPixelFormat): pchar; cdecl; external libavutil;
function av_get_pix_fmt_string(buf: pchar; buf_size: longint; pix_fmt: TAVPixelFormat): pchar; cdecl; external libavutil;
procedure av_read_image_line2(dst: pointer; data: PPuint8_t; linesize: Plongint; desc: PAVPixFmtDescriptor; x: longint;
  y: longint; c: longint; w: longint; read_pal_component: longint; dst_element_size: longint); cdecl; external libavutil;
procedure av_read_image_line(dst: Puint16_t; data: PPuint8_t; linesize: Plongint; desc: PAVPixFmtDescriptor; x: longint;
  y: longint; c: longint; w: longint; read_pal_component: longint); cdecl; external libavutil;
procedure av_write_image_line2(src: pointer; data: PPuint8_t; linesize: Plongint; desc: PAVPixFmtDescriptor; x: longint;
  y: longint; c: longint; w: longint; src_element_size: longint); cdecl; external libavutil;
procedure av_write_image_line(src: Puint16_t; data: PPuint8_t; linesize: Plongint; desc: PAVPixFmtDescriptor; x: longint;
  y: longint; c: longint; w: longint); cdecl; external libavutil;
function av_pix_fmt_swap_endianness(pix_fmt: TAVPixelFormat): TAVPixelFormat; cdecl; external libavutil;

const
  FF_LOSS_RESOLUTION = $0001;
  FF_LOSS_DEPTH = $0002;
  FF_LOSS_COLORSPACE = $0004;
  FF_LOSS_ALPHA = $0008;
  FF_LOSS_COLORQUANT = $0010;
  FF_LOSS_CHROMA = $0020;
  FF_LOSS_EXCESS_RESOLUTION = $0040;
  FF_LOSS_EXCESS_DEPTH = $0080;

function av_get_pix_fmt_loss(dst_pix_fmt: TAVPixelFormat; src_pix_fmt: TAVPixelFormat; has_alpha: longint): longint; cdecl; external libavutil;
function av_find_best_pix_fmt_of_2(dst_pix_fmt1: TAVPixelFormat; dst_pix_fmt2: TAVPixelFormat; src_pix_fmt: TAVPixelFormat; has_alpha: longint; loss_ptr: Plongint): TAVPixelFormat; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:36:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
