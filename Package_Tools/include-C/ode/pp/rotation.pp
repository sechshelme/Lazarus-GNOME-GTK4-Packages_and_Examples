
unit rotation;
interface

{
  Automatically converted by H2Pas 1.0.0 from rotation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rotation.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

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
{$ifndef _ODE_ROTATION_H_}
{$define _ODE_ROTATION_H_}
{$include <ode/common.h>}
{$include <ode/compatibility.h>}
{ C++ extern C conditionnal removed }

procedure dRSetIdentity(R:TdMatrix3);cdecl;external;
procedure dRFromAxisAndAngle(R:TdMatrix3; ax:TdReal; ay:TdReal; az:TdReal; angle:TdReal);cdecl;external;
procedure dRFromEulerAngles(R:TdMatrix3; phi:TdReal; theta:TdReal; psi:TdReal);cdecl;external;
procedure dRFrom2Axes(R:TdMatrix3; ax:TdReal; ay:TdReal; az:TdReal; bx:TdReal; 
            by:TdReal; bz:TdReal);cdecl;external;
procedure dRFromZAxis(R:TdMatrix3; ax:TdReal; ay:TdReal; az:TdReal);cdecl;external;
procedure dQSetIdentity(q:TdQuaternion);cdecl;external;
procedure dQFromAxisAndAngle(q:TdQuaternion; ax:TdReal; ay:TdReal; az:TdReal; angle:TdReal);cdecl;external;
{ Quaternion multiplication, analogous to the matrix multiplication routines.  }
{ qa = rotate by qc, then qb  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dQMultiply0(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external;
{ qa = rotate by qc, then by inverse of qb  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dQMultiply1(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external;
{ qa = rotate by inverse of qc, then by qb  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dQMultiply2(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external;
{ qa = rotate by inverse of qc, then by inverse of qb  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dQMultiply3(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external;
(* Const before type ignored *)
procedure dRfromQ(R:TdMatrix3; q:TdQuaternion);cdecl;external;
(* Const before type ignored *)
procedure dQfromR(q:TdQuaternion; R:TdMatrix3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure dDQfromW(dq:array[0..3] of TdReal; w:TdVector3; q:TdQuaternion);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
