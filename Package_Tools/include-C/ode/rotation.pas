unit rotation;

interface

uses
  fp_ode;

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

procedure dRSetIdentity(R:TdMatrix3);cdecl;external libodes;
procedure dRFromAxisAndAngle(R:TdMatrix3; ax:TdReal; ay:TdReal; az:TdReal; angle:TdReal);cdecl;external libodes;
procedure dRFromEulerAngles(R:TdMatrix3; phi:TdReal; theta:TdReal; psi:TdReal);cdecl;external libodes;
procedure dRFrom2Axes(R:TdMatrix3; ax:TdReal; ay:TdReal; az:TdReal; bx:TdReal; 
            by:TdReal; bz:TdReal);cdecl;external libodes;
procedure dRFromZAxis(R:TdMatrix3; ax:TdReal; ay:TdReal; az:TdReal);cdecl;external libodes;
procedure dQSetIdentity(q:TdQuaternion);cdecl;external libodes;
procedure dQFromAxisAndAngle(q:TdQuaternion; ax:TdReal; ay:TdReal; az:TdReal; angle:TdReal);cdecl;external libodes;
{ Quaternion multiplication, analogous to the matrix multiplication routines.  }
{ qa = rotate by qc, then qb  }
procedure dQMultiply0(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external libodes;
{ qa = rotate by qc, then by inverse of qb  }
procedure dQMultiply1(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external libodes;
{ qa = rotate by inverse of qc, then by qb  }
procedure dQMultiply2(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external libodes;
{ qa = rotate by inverse of qc, then by inverse of qb  }
procedure dQMultiply3(qa:TdQuaternion; qb:TdQuaternion; qc:TdQuaternion);cdecl;external libodes;
procedure dRfromQ(R:TdMatrix3; q:TdQuaternion);cdecl;external libodes;
procedure dQfromR(q:TdQuaternion; R:TdMatrix3);cdecl;external libodes;
procedure dDQfromW(dq:array[0..3] of TdReal; w:TdVector3; q:TdQuaternion);cdecl;external libodes;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 30-4-26 17:09:16 ===


implementation



end.
