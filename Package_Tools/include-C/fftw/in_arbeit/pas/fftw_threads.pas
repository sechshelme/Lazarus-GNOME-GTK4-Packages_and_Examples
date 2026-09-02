unit fftw_threads;

interface

uses
  fp_fftw3;

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
{$include "fftw.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{******************* User Interface ******************** }

procedure fftw_threads(nthreads:longint; plan:Tfftw_plan; howmany:longint; in:Pfftw_complex; istride:longint; 
            idist:longint; out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external libfftw3;
procedure fftwnd_threads(nthreads:longint; plan:Tfftwnd_plan; howmany:longint; in:Pfftw_complex; istride:longint; 
            idist:longint; out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external libfftw3;
procedure fftw_threads_one(nthreads:longint; plan:Tfftw_plan; in:Pfftw_complex; out:Pfftw_complex);cdecl;external libfftw3;
procedure fftwnd_threads_one(nthreads:longint; plan:Tfftwnd_plan; in:Pfftw_complex; out:Pfftw_complex);cdecl;external libfftw3;
function fftw_threads_init:longint;cdecl;external libfftw3;
{ __cplusplus  }
{$endif}
{ FFTW_THREADS_H  }

// === Konventiert am: 2-9-26 14:58:37 ===


implementation



end.
