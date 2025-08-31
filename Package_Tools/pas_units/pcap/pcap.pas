unit pcap;

interface

uses
  fp_socket, fp_pcap, pcap_inttypes, bpf, socket_;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  PCAP_VERSION_MAJOR = 2;  
  PCAP_VERSION_MINOR = 4;  
  PCAP_ERRBUF_SIZE = 256;  
type
  Pbpf_int32 = ^Tbpf_int32;
  Tbpf_int32 = longint;

  Pbpf_u_int32 = ^Tbpf_u_int32;
  Tbpf_u_int32 = Tu_int;
type
   Ppcap_t=type Pointer;
  Ppcap_dumper_t=type Pointer;
  Ppcap_addr_t=type Pointer;

  Tpcap_file_header = record
      magic : Tbpf_u_int32;
      version_major : Tu_short;
      version_minor : Tu_short;
      thiszone : Tbpf_int32;
      sigfigs : Tbpf_u_int32;
      snaplen : Tbpf_u_int32;
      linktype : Tbpf_u_int32;
    end;
  Ppcap_file_header = ^Tpcap_file_header;

function LT_FCS_LENGTH_PRESENT(x : DWord) : DWord;
function LT_FCS_LENGTH(x : DWord) : DWord;
function LT_FCS_DATALINK_EXT(x : DWord) : DWord;

type
  Ppcap_direction_t = ^Tpcap_direction_t;
  Tpcap_direction_t =  Longint;
  Const
    PCAP_D_INOUT = 0;
    PCAP_D_IN = 1;
    PCAP_D_OUT = 2;
type
  Tpcap_pkthdr = record
      ts : Ttimeval;
      caplen : Tbpf_u_int32;
      len : Tbpf_u_int32;
    end;
  Ppcap_pkthdr = ^Tpcap_pkthdr;
  PPpcap_pkthdr = ^Ppcap_pkthdr;

type
  Tpcap_stat = record
      ps_recv : Tu_int;
      ps_drop : Tu_int;
      ps_ifdrop : Tu_int;
      ps_capt : Tu_int;
      ps_sent : Tu_int;
      ps_netdrop : Tu_int;
    end;
  Ppcap_stat = ^Tpcap_stat;

type
  Ppcap_addr = ^Tpcap_addr;
  Tpcap_addr = record
      next : Ppcap_addr;
      addr : Psockaddr;
      netmask : Psockaddr;
      broadaddr : Psockaddr;
      dstaddr : Psockaddr;
    end;

type
  Ppcap_if = ^Tpcap_if;
  Tpcap_if = record
      next : Ppcap_if;
      name : Pchar;
      description : Pchar;
      addresses : Ppcap_addr;
      flags : Tbpf_u_int32;
    end;
  Ppcap_if_t=^Tpcap_if;
  PPpcap_if_t=^Ppcap_if_t;


const
  PCAP_IF_LOOPBACK = $00000001;  
  PCAP_IF_UP = $00000002;
  PCAP_IF_RUNNING = $00000004;
  PCAP_IF_WIRELESS = $00000008;
  PCAP_IF_CONNECTION_STATUS = $00000030;
  PCAP_IF_CONNECTION_STATUS_UNKNOWN = $00000000;
  PCAP_IF_CONNECTION_STATUS_CONNECTED = $00000010;
  PCAP_IF_CONNECTION_STATUS_DISCONNECTED = $00000020;
  PCAP_IF_CONNECTION_STATUS_NOT_APPLICABLE = $00000030;
type
  Tpcap_handler = procedure (args:Pu_char; header:Ppcap_pkthdr; packet:Pu_char);cdecl;
const
  PCAP_ERROR = -(1);  
  PCAP_ERROR_BREAK = -(2);
  PCAP_ERROR_NOT_ACTIVATED = -(3);
  PCAP_ERROR_ACTIVATED = -(4);
  PCAP_ERROR_NO_SUCH_DEVICE = -(5);
  PCAP_ERROR_RFMON_NOTSUP = -(6);
  PCAP_ERROR_NOT_RFMON = -(7);
  PCAP_ERROR_PERM_DENIED = -(8);
  PCAP_ERROR_IFACE_NOT_UP = -(9);
  PCAP_ERROR_CANTSET_TSTAMP_TYPE = -(10);
  PCAP_ERROR_PROMISC_PERM_DENIED = -(11);
  PCAP_ERROR_TSTAMP_PRECISION_NOTSUP = -(12);
  PCAP_WARNING = 1;
  PCAP_WARNING_PROMISC_NOTSUP = 2;
  PCAP_WARNING_TSTAMP_TYPE_NOTSUP = 3;
  PCAP_NETMASK_UNKNOWN = $ffffffff;
  PCAP_CHAR_ENC_LOCAL = $00000000;
  PCAP_CHAR_ENC_UTF_8 = $00000001;

function pcap_init(para1:dword; para2:Pchar):longint;cdecl;external libpcap;
function pcap_lookupdev(para1:Pchar):Pchar;cdecl;external libpcap;
function pcap_lookupnet(para1:Pchar; para2:Pbpf_u_int32; para3:Pbpf_u_int32; para4:Pchar):longint;cdecl;external libpcap;
function pcap_create(para1:Pchar; para2:Pchar):Ppcap_t;cdecl;external libpcap;
function pcap_set_snaplen(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_set_promisc(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_can_set_rfmon(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_set_rfmon(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_set_timeout(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_set_tstamp_type(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_set_immediate_mode(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_set_buffer_size(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_set_tstamp_precision(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
function pcap_get_tstamp_precision(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_activate(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_list_tstamp_types(para1:Ppcap_t; para2:PPlongint):longint;cdecl;external libpcap;
procedure pcap_free_tstamp_types(para1:Plongint);cdecl;external libpcap;
function pcap_tstamp_type_name_to_val(para1:Pchar):longint;cdecl;external libpcap;
function pcap_tstamp_type_val_to_name(para1:longint):Pchar;cdecl;external libpcap;
function pcap_tstamp_type_val_to_description(para1:longint):Pchar;cdecl;external libpcap;

{$ifdef linux}
function pcap_set_protocol_linux(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
{$endif}

const
  PCAP_TSTAMP_HOST = 0;  
  PCAP_TSTAMP_HOST_LOWPREC = 1;
  PCAP_TSTAMP_HOST_HIPREC = 2;
  PCAP_TSTAMP_ADAPTER = 3;
  PCAP_TSTAMP_ADAPTER_UNSYNCED = 4;
  PCAP_TSTAMP_HOST_HIPREC_UNSYNCED = 5;
  PCAP_TSTAMP_PRECISION_MICRO = 0;
  PCAP_TSTAMP_PRECISION_NANO = 1;

function pcap_open_live(para1:Pchar; para2:longint; para3:longint; para4:longint; para5:Pchar):Ppcap_t;cdecl;external libpcap;
function pcap_open_dead(para1:longint; para2:longint):Ppcap_t;cdecl;external libpcap;
function pcap_open_dead_with_tstamp_precision(para1:longint; para2:longint; para3:Tu_int):Ppcap_t;cdecl;external libpcap;
function pcap_open_offline_with_tstamp_precision(para1:Pchar; para2:Tu_int; para3:Pchar):Ppcap_t;cdecl;external libpcap;
function pcap_open_offline(para1:Pchar; para2:Pchar):Ppcap_t;cdecl;external libpcap;

{$ifdef windows}
function pcap_hopen_offline_with_tstamp_precision(para1:Tintptr_t; para2:Tu_int; para3:Pchar):Ppcap_t;cdecl;external libpcap;
function pcap_hopen_offline(para1:Tintptr_t; para2:Pchar):Ppcap_t;cdecl;external libpcap;
{$else}
function pcap_fopen_offline_with_tstamp_precision(para1:PFILE; para2:Tu_int; para3:Pchar):Ppcap_t;cdecl;external libpcap;
function pcap_fopen_offline(para1:PFILE; para2:Pchar):Ppcap_t;cdecl;external libpcap;
{$endif}

procedure pcap_close(para1:Ppcap_t);cdecl;external libpcap;
function pcap_loop(para1:Ppcap_t; para2:longint; para3:Tpcap_handler; para4:Pu_char):longint;cdecl;external libpcap;
function pcap_dispatch(para1:Ppcap_t; para2:longint; para3:Tpcap_handler; para4:Pu_char):longint;cdecl;external libpcap;
function pcap_next(para1:Ppcap_t; para2:Ppcap_pkthdr):Pu_char;cdecl;external libpcap;
function pcap_next_ex(para1:Ppcap_t; para2:PPpcap_pkthdr; para3:PPu_char):longint;cdecl;external libpcap;
procedure pcap_breakloop(para1:Ppcap_t);cdecl;external libpcap;
function pcap_stats(para1:Ppcap_t; para2:Ppcap_stat):longint;cdecl;external libpcap;
function pcap_setfilter(para1:Ppcap_t; para2:Pbpf_program):longint;cdecl;external libpcap;
function pcap_setdirection(para1:Ppcap_t; para2:Tpcap_direction_t):longint;cdecl;external libpcap;
function pcap_getnonblock(para1:Ppcap_t; para2:Pchar):longint;cdecl;external libpcap;
function pcap_setnonblock(para1:Ppcap_t; para2:longint; para3:Pchar):longint;cdecl;external libpcap;
function pcap_inject(para1:Ppcap_t; para2:pointer; para3:Tsize_t):longint;cdecl;external libpcap;
function pcap_sendpacket(para1:Ppcap_t; para2:Pu_char; para3:longint):longint;cdecl;external libpcap;
function pcap_statustostr(para1:longint):Pchar;cdecl;external libpcap;
function pcap_strerror(para1:longint):Pchar;cdecl;external libpcap;
function pcap_geterr(para1:Ppcap_t):Pchar;cdecl;external libpcap;
procedure pcap_perror(para1:Ppcap_t; para2:Pchar);cdecl;external libpcap;
function pcap_compile(para1:Ppcap_t; para2:Pbpf_program; para3:Pchar; para4:longint; para5:Tbpf_u_int32):longint;cdecl;external libpcap;
function pcap_compile_nopcap(para1:longint; para2:longint; para3:Pbpf_program; para4:Pchar; para5:longint;            para6:Tbpf_u_int32):longint;cdecl;external libpcap;deprecated 'use pcap_open_dead(), pcap_compile() and pcap_close()';
procedure pcap_freecode(para1:Pbpf_program);cdecl;external libpcap;
function pcap_offline_filter(para1:Pbpf_program; para2:Ppcap_pkthdr; para3:Pu_char):longint;cdecl;external libpcap;
function pcap_datalink(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_datalink_ext(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_list_datalinks(para1:Ppcap_t; para2:PPlongint):longint;cdecl;external libpcap;
function pcap_set_datalink(para1:Ppcap_t; para2:longint):longint;cdecl;external libpcap;
procedure pcap_free_datalinks(para1:Plongint);cdecl;external libpcap;
function pcap_datalink_name_to_val(para1:Pchar):longint;cdecl;external libpcap;
function pcap_datalink_val_to_name(para1:longint):Pchar;cdecl;external libpcap;
function pcap_datalink_val_to_description(para1:longint):Pchar;cdecl;external libpcap;
function pcap_datalink_val_to_description_or_dlt(para1:longint):Pchar;cdecl;external libpcap;
function pcap_snapshot(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_is_swapped(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_major_version(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_minor_version(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_bufsize(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_file(para1:Ppcap_t):PFILE;cdecl;external libpcap;

{$ifdef windows}
function pcap_fileno(para1:Ppcap_t):longint;cdecl;external libpcap;
{$else}
function pcap_fileno(para1:Ppcap_t):longint;cdecl;external libpcap;
{$endif}

{$ifdef windows}
function pcap_wsockinit:longint;cdecl;external libpcap;
{$endif}

function pcap_dump_open(para1:Ppcap_t; para2:Pchar):Ppcap_dumper_t;cdecl;external libpcap;

{$ifdef windows}
function pcap_dump_hopen(para1:Ppcap_t; para2:Tintptr_t):Ppcap_dumper_t;cdecl;external libpcap;
{$else}
function pcap_dump_fopen(para1:Ppcap_t; fp:PFILE):Ppcap_dumper_t;cdecl;external libpcap;
{$endif}

function pcap_dump_open_append(para1:Ppcap_t; para2:Pchar):Ppcap_dumper_t;cdecl;external libpcap;
function pcap_dump_file(para1:Ppcap_dumper_t):PFILE;cdecl;external libpcap;
function pcap_dump_ftell(para1:Ppcap_dumper_t):longint;cdecl;external libpcap;
function pcap_dump_ftell64(para1:Ppcap_dumper_t):Tint64_t;cdecl;external libpcap;
function pcap_dump_flush(para1:Ppcap_dumper_t):longint;cdecl;external libpcap;
procedure pcap_dump_close(para1:Ppcap_dumper_t);cdecl;external libpcap;
procedure pcap_dump(para1:Pu_char; para2:Ppcap_pkthdr; para3:Pu_char);cdecl;external libpcap;
function pcap_findalldevs(para1:PPpcap_if_t; para2:Pchar):longint;cdecl;external libpcap;
procedure pcap_freealldevs(para1:Ppcap_if_t);cdecl;external libpcap;
function pcap_lib_version:Pchar;cdecl;external libpcap;

{$ifdef windows}
type
  Tpcap_send_queue = record
      maxlen : Tu_int;cdecl;
      len : Tu_int;
      buffer : Pchar;
    end;
  Ppcap_send_queue = ^Tpcap_send_queue;

type
  PPAirpcapHandle = ^TPAirpcapHandle;
  TPAirpcapHandle = PAirpcapHandle;

function pcap_setbuff(p:Ppcap_t; dim:longint):longint;cdecl;external libpcap;
function pcap_setmode(p:Ppcap_t; mode:longint):longint;cdecl;external libpcap;
function pcap_setmintocopy(p:Ppcap_t; size:longint):longint;cdecl;external libpcap;
function pcap_getevent(p:Ppcap_t):THANDLE;cdecl;external libpcap;
function pcap_oid_get_request(para1:Ppcap_t; para2:Tbpf_u_int32; para3:pointer; para4:Psize_t):longint;cdecl;external libpcap;
function pcap_oid_set_request(para1:Ppcap_t; para2:Tbpf_u_int32; para3:pointer; para4:Psize_t):longint;cdecl;external libpcap;
function pcap_sendqueue_alloc(memsize:Tu_int):Ppcap_send_queue;cdecl;external libpcap;
procedure pcap_sendqueue_destroy(queue:Ppcap_send_queue);cdecl;external libpcap;
function pcap_sendqueue_queue(queue:Ppcap_send_queue; pkt_header:Ppcap_pkthdr; pkt_data:Pu_char):longint;cdecl;external libpcap;
function pcap_sendqueue_transmit(p:Ppcap_t; queue:Ppcap_send_queue; sync:longint):Tu_int;cdecl;external libpcap;
function pcap_stats_ex(p:Ppcap_t; pcap_stat_size:Plongint):Ppcap_stat;cdecl;external libpcap;
function pcap_setuserbuffer(p:Ppcap_t; size:longint):longint;cdecl;external libpcap;
function pcap_live_dump(p:Ppcap_t; filename:Pchar; maxsize:longint; maxpacks:longint):longint;cdecl;external libpcap;
function pcap_live_dump_ended(p:Ppcap_t; sync:longint):longint;cdecl;external libpcap;
function pcap_start_oem(err_str:Pchar; flags:longint):longint;cdecl;external libpcap;
function pcap_get_airpcap_handle(p:Ppcap_t):TPAirpcapHandle;cdecl;external libpcap;
const
  MODE_CAPT = 0;  
  MODE_STAT = 1;  
  MODE_MON = 2;  

{$else}
function pcap_get_selectable_fd(para1:Ppcap_t):longint;cdecl;external libpcap;
function pcap_get_required_select_timeout(para1:Ppcap_t):Ptimeval;cdecl;external libpcap;
{$endif}

const
  PCAP_BUF_SIZE = 1024;  
  PCAP_SRC_FILE = 2;
  PCAP_SRC_IFLOCAL = 3;
  PCAP_SRC_IFREMOTE = 4;
  PCAP_SRC_FILE_STRING = 'file://';
  PCAP_SRC_IF_STRING = 'rpcap://';
  PCAP_OPENFLAG_PROMISCUOUS = $00000001;
  PCAP_OPENFLAG_DATATX_UDP = $00000002;
  PCAP_OPENFLAG_NOCAPTURE_RPCAP = $00000004;
  PCAP_OPENFLAG_NOCAPTURE_LOCAL = $00000008;
  PCAP_OPENFLAG_MAX_RESPONSIVENESS = $00000010;
  RPCAP_RMTAUTH_NULL = 0;
  RPCAP_RMTAUTH_PWD = 1;
type
  Tpcap_rmtauth = record
      _type : longint;
      username : Pchar;
      password : Pchar;
    end;
  Ppcap_rmtauth = ^Tpcap_rmtauth;

function pcap_open(source:Pchar; snaplen:longint; flags:longint; read_timeout:longint; auth:Ppcap_rmtauth;
           errbuf:Pchar):Ppcap_t;cdecl;external libpcap;
function pcap_createsrcstr(source:Pchar; _type:longint; host:Pchar; port:Pchar; name:Pchar; 
           errbuf:Pchar):longint;cdecl;external libpcap;
function pcap_parsesrcstr(source:Pchar; _type:Plongint; host:Pchar; port:Pchar; name:Pchar; 
           errbuf:Pchar):longint;cdecl;external libpcap;
function pcap_findalldevs_ex(source:Pchar; auth:Ppcap_rmtauth; alldevs:PPpcap_if_t; errbuf:Pchar):longint;cdecl;external libpcap;
const
  PCAP_SAMP_NOSAMP = 0;  
  PCAP_SAMP_1_EVERY_N = 1;
  PCAP_SAMP_FIRST_AFTER_N_MS = 2;
type
  Tpcap_samp = record
      method : longint;
      value : longint;
    end;
  Ppcap_samp = ^Tpcap_samp;

function pcap_setsampling(p:Ppcap_t):Ppcap_samp;cdecl;external libpcap;
const
  RPCAP_HOSTLIST_SIZE = 1024;  

function pcap_remoteact_accept(address:Pchar; port:Pchar; hostlist:Pchar; connectinghost:Pchar; auth:Ppcap_rmtauth; 
           errbuf:Pchar):TSOCKET;cdecl;external libpcap;
function pcap_remoteact_accept_ex(address:Pchar; port:Pchar; hostlist:Pchar; connectinghost:Pchar; auth:Ppcap_rmtauth; 
           uses_ssl:longint; errbuf:Pchar):TSOCKET;cdecl;external libpcap;
function pcap_remoteact_list(hostlist:Pchar; sep:char; size:longint; errbuf:Pchar):longint;cdecl;external libpcap;
function pcap_remoteact_close(host:Pchar; errbuf:Pchar):longint;cdecl;external libpcap;
procedure pcap_remoteact_cleanup;cdecl;external libpcap;

// === Konventiert am: 30-8-25 19:14:12 ===


implementation


function LT_FCS_LENGTH_PRESENT(x: DWord): DWord;
begin
  LT_FCS_LENGTH_PRESENT:=x and $04000000;
end;

function LT_FCS_LENGTH(x: DWord): DWord;
begin
  LT_FCS_LENGTH:=(x and $F0000000) shr 28;
end;

function LT_FCS_DATALINK_EXT(x: DWord): DWord;
begin
  LT_FCS_DATALINK_EXT:=((x and $F) shl 28) or $04000000;
end;



end.
