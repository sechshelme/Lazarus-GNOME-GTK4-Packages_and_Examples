
unit rfftw_mpi;
interface

{
  Automatically converted by H2Pas 1.0.0 from rfftw_mpi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rfftw_mpi.h
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
Pfftw_real  = ^fftw_real;
Plongint  = ^longint;
Prfftwnd_mpi_plan  = ^rfftwnd_mpi_plan;
Prfftwnd_mpi_plan_data  = ^rfftwnd_mpi_plan_data;
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
{$ifndef RFFTW_MPI_H}
{$define RFFTW_MPI_H}
{$include "fftw_mpi.h"}
{$include "rfftw.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{********************************************************************* }
{ plan for first dimension  }
{ plan for subsequent dimensions  }
{ extra workspace, if needed  }
type
  Prfftwnd_mpi_plan_data = ^Trfftwnd_mpi_plan_data;
  Trfftwnd_mpi_plan_data = record
      p_fft_x : Tfftw_plan;
      p_fft : Trfftwnd_plan;
      p_transpose : Ttranspose_mpi_plan;
      p_transpose_inv : Ttranspose_mpi_plan;
      work : Pfftw_complex;
    end;

  Prfftwnd_mpi_plan = ^Trfftwnd_mpi_plan;
  Trfftwnd_mpi_plan = Prfftwnd_mpi_plan_data;
(* Const before type ignored *)

function rfftwnd_mpi_create_plan(comm:TMPI_Comm; rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint):Trfftwnd_mpi_plan;cdecl;external;
function rfftw2d_mpi_create_plan(comm:TMPI_Comm; nx:longint; ny:longint; dir:Tfftw_direction; flags:longint):Trfftwnd_mpi_plan;cdecl;external;
function rfftw3d_mpi_create_plan(comm:TMPI_Comm; nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; 
           flags:longint):Trfftwnd_mpi_plan;cdecl;external;
procedure rfftwnd_mpi_destroy_plan(p:Trfftwnd_mpi_plan);cdecl;external;
procedure rfftwnd_mpi_local_sizes(p:Trfftwnd_mpi_plan; local_nx:Plongint; local_x_start:Plongint; local_ny_after_transpose:Plongint; local_y_start_after_transpose:Plongint; 
            total_local_size:Plongint);cdecl;external;
procedure rfftwnd_mpi(p:Trfftwnd_mpi_plan; n_fields:longint; local_data:Pfftw_real; work:Pfftw_real; output_order:Tfftwnd_mpi_output_order);cdecl;external;
{********************************************************************* }
{ __cplusplus  }
{$endif}
{ RFFTW_MPI_H  }

implementation


end.
