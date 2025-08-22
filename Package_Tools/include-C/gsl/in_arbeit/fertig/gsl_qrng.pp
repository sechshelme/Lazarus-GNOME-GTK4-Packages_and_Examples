
unit gsl_qrng;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_qrng.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_qrng.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdouble  = ^double;
Pgsl_qrng  = ^gsl_qrng;
Pgsl_qrng_type  = ^gsl_qrng_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Author: G. Jungman + modifications from O. Teytaud
  }
{$ifndef __GSL_QRNG_H__}
{$define __GSL_QRNG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{ Once again, more inane C-style OOP... kill me now.  }
{ Structure describing a type of generator.
  }
(* Const before type ignored *)
type
  Pgsl_qrng_type = ^Tgsl_qrng_type;
  Tgsl_qrng_type = record
      name : Pchar;
      max_dimension : dword;
      state_size : function (dimension:dword):Tsize_t;cdecl;
      init_state : function (state:pointer; dimension:dword):longint;cdecl;
      get : function (state:pointer; dimension:dword; x:Pdouble):longint;cdecl;
    end;
{ Structure describing a generator instance of a
 * specified type, with generator-specific state info
 * and dimension-specific info.
  }
(* Const before type ignored *)

  Pgsl_qrng = ^Tgsl_qrng;
  Tgsl_qrng = record
      _type : Pgsl_qrng_type;
      dimension : dword;
      state_size : Tsize_t;
      state : pointer;
    end;
{ Supported generator types.
  }
(* Const before type ignored *)
  var
    gsl_qrng_niederreiter_2 : Pgsl_qrng_type;cvar;external;
(* Const before type ignored *)
    gsl_qrng_sobol : Pgsl_qrng_type;cvar;external;
(* Const before type ignored *)
    gsl_qrng_halton : Pgsl_qrng_type;cvar;external;
(* Const before type ignored *)
    gsl_qrng_reversehalton : Pgsl_qrng_type;cvar;external;
{ Allocate and initialize a generator
 * of the specified type, in the given
 * space dimension.
  }
(* Const before type ignored *)

function gsl_qrng_alloc(T:Pgsl_qrng_type; dimension:dword):Pgsl_qrng;cdecl;external;
{ Copy a generator.  }
(* Const before type ignored *)
function gsl_qrng_memcpy(dest:Pgsl_qrng; src:Pgsl_qrng):longint;cdecl;external;
{ Clone a generator.  }
(* Const before type ignored *)
function gsl_qrng_clone(q:Pgsl_qrng):Pgsl_qrng;cdecl;external;
{ Free a generator.  }
procedure gsl_qrng_free(q:Pgsl_qrng);cdecl;external;
{ Intialize a generator.  }
procedure gsl_qrng_init(q:Pgsl_qrng);cdecl;external;
{ Get the standardized name of the generator.  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_qrng_name(q:Pgsl_qrng):Pchar;cdecl;external;
{ ISN'T THIS CONFUSING FOR PEOPLE?
  WHAT IF SOMEBODY TRIES TO COPY WITH THIS ???
   }
(* Const before type ignored *)
function gsl_qrng_size(q:Pgsl_qrng):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_qrng_state(q:Pgsl_qrng):pointer;cdecl;external;
{ Retrieve next vector in sequence.  }
(* Const before type ignored *)
function gsl_qrng_get(q:Pgsl_qrng; x:Pdouble):longint;cdecl;external;
{$endif}
{ !__GSL_QRNG_H__  }

implementation


end.
