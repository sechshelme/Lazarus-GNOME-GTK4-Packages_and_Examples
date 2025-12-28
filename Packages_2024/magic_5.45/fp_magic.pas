unit fp_magic;

interface

const
  {$IFDEF Linux}
  libmagic = 'magic';
  {$ENDIF}

  {$IFDEF mswindows}
  libmagic = 'libmagic-1.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MAGIC_NONE = $0000000;
  MAGIC_DEBUG = $0000001;
  MAGIC_SYMLINK = $0000002;
  MAGIC_COMPRESS = $0000004;
  MAGIC_DEVICES = $0000008;
  MAGIC_MIME_TYPE = $0000010;
  MAGIC_CONTINUE = $0000020;
  MAGIC_CHECK_ = $0000040;
  MAGIC_PRESERVE_ATIME = $0000080;
  MAGIC_RAW = $0000100;
  MAGIC_ERROR_ = $0000200;
  MAGIC_MIME_ENCODING = $0000400;
  MAGIC_MIME = MAGIC_MIME_TYPE or MAGIC_MIME_ENCODING;
  MAGIC_APPLE = $0000800;
  MAGIC_EXTENSION = $1000000;
  MAGIC_COMPRESS_TRANSP = $2000000;
  MAGIC_NO_COMPRESS_FORK = $4000000;
  MAGIC_NODESC = (MAGIC_EXTENSION or MAGIC_MIME) or MAGIC_APPLE;
  MAGIC_NO_CHECK_COMPRESS = $0001000;
  MAGIC_NO_CHECK_TAR = $0002000;
  MAGIC_NO_CHECK_SOFT = $0004000;
  MAGIC_NO_CHECK_APPTYPE = $0008000;
  MAGIC_NO_CHECK_ELF = $0010000;
  MAGIC_NO_CHECK_TEXT = $0020000;
  MAGIC_NO_CHECK_CDF = $0040000;
  MAGIC_NO_CHECK_CSV = $0080000;
  MAGIC_NO_CHECK_TOKENS = $0100000;
  MAGIC_NO_CHECK_ENCODING = $0200000;
  MAGIC_NO_CHECK_JSON = $0400000;
  MAGIC_NO_CHECK_SIMH = $0800000;
  MAGIC_NO_CHECK_BUILTIN = MAGIC_NO_CHECK_COMPRESS or MAGIC_NO_CHECK_TAR or MAGIC_NO_CHECK_APPTYPE or MAGIC_NO_CHECK_ELF or MAGIC_NO_CHECK_TEXT or MAGIC_NO_CHECK_CSV or MAGIC_NO_CHECK_CDF or MAGIC_NO_CHECK_TOKENS or MAGIC_NO_CHECK_ENCODING or MAGIC_NO_CHECK_JSON or MAGIC_NO_CHECK_SIMH;

  MAGIC_NO_CHECK_ASCII = MAGIC_NO_CHECK_TEXT;
  MAGIC_NO_CHECK_FORTRAN = $000000;
  MAGIC_NO_CHECK_TROFF = $000000;
  MAGIC_VERSION_ = 545;

type
  Pmagic_t = ^Tmagic_t;
  Tmagic_t = Pointer;

function magic_open(para1: longint): Tmagic_t; cdecl; external libmagic;
procedure magic_close(para1: Tmagic_t); cdecl; external libmagic;
function magic_getpath(para1: pchar; para2: longint): pchar; cdecl; external libmagic;
function magic_file(para1: Tmagic_t; para2: pchar): pchar; cdecl; external libmagic;
function magic_descriptor(para1: Tmagic_t; para2: longint): pchar; cdecl; external libmagic;
function magic_buffer(para1: Tmagic_t; para2: pointer; para3: Tsize_t): pchar; cdecl; external libmagic;
function magic_error(para1: Tmagic_t): pchar; cdecl; external libmagic;
function magic_getflags(para1: Tmagic_t): longint; cdecl; external libmagic;
function magic_setflags(para1: Tmagic_t; para2: longint): longint; cdecl; external libmagic;
function magic_version: longint; cdecl; external libmagic;
function magic_load(para1: Tmagic_t; para2: pchar): longint; cdecl; external libmagic;
function magic_load_buffers(para1: Tmagic_t; para2: Ppointer; para3: Psize_t; para4: Tsize_t): longint; cdecl; external libmagic;
function magic_compile(para1: Tmagic_t; para2: pchar): longint; cdecl; external libmagic;
function magic_check(para1: Tmagic_t; para2: pchar): longint; cdecl; external libmagic;
function magic_list(para1: Tmagic_t; para2: pchar): longint; cdecl; external libmagic;
function magic_errno(para1: Tmagic_t): longint; cdecl; external libmagic;

const
  MAGIC_PARAM_INDIR_MAX = 0;
  MAGIC_PARAM_NAME_MAX = 1;
  MAGIC_PARAM_ELF_PHNUM_MAX = 2;
  MAGIC_PARAM_ELF_SHNUM_MAX = 3;
  MAGIC_PARAM_ELF_NOTES_MAX = 4;
  MAGIC_PARAM_REGEX_MAX = 5;
  MAGIC_PARAM_BYTES_MAX = 6;
  MAGIC_PARAM_ENCODING_MAX = 7;
  MAGIC_PARAM_ELF_SHSIZE_MAX = 8;

function magic_setparam(para1: Tmagic_t; para2: longint; para3: pointer): longint; cdecl; external libmagic;
function magic_getparam(para1: Tmagic_t; para2: longint; para3: pointer): longint; cdecl; external libmagic;

// === Konventiert am: 28-12-25 16:08:54 ===


implementation



end.
