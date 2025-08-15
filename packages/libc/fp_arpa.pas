unit fp_arpa;

interface

uses
  clib, fp_socket, fp_netinet;


  // /usr/include/arpa/ftp.h

const
  PRELIM = 1;
  COMPLETE = 2;
  CONTINUE = 3;
  TRANSIENT = 4;
  ERROR = 5;
  TYPE_A = 1;
  TYPE_E = 2;
  TYPE_I = 3;
  TYPE_L = 4;

const
  typenames: array[0..4] of pansichar = ('0', 'ASCII', 'EBCDIC', 'Image', 'Local');

const
  FORM_N = 1;
  FORM_T = 2;
  FORM_C = 3;

const
  formnames: array[0..3] of pansichar = ('0', 'Nonprint', 'Telnet', 'Carriage-control');

const
  STRU_F = 1;
  STRU_R = 2;
  STRU_P = 3;

const
  strunames: array[0..3] of pansichar = ('0', 'File', 'Record', 'Page');

const
  MODE_S = 1;
  MODE_B = 2;
  MODE_C = 3;

const
  modenames: array[0..3] of pansichar = ('0', 'Stream', 'Block', 'Compressed');

const
  REC_ESC = '\377';
  REC_EOR = '\001';
  REC_EOF = '\002';

  BLK_EOR = $80;
  BLK_EOF = $40;
  BLK_ERRORS = $20;
  BLK_RESTART = $10;
  BLK_BYTECOUNT = 2;


  // /usr/include/arpa/tftp.h

const
  SEGSIZE = 512;
  RRQ = 01;
  WRQ = 02;
  DATA = 03;
  ACK = 04;

type
  Ttftphdr = record
    th_opcode: smallint;
    th_u1: record
      case longint of
        0: (tu_padding: array[0..2] of char);
        1: (th_u2: record
            th_u3: record
              case longint of
                0: (tu_block: word);
                1: (tu_code: smallint);
              end;
            tu_data: pchar;
            end);
        2: (tu_stuff: pchar);
      end;
  end;
  Ptftphdr = ^Ttftphdr;

const
  EUNDEF = 0;
  ENOTFOUND = 1;
  EACCESS = 2;
  ENOSPACE = 3;
  EBADOP = 4;
  EBADID = 5;
  EEXISTS = 6;
  ENOUSER = 7;


  // /usr/include/arpa/inet.h

function inet_addr(__cp: pchar): Tin_addr_t; cdecl; external libc;
function inet_lnaof(__in: Tin_addr): Tin_addr_t; cdecl; external libc;
function inet_makeaddr(__net: Tin_addr_t; __host: Tin_addr_t): Tin_addr; cdecl; external libc;
function inet_netof(__in: Tin_addr): Tin_addr_t; cdecl; external libc;
function inet_network(__cp: pchar): Tin_addr_t; cdecl; external libc;
function inet_ntoa(__in: Tin_addr): pchar; cdecl; external libc;
function inet_pton(__af: longint; __cp: pchar; __buf: pointer): longint; cdecl; external libc;
function inet_ntop(__af: longint; __cp: pointer; __buf: pchar; __len: Tsocklen_t): pchar; cdecl; external libc;
function inet_aton(__cp: pchar; __inp: Pin_addr): longint; cdecl; external libc;
function inet_neta(__net: Tin_addr_t; __buf: pchar; __len: Tsize_t): pchar; cdecl; external libc;
function inet_net_ntop(__af: longint; __cp: pointer; __bits: longint; __buf: pchar; __len: Tsize_t): pchar; cdecl; external libc;
function inet_net_pton(__af: longint; __cp: pchar; __buf: pointer; __len: Tsize_t): longint; cdecl; external libc;
function inet_nsap_addr(__cp: pchar; __buf: pbyte; __len: longint): dword; cdecl; external libc;
function inet_nsap_ntoa(__len: longint; __cp: pbyte; __buf: pchar): pchar; cdecl; external libc;



const
  NS_PACKETSZ = 512;
  NS_MAXDNAME = 1025;
  NS_MAXMSG = 65535;
  NS_MAXCDNAME = 255;
  NS_MAXLABEL = 63;
  NS_HFIXEDSZ = 12;
  NS_QFIXEDSZ = 4;
  NS_RRFIXEDSZ = 10;
  NS_INT32SZ = 4;
  NS_INT16SZ = 2;
  NS_INT8SZ = 1;
  NS_INADDRSZ = 4;
  NS_IN6ADDRSZ = 16;
  NS_CMPRSFLGS = $c0;
  NS_DEFAULTPORT = 53;

type
  P_ns_sect = ^T_ns_sect;
  T_ns_sect = longint;

const
  ns_s_qd = 0;
  ns_s_zn = 0;
  ns_s_an = 1;
  ns_s_pr = 1;
  ns_s_ns = 2;
  ns_s_ud = 2;
  ns_s_ar = 3;
  ns_s_max = 4;

type
  Tns_sect = T_ns_sect;
  Pns_sect = ^Tns_sect;

type
  T_ns_msg = record
    _msg: pbyte;
    _eom: pbyte;
    _id: Tuint16_t;
    _flags: Tuint16_t;
    _counts: array[0..(ns_s_max) - 1] of Tuint16_t;
    _sections: array[0..(ns_s_max) - 1] of pbyte;
    _sect: Tns_sect;
    _rrnum: longint;
    _msg_ptr: pbyte;
  end;
  P_ns_msg = ^T_ns_msg;

  Tns_msg = T_ns_msg;
  Pns_msg = ^Tns_msg;

  Tns_flagdata = record
    mask: longint;
    shift: longint;
  end;
  Pns_flagdata = ^Tns_flagdata;

var
  _ns_flagdata: Pns_flagdata; cvar;external libc;

function ns_msg_id(handle: T_ns_msg): longint;
function ns_msg_base(handle: T_ns_msg): pbyte;
function ns_msg_end(handle: T_ns_msg): pbyte;
function ns_msg_size(handle: T_ns_msg): longint;
function ns_msg_count(handle: T_ns_msg; section: longint): longint;

type
  T_ns_rr = record
    name: array[0..(NS_MAXDNAME) - 1] of char;
    _type: Tuint16_t;
    rr_class: Tuint16_t;
    ttl: Tuint32_t;
    rdlength: Tuint16_t;
    rdata: pbyte;
  end;
  P_ns_rr = ^T_ns_rr;

  Tns_rr = T_ns_rr;
  Pns_rr = ^Tns_rr;

type
  P_ns_flag = ^T_ns_flag;
  T_ns_flag = longint;

const
  ns_f_qr = 0;
  ns_f_opcode = 1;
  ns_f_aa = 2;
  ns_f_tc = 3;
  ns_f_rd = 4;
  ns_f_ra = 5;
  ns_f_z = 6;
  ns_f_ad = 7;
  ns_f_cd = 8;
  ns_f_rcode = 9;
  ns_f_max = 10;

type
  Tns_flag = T_ns_flag;
  Pns_flag = ^Tns_flag;

type
  P_ns_opcode = ^T_ns_opcode;
  T_ns_opcode = longint;

const
  ns_o_query = 0;
  ns_o_iquery = 1;
  ns_o_status = 2;
  ns_o_notify = 4;
  ns_o_update = 5;
  ns_o_max = 6;

type
  Tns_opcode = T_ns_opcode;
  Pns_opcode = ^Tns_opcode;

type
  P_ns_rcode = ^T_ns_rcode;
  T_ns_rcode = longint;

const
  ns_r_noerror = 0;
  ns_r_formerr = 1;
  ns_r_servfail = 2;
  ns_r_nxdomain = 3;
  ns_r_notimpl = 4;
  ns_r_refused = 5;
  ns_r_yxdomain = 6;
  ns_r_yxrrset = 7;
  ns_r_nxrrset = 8;
  ns_r_notauth = 9;
  ns_r_notzone = 10;
  ns_r_max = 11;
  ns_r_badvers = 16;
  ns_r_badsig = 16;
  ns_r_badkey = 17;
  ns_r_badtime = 18;

type
  Tns_rcode = T_ns_rcode;
  Pns_rcode = ^Tns_rcode;

type
  P_ns_update_operation = ^T_ns_update_operation;
  T_ns_update_operation = longint;

const
  ns_uop_delete = 0;
  ns_uop_add = 1;
  ns_uop_max = 2;

type
  Tns_update_operation = T_ns_update_operation;
  Pns_update_operation = ^Tns_update_operation;

type
  Tns_tsig_key = record
    name: array[0..(NS_MAXDNAME) - 1] of char;
    alg: array[0..(NS_MAXDNAME) - 1] of char;
    data: pbyte;
    len: longint;
  end;
  Pns_tsig_key = ^Tns_tsig_key;

  Tns_tcp_tsig_state = record
    counter: longint;
    key: Pdst_key;
    ctx: pointer;
    sig: array[0..(NS_PACKETSZ) - 1] of byte;
    siglen: longint;
  end;
  Pns_tcp_tsig_state = ^Tns_tcp_tsig_state;

const
  NS_TSIG_FUDGE = 300;
  NS_TSIG_TCP_COUNT = 100;
  NS_TSIG_ALG_HMAC_MD5 = 'HMAC-MD5.SIG-ALG.REG.INT';
  NS_TSIG_ERROR_NO_TSIG = -(10);
  NS_TSIG_ERROR_NO_SPACE = -(11);
  NS_TSIG_ERROR_FORMERR = -(12);

type
  P_ns_type = ^T_ns_type;
  T_ns_type = longint;

const
  ns_t_invalid = 0;
  ns_t_a = 1;
  ns_t_ns = 2;
  ns_t_md = 3;
  ns_t_mf = 4;
  ns_t_cname = 5;
  ns_t_soa = 6;
  ns_t_mb = 7;
  ns_t_mg = 8;
  ns_t_mr = 9;
  ns_t_null = 10;
  ns_t_wks = 11;
  ns_t_ptr = 12;
  ns_t_hinfo = 13;
  ns_t_minfo = 14;
  ns_t_mx = 15;
  ns_t_txt = 16;
  ns_t_rp = 17;
  ns_t_afsdb = 18;
  ns_t_x25 = 19;
  ns_t_isdn = 20;
  ns_t_rt = 21;
  ns_t_nsap = 22;
  ns_t_nsap_ptr = 23;
  ns_t_sig = 24;
  ns_t_key = 25;
  ns_t_px = 26;
  ns_t_gpos = 27;
  ns_t_aaaa = 28;
  ns_t_loc = 29;
  ns_t_nxt = 30;
  ns_t_eid = 31;
  ns_t_nimloc = 32;
  ns_t_srv = 33;
  ns_t_atma = 34;
  ns_t_naptr = 35;
  ns_t_kx = 36;
  ns_t_cert = 37;
  ns_t_a6 = 38;
  ns_t_dname = 39;
  ns_t_sink = 40;
  ns_t_opt = 41;
  ns_t_apl = 42;
  ns_t_ds = 43;
  ns_t_sshfp = 44;
  ns_t_ipseckey = 45;
  ns_t_rrsig = 46;
  ns_t_nsec = 47;
  ns_t_dnskey = 48;
  ns_t_dhcid = 49;
  ns_t_nsec3 = 50;
  ns_t_nsec3param = 51;
  ns_t_tlsa = 52;
  ns_t_smimea = 53;
  ns_t_hip = 55;
  ns_t_ninfo = 56;
  ns_t_rkey = 57;
  ns_t_talink = 58;
  ns_t_cds = 59;
  ns_t_cdnskey = 60;
  ns_t_openpgpkey = 61;
  ns_t_csync = 62;
  ns_t_spf = 99;
  ns_t_uinfo = 100;
  ns_t_uid = 101;
  ns_t_gid = 102;
  ns_t_unspec = 103;
  ns_t_nid = 104;
  ns_t_l32 = 105;
  ns_t_l64 = 106;
  ns_t_lp = 107;
  ns_t_eui48 = 108;
  ns_t_eui64 = 109;
  ns_t_tkey = 249;
  ns_t_tsig = 250;
  ns_t_ixfr = 251;
  ns_t_axfr = 252;
  ns_t_mailb = 253;
  ns_t_maila = 254;
  ns_t_any = 255;
  ns_t_uri = 256;
  ns_t_caa = 257;
  ns_t_avc = 258;
  ns_t_ta = 32768;
  ns_t_dlv = 32769;
  ns_t_max = 65536;

type
  Tns_type = T_ns_type;
  Pns_type = ^Tns_type;

type
  P_ns_class = ^T_ns_class;
  T_ns_class = longint;

const
  ns_c_invalid = 0;
  ns_c_in = 1;
  ns_c_2 = 2;
  ns_c_chaos = 3;
  ns_c_hs = 4;
  ns_c_none = 254;
  ns_c_any = 255;
  ns_c_max = 65536;

type
  Tns_class = T_ns_class;
  Pns_class = ^Tns_class;

type
  P_ns_cert_types = ^T_ns_cert_types;
  T_ns_cert_types = longint;

const
  cert_t_pkix = 1;
  cert_t_spki = 2;
  cert_t_pgp = 3;
  cert_t_url = 253;
  cert_t_oid = 254;

type
  Tns_cert_types = T_ns_cert_types;
  Pns_cert_types = ^Tns_cert_types;

const
  NS_OPT_DNSSEC_OK = $8000;
  NS_OPT_NSID = 3;

function ns_msg_getflag(para1: Tns_msg; para2: longint): longint; cdecl; external libc;
function ns_get16(para1: pbyte): dword; cdecl; external libc;
function ns_get32(para1: pbyte): dword; cdecl; external libc;
procedure ns_put16(para1: dword; para2: pbyte); cdecl; external libc;
procedure ns_put32(para1: dword; para2: pbyte); cdecl; external libc;
function ns_initparse(para1: pbyte; para2: longint; para3: Pns_msg): longint; cdecl; external libc;
function ns_skiprr(para1: pbyte; para2: pbyte; para3: Tns_sect; para4: longint): longint; cdecl; external libc;
function ns_parserr(para1: Pns_msg; para2: Tns_sect; para3: longint; para4: Pns_rr): longint; cdecl; external libc;
function ns_sprintrr(para1: Pns_msg; para2: Pns_rr; para3: pchar; para4: pchar; para5: pchar; para6: Tsize_t): longint; cdecl; external libc; deprecated;
function ns_sprintrrf(para1: pbyte; para2: Tsize_t; para3: pchar; para4: Tns_class; para5: Tns_type; para6: dword; para7: pbyte; para8: Tsize_t; para9: pchar; para10: pchar; para11: pchar; para12: Tsize_t): longint; cdecl; external libc; deprecated;
function ns_format_ttl(para1: dword; para2: pchar; para3: Tsize_t): longint; cdecl; external libc; deprecated;
function ns_parse_ttl(para1: pchar; para2: Pdword): longint; cdecl; external libc; deprecated;
function ns_datetosecs(para1: pchar; para2: Plongint): Tuint32_t; cdecl; external libc; deprecated;
function ns_name_ntol(para1: pbyte; para2: pbyte; para3: Tsize_t): longint; cdecl; external libc;
function ns_name_ntop(para1: pbyte; para2: pchar; para3: Tsize_t): longint; cdecl; external libc;
function ns_name_pton(para1: pchar; para2: pbyte; para3: Tsize_t): longint; cdecl; external libc;
function ns_name_unpack(para1: pbyte; para2: pbyte; para3: pbyte; para4: pbyte; para5: Tsize_t): longint; cdecl; external libc;
function ns_name_pack(para1: pbyte; para2: pbyte; para3: longint; para4: PPbyte; para5: PPbyte): longint; cdecl; external libc;
function ns_name_uncompress(para1: pbyte; para2: pbyte; para3: pbyte; para4: pchar; para5: Tsize_t): longint; cdecl; external libc;
function ns_name_compress(para1: pchar; para2: pbyte; para3: Tsize_t; para4: PPbyte; para5: PPbyte): longint; cdecl; external libc;
function ns_name_skip(para1: PPbyte; para2: pbyte): longint; cdecl; external libc;
procedure ns_name_rollback(para1: pbyte; para2: PPbyte; para3: PPbyte); cdecl; external libc;
function ns_samedomain(para1: pchar; para2: pchar): longint; cdecl; external libc; deprecated;
function ns_subdomain(para1: pchar; para2: pchar): longint; cdecl; external libc; deprecated;
function ns_makecanon(para1: pchar; para2: pchar; para3: Tsize_t): longint; cdecl; external libc; deprecated;
function ns_samename(para1: pchar; para2: pchar): longint; cdecl; external libc; deprecated;

function ns_rr_name(rr: T_ns_rr): pchar;
function ns_rr_type(rr: T_ns_rr): Tns_type;
function ns_rr_class(rr: T_ns_rr): Tns_class;
function ns_rr_ttl(rr: T_ns_rr): longint;
function ns_rr_rdlen(rr: T_ns_rr): longint;
function ns_rr_rdata(rr: T_ns_rr): pbyte;


// /usr/include/arpa/nameser_compat.h

type
  THEADER = bitpacked record
    rd: 0..1;
    tc: 0..1;
    aa: 0..1;
    opcode: 9..15;
    qr: 0..1;
    rcode: 0..15;
    cd: 0..1;
    ad: 0..1;
    unused: 0..1;
    ra: 0..1;
    qdcount: 0..65535;
    ancount: 0..65535;
    nscount: 0..65535;
    arcount: 0..65535;
  end;
  PHEADER = ^THEADER;

const
  PACKETSZ = NS_PACKETSZ;
  MAXDNAME = NS_MAXDNAME;
  MAXCDNAME = NS_MAXCDNAME;
  MAXLABEL = NS_MAXLABEL;
  HFIXEDSZ = NS_HFIXEDSZ;
  QFIXEDSZ = NS_QFIXEDSZ;
  RRFIXEDSZ = NS_RRFIXEDSZ;
  INT32SZ = NS_INT32SZ;
  INT16SZ = NS_INT16SZ;
  INT8SZ = NS_INT8SZ;
  INADDRSZ = NS_INADDRSZ;
  IN6ADDRSZ = NS_IN6ADDRSZ;
  INDIR_MASK = NS_CMPRSFLGS;
  NAMESERVER_PORT = NS_DEFAULTPORT;
  S_ZONE = ns_s_zn;
  S_PREREQ = ns_s_pr;
  S_UPDATE = ns_s_ud;
  S_ADDT = ns_s_ar;
  QUERY = ns_o_query;
  IQUERY = ns_o_iquery;
  STATUS = ns_o_status;
  NS_NOTIFY_OP = ns_o_notify;
  NS_UPDATE_OP = ns_o_update;
  NOERROR = ns_r_noerror;
  FORMERR = ns_r_formerr;
  SERVFAIL = ns_r_servfail;
  NXDOMAIN = ns_r_nxdomain;
  NOTIMP = ns_r_notimpl;
  REFUSED = ns_r_refused;
  YXDOMAIN = ns_r_yxdomain;
  YXRRSET = ns_r_yxrrset;
  NXRRSET = ns_r_nxrrset;
  NOTAUTH = ns_r_notauth;
  NOTZONE = ns_r_notzone;

  DELETE = ns_uop_delete;
  ADD = ns_uop_add;
  T_A = ns_t_a;
  T_NS = ns_t_ns;
  T_MD = ns_t_md;
  T_MF = ns_t_mf;
  T_CNAME = ns_t_cname;
  T_SOA = ns_t_soa;
  T_MB = ns_t_mb;
  T_MG = ns_t_mg;
  T_MR = ns_t_mr;
  T_NULL = ns_t_null;
  T_WKS = ns_t_wks;
  T_PTR = ns_t_ptr;
  T_HINFO = ns_t_hinfo;
  T_MINFO = ns_t_minfo;
  T_MX = ns_t_mx;
  T_TXT = ns_t_txt;
  T_RP = ns_t_rp;
  T_AFSDB = ns_t_afsdb;
  T_X25 = ns_t_x25;
  T_ISDN = ns_t_isdn;
  T_RT = ns_t_rt;
  T_NSAP = ns_t_nsap;
  T_NSAP_PTR = ns_t_nsap_ptr;
  T_SIG = ns_t_sig;
  T_KEY = ns_t_key;
  T_PX = ns_t_px;
  T_GPOS = ns_t_gpos;
  T_AAAA = ns_t_aaaa;
  T_LOC = ns_t_loc;
  T_NXT = ns_t_nxt;
  T_EID = ns_t_eid;
  T_NIMLOC = ns_t_nimloc;
  T_SRV = ns_t_srv;
  T_ATMA = ns_t_atma;
  T_NAPTR = ns_t_naptr;
  T_KX = ns_t_kx;
  T_CERT = ns_t_cert;
  T_A6 = ns_t_a6;
  T_DNAME = ns_t_dname;
  T_SINK = ns_t_sink;
  T_OPT = ns_t_opt;
  T_APL = ns_t_apl;
  T_DS = ns_t_ds;
  T_SSHFP = ns_t_sshfp;
  T_IPSECKEY = ns_t_ipseckey;
  T_RRSIG = ns_t_rrsig;
  T_NSEC = ns_t_nsec;
  T_DNSKEY = ns_t_dnskey;
  T_DHCID = ns_t_dhcid;
  T_NSEC3 = ns_t_nsec3;
  T_NSEC3PARAM = ns_t_nsec3param;
  T_TLSA = ns_t_tlsa;
  T_SMIMEA = ns_t_smimea;
  T_HIP = ns_t_hip;
  T_NINFO = ns_t_ninfo;
  T_RKEY = ns_t_rkey;
  T_TALINK = ns_t_talink;
  T_CDS = ns_t_cds;
  T_CDNSKEY = ns_t_cdnskey;
  T_OPENPGPKEY = ns_t_openpgpkey;
  T_CSYNC = ns_t_csync;
  T_SPF = ns_t_spf;
  T_UINFO = ns_t_uinfo;
  T_UID = ns_t_uid;
  T_GID = ns_t_gid;
  T_UNSPEC = ns_t_unspec;
  T_NID = ns_t_nid;
  T_L32 = ns_t_l32;
  T_L64 = ns_t_l64;
  T_LP = ns_t_lp;
  T_EUI48 = ns_t_eui48;
  T_EUI64 = ns_t_eui64;
  T_TKEY = ns_t_tkey;
  T_TSIG = ns_t_tsig;
  T_IXFR = ns_t_ixfr;
  T_AXFR = ns_t_axfr;
  T_MAILB = ns_t_mailb;
  T_MAILA = ns_t_maila;
  T_ANY = ns_t_any;
  T_URI = ns_t_uri;
  T_CAA = ns_t_caa;
  T_AVC = ns_t_avc;
  T_TA = ns_t_ta;
  T_DLV = ns_t_dlv;
  C_IN = ns_c_in;
  C_CHAOS = ns_c_chaos;
  C_HS = ns_c_hs;
  C_NONE = ns_c_none;
  C_ANY = ns_c_any;


  // /usr/include/arpa/telnet.h

const
  IAC = 255;
  DONT = 254;
  DO_ = 253;
  WONT = 252;
  WILL = 251;
  SB = 250;
  GA = 249;
  EL = 248;
  EC = 247;
  AYT = 246;
  AO = 245;
  IP = 244;
  BREAK = 243;
  DM = 242;
  NOP = 241;
  SE = 240;
  EOR = 239;
  ABORT = 238;
  SUSP = 237;
  xEOF = 236;
  SYNCH = 242;

const
  telcmds: array[0..20] of pansichar = (
    'EOF', 'SUSP', 'ABORT', 'EOR', 'SE', 'NOP', 'DMARK', 'BRK', 'IP', 'AO', 'AYT', 'EC',
    'EL', 'GA', 'SB', 'WILL', 'WONT', 'DO', 'DONT', 'IAC', nil);

const
  TELCMD_FIRST = xEOF;
  TELCMD_LAST = IAC;

function TELCMD_OK(x: DWord): boolean;
function TELCMD(x: longint): pchar;

const
  TELOPT_BINARY = 0;
  TELOPT_ECHO = 1;
  TELOPT_RCP = 2;
  TELOPT_SGA = 3;
  TELOPT_NAMS = 4;
  TELOPT_STATUS = 5;
  TELOPT_TM = 6;
  TELOPT_RCTE = 7;
  TELOPT_NAOL = 8;
  TELOPT_NAOP = 9;
  TELOPT_NAOCRD = 10;
  TELOPT_NAOHTS = 11;
  TELOPT_NAOHTD = 12;
  TELOPT_NAOFFD = 13;
  TELOPT_NAOVTS = 14;
  TELOPT_NAOVTD = 15;
  TELOPT_NAOLFD = 16;
  TELOPT_XASCII = 17;
  TELOPT_LOGOUT = 18;
  TELOPT_BM = 19;
  TELOPT_DET = 20;
  TELOPT_SUPDUP = 21;
  TELOPT_SUPDUPOUTPUT = 22;
  TELOPT_SNDLOC = 23;
  TELOPT_TTYPE = 24;
  TELOPT_EOR = 25;
  TELOPT_TUID = 26;
  TELOPT_OUTMRK = 27;
  TELOPT_TTYLOC = 28;
  TELOPT_3270REGIME = 29;
  TELOPT_X3PAD = 30;
  TELOPT_NAWS = 31;
  TELOPT_TSPEED = 32;
  TELOPT_LFLOW = 33;
  TELOPT_LINEMODE = 34;
  TELOPT_XDISPLOC = 35;
  TELOPT_OLD_ENVIRON = 36;
  TELOPT_AUTHENTICATION = 37;
  TELOPT_ENCRYPT = 38;
  TELOPT_NEW_ENVIRON = 39;
  TELOPT_EXOPL = 255;
  NTELOPTS = 1 + TELOPT_NEW_ENVIRON;

  telopts: array[0..NTELOPTS] of pansichar = (
    'BINARY', 'ECHO', 'RCP', 'SUPPRESS GO AHEAD', 'NAME', 'STATUS', 'TIMING MARK', 'RCTE',
    'NAOL', 'NAOP', 'NAOCRD', 'NAOHTS', 'NAOHTD', 'NAOFFD', 'NAOVTS', 'NAOVTD', 'NAOLFD',
    'EXTEND ASCII', 'LOGOUT', 'BYTE MACRO', 'DATA ENTRY TERMINAL', 'SUPDUP', 'SUPDUP OUTPUT', 'SEND LOCATION',
    'TERMINAL TYPE', 'END OF RECORD', 'TACACS UID', 'OUTPUT MARKING', 'TTYLOC', '3270 REGIME',
    'X.3 PAD', 'NAWS', 'TSPEED', 'LFLOW', 'LINEMODE', 'XDISPLOC', 'OLD-ENVIRON',
    'AUTHENTICATION', 'ENCRYPT', 'NEW-ENVIRON', nil);
  TELOPT_FIRST = TELOPT_BINARY;
  TELOPT_LAST = TELOPT_NEW_ENVIRON;

function TELOPT_OK(x: DWord): boolean;
function TELOPT(x: longint): pchar;

const
  TELQUAL_IS = 0;
  TELQUAL_SEND = 1;
  TELQUAL_INFO = 2;
  TELQUAL_REPLY = 2;
  TELQUAL_NAME = 3;
  LFLOW_OFF = 0;
  LFLOW_ON = 1;
  LFLOW_RESTART_ANY = 2;
  LFLOW_RESTART_XON = 3;
  LM_MODE = 1;
  LM_FORWARDMASK = 2;
  LM_SLC = 3;
  MODE_EDIT = $01;
  MODE_TRAPSIG = $02;
  MODE_ACK = $04;
  MODE_SOFT_TAB = $08;
  MODE_LIT_ECHO = $10;
  MODE_MASK = $1f;
  MODE_FLOW = $0100;
  MODE_ECHO = $0200;
  MODE_INBIN = $0400;
  MODE_OUTBIN = $0800;
  MODE_FORCE = $1000;
  SLC_SYNCH = 1;
  SLC_BRK = 2;
  SLC_IP = 3;
  SLC_AO = 4;
  SLC_AYT = 5;
  SLC_EOR = 6;
  SLC_ABORT = 7;
  SLC_EOF = 8;
  SLC_SUSP = 9;
  SLC_EC = 10;
  SLC_EL = 11;
  SLC_EW = 12;
  SLC_RP = 13;
  SLC_LNEXT = 14;
  SLC_XON = 15;
  SLC_XOFF = 16;
  SLC_FORW1 = 17;
  SLC_FORW2 = 18;
  NSLC = 18;

const
  slc_names: array[0..19] of pansichar = (
    '0', 'SYNCH', 'BRK', 'IP', 'AO', 'AYT', 'EOR', 'ABORT', 'EOF', 'SUSP', 'EC',
    'EL', 'EW', 'RP', 'LNEXT', 'XON', 'XOFF', 'FORW1', 'FORW2', nil);

function SLC_NAME_OK(x: DWord): boolean;
function SLC_NAME(x: longint): pchar;

const
  SLC_NOSUPPORT = 0;
  SLC_CANTCHANGE = 1;
  SLC_VARIABLE = 2;
  SLC_DEFAULT = 3;
  SLC_LEVELBITS = $03;
  SLC_FUNC = 0;
  SLC_FLAGS = 1;
  SLC_VALUE = 2;
  SLC_ACK = $80;
  SLC_FLUSHIN = $40;
  SLC_FLUSHOUT = $20;
  OLD_ENV_VAR = 1;
  OLD_ENV_VALUE = 0;
  NEW_ENV_VAR = 0;
  NEW_ENV_VALUE = 1;
  ENV_ESC = 2;
  ENV_USERVAR = 3;
  AUTH_WHO_CLIENT = 0;
  AUTH_WHO_SERVER = 1;
  AUTH_WHO_MASK = 1;
  AUTH_HOW_ONE_WAY = 0;
  AUTH_HOW_MUTUAL = 2;
  AUTH_HOW_MASK = 2;
  AUTHTYPE_NULL = 0;
  AUTHTYPE_KERBEROS_V4 = 1;
  AUTHTYPE_KERBEROS_V5 = 2;
  AUTHTYPE_SPX = 3;
  AUTHTYPE_MINK = 4;
  AUTHTYPE_CNT = 5;
  AUTHTYPE_TEST = 99;

const
  authtype_names: array[0..5] of pansichar = ('NULL', 'KERBEROS_V4', 'KERBEROS_V5', 'SPX', 'MINK', nil);

function AUTHTYPE_NAME_OK(x: DWord): boolean;
function AUTHTYPE_NAME(x: longint): pchar;

const
  ENCRYPT_IS = 0;
  ENCRYPT_SUPPORT = 1;
  ENCRYPT_REPLY = 2;
  ENCRYPT_START = 3;
  ENCRYPT_END = 4;
  ENCRYPT_REQSTART = 5;
  ENCRYPT_REQEND = 6;
  ENCRYPT_ENC_KEYID = 7;
  ENCRYPT_DEC_KEYID = 8;
  ENCRYPT_CNT = 9;
  ENCTYPE_ANY = 0;
  ENCTYPE_DES_CFB64 = 1;
  ENCTYPE_DES_OFB64 = 2;
  ENCTYPE_CNT = 3;

const
  encrypt_names: array[0..9] of pansichar = (
    'IS', 'SUPPORT', 'REPLY', 'START', 'END', 'REQUEST-START', 'REQUEST-END', 'ENC-KEYID', 'DEC-KEYID', nil);
  enctype_names: array[0..3] of pansichar = ('ANY', 'DES_CFB64', 'DES_OFB64', nil);

function ENCRYPT_NAME_OK(x: DWord): boolean;
function ENCRYPT_NAME(x: longint): pchar;
function ENCTYPE_NAME_OK(x: DWord): boolean;
function ENCTYPE_NAME(x: longint): pchar;


implementation

// /usr/include/arpa/nameser.h

function ns_msg_id(handle: T_ns_msg): longint;
begin
  ns_msg_id := (handle._id) + 0;
end;

function ns_msg_base(handle: T_ns_msg): pbyte;
begin
  ns_msg_base := (handle._msg) + 0;
end;

function ns_msg_end(handle: T_ns_msg): pbyte;
begin
  ns_msg_end := (handle._eom) + 0;
end;

function ns_msg_size(handle: T_ns_msg): longint;
begin
  ns_msg_size := (handle._eom) - (handle._msg);
end;

function ns_msg_count(handle: T_ns_msg; section: longint): longint;
begin
  ns_msg_count := handle._counts[section] + 0;
end;

function ns_rr_name(rr: T_ns_rr): pchar;
begin
  if (rr.name[0]) <> '\0' then begin
    Result := rr.name;
  end else begin
    Result := '.';
  end;
end;

function ns_rr_type(rr: T_ns_rr): Tns_type;
begin
  ns_rr_type := Tns_type((rr._type) + 0);
end;

function ns_rr_class(rr: T_ns_rr): Tns_class;
begin
  ns_rr_class := Tns_class((rr.rr_class) + 0);
end;

function ns_rr_ttl(rr: T_ns_rr): longint;
begin
  ns_rr_ttl := (rr.ttl) + 0;
end;

function ns_rr_rdlen(rr: T_ns_rr): longint;
begin
  ns_rr_rdlen := (rr.rdlength) + 0;
end;

function ns_rr_rdata(rr: T_ns_rr): pbyte;
begin
  ns_rr_rdata := (rr.rdata) + 0;
end;


// /usr/include/arpa/telnet.h

function TELCMD_OK(x: DWord): boolean;
begin
  TELCMD_OK := (dword(x) <= TELCMD_LAST) and (dword(x) >= TELCMD_FIRST);
end;

function TELCMD(x: longint): pchar;
begin
  TELCMD := telcmds[x - TELCMD_FIRST];
end;

function TELOPT_OK(x: DWord): boolean;
begin
  TELOPT_OK := (dword(x)) <= TELOPT_LAST;
end;

function TELOPT(x: longint): pchar;
begin
  TELOPT := telopts[x - TELOPT_FIRST];
end;

function SLC_NAME_OK(x: DWord): boolean;
begin
  SLC_NAME_OK := (dword(x)) <= NSLC;
end;

function SLC_NAME(x: longint): pchar;
begin
  SLC_NAME := slc_names[x];
end;

function AUTHTYPE_NAME_OK(x: DWord): boolean;
begin
  AUTHTYPE_NAME_OK := (dword(x)) < AUTHTYPE_CNT;
end;

function AUTHTYPE_NAME(x: longint): pchar;
begin
  AUTHTYPE_NAME := authtype_names[x];
end;

function ENCRYPT_NAME_OK(x: DWord): boolean;
begin
  ENCRYPT_NAME_OK := (dword(x)) < ENCRYPT_CNT;
end;

function ENCRYPT_NAME(x: longint): pchar;
begin
  ENCRYPT_NAME := encrypt_names[x];
end;

function ENCTYPE_NAME_OK(x: DWord): boolean;
begin
  ENCTYPE_NAME_OK := (dword(x)) < ENCTYPE_CNT;
end;

function ENCTYPE_NAME(x: longint): pchar;
begin
  ENCTYPE_NAME := enctype_names[x];
end;



end.
