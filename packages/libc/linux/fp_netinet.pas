unit fp_netinet;

interface

uses
  clib, fp_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pether_addr = type Pointer; // Wegen Kreuzverbindung

  // /usr/include/netinet/in.h

type
  Tin_addr_t = Tuint32_t;

  Tin_addr = record
    s_addr: Tin_addr_t;
  end;
  Pin_addr = ^Tin_addr;
  PPin_addr = ^Pin_addr;

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


// /usr/include/netinet/in_systm.h

type
  Pn_short = ^Tn_short;
  Tn_short = Tuint16_t;

  Pn_long = ^Tn_long;
  Tn_long = Tuint32_t;

  Pn_time = ^Tn_time;
  Tn_time = Tuint32_t;

  // /usr/include/netinet/ether.h

function ether_ntoa(__addr: Pether_addr): pchar; cdecl; external libc;
function ether_ntoa_r(__addr: Pether_addr; __buf: pchar): pchar; cdecl; external libc;
function ether_aton(__asc: pchar): Pether_addr; cdecl; external libc;
function ether_aton_r(__asc: pchar; __addr: Pether_addr): Pether_addr; cdecl; external libc;
function ether_ntohost(__hostname: pchar; __addr: Pether_addr): longint; cdecl; external libc;
function ether_hostton(__hostname: pchar; __addr: Pether_addr): longint; cdecl; external libc;
function ether_line(__line: pchar; __addr: Pether_addr; __hostname: pchar): longint; cdecl; external libc;


// /usr/include/netinet/if_ether.h

type
  Tether_arp = record
    ea_hdr: Tarphdr;
    arp_sha: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    arp_spa: array[0..3] of Tuint8_t;
    arp_tha: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    arp_tpa: array[0..3] of Tuint8_t;
  end;
  Pether_arp = ^Tether_arp;

procedure ETHER_MAP_IP_MULTICAST(ipaddr: Pin_addr; enaddr: Puint8_t);  // ??????????


// /usr/include/netinet/if_fddi.h

type
  Tfddi_header = record
    fddi_fc: Tuint8_t;
    fddi_dhost: array[0..(FDDI_K_ALEN) - 1] of Tuint8_t;
    fddi_shost: array[0..(FDDI_K_ALEN) - 1] of Tuint8_t;
  end;
  Pfddi_header = ^Tfddi_header;


  // /usr/include/netinet/if_tr.h

const
  TR_ALEN = 6;
  AC = $10;
  LLC_FRAME = $40;
  EXTENDED_SAP = $AA;
  UI_CMD = $03;

type
  Ttrh_hdr = record
    ac: Tuint8_t;
    fc: Tuint8_t;
    daddr: array[0..(TR_ALEN) - 1] of Tuint8_t;
    saddr: array[0..(TR_ALEN) - 1] of Tuint8_t;
    rcf: Tuint16_t;
    rseg: array[0..7] of Tuint16_t;
  end;
  Ptrh_hdr = ^Ttrh_hdr;

  Ttrllc = record
    dsap: Tuint8_t;
    ssap: Tuint8_t;
    llc: Tuint8_t;
    protid: array[0..2] of Tuint8_t;
    ethertype: Tuint16_t;
  end;
  Ptrllc = ^Ttrllc;

const
  TR_HLEN = SizeOf(Ttrh_hdr) + SizeOf(Ttrllc);

type
  Ttr_statistics = record
    rx_packets: dword;
    tx_packets: dword;
    rx_bytes: dword;
    tx_bytes: dword;
    rx_errors: dword;
    tx_errors: dword;
    rx_dropped: dword;
    tx_dropped: dword;
    multicast: dword;
    transmit_collision: dword;
    line_errors: dword;
    internal_errors: dword;
    burst_errors: dword;
    A_C_errors: dword;
    abort_delimiters: dword;
    lost_frames: dword;
    recv_congest_count: dword;
    frame_copied_errors: dword;
    frequency_errors: dword;
    token_errors: dword;
    dummy1: dword;
  end;
  Ptr_statistics = ^Ttr_statistics;

const
  TR_RII = $80;
  TR_RCF_DIR_BIT = $80;
  TR_RCF_LEN_MASK = $1f00;
  TR_RCF_BROADCAST = $8000;
  TR_RCF_LIMITED_BROADCAST = $C000;
  TR_RCF_FRAME2K = $20;
  TR_RCF_BROADCAST_MASK = $C000;
  TR_MAXRIFLEN = 18;

type
  Ttrn_hdr = record
    trn_ac: Tuint8_t;
    trn_fc: Tuint8_t;
    trn_dhost: array[0..(TR_ALEN) - 1] of Tuint8_t;
    trn_shost: array[0..(TR_ALEN) - 1] of Tuint8_t;
    trn_rcf: Tuint16_t;
    trn_rseg: array[0..7] of Tuint16_t;
  end;
  Ptrn_hdr = ^Ttrn_hdr;


  // /usr/include/netinet/tcp.h

const
  TCP_NODELAY = 1;
  TCP_MAXSEG = 2;
  TCP_CORK = 3;
  TCP_KEEPIDLE = 4;
  TCP_KEEPINTVL = 5;
  TCP_KEEPCNT = 6;
  TCP_SYNCNT = 7;
  TCP_LINGER2 = 8;
  TCP_DEFER_ACCEPT = 9;
  TCP_WINDOW_CLAMP = 10;
  TCP_INFO = 11;
  TCP_QUICKACK = 12;
  TCP_CONGESTION = 13;
  TCP_MD5SIG = 14;
  TCP_COOKIE_TRANSACTIONS = 15;
  TCP_THIN_LINEAR_TIMEOUTS = 16;
  TCP_THIN_DUPACK = 17;
  TCP_USER_TIMEOUT = 18;
  TCP_REPAIR = 19;
  TCP_REPAIR_QUEUE = 20;
  TCP_QUEUE_SEQ = 21;
  TCP_REPAIR_OPTIONS = 22;
  TCP_FASTOPEN = 23;
  TCP_TIMESTAMP = 24;
  TCP_NOTSENT_LOWAT = 25;
  TCP_CC_INFO = 26;
  TCP_SAVE_SYN = 27;
  TCP_SAVED_SYN = 28;
  TCP_REPAIR_WINDOW = 29;
  TCP_FASTOPEN_CONNECT = 30;
  TCP_ULP = 31;
  TCP_MD5SIG_EXT = 32;
  TCP_FASTOPEN_KEY = 33;
  TCP_FASTOPEN_NO_COOKIE = 34;
  TCP_ZEROCOPY_RECEIVE = 35;
  TCP_INQ = 36;
  TCP_CM_INQ = TCP_INQ;
  TCP_TX_DELAY = 37;
  TCP_REPAIR_ON = 1;
  TCP_REPAIR_OFF = 0;
  TCP_REPAIR_OFF_NO_WP = -(1);

type
  Ptcp_seq = ^Ttcp_seq;
  Ttcp_seq = Tuint32_t;

  Ttcphdr = bitpacked record
    case integer of
      0: (
        th_sport: word;
        th_dport: word;
        th_seq: Ttcp_seq;
        th_ack: Ttcp_seq;
        th_x2: 0..15;
        th_off_x2: 0..15;
        th_flags: byte;
        th_win: word;
        th_sum: word;
        th_urp: word
      );
      1: (
        source: word;
        dest: word;
        seq: cardinal;
        ack_seq: cardinal;
        res1: 0..15;
        doff: 0..15;
        fin: 0..1;
        syn: 0..1;
        rst: 0..1;
        psh: 0..1;
        ack: 0..1;
        urg: 0..1;
        res2: 0..3;
        window: word;
        check: word;
        urg_ptr: word
      );
  end;

const
  TH_FIN = $01;
  TH_SYN = $02;
  TH_RST = $04;
  TH_PUSH = $08;
  TH_ACK = $10;
  TH_URG = $20;

const
  TCP_ESTABLISHED = 1;
  TCP_SYN_SENT = 2;
  TCP_SYN_RECV = 3;
  TCP_FIN_WAIT1 = 4;
  TCP_FIN_WAIT2 = 5;
  TCP_TIME_WAIT = 6;
  TCP_CLOSE = 7;
  TCP_CLOSE_WAIT = 8;
  TCP_LAST_ACK = 9;
  TCP_LISTEN = 10;
  TCP_CLOSING = 11;

const
  TCPOPT_EOL = 0;
  TCPOPT_NOP = 1;
  TCPOPT_MAXSEG = 2;
  TCPOLEN_MAXSEG = 4;
  TCPOPT_WINDOW = 3;
  TCPOLEN_WINDOW = 3;
  TCPOPT_SACK_PERMITTED = 4;
  TCPOLEN_SACK_PERMITTED = 2;
  TCPOPT_SACK = 5;
  TCPOPT_TIMESTAMP = 8;
  TCPOLEN_TIMESTAMP = 10;
  TCPOLEN_TSTAMP_APPA = TCPOLEN_TIMESTAMP + 2;
  TCPOPT_TSTAMP_HDR = (TCPOPT_NOP shl 24) or (TCPOPT_NOP shl 16) or (TCPOPT_TIMESTAMP shl 8) or TCPOLEN_TIMESTAMP;

  TCP_MSS = 512;
  TCP_MAXWIN = 65535;
  TCP_MAX_WINSHIFT = 14;
  SOL_TCP = 6;
  TCPI_OPT_TIMESTAMPS = 1;
  TCPI_OPT_SACK = 2;
  TCPI_OPT_WSCALE = 4;
  TCPI_OPT_ECN = 8;
  TCPI_OPT_ECN_SEEN = 16;
  TCPI_OPT_SYN_DATA = 32;

type
  Ttcp_ca_state = longint;

const
  TCP_CA_Open = 0;
  TCP_CA_Disorder = 1;
  TCP_CA_CWR = 2;
  TCP_CA_Recovery = 3;
  TCP_CA_Loss = 4;

type
  Ttcp_info = bitpacked record
    tcpi_state: Tuint8_t;
    tcpi_ca_state: Tuint8_t;
    tcpi_retransmits: Tuint8_t;
    tcpi_probes: Tuint8_t;
    tcpi_backoff: Tuint8_t;
    tcpi_options: Tuint8_t;
    tcpi_snd_wscale: 0..15;
    tcpi_rcv_wscale: 0..15;
    tcpi_rto: Tuint32_t;
    tcpi_ato: Tuint32_t;
    tcpi_snd_mss: Tuint32_t;
    tcpi_rcv_mss: Tuint32_t;
    tcpi_unacked: Tuint32_t;
    tcpi_sacked: Tuint32_t;
    tcpi_lost: Tuint32_t;
    tcpi_retrans: Tuint32_t;
    tcpi_fackets: Tuint32_t;
    tcpi_last_data_sent: Tuint32_t;
    tcpi_last_ack_sent: Tuint32_t;
    tcpi_last_data_recv: Tuint32_t;
    tcpi_last_ack_recv: Tuint32_t;
    tcpi_pmtu: Tuint32_t;
    tcpi_rcv_ssthresh: Tuint32_t;
    tcpi_rtt: Tuint32_t;
    tcpi_rttvar: Tuint32_t;
    tcpi_snd_ssthresh: Tuint32_t;
    tcpi_snd_cwnd: Tuint32_t;
    tcpi_advmss: Tuint32_t;
    tcpi_reordering: Tuint32_t;
    tcpi_rcv_rtt: Tuint32_t;
    tcpi_rcv_space: Tuint32_t;
    tcpi_total_retrans: Tuint32_t;
  end;
  Ptcp_info = ^Ttcp_info;

const
  TCP_MD5SIG_MAXKEYLEN = 80;
  TCP_MD5SIG_FLAG_PREFIX = 1;
  TCP_MD5SIG_FLAG_IFINDEX = 2;

type
  Ttcp_md5sig = record
    tcpm_addr: Tsockaddr_storage;
    tcpm_flags: Tuint8_t;
    tcpm_prefixlen: Tuint8_t;
    tcpm_keylen: Tuint16_t;
    tcpm_ifindex: longint;
    tcpm_key: array[0..(TCP_MD5SIG_MAXKEYLEN) - 1] of Tuint8_t;
  end;
  Ptcp_md5sig = ^Ttcp_md5sig;

  Ttcp_repair_opt = record
    opt_code: Tuint32_t;
    opt_val: Tuint32_t;
  end;
  Ptcp_repair_opt = ^Ttcp_repair_opt;

const
  TCP_NO_QUEUE = 0;
  TCP_RECV_QUEUE = 1;
  TCP_SEND_QUEUE = 2;
  TCP_QUEUES_NR = 3;

const
  TCP_COOKIE_MIN = 8;
  TCP_COOKIE_MAX = 16;
  TCP_COOKIE_PAIR_SIZE = 2 * TCP_COOKIE_MAX;
  TCP_COOKIE_IN_ALWAYS = 1 shl 0;
  TCP_COOKIE_OUT_NEVER = 1 shl 1;
  TCP_S_DATA_IN = 1 shl 2;
  TCP_S_DATA_OUT = 1 shl 3;
  TCP_MSS_DEFAULT = 536;
  TCP_MSS_DESIRED = 1220;

type
  Ttcp_cookie_transactions = record
    tcpct_flags: Tuint16_t;
    __tcpct_pad1: Tuint8_t;
    tcpct_cookie_desired: Tuint8_t;
    tcpct_s_data_desired: Tuint16_t;
    tcpct_used: Tuint16_t;
    tcpct_value: array[0..(TCP_MSS_DEFAULT) - 1] of Tuint8_t;
  end;
  Ptcp_cookie_transactions = ^Ttcp_cookie_transactions;

  Ttcp_repair_window = record
    snd_wl1: Tuint32_t;
    snd_wnd: Tuint32_t;
    max_window: Tuint32_t;
    rcv_wnd: Tuint32_t;
    rcv_wup: Tuint32_t;
  end;
  Ptcp_repair_window = ^Ttcp_repair_window;

  Ttcp_zerocopy_receive = record
    address: Tuint64_t;
    length: Tuint32_t;
    recv_skip_hint: Tuint32_t;
  end;
  Ptcp_zerocopy_receive = ^Ttcp_zerocopy_receive;


  // /usr/include/netinet/udp.h

type
  Tudphdr = packed record
    case integer of
      0: (
        uh_sport: word;
        uh_dport: word;
        uh_ulen: word;
        uh_sum: word
      );
      1: (
        source: word;
        dest: word;
        len: word;
        check: word
      );
  end;

const
  UDP_CORK = 1;
  UDP_ENCAP = 100;
  UDP_NO_CHECK6_TX = 101;
  UDP_NO_CHECK6_RX = 102;
  UDP_SEGMENT = 103;
  UDP_GRO = 104;
  UDP_ENCAP_ESPINUDP_NON_IKE = 1;
  UDP_ENCAP_ESPINUDP = 2;
  UDP_ENCAP_L2TPINUDP = 3;
  UDP_ENCAP_GTP0 = 4;
  UDP_ENCAP_GTP1U = 5;
  SOL_UDP = 17;


  // /usr/include/netinet/igmp.h

type
  Tigmp = record
    igmp_type: Tuint8_t;
    igmp_code: Tuint8_t;
    igmp_cksum: Tuint16_t;
    igmp_group: Tin_addr;
  end;
  Pigmp = ^Tigmp;

const
  IGMP_MINLEN = 8;
  IGMP_MEMBERSHIP_QUERY = $11;
  IGMP_V1_MEMBERSHIP_REPORT = $12;
  IGMP_V2_MEMBERSHIP_REPORT = $16;
  IGMP_V2_LEAVE_GROUP = $17;
  IGMP_DVMRP = $13;
  IGMP_PIM = $14;
  IGMP_TRACE = $15;
  IGMP_MTRACE_RESP = $1e;
  IGMP_MTRACE = $1f;
  IGMP_MRDISC_ADV = $30;
  IGMP_MAX_HOST_REPORT_DELAY = 10;
  IGMP_TIMER_SCALE = 10;
  IGMP_DELAYING_MEMBER = 1;
  IGMP_IDLE_MEMBER = 2;
  IGMP_LAZY_MEMBER = 3;
  IGMP_SLEEPING_MEMBER = 4;
  IGMP_AWAKENING_MEMBER = 5;
  IGMP_v1_ROUTER = 1;
  IGMP_v2_ROUTER = 2;

  IGMP_HOST_MEMBERSHIP_QUERY = IGMP_MEMBERSHIP_QUERY;
  IGMP_HOST_MEMBERSHIP_REPORT = IGMP_V1_MEMBERSHIP_REPORT;
  IGMP_HOST_NEW_MEMBERSHIP_REPORT = IGMP_V2_MEMBERSHIP_REPORT;
  IGMP_HOST_LEAVE_MESSAGE = IGMP_V2_LEAVE_GROUP;


  // /usr/include/netinet/ip6.h

type
  Tip6_hdr = record
    ip6_ctlun: record
      case longint of
        0: (ip6_un1: record
            ip6_un1_flow: Tuint32_t;
            ip6_un1_plen: Tuint16_t;
            ip6_un1_nxt: Tuint8_t;
            ip6_un1_hlim: Tuint8_t;
            end);
        1: (ip6_un2_vfc: Tuint8_t);
      end;
    ip6_src: Tin6_addr;
    ip6_dst: Tin6_addr;
  end;
  Pip6_hdr = ^Tip6_hdr;

type
  Tip6_ext = record
    ip6e_nxt: Tuint8_t;
    ip6e_len: Tuint8_t;
  end;
  Pip6_ext = ^Tip6_ext;

  Tip6_hbh = record
    ip6h_nxt: Tuint8_t;
    ip6h_len: Tuint8_t;
  end;
  Pip6_hbh = ^Tip6_hbh;

  Tip6_dest = record
    ip6d_nxt: Tuint8_t;
    ip6d_len: Tuint8_t;
  end;
  Pip6_dest = ^Tip6_dest;

  Tip6_rthdr = record
    ip6r_nxt: Tuint8_t;
    ip6r_len: Tuint8_t;
    ip6r_type: Tuint8_t;
    ip6r_segleft: Tuint8_t;
  end;
  Pip6_rthdr = ^Tip6_rthdr;

  Tip6_rthdr0 = record
    ip6r0_nxt: Tuint8_t;
    ip6r0_len: Tuint8_t;
    ip6r0_type: Tuint8_t;
    ip6r0_segleft: Tuint8_t;
    ip6r0_reserved: Tuint8_t;
    ip6r0_slmap: array[0..2] of Tuint8_t;
    ip6r0_addr: Pin6_addr;
  end;
  Pip6_rthdr0 = ^Tip6_rthdr0;

  Tip6_frag = record
    ip6f_nxt: Tuint8_t;
    ip6f_reserved: Tuint8_t;
    ip6f_offlg: Tuint16_t;
    ip6f_ident: Tuint32_t;
  end;
  Pip6_frag = ^Tip6_frag;

const
  IP6F_OFF_MASK = $f8ff;
  IP6F_RESERVED_MASK = $0600;
  IP6F_MORE_FRAG = $0100;

type
  Tip6_opt = record
    ip6o_type: Tuint8_t;
    ip6o_len: Tuint8_t;
  end;
  Pip6_opt = ^Tip6_opt;

function IP6OPT_TYPE(obj: DWord): DWord;

const
  IP6OPT_TYPE_SKIP = $00;
  IP6OPT_TYPE_DISCARD = $40;
  IP6OPT_TYPE_FORCEICMP = $80;
  IP6OPT_TYPE_ICMP = $c0;
  IP6OPT_TYPE_MUTABLE = $20;
  IP6OPT_PAD1 = 0;
  IP6OPT_PADN = 1;
  IP6OPT_JUMBO = $c2;
  IP6OPT_NSAP_ADDR = $c3;
  IP6OPT_TUNNEL_LIMIT = $04;
  IP6OPT_ROUTER_ALERT = $05;

type
  Tip6_opt_jumbo = record
    ip6oj_type: Tuint8_t;
    ip6oj_len: Tuint8_t;
    ip6oj_jumbo_len: array[0..3] of Tuint8_t;
  end;
  Pip6_opt_jumbo = ^Tip6_opt_jumbo;

const
  IP6OPT_JUMBO_LEN = 6;

type
  Tip6_opt_nsap = record
    ip6on_type: Tuint8_t;
    ip6on_len: Tuint8_t;
    ip6on_src_nsap_len: Tuint8_t;
    ip6on_dst_nsap_len: Tuint8_t;
  end;
  Pip6_opt_nsap = ^Tip6_opt_nsap;

  Tip6_opt_tunnel = record
    ip6ot_type: Tuint8_t;
    ip6ot_len: Tuint8_t;
    ip6ot_encap_limit: Tuint8_t;
  end;
  Pip6_opt_tunnel = ^Tip6_opt_tunnel;

  Tip6_opt_router = record
    ip6or_type: Tuint8_t;
    ip6or_len: Tuint8_t;
    ip6or_value: array[0..1] of Tuint8_t;
  end;
  Pip6_opt_router = ^Tip6_opt_router;

const
  IP6_ALERT_MLD = $0000;
  IP6_ALERT_RSVP = $0100;
  IP6_ALERT_AN = $0200;


  // /usr/include/netinet/icmp6.h

const
  ICMP6_FILTER = 1;
  ICMP6_FILTER_BLOCK = 1;
  ICMP6_FILTER_PASS = 2;
  ICMP6_FILTER_BLOCKOTHERS = 3;
  ICMP6_FILTER_PASSONLY = 4;

type
  Ticmp6_filter = record
    icmp6_filt: array[0..7] of Tuint32_t;
  end;
  Picmp6_filter = ^Ticmp6_filter;

  Ticmp6_hdr = record
    icmp6_type: Tuint8_t;
    icmp6_code: Tuint8_t;
    icmp6_cksum: Tuint16_t;
    icmp6_dataun: record
      case longint of
        0: (icmp6_un_data32: array[0..0] of Tuint32_t);
        1: (icmp6_un_data16: array[0..1] of Tuint16_t);
        2: (icmp6_un_data8: array[0..3] of Tuint8_t);
      end;
  end;
  Picmp6_hdr = ^Ticmp6_hdr;

const
  ICMP6_DST_UNREACH = 1;
  ICMP6_PACKET_TOO_BIG = 2;
  ICMP6_TIME_EXCEEDED = 3;
  ICMP6_PARAM_PROB = 4;
  ICMP6_INFOMSG_MASK = $80;
  ICMP6_ECHO_REQUEST = 128;
  ICMP6_ECHO_REPLY = 129;
  MLD_LISTENER_QUERY = 130;
  MLD_LISTENER_REPORT = 131;
  MLD_LISTENER_REDUCTION = 132;
  ICMPV6_EXT_ECHO_REQUEST = 160;
  ICMPV6_EXT_ECHO_REPLY = 161;
  ICMP6_DST_UNREACH_NOROUTE = 0;
  ICMP6_DST_UNREACH_ADMIN = 1;
  ICMP6_DST_UNREACH_BEYONDSCOPE = 2;
  ICMP6_DST_UNREACH_ADDR = 3;
  ICMP6_DST_UNREACH_NOPORT = 4;
  ICMP6_TIME_EXCEED_TRANSIT = 0;
  ICMP6_TIME_EXCEED_REASSEMBLY = 1;
  ICMP6_PARAMPROB_HEADER = 0;
  ICMP6_PARAMPROB_NEXTHEADER = 1;
  ICMP6_PARAMPROB_OPTION = 2;

const
  ND_ROUTER_SOLICIT = 133;
  ND_ROUTER_ADVERT = 134;
  ND_NEIGHBOR_SOLICIT = 135;
  ND_NEIGHBOR_ADVERT = 136;
  ND_REDIRECT = 137;

type
  Tnd_router_solicit = record
    nd_rs_hdr: Ticmp6_hdr;
  end;
  Pnd_router_solicit = ^Tnd_router_solicit;

type
  Tnd_router_advert = record
    nd_ra_hdr: Ticmp6_hdr;
    nd_ra_reachable: Tuint32_t;
    nd_ra_retransmit: Tuint32_t;
  end;
  Pnd_router_advert = ^Tnd_router_advert;

const
  ND_RA_FLAG_MANAGED = $80;
  ND_RA_FLAG_OTHER = $40;
  ND_RA_FLAG_HOME_AGENT = $20;

type
  Tnd_neighbor_solicit = record
    nd_ns_hdr: Ticmp6_hdr;
    nd_ns_target: Tin6_addr;
  end;
  Pnd_neighbor_solicit = ^Tnd_neighbor_solicit;

type
  Tnd_neighbor_advert = record
    nd_na_hdr: Ticmp6_hdr;
    nd_na_target: Tin6_addr;
  end;
  Pnd_neighbor_advert = ^Tnd_neighbor_advert;

const
  ND_NA_FLAG_ROUTER = $00000080;
  ND_NA_FLAG_SOLICITED = $00000040;
  ND_NA_FLAG_OVERRIDE = $00000020;

type
  Tnd_redirect = record
    nd_rd_hdr: Ticmp6_hdr;
    nd_rd_target: Tin6_addr;
    nd_rd_dst: Tin6_addr;
  end;
  Pnd_redirect = ^Tnd_redirect;

type
  Tnd_opt_hdr = record
    nd_opt_type: Tuint8_t;
    nd_opt_len: Tuint8_t;
  end;
  Pnd_opt_hdr = ^Tnd_opt_hdr;

const
  ND_OPT_SOURCE_LINKADDR = 1;
  ND_OPT_TARGET_LINKADDR = 2;
  ND_OPT_PREFIX_INFORMATION = 3;
  ND_OPT_REDIRECTED_HEADER = 4;
  ND_OPT_MTU = 5;
  ND_OPT_RTR_ADV_INTERVAL = 7;
  ND_OPT_HOME_AGENT_INFO = 8;

type
  Tnd_opt_prefix_info = record
    nd_opt_pi_type: Tuint8_t;
    nd_opt_pi_len: Tuint8_t;
    nd_opt_pi_prefix_len: Tuint8_t;
    nd_opt_pi_flags_reserved: Tuint8_t;
    nd_opt_pi_valid_time: Tuint32_t;
    nd_opt_pi_preferred_time: Tuint32_t;
    nd_opt_pi_reserved2: Tuint32_t;
    nd_opt_pi_prefix: Tin6_addr;
  end;
  Pnd_opt_prefix_info = ^Tnd_opt_prefix_info;

const
  ND_OPT_PI_FLAG_ONLINK = $80;
  ND_OPT_PI_FLAG_AUTO = $40;
  ND_OPT_PI_FLAG_RADDR = $20;

type
  Tnd_opt_rd_hdr = record
    nd_opt_rh_type: Tuint8_t;
    nd_opt_rh_len: Tuint8_t;
    nd_opt_rh_reserved1: Tuint16_t;
    nd_opt_rh_reserved2: Tuint32_t;
  end;
  Pnd_opt_rd_hdr = ^Tnd_opt_rd_hdr;

  Tnd_opt_mtu = record
    nd_opt_mtu_type: Tuint8_t;
    nd_opt_mtu_len: Tuint8_t;
    nd_opt_mtu_reserved: Tuint16_t;
    nd_opt_mtu_mtu: Tuint32_t;
  end;
  Pnd_opt_mtu = ^Tnd_opt_mtu;

  Tmld_hdr = record
    mld_icmp6_hdr: Ticmp6_hdr;
    mld_addr: Tin6_addr;
  end;
  Pmld_hdr = ^Tmld_hdr;

const
  ICMP6_ROUTER_RENUMBERING = 138;

type
  Ticmp6_router_renum = record
    rr_hdr: Ticmp6_hdr;
    rr_segnum: Tuint8_t;
    rr_flags: Tuint8_t;
    rr_maxdelay: Tuint16_t;
    rr_reserved: Tuint32_t;
  end;
  Picmp6_router_renum = ^Ticmp6_router_renum;

const
  ICMP6_RR_FLAGS_TEST = $80;
  ICMP6_RR_FLAGS_REQRESULT = $40;
  ICMP6_RR_FLAGS_FORCEAPPLY = $20;
  ICMP6_RR_FLAGS_SPECSITE = $10;
  ICMP6_RR_FLAGS_PREVDONE = $08;

type
  Trr_pco_match = record
    rpm_code: Tuint8_t;
    rpm_len: Tuint8_t;
    rpm_ordinal: Tuint8_t;
    rpm_matchlen: Tuint8_t;
    rpm_minlen: Tuint8_t;
    rpm_maxlen: Tuint8_t;
    rpm_reserved: Tuint16_t;
    rpm_prefix: Tin6_addr;
  end;
  Prr_pco_match = ^Trr_pco_match;

const
  RPM_PCO_ADD = 1;
  RPM_PCO_CHANGE = 2;
  RPM_PCO_SETGLOBAL = 3;

type
  Trr_pco_use = record
    rpu_uselen: Tuint8_t;
    rpu_keeplen: Tuint8_t;
    rpu_ramask: Tuint8_t;
    rpu_raflags: Tuint8_t;
    rpu_vltime: Tuint32_t;
    rpu_pltime: Tuint32_t;
    rpu_flags: Tuint32_t;
    rpu_prefix: Tin6_addr;
  end;
  Prr_pco_use = ^Trr_pco_use;

const
  ICMP6_RR_PCOUSE_RAFLAGS_ONLINK = $20;
  ICMP6_RR_PCOUSE_RAFLAGS_AUTO = $10;

const
  ICMP6_RR_PCOUSE_FLAGS_DECRVLTIME = $80;
  ICMP6_RR_PCOUSE_FLAGS_DECRPLTIME = $40;

type
  Trr_result = record
    rrr_flags: Tuint16_t;
    rrr_ordinal: Tuint8_t;
    rrr_matchedlen: Tuint8_t;
    rrr_ifid: Tuint32_t;
    rrr_prefix: Tin6_addr;
  end;
  Prr_result = ^Trr_result;

const
  ICMP6_RR_RESULT_FLAGS_OOB = $0200;
  ICMP6_RR_RESULT_FLAGS_FORBIDDEN = $0100;

type
  Tnd_opt_adv_interval = record
    nd_opt_adv_interval_type: Tuint8_t;
    nd_opt_adv_interval_len: Tuint8_t;
    nd_opt_adv_interval_reserved: Tuint16_t;
    nd_opt_adv_interval_ival: Tuint32_t;
  end;
  Pnd_opt_adv_interval = ^Tnd_opt_adv_interval;

  Tnd_opt_home_agent_info = record
    nd_opt_home_agent_info_type: Tuint8_t;
    nd_opt_home_agent_info_len: Tuint8_t;
    nd_opt_home_agent_info_reserved: Tuint16_t;
    nd_opt_home_agent_info_preference: Tuint16_t;
    nd_opt_home_agent_info_lifetime: Tuint16_t;
  end;
  Pnd_opt_home_agent_info = ^Tnd_opt_home_agent_info;


  // /usr/include/netinet/ip.h

type
  Ttimestamp = bitpacked record
    len: Tuint8_t;
    ptr: Tuint8_t;
    flags: 0..15;
    overflow: 0..15;
    data: array[0..8] of Tuint32_t;
  end;
  Ptimestamp = ^Ttimestamp;

type
  Piphdr = ^Tiphdr;

  Tiphdr = bitpacked record
    ihl: 0..15;
    version: 0..15;
    tos: Tuint8_t;
    tot_len: Tuint16_t;
    id: Tuint16_t;
    frag_off: Tuint16_t;
    ttl: Tuint8_t;
    protocol: Tuint8_t;
    check: Tuint16_t;
    saddr: Tuint32_t;
    daddr: Tuint32_t;
  end;

type
  Pip = ^Tip;

  Tip = bitpacked record
    ip_hl: 0..15;
    ip_v: 0..15;
    ip_tos: Tuint8_t;
    ip_len: word;
    ip_id: word;
    ip_off: word;
    ip_ttl: Tuint8_t;
    ip_p: Tuint8_t;
    ip_sum: word;
    ip_src: Tin_addr;
    ip_dst: Tin_addr;
  end;

const
  IP_RF = $8000;
  IP_DF = $4000;
  IP_MF = $2000;
  IP_OFFMASK = $1fff;

type
  Tip_timestamp = record
    ipt_code: Tuint8_t;
    ipt_len: Tuint8_t;
    ipt_ptr: Tuint8_t;
    ipt_flg: 0..15;
    ipt_oflw: 0..15;
    data: array[0..8] of Tuint32_t;
  end;
  Pip_timestamp = ^Tip_timestamp;

const
  IPVERSION = 4;
  IP_MAXPACKET = 65535;
  IPTOS_ECN_MASK = $03;

function IPTOS_ECN(x: DWord): DWord;

const
  IPTOS_ECN_NOT_ECT = $00;
  IPTOS_ECN_ECT1 = $01;
  IPTOS_ECN_ECT0 = $02;
  IPTOS_ECN_CE = $03;
  IPTOS_DSCP_MASK = $fc;

function IPTOS_DSCP(x: DWord): DWord;

const
  IPTOS_DSCP_AF11 = $28;
  IPTOS_DSCP_AF12 = $30;
  IPTOS_DSCP_AF13 = $38;
  IPTOS_DSCP_AF21 = $48;
  IPTOS_DSCP_AF22 = $50;
  IPTOS_DSCP_AF23 = $58;
  IPTOS_DSCP_AF31 = $68;
  IPTOS_DSCP_AF32 = $70;
  IPTOS_DSCP_AF33 = $78;
  IPTOS_DSCP_AF41 = $88;
  IPTOS_DSCP_AF42 = $90;
  IPTOS_DSCP_AF43 = $98;
  IPTOS_DSCP_EF = $b8;
  IPTOS_DSCP_VA = $b0;
  IPTOS_DSCP_LE = $04;
  IPTOS_CLASS_MASK = $e0;

function IPTOS_CLASS(klass: DWord): DWord;

const
  IPTOS_CLASS_CS0 = $00;
  IPTOS_CLASS_CS1 = $20;
  IPTOS_CLASS_CS2 = $40;
  IPTOS_CLASS_CS3 = $60;
  IPTOS_CLASS_CS4 = $80;
  IPTOS_CLASS_CS5 = $a0;
  IPTOS_CLASS_CS6 = $c0;
  IPTOS_CLASS_CS7 = $e0;
  IPTOS_CLASS_DEFAULT = IPTOS_CLASS_CS0;
  IPTOS_TOS_MASK = $1E;

function IPTOS_TOS(tos: DWord): DWord;

const
  IPTOS_LOWDELAY = $10;
  IPTOS_THROUGHPUT = $08;
  IPTOS_RELIABILITY = $04;
  IPTOS_LOWCOST = $02;
  IPTOS_MINCOST = IPTOS_LOWCOST;

  IPTOS_PREC_MASK = IPTOS_CLASS_MASK;

function IPTOS_PREC(tos: DWord): DWord;

const
  IPTOS_PREC_NETCONTROL = IPTOS_CLASS_CS7;
  IPTOS_PREC_INTERNETCONTROL = IPTOS_CLASS_CS6;
  IPTOS_PREC_CRITIC_ECP = IPTOS_CLASS_CS5;
  IPTOS_PREC_FLASHOVERRIDE = IPTOS_CLASS_CS4;
  IPTOS_PREC_FLASH = IPTOS_CLASS_CS3;
  IPTOS_PREC_IMMEDIATE = IPTOS_CLASS_CS2;
  IPTOS_PREC_PRIORITY = IPTOS_CLASS_CS1;
  IPTOS_PREC_ROUTINE = IPTOS_CLASS_CS0;
  IPOPT_COPY = $80;
  IPOPT_CLASS_MASK = $60;
  IPOPT_NUMBER_MASK = $1f;

function IPOPT_COPIED(obj: DWord): DWord;
function IPOPT_CLASS(obj: DWord): DWord;
function IPOPT_NUMBER(obj: DWord): DWord;

const
  IPOPT_CONTROL = $00;
  IPOPT_RESERVED1 = $20;
  IPOPT_DEBMEAS = $40;
  IPOPT_MEASUREMENT = IPOPT_DEBMEAS;
  IPOPT_RESERVED2 = $60;
  IPOPT_EOL = 0;
  IPOPT_END = IPOPT_EOL;
  IPOPT_NOP = 1;
  IPOPT_NOOP = IPOPT_NOP;
  IPOPT_RR = 7;
  IPOPT_TS = 68;
  IPOPT_TIMESTAMP = IPOPT_TS;
  IPOPT_SECURITY = 130;
  IPOPT_SEC = IPOPT_SECURITY;
  IPOPT_LSRR = 131;
  IPOPT_SATID = 136;
  IPOPT_SID = IPOPT_SATID;
  IPOPT_SSRR = 137;
  IPOPT_RA = 148;
  IPOPT_OPTVAL = 0;
  IPOPT_OLEN = 1;
  IPOPT_OFFSET = 2;
  IPOPT_MINOFF = 4;
  MAX_IPOPTLEN = 40;
  IPOPT_TS_TSONLY = 0;
  IPOPT_TS_TSANDADDR = 1;
  IPOPT_TS_PRESPEC = 3;
  IPOPT_SECUR_UNCLASS = $0000;
  IPOPT_SECUR_CONFID = $f135;
  IPOPT_SECUR_EFTO = $789a;
  IPOPT_SECUR_MMMM = $bc4d;
  IPOPT_SECUR_RESTR = $af13;
  IPOPT_SECUR_SECRET = $d788;
  IPOPT_SECUR_TOPSECRET = $6bc5;

  MAXTTL = 255;
  IPDEFTTL = 64;
  IPFRAGTTL = 60;
  IPTTLDEC = 1;
  IP_MSS = 576;


  // /usr/include/netinet/ip_icmp.h

type
  Ticmphdr = record
    _type: Tuint8_t;
    code: Tuint8_t;
    checksum: Tuint16_t;
    un: record
      case longint of
        0: (echo: record
            id: Tuint16_t;
            sequence: Tuint16_t;
            end);
        1: (gateway: Tuint32_t);
        2: (frag: record
            __glibc_reserved: Tuint16_t;
            mtu: Tuint16_t;
            end);
      end;
  end;
  Picmphdr = ^Ticmphdr;

const
  ICMP_ECHOREPLY = 0;
  ICMP_DEST_UNREACH = 3;
  ICMP_SOURCE_QUENCH = 4;
  ICMP_REDIRECT = 5;
  ICMP_ECHO = 8;
  ICMP_TIME_EXCEEDED = 11;
  ICMP_PARAMETERPROB = 12;
  ICMP_TIMESTAMP = 13;
  ICMP_TIMESTAMPREPLY = 14;
  ICMP_INFO_REQUEST = 15;
  ICMP_INFO_REPLY = 16;
  ICMP_ADDRESS = 17;
  ICMP_ADDRESSREPLY = 18;
  NR_ICMP_TYPES = 18;
  ICMP_NET_UNREACH = 0;
  ICMP_HOST_UNREACH = 1;
  ICMP_PROT_UNREACH = 2;
  ICMP_PORT_UNREACH = 3;
  ICMP_FRAG_NEEDED = 4;
  ICMP_SR_FAILED = 5;
  ICMP_NET_UNKNOWN = 6;
  ICMP_HOST_UNKNOWN = 7;
  ICMP_HOST_ISOLATED = 8;
  ICMP_NET_ANO = 9;
  ICMP_HOST_ANO = 10;
  ICMP_NET_UNR_TOS = 11;
  ICMP_HOST_UNR_TOS = 12;
  ICMP_PKT_FILTERED = 13;
  ICMP_PREC_VIOLATION = 14;
  ICMP_PREC_CUTOFF = 15;
  NR_ICMP_UNREACH = 15;
  ICMP_REDIR_NET = 0;
  ICMP_REDIR_HOST = 1;
  ICMP_REDIR_NETTOS = 2;
  ICMP_REDIR_HOSTTOS = 3;
  ICMP_EXC_TTL = 0;
  ICMP_EXC_FRAGTIME = 1;
  ICMP_EXT_ECHO = 42;
  ICMP_EXT_ECHOREPLY = 43;
  ICMP_EXT_CODE_MAL_QUERY = 1;
  ICMP_EXT_CODE_NO_IF = 2;
  ICMP_EXT_CODE_NO_TABLE_ENT = 3;
  ICMP_EXT_CODE_MULT_IFS = 4;
  ICMP_EXT_ECHOREPLY_ACTIVE = 1 shl 2;
  ICMP_EXT_ECHOREPLY_IPV4 = 1 shl 1;
  ICMP_EXT_ECHOREPLY_IPV6 = 1;
  ICMP_EXT_ECHO_CTYPE_NAME = 1;
  ICMP_EXT_ECHO_CTYPE_INDEX = 2;
  ICMP_EXT_ECHO_CTYPE_ADDR = 3;
  ICMP_AFI_IP = 1;
  ICMP_AFI_IP6 = 2;

type
  Ticmp_ra_addr = record
    ira_addr: Tuint32_t;
    ira_preference: Tuint32_t;
  end;
  Picmp_ra_addr = ^Ticmp_ra_addr;

  Ticmp = record
    icmp_type: Tuint8_t;
    icmp_code: Tuint8_t;
    icmp_cksum: Tuint16_t;
    icmp_hun: record
      case longint of
        0: (ih_pptr: byte);
        1: (ih_gwaddr: Tin_addr);
        2: (ih_idseq: record
            icd_id: Tuint16_t;
            icd_seq: Tuint16_t;
            end);
        3: (ih_void: Tuint32_t);
        4: (ih_pmtu: record
            ipm_void: Tuint16_t;
            ipm_nextmtu: Tuint16_t;
            end);
        5: (ih_rtradv: record
            irt_num_addrs: Tuint8_t;
            irt_wpa: Tuint8_t;
            irt_lifetime: Tuint16_t;
            end);
      end;
    icmp_dun: record
      case longint of
        0: (id_ts: record
            its_otime: Tuint32_t;
            its_rtime: Tuint32_t;
            its_ttime: Tuint32_t;
            end);
        1: (id_ip: record
            idi_ip: Tip;
            end);
        2: (id_radv: Ticmp_ra_addr);
        3: (id_mask: Tuint32_t);
        4: (id_data: array[0..0] of Tuint8_t);
      end;
  end;
  Picmp = ^Ticmp;

const
  ICMP_MINLEN = 8;
  ICMP_TSLEN = 8 + (3 * (sizeof(tn_time)));
  ICMP_MASKLEN = 12;

const
  ICMP_ADVLENMIN = 8 + SizeOf(TIp) + 8;

const
  ICMP_UNREACH = 3;
  ICMP_SOURCEQUENCH = 4;
  ICMP_ROUTERADVERT = 9;
  ICMP_ROUTERSOLICIT = 10;
  ICMP_TIMXCEED = 11;
  ICMP_PARAMPROB = 12;
  ICMP_TSTAMP = 13;
  ICMP_TSTAMPREPLY = 14;
  ICMP_IREQ = 15;
  ICMP_IREQREPLY = 16;
  ICMP_MASKREQ = 17;
  ICMP_MASKREPLY = 18;
  ICMP_MAXTYPE = 18;
  ICMP_UNREACH_NET = 0;
  ICMP_UNREACH_HOST = 1;
  ICMP_UNREACH_PROTOCOL = 2;
  ICMP_UNREACH_PORT = 3;
  ICMP_UNREACH_NEEDFRAG = 4;
  ICMP_UNREACH_SRCFAIL = 5;
  ICMP_UNREACH_NET_UNKNOWN = 6;
  ICMP_UNREACH_HOST_UNKNOWN = 7;
  ICMP_UNREACH_ISOLATED = 8;
  ICMP_UNREACH_NET_PROHIB = 9;
  ICMP_UNREACH_HOST_PROHIB = 10;
  ICMP_UNREACH_TOSNET = 11;
  ICMP_UNREACH_TOSHOST = 12;
  ICMP_UNREACH_FILTER_PROHIB = 13;
  ICMP_UNREACH_HOST_PRECEDENCE = 14;
  ICMP_UNREACH_PRECEDENCE_CUTOFF = 15;
  ICMP_REDIRECT_NET = 0;
  ICMP_REDIRECT_HOST = 1;
  ICMP_REDIRECT_TOSNET = 2;
  ICMP_REDIRECT_TOSHOST = 3;
  ICMP_TIMXCEED_INTRANS = 0;
  ICMP_TIMXCEED_REASS = 1;
  ICMP_PARAMPROB_OPTABSENT = 1;

function ICMP_INFOTYPE(type_: byte): boolean;



implementation


// /usr/include/netinet/in.h

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


// /usr/include/netinet/if_ether.h

procedure ETHER_MAP_IP_MULTICAST(ipaddr: Pin_addr; enaddr: Puint8_t); inline;
var
  p: Puint8_t;
begin
  p := Puint8_t(ipaddr);

  enaddr[0] := $01;
  enaddr[1] := $00;
  enaddr[2] := $5e;
  enaddr[3] := p[1] and $7F;
  enaddr[4] := p[2];
  enaddr[5] := p[3];
end;


// /usr/include/netinet/ip6.h

function IP6OPT_TYPE(obj: DWord): DWord;
begin
  IP6OPT_TYPE := obj and $c0;
end;


// /usr/include/netinet/ip.h

function IPTOS_ECN(x: DWord): DWord;
begin
  IPTOS_ECN := x and IPTOS_ECN_MASK;
end;

function IPTOS_DSCP(x: DWord): DWord;
begin
  IPTOS_DSCP := x and IPTOS_DSCP_MASK;
end;

function IPTOS_CLASS(klass: DWord): DWord;
begin
  IPTOS_CLASS := klass and IPTOS_CLASS_MASK;
end;

function IPTOS_TOS(tos: DWord): DWord;
begin
  IPTOS_TOS := tos and IPTOS_TOS_MASK;
end;

function IPTOS_PREC(tos: DWord): DWord;
begin
  IPTOS_PREC := IPTOS_CLASS(tos);
end;

function IPOPT_COPIED(obj: DWord): DWord;
begin
  IPOPT_COPIED := obj and IPOPT_COPY;
end;

function IPOPT_CLASS(obj: DWord): DWord;
begin
  IPOPT_CLASS := obj and IPOPT_CLASS_MASK;
end;

function IPOPT_NUMBER(obj: DWord): DWord;
begin
  IPOPT_NUMBER := obj and IPOPT_NUMBER_MASK;
end;

// /usr/include/netinet/ip_icmp.h

function ICMP_INFOTYPE(type_: byte): boolean;
begin
  Result := (type_ = ICMP_ECHOREPLY) or (type_ = ICMP_ECHO) or
    (type_ = ICMP_ROUTERADVERT) or (type_ = ICMP_ROUTERSOLICIT) or
    (type_ = ICMP_TSTAMP) or (type_ = ICMP_TSTAMPREPLY) or
    (type_ = ICMP_IREQ) or (type_ = ICMP_IREQREPLY) or
    (type_ = ICMP_MASKREQ) or (type_ = ICMP_MASKREPLY);
end;


end.
