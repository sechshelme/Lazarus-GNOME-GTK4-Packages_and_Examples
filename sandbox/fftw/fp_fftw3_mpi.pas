unit fp_fftw3_mpi;

interface

uses
  fp_fftw3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pfftw_mpi_ddim_do_not_use_me = ^Tfftw_mpi_ddim_do_not_use_me;
  Tfftw_mpi_ddim_do_not_use_me = record
    n: Tptrdiff_t;
    ib: Tptrdiff_t;
    ob: Tptrdiff_t;
  end;

type
  // ========== ddim Aliase ==========
  Pfftwf_mpi_ddim = Pfftw_mpi_ddim_do_not_use_me;
  Pfftw_mpi_ddim = Pfftw_mpi_ddim_do_not_use_me;
  Pfftwl_mpi_ddim = Pfftw_mpi_ddim_do_not_use_me;

// ========== mpi_init ==========
procedure fftwf_mpi_init; cdecl; external libfftw3_mpi;
procedure fftw_mpi_init; cdecl; external libfftw3_mpi;
procedure fftwl_mpi_init; cdecl; external libfftw3_mpi;

// ========== mpi_cleanup ==========
procedure fftwf_mpi_cleanup; cdecl; external libfftw3_mpi;
procedure fftw_mpi_cleanup; cdecl; external libfftw3_mpi;
procedure fftwl_mpi_cleanup; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_many_transposed ==========
function fftwf_mpi_local_size_many_transposed(rnk: int32; n: PPtruint; howmany: Ptruint; block0: Ptruint; block1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_many_transposed(rnk: int32; n: PPtruint; howmany: Ptruint; block0: Ptruint; block1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_many_transposed(rnk: int32; n: PPtruint; howmany: Ptruint; block0: Ptruint; block1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_many ==========
function fftwf_mpi_local_size_many(rnk: int32; n: PPtruint; howmany: Ptruint; block0: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_many(rnk: int32; n: PPtruint; howmany: Ptruint; block0: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_many(rnk: int32; n: PPtruint; howmany: Ptruint; block0: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_transposed ==========
function fftwf_mpi_local_size_transposed(rnk: int32; n: PPtruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_transposed(rnk: int32; n: PPtruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_transposed(rnk: int32; n: PPtruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size ==========
function fftwf_mpi_local_size(rnk: int32; n: PPtruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size(rnk: int32; n: PPtruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size(rnk: int32; n: PPtruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_many_1d ==========
function fftwf_mpi_local_size_many_1d(n0: Ptruint; howmany: Ptruint; comm: TMPI_Comm; sign: int32; flags: uint32; local_ni: PPtruint; local_i_start: PPtruint; local_no: PPtruint; local_o_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_many_1d(n0: Ptruint; howmany: Ptruint; comm: TMPI_Comm; sign: int32; flags: uint32; local_ni: PPtruint; local_i_start: PPtruint; local_no: PPtruint; local_o_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_many_1d(n0: Ptruint; howmany: Ptruint; comm: TMPI_Comm; sign: int32; flags: uint32; local_ni: PPtruint; local_i_start: PPtruint; local_no: PPtruint; local_o_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_1d ==========
function fftwf_mpi_local_size_1d(n0: Ptruint; comm: TMPI_Comm; sign: int32; flags: uint32; local_ni: PPtruint; local_i_start: PPtruint; local_no: PPtruint; local_o_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_1d(n0: Ptruint; comm: TMPI_Comm; sign: int32; flags: uint32; local_ni: PPtruint; local_i_start: PPtruint; local_no: PPtruint; local_o_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_1d(n0: Ptruint; comm: TMPI_Comm; sign: int32; flags: uint32; local_ni: PPtruint; local_i_start: PPtruint; local_no: PPtruint; local_o_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_2d ==========
function fftwf_mpi_local_size_2d(n0: Ptruint; n1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_2d(n0: Ptruint; n1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_2d(n0: Ptruint; n1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_2d_transposed ==========
function fftwf_mpi_local_size_2d_transposed(n0: Ptruint; n1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_2d_transposed(n0: Ptruint; n1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_2d_transposed(n0: Ptruint; n1: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_3d ==========
function fftwf_mpi_local_size_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_local_size_3d_transposed ==========
function fftwf_mpi_local_size_3d_transposed(n0: Ptruint; n1: Ptruint; n2: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftw_mpi_local_size_3d_transposed(n0: Ptruint; n1: Ptruint; n2: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;
function fftwl_mpi_local_size_3d_transposed(n0: Ptruint; n1: Ptruint; n2: Ptruint; comm: TMPI_Comm; local_n0: PPtruint; local_0_start: PPtruint; local_n1: PPtruint; local_1_start: PPtruint): Ptruint; cdecl; external libfftw3_mpi;

// ========== mpi_plan_many_transpose ==========
function fftwf_mpi_plan_many_transpose(n0: Ptruint; n1: Ptruint; howmany: Ptruint; block0: Ptruint; block1: Ptruint; in_: PSingle; out_: PSingle; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_many_transpose(n0: Ptruint; n1: Ptruint; howmany: Ptruint; block0: Ptruint; block1: Ptruint; in_: PDouble; out_: PDouble; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_many_transpose(n0: Ptruint; n1: Ptruint; howmany: Ptruint; block0: Ptruint; block1: Ptruint; in_: Tlongdouble; out_: Tlongdouble; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_transpose ==========
function fftwf_mpi_plan_transpose(n0: Ptruint; n1: Ptruint; in_: PSingle; out_: PSingle; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_transpose(n0: Ptruint; n1: Ptruint; in_: PDouble; out_: PDouble; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_transpose(n0: Ptruint; n1: Ptruint; in_: Tlongdouble; out_: Tlongdouble; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_many_dft ==========
function fftwf_mpi_plan_many_dft(rnk: int32; n: PPtruint; howmany: Ptruint; block: Ptruint; tblock: Ptruint; in_: Pfftwf_complex; out_: Pfftwf_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_many_dft(rnk: int32; n: PPtruint; howmany: Ptruint; block: Ptruint; tblock: Ptruint; in_: Pfftw_complex; out_: Pfftw_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_many_dft(rnk: int32; n: PPtruint; howmany: Ptruint; block: Ptruint; tblock: Ptruint; in_: Pfftwl_complex; out_: Pfftwl_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft ==========
function fftwf_mpi_plan_dft(rnk: int32; n: PPtruint; in_: Pfftwf_complex; out_: Pfftwf_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft(rnk: int32; n: PPtruint; in_: Pfftw_complex; out_: Pfftw_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft(rnk: int32; n: PPtruint; in_: Pfftwl_complex; out_: Pfftwl_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_1d ==========
function fftwf_mpi_plan_dft_1d(n0: Ptruint; in_: Pfftwf_complex; out_: Pfftwf_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_1d(n0: Ptruint; in_: Pfftw_complex; out_: Pfftw_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_1d(n0: Ptruint; in_: Pfftwl_complex; out_: Pfftwl_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_2d ==========
function fftwf_mpi_plan_dft_2d(n0: Ptruint; n1: Ptruint; in_: Pfftwf_complex; out_: Pfftwf_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_2d(n0: Ptruint; n1: Ptruint; in_: Pfftw_complex; out_: Pfftw_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_2d(n0: Ptruint; n1: Ptruint; in_: Pfftwl_complex; out_: Pfftwl_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_3d ==========
function fftwf_mpi_plan_dft_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Pfftwf_complex; out_: Pfftwf_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Pfftw_complex; out_: Pfftw_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Pfftwl_complex; out_: Pfftwl_complex; comm: TMPI_Comm; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_many_r2r ==========
function fftwf_mpi_plan_many_r2r(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: PSingle; out_: PSingle; comm: TMPI_Comm; kind: Pfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_many_r2r(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: PDouble; out_: PDouble; comm: TMPI_Comm; kind: Pfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_many_r2r(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: Tlongdouble; out_: Tlongdouble; comm: TMPI_Comm; kind: Pfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_r2r ==========
function fftwf_mpi_plan_r2r(rnk: int32; n: PPtruint; in_: PSingle; out_: PSingle; comm: TMPI_Comm; kind: Pfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_r2r(rnk: int32; n: PPtruint; in_: PDouble; out_: PDouble; comm: TMPI_Comm; kind: Pfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_r2r(rnk: int32; n: PPtruint; in_: Tlongdouble; out_: Tlongdouble; comm: TMPI_Comm; kind: Pfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_r2r_2d ==========
function fftwf_mpi_plan_r2r_2d(n0: Ptruint; n1: Ptruint; in_: PSingle; out_: PSingle; comm: TMPI_Comm; kind0: Tfftwf_r2r_kind; kind1: Tfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_r2r_2d(n0: Ptruint; n1: Ptruint; in_: PDouble; out_: PDouble; comm: TMPI_Comm; kind0: Tfftw_r2r_kind; kind1: Tfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_r2r_2d(n0: Ptruint; n1: Ptruint; in_: Tlongdouble; out_: Tlongdouble; comm: TMPI_Comm; kind0: Tfftwl_r2r_kind; kind1: Tfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_r2r_3d ==========
function fftwf_mpi_plan_r2r_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: PSingle; out_: PSingle; comm: TMPI_Comm; kind0: Tfftwf_r2r_kind; kind1: Tfftwf_r2r_kind; kind2: Tfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_r2r_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: PDouble; out_: PDouble; comm: TMPI_Comm; kind0: Tfftw_r2r_kind; kind1: Tfftw_r2r_kind; kind2: Tfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_r2r_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Tlongdouble; out_: Tlongdouble; comm: TMPI_Comm; kind0: Tfftwl_r2r_kind; kind1: Tfftwl_r2r_kind; kind2: Tfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_many_dft_r2c ==========
function fftwf_mpi_plan_many_dft_r2c(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: PSingle; out_: Pfftwf_complex; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_many_dft_r2c(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: PDouble; out_: Pfftw_complex; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_many_dft_r2c(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: Tlongdouble; out_: Pfftwl_complex; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_r2c ==========
function fftwf_mpi_plan_dft_r2c(rnk: int32; n: PPtruint; in_: PSingle; out_: Pfftwf_complex; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_r2c(rnk: int32; n: PPtruint; in_: PDouble; out_: Pfftw_complex; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_r2c(rnk: int32; n: PPtruint; in_: Tlongdouble; out_: Pfftwl_complex; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_r2c_2d ==========
function fftwf_mpi_plan_dft_r2c_2d(n0: Ptruint; n1: Ptruint; in_: PSingle; out_: Pfftwf_complex; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_r2c_2d(n0: Ptruint; n1: Ptruint; in_: PDouble; out_: Pfftw_complex; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_r2c_2d(n0: Ptruint; n1: Ptruint; in_: Tlongdouble; out_: Pfftwl_complex; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_r2c_3d ==========
function fftwf_mpi_plan_dft_r2c_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: PSingle; out_: Pfftwf_complex; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_r2c_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: PDouble; out_: Pfftw_complex; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_r2c_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Tlongdouble; out_: Pfftwl_complex; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_many_dft_c2r ==========
function fftwf_mpi_plan_many_dft_c2r(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: Pfftwf_complex; out_: PSingle; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_many_dft_c2r(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: Pfftw_complex; out_: PDouble; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_many_dft_c2r(rnk: int32; n: PPtruint; howmany: Ptruint; iblock: Ptruint; oblock: Ptruint; in_: Pfftwl_complex; out_: Tlongdouble; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_c2r ==========
function fftwf_mpi_plan_dft_c2r(rnk: int32; n: PPtruint; in_: Pfftwf_complex; out_: PSingle; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_c2r(rnk: int32; n: PPtruint; in_: Pfftw_complex; out_: PDouble; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_c2r(rnk: int32; n: PPtruint; in_: Pfftwl_complex; out_: Tlongdouble; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_c2r_2d ==========
function fftwf_mpi_plan_dft_c2r_2d(n0: Ptruint; n1: Ptruint; in_: Pfftwf_complex; out_: PSingle; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_c2r_2d(n0: Ptruint; n1: Ptruint; in_: Pfftw_complex; out_: PDouble; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_c2r_2d(n0: Ptruint; n1: Ptruint; in_: Pfftwl_complex; out_: Tlongdouble; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_plan_dft_c2r_3d ==========
function fftwf_mpi_plan_dft_c2r_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Pfftwf_complex; out_: PSingle; comm: TMPI_Comm; flags: uint32): Tfftwf_plan; cdecl; external libfftw3_mpi;
function fftw_mpi_plan_dft_c2r_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Pfftw_complex; out_: PDouble; comm: TMPI_Comm; flags: uint32): Tfftw_plan; cdecl; external libfftw3_mpi;
function fftwl_mpi_plan_dft_c2r_3d(n0: Ptruint; n1: Ptruint; n2: Ptruint; in_: Pfftwl_complex; out_: Tlongdouble; comm: TMPI_Comm; flags: uint32): Tfftwl_plan; cdecl; external libfftw3_mpi;

// ========== mpi_gather_wisdom ==========
procedure fftwf_mpi_gather_wisdom(comm_: TMPI_Comm); cdecl; external libfftw3_mpi;
procedure fftw_mpi_gather_wisdom(comm_: TMPI_Comm); cdecl; external libfftw3_mpi;
procedure fftwl_mpi_gather_wisdom(comm_: TMPI_Comm); cdecl; external libfftw3_mpi;

// ========== mpi_broadcast_wisdom ==========
procedure fftwf_mpi_broadcast_wisdom(comm_: TMPI_Comm); cdecl; external libfftw3_mpi;
procedure fftw_mpi_broadcast_wisdom(comm_: TMPI_Comm); cdecl; external libfftw3_mpi;
procedure fftwl_mpi_broadcast_wisdom(comm_: TMPI_Comm); cdecl; external libfftw3_mpi;

// ========== mpi_execute_dft ==========
procedure fftwf_mpi_execute_dft(p: Tfftwf_plan; in_: Pfftwf_complex; out_: Pfftwf_complex); cdecl; external libfftw3_mpi;
procedure fftw_mpi_execute_dft(p: Tfftw_plan; in_: Pfftw_complex; out_: Pfftw_complex); cdecl; external libfftw3_mpi;
procedure fftwl_mpi_execute_dft(p: Tfftwl_plan; in_: Pfftwl_complex; out_: Pfftwl_complex); cdecl; external libfftw3_mpi;

// ========== mpi_execute_dft_r2c ==========
procedure fftwf_mpi_execute_dft_r2c(p: Tfftwf_plan; in_: PSingle; out_: Pfftwf_complex); cdecl; external libfftw3_mpi;
procedure fftw_mpi_execute_dft_r2c(p: Tfftw_plan; in_: PDouble; out_: Pfftw_complex); cdecl; external libfftw3_mpi;
procedure fftwl_mpi_execute_dft_r2c(p: Tfftwl_plan; in_: Tlongdouble; out_: Pfftwl_complex); cdecl; external libfftw3_mpi;

// ========== mpi_execute_dft_c2r ==========
procedure fftwf_mpi_execute_dft_c2r(p: Tfftwf_plan; in_: Pfftwf_complex; out_: PSingle); cdecl; external libfftw3_mpi;
procedure fftw_mpi_execute_dft_c2r(p: Tfftw_plan; in_: Pfftw_complex; out_: PDouble); cdecl; external libfftw3_mpi;
procedure fftwl_mpi_execute_dft_c2r(p: Tfftwl_plan; in_: Pfftwl_complex; out_: Tlongdouble); cdecl; external libfftw3_mpi;

// ========== mpi_execute_r2r ==========
procedure fftwf_mpi_execute_r2r(p: Tfftwf_plan; in_: PSingle; out_: PSingle); cdecl; external libfftw3_mpi;
procedure fftw_mpi_execute_r2r(p: Tfftw_plan; in_: PDouble; out_: PDouble); cdecl; external libfftw3_mpi;
procedure fftwl_mpi_execute_r2r(p: Tfftwl_plan; in_: Tlongdouble; out_: Tlongdouble); cdecl; external libfftw3_mpi;


const
  FFTW_MPI_DEFAULT_BLOCK = 0;
  FFTW_MPI_SCRAMBLED_IN = 1 shl 27;
  FFTW_MPI_SCRAMBLED_OUT = 1 shl 28;
  FFTW_MPI_TRANSPOSED_IN = 1 shl 29;
  FFTW_MPI_TRANSPOSED_OUT = 1 shl 30;

  // === Konventiert am: 3-9-26 13:55:41 ===


implementation



end.
