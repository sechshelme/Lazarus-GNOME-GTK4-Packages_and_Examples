
unit mass;
interface

{
  Automatically converted by H2Pas 1.0.0 from mass.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mass.h
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
PdMass  = ^dMass;
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
{$ifndef _ODE_MASS_H_}
{$define _ODE_MASS_H_}
{$include <ode/common.h>}
{ C++ extern C conditionnal removed }
type
  PdMass = ^TdMass;
  TdMass = record
      {undefined structure}
    end;

{*
 * Check if a mass structure has valid value.
 * The function check if the mass and innertia matrix are positive definits
 *
 * @param m A mass structure to check
 *
 * @return 1 if both codition are met
  }
(* Const before type ignored *)

function dMassCheck(m:PdMass):longint;cdecl;external;
procedure dMassSetZero(para1:PdMass);cdecl;external;
procedure dMassSetParameters(para1:PdMass; themass:TdReal; cgx:TdReal; cgy:TdReal; cgz:TdReal; 
            I11:TdReal; I22:TdReal; I33:TdReal; I12:TdReal; I13:TdReal; 
            I23:TdReal);cdecl;external;
procedure dMassSetSphere(para1:PdMass; density:TdReal; radius:TdReal);cdecl;external;
procedure dMassSetSphereTotal(para1:PdMass; total_mass:TdReal; radius:TdReal);cdecl;external;
procedure dMassSetCapsule(para1:PdMass; density:TdReal; direction:longint; radius:TdReal; length:TdReal);cdecl;external;
procedure dMassSetCapsuleTotal(para1:PdMass; total_mass:TdReal; direction:longint; radius:TdReal; length:TdReal);cdecl;external;
procedure dMassSetCylinder(para1:PdMass; density:TdReal; direction:longint; radius:TdReal; length:TdReal);cdecl;external;
procedure dMassSetCylinderTotal(para1:PdMass; total_mass:TdReal; direction:longint; radius:TdReal; length:TdReal);cdecl;external;
procedure dMassSetBox(para1:PdMass; density:TdReal; lx:TdReal; ly:TdReal; lz:TdReal);cdecl;external;
procedure dMassSetBoxTotal(para1:PdMass; total_mass:TdReal; lx:TdReal; ly:TdReal; lz:TdReal);cdecl;external;
procedure dMassSetTrimesh(para1:PdMass; density:TdReal; g:TdGeomID);cdecl;external;
procedure dMassSetTrimeshTotal(m:PdMass; total_mass:TdReal; g:TdGeomID);cdecl;external;
procedure dMassAdjust(para1:PdMass; newmass:TdReal);cdecl;external;
procedure dMassTranslate(para1:PdMass; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
(* Const before type ignored *)
procedure dMassRotate(para1:PdMass; R:TdMatrix3);cdecl;external;
(* Const before type ignored *)
procedure dMassAdd(a:PdMass; b:PdMass);cdecl;external;
{ Backwards compatible API  }
{extern_DEPRECATED }procedure dMassSetCappedCylinder(a:PdMass; b:TdReal; c:longint; d:TdReal; e:TdReal);cdecl;external;
{extern_DEPRECATED }procedure dMassSetCappedCylinderTotal(a:PdMass; b:TdReal; c:longint; d:TdReal; e:TdReal);cdecl;external;
type
  PdMass = ^TdMass;
  TdMass = record
      mass : TdReal;
      c : TdVector3;
      I : TdMatrix3;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
