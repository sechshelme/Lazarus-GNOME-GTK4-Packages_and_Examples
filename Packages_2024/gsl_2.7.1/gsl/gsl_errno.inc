{$IFDEF read_interface}


const
  GSL_SUCCESS = 0;
  GSL_FAILURE = -(1);
  GSL_CONTINUE = -(2);
  GSL_EDOM = 1;
  GSL_ERANGE = 2;
  GSL_EFAULT = 3;
  GSL_EINVAL = 4;
  GSL_EFAILED = 5;
  GSL_EFACTOR = 6;
  GSL_ESANITY = 7;
  GSL_ENOMEM = 8;
  GSL_EBADFUNC = 9;
  GSL_ERUNAWAY = 10;
  GSL_EMAXITER = 11;
  GSL_EZERODIV = 12;
  GSL_EBADTOL = 13;
  GSL_ETOL = 14;
  GSL_EUNDRFLW = 15;
  GSL_EOVRFLW = 16;
  GSL_ELOSS = 17;
  GSL_EROUND = 18;
  GSL_EBADLEN = 19;
  GSL_ENOTSQR = 20;
  GSL_ESING = 21;
  GSL_EDIVERGE = 22;
  GSL_EUNSUP = 23;
  GSL_EUNIMPL = 24;
  GSL_ECACHE = 25;
  GSL_ETABLE = 26;
  GSL_ENOPROG = 27;
  GSL_ENOPROGJ = 28;
  GSL_ETOLF = 29;
  GSL_ETOLX = 30;
  GSL_ETOLG = 31;
  GSL_EOF = 32;


procedure gsl_error(reason: pchar; file_: pchar; line: longint; gsl_errno: longint); cdecl; external libgsl;
procedure gsl_stream_printf(_label: pchar; file_: pchar; line: longint; reason: pchar); cdecl; external libgsl;
function gsl_strerror(gsl_errno: longint): pchar; cdecl; external libgsl;

type
  Tgsl_error_handler_t = procedure(reason: pchar; file_: pchar; line: longint; gsl_errno: longint); cdecl;
  Tgsl_stream_handler_t = procedure(_label: pchar; file_: pchar; line: longint; reason: pchar); cdecl;

function gsl_set_error_handler(new_handler: Tgsl_error_handler_t): Tgsl_error_handler_t; cdecl; external libgsl;
function gsl_set_error_handler_off: Tgsl_error_handler_t; cdecl; external libgsl;
function gsl_set_stream_handler(new_handler: Tgsl_stream_handler_t): Tgsl_stream_handler_t; cdecl; external libgsl;
function gsl_set_stream(new_stream: PFILE): PFILE; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:52:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
