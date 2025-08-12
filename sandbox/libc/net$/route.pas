unit route;

interface

uses
  clib, fp_socket, fp_netinet;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

  // === Konventiert am: 12-8-25 17:05:59 ===


implementation


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
