unit fp_errno;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/asm-generic/errno.h

const
  EAGAIN = 11; /// ???

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


  { /usr/include/x86_64-linux-gnu/bits/errno.h }

const
  ENOTSUP = EOPNOTSUPP;


  // /usr/include/errno.h

function __errno_location: Plongint; cdecl; external libc;
function errno: longint;



// === Konventiert am: 22-7-25 19:11:31 ===


implementation

function errno: longint;
begin
  errno := __errno_location^;
end;




end.
