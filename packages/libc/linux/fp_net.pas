unit fp_net;

interface

uses
  clib, fp_ioctl, fp_socket, fp_netinet;

  // /usr/include/net/if.h

const
  IF_NAMESIZE = 16;

type
  Tif_nameindex = record
    if_index: dword;
    if_name: pchar;
  end;
  Pif_nameindex = ^Tif_nameindex;

const
  IFF_UP = $1;
  IFF_BROADCAST = $2;
  IFF_DEBUG = $4;
  IFF_LOOPBACK = $8;
  IFF_POINTOPOINT = $10;
  IFF_NOTRAILERS = $20;
  IFF_RUNNING = $40;
  IFF_NOARP = $80;
  IFF_PROMISC = $100;
  IFF_ALLMULTI = $200;
  IFF_MASTER = $400;
  IFF_SLAVE = $800;
  IFF_MULTICAST = $1000;
  IFF_PORTSEL = $2000;
  IFF_AUTOMEDIA = $4000;
  IFF_DYNAMIC = $8000;

type
  Pifaddr = ^Tifaddr;

  Tifaddr = record
    ifa_addr: Tsockaddr;
    ifa_ifu: record
      case longint of
        0: (ifu_broadaddr: Tsockaddr);
        1: (ifu_dstaddr: Tsockaddr);
      end;
    ifa_ifp: Piface;
    ifa_next: Pifaddr;
  end;

type
  Tifmap = record
    mem_start: dword;
    mem_end: dword;
    base_addr: word;
    irq: byte;
    dma: byte;
    port: byte;
  end;
  Pifmap = ^Tifmap;

const
  IFHWADDRLEN = 6;
  IFNAMSIZ = IF_NAMESIZE;

type
  Tifreq = record
    ifr_ifrn: record
      case longint of
        0: (ifrn_name: array[0..(IFNAMSIZ) - 1] of char);
      end;
    ifr_ifru: record
      case longint of
        0: (ifru_addr: Tsockaddr);
        1: (ifru_dstaddr: Tsockaddr);
        2: (ifru_broadaddr: Tsockaddr);
        3: (ifru_netmask: Tsockaddr);
        4: (ifru_hwaddr: Tsockaddr);
        5: (ifru_flags: smallint);
        6: (ifru_ivalue: longint);
        7: (ifru_mtu: longint);
        8: (ifru_map: Tifmap);
        9: (ifru_slave: array[0..(IFNAMSIZ) - 1] of char);
        10: (ifru_newname: array[0..(IFNAMSIZ) - 1] of char);
        11: (ifru_data: Tcaddr_t);
      end;
  end;
  Pifreq = ^Tifreq;

type
  Tifconf = record
    ifc_len: longint;
    ifc_ifcu: record
      case longint of
        0: (ifcu_buf: Tcaddr_t);
        1: (ifcu_req: Pifreq);
      end;
  end;
  Pifconf = ^Tifconf;

function if_nametoindex(__ifname: pchar): dword; cdecl; external libc;
function if_indextoname(__ifindex: dword; __ifname: pchar): pchar; cdecl; external libc;
function if_nameindex: Pif_nameindex; cdecl; external libc;
procedure if_freenameindex(__ptr: Pif_nameindex); cdecl; external libc;


// /usr/include/net/ethernet.h

type
  Tether_addr = record
    ether_addr_octet: array[0..(ETH_ALEN) - 1] of Tuint8_t;
  end;
  Pether_addr = ^Tether_addr;

  Tether_header = record
    ether_dhost: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    ether_shost: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    ether_type: Tuint16_t;
  end;
  Pether_header = ^Tether_header;

const
  ETHERTYPE_PUP = $0200;
  ETHERTYPE_SPRITE = $0500;
  ETHERTYPE_IP = $0800;
  ETHERTYPE_ARP = $0806;
  ETHERTYPE_REVARP = $8035;
  ETHERTYPE_AT = $809B;
  ETHERTYPE_AARP = $80F3;
  ETHERTYPE_VLAN = $8100;
  ETHERTYPE_IPX = $8137;
  ETHERTYPE_IPV6 = $86dd;
  ETHERTYPE_LOOPBACK = $9000;
  ETHER_ADDR_LEN = ETH_ALEN;
  ETHER_TYPE_LEN = 2;
  ETHER_CRC_LEN = 4;
  ETHER_HDR_LEN = ETH_HLEN;
  ETHER_MIN_LEN = ETH_ZLEN + ETHER_CRC_LEN;
  ETHER_MAX_LEN = ETH_FRAME_LEN + ETHER_CRC_LEN;

function ETHER_IS_VALID_LEN(foo: longint): boolean;

const
  ETHERTYPE_TRAIL = $1000;
  ETHERTYPE_NTRAILER = 16;
  ETHERMTU = ETH_DATA_LEN;
  ETHERMIN = (ETHER_MIN_LEN - ETHER_HDR_LEN) - ETHER_CRC_LEN;


  // /usr/include/net/if_arp.h

const
  MAX_ADDR_LEN = 7;
  ARPOP_REQUEST = 1;
  ARPOP_REPLY = 2;
  ARPOP_RREQUEST = 3;
  ARPOP_RREPLY = 4;
  ARPOP_InREQUEST = 8;
  ARPOP_InREPLY = 9;
  ARPOP_NAK = 10;

type
  Parphdr = ^Tarphdr;

  Tarphdr = record
    ar_hrd: word;
    ar_pro: word;
    ar_hln: byte;
    ar_pln: byte;
    ar_op: word;
  end;

const
  ARPHRD_NETROM = 0;
  ARPHRD_ETHER = 1;
  ARPHRD_EETHER = 2;
  ARPHRD_AX25 = 3;
  ARPHRD_PRONET = 4;
  ARPHRD_CHAOS = 5;
  ARPHRD_IEEE802 = 6;
  ARPHRD_ARCNET = 7;
  ARPHRD_APPLETLK = 8;
  ARPHRD_DLCI = 15;
  ARPHRD_ATM = 19;
  ARPHRD_METRICOM = 23;
  ARPHRD_IEEE1394 = 24;
  ARPHRD_EUI64 = 27;
  ARPHRD_INFINIBAND = 32;
  ARPHRD_SLIP = 256;
  ARPHRD_CSLIP = 257;
  ARPHRD_SLIP6 = 258;
  ARPHRD_CSLIP6 = 259;
  ARPHRD_RSRVD = 260;
  ARPHRD_ADAPT = 264;
  ARPHRD_ROSE = 270;
  ARPHRD_X25 = 271;
  ARPHRD_HWX25 = 272;
  ARPHRD_CAN = 280;
  ARPHRD_MCTP = 290;
  ARPHRD_PPP = 512;
  ARPHRD_CISCO = 513;
  ARPHRD_HDLC = ARPHRD_CISCO;
  ARPHRD_LAPB = 516;
  ARPHRD_DDCMP = 517;
  ARPHRD_RAWHDLC = 518;
  ARPHRD_RAWIP = 519;
  ARPHRD_TUNNEL = 768;
  ARPHRD_TUNNEL6 = 769;
  ARPHRD_FRAD = 770;
  ARPHRD_SKIP = 771;
  ARPHRD_LOOPBACK = 772;
  ARPHRD_LOCALTLK = 773;
  ARPHRD_FDDI = 774;
  ARPHRD_BIF = 775;
  ARPHRD_SIT = 776;
  ARPHRD_IPDDP = 777;
  ARPHRD_IPGRE = 778;
  ARPHRD_PIMREG = 779;
  ARPHRD_HIPPI = 780;
  ARPHRD_ASH = 781;
  ARPHRD_ECONET = 782;
  ARPHRD_IRDA = 783;
  ARPHRD_FCPP = 784;
  ARPHRD_FCAL = 785;
  ARPHRD_FCPL = 786;
  ARPHRD_FCFABRIC = 787;
  ARPHRD_IEEE802_TR = 800;
  ARPHRD_IEEE80211 = 801;
  ARPHRD_IEEE80211_PRISM = 802;
  ARPHRD_IEEE80211_RADIOTAP = 803;
  ARPHRD_IEEE802154 = 804;
  ARPHRD_IEEE802154_PHY = 805;
  ARPHRD_VOID = $FFFF;
  ARPHRD_NONE = $FFFE;

type
  Tarpreq = record
    arp_pa: Tsockaddr;
    arp_ha: Tsockaddr;
    arp_flags: longint;
    arp_netmask: Tsockaddr;
    arp_dev: array[0..15] of char;
  end;
  Parpreq = ^Tarpreq;

  Tarpreq_old = record
    arp_pa: Tsockaddr;
    arp_ha: Tsockaddr;
    arp_flags: longint;
    arp_netmask: Tsockaddr;
  end;
  Parpreq_old = ^Tarpreq_old;

const
  ATF_COM = $02;
  ATF_PERM = $04;
  ATF_PUBL = $08;
  ATF_USETRAILERS = $10;
  ATF_NETMASK = $20;
  ATF_DONTPUB = $40;
  ATF_MAGIC = $80;
  ARPD_UPDATE = $01;
  ARPD_LOOKUP = $02;
  ARPD_FLUSH = $03;

type
  Tarpd_request = record
    req: word;
    ip: Tuint32_t;
    dev: dword;
    stamp: dword;
    updated: dword;
    ha: array[0..(MAX_ADDR_LEN) - 1] of byte;
  end;
  Parpd_request = ^Tarpd_request;


  // /usr/include/net/if_packet.h

type
  Tsockaddr_pkt = record
    spkt_family: word;       // ???? sa_family_t
    spkt_device: array[0..13] of byte;
    spkt_protocol: word;
  end;
  Psockaddr_pkt = ^Tsockaddr_pkt;


  // /usr/include/net/if_ppp.h

const
  PPP_MTU = 1500;
  PPP_MAXMRU = 65000;
  PPP_VERSION = '2.2.0';
  PPP_MAGIC = $5002;
  PROTO_IPX = $002b;
  PROTO_DNA_RT = $0027;
  SC_COMP_PROT = $00000001;
  SC_COMP_AC = $00000002;
  SC_COMP_TCP = $00000004;
  SC_NO_TCP_CCID = $00000008;
  SC_REJ_COMP_AC = $00000010;
  SC_REJ_COMP_TCP = $00000020;
  SC_CCP_OPEN = $00000040;
  SC_CCP_UP = $00000080;
  SC_ENABLE_IP = $00000100;
  SC_COMP_RUN = $00001000;
  SC_DECOMP_RUN = $00002000;
  SC_DEBUG = $00010000;
  SC_LOG_INPKT = $00020000;
  SC_LOG_OUTPKT = $00040000;
  SC_LOG_RAWIN = $00080000;
  SC_LOG_FLUSH = $00100000;
  SC_MASK = $0fE0ffff;
  SC_ESCAPED = $80000000;
  SC_FLUSH = $40000000;
  SC_VJ_RESET = $20000000;
  SC_XMIT_BUSY = $10000000;
  SC_RCV_ODDP = $08000000;
  SC_RCV_EVNP = $04000000;
  SC_RCV_B7_1 = $02000000;
  SC_RCV_B7_0 = $01000000;
  SC_DC_FERROR = $00800000;
  SC_DC_ERROR = $00400000;

type
  Tnpioctl = record
    protocol: longint;
    mode: TNPmode;
  end;
  Pnpioctl = ^Tnpioctl;

  Tppp_option_data = record
    ptr: Puint8_t;
    length: Tuint32_t;
    transmit: longint;
  end;
  Pppp_option_data = ^Tppp_option_data;

  Tifpppstatsreq = record
    b: Tifreq;
    stats: Tppp_stats;
  end;
  Pifpppstatsreq = ^Tifpppstatsreq;

  Tifpppcstatsreq = record
    b: Tifreq;
    stats: Tppp_comp_stats;
  end;
  Pifpppcstatsreq = ^Tifpppcstatsreq;

const
  PPPIOCGFLAGS = $8004745A;
  PPPIOCSFLAGS = $40047459;
  PPPIOCGASYNCMAP = $80047458;
  PPPIOCSASYNCMAP = $40047457;
  PPPIOCGUNIT = $80047456;
  PPPIOCGRASYNCMAP = $80047455;
  PPPIOCSRASYNCMAP = $40047454;
  PPPIOCGMRU = $80047453;
  PPPIOCSMRU = $40047452;
  PPPIOCSMAXCID = $40047451;

  PPPIOCGXASYNCMAP = $80207450;
  PPPIOCSXASYNCMAP = $4020744F;

  PPPIOCXFERUNIT = $0000744E;
  PPPIOCSCOMPRESS = $4008744D;
  PPPIOCGNPMODE = $C008744C;
  PPPIOCSNPMODE = $4008744B;

  PPPIOCGDEBUG = $80047441;
  PPPIOCSDEBUG = $40047440;
  PPPIOCGIDLE = $8010743F;

{ xxxxxxxxxxx
#define  PPPIOCGFLAGS  _IOR('t', 90, int)
#define  PPPIOCSFLAGS  _IOW('t', 89, int)
#define  PPPIOCGASYNCMAP  _IOR('t', 88, int)
#define  PPPIOCSASYNCMAP  _IOW('t', 87, int)
#define  PPPIOCGUNIT  _IOR('t', 86, int)
#define  PPPIOCGRASYNCMAP _IOR('t', 85, int)
#define  PPPIOCSRASYNCMAP _IOW('t', 84, int)
#define  PPPIOCGMRU  _IOR('t', 83, int)
#define  PPPIOCSMRU  _IOW('t', 82, int)
#define  PPPIOCSMAXCID  _IOW('t', 81, int)
#define PPPIOCGXASYNCMAP _IOR('t', 80, ext_accm)
#define PPPIOCSXASYNCMAP _IOW('t', 79, ext_accm)
#define PPPIOCXFERUNIT  _IO('t', 78)
#define PPPIOCSCOMPRESS  _IOW('t', 77, struct ppp_option_data)
#define PPPIOCGNPMODE  _IOWR('t', 76, struct npioctl)
#define PPPIOCSNPMODE  _IOW('t', 75, struct npioctl)
#define PPPIOCGDEBUG  _IOR('t', 65, int)
#define PPPIOCSDEBUG  _IOW('t', 64, int)
#define PPPIOCGIDLE  _IOR('t', 63, struct ppp_idle)
 }

const
  SIOCGPPPSTATS = SIOCDEVPRIVATE + 0;
  SIOCGPPPVER = SIOCDEVPRIVATE + 1;
  SIOCGPPPCSTATS = SIOCDEVPRIVATE + 2;


  // /usr/include/net/if_shaper.h

const
  SHAPER_QLEN = 10;
  SHAPER_LATENCY = 5 * HZ;
  SHAPER_MAXSLIP = 2;
  SHAPER_BURST = HZ / 50;
  SHAPER_SET_DEV = $0001;
  SHAPER_SET_SPEED = $0002;
  SHAPER_GET_DEV = $0003;
  SHAPER_GET_SPEED = $0004;

type
  Tshaperconf = record
    ss_cmd: Tuint16_t;
    ss_u: record
      case longint of
        0: (ssu_name: array[0..13] of char);
        1: (ssu_speed: Tuint32_t);
      end;
  end;
  Pshaperconf = ^Tshaperconf;


  // /usr/include/net/route.h

type
  Trtentry = record
    rt_pad1: dword;
    rt_dst: Tsockaddr;
    rt_gateway: Tsockaddr;
    rt_genmask: Tsockaddr;
    rt_flags: word;
    rt_pad2: smallint;
    rt_pad3: dword;
    rt_tos: byte;
    rt_class: byte;
    rt_pad4: array[0..2] of smallint;
    rt_metric: smallint;
    rt_dev: pchar;
    rt_mtu: dword;
    rt_window: dword;
    rt_irtt: word;
  end;
  Prtentry = ^Trtentry;

type
  Tin6_rtmsg = record
    rtmsg_dst: Tin6_addr;
    rtmsg_src: Tin6_addr;
    rtmsg_gateway: Tin6_addr;
    rtmsg_type: Tuint32_t;
    rtmsg_dst_len: Tuint16_t;
    rtmsg_src_len: Tuint16_t;
    rtmsg_metric: Tuint32_t;
    rtmsg_info: dword;
    rtmsg_flags: Tuint32_t;
    rtmsg_ifindex: longint;
  end;
  Pin6_rtmsg = ^Tin6_rtmsg;

const
  RTF_UP = $0001;
  RTF_GATEWAY = $0002;
  RTF_HOST = $0004;
  RTF_REINSTATE = $0008;
  RTF_DYNAMIC = $0010;
  RTF_MODIFIED = $0020;
  RTF_MTU = $0040;
  RTF_MSS = RTF_MTU;
  RTF_WINDOW = $0080;
  RTF_IRTT = $0100;
  RTF_REJECT = $0200;
  RTF_STATIC = $0400;
  RTF_XRESOLVE = $0800;
  RTF_NOFORWARD = $1000;
  RTF_THROW = $2000;
  RTF_NOPMTUDISC = $4000;
  RTF_DEFAULT = $00010000;
  RTF_ALLONLINK = $00020000;
  RTF_ADDRCONF = $00040000;
  RTF_LINKRT = $00100000;
  RTF_NONEXTHOP = $00200000;
  RTF_CACHE = $01000000;
  RTF_FLOW = $02000000;
  RTF_POLICY = $04000000;
  RTCF_VALVE = $00200000;
  RTCF_MASQ = $00400000;
  RTCF_NAT = $00800000;
  RTCF_DOREDIRECT = $01000000;
  RTCF_LOG = $02000000;
  RTCF_DIRECTSRC = $04000000;
  RTF_LOCAL = $80000000;
  RTF_INTERFACE = $40000000;
  RTF_MULTICAST = $20000000;
  RTF_BROADCAST = $10000000;
  RTF_NAT = $08000000;
  RTF_ADDRCLASSMASK = $F8000000;

function RT_ADDRCLASS(flags: DWord): DWord;
function RT_TOS(tos: DWord): DWord;
function RT_LOCALADDR(flags: DWord): boolean;

const
  RT_CLASS_UNSPEC = 0;
  RT_CLASS_DEFAULT = 253;
  RT_CLASS_MAIN = 254;
  RT_CLASS_LOCAL = 255;
  RT_CLASS_MAX = 255;
  //  RTMSG_ACK = NLMSG_ACK;
  RTMSG_OVERRUN = NLMSG_OVERRUN;
  RTMSG_NEWDEVICE = $11;
  RTMSG_DELDEVICE = $12;
  RTMSG_NEWROUTE = $21;
  RTMSG_DELROUTE = $22;
  RTMSG_NEWRULE = $31;
  RTMSG_DELRULE = $32;
  RTMSG_CONTROL = $40;
  RTMSG_AR_FAILED = $51;



implementation


// /usr/include/net/ethernet.h

function ETHER_IS_VALID_LEN(foo: longint): boolean;
begin
  ETHER_IS_VALID_LEN := (foo >= ETHER_MIN_LEN) and (foo <= ETHER_MAX_LEN);
end;


// /usr/include/net/route.h

function RT_ADDRCLASS(flags: DWord): DWord;
begin
  RT_ADDRCLASS := Tuint32_t(flags) shr 23;
end;

function RT_TOS(tos: DWord): DWord;
begin
  RT_TOS := tos and IPTOS_TOS_MASK;
end;

function RT_LOCALADDR(flags: DWord): boolean;
begin
  RT_LOCALADDR := (flags and RTF_ADDRCLASSMASK) = (RTF_LOCAL or RTF_INTERFACE);
end;




end.
