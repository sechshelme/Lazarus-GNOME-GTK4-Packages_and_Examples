unit ip;

interface

uses
  clib, ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

  // === Konventiert am: 10-8-25 17:28:17 ===


implementation


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


end.
