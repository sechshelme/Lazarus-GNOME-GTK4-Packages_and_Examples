unit ffitarget;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  FFI_SIZEOF_ARG = 8;  
  USE_BUILTIN_FFS = 0;
type
  Pffi_arg = ^Tffi_arg;
  Tffi_arg = qword;

  Pffi_sarg = ^Tffi_sarg;
  Tffi_sarg = int64;

const
  FFI_SIZEOF_JAVA_RAW = 4;
{xxxxxxxxxxxxxx
typedef enum ffi_abi 
#if defined(X86_WIN64)
  FFI_FIRST_ABI = 0,
  FFI_WIN64,         
  FFI_GNUW64,        
  FFI_LAST_ABI,
#ifdef __GNUC__
  FFI_DEFAULT_ABI = FFI_GNUW64
#else
  FFI_DEFAULT_ABI = FFI_WIN64
#endif

#elif defined(X86_64) || (defined (__x86_64__) && defined (X86_DARWIN))
  FFI_FIRST_ABI = 1,
  FFI_UNIX64,
  FFI_WIN64,
  FFI_EFI64 = FFI_WIN64,
  FFI_GNUW64,
  FFI_LAST_ABI,
  FFI_DEFAULT_ABI = FFI_UNIX64

#elif defined(X86_WIN32)
  FFI_FIRST_ABI = 0,
  FFI_SYSV      = 1,
  FFI_STDCALL   = 2,
  FFI_THISCALL  = 3,
  FFI_FASTCALL  = 4,
  FFI_MS_CDECL  = 5,
  FFI_PASCAL    = 6,
  FFI_REGISTER  = 7,
  FFI_LAST_ABI,
  FFI_DEFAULT_ABI = FFI_MS_CDECL
#else
  FFI_FIRST_ABI = 0,
  FFI_SYSV      = 1,
  FFI_THISCALL  = 3,
  FFI_FASTCALL  = 4,
  FFI_STDCALL   = 5,
  FFI_PASCAL    = 6,
  FFI_REGISTER  = 7,
  FFI_MS_CDECL  = 8,
  FFI_LAST_ABI,
  FFI_DEFAULT_ABI = FFI_SYSV
#endif
 ffi_abi;
#endif
 }
{ ---- Definitions for closures -----------------------------------------  }

const
   FFI_TYPE_LAST   =   15 ; // ????????


const
  FFI_CLOSURES = 1;  
  FFI_GO_CLOSURES = 1;  
  FFI_TYPE_SMALL_STRUCT_1B = FFI_TYPE_LAST+1;  
  FFI_TYPE_SMALL_STRUCT_2B = FFI_TYPE_LAST+2;  
  FFI_TYPE_SMALL_STRUCT_4B = FFI_TYPE_LAST+3;  
  FFI_TYPE_MS_STRUCT = FFI_TYPE_LAST+4;  
  FFI_TRAMPOLINE_SIZE = 32;  
  FFI_NATIVE_RAW_API = 0;  

// === Konventiert am: 21-10-25 19:50:36 ===


implementation



end.
