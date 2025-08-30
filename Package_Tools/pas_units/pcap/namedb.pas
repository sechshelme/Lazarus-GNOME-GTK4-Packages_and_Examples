unit namedb;

interface

uses
  fp_pcap, bpf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tpcap_etherent = record
    addr: array[0..5] of Tu_char;
    name: array[0..121] of char;
  end;
  Ppcap_etherent = ^Tpcap_etherent;

const
  PCAP_ETHERS_FILE = '/etc/ethers';

function pcap_next_etherent(para1: PFILE): Ppcap_etherent; cdecl; external libpcap;
function pcap_ether_hostton(para1: pchar): Pu_char; cdecl; external libpcap;
function pcap_ether_aton(para1: pchar): Pu_char; cdecl; external libpcap;
function pcap_nametoaddr(para1: pchar): PPbpf_u_int32; cdecl; external libpcap; deprecated 'this is not reentrant; use ''pcap_nametoaddrinfo'' instead';
function pcap_nametoaddrinfo(para1: pchar): Paddrinfo; cdecl; external libpcap;
function pcap_nametonetaddr(para1: pchar): Tbpf_u_int32; cdecl; external libpcap;
function pcap_nametoport(para1: pchar; para2: Plongint; para3: Plongint): longint; cdecl; external libpcap;
function pcap_nametoportrange(para1: pchar; para2: Plongint; para3: Plongint; para4: Plongint): longint; cdecl; external libpcap;
function pcap_nametoproto(para1: pchar): longint; cdecl; external libpcap;
function pcap_nametoeproto(para1: pchar): longint; cdecl; external libpcap;
function pcap_nametollc(para1: pchar): longint; cdecl; external libpcap;

const
  PROTO_UNDEF = -(1);

  // === Konventiert am: 30-8-25 19:14:07 ===


implementation



end.
