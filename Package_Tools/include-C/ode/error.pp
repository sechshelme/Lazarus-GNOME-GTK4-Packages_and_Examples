
unit error;
interface

{
  Automatically converted by H2Pas 1.0.0 from error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    error.h
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
PdMessageFunction  = ^dMessageFunction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{ this comes from the `reuse' library. copy any changes back to the source  }
{$ifndef _ODE_ERROR_H_}
{$define _ODE_ERROR_H_}
{$include <ode/odeconfig.h>}
{ C++ extern C conditionnal removed }
{ all user defined error functions have this type. error and debug functions
 * should not return.
  }
(* Const before type ignored *)
type

  TdMessageFunction = procedure (errnum:longint; msg:Pchar; ap:Tva_list);cdecl;
{ set a new error, debug or warning handler. if fn is 0, the default handlers
 * are used.
  }

procedure dSetErrorHandler(fn:PdMessageFunction);cdecl;external;
procedure dSetDebugHandler(fn:PdMessageFunction);cdecl;external;
procedure dSetMessageHandler(fn:PdMessageFunction);cdecl;external;
{ return the current error, debug or warning handler. if the return value is
 * 0, the default handlers are in place.
  }
function dGetErrorHandler:PdMessageFunction;cdecl;external;
function dGetDebugHandler:PdMessageFunction;cdecl;external;
function dGetMessageHandler:PdMessageFunction;cdecl;external;
{ generate a fatal error, debug trap or a message.  }
(* Const before type ignored *)
procedure dError(num:longint; msg:Pchar; args:array of const);cdecl;external;
procedure dError(num:longint; msg:Pchar);cdecl;external;
(* Const before type ignored *)
procedure dDebug(num:longint; msg:Pchar; args:array of const);cdecl;external;
procedure dDebug(num:longint; msg:Pchar);cdecl;external;
(* Const before type ignored *)
procedure dMessage(num:longint; msg:Pchar; args:array of const);cdecl;external;
procedure dMessage(num:longint; msg:Pchar);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
