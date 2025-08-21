
unit gsl_errno;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_errno.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_errno.h
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
PFILE  = ^FILE;
Pgsl_error_handler_t  = ^gsl_error_handler_t;
Pgsl_stream_handler_t  = ^gsl_stream_handler_t;
Pxxxxxxxx  = ^xxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ err/gsl_errno.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_ERRNO_H__}
{$define __GSL_ERRNO_H__}
{$include <stdio.h>}
{$include <errno.h>}
{$include <gsl/gsl_types.h>}
{ iteration has not converged  }
{ input domain error, e.g sqrt(-1)  }
{ output range error, e.g. exp(1e100)  }
{ invalid pointer  }
{ invalid argument supplied by user  }
{ generic failure  }
{ factorization failed  }
{ sanity check failed - shouldn't happen  }
{ malloc failed  }
{ problem with user-supplied function  }
{ iterative process is out of control  }
{ exceeded max number of iterations  }
{ tried to divide by zero  }
{ user specified an invalid tolerance  }
{ failed to reach the specified tolerance  }
{ underflow  }
{ overflow   }
{ loss of accuracy  }
{ failed because of roundoff error  }
{ matrix, vector lengths are not conformant  }
{ matrix not square  }
{ apparent singularity detected  }
{ integral or series is divergent  }
{ requested feature is not supported by the hardware  }
{ requested feature not (yet) implemented  }
{ cache limit exceeded  }
{ table limit exceeded  }
{ iteration is not making progress towards solution  }
{ jacobian evaluations are not improving the solution  }
{ cannot reach the specified tolerance in F  }
{ cannot reach the specified tolerance in X  }
{ cannot reach the specified tolerance in gradient  }
{ end of file  }
type
  Txxxxxxxx =  Longint;
  Const
    GSL_SUCCESS = 0;
    GSL_FAILURE = -(1);
    GSL_CONTINUE = -(2);
    GSL_EDOM = 1;
    GSL_ERANGE = 2;
    GSL_EFAULT = 3;
    GSL_EINVAL = 4;
    GSL_EFAILED = 5;
    GSL_EFACTOR = 6;
    GSL_ESANITY = 7;
    GSL_ENOMEM = 8;
    GSL_EBADFUNC = 9;
    GSL_ERUNAWAY = 10;
    GSL_EMAXITER = 11;
    GSL_EZERODIV = 12;
    GSL_EBADTOL = 13;
    GSL_ETOL = 14;
    GSL_EUNDRFLW = 15;
    GSL_EOVRFLW = 16;
    GSL_ELOSS = 17;
    GSL_EROUND = 18;
    GSL_EBADLEN = 19;
    GSL_ENOTSQR = 20;
    GSL_ESING = 21;
    GSL_EDIVERGE = 22;
    GSL_EUNSUP = 23;
    GSL_EUNIMPL = 24;
    GSL_ECACHE = 25;
    GSL_ETABLE = 26;
    GSL_ENOPROG = 27;
    GSL_ENOPROGJ = 28;
    GSL_ETOLF = 29;
    GSL_ETOLX = 30;
    GSL_ETOLG = 31;
    GSL_EOF = 32;

(* Const before type ignored *)
(* Const before type ignored *)

procedure gsl_error(reason:Pchar; file:Pchar; line:longint; gsl_errno:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stream_printf(_label:Pchar; file:Pchar; line:longint; reason:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_strerror(gsl_errno:longint):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgsl_error_handler_t = procedure (reason:Pchar; file:Pchar; line:longint; gsl_errno:longint);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Tgsl_stream_handler_t = procedure (_label:Pchar; file:Pchar; line:longint; reason:Pchar);cdecl;

function gsl_set_error_handler(new_handler:Pgsl_error_handler_t):Pgsl_error_handler_t;cdecl;external;
function gsl_set_error_handler_off:Pgsl_error_handler_t;cdecl;external;
function gsl_set_stream_handler(new_handler:Pgsl_stream_handler_t):Pgsl_stream_handler_t;cdecl;external;
function gsl_set_stream(new_stream:PFILE):PFILE;cdecl;external;
{ GSL_ERROR: call the error handler, and return the error code  }
{ GSL_ERROR_NULL suitable for out-of-memory conditions  }
{ Sometimes you have several status results returned from
 * function calls and you want to combine them in some sensible
 * way. You cannot produce a "total" status condition, but you can
 * pick one from a set of conditions based on an implied hierarchy.
 *
 * In other words:
 *    you have: status_a, status_b, ...
 *    you want: status = (status_a if it is bad, or status_b if it is bad,...)
 *
 * In this example you consider status_a to be more important and
 * it is checked first, followed by the others in the order specified.
 *
 * Here are some dumb macros to do this.
  }
{$endif}
{ __GSL_ERRNO_H__  }

implementation


end.
