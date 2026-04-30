unit misc;

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
{ miscellaneous math functions. these are mostly useful for testing  }
{$ifndef _ODE_MISC_H_}
{$define _ODE_MISC_H_}
{$include <ode/common.h>}
{ C++ extern C conditionnal removed }
{ return 1 if the random number generator is working.  }

function dTestRand:longint;cdecl;external libodes;
{ return next 32 bit random number. this uses a not-very-random linear
 * congruential method.
  }
function dRand:dword;cdecl;external libodes;
{ get and set the current random number seed.  }
function dRandGetSeed:dword;cdecl;external libodes;
procedure dRandSetSeed(s:dword);cdecl;external libodes;
{ return a random integer between 0..n-1. the distribution will get worse
 * as n approaches 2^32.
  }
function dRandInt(n:longint):longint;cdecl;external libodes;
{ return a random real number between 0..1  }
function dRandReal:TdReal;cdecl;external libodes;
{ print out a matrix  }
procedure dPrintMatrix(A:PdReal; n:longint; m:longint; fmt:Pchar; f:PFILE);cdecl;external libodes;
{ make a random vector with entries between +/- range. A has n elements.  }
procedure dMakeRandomVector(A:PdReal; n:longint; range:TdReal);cdecl;external libodes;
{ make a random matrix with entries between +/- range. A has size n*m.  }
procedure dMakeRandomMatrix(A:PdReal; n:longint; m:longint; range:TdReal);cdecl;external libodes;
{ clear the upper triangle of a square matrix  }
procedure dClearUpperTriangle(A:PdReal; n:longint);cdecl;external libodes;
{ return the maximum element difference between the two n*m matrices  }
function dMaxDifference(A:PdReal; B:PdReal; n:longint; m:longint):TdReal;cdecl;external libodes;
{ return the maximum element difference between the lower triangle of two
 * n*n matrices  }
function dMaxDifferenceLowerTriangle(A:PdReal; B:PdReal; n:longint):TdReal;cdecl;external libodes;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 30-4-26 17:09:34 ===


implementation



end.
