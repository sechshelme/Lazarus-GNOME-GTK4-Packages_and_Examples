unit nameser_compat;

interface

uses
  ctypes, nameser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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


  // === Konventiert am: 13-8-25 19:42:55 ===


implementation


end.
