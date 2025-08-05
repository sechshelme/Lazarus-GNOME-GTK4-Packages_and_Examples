unit fp_fenv;

interface

uses
  fenv;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/x86_64-linux-gnu/bits/fenv.h




// /usr/include/fenv.h



function feclearexcept(__excepts:longint):longint;cdecl;external libc;
{ Store implementation-defined representation of the exception flags
   indicated by EXCEPTS in the object pointed to by FLAGP.   }
function fegetexceptflag(__flagp:Pfexcept_t; __excepts:longint):longint;cdecl;external libc;
{ Raise the supported exceptions represented by EXCEPTS.   }
function feraiseexcept(__excepts:longint):longint;cdecl;external libc;
{$if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)}
{ Set the supported exception flags represented by EXCEPTS, without
   causing enabled traps to be taken.   }

function fesetexcept(__excepts:longint):longint;cdecl;external libc;
{$endif}
{ Set complete status for exceptions indicated by EXCEPTS according to
   the representation in the object pointed to by FLAGP.   }

function fesetexceptflag(__flagp:Pfexcept_t; __excepts:longint):longint;cdecl;external libc;
{ Determine which of subset of the exceptions specified by EXCEPTS are
   currently set.   }
function fetestexcept(__excepts:longint):longint;cdecl;external libc;
{$if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)}
{ Determine which of subset of the exceptions specified by EXCEPTS
   are set in *FLAGP.   }

function fetestexceptflag(__flagp:Pfexcept_t; __excepts:longint):longint;cdecl;external libc;
{$endif}
{ Rounding control.   }
{ Get current rounding direction.   }

function fegetround:longint;cdecl;external libc;
{ Establish the rounding direction represented by ROUND.   }
function fesetround(__rounding_direction:longint):longint;cdecl;external libc;
{ Floating-point environment.   }
{ Store the current floating-point environment in the object pointed
   to by ENVP.   }
function fegetenv(__envp:Pfenv_t):longint;cdecl;external libc;
{ Save the current environment in the object pointed to by ENVP, clear
   exception flags and install a non-stop mode (if available) for all
   exceptions.   }
function feholdexcept(__envp:Pfenv_t):longint;cdecl;external libc;
{ Establish the floating-point environment represented by the object
   pointed to by ENVP.   }
function fesetenv(__envp:Pfenv_t):longint;cdecl;external libc;
{ Save current exceptions in temporary storage, install environment
   represented by object pointed to by ENVP and raise exceptions
   according to saved exceptions.   }
function feupdateenv(__envp:Pfenv_t):longint;cdecl;external libc;
{ Control modes.   }
{$if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)}
{ Store the current floating-point control modes in the object
   pointed to by MODEP.   }

function fegetmode(__modep:Pfemode_t):longint;cdecl;external libc;
{ Establish the floating-point control modes represented by the
   object pointed to by MODEP.   }
function fesetmode(__modep:Pfemode_t):longint;cdecl;external libc;
{$endif}
{ NaN support.   }
{$ifdef __USE_GNU}
{ Enable individual exceptions.  Will not enable more exceptions than
   EXCEPTS specifies.  Returns the previous enabled exceptions if all
   exceptions are successfully set, otherwise returns -1.   }

function feenableexcept(__excepts:longint):longint;cdecl;external libc;
{ Disable individual exceptions.  Will not disable more exceptions than
   EXCEPTS specifies.  Returns the previous enabled exceptions if all
   exceptions are successfully disabled, otherwise returns -1.   }
function fedisableexcept(__excepts:longint):longint;cdecl;external libc;
{ Return enabled exceptions.   }
function fegetexcept:longint;cdecl;external libc;
{$endif}
{$endif}
{ fenv.h  }

// === Konventiert am: 5-8-25 17:32:36 ===


implementation



end.
