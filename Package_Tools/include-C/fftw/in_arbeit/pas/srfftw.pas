unit srfftw;

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
{ rfftw.h -- system-wide definitions for rfftw  }
{$ifndef RFFTW_H}
{$define RFFTW_H}
{$include "sfftw.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{************************************************************************** }
{$define RFFTW_V2}
type
  Prfftw_plan = ^Trfftw_plan;
  Trfftw_plan = Tfftw_plan;

  Prfftwnd_plan = ^Trfftwnd_plan;
  Trfftwnd_plan = Tfftwnd_plan;

const
  FFTW_REAL_TO_COMPLEX = FFTW_FORWARD;  
  FFTW_COMPLEX_TO_REAL = FFTW_BACKWARD;  

procedure rfftw(plan:Trfftw_plan; howmany:longint; in:Pfftw_real; istride:longint; idist:longint; 
            out:Pfftw_real; ostride:longint; odist:longint);cdecl;external libfftw3;
procedure rfftw_one(plan:Trfftw_plan; in:Pfftw_real; out:Pfftw_real);cdecl;external libfftw3;
function rfftw_create_plan_specific(n:longint; dir:Tfftw_direction; flags:longint; in:Pfftw_real; istride:longint; 
           out:Pfftw_real; ostride:longint):Trfftw_plan;cdecl;external libfftw3;
function rfftw_create_plan(n:longint; dir:Tfftw_direction; flags:longint):Trfftw_plan;cdecl;external libfftw3;
procedure rfftw_destroy_plan(plan:Trfftw_plan);cdecl;external libfftw3;
procedure rfftw_fprint_plan(f:PFILE; p:Trfftw_plan);cdecl;external libfftw3;
procedure rfftw_print_plan(p:Trfftw_plan);cdecl;external libfftw3;
procedure rfftw_executor_simple(n:longint; in:Pfftw_real; out:Pfftw_real; p:Pfftw_plan_node; istride:longint; 
            ostride:longint; recurse_kind:Tfftw_recurse_kind);cdecl;external libfftw3;
function rfftwnd_create_plan_specific(rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint; in:Pfftw_real; 
           istride:longint; out:Pfftw_real; ostride:longint):Trfftwnd_plan;cdecl;external libfftw3;
function rfftw2d_create_plan_specific(nx:longint; ny:longint; dir:Tfftw_direction; flags:longint; in:Pfftw_real; 
           istride:longint; out:Pfftw_real; ostride:longint):Trfftwnd_plan;cdecl;external libfftw3;
function rfftw3d_create_plan_specific(nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; flags:longint; 
           in:Pfftw_real; istride:longint; out:Pfftw_real; ostride:longint):Trfftwnd_plan;cdecl;external libfftw3;
function rfftwnd_create_plan(rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint):Trfftwnd_plan;cdecl;external libfftw3;
function rfftw2d_create_plan(nx:longint; ny:longint; dir:Tfftw_direction; flags:longint):Trfftwnd_plan;cdecl;external libfftw3;
function rfftw3d_create_plan(nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; flags:longint):Trfftwnd_plan;cdecl;external libfftw3;
procedure rfftwnd_destroy_plan(plan:Trfftwnd_plan);cdecl;external libfftw3;
procedure rfftwnd_fprint_plan(f:PFILE; plan:Trfftwnd_plan);cdecl;external libfftw3;
procedure rfftwnd_print_plan(plan:Trfftwnd_plan);cdecl;external libfftw3;
procedure rfftwnd_real_to_complex(p:Trfftwnd_plan; howmany:longint; in:Pfftw_real; istride:longint; idist:longint; 
            out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external libfftw3;
procedure rfftwnd_complex_to_real(p:Trfftwnd_plan; howmany:longint; in:Pfftw_complex; istride:longint; idist:longint; 
            out:Pfftw_real; ostride:longint; odist:longint);cdecl;external libfftw3;
procedure rfftwnd_one_real_to_complex(p:Trfftwnd_plan; in:Pfftw_real; out:Pfftw_complex);cdecl;external libfftw3;
procedure rfftwnd_one_complex_to_real(p:Trfftwnd_plan; in:Pfftw_complex; out:Pfftw_real);cdecl;external libfftw3;
{************************************************************************** }
{ __cplusplus  }
{$endif}
{ RFFTW_H  }

// === Konventiert am: 2-9-26 14:58:20 ===


implementation



end.
