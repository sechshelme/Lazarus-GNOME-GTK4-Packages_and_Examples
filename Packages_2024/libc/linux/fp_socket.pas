unit fp_socket;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/socket_type.h

type
  T_socket_type = longint;

const
  SOCK_STREAM = 1;
  SOCK_DGRAM = 2;
  SOCK_RAW = 3;
  SOCK_RDM = 4;
  SOCK_SEQPACKET = 5;
  SOCK_DCCP = 6;
  SOCK_PACKET = 10;
  SOCK_CLOEXEC = 524288;
  SOCK_NONBLOCK = 2048;
//  SOCK_CLOEXEC = 02000000;
//  SOCK_NONBLOCK = 00004000;


  // /usr/include/x86_64-linux-gnu/bits/socket.h

type
  Psocklen_t = ^Tsocklen_t;
  Tsocklen_t = uint32;

const
  PF_UNSPEC = 0;
  PF_LOCAL = 1;
  PF_UNIX = PF_LOCAL;
  PF_FILE = PF_LOCAL;
  PF_INET = 2;
  PF_AX25 = 3;
  PF_IPX = 4;
  PF_APPLETALK = 5;
  PF_NETROM = 6;
  PF_BRIDGE = 7;
  PF_ATMPVC = 8;
  PF_X25 = 9;
  PF_INET6 = 10;
  PF_ROSE = 11;
  PF_DECnet = 12;
  PF_NETBEUI = 13;
  PF_SECURITY = 14;
  PF_KEY = 15;
  PF_NETLINK = 16;
  PF_ROUTE = PF_NETLINK;
  PF_PACKET = 17;
  PF_ASH = 18;
  PF_ECONET = 19;
  PF_ATMSVC = 20;
  PF_RDS = 21;
  PF_SNA = 22;
  PF_IRDA = 23;
  PF_PPPOX = 24;
  PF_WANPIPE = 25;
  PF_LLC = 26;
  PF_IB = 27;
  PF_MPLS = 28;
  PF_CAN = 29;
  PF_TIPC = 30;
  PF_BLUETOOTH = 31;
  PF_IUCV = 32;
  PF_RXRPC = 33;
  PF_ISDN = 34;
  PF_PHONET = 35;
  PF_IEEE802154 = 36;
  PF_CAIF = 37;
  PF_ALG = 38;
  PF_NFC = 39;
  PF_VSOCK = 40;
  PF_KCM = 41;
  PF_QIPCRTR = 42;
  PF_SMC = 43;
  PF_XDP = 44;
  PF_MCTP = 45;
  PF_MAX = 46;
  AF_UNSPEC = PF_UNSPEC;
  AF_LOCAL = PF_LOCAL;
  AF_UNIX = PF_UNIX;
  AF_FILE = PF_FILE;
  AF_INET = PF_INET;
  AF_AX25 = PF_AX25;
  AF_IPX = PF_IPX;
  AF_APPLETALK = PF_APPLETALK;
  AF_NETROM = PF_NETROM;
  AF_BRIDGE = PF_BRIDGE;
  AF_ATMPVC = PF_ATMPVC;
  AF_X25 = PF_X25;
  AF_INET6 = PF_INET6;
  AF_ROSE = PF_ROSE;
  AF_DECnet = PF_DECnet;
  AF_NETBEUI = PF_NETBEUI;
  AF_SECURITY = PF_SECURITY;
  AF_KEY = PF_KEY;
  AF_NETLINK = PF_NETLINK;
  AF_ROUTE = PF_ROUTE;
  AF_PACKET = PF_PACKET;
  AF_ASH = PF_ASH;
  AF_ECONET = PF_ECONET;
  AF_ATMSVC = PF_ATMSVC;
  AF_RDS = PF_RDS;
  AF_SNA = PF_SNA;
  AF_IRDA = PF_IRDA;
  AF_PPPOX = PF_PPPOX;
  AF_WANPIPE = PF_WANPIPE;
  AF_LLC = PF_LLC;
  AF_IB = PF_IB;
  AF_MPLS = PF_MPLS;
  AF_CAN = PF_CAN;
  AF_TIPC = PF_TIPC;
  AF_BLUETOOTH = PF_BLUETOOTH;
  AF_IUCV = PF_IUCV;
  AF_RXRPC = PF_RXRPC;
  AF_ISDN = PF_ISDN;
  AF_PHONET = PF_PHONET;
  AF_IEEE802154 = PF_IEEE802154;
  AF_CAIF = PF_CAIF;
  AF_ALG = PF_ALG;
  AF_NFC = PF_NFC;
  AF_VSOCK = PF_VSOCK;
  AF_KCM = PF_KCM;
  AF_QIPCRTR = PF_QIPCRTR;
  AF_SMC = PF_SMC;
  AF_XDP = PF_XDP;
  AF_MCTP = PF_MCTP;
  AF_MAX = PF_MAX;
  SOL_RAW = 255;
  SOL_DECNET = 261;
  SOL_X25 = 262;
  SOL_PACKET = 263;
  SOL_ATM = 264;
  SOL_AAL = 265;
  SOL_IRDA = 266;
  SOL_NETBEUI = 267;
  SOL_LLC = 268;
  SOL_DCCP = 269;
  SOL_NETLINK = 270;
  SOL_TIPC = 271;
  SOL_RXRPC = 272;
  SOL_PPPOL2TP = 273;
  SOL_BLUETOOTH = 274;
  SOL_PNPIPE = 275;
  SOL_RDS = 276;
  SOL_IUCV = 277;
  SOL_CAIF = 278;
  SOL_ALG = 279;
  SOL_NFC = 280;
  SOL_KCM = 281;
  SOL_TLS = 282;
  SOL_XDP = 283;
  SOL_MPTCP = 284;
  SOL_MCTP = 285;
  SOL_SMC = 286;
  SOMAXCONN = 4096;

type
  Tsa_family_t = word;

type
  Tsockaddr = record
    sa_family: Tsa_family_t;
    sa_data: array[0..13] of ansichar;
  end;
  Psockaddr = ^Tsockaddr;

type
  Tsockaddr_storage = record
    ss_family: Tsa_family_t;
    __ss_padding: array[0..117] of byte;
    __ss_align: QWord;
  end;
  Psockaddr_storage = ^Tsockaddr_storage;

const
  MSG_OOB = $01;
  MSG_PEEK = $02;
  MSG_DONTROUTE = $04;
  MSG_TRYHARD = MSG_DONTROUTE;
  MSG_CTRUNC = $08;
  MSG_PROXY = $10;
  MSG_TRUNC = $20;
  MSG_DONTWAIT = $40;
  MSG_EOR = $80;
  MSG_WAITALL = $100;
  MSG_FIN = $200;
  MSG_SYN = $400;
  MSG_CONFIRM = $800;
  MSG_RST = $1000;
  MSG_ERRQUEUE = $2000;
  MSG_NOSIGNAL = $4000;
  MSG_MORE = $8000;
  MSG_WAITFORONE = $10000;
  MSG_BATCH = $40000;
  MSG_ZEROCOPY = $4000000;
  MSG_FASTOPEN = $20000000;
  MSG_CMSG_CLOEXEC = $40000000;

type
  Tmsghdr = record
    msg_name: pointer;
    msg_namelen: Tsocklen_t;
    msg_iov: Piovec;
    msg_iovlen: Tsize_t;
    msg_control: pointer;
    msg_controllen: Tsize_t;
    msg_flags: longint;
  end;
  Pmsghdr = ^Tmsghdr;

  Tcmsghdr = record
    cmsg_len: Tsize_t;
    cmsg_level: longint;
    cmsg_type: longint;
    __flexarr: byte;
  end;
  Pcmsghdr = ^Tcmsghdr;

function __cmsg_nxthdr(__mhdr: Pmsghdr; __cmsg: Pcmsghdr): Pcmsghdr; cdecl; external libc;

const
  SCM_RIGHTS = $01;
  SCM_CREDENTIALS = $02;
  SCM_SECURITY = $03;
  SCM_PIDFD = $04;

type
  Tucred = record
    pid: Tpid_t;
    uid: Tuid_t;
    gid: Tgid_t;
  end;
  Pucred = ^Tucred;

type
  Tlinger = record
    l_onoff: longint;
    l_linger: longint;
  end;
  Plinger = ^Tlinger;


  // /usr/include/x86_64-linux-gnu/sys/socket.h

const
  SHUT_RD = 0;
  SHUT_WR = 1;
  SHUT_RDWR = 2;

type
  Tmmsghdr = record
    msg_hdr: Tmsghdr;
    msg_len: dword;
  end;
  Pmmsghdr = ^Tmmsghdr;

function socket(__domain: longint; __type: longint; __protocol: longint): longint; cdecl; external libc;
function socketpair(__domain: longint; __type: longint; __protocol: longint; __fds: PLongint): longint; cdecl; external libc;
function bind(__fd: longint; __addr: Psockaddr; __len: Tsocklen_t): longint; cdecl; external libc;
function getsockname(__fd: longint; __addr: Psockaddr; __len: Psocklen_t): longint; cdecl; external libc;
function connect(__fd: longint; __addr: Psockaddr; __len: Tsocklen_t): longint; cdecl; external libc;
function getpeername(__fd: longint; __addr: Psockaddr; __len: Psocklen_t): longint; cdecl; external libc;
function send(__fd: longint; __buf: pointer; __n: Tsize_t; __flags: longint): Tssize_t; cdecl; external libc;
function recv(__fd: longint; __buf: pointer; __n: Tsize_t; __flags: longint): Tssize_t; cdecl; external libc;
function sendto(__fd: longint; __buf: pointer; __n: Tsize_t; __flags: longint; __addr: Psockaddr; __addr_len: Tsocklen_t): Tssize_t; cdecl; external libc;
function recvfrom(__fd: longint; __buf: pointer; __n: Tsize_t; __flags: longint; __addr: Psockaddr; __addr_len: Psocklen_t): Tssize_t; cdecl; external libc;
function sendmsg(__fd: longint; __message: Pmsghdr; __flags: longint): Tssize_t; cdecl; external libc;
function sendmmsg(__fd: longint; __vmessages: Pmmsghdr; __vlen: dword; __flags: longint): longint; cdecl; external libc;

function recvmsg(__fd: longint; __message: Pmsghdr; __flags: longint): Tssize_t; cdecl; external libc;
function recvmmsg(__fd: longint; __vmessages: Pmmsghdr; __vlen: dword; __flags: longint; __tmo: Ptimespec): longint; cdecl; external libc;

function getsockopt(__fd: longint; __level: longint; __optname: longint; __optval: pointer; __optlen: Psocklen_t): longint; cdecl; external libc;
function setsockopt(__fd: longint; __level: longint; __optname: longint; __optval: pointer; __optlen: Tsocklen_t): longint; cdecl; external libc;

function listen(__fd: longint; __n: longint): longint; cdecl; external libc;
function accept(__fd: longint; __addr: Psockaddr; __addr_len: Psocklen_t): longint; cdecl; external libc;
function accept4(__fd: longint; __addr: Psockaddr; __addr_len: Psocklen_t; __flags: longint): longint; cdecl; external libc;
function shutdown(__fd: longint; __how: longint): longint; cdecl; external libc;
function sockatmark(__fd: longint): longint; cdecl; external libc;
function isfdtype(__fd: longint; __fdtype: longint): longint; cdecl; external libc;

// === Konventiert am: 6-7-25 13:27:08 ===


implementation



end.
