  {$IFDEF read_interface}

const
  LIBSWSCALE_VERSION_MINOR = 5;
  LIBSWSCALE_VERSION_MICRO = 100;

const
  LIBSWSCALE_VERSION_MAJOR = 7;

  // =====

function swscale_version: dword; cdecl; external libswscale;
function swscale_configuration: pchar; cdecl; external libswscale;
function swscale_license: pchar; cdecl; external libswscale;

const
  SWS_FAST_BILINEAR = 1;
  SWS_BILINEAR = 2;
  SWS_BICUBIC = 4;
  SWS_X = 8;
  SWS_POINT = $10;
  SWS_AREA = $20;
  SWS_BICUBLIN = $40;
  SWS_GAUSS = $80;
  SWS_SINC = $100;
  SWS_LANCZOS = $200;
  SWS_SPLINE = $400;
  SWS_SRC_V_CHR_DROP_MASK = $30000;
  SWS_SRC_V_CHR_DROP_SHIFT = 16;
  SWS_PARAM_DEFAULT = 123456;
  SWS_PRINT_INFO = $1000;
  SWS_FULL_CHR_H_INT = $2000;
  SWS_FULL_CHR_H_INP = $4000;
  SWS_DIRECT_BGR = $8000;
  SWS_ACCURATE_RND = $40000;
  SWS_BITEXACT = $80000;
  SWS_ERROR_DIFFUSION = $800000;
  SWS_MAX_REDUCE_CUTOFF = 0.002;
  SWS_CS_ITU709 = 1;
  SWS_CS_FCC = 4;
  SWS_CS_ITU601 = 5;
  SWS_CS_ITU624 = 5;
  SWS_CS_SMPTE170M = 5;
  SWS_CS_SMPTE240M = 7;
  SWS_CS_DEFAULT = 5;
  SWS_CS_BT2020 = 9;

function sws_getCoefficients(colorspace: longint): Plongint; cdecl; external libswscale;

type
  TSwsVector = record
    coeff: Pdouble;
    length: longint;
  end;
  PSwsVector = ^TSwsVector;

  TSwsFilter = record
    lumH: PSwsVector;
    lumV: PSwsVector;
    chrH: PSwsVector;
    chrV: PSwsVector;
  end;
  PSwsFilter = ^TSwsFilter;
  PSwsContext = type Pointer;

function sws_isSupportedInput(pix_fmt: TAVPixelFormat): longint; cdecl; external libswscale;
function sws_isSupportedOutput(pix_fmt: TAVPixelFormat): longint; cdecl; external libswscale;
function sws_isSupportedEndiannessConversion(pix_fmt: TAVPixelFormat): longint; cdecl; external libswscale;
function sws_alloc_context: PSwsContext; cdecl; external libswscale;
function sws_init_context(sws_context: PSwsContext; srcFilter: PSwsFilter; dstFilter: PSwsFilter): longint; cdecl; external libswscale;
procedure sws_freeContext(swsContext: PSwsContext); cdecl; external libswscale;
function sws_getContext(srcW: longint; srcH: longint; srcFormat: TAVPixelFormat; dstW: longint; dstH: longint;
  dstFormat: TAVPixelFormat; flags: longint; srcFilter: PSwsFilter; dstFilter: PSwsFilter; param: Pdouble): PSwsContext; cdecl; external libswscale;
function sws_scale(c: PSwsContext; srcSlice: PPuint8_t; srcStride: Plongint; srcSliceY: longint; srcSliceH: longint;
  dst: PPuint8_t; dstStride: Plongint): longint; cdecl; external libswscale;
function sws_scale_frame(c: PSwsContext; dst: PAVFrame; src: PAVFrame): longint; cdecl; external libswscale;
function sws_frame_start(c: PSwsContext; dst: PAVFrame; src: PAVFrame): longint; cdecl; external libswscale;
procedure sws_frame_end(c: PSwsContext); cdecl; external libswscale;
function sws_send_slice(c: PSwsContext; slice_start: dword; slice_height: dword): longint; cdecl; external libswscale;
function sws_receive_slice(c: PSwsContext; slice_start: dword; slice_height: dword): longint; cdecl; external libswscale;
function sws_receive_slice_alignment(c: PSwsContext): dword; cdecl; external libswscale;
function sws_setColorspaceDetails(c: PSwsContext; inv_table: Plongint; srcRange: longint; table: Plongint; dstRange: longint;
  brightness: longint; contrast: longint; saturation: longint): longint; cdecl; external libswscale;
function sws_getColorspaceDetails(c: PSwsContext; inv_table: PPlongint; srcRange: Plongint; table: PPlongint; dstRange: Plongint;
  brightness: Plongint; contrast: Plongint; saturation: Plongint): longint; cdecl; external libswscale;
function sws_allocVec(length: longint): PSwsVector; cdecl; external libswscale;
function sws_getGaussianVec(variance: double; quality: double): PSwsVector; cdecl; external libswscale;
procedure sws_scaleVec(a: PSwsVector; scalar: double); cdecl; external libswscale;
procedure sws_normalizeVec(a: PSwsVector; height: double); cdecl; external libswscale;
procedure sws_freeVec(a: PSwsVector); cdecl; external libswscale;
function sws_getDefaultFilter(lumaGBlur: single; chromaGBlur: single; lumaSharpen: single; chromaSharpen: single; chromaHShift: single;
  chromaVShift: single; verbose: longint): PSwsFilter; cdecl; external libswscale;
procedure sws_freeFilter(filter: PSwsFilter); cdecl; external libswscale;
function sws_getCachedContext(context: PSwsContext; srcW: longint; srcH: longint; srcFormat: TAVPixelFormat; dstW: longint;
  dstH: longint; dstFormat: TAVPixelFormat; flags: longint; srcFilter: PSwsFilter; dstFilter: PSwsFilter;
  param: Pdouble): PSwsContext; cdecl; external libswscale;
procedure sws_convertPalette8ToPacked32(src: Puint8_t; dst: Puint8_t; num_pixels: longint; palette: Puint8_t); cdecl; external libswscale;
procedure sws_convertPalette8ToPacked24(src: Puint8_t; dst: Puint8_t; num_pixels: longint; palette: Puint8_t); cdecl; external libswscale;
function sws_get_class: PAVClass; cdecl; external libswscale;

{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
