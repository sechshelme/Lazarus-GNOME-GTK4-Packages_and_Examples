unit efl;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF Linux}
  libclib = 'c';
  libelementary = 'libelementary';
  libevas = 'libevas';
  libeina = 'libeina';
  libeo = 'libeo';
  libefl = 'libefl';
  libefl_canvas_wl = 'libefl_canvas_wl';
  libeet = 'libeet';
  libemile = 'libemile';
  libethumb = 'libethumb';
  libecore = 'libecore';
  libecore_file = 'libecore_file';
  libecore_eva = 'libecore_evas';
  libecore_con = 'libecore_con';
  libecore_ipc = 'libecore_ipc';
  libecore_audio = 'libecore_audio';
  libecore_x = 'libecore_x';
  libecore_drm2 = 'libecore_drm2';
  libecore_fb = 'libecore_fb';
  libedje = 'libedje';
  libeldbus = 'libeldbus';
  libefreet = 'libefreet';
  libemotion = 'libemotion';
  libeio = 'libeio';
  libeeze = 'libeeze';
  libeolian = 'libeolian';
  libecore_imf = 'libecore_imf';
  libecore_imf_evas = 'libecore_imf_evas';
  libecore_input = 'libecore_input';
  libecore_input_evas = 'libecore_input_evas';
  libecore_wl2 = 'libecore_wl2';
  libelput = 'libelput';
  libembryo = 'libembryo';
  libethumb_client = 'libethumb_client';
  {$ENDIF}

  {$IFDEF mswindows}
  libclib = 'msvcrt';
  libelementary = 'libelementary-1.dll';
  libevas = 'libevas-1.dll';
  libeina = 'libeina-1.dll';
  libeo = 'libeo-1.dll';
  libefl = 'libefl-1.dll';
  libefl_canvas_wl = 'libefl_canvas_wl-1.dll';
  libeet = 'libeet-1.dll';
  libemile = 'libemile-1.dll';
  libethumb = 'libethumb-1.dll';
  libecore = 'libecore-1.dll';
  libecore_file = 'libecore_file-1.dll';
  libecore_evas = 'libecore_evas-1.dll';
  libencore_con = 'libecore_con-1.dll';
  libecore_ipc = 'libecore_ipc-1.dll';
  libecore_audio = 'libecore_audio-1.dll';
  libecore_x = 'libecore_x-1.dll';
  libecore_drm2 = 'libecore_drm2-1.dll';
  libecore_fb = 'libecore_fb-1.dll';
  libedje = 'libedje-1.dll';
  libeldbus = 'libeldbus-1.dll';
  libefreet = 'libefreet-1.dd';
  libemotion = 'libemotion-1.dll';
  libeio = 'libeio-1.dll';
  libeeze = 'libeeze-1.dll';
  libeolian = 'libeolian-1.dll';
  libecore_imf = 'libecore_imf-1.dll';
  libecore_imf_evas = 'libecore_imf_evas-1.dll';
  libecore_input = 'libecore_input-1.dll';
  libecore_input_evas = 'libecore_input_evas-1.dll';
  libecore_wl2 = 'libecore_wl2-1.dll';
  libelput = 'libelput-1.dll';
  libembryo = 'libembryo-1.dll';
  libethumb_client = 'libethumb_client-1.dll';
  {$ENDIF}

  {$IFDEF darwin}
  libclib = 'libc.dylib';
  {$ENDIF}


  //  {$define EFL_BETA_API_SUPPORT}

  // === System

type
  PPdword = ^PDWord;

  {$ifdef unix}
  Tva_list_struct = record
    gp_offset: uint32;
    fp_offset: uint32;
    overflow_arg_area: Pointer;
    reg_save_area: Pointer;
  end;
  Tva_list = ^Tva_list_struct;
  {$endif}
  {$ifdef windows}
  Tva_list = Pointer;
  {$endif}
  Pva_list = ^Tva_list;

type
  Ttime_t = uint64;
  Ptime_t = ^Ttime_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Tptrdiff_t = PtrInt;

  Tuintptr_t = PtrUInt;

  Twchar_t = widechar;

  PFILE = Pointer;

  // /usr/include/unistd.h
  Tpid_t = longint;

  // /usr/include/stdio.h
  Toff_t = longint;

  // /usr/include/x86_64-linux-gnu/sys/types.h
  Tmode_t = longint;


  // /usr/arm-linux-gnueabihf/include/bits/semaphore.h
  Tsem_t = record
  end;
  Psem_t = ^Tsem_t;

  // /usr/include/x86_64-linux-gnu/bits/socket.h
  Psockaddr = Pointer;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
type
  Ttm = record
    tm_sec: longint;
    tm_min: longint;
    tm_hour: longint;
    tm_mday: longint;
    tm_mon: longint;
    tm_year: longint;
    tm_wday: longint;
    tm_yday: longint;
    tm_isdst: longint;
    tm_gmtoff: int64;
    tm_zone: pchar;
  end;
  Ptm = ^Ttm;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
type
  Ptimeval = Pointer;

  // /usr/include/x86_64-linux-gnu/sys/select.h
type
  Pfd_set = Pointer;

  // /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h
type
  Tsiginfo_t = record
    // Muss aufgelöst werden
  end;
  Psiginfo_t = ^Tsiginfo_t;

function calloc(num, size: Tsize_t): Pointer; cdecl; external libclib;
function malloc(size: Tsize_t): Pointer; cdecl; external libclib;
procedure free(p: Pointer); cdecl; external libclib;

function memcpy(dest, src: Pointer; n: SizeUInt): Pointer; cdecl; external libclib;
function memchr(ptr: Pointer; value: integer; num: SizeUInt): Pointer; cdecl; external libclib;
function memcmp(ptr1, ptr2: Pointer; num: SizeUInt): integer; cdecl; external libclib;
function memset(ptr: Pointer; value: integer; num: SizeUInt): Pointer; cdecl; external libclib;

function strlen(str: pchar): Tsize_t; cdecl; external libclib;
function strdup(str: pchar): pchar; cdecl; external libclib;
function strcmp(str1, str2: pchar): integer; cdecl; external libclib;

function printf(__format: pchar): longint; cdecl; varargs; external libclib;


// /usr/include/errno.h
function __errno_location: PInteger; cdecl; external libclib;

// /usr/include/x86_64-linux-gnu/sys/param.h
function Min(a, b: integer): integer;
function Max(a, b: integer): integer;

// =====================

// /usr/include/stdio.h
const
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;

  // /usr/include/asm-generic/errno-base.h

const
  EPERM = 1;
  ENOENT = 2;
  ESRCH = 3;
  EINTR = 4;
  EIO = 5;
  ENXIO = 6;
  E2BIG = 7;
  ENOEXEC = 8;
  EBADF = 9;
  ECHILD = 10;
  EAGAIN = 11;
  ENOMEM = 12;
  EACCES = 13;
  EFAULT = 14;
  ENOTBLK = 15;
  EBUSY = 16;
  EEXIST = 17;
  EXDEV = 18;
  ENODEV = 19;
  ENOTDIR = 20;
  EISDIR = 21;
  EINVAL = 22;
  ENFILE = 23;
  EMFILE = 24;
  ENOTTY = 25;
  ETXTBSY = 26;
  EFBIG = 27;
  ENOSPC = 28;
  ESPIPE = 29;
  EROFS = 30;
  EMLINK = 31;
  EPIPE = 32;
  EDOM = 33;
  ERANGE = 34;


  // /usr/include/asm-generic/errno.h

const
  EDEADLK = 35;
  ENAMETOOLONG = 36;
  ENOLCK = 37;
  ENOSYS = 38;
  ENOTEMPTY = 39;
  ELOOP = 40;
  EWOULDBLOCK = EAGAIN;
  ENOMSG = 42;
  EIDRM = 43;
  ECHRNG = 44;
  EL2NSYNC = 45;
  EL3HLT = 46;
  EL3RST = 47;
  ELNRNG = 48;
  EUNATCH = 49;
  ENOCSI = 50;
  EL2HLT = 51;
  EBADE = 52;
  EBADR = 53;
  EXFULL = 54;
  ENOANO = 55;
  EBADRQC = 56;
  EBADSLT = 57;
  EDEADLOCK = EDEADLK;
  EBFONT = 59;
  ENOSTR = 60;
  ENODATA = 61;
  ETIME = 62;
  ENOSR = 63;
  ENONET = 64;
  ENOPKG = 65;
  EREMOTE = 66;
  ENOLINK = 67;
  EADV = 68;
  ESRMNT = 69;
  ECOMM = 70;
  EPROTO = 71;
  EMULTIHOP = 72;
  EDOTDOT = 73;
  EBADMSG = 74;
  EOVERFLOW = 75;
  ENOTUNIQ = 76;
  EBADFD = 77;
  EREMCHG = 78;
  ELIBACC = 79;
  ELIBBAD = 80;
  ELIBSCN = 81;
  ELIBMAX = 82;
  ELIBEXEC = 83;
  EILSEQ = 84;
  ERESTART = 85;
  ESTRPIPE = 86;
  EUSERS = 87;
  ENOTSOCK = 88;
  EDESTADDRREQ = 89;
  EMSGSIZE = 90;
  EPROTOTYPE = 91;
  ENOPROTOOPT = 92;
  EPROTONOSUPPORT = 93;
  ESOCKTNOSUPPORT = 94;
  EOPNOTSUPP = 95;
  EPFNOSUPPORT = 96;
  EAFNOSUPPORT = 97;
  EADDRINUSE = 98;
  EADDRNOTAVAIL = 99;
  ENETDOWN = 100;
  ENETUNREACH = 101;
  ENETRESET = 102;
  ECONNABORTED = 103;
  ECONNRESET = 104;
  ENOBUFS = 105;
  EISCONN = 106;
  ENOTCONN = 107;
  ESHUTDOWN = 108;
  ETOOMANYREFS = 109;
  ETIMEDOUT = 110;
  ECONNREFUSED = 111;
  EHOSTDOWN = 112;
  EHOSTUNREACH = 113;
  EALREADY = 114;
  EINPROGRESS = 115;
  ESTALE = 116;
  EUCLEAN = 117;
  ENOTNAM = 118;
  ENAVAIL = 119;
  EISNAM = 120;
  EREMOTEIO = 121;
  EDQUOT = 122;
  ENOMEDIUM = 123;
  EMEDIUMTYPE = 124;
  ECANCELED = 125;
  ENOKEY = 126;
  EKEYEXPIRED = 127;
  EKEYREVOKED = 128;
  EKEYREJECTED = 129;
  EOWNERDEAD = 130;
  ENOTRECOVERABLE = 131;
  ERFKILL = 132;
  EHWPOISON = 133;

  // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
type
  pthread_key_t = uint32;

  // Wayland
type
  Pwl_client = Pointer;
  Pwl_resource = Pointer;
  Pwl_display=Pointer;
  Pwl_shm=Pointer;
  Pwl_registry=Pointer;
  Pwl_surface=Pointer;
  Pwl_compositor=Pointer;
  Pwl_seat=Pointer;

  // xkb
  Pxkb_keymap=Pointer;


function errno: integer;

implementation

function errno: integer;
begin
  Result := __errno_location^;
end;

function Min(a, b: integer): integer;
begin
  if a < b then begin
    Result := a;
  end else begin
    Result := b;
  end;
end;

function Max(a, b: integer): integer;
begin
  if a > b then begin
    Result := a;
  end else begin
    Result := b;
  end;
end;


{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
//{$ENDIF}
{$ENDIF}

begin
  //  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  //{$IFDEF Linux}
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
