
unit odeconfig;
interface

{
  Automatically converted by H2Pas 1.0.0 from odeconfig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    odeconfig.h
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
Pddiffint  = ^ddiffint;
Pdint16  = ^dint16;
Pdint32  = ^dint32;
Pdint64  = ^dint64;
Pdint8  = ^dint8;
Pdintptr  = ^dintptr;
Pdsizeint  = ^dsizeint;
Pduint16  = ^duint16;
Pduint32  = ^duint32;
Pduint64  = ^duint64;
Pduint8  = ^duint8;
Pduintptr  = ^duintptr;
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
{$ifndef _ODE_ODECONFIG_H_}
{$define _ODE_ODECONFIG_H_}
{ Pull in the standard headers  }
{$include <stddef.h>}
{$include <limits.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <stdarg.h>}
{$include <math.h>}
{$include <string.h>}
{$include <float.h>}
{$include <ode/precision.h>}
{$if defined(ODE_DLL) || defined(ODE_LIB)}
{$define __ODE__}
{$endif}
{ Well-defined common data types...need to be defined for 64 bit systems  }
type
  Pdint64 = ^Tdint64;
  Tdint64 = Tint64_t;

  Pduint64 = ^Tduint64;
  Tduint64 = Tuint64_t;

  Pdint32 = ^Tdint32;
  Tdint32 = Tint32_t;

  Pduint32 = ^Tduint32;
  Tduint32 = Tuint32_t;

  Pdint16 = ^Tdint16;
  Tdint16 = Tint16_t;

  Pduint16 = ^Tduint16;
  Tduint16 = Tuint16_t;

  Pdint8 = ^Tdint8;
  Tdint8 = Tint8_t;

  Pduint8 = ^Tduint8;
  Tduint8 = Tuint8_t;

  Pdintptr = ^Tdintptr;
  Tdintptr = Tintptr_t;

  Pduintptr = ^Tduintptr;
  Tduintptr = Tuintptr_t;

  Pddiffint = ^Tddiffint;
  Tddiffint = Tptrdiff_t;

  Pdsizeint = ^Tdsizeint;
  Tdsizeint = Tsize_t;
{$endif}

implementation


end.
