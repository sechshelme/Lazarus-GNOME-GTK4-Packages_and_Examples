unit if_arp;

interface

uses
 clib,  fp_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

  // === Konventiert am: 12-8-25 17:05:49 ===


implementation



end.
