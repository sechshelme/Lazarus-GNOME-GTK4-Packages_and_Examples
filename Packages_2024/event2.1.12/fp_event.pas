unit fp_event;

interface

uses
  clib;//, fp_time;

const
  {$IFDEF linux}
  libevent = 'libevent';
  {$ENDIF}

  {$IFDEF windows}
  libevent = 'libevent-7.dll';
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
  Tclong = int32;
  {$ENDIF}

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

type // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
  Ttimeval = record
    tv_sec: int64;
    tv_usec: int64;
  end;
  Ptimeval = ^Ttimeval;

type
  PFILE = type Pointer;
  Tva_list = Pointer; // ???????

  Pevdns_server_port = Pointer; // Herkunft unbekannt
  Pbufferevent_ops = Pointer;   // Herkunft unbekannt


  {$DEFINE read_interface}
  {$include fp_event_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_event_includes.inc}
{$UNDEF read_implementation}

end.
