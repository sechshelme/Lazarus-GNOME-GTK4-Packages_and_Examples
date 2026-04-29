
unit timer;
interface

{
  Automatically converted by H2Pas 1.0.0 from timer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    timer.h
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
PdStopwatch  = ^dStopwatch;
PFILE  = ^FILE;
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
{$ifndef _ODE_TIMER_H_}
{$define _ODE_TIMER_H_}
{$include <ode/odeconfig.h>}
{ C++ extern C conditionnal removed }
{ stop watch objects  }
{ total clock count  }
{ clock count since last `start'  }
type
  PdStopwatch = ^TdStopwatch;
  TdStopwatch = record
      time : Tdouble;
      cc : array[0..1] of dword;
    end;

procedure dStopwatchReset(para1:PdStopwatch);cdecl;external;
procedure dStopwatchStart(para1:PdStopwatch);cdecl;external;
procedure dStopwatchStop(para1:PdStopwatch);cdecl;external;
function dStopwatchTime(para1:PdStopwatch):Tdouble;cdecl;external;
{ returns total time in secs  }
{ code timers  }
(* Const before type ignored *)
procedure dTimerStart(description:Pchar);cdecl;external;
{ pass a static string here  }
(* Const before type ignored *)
procedure dTimerNow(description:Pchar);cdecl;external;
{ pass a static string here  }
procedure dTimerEnd;cdecl;external;
{ print out a timer report. if `average' is nonzero, print out the average
 * time for each slot (this is only meaningful if the same start-now-end
 * calls are being made repeatedly.
  }
procedure dTimerReport(fout:PFILE; average:longint);cdecl;external;
{ resolution  }
{ returns the timer ticks per second implied by the timing hardware or API.
 * the actual timer resolution may not be this great.
  }
function dTimerTicksPerSecond:Tdouble;cdecl;external;
{ returns an estimate of the actual timer resolution, in seconds. this may
 * be greater than 1/ticks_per_second.
  }
function dTimerResolution:Tdouble;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
