unit thread_shared_types;

interface

uses
  atomic_wide_counter_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h


type
  P_pthread_internal_list = ^T_pthread_internal_list;

  T_pthread_internal_list = record
    __prev: P_pthread_internal_list;
    __next: P_pthread_internal_list;
  end;
  T_pthread_list_t = T_pthread_internal_list;
  P_pthread_list_t = ^T_pthread_list_t;

  P_pthread_internal_slist = ^T_pthread_internal_slist;

  T_pthread_internal_slist = record
    __next: P_pthread_internal_slist;
  end;
  T_pthread_slist_t = T_pthread_internal_slist;
  P_pthread_slist_t = ^T_pthread_slist_t;

type
  T_pthread_cond_s = record
    __wseq: Tatomic_wide_counter;
    __g1_start: Tatomic_wide_counter;
    __g_refs: array[0..1] of dword;
    __g_size: array[0..1] of dword;
    __g1_orig_size: dword;
    __wrefs: dword;
    __g_signals: array[0..1] of dword;
  end;
  P_pthread_cond_s = ^T_pthread_cond_s;


  P_tss_t = ^T_tss_t;
  T_tss_t = dword;

  P_thrd_t = ^T_thrd_t;
  T_thrd_t = dword;

  P_once_flag = ^T_once_flag;

  T_once_flag = record
    __data: longint;
  end;

  // === Konventiert am: 8-8-25 17:04:13 ===


implementation



end.
