unit fp_pcap;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF linux}
  libpcap = 'libpcap';
  {$ENDIF}

  {$IFDEF windows}
  libpcap = 'libpcap.dll';  // ??????
  {$ENDIF}

type
  Tu_char=UInt8;
  Pu_char=^Tu_char;
  PPu_char=^Pu_char;

  Tu_short=UInt16;

  Tu_int=UInt32;

  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  PFILE=type Pointer;

  Paddrinfo=Pointer; // ??????????????????????


type  // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
  Ttimeval = record
    tv_sec: int64;
    tv_usec: int64;
  end;
  Ptimeval = ^Ttimeval;



implementation

end.
