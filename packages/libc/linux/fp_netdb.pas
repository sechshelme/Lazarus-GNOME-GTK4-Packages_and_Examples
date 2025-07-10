unit fp_netdb;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/netdb.h

type
  Tnetent = record
    n_name: pchar;
    n_aliases: ^pchar;
    n_addrtype: longint;
    n_net: uint32;
  end;
  Pnetent = ^Tnetent;


  // /usr/include/rpc/netdb.h

type
  Trpcent = record
    r_name: pchar;
    r_aliases: ^pchar;
    r_number: longint;
  end;
  Prpcent = ^Trpcent;
  PPrpcent = ^Prpcent;

procedure setrpcent(__stayopen: longint); cdecl; external libc;
procedure endrpcent; cdecl; external libc;
function getrpcbyname(__name: pchar): Prpcent; cdecl; external libc;
function getrpcbynumber(__number: longint): Prpcent; cdecl; external libc;
function getrpcent: Prpcent; cdecl; external libc;
function getrpcbyname_r(__name: pchar; __result_buf: Prpcent; __buffer: pchar; __buflen: Tsize_t; __result: PPrpcent): longint; cdecl; external libc;
function getrpcbynumber_r(__number: longint; __result_buf: Prpcent; __buffer: pchar; __buflen: Tsize_t; __result: PPrpcent): longint; cdecl; external libc;
function getrpcent_r(__result_buf: Prpcent; __buffer: pchar; __buflen: Tsize_t; __result: PPrpcent): longint; cdecl; external libc;


//  /usr/include/netdb.h

const
  _PATH_HEQUIV = '/etc/hosts.equiv';
  _PATH_HOSTS = '/etc/hosts';
  _PATH_NETWORKS = '/etc/networks';
  _PATH_NSSWITCH_CONF = '/etc/nsswitch.conf';
  _PATH_PROTOCOLS = '/etc/protocols';
  _PATH_SERVICES = '/etc/services';

function __h_errno_location: Plongint; cdecl; external libc;

const
  HOST_NOT_FOUND = 1;
  TRY_AGAIN = 2;
  NO_RECOVERY = 3;
  NO_DATA = 4;

const
  NETDB_INTERNAL = -(1);
  NETDB_SUCCESS = 0;
  NO_ADDRESS = NO_DATA;

const
  IPPORT_RESERVED = 1024;

const
  SCOPE_DELIMITER = '%';

procedure herror(__str: pchar); cdecl; external libc;
function hstrerror(__err_num: longint): pchar; cdecl; external libc;

type
  Thostent = record
    h_name: pchar;
    h_aliases: ^pchar;
    h_addrtype: longint;
    h_length: longint;
    h_addr_list: ^pchar;
  end;
  Phostent = ^Thostent;
  PPhostent = ^Phostent;

procedure sethostent(__stay_open: longint); cdecl; external libc;
procedure endhostent; cdecl; external libc;
function gethostent: Phostent; cdecl; external libc;
function gethostbyaddr(__addr: pointer; __len: Tsocklen_t; __type: longint): Phostent; cdecl; external libc;
function gethostbyname(__name: pchar): Phostent; cdecl; external libc;
function gethostbyname2(__name: pchar; __af: longint): Phostent; cdecl; external libc;
function gethostent_r(__result_buf: Phostent; __buf: pchar; __buflen: Tsize_t; __result: PPhostent; __h_errnop: Plongint): longint; cdecl; external libc;
function gethostbyaddr_r(__addr: pointer; __len: Tsocklen_t; __type: longint; __result_buf: Phostent; __buf: pchar;
  __buflen: Tsize_t; __result: PPhostent; __h_errnop: Plongint): longint; cdecl; external libc;
function gethostbyname_r(__name: pchar; __result_buf: Phostent; __buf: pchar; __buflen: Tsize_t; __result: PPhostent;
  __h_errnop: Plongint): longint; cdecl; external libc;
function gethostbyname2_r(__name: pchar; __af: longint; __result_buf: Phostent; __buf: pchar; __buflen: Tsize_t;
  __result: PPhostent; __h_errnop: Plongint): longint; cdecl; external libc;
procedure setnetent(__stay_open: longint); cdecl; external libc;
procedure endnetent; cdecl; external libc;
function getnetent: Pnetent; cdecl; external libc;
function getnetbyaddr(__net: uint32; __type: longint): Pnetent; cdecl; external libc;
function getnetbyname(__name: pchar): Pnetent; cdecl; external libc;
function getnetent_r(__result_buf: Pnetent; __buf: pchar; __buflen: Tsize_t; __result: PPnetent; __h_errnop: Plongint): longint; cdecl; external libc;
function getnetbyaddr_r(__net: uint32; __type: longint; __result_buf: Pnetent; __buf: pchar; __buflen: Tsize_t;
  __result: PPnetent; __h_errnop: Plongint): longint; cdecl; external libc;
function getnetbyname_r(__name: pchar; __result_buf: Pnetent; __buf: pchar; __buflen: Tsize_t; __result: PPnetent;
  __h_errnop: Plongint): longint; cdecl; external libc;

type
  Tservent = record
    s_name: pchar;
    s_aliases: ^pchar;
    s_port: longint;
    s_proto: pchar;
  end;
  Pservent = ^Tservent;
  PPservent = ^Pservent;

procedure setservent(__stay_open: longint); cdecl; external libc;
procedure endservent; cdecl; external libc;
function getservent: Pservent; cdecl; external libc;
function getservbyname(__name: pchar; __proto: pchar): Pservent; cdecl; external libc;
function getservbyport(__port: longint; __proto: pchar): Pservent; cdecl; external libc;
function getservent_r(__result_buf: Pservent; __buf: pchar; __buflen: Tsize_t; __result: PPservent): longint; cdecl; external libc;
function getservbyname_r(__name: pchar; __proto: pchar; __result_buf: Pservent; __buf: pchar; __buflen: Tsize_t;
  __result: PPservent): longint; cdecl; external libc;
function getservbyport_r(__port: longint; __proto: pchar; __result_buf: Pservent; __buf: pchar; __buflen: Tsize_t;
  __result: PPservent): longint; cdecl; external libc;

type
  Tprotoent = record
    p_name: pchar;
    p_aliases: ^pchar;
    p_proto: longint;
  end;
  Pprotoent = ^Tprotoent;
  PPprotoent = ^Pprotoent;

procedure setprotoent(__stay_open: longint); cdecl; external libc;
procedure endprotoent; cdecl; external libc;
function getprotoent: Pprotoent; cdecl; external libc;
function getprotobyname(__name: pchar): Pprotoent; cdecl; external libc;
function getprotobynumber(__proto: longint): Pprotoent; cdecl; external libc;
function getprotoent_r(__result_buf: Pprotoent; __buf: pchar; __buflen: Tsize_t; __result: PPprotoent): longint; cdecl; external libc;
function getprotobyname_r(__name: pchar; __result_buf: Pprotoent; __buf: pchar; __buflen: Tsize_t; __result: PPprotoent): longint; cdecl; external libc;
function getprotobynumber_r(__proto: longint; __result_buf: Pprotoent; __buf: pchar; __buflen: Tsize_t; __result: PPprotoent): longint; cdecl; external libc;
function setnetgrent(__netgroup: pchar): longint; cdecl; external libc;
procedure endnetgrent; cdecl; external libc;
function getnetgrent(__hostp: PPchar; __userp: PPchar; __domainp: PPchar): longint; cdecl; external libc;
function innetgr(__netgroup: pchar; __host: pchar; __user: pchar; __domain: pchar): longint; cdecl; external libc;
function getnetgrent_r(__hostp: PPchar; __userp: PPchar; __domainp: PPchar; __buffer: pchar; __buflen: Tsize_t): longint; cdecl; external libc;
function rcmd(__ahost: PPchar; __rport: word; __locuser: pchar; __remuser: pchar; __cmd: pchar;
  __fd2p: Plongint): longint; cdecl; external libc;
function rcmd_af(__ahost: PPchar; __rport: word; __locuser: pchar; __remuser: pchar; __cmd: pchar;
  __fd2p: Plongint; __af: Tsa_family_t): longint; cdecl; external libc;
function rexec(__ahost: PPchar; __rport: longint; __name: pchar; __pass: pchar; __cmd: pchar;
  __fd2p: Plongint): longint; cdecl; external libc;
function rexec_af(__ahost: PPchar; __rport: longint; __name: pchar; __pass: pchar; __cmd: pchar;
  __fd2p: Plongint; __af: Tsa_family_t): longint; cdecl; external libc;
function ruserok(__rhost: pchar; __suser: longint; __remuser: pchar; __locuser: pchar): longint; cdecl; external libc;
function ruserok_af(__rhost: pchar; __suser: longint; __remuser: pchar; __locuser: pchar; __af: Tsa_family_t): longint; cdecl; external libc;
function iruserok(__raddr: uint32; __suser: longint; __remuser: pchar; __locuser: pchar): longint; cdecl; external libc;
function iruserok_af(__raddr: pointer; __suser: longint; __remuser: pchar; __locuser: pchar; __af: Tsa_family_t): longint; cdecl; external libc;
function rresvport(__alport: Plongint): longint; cdecl; external libc;
function rresvport_af(__alport: Plongint; __af: Tsa_family_t): longint; cdecl; external libc;

type
  PPaddrinfo = ^Paddrinfo;
  Paddrinfo = ^Taddrinfo;

  Taddrinfo = record
    ai_flags: longint;
    ai_family: longint;
    ai_socktype: longint;
    ai_protocol: longint;
    ai_addrlen: Tsocklen_t;
    ai_addr: Psockaddr;
    ai_canonname: pchar;
    ai_next: Paddrinfo;
  end;

type
  Tgaicb = record
    ar_name: pchar;
    ar_service: pchar;
    ar_request: Paddrinfo;
    ar_result: Paddrinfo;
    __return: longint;
    __glibc_reserved: array[0..4] of longint;
  end;
  Pgaicb = ^Tgaicb;
  PPgaicb = ^Pgaicb;

const
  GAI_WAIT = 0;
  GAI_NOWAIT = 1;

const
  AI_PASSIVE = $0001;
  AI_CANONNAME = $0002;
  AI_NUMERICHOST = $0004;
  AI_V4MAPPED = $0008;
  AI_ALL = $0010;
  AI_ADDRCONFIG = $0020;

const
  AI_IDN = $0040;
  AI_CANONIDN = $0080;

const
  AI_NUMERICSERV = $0400;
  EAI_BADFLAGS = -(1);
  EAI_NONAME = -(2);
  EAI_AGAIN = -(3);
  EAI_FAIL = -(4);
  EAI_FAMILY = -(6);
  EAI_SOCKTYPE = -(7);
  EAI_SERVICE = -(8);
  EAI_MEMORY = -(10);
  EAI_SYSTEM = -(11);
  EAI_OVERFLOW = -(12);

const
  EAI_NODATA = -(5);
  EAI_ADDRFAMILY = -(9);
  EAI_INPROGRESS = -(100);
  EAI_CANCELED = -(101);
  EAI_NOTCANCELED = -(102);
  EAI_ALLDONE = -(103);
  EAI_INTR = -(104);
  EAI_IDN_ENCODE = -(105);

const
  NI_MAXHOST = 1025;
  NI_MAXSERV = 32;

const
  NI_NUMERICHOST = 1;
  NI_NUMERICSERV = 2;
  NI_NOFQDN = 4;
  NI_NAMEREQD = 8;
  NI_DGRAM = 16;

const
  NI_IDN = 32;

function getaddrinfo(__name: pchar; __service: pchar; __req: Paddrinfo; __pai: PPaddrinfo): longint; cdecl; external libc;
procedure freeaddrinfo(__ai: Paddrinfo); cdecl; external libc;
function gai_strerror(__ecode: longint): pchar; cdecl; external libc;
function getnameinfo(__sa: Psockaddr; __salen: Tsocklen_t; __host: pchar; __hostlen: Tsocklen_t; __serv: pchar;
  __servlen: Tsocklen_t; __flags: longint): longint; cdecl; external libc;
function getaddrinfo_a(__mode: longint; __list: PPgaicb; __ent: longint; __sig: Psigevent): longint; cdecl; external libc;
function gai_suspend(__list: PPgaicb; __ent: longint; __timeout: Ptimespec): longint; cdecl; external libc;
function gai_error(__req: Pgaicb): longint; cdecl; external libc;
function gai_cancel(__gaicbp: Pgaicb): longint; cdecl; external libc;

// === Konventiert am: 5-7-25 19:53:34 ===


implementation



end.
