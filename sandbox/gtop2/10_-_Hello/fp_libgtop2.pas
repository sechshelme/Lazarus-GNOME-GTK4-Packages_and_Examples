unit fp_libgtop2;

interface

uses
fp_glib2;

const
  {$IFDEF unix}
  libgtop2 = 'libgtop-2.0';
  {$ENDIF}

  {$IFDEF mswindows}
  libgtop2 = 'libgtop-2.0.dll'; // ?????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}
type
  Tgid_t=UInt32;

type
  Tglibtop_sysdeps = record
    flags: Tguint64;
    features: Tguint64;
    cpu: Tguint64;
    mem: Tguint64;
    swap: Tguint64;
    uptime: Tguint64;
    loadavg: Tguint64;
    shm_limits: Tguint64;
    msg_limits: Tguint64;
    sem_limits: Tguint64;
    proclist: Tguint64;
    proc_state: Tguint64;
    proc_uid: Tguint64;
    proc_mem: Tguint64;
    proc_time: Tguint64;
    proc_signal: Tguint64;
    proc_kernel: Tguint64;
    proc_segment: Tguint64;
    proc_args: Tguint64;
    proc_map: Tguint64;
    proc_open_files: Tguint64;
    mountlist: Tguint64;
    fsusage: Tguint64;
    netlist: Tguint64;
    netload: Tguint64;
    ppp: Tguint64;
    proc_wd: Tguint64;
    proc_affinity: Tguint64;
    proc_io: Tguint64;
    disk: Tguint64;
    reserved1: Tguint64;
    reserved2: Tguint64;
    reserved3: Tguint64;
    reserved4: Tguint64;
    reserved5: Tguint64;
    reserved6: Tguint64;
    reserved7: Tguint64;
  end;
  Pglibtop_sysdeps = ^Tglibtop_sysdeps;



  {$DEFINE read_interface}
//  {$include fp_libgtop2_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_libgtop2_includes.inc}
{$UNDEF read_interface}

end.

