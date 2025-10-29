unit fp_pcap;

interface

uses
  fp_socket;

const
  {$IFDEF linux}
  libpcap = 'libpcap';
  {$ENDIF}

  {$IFDEF windows}
  libpcap = 'libpcap.dll';  // ??????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  {$ENDIF}

type
  Tu_char = uint8;
  Pu_char = ^Tu_char;
  PPu_char = ^Pu_char;

  Tu_short = uint16;

  Tu_int = uint32;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

  Paddrinfo = Pointer; // ??????????????????????


type  // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
  Ttimeval = record
    tv_sec: int64;
    tv_usec: int64;
  end;
  Ptimeval = ^Ttimeval;

  {$DEFINE read_interface}
  {$include fp_pcap_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_pcap_includes.inc}
{$UNDEF read_interface}
end.
