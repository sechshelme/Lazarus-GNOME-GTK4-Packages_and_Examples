unit fcntl_bits;

interface

uses
  clib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/x86_64-linux-gnu/bits/fcntl.h


type
  Tflock = record
      l_type : smallint;
      l_whence : smallint;
      l_start : Toff_t;
      l_len : Toff_t;
      l_pid : Tpid_t;
    end;
  Pflock = ^Tflock;

  Tflock64 = record
      l_type : smallint;
      l_whence : smallint;
      l_start : Toff64_t;
      l_len : Toff64_t;
      l_pid : Tpid_t;
    end;
  Pflock64 = ^Tflock64;


// === Konventiert am: 10-7-25 16:19:20 ===


implementation



end.
