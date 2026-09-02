
unit sfftw_threads;
interface

{
  Automatically converted by H2Pas 1.0.0 from sfftw_threads.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sfftw_threads.h
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
Pfftw_complex  = ^fftw_complex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 1997-1999, 2003 Massachusetts Institute of Technology
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
  }
{$ifndef FFTW_THREADS_H}
{$define FFTW_THREADS_H}
{$include "sfftw.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{******************* User Interface ******************** }

procedure fftw_threads(nthreads:longint; plan:Tfftw_plan; howmany:longint; in:Pfftw_complex; istride:longint; 
            idist:longint; out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external;
procedure fftwnd_threads(nthreads:longint; plan:Tfftwnd_plan; howmany:longint; in:Pfftw_complex; istride:longint; 
            idist:longint; out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external;
procedure fftw_threads_one(nthreads:longint; plan:Tfftw_plan; in:Pfftw_complex; out:Pfftw_complex);cdecl;external;
procedure fftwnd_threads_one(nthreads:longint; plan:Tfftwnd_plan; in:Pfftw_complex; out:Pfftw_complex);cdecl;external;
function fftw_threads_init:longint;cdecl;external;
{ __cplusplus  }
{$endif}
{ FFTW_THREADS_H  }

implementation


end.
