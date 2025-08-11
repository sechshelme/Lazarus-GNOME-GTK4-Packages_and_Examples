unit in_;

interface

uses
  clib, fp_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tin_addr_t = Tuint32_t;

  Tin_addr = record
    s_addr: Tin_addr_t;
  end;
  Pin_addr = ^Tin_addr;

const
  IPPROTO_IP = 0;
  IPPROTO_ICMP = 1;
  IPPROTO_IGMP = 2;
  IPPROTO_IPIP = 4;
  IPPROTO_TCP = 6;
  IPPROTO_EGP = 8;
  IPPROTO_PUP = 12;
  IPPROTO_UDP = 17;
  IPPROTO_IDP = 22;
  IPPROTO_TP = 29;
  IPPROTO_DCCP = 33;
  IPPROTO_IPV6 = 41;
  IPPROTO_RSVP = 46;
  IPPROTO_GRE = 47;
  IPPROTO_ESP = 50;
  IPPROTO_AH = 51;
  IPPROTO_MTP = 92;
  IPPROTO_BEETPH = 94;
  IPPROTO_ENCAP = 98;
  IPPROTO_PIM = 103;
  IPPROTO_COMP = 108;
  IPPROTO_L2TP = 115;
  IPPROTO_SCTP = 132;
  IPPROTO_UDPLITE = 136;
  IPPROTO_MPLS = 137;
  IPPROTO_ETHERNET = 143;
  IPPROTO_RAW = 255;
  IPPROTO_MPTCP = 262;
  IPPROTO_MAX = 263;

const
  IPPROTO_HOPOPTS = 0;
  IPPROTO_ROUTING = 43;
  IPPROTO_FRAGMENT = 44;
  IPPROTO_ICMPV6 = 58;
  IPPROTO_NONE = 59;
  IPPROTO_DSTOPTS = 60;
  IPPROTO_MH = 135;

type
  Pin_port_t = ^Tin_port_t;
  Tin_port_t = Tuint16_t;

const
  IPPORT_ECHO = 7;
  IPPORT_DISCARD = 9;
  IPPORT_SYSTAT = 11;
  IPPORT_DAYTIME = 13;
  IPPORT_NETSTAT = 15;
  IPPORT_FTP = 21;
  IPPORT_TELNET = 23;
  IPPORT_SMTP = 25;
  IPPORT_TIMESERVER = 37;
  IPPORT_NAMESERVER = 42;
  IPPORT_WHOIS = 43;
  IPPORT_MTP = 57;
  IPPORT_TFTP = 69;
  IPPORT_RJE = 77;
  IPPORT_FINGER = 79;
  IPPORT_TTYLINK = 87;
  IPPORT_SUPDUP = 95;
  IPPORT_EXECSERVER = 512;
  IPPORT_LOGINSERVER = 513;
  IPPORT_CMDSERVER = 514;
  IPPORT_EFSSERVER = 520;
  IPPORT_BIFFUDP = 512;
  IPPORT_WHOSERVER = 513;
  IPPORT_ROUTESERVER = 520;
  IPPORT_RESERVED = 1024;
  IPPORT_USERRESERVED = 5000;

function IN_CLASSA(a: DWord): boolean;

const
  IN_CLASSA_NET = $ff000000;
  IN_CLASSA_NSHIFT = 24;
  IN_CLASSA_HOST = $ffffffff and (not (IN_CLASSA_NET));
  IN_CLASSA_MAX = 128;

function IN_CLASSB(a: DWord): boolean;

const
  IN_CLASSB_NET = $ffff0000;
  IN_CLASSB_NSHIFT = 16;
  IN_CLASSB_HOST = $ffffffff and (not (IN_CLASSB_NET));
  IN_CLASSB_MAX = 65536;

function IN_CLASSC(a: DWord): boolean;

const
  IN_CLASSC_NET = $ffffff00;
  IN_CLASSC_NSHIFT = 8;
  IN_CLASSC_HOST = $ffffffff and (not (IN_CLASSC_NET));

function IN_CLASSD(a: DWord): boolean;
function IN_MULTICAST(a: DWord): boolean;
function IN_EXPERIMENTAL(a: DWord): boolean;
function IN_BADCLASS(a: DWord): boolean;


const
  INADDR_ANY = Tin_addr_t($00000000);
  INADDR_BROADCAST = Tin_addr_t($ffffffff);
  INADDR_NONE = Tin_addr_t($ffffffff);
  INADDR_DUMMY = Tin_addr_t($c0000008);

const
  IN_LOOPBACKNET = 127;

const
  INADDR_LOOPBACK = Tin_addr_t($7f000001);
  INADDR_UNSPEC_GROUP = Tin_addr_t($e0000000);
  INADDR_ALLHOSTS_GROUP = Tin_addr_t($e0000001);
  INADDR_ALLRTRS_GROUP = Tin_addr_t($e0000002);
  INADDR_ALLSNOOPERS_GROUP = Tin_addr_t($e000006a);
  INADDR_MAX_LOCAL_GROUP = Tin_addr_t($e00000ff);

type
  Tin6_addr = record
    __in6_u: record
      case longint of
        0: (__u6_addr8: array[0..15] of Tuint8_t);
        1: (__u6_addr16: array[0..7] of Tuint16_t);
        2: (__u6_addr32: array[0..3] of Tuint32_t);
      end;
  end;
  Pin6_addr = ^Tin6_addr;

var
  in6addr_any: Tin6_addr; cvar;external libc;
  in6addr_loopback: Tin6_addr; cvar;external libc;

const
  IN6ADDR_ANY_INIT: Tin6_addr = (__in6_u: (__u6_addr8: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)));
  IN6ADDR_LOOPBACK_INIT: Tin6_addr = (__in6_u: (__u6_addr8: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)));

const
  INET_ADDRSTRLEN = 16;
  INET6_ADDRSTRLEN = 46;

type
  Tsockaddr_in = packed record
    sin_family: word;
    sin_port: Tin_port_t;
    sin_addr: Tin_addr;
    sin_zero: array[0..7] of byte;
  end;
  Psockaddr_in = ^Tsockaddr_in;

  Tsockaddr_in6 = packed record
    sin6_family: word;
    sin6_port: Tin_port_t;
    sin6_flowinfo: Tuint32_t;
    sin6_addr: Tin6_addr;
    sin6_scope_id: Tuint32_t;
  end;
  Psockaddr_in6 = ^Tsockaddr_in6;

type
  Tip_mreq = record
    imr_multiaddr: Tin_addr;
    imr_interface: Tin_addr;
  end;
  Pip_mreq = ^Tip_mreq;

  Tip_mreqn = record
    imr_multiaddr: Tin_addr;
    imr_address: Tin_addr;
    imr_ifindex: longint;
  end;
  Pip_mreqn = ^Tip_mreqn;

  Tip_mreq_source = record
    imr_multiaddr: Tin_addr;
    imr_interface: Tin_addr;
    imr_sourceaddr: Tin_addr;
  end;
  Pip_mreq_source = ^Tip_mreq_source;

type
  Tipv6_mreq = record
    ipv6mr_multiaddr: Tin6_addr;
    ipv6mr_interface: dword;
  end;
  Pipv6_mreq = ^Tipv6_mreq;

type
  Tgroup_req = record
    gr_interface: Tuint32_t;
    gr_group: Tsockaddr_storage;
  end;
  Pgroup_req = ^Tgroup_req;

  Tgroup_source_req = record
    gsr_interface: Tuint32_t;
    gsr_group: Tsockaddr_storage;
    gsr_source: Tsockaddr_storage;
  end;
  Pgroup_source_req = ^Tgroup_source_req;

  Tip_msfilter = record
    imsf_multiaddr: Tin_addr;
    imsf_interface: Tin_addr;
    imsf_fmode: Tuint32_t;
    imsf_numsrc: Tuint32_t;
    imsf_slist: array[0..0] of Tin_addr;
  end;
  Pip_msfilter = ^Tip_msfilter;

function IP_MSFILTER_SIZE(numsrc: integer): integer;

type
  Tgroup_filter = record
    gf_interface: Tuint32_t;
    gf_group: Tsockaddr_storage;
    gf_fmode: Tuint32_t;
    gf_numsrc: Tuint32_t;
    gf_slist: array[0..0] of Tsockaddr_storage;
  end;
  Pgroup_filter = ^Tgroup_filter;

function GROUP_FILTER_SIZE(numsrc: integer): integer;

function ntohl(__netlong: Tuint32_t): Tuint32_t; cdecl; external libc;
function ntohs(__netshort: Tuint16_t): Tuint16_t; cdecl; external libc;
function htonl(__hostlong: Tuint32_t): Tuint32_t; cdecl; external libc;
function htons(__hostshort: Tuint16_t): Tuint16_t; cdecl; external libc;

function IN6_IS_ADDR_UNSPECIFIED(a: Pointer): boolean; inline;
function IN6_IS_ADDR_LOOPBACK(a: Pointer): boolean; inline;
function IN6_IS_ADDR_LINKLOCAL(a: Pointer): boolean; inline;
function IN6_IS_ADDR_SITELOCAL(a: Pointer): boolean; inline;
function IN6_IS_ADDR_V4MAPPED(a: Pointer): boolean; inline;
function IN6_IS_ADDR_V4COMPAT(a: Pointer): boolean; inline;
function IN6_ARE_ADDR_EQUAL(a, b: Pointer): boolean; inline;

function IN6_IS_ADDR_MULTICAST(a: Pointer): boolean; inline;

function bindresvport(__sockfd: longint; __sock_in: Psockaddr_in): longint; cdecl; external libc;
function bindresvport6(__sockfd: longint; __sock_in: Psockaddr_in6): longint; cdecl; external libc;

function IN6_IS_ADDR_MC_NODELOCAL(a: Pointer): boolean; inline;
function IN6_IS_ADDR_MC_LINKLOCAL(a: Pointer): boolean; inline;
function IN6_IS_ADDR_MC_SITELOCAL(a: Pointer): boolean; inline;
function IN6_IS_ADDR_MC_ORGLOCAL(a: Pointer): boolean; inline;
function IN6_IS_ADDR_MC_GLOBAL(a: Pointer): boolean; inline;

type
  Pcmsghdr = type Pointer;
  PPcmsghdr = ^Pcmsghdr;

type
  Tin6_pktinfo = record
    ipi6_addr: Tin6_addr;
    ipi6_ifindex: dword;
  end;
  Pin6_pktinfo = ^Tin6_pktinfo;

  Tip6_mtuinfo = record
    ip6m_addr: Tsockaddr_in6;
    ip6m_mtu: Tuint32_t;
  end;
  Pip6_mtuinfo = ^Tip6_mtuinfo;

function inet6_option_space(__nbytes: longint): longint; cdecl; external libc; deprecated;
function inet6_option_init(__bp: pointer; __cmsgp: PPcmsghdr; __type: longint): longint; cdecl; external libc; deprecated;
function inet6_option_append(__cmsg: Pcmsghdr; __typep: Puint8_t; __multx: longint; __plusy: longint): longint; cdecl; external libc; deprecated;
function inet6_option_alloc(__cmsg: Pcmsghdr; __datalen: longint; __multx: longint; __plusy: longint): Puint8_t; cdecl; external libc; deprecated;
function inet6_option_next(__cmsg: Pcmsghdr; __tptrp: PPuint8_t): longint; cdecl; external libc; deprecated;
function inet6_option_find(__cmsg: Pcmsghdr; __tptrp: PPuint8_t; __type: longint): longint; cdecl; external libc; deprecated;

function inet6_opt_init(__extbuf: pointer; __extlen: Tsocklen_t): longint; cdecl; external libc;
function inet6_opt_append(__extbuf: pointer; __extlen: Tsocklen_t; __offset: longint; __type: Tuint8_t; __len: Tsocklen_t; __align: Tuint8_t; __databufp: Ppointer): longint; cdecl; external libc;
function inet6_opt_finish(__extbuf: pointer; __extlen: Tsocklen_t; __offset: longint): longint; cdecl; external libc;
function inet6_opt_set_val(__databuf: pointer; __offset: longint; __val: pointer; __vallen: Tsocklen_t): longint; cdecl; external libc;
function inet6_opt_next(__extbuf: pointer; __extlen: Tsocklen_t; __offset: longint; __typep: Puint8_t; __lenp: Psocklen_t; __databufp: Ppointer): longint; cdecl; external libc;
function inet6_opt_find(__extbuf: pointer; __extlen: Tsocklen_t; __offset: longint; __type: Tuint8_t; __lenp: Psocklen_t; __databufp: Ppointer): longint; cdecl; external libc;
function inet6_opt_get_val(__databuf: pointer; __offset: longint; __val: pointer; __vallen: Tsocklen_t): longint; cdecl; external libc;
function inet6_rth_space(__type: longint; __segments: longint): Tsocklen_t; cdecl; external libc;
function inet6_rth_init(__bp: pointer; __bp_len: Tsocklen_t; __type: longint; __segments: longint): pointer; cdecl; external libc;
function inet6_rth_add(__bp: pointer; __addr: Pin6_addr): longint; cdecl; external libc;
function inet6_rth_reverse(__in: pointer; __out: pointer): longint; cdecl; external libc;
function inet6_rth_segments(__bp: pointer): longint; cdecl; external libc;
function inet6_rth_getaddr(__bp: pointer; __index: longint): Pin6_addr; cdecl; external libc;
function getipv4sourcefilter(__s: longint; __interface_addr: Tin_addr; __group: Tin_addr; __fmode: Puint32_t; __numsrc: Puint32_t; __slist: Pin_addr): longint; cdecl; external libc;
function setipv4sourcefilter(__s: longint; __interface_addr: Tin_addr; __group: Tin_addr; __fmode: Tuint32_t; __numsrc: Tuint32_t; __slist: Pin_addr): longint; cdecl; external libc;
function getsourcefilter(__s: longint; __interface_addr: Tuint32_t; __group: Psockaddr; __grouplen: Tsocklen_t; __fmode: Puint32_t; __numsrc: Puint32_t; __slist: Psockaddr_storage): longint; cdecl; external libc;
function setsourcefilter(__s: longint; __interface_addr: Tuint32_t; __group: Psockaddr; __grouplen: Tsocklen_t; __fmode: Tuint32_t; __numsrc: Tuint32_t; __slist: Psockaddr_storage): longint; cdecl; external libc;

// === Konventiert am: 10-8-25 17:28:12 ===

implementation

function IP_MSFILTER_SIZE(numsrc: integer): integer;
begin
  Result := SizeOf(Tip_msfilter) - SizeOf(Tin_addr) + numsrc * SizeOf(Tin_addr);
end;

function GROUP_FILTER_SIZE(numsrc: integer): integer;
begin
  Result := SizeOf(Tgroup_filter) - SizeOf(Tsockaddr_storage) + numsrc * SizeOf(Tsockaddr_storage);
end;


function IN6_IS_ADDR_UNSPECIFIED(a: Pointer): boolean; inline;
var
  p: PUInt32;
begin
  p := PUInt32(a);
  Result := (p[0] = 0) and (p[1] = 0) and (p[2] = 0) and (p[3] = 0);
end;

function IN6_IS_ADDR_LOOPBACK(a: Pointer): boolean; inline;
var
  p: PUInt32;
begin
  p := PUInt32(a);
  Result := (p[0] = 0) and (p[1] = 0) and (p[2] = 0) and (p[3] = htonl(1));
end;


function IN6_IS_ADDR_LINKLOCAL(a: Pointer): boolean; inline;
var
  p: PUInt32;
begin
  p := PUInt32(a);
  Result := (p[0] and htonl($FFC00000)) = htonl($FE800000);
end;

function IN6_IS_ADDR_SITELOCAL(a: Pointer): boolean; inline;
var
  p: PUInt32;
begin
  p := PUInt32(a);
  Result := (p[0] and htonl($FFC00000)) = htonl($FEC00000);
end;

function IN6_IS_ADDR_V4MAPPED(a: Pointer): boolean; inline;
var
  p: PUInt32;
begin
  p := PUInt32(a);
  Result := (p[0] = 0) and (p[1] = 0) and (p[2] = htonl($0000FFFF));
end;

function IN6_IS_ADDR_V4COMPAT(a: Pointer): boolean; inline;
var
  p: PUInt32;
begin
  p := PUInt32(a);
  Result := (p[0] = 0) and (p[1] = 0) and (p[2] = 0) and (ntohl(p[3]) > 1);
end;

function IN6_ARE_ADDR_EQUAL(a, b: Pointer): boolean; inline;
var
  pa, pb: PUInt32;
begin
  pa := PUInt32(a);
  pb := PUInt32(b);
  Result := (pa[0] = pb[0]) and (pa[1] = pb[1]) and (pa[2] = pb[2]) and (pa[3] = pb[3]);
end;

function IN6_IS_ADDR_MULTICAST(a: Pointer): boolean; inline;
begin
  Result := PUInt8(a)[0] = $FF;
end;

function IN6_IS_ADDR_MC_NODELOCAL(a: Pointer): boolean; inline;
begin
  Result := IN6_IS_ADDR_MULTICAST(a) and ((PUInt8(a)[1] and $0F) = $01);
end;

function IN6_IS_ADDR_MC_LINKLOCAL(a: Pointer): boolean; inline;
begin
  Result := IN6_IS_ADDR_MULTICAST(a) and ((PUInt8(a)[1] and $0F) = $02);
end;

function IN6_IS_ADDR_MC_SITELOCAL(a: Pointer): boolean; inline;
begin
  Result := IN6_IS_ADDR_MULTICAST(a) and ((PUInt8(a)[1] and $0F) = $05);
end;

function IN6_IS_ADDR_MC_ORGLOCAL(a: Pointer): boolean; inline;
begin
  Result := IN6_IS_ADDR_MULTICAST(a) and ((PUInt8(a)[1] and $0F) = $08);
end;

function IN6_IS_ADDR_MC_GLOBAL(a: Pointer): boolean; inline;
begin
  Result := IN6_IS_ADDR_MULTICAST(a) and ((PUInt8(a)[1] and $0F) = $0E);
end;



function IN_CLASSA(a: DWord): boolean;
begin
  IN_CLASSA := ((Tin_addr_t(a)) and $80000000) = 0;
end;

function IN_CLASSB(a: DWord): boolean;
begin
  IN_CLASSB := ((Tin_addr_t(a)) and $c0000000) = $80000000;
end;

function IN_CLASSC(a: DWord): boolean;
begin
  IN_CLASSC := ((Tin_addr_t(a)) and $e0000000) = $c0000000;
end;

function IN_CLASSD(a: DWord): boolean;
begin
  IN_CLASSD := ((Tin_addr_t(a)) and $f0000000) = $e0000000;
end;

function IN_MULTICAST(a: DWord): boolean;
begin
  IN_MULTICAST := IN_CLASSD(a);
end;

function IN_EXPERIMENTAL(a: DWord): boolean;
begin
  IN_EXPERIMENTAL := ((Tin_addr_t(a)) and $e0000000) = $e0000000;
end;

function IN_BADCLASS(a: DWord): boolean;
begin
  IN_BADCLASS := ((Tin_addr_t(a)) and $f0000000) = $f0000000;
end;


end.
