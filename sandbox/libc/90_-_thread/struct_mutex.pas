unit struct_mutex;

interface

uses
  thread_shared_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/struct_mutex.h

type
  T_pthread_mutex_s = record
    __lock: longint;
    __count: dword;
    __owner: longint;
    __nusers: dword;
    __kind: longint;
    __spins: smallint;
    __elision: smallint;
    __list: T_pthread_list_t;
  end;
  P_pthread_mutex_s = ^T_pthread_mutex_s;

  // === Konventiert am: 8-8-25 15:14:05 ===


implementation



end.
