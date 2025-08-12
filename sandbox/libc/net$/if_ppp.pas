unit if_ppp;

interface

uses
  clib, fp_ioctl, if_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

  // === Konventiert am: 12-8-25 17:05:54 ===


implementation



end.
