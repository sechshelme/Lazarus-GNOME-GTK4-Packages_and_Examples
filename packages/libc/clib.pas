unit clib;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF unix}
  libc = 'c';
  {$ENDIF}

  {$IFDEF mswindows}
  libc = 'msvcrt';
  {$ENDIF}

  {$IFDEF darwin}
  libc = 'libc.dylib';
  {$ENDIF}

  // /usr/include/asm-generic/bitsperlong.h
const
  {$IFDEF CPU64}
  __BITS_PER_LONG = 64;
  {$ELSE}
  __BITS_PER_LONG = 32;
  {$ENDIF}


  // fcntl.h
  IN_CLOEXEC = 02000000; /////
  IN_NONBLOCK = 00004000;     //////
  O_CLOEXEC=0; // ?????????'
  O_NONBLOCK=0;  // ??????



//  E2BIG=7;



type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Tgnuc_va_list=Pointer;// ????????????

  Ttime_t=Int64; // ????????????

  Tsocklen_t = SizeInt;

  Pnetent = Pointer;   // netdb.h
  PPnetent = ^Pnetent;   // netdb.h

  Tsa_family_t = word;      // sys/socket.h
  Psockaddr = Pointer;    // sys/socket.h

  Psigevent=Pointer; //  <signal.h>

  Psigstack=Pointer;  // /usr/include/x86_64-linux-gnu/bits/types/stack_t.h

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
  PIovec = ^TIovec;
  TIovec = record
    iov_base: Pointer;
    iov_len:  SizeUInt;
  end;

type
  // /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h
  Tsiginfo_t = record
  end;
  Psiginfo_t = ^Tsiginfo_t;

  // /usr/include/x86_64-linux-gnu/bits/types/sigset_t.h
  Tsigset_t = record
    a:array[0..127]of Char;
  end;
  Psigset_t = ^Tsigset_t;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h
  Ttimespec = record
  end;
  Ptimespec = ^Ttimespec;

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

end.
