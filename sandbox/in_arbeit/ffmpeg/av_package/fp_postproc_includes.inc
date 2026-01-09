  {$IFDEF read_interface}

const
  LIBPOSTPROC_VERSION_MINOR = 3;
  LIBPOSTPROC_VERSION_MICRO = 100;

const
  LIBPOSTPROC_VERSION_MAJOR = 57;

  // ====

function postproc_version: dword; cdecl; external libpostproc;
function postproc_configuration: pchar; cdecl; external libpostproc;
function postproc_license: pchar; cdecl; external libpostproc;

const
  PP_QUALITY_MAX = 6;

type
  Ppp_context = ^Tpp_context;
  Tpp_context = pointer;

  Ppp_mode = ^Tpp_mode;
  Tpp_mode = pointer;

var
  pp_help: pchar; cvar;external libpostproc;

procedure pp_postprocess(src: PPuint8_t; srcStride: Plongint; dst: PPuint8_t; dstStride: Plongint; horizontalSize: longint;
  verticalSize: longint; QP_store: Pint8_t; QP_stride: longint; mode: Ppp_mode; ppContext: Ppp_context;
  pict_type: longint); cdecl; external libpostproc;
function pp_get_mode_by_name_and_quality(name: pchar; quality: longint): Ppp_mode; cdecl; external libpostproc;
procedure pp_free_mode(mode: Ppp_mode); cdecl; external libpostproc;
function pp_get_context(width: longint; height: longint; flags: longint): Ppp_context; cdecl; external libpostproc;
procedure pp_free_context(ppContext: Ppp_context); cdecl; external libpostproc;

const
  PP_CPU_CAPS_MMX = $80000000;
  PP_CPU_CAPS_MMX2 = $20000000;
  PP_CPU_CAPS_3DNOW = $40000000;
  PP_CPU_CAPS_ALTIVEC = $10000000;
  PP_CPU_CAPS_AUTO = $00080000;
  PP_FORMAT = $00000008;
  PP_FORMAT_420 = $00000011 or PP_FORMAT;
  PP_FORMAT_422 = $00000001 or PP_FORMAT;
  PP_FORMAT_411 = $00000002 or PP_FORMAT;
  PP_FORMAT_444 = $00000000 or PP_FORMAT;
  PP_FORMAT_440 = $00000010 or PP_FORMAT;
  PP_PICT_TYPE_QP2 = $00000010;


  {$ENDIF read_interface}


  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
