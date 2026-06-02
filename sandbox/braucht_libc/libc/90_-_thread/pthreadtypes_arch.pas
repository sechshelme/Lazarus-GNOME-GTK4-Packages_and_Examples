unit pthreadtypes_arch;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


// /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h

const
  __SIZEOF_PTHREAD_MUTEX_T = 40;  
  __SIZEOF_PTHREAD_ATTR_T = 56;  
  __SIZEOF_PTHREAD_RWLOCK_T = 56;  
  __SIZEOF_PTHREAD_BARRIER_T = 32;  

const
  __SIZEOF_PTHREAD_MUTEXATTR_T = 4;  
  __SIZEOF_PTHREAD_COND_T = 48;  
  __SIZEOF_PTHREAD_CONDATTR_T = 4;  
  __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;  
  __SIZEOF_PTHREAD_BARRIERATTR_T = 4;  

// === Konventiert am: 8-8-25 15:00:02 ===


implementation


end.
