unit clib;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF linux}
  libc = 'c';
  libm = 'm';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  libm = 'msvcrt.dll';
  {$ENDIF}

  {$IFDEF darwin}
  libc = 'libc.dylib';
  libm = 'libc.dylib';
  {$ENDIF}

type
  PPuint16 = ^PUInt16;
  PPint32 = ^PInt32;

type
  Tlong_double = extended;
  Plong_double = ^Tlong_double;

  TFloat16 = Pointer; // ????
  TFloat32 = Pointer; // ????
  TFloat64 = Pointer; // ????
  TFloat128 = Pointer; // ????
  TFloat16x = Pointer; // ????
  TFloat32x = Pointer; // ????
  TFloat64x = Pointer; // ????
  TFloat128x = Pointer; // ????

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;


  Tu8=uint8;
  Pu8=^Tu8;
  Tbe16=int16;


  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Tgnuc_va_list = Pointer; // ????????????
  Tva_list = Pointer;      // ????????????

  Tsocklen_t = SizeInt;

  Pnetent = Pointer;   // /usr/include/x86_64-linux-gnu/bits/netdb.h
  PPnetent = ^Pnetent;

  Tsa_family_t = word;      // sys/socket.h
  Psockaddr = Pointer;    // sys/socket.h

  Psigevent = Pointer; //  <signal.h>

  Psigstack = Pointer;  // /usr/include/x86_64-linux-gnu/bits/types/stack_t.h

type
  Toff_t = SizeInt;
  Poff_t = ^Toff_t;

  Toff64_t = SizeInt;
  Poff64_t = ^Toff64_t;

  Tfpos64_t = SizeInt;
  Pfpos64_t = ^Tfpos64_t;

  Tfpos_t = longint;
  Pfpos_t = ^Tfpos_t;

  Twchar_t = widechar;
  Pwchar_t = ^Twchar_t;
  PPwchar_t = ^Pwchar_t;

  PFILE = Pointer;

type // /usr/include/x86_64-linux-gnu/bits/types.h
  Tino_t=uint64 ;
  Tmode_t=UInt32;
  Tnlink_t=UInt64;
  Tblksize_t=Int64;
  Tblkcnt_t=Int64;
  Tsyscall_slong_t=Int64;


  // /usr/include/asm-generic/bitsperlong.h
const
  {$IFDEF CPU64}
  __BITS_PER_LONG = 64;
  {$ELSE}
  __BITS_PER_LONG = 32;
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/inotify.h
  IN_CLOEXEC = &02000000;
  IN_NONBLOCK = &00004000;

  // /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h
  O_CLOEXEC = &02000000;
  O_NONBLOCK = &04000;


type  // unistd.h
  Tpid_t = uint32;
  Ppid_t = ^Tpid_t;

  Tuid_t = uint32;
  Puid_t = ^Tuid_t;
  PPuid_t = ^Puid_t;

  Tgid_t = uint32;
  Pgid_t = ^Tgid_t;
  PPgid_t = ^Pgid_t;

type // /usr/include/x86_64-linux-gnu/sys/types.h
  Tdev_t = uint64;
  Pdev_t = ^Tdev_t;

type // /usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h
  TIovec = record
    iov_base: Pointer;
    iov_len: SizeUInt;
  end;
  PIovec = ^TIovec;

type
  // /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h
  Tsiginfo_t = record
  end;
  Psiginfo_t = ^Tsiginfo_t;

  // /usr/include/x86_64-linux-gnu/bits/types/sigset_t.h
  Tsigset_t = record
    val: array[0..16 - 1] of uint64
    //    a: array[0..127] of char;
  end;
  Psigset_t = ^Tsigset_t;

  // /usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h
  TSigVal = record
    case integer of
      0: (sival_int: integer);
      1: (sival_ptr: Pointer);
  end;

  // /usr/include/x86_64-linux-gnu/bits/sigcontext.h
  Tsigcontext = record
  end;
  Psigcontext = ^Tsigcontext;

  // /usr/include/x86_64-linux-gnu/bits/types/stack_t.h
  Tstack_t = record
  end;
  Pstack_t = ^Tstack_t;

  // /usr/include/asm-generic/signal-defs.h
  Tsigrestore_t = record  // ????????
  end;
  Psigrestore_t = ^Tsigrestore_t;

  // /usr/include/asm-generic/posix_types.h
  Tkernel_size_t = integer;   // ????????


  // /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
  Ttm = record
    tm_sec: longint;
    tm_min: longint;
    tm_hour: longint;
    tm_mday: longint;
    tm_mon: longint;
    tm_year: longint;
    tm_wday: longint;
    tm_yday: longint;
    tm_isdst: longint;
    tm_gmtoff: longint;
    tm_zone: pchar;
  end;
  Ptm = ^Ttm;

  // /usr/include/x86_64-linux-gnu/bits/types/locale_t.h
  Tlocale_t = Pointer;

  // /usr/include/x86_64-linux-gnu/bits/types/clockid_t.h
  Tclockid_t = int32;
  Pclockid_t = ^Tclockid_t;

  // /usr/include/x86_64-linux-gnu/bits/types/timer_t.h
  Ttimer_t = Pointer;
  Ptimer_t = ^Ttimer_t;

  // /usr/include/x86_64-linux-gnu/bits/types/time_t.h
  Ttime_t = UInt64;
  Ptime_t = ^Ttime_t;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h
  Ttimespec = record
    tv_sec: Ttime_t;
    tv_nsec: longint;
  end;
  Ptimespec = ^Ttimespec;

  ///usr/include/x86_64-linux-gnu/bits/types/clock_t.h
  Tclock_t = longint;
  Pclock_t = ^Tclock_t;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h
  Titimerspec = record
    it_interval: Ttimespec;
    it_value: Ttimespec;
  end;
  Pitimerspec = ^Titimerspec;

  // /usr/include/x86_64-linux-gnu/bits/timex.h
  Ptimex = type Pointer;

  // /usr/include/x86_64-linux-gnu/sys/procfs.h
  Tpsaddr_t = Pointer;

  // /usr/include/x86_64-linux-gnu/sys/procfs.h
  Tlwpid_t = Tpid_t;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
  Ttimeval = record
    tv_sec: int64;
    tv_usec: int64;
  end;

  // /usr/include/x86_64-linux-gnu/bits/procfs-prregset.h
  Telf_gregset_t = Pointer;

  // /usr/include/x86_64-linux-gnu/bits/procfs-id.h
  Tpr_uid_t = uint32;
  Tpr_gid_t = uint32;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_sched_param.h
  Tsched_param = record
    sched_priority: integer;
  end;
  Psched_param = ^Tsched_param;

  // /usr/include/x86_64-linux-gnu/bits/cpu-set.h
  Pcpu_set_t = type Pointer;

  // /usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h
  Pmbstate_t = type Pointer;


const  // /usr/include/x86_64-linux-gnu/sys/epoll.h
  EPOLLIN = 1;

const // /usr/include/linux/if_ether.h
  ETH_ALEN = 6;
  ETH_TLEN = 2;
  ETH_HLEN = 14;
  ETH_ZLEN = 60;
  ETH_DATA_LEN = 1500;
  ETH_FRAME_LEN = 1514;
  ETH_FCS_LEN = 4;

const // /usr/include/linux/if_fddi.h
  FDDI_K_ALEN = 6;

type // /usr/include/linux/if_arp.h
  Tarphdr = packed record
    ar_hrd: word;
    ar_pro: word;
    ar_hln: Tuint8_t;
    ar_pln: Tuint8_t;
    ar_op: word;
  end;
  Parphdr = ^Tarphdr;

  //type // /usr/include/net/ethernet.h
  //  Tether_addr = packed record
  //    ether_addr_octet: array[0..ETH_ALEN - 1] of Tuint8_t;
  //  end;
  //  Pether_addr = ^Tether_addr;


const  // /usr/include/linux/netlink.h
  NLMSG_OVERRUN = $4;

const // /usr/include/asm-generic/param.h
  HZ = 100;

type // /usr/include/linux/ppp_defs.h
  TNPmode = longint;

const
  NPMODE_PASS = 0;
  NPMODE_DROP = 1;
  NPMODE_ERROR = 2;
  NPMODE_QUEUE = 3;

type // /usr/include/x86_64-linux-gnu/bits/types.h
  Tcaddr_t = pchar;

type // Unbekannt
  Piface = Pointer;
  Pdst_key = Pointer;

type     // /usr/include/linux/ppp_defs.h
  Tpppstat = record
    ppp_discards: uint32;

    ppp_ibytes: uint32;
    ppp_ioctects: uint32;
    ppp_ipackets: uint32;
    ppp_ierrors: uint32;
    ppp_ilqrs: uint32;

    ppp_obytes: uint32;
    ppp_ooctects: uint32;
    ppp_opackets: uint32;
    ppp_oerrors: uint32;
    ppp_olqrs: uint32;
  end;

  Tvjstat = record
    vjs_packets: uint32;
    vjs_compressed: uint32;
    vjs_searches: uint32;
    vjs_misses: uint32;
    vjs_uncompressedin: uint32;
    vjs_compressedin: uint32;
    vjs_errorin: uint32;
    vjs_tossed: uint32;
  end;

  Tcompstat = record
    unc_bytes: uint32;
    unc_packets: uint32;
    comp_bytes: uint32;
    comp_packets: uint32;
    inc_bytes: uint32;
    inc_packets: uint32;

    in_count: uint32;
    bytes_out: uint32;

    ratio: double;
  end;

  Tppp_stats = record
    p: Tpppstat;
    vj: Tvjstat;
  end;

  Tppp_comp_stats = record
    c: Tcompstat;
    d: Tcompstat;
  end;



  // ------------



type
  Tcookie_read_function_t = function(cookie: Pointer; buf: Pointer; size: SizeInt): SizeInt; cdecl;
  Pcookie_read_function_t = ^Tcookie_read_function_t;
  Tcookie_write_function_t = function(cookie: Pointer; buf: Pointer; size: SizeInt): SizeInt; cdecl;
  Pcookie_write_function_t = ^Tcookie_write_function_t;
  Tcookie_seek_function_t = function(cookie: Pointer; offset: int64; whence: integer): integer; cdecl;
  Pcookie_seek_function_t = ^Tcookie_seek_function_t;
  Tcookie_close_function_t = function(cookie: Pointer): integer; cdecl;
  Pcookie_close_function_t = ^Tcookie_close_function_t;

  Tcookie_io_functions_t = record
    Read: Pcookie_read_function_t;
    Write: Pcookie_write_function_t;
    seek: Pcookie_seek_function_t;
    Close: Pcookie_close_function_t;
  end;

implementation

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  //  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
