
unit exception;
interface

{
  Automatically converted by H2Pas 1.0.0 from exception.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    exception.h
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
Pflint_err_t  = ^flint_err_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2016 William Hart

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{$ifndef EXCEPTION_H}
{$define EXCEPTION_H}
{ general error  }
{ impossible inverse  }
{ domain error  }
{ divide by zero  }
{ exponent overflow  }
{ inexact error  }
type
  Pflint_err_t = ^Tflint_err_t;
  Tflint_err_t =  Longint;
  Const
    FLINT_ERROR = 0;
    FLINT_IMPINV = 1;
    FLINT_DOMERR = 2;
    FLINT_DIVZERO = 3;
    FLINT_EXPOF = 4;
    FLINT_INEXACT = 5;
;
(* Const before type ignored *)

procedure flint_throw(exc:Tflint_err_t; msg:Pchar; args:array of const);cdecl;external;
procedure flint_throw(exc:Tflint_err_t; msg:Pchar);cdecl;external;
{$endif}

implementation


end.
