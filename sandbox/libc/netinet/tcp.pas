unit tcp;

interface

uses
  clib, fp_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



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


  // === Konventiert am: 10-8-25 17:28:25 ===


implementation


end.
