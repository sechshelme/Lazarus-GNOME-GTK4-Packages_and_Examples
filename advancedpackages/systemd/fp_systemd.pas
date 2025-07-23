unit fp_systemd;

{$modeswitch typehelpers}
{$J-}

interface

uses
  clib, fp_stdio, fp_signal, fp_inotify;

const
  libsystemd = 'libsystemd';

type // /usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h
  Piovec = Pointer;

type // /usr/include/linux/signalfd.h
  Psignalfd_siginfo = Pointer;

type // /usr/include/x86_64-linux-gnu/bits/struct_stat.h
  Pstat = Pointer;

type // /usr/include/x86_64-linux-gnu/bits/types/clockid_t.h
  Tclockid_t = int32;
  Pclockid_t = ^Tclockid_t;


  //type                            // ???????????
  //// Ein Typ, der die 128-Bit (16 Bytes) ID repräsentiert
  //Tsd_id128_t = array[0..15] of Byte;
  //Psd_id128_t=^Tsd_id128_t;

  {$DEFINE read_interface}
  {$include fp_systemd_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_systemd_includes.inc}
{$UNDEF read_implementation}
end.
