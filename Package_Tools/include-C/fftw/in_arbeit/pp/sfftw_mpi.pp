
unit sfftw_mpi;
interface

{
  Automatically converted by H2Pas 1.0.0 from sfftw_mpi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sfftw_mpi.h
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
Pfftw_complex  = ^fftw_complex;
Pfftw_mpi_plan  = ^fftw_mpi_plan;
Pfftw_mpi_plan_struct  = ^fftw_mpi_plan_struct;
Pfftw_mpi_twiddle  = ^fftw_mpi_twiddle;
Pfftw_mpi_twiddle_struct  = ^fftw_mpi_twiddle_struct;
Pfftwnd_mpi_output_order  = ^fftwnd_mpi_output_order;
Pfftwnd_mpi_plan  = ^fftwnd_mpi_plan;
Pfftwnd_mpi_plan_data  = ^fftwnd_mpi_plan_data;
Plongint  = ^longint;
PTRANSPOSE_EL_TYPE  = ^TRANSPOSE_EL_TYPE;
Ptranspose_in_place_which  = ^transpose_in_place_which;
Ptranspose_mpi_exchange  = ^transpose_mpi_exchange;
Ptranspose_mpi_plan  = ^transpose_mpi_plan;
Ptranspose_mpi_plan_struct  = ^transpose_mpi_plan_struct;
Ptranspose_sync_type  = ^transpose_sync_type;
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
{$ifndef FFTW_MPI_H}
{$define FFTW_MPI_H}
{$include "sfftw.h"}
{$include <mpi.h> /* need access to the MPI type definitions */}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{********************************************************************* }
type
  PTRANSPOSE_EL_TYPE = ^TTRANSPOSE_EL_TYPE;
  TTRANSPOSE_EL_TYPE = Tfftw_real;

  Ptranspose_mpi_exchange = ^Ttranspose_mpi_exchange;
  Ttranspose_mpi_exchange = record
      block_num : longint;
      dest_pe : longint;
      send_size : longint;
      recv_size : longint;
    end;

  Ptranspose_mpi_plan_struct = ^Ttranspose_mpi_plan_struct;
  Ttranspose_mpi_plan_struct = record
      comm : TMPI_Comm;
      n_pes : longint;
      my_pe : longint;
      nx : longint;
      ny : longint;
      local_nx : longint;
      local_ny : longint;
      exchange : Ptranspose_mpi_exchange;
      num_steps : longint;
      send_block_size : longint;
      recv_block_size : longint;
      el_type : TMPI_Datatype;
      request : array[0..1] of TMPI_Request;
      perm_block_dest : Plongint;
      num_perm_blocks : longint;
      perm_block_size : longint;
      all_blocks_equal : longint;
      send_block_sizes : Plongint;
      send_block_offsets : Plongint;
      recv_block_sizes : Plongint;
      recv_block_offsets : Plongint;
      move : Pchar;
      move_size : longint;
    end;

  Ptranspose_mpi_plan = ^Ttranspose_mpi_plan;
  Ttranspose_mpi_plan = Ptranspose_mpi_plan_struct;

procedure transpose_mpi_get_local_size(n:longint; my_pe:longint; n_pes:longint; local_n:Plongint; local_start:Plongint);cdecl;external;
function transpose_mpi_get_local_storage_size(nx:longint; ny:longint; my_pe:longint; n_pes:longint):longint;cdecl;external;
function transpose_mpi_create_plan(nx:longint; ny:longint; comm:TMPI_Comm):Ttranspose_mpi_plan;cdecl;external;
procedure transpose_mpi_destroy_plan(p:Ttranspose_mpi_plan);cdecl;external;
procedure transpose_mpi(p:Ttranspose_mpi_plan; el_size:longint; local_data:PTRANSPOSE_EL_TYPE; work:PTRANSPOSE_EL_TYPE);cdecl;external;
type
  Ptranspose_in_place_which = ^Ttranspose_in_place_which;
  Ttranspose_in_place_which =  Longint;
  Const
    BEFORE_TRANSPOSE = 0;
    AFTER_TRANSPOSE = 1;
;
type
  Ptranspose_sync_type = ^Ttranspose_sync_type;
  Ttranspose_sync_type =  Longint;
  Const
    TRANSPOSE_SYNC = 0;
    TRANSPOSE_ASYNC = 1;
;

procedure transpose_in_place_local(p:Ttranspose_mpi_plan; el_size:longint; local_data:PTRANSPOSE_EL_TYPE; which:Ttranspose_in_place_which);cdecl;external;
function transpose_allocate_send_buf(p:Ttranspose_mpi_plan; el_size:longint):PTRANSPOSE_EL_TYPE;cdecl;external;
procedure transpose_get_send_block(p:Ttranspose_mpi_plan; step:longint; block_y_start:Plongint; block_ny:Plongint);cdecl;external;
procedure transpose_start_exchange_step(p:Ttranspose_mpi_plan; el_size:longint; local_data:PTRANSPOSE_EL_TYPE; send_buf:PTRANSPOSE_EL_TYPE; step:longint; 
            sync_type:Ttranspose_sync_type);cdecl;external;
procedure transpose_finish_exchange_step(p:Ttranspose_mpi_plan; step:longint);cdecl;external;
{********************************************************************* }
{ plan for first dimension  }
{ plan for subsequent dimensions  }
{ extra workspace, if needed  }
type
  Pfftwnd_mpi_plan_data = ^Tfftwnd_mpi_plan_data;
  Tfftwnd_mpi_plan_data = record
      p_fft_x : Tfftw_plan;
      p_fft : Tfftwnd_plan;
      p_transpose : Ttranspose_mpi_plan;
      p_transpose_inv : Ttranspose_mpi_plan;
      work : Pfftw_complex;
    end;

  Pfftwnd_mpi_plan = ^Tfftwnd_mpi_plan;
  Tfftwnd_mpi_plan = Pfftwnd_mpi_plan_data;

  Pfftwnd_mpi_output_order = ^Tfftwnd_mpi_output_order;
  Tfftwnd_mpi_output_order =  Longint;
  Const
    FFTW_NORMAL_ORDER = 0;
    FFTW_TRANSPOSED_ORDER = 1;
;
(* Const before type ignored *)

function fftwnd_mpi_create_plan(comm:TMPI_Comm; rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint):Tfftwnd_mpi_plan;cdecl;external;
function fftw2d_mpi_create_plan(comm:TMPI_Comm; nx:longint; ny:longint; dir:Tfftw_direction; flags:longint):Tfftwnd_mpi_plan;cdecl;external;
function fftw3d_mpi_create_plan(comm:TMPI_Comm; nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; 
           flags:longint):Tfftwnd_mpi_plan;cdecl;external;
procedure fftwnd_mpi_destroy_plan(p:Tfftwnd_mpi_plan);cdecl;external;
procedure fftwnd_mpi_local_sizes(p:Tfftwnd_mpi_plan; local_nx:Plongint; local_x_start:Plongint; local_ny_after_transpose:Plongint; local_y_start_after_transpose:Plongint; 
            total_local_size:Plongint);cdecl;external;
procedure fftwnd_mpi(p:Tfftwnd_mpi_plan; n_fields:longint; local_data:Pfftw_complex; work:Pfftw_complex; output_order:Tfftwnd_mpi_output_order);cdecl;external;
(* Const before type ignored *)
procedure fftw_mpi_die(error_string:Pchar);cdecl;external;
{********************************************************************* }
type
  Pfftw_mpi_twiddle_struct = ^Tfftw_mpi_twiddle_struct;
  Tfftw_mpi_twiddle_struct = record
      rows : longint;
      rowstart : longint;
      cols : longint;
      n : longint;
      W : Pfftw_complex;
      refcount : longint;
      next : Pfftw_mpi_twiddle_struct;
    end;
  Tfftw_mpi_twiddle = Tfftw_mpi_twiddle_struct;
  Pfftw_mpi_twiddle = ^Tfftw_mpi_twiddle;

  Pfftw_mpi_plan_struct = ^Tfftw_mpi_plan_struct;
  Tfftw_mpi_plan_struct = ^record
      n : longint;
      m : longint;
      r : longint;
      local_m : longint;
      local_m_start : longint;
      local_r : longint;
      local_r_start : longint;
      fft_work : Pfftw_complex;
      tw : Pfftw_mpi_twiddle;
      p_transpose : Ttranspose_mpi_plan;
      p_transpose_inv : Ttranspose_mpi_plan;
      pm : Tfftw_plan;
      pr : Tfftw_plan;
      flags : longint;
      dir : Tfftw_direction;
    end;
  Tfftw_mpi_plan = Pfftw_mpi_plan_struct;
  Pfftw_mpi_plan = ^Tfftw_mpi_plan;
{ new flags for the MPI planner:  }

const
  FFTW_SCRAMBLED_INPUT = 8192;  
  FFTW_SCRAMBLED_OUTPUT = 16384;  

procedure fftw_mpi_local_sizes(p:Tfftw_mpi_plan; local_n:Plongint; local_start:Plongint; local_n_after_transform:Plongint; local_start_after_transform:Plongint; 
            total_local_size:Plongint);cdecl;external;
function fftw_mpi_create_plan(comm:TMPI_Comm; n:longint; dir:Tfftw_direction; flags:longint):Tfftw_mpi_plan;cdecl;external;
procedure fftw_mpi_destroy_plan(p:Tfftw_mpi_plan);cdecl;external;
procedure fftw_mpi(p:Tfftw_mpi_plan; n_fields:longint; local_data:Pfftw_complex; work:Pfftw_complex);cdecl;external;
procedure fftw_mpi_print_plan(p:Tfftw_mpi_plan);cdecl;external;
{********************************************************************* }
{ __cplusplus  }
{$endif}
{ FFTW_MPI_H  }

implementation


end.
