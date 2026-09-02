unit fftw_mpi;

interface

uses
  fp_fftw, fftw3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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

procedure transpose_mpi_get_local_size(n:longint; my_pe:longint; n_pes:longint; local_n:Plongint; local_start:Plongint);cdecl;external libfftw3;
function transpose_mpi_get_local_storage_size(nx:longint; ny:longint; my_pe:longint; n_pes:longint):longint;cdecl;external libfftw3;
function transpose_mpi_create_plan(nx:longint; ny:longint; comm:TMPI_Comm):Ttranspose_mpi_plan;cdecl;external libfftw3;
procedure transpose_mpi_destroy_plan(p:Ttranspose_mpi_plan);cdecl;external libfftw3;
procedure transpose_mpi(p:Ttranspose_mpi_plan; el_size:longint; local_data:PTRANSPOSE_EL_TYPE; work:PTRANSPOSE_EL_TYPE);cdecl;external libfftw3;

type
  Ptranspose_in_place_which = ^Ttranspose_in_place_which;
  Ttranspose_in_place_which =  Longint;
  Const
    BEFORE_TRANSPOSE = 0;
    AFTER_TRANSPOSE = 1;

type
  Ptranspose_sync_type = ^Ttranspose_sync_type;
  Ttranspose_sync_type =  Longint;
  Const
    TRANSPOSE_SYNC = 0;
    TRANSPOSE_ASYNC = 1;

procedure transpose_in_place_local(p:Ttranspose_mpi_plan; el_size:longint; local_data:PTRANSPOSE_EL_TYPE; which:Ttranspose_in_place_which);cdecl;external libfftw3;
function transpose_allocate_send_buf(p:Ttranspose_mpi_plan; el_size:longint):PTRANSPOSE_EL_TYPE;cdecl;external libfftw3;
procedure transpose_get_send_block(p:Ttranspose_mpi_plan; step:longint; block_y_start:Plongint; block_ny:Plongint);cdecl;external libfftw3;
procedure transpose_start_exchange_step(p:Ttranspose_mpi_plan; el_size:longint; local_data:PTRANSPOSE_EL_TYPE; send_buf:PTRANSPOSE_EL_TYPE; step:longint; 
            sync_type:Ttranspose_sync_type);cdecl;external libfftw3;
procedure transpose_finish_exchange_step(p:Ttranspose_mpi_plan; step:longint);cdecl;external libfftw3;

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

  type
  Pfftwnd_mpi_output_order = ^Tfftwnd_mpi_output_order;
  Tfftwnd_mpi_output_order =  Longint;
  Const
    FFTW_NORMAL_ORDER = 0;
    FFTW_TRANSPOSED_ORDER = 1;

function fftwnd_mpi_create_plan(comm:TMPI_Comm; rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint):Tfftwnd_mpi_plan;cdecl;external libfftw3;
function fftw2d_mpi_create_plan(comm:TMPI_Comm; nx:longint; ny:longint; dir:Tfftw_direction; flags:longint):Tfftwnd_mpi_plan;cdecl;external libfftw3;
function fftw3d_mpi_create_plan(comm:TMPI_Comm; nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; 
           flags:longint):Tfftwnd_mpi_plan;cdecl;external libfftw3;
procedure fftwnd_mpi_destroy_plan(p:Tfftwnd_mpi_plan);cdecl;external libfftw3;
procedure fftwnd_mpi_local_sizes(p:Tfftwnd_mpi_plan; local_nx:Plongint; local_x_start:Plongint; local_ny_after_transpose:Plongint; local_y_start_after_transpose:Plongint; 
            total_local_size:Plongint);cdecl;external libfftw3;
procedure fftwnd_mpi(p:Tfftwnd_mpi_plan; n_fields:longint; local_data:Pfftw_complex; work:Pfftw_complex; output_order:Tfftwnd_mpi_output_order);cdecl;external libfftw3;
procedure fftw_mpi_die(error_string:Pchar);cdecl;external libfftw3;

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

const
  FFTW_SCRAMBLED_INPUT = 8192;  
  FFTW_SCRAMBLED_OUTPUT = 16384;  

procedure fftw_mpi_local_sizes(p:Tfftw_mpi_plan; local_n:Plongint; local_start:Plongint; local_n_after_transform:Plongint; local_start_after_transform:Plongint; 
            total_local_size:Plongint);cdecl;external libfftw3;
function fftw_mpi_create_plan(comm:TMPI_Comm; n:longint; dir:Tfftw_direction; flags:longint):Tfftw_mpi_plan;cdecl;external libfftw3;
procedure fftw_mpi_destroy_plan(p:Tfftw_mpi_plan);cdecl;external libfftw3;
procedure fftw_mpi(p:Tfftw_mpi_plan; n_fields:longint; local_data:Pfftw_complex; work:Pfftw_complex);cdecl;external libfftw3;
procedure fftw_mpi_print_plan(p:Tfftw_mpi_plan);cdecl;external libfftw3;

// === Konventiert am: 2-9-26 14:58:40 ===


implementation



end.
