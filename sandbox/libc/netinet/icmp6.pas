unit icmp6;

interface

uses
  clib, in_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

  // === Konventiert am: 10-8-25 17:27:59 ===


implementation




end.
