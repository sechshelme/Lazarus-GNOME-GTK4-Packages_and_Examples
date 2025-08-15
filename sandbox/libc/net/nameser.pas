unit nameser;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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



// === Konventiert am: 13-8-25 19:42:52 ===


implementation

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


end.
