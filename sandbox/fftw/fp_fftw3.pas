unit fp_fftw3;

interface

const
  {$IFDEF Linux}
  libfftw3 = 'fftw3';
  libfftw3_threads = 'fftw3_threads';
  libfftw3_mpi = 'fftw3_mpi';

  libfftw3f = 'fftw3f';
  libfftw3f_threads = 'fftw3f_threads';
  libfftw3f_mpi = 'fftw3f_mpi';

  libfftw3l = 'fftw3l';
  libfftw3l_threads = 'fftw3l_threads';
  libfftw3l_mpi = 'fftw3l_mpi';

  libfftw3q = 'fftw3q';
  libfftw3q_threads = 'fftw3q_threads';
  libfftw3q_mpi = 'fftw3q_mpi';
  {$ENDIF}

  {$IFDEF Windows}
  libfftw3 = 'libfftw3-3.dll';
  libfftw3_threads = 'libfftw3_threads-3.dll';
  libfftw3_mpi = 'libfftw3_mpi-3.dll';

  libfftw3f = 'libfftw3f-3.dll';
  libfftw3f_threads = 'libfftw3f_threads-3.dll';
  libfftw3f_mpi = 'libfftw3f_mpi-3.dll';

  libfftw3l = 'libfftw3l-3.dll';
  libfftw3l_threads = 'libfftw3l_threads-3.dll';
  libfftw3l_mpi = 'libfftw3l_mpi-3.dll';

  libfftw3q = 'libfftw3q-3.dll';
  libfftw3q_threads = 'libfftw3q_threads-3.dll';
  libfftw3q_mpi = 'libfftw3q_mpi-3.dll';
  {$ENDIF}

type
  Tptrdiff_t = PtrInt;
  Pptrdiff_t = ^Tptrdiff_t;

type
  //    Tdouble = Double;
  //    Pdouble = ^Tdouble;

  //    Tfloat = Single;
  //    Pfloat = ^Tfloat;

  Tlongdouble = extended;
  Plongdouble = ^Tlongdouble;

  Tfloat128 = array[0..15] of byte;
  Pfloat128 = ^Tfloat128;


  Tfftw_complex = record
    re: double;
    im: double;
  end;
  Pfftw_complex = ^Tfftw_complex;

  Tfftwf_complex = record
    re: single;
    im: single;
  end;
  Pfftwf_complex = ^Tfftwf_complex;

  Tfftwl_complex = record
    re: Tlongdouble;
    im: Tlongdouble;
  end;
  Pfftwl_complex = ^Tfftwl_complex;

  Tfftwq_complex = record
    re: Tfloat128;
    im: Tfloat128;
  end;
  Pfftwq_complex = ^Tfftwq_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tfftw_r2r_kind_do_not_use_me = longint;
const
  FFTW_R2HC = 0;
  FFTW_HC2R = 1;
  FFTW_DHT = 2;
  FFTW_REDFT00 = 3;
  FFTW_REDFT01 = 4;
  FFTW_REDFT10 = 5;
  FFTW_REDFT11 = 6;
  FFTW_RODFT00 = 7;
  FFTW_RODFT01 = 8;
  FFTW_RODFT10 = 9;
  FFTW_RODFT11 = 10;

type
  Pfftw_iodim_do_not_use_me = ^Tfftw_iodim_do_not_use_me;
  Tfftw_iodim_do_not_use_me = record
    n: longint;
    is_: longint;
    os: longint;
  end;

type
  Pfftw_iodim64_do_not_use_me = ^Tfftw_iodim64_do_not_use_me;
  Tfftw_iodim64_do_not_use_me = record
    n: Tptrdiff_t;
    is_: Tptrdiff_t;
    os: Tptrdiff_t;
  end;

  Tfftw_write_char_func_do_not_use_me = procedure(c: char; para2: pointer); cdecl;
  Tfftw_read_char_func_do_not_use_me = function(para1: pointer): longint; cdecl;

  // ==========

type
  Tfftwf_plan = type Pointer;
  Tfftw_plan = type Pointer;
  Tfftwl_plan = type Pointer;
  Tfftwq_plan = type Pointer;

  Pfftwf_iodim = Pfftw_iodim_do_not_use_me;
  Pfftw_iodim = Pfftw_iodim_do_not_use_me;
  Pfftwl_iodim = Pfftw_iodim_do_not_use_me;
  Pfftwq_iodim = Pfftw_iodim_do_not_use_me;

  PTfftwf_iodim64 = Pfftw_iodim64_do_not_use_me;
  PTfftw_iodim64 = Pfftw_iodim64_do_not_use_me;
  PTfftwl_iodim64 = Pfftw_iodim64_do_not_use_me;
  PTfftwq_iodim64 = Pfftw_iodim64_do_not_use_me;

  Tfftwf_r2r_kind = Tfftw_r2r_kind_do_not_use_me;
  Pfftwf_r2r_kind = ^Tfftwf_r2r_kind;
  Tfftw_r2r_kind = Tfftw_r2r_kind_do_not_use_me;
  Pfftw_r2r_kind = ^Tfftw_r2r_kind;
  Tfftwl_r2r_kind = Tfftw_r2r_kind_do_not_use_me;
  Pfftwl_r2r_kind = ^Tfftwl_r2r_kind;
  Tfftwq_r2r_kind = Tfftw_r2r_kind_do_not_use_me;
  Pfftwq_r2r_kind = ^Tfftwq_r2r_kind;

  fftwf_write_char_func = Tfftw_write_char_func_do_not_use_me;
  fftw_write_char_func = Tfftw_write_char_func_do_not_use_me;
  fftwl_write_char_func = Tfftw_write_char_func_do_not_use_me;
  fftwq_write_char_func = Tfftw_write_char_func_do_not_use_me;

  fftwf_read_char_func = Tfftw_read_char_func_do_not_use_me;
  fftw_read_char_func = Tfftw_read_char_func_do_not_use_me;
  fftwl_read_char_func = Tfftw_read_char_func_do_not_use_me;
  fftwq_read_char_func = Tfftw_read_char_func_do_not_use_me;

// ========== execute ==========
procedure fftwf_execute(p: Tfftwf_plan); cdecl; external libfftw3;
procedure fftw_execute(p: Tfftw_plan); cdecl; external libfftw3;
procedure fftwl_execute(p: Tfftwl_plan); cdecl; external libfftw3;
procedure fftwq_execute(p: Tfftwq_plan); cdecl; external libfftw3;

// ========== plan_dft ==========
function fftwf_plan_dft(rank: int32; n: pint32; in_: Pfftwf_complex; out_: Pfftwf_complex; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft(rank: int32; n: pint32; in_: Pfftw_complex; out_: Pfftw_complex; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft(rank: int32; n: pint32; in_: Pfftwl_complex; out_: Pfftwl_complex; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft(rank: int32; n: pint32; in_: Pfftwq_complex; out_: Pfftwq_complex; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_1d ==========
function fftwf_plan_dft_1d(n: int32; in_: Pfftwf_complex; out_: Pfftwf_complex; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_1d(n: int32; in_: Pfftw_complex; out_: Pfftw_complex; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_1d(n: int32; in_: Pfftwl_complex; out_: Pfftwl_complex; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_1d(n: int32; in_: Pfftwq_complex; out_: Pfftwq_complex; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_2d ==========
function fftwf_plan_dft_2d(n0: int32; n1: int32; in_: Pfftwf_complex; out_: Pfftwf_complex; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_2d(n0: int32; n1: int32; in_: Pfftw_complex; out_: Pfftw_complex; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_2d(n0: int32; n1: int32; in_: Pfftwl_complex; out_: Pfftwl_complex; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_2d(n0: int32; n1: int32; in_: Pfftwq_complex; out_: Pfftwq_complex; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_3d ==========
function fftwf_plan_dft_3d(n0: int32; n1: int32; n2: int32; in_: Pfftwf_complex; out_: Pfftwf_complex; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_3d(n0: int32; n1: int32; n2: int32; in_: Pfftw_complex; out_: Pfftw_complex; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_3d(n0: int32; n1: int32; n2: int32; in_: Pfftwl_complex; out_: Pfftwl_complex; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_3d(n0: int32; n1: int32; n2: int32; in_: Pfftwq_complex; out_: Pfftwq_complex; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_many_dft ==========
function fftwf_plan_many_dft(rank: int32; n: pint32; howmany: int32; in_: Pfftwf_complex; inembed: pint32; istride: int32; idist: int32; out_: Pfftwf_complex; onembed: pint32; ostride: int32; odist: int32; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_many_dft(rank: int32; n: pint32; howmany: int32; in_: Pfftw_complex; inembed: pint32; istride: int32; idist: int32; out_: Pfftw_complex; onembed: pint32; ostride: int32; odist: int32; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_many_dft(rank: int32; n: pint32; howmany: int32; in_: Pfftwl_complex; inembed: pint32; istride: int32; idist: int32; out_: Pfftwl_complex; onembed: pint32; ostride: int32; odist: int32; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_many_dft(rank: int32; n: pint32; howmany: int32; in_: Pfftwq_complex; inembed: pint32; istride: int32; idist: int32; out_: Pfftwq_complex; onembed: pint32; ostride: int32; odist: int32; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_dft ==========
function fftwf_plan_guru_dft(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; in_: Pfftwf_complex; out_: Pfftwf_complex; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_dft(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; in_: Pfftw_complex; out_: Pfftw_complex; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_dft(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; in_: Pfftwl_complex; out_: Pfftwl_complex; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_dft(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; in_: Pfftwq_complex; out_: Pfftwq_complex; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_split_dft ==========
function fftwf_plan_guru_split_dft(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; ri: PSingle; ii: PSingle; ro: PSingle; io: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_split_dft(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; ri: PDouble; ii: PDouble; ro: PDouble; io: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_split_dft(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; ri: Plongdouble; ii: Plongdouble; ro: Plongdouble; io: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_split_dft(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; ri: PFloat128; ii: PFloat128; ro: PFloat128; io: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_dft ==========
function fftwf_plan_guru64_dft(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; in_: Pfftwf_complex; out_: Pfftwf_complex; sign: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_dft(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; in_: Pfftw_complex; out_: Pfftw_complex; sign: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_dft(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; in_: Pfftwl_complex; out_: Pfftwl_complex; sign: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_dft(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; in_: Pfftwq_complex; out_: Pfftwq_complex; sign: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_split_dft ==========
function fftwf_plan_guru64_split_dft(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; ri: PSingle; ii: PSingle; ro: PSingle; io: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_split_dft(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; ri: PDouble; ii: PDouble; ro: PDouble; io: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_split_dft(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; ri: Plongdouble; ii: Plongdouble; ro: Plongdouble; io: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_split_dft(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; ri: PFloat128; ii: PFloat128; ro: PFloat128; io: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== execute_dft ==========
procedure fftwf_execute_dft(p: Tfftwf_plan; in_: Pfftwf_complex; out_: Pfftwf_complex); cdecl; external libfftw3;
procedure fftw_execute_dft(p: Tfftw_plan; in_: Pfftw_complex; out_: Pfftw_complex); cdecl; external libfftw3;
procedure fftwl_execute_dft(p: Tfftwl_plan; in_: Pfftwl_complex; out_: Pfftwl_complex); cdecl; external libfftw3;
procedure fftwq_execute_dft(p: Tfftwq_plan; in_: Pfftwq_complex; out_: Pfftwq_complex); cdecl; external libfftw3;

// ========== execute_split_dft ==========
procedure fftwf_execute_split_dft(p: Tfftwf_plan; ri: PSingle; ii: PSingle; ro: PSingle; io: PSingle); cdecl; external libfftw3;
procedure fftw_execute_split_dft(p: Tfftw_plan; ri: PDouble; ii: PDouble; ro: PDouble; io: PDouble); cdecl; external libfftw3;
procedure fftwl_execute_split_dft(p: Tfftwl_plan; ri: Plongdouble; ii: Plongdouble; ro: Plongdouble; io: Plongdouble); cdecl; external libfftw3;
procedure fftwq_execute_split_dft(p: Tfftwq_plan; ri: PFloat128; ii: PFloat128; ro: PFloat128; io: PFloat128); cdecl; external libfftw3;

// ========== plan_many_dft_r2c ==========
function fftwf_plan_many_dft_r2c(rank: int32; n: pint32; howmany: int32; in_: PSingle; inembed: pint32; istride: int32; idist: int32; out_: Pfftwf_complex; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_many_dft_r2c(rank: int32; n: pint32; howmany: int32; in_: PDouble; inembed: pint32; istride: int32; idist: int32; out_: Pfftw_complex; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_many_dft_r2c(rank: int32; n: pint32; howmany: int32; in_: Plongdouble; inembed: pint32; istride: int32; idist: int32; out_: Pfftwl_complex; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_many_dft_r2c(rank: int32; n: pint32; howmany: int32; in_: PFloat128; inembed: pint32; istride: int32; idist: int32; out_: Pfftwq_complex; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_r2c ==========
function fftwf_plan_dft_r2c(rank: int32; n: pint32; in_: PSingle; out_: Pfftwf_complex; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_r2c(rank: int32; n: pint32; in_: PDouble; out_: Pfftw_complex; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_r2c(rank: int32; n: pint32; in_: Plongdouble; out_: Pfftwl_complex; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_r2c(rank: int32; n: pint32; in_: PFloat128; out_: Pfftwq_complex; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_r2c_1d ==========
function fftwf_plan_dft_r2c_1d(n: int32; in_: PSingle; out_: Pfftwf_complex; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_r2c_1d(n: int32; in_: PDouble; out_: Pfftw_complex; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_r2c_1d(n: int32; in_: Plongdouble; out_: Pfftwl_complex; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_r2c_1d(n: int32; in_: PFloat128; out_: Pfftwq_complex; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_r2c_2d ==========
function fftwf_plan_dft_r2c_2d(n0: int32; n1: int32; in_: PSingle; out_: Pfftwf_complex; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_r2c_2d(n0: int32; n1: int32; in_: PDouble; out_: Pfftw_complex; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_r2c_2d(n0: int32; n1: int32; in_: Plongdouble; out_: Pfftwl_complex; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_r2c_2d(n0: int32; n1: int32; in_: PFloat128; out_: Pfftwq_complex; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_r2c_3d ==========
function fftwf_plan_dft_r2c_3d(n0: int32; n1: int32; n2: int32; in_: PSingle; out_: Pfftwf_complex; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_r2c_3d(n0: int32; n1: int32; n2: int32; in_: PDouble; out_: Pfftw_complex; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_r2c_3d(n0: int32; n1: int32; n2: int32; in_: Plongdouble; out_: Pfftwl_complex; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_r2c_3d(n0: int32; n1: int32; n2: int32; in_: PFloat128; out_: Pfftwq_complex; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_many_dft_c2r ==========
function fftwf_plan_many_dft_c2r(rank: int32; n: pint32; howmany: int32; in_: Pfftwf_complex; inembed: pint32; istride: int32; idist: int32; out_: PSingle; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_many_dft_c2r(rank: int32; n: pint32; howmany: int32; in_: Pfftw_complex; inembed: pint32; istride: int32; idist: int32; out_: PDouble; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_many_dft_c2r(rank: int32; n: pint32; howmany: int32; in_: Pfftwl_complex; inembed: pint32; istride: int32; idist: int32; out_: Plongdouble; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_many_dft_c2r(rank: int32; n: pint32; howmany: int32; in_: Pfftwq_complex; inembed: pint32; istride: int32; idist: int32; out_: PFloat128; onembed: pint32; ostride: int32; odist: int32; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_c2r ==========
function fftwf_plan_dft_c2r(rank: int32; n: pint32; in_: Pfftwf_complex; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_c2r(rank: int32; n: pint32; in_: Pfftw_complex; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_c2r(rank: int32; n: pint32; in_: Pfftwl_complex; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_c2r(rank: int32; n: pint32; in_: Pfftwq_complex; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_c2r_1d ==========
function fftwf_plan_dft_c2r_1d(n: int32; in_: Pfftwf_complex; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_c2r_1d(n: int32; in_: Pfftw_complex; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_c2r_1d(n: int32; in_: Pfftwl_complex; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_c2r_1d(n: int32; in_: Pfftwq_complex; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_c2r_2d ==========
function fftwf_plan_dft_c2r_2d(n0: int32; n1: int32; in_: Pfftwf_complex; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_c2r_2d(n0: int32; n1: int32; in_: Pfftw_complex; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_c2r_2d(n0: int32; n1: int32; in_: Pfftwl_complex; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_c2r_2d(n0: int32; n1: int32; in_: Pfftwq_complex; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_dft_c2r_3d ==========
function fftwf_plan_dft_c2r_3d(n0: int32; n1: int32; n2: int32; in_: Pfftwf_complex; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_dft_c2r_3d(n0: int32; n1: int32; n2: int32; in_: Pfftw_complex; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_dft_c2r_3d(n0: int32; n1: int32; n2: int32; in_: Pfftwl_complex; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_dft_c2r_3d(n0: int32; n1: int32; n2: int32; in_: Pfftwq_complex; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_dft_r2c ==========
function fftwf_plan_guru_dft_r2c(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; in_: PSingle; out_: Pfftwf_complex; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_dft_r2c(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; in_: PDouble; out_: Pfftw_complex; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_dft_r2c(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; in_: Plongdouble; out_: Pfftwl_complex; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_dft_r2c(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; in_: PFloat128; out_: Pfftwq_complex; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_dft_c2r ==========
function fftwf_plan_guru_dft_c2r(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; in_: Pfftwf_complex; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_dft_c2r(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; in_: Pfftw_complex; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_dft_c2r(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; in_: Pfftwl_complex; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_dft_c2r(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; in_: Pfftwq_complex; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_split_dft_r2c ==========
function fftwf_plan_guru_split_dft_r2c(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; in_: PSingle; ro: PSingle; io: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_split_dft_r2c(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; in_: PDouble; ro: PDouble; io: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_split_dft_r2c(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; in_: Plongdouble; ro: Plongdouble; io: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_split_dft_r2c(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; in_: PFloat128; ro: PFloat128; io: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_split_dft_c2r ==========
function fftwf_plan_guru_split_dft_c2r(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; ri: PSingle; ii: PSingle; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_split_dft_c2r(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; ri: PDouble; ii: PDouble; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_split_dft_c2r(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; ri: Plongdouble; ii: Plongdouble; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_split_dft_c2r(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; ri: PFloat128; ii: PFloat128; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_dft_r2c ==========
function fftwf_plan_guru64_dft_r2c(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; in_: PSingle; out_: Pfftwf_complex; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_dft_r2c(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; in_: PDouble; out_: Pfftw_complex; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_dft_r2c(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; in_: Plongdouble; out_: Pfftwl_complex; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_dft_r2c(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; in_: PFloat128; out_: Pfftwq_complex; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_dft_c2r ==========
function fftwf_plan_guru64_dft_c2r(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; in_: Pfftwf_complex; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_dft_c2r(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; in_: Pfftw_complex; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_dft_c2r(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; in_: Pfftwl_complex; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_dft_c2r(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; in_: Pfftwq_complex; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_split_dft_r2c ==========
function fftwf_plan_guru64_split_dft_r2c(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; in_: PSingle; ro: PSingle; io: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_split_dft_r2c(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; in_: PDouble; ro: PDouble; io: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_split_dft_r2c(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; in_: Plongdouble; ro: Plongdouble; io: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_split_dft_r2c(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; in_: PFloat128; ro: PFloat128; io: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_split_dft_c2r ==========
function fftwf_plan_guru64_split_dft_c2r(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; ri: PSingle; ii: PSingle; out_: PSingle; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_split_dft_c2r(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; ri: PDouble; ii: PDouble; out_: PDouble; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_split_dft_c2r(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; ri: Plongdouble; ii: Plongdouble; out_: Plongdouble; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_split_dft_c2r(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; ri: PFloat128; ii: PFloat128; out_: PFloat128; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== execute_dft_r2c ==========
procedure fftwf_execute_dft_r2c(p: Tfftwf_plan; in_: PSingle; out_: Pfftwf_complex); cdecl; external libfftw3;
procedure fftw_execute_dft_r2c(p: Tfftw_plan; in_: PDouble; out_: Pfftw_complex); cdecl; external libfftw3;
procedure fftwl_execute_dft_r2c(p: Tfftwl_plan; in_: Plongdouble; out_: Pfftwl_complex); cdecl; external libfftw3;
procedure fftwq_execute_dft_r2c(p: Tfftwq_plan; in_: PFloat128; out_: Pfftwq_complex); cdecl; external libfftw3;

// ========== execute_dft_c2r ==========
procedure fftwf_execute_dft_c2r(p: Tfftwf_plan; in_: Pfftwf_complex; out_: PSingle); cdecl; external libfftw3;
procedure fftw_execute_dft_c2r(p: Tfftw_plan; in_: Pfftw_complex; out_: PDouble); cdecl; external libfftw3;
procedure fftwl_execute_dft_c2r(p: Tfftwl_plan; in_: Pfftwl_complex; out_: Plongdouble); cdecl; external libfftw3;
procedure fftwq_execute_dft_c2r(p: Tfftwq_plan; in_: Pfftwq_complex; out_: PFloat128); cdecl; external libfftw3;

// ========== execute_split_dft_r2c ==========
procedure fftwf_execute_split_dft_r2c(p: Tfftwf_plan; in_: PSingle; ro: PSingle; io: PSingle); cdecl; external libfftw3;
procedure fftw_execute_split_dft_r2c(p: Tfftw_plan; in_: PDouble; ro: PDouble; io: PDouble); cdecl; external libfftw3;
procedure fftwl_execute_split_dft_r2c(p: Tfftwl_plan; in_: Plongdouble; ro: Plongdouble; io: Plongdouble); cdecl; external libfftw3;
procedure fftwq_execute_split_dft_r2c(p: Tfftwq_plan; in_: PFloat128; ro: PFloat128; io: PFloat128); cdecl; external libfftw3;

// ========== execute_split_dft_c2r ==========
procedure fftwf_execute_split_dft_c2r(p: Tfftwf_plan; ri: PSingle; ii: PSingle; out_: PSingle); cdecl; external libfftw3;
procedure fftw_execute_split_dft_c2r(p: Tfftw_plan; ri: PDouble; ii: PDouble; out_: PDouble); cdecl; external libfftw3;
procedure fftwl_execute_split_dft_c2r(p: Tfftwl_plan; ri: Plongdouble; ii: Plongdouble; out_: Plongdouble); cdecl; external libfftw3;
procedure fftwq_execute_split_dft_c2r(p: Tfftwq_plan; ri: PFloat128; ii: PFloat128; out_: PFloat128); cdecl; external libfftw3;

// ========== plan_many_r2r ==========
function fftwf_plan_many_r2r(rank: int32; n: pint32; howmany: int32; in_: PSingle; inembed: pint32; istride: int32; idist: int32; out_: PSingle; onembed: pint32; ostride: int32; odist: int32; kind: Pfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_many_r2r(rank: int32; n: pint32; howmany: int32; in_: PDouble; inembed: pint32; istride: int32; idist: int32; out_: PDouble; onembed: pint32; ostride: int32; odist: int32; kind: Pfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_many_r2r(rank: int32; n: pint32; howmany: int32; in_: Plongdouble; inembed: pint32; istride: int32; idist: int32; out_: Plongdouble; onembed: pint32; ostride: int32; odist: int32; kind: Pfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_many_r2r(rank: int32; n: pint32; howmany: int32; in_: PFloat128; inembed: pint32; istride: int32; idist: int32; out_: PFloat128; onembed: pint32; ostride: int32; odist: int32; kind: Pfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_r2r ==========
function fftwf_plan_r2r(rank: int32; n: pint32; in_: PSingle; out_: PSingle; kind: Pfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_r2r(rank: int32; n: pint32; in_: PDouble; out_: PDouble; kind: Pfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_r2r(rank: int32; n: pint32; in_: Plongdouble; out_: Plongdouble; kind: Pfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_r2r(rank: int32; n: pint32; in_: PFloat128; out_: PFloat128; kind: Pfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_r2r_1d ==========
function fftwf_plan_r2r_1d(n: int32; in_: PSingle; out_: PSingle; kind: Tfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_r2r_1d(n: int32; in_: PDouble; out_: PDouble; kind: Tfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_r2r_1d(n: int32; in_: Plongdouble; out_: Plongdouble; kind: Tfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_r2r_1d(n: int32; in_: PFloat128; out_: PFloat128; kind: Tfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_r2r_2d ==========
function fftwf_plan_r2r_2d(n0: int32; n1: int32; in_: PSingle; out_: PSingle; kind0: Tfftwf_r2r_kind; kind1: Tfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_r2r_2d(n0: int32; n1: int32; in_: PDouble; out_: PDouble; kind0: Tfftw_r2r_kind; kind1: Tfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_r2r_2d(n0: int32; n1: int32; in_: Plongdouble; out_: Plongdouble; kind0: Tfftwl_r2r_kind; kind1: Tfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_r2r_2d(n0: int32; n1: int32; in_: PFloat128; out_: PFloat128; kind0: Tfftwq_r2r_kind; kind1: Tfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_r2r_3d ==========
function fftwf_plan_r2r_3d(n0: int32; n1: int32; n2: int32; in_: PSingle; out_: PSingle; kind0: Tfftwf_r2r_kind; kind1: Tfftwf_r2r_kind; kind2: Tfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_r2r_3d(n0: int32; n1: int32; n2: int32; in_: PDouble; out_: PDouble; kind0: Tfftw_r2r_kind; kind1: Tfftw_r2r_kind; kind2: Tfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_r2r_3d(n0: int32; n1: int32; n2: int32; in_: Plongdouble; out_: Plongdouble; kind0: Tfftwl_r2r_kind; kind1: Tfftwl_r2r_kind; kind2: Tfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_r2r_3d(n0: int32; n1: int32; n2: int32; in_: PFloat128; out_: PFloat128; kind0: Tfftwq_r2r_kind; kind1: Tfftwq_r2r_kind; kind2: Tfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru_r2r ==========
function fftwf_plan_guru_r2r(rank: int32; dims: Pfftwf_iodim; howmany_rank: int32; howmany_dims: Pfftwf_iodim; in_: PSingle; out_: PSingle; kind: Pfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru_r2r(rank: int32; dims: Pfftw_iodim; howmany_rank: int32; howmany_dims: Pfftw_iodim; in_: PDouble; out_: PDouble; kind: Pfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru_r2r(rank: int32; dims: Pfftwl_iodim; howmany_rank: int32; howmany_dims: Pfftwl_iodim; in_: Plongdouble; out_: Plongdouble; kind: Pfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru_r2r(rank: int32; dims: Pfftwq_iodim; howmany_rank: int32; howmany_dims: Pfftwq_iodim; in_: PFloat128; out_: PFloat128; kind: Pfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== plan_guru64_r2r ==========
function fftwf_plan_guru64_r2r(rank: int32; dims: PTfftwf_iodim64; howmany_rank: int32; howmany_dims: PTfftwf_iodim64; in_: PSingle; out_: PSingle; kind: Pfftwf_r2r_kind; flags: uint32): Tfftwf_plan; cdecl; external libfftw3;
function fftw_plan_guru64_r2r(rank: int32; dims: PTfftw_iodim64; howmany_rank: int32; howmany_dims: PTfftw_iodim64; in_: PDouble; out_: PDouble; kind: Pfftw_r2r_kind; flags: uint32): Tfftw_plan; cdecl; external libfftw3;
function fftwl_plan_guru64_r2r(rank: int32; dims: PTfftwl_iodim64; howmany_rank: int32; howmany_dims: PTfftwl_iodim64; in_: Plongdouble; out_: Plongdouble; kind: Pfftwl_r2r_kind; flags: uint32): Tfftwl_plan; cdecl; external libfftw3;
function fftwq_plan_guru64_r2r(rank: int32; dims: PTfftwq_iodim64; howmany_rank: int32; howmany_dims: PTfftwq_iodim64; in_: PFloat128; out_: PFloat128; kind: Pfftwq_r2r_kind; flags: uint32): Tfftwq_plan; cdecl; external libfftw3;

// ========== execute_r2r ==========
procedure fftwf_execute_r2r(p: Tfftwf_plan; in_: PSingle; out_: PSingle); cdecl; external libfftw3;
procedure fftw_execute_r2r(p: Tfftw_plan; in_: PDouble; out_: PDouble); cdecl; external libfftw3;
procedure fftwl_execute_r2r(p: Tfftwl_plan; in_: Plongdouble; out_: Plongdouble); cdecl; external libfftw3;
procedure fftwq_execute_r2r(p: Tfftwq_plan; in_: PFloat128; out_: PFloat128); cdecl; external libfftw3;

// ========== destroy_plan ==========
procedure fftwf_destroy_plan(p: Tfftwf_plan); cdecl; external libfftw3;
procedure fftw_destroy_plan(p: Tfftw_plan); cdecl; external libfftw3;
procedure fftwl_destroy_plan(p: Tfftwl_plan); cdecl; external libfftw3;
procedure fftwq_destroy_plan(p: Tfftwq_plan); cdecl; external libfftw3;

// ========== forget_wisdom ==========
procedure fftwf_forget_wisdom; cdecl; external libfftw3;
procedure fftw_forget_wisdom; cdecl; external libfftw3;
procedure fftwl_forget_wisdom; cdecl; external libfftw3;
procedure fftwq_forget_wisdom; cdecl; external libfftw3;

// ========== cleanup ==========
procedure fftwf_cleanup; cdecl; external libfftw3;
procedure fftw_cleanup; cdecl; external libfftw3;
procedure fftwl_cleanup; cdecl; external libfftw3;
procedure fftwq_cleanup; cdecl; external libfftw3;

// ========== set_timelimit ==========
procedure fftwf_set_timelimit(t: double); cdecl; external libfftw3;
procedure fftw_set_timelimit(t: double); cdecl; external libfftw3;
procedure fftwl_set_timelimit(t: double); cdecl; external libfftw3;
procedure fftwq_set_timelimit(t: double); cdecl; external libfftw3;

// ========== plan_with_nthreads ==========
procedure fftwf_plan_with_nthreads(nthreads: int32); cdecl; external libfftw3;
procedure fftw_plan_with_nthreads(nthreads: int32); cdecl; external libfftw3;
procedure fftwl_plan_with_nthreads(nthreads: int32); cdecl; external libfftw3;
procedure fftwq_plan_with_nthreads(nthreads: int32); cdecl; external libfftw3;

// ========== planner_nthreads ==========
function fftwf_planner_nthreads: int32; cdecl; external libfftw3;
function fftw_planner_nthreads: int32; cdecl; external libfftw3;
function fftwl_planner_nthreads: int32; cdecl; external libfftw3;
function fftwq_planner_nthreads: int32; cdecl; external libfftw3;

// ========== init_threads ==========
function fftwf_init_threads: int32; cdecl; external libfftw3;
function fftw_init_threads: int32; cdecl; external libfftw3;
function fftwl_init_threads: int32; cdecl; external libfftw3;
function fftwq_init_threads: int32; cdecl; external libfftw3;

// ========== cleanup_threads ==========
procedure fftwf_cleanup_threads; cdecl; external libfftw3;
procedure fftw_cleanup_threads; cdecl; external libfftw3;
procedure fftwl_cleanup_threads; cdecl; external libfftw3;
procedure fftwq_cleanup_threads; cdecl; external libfftw3;

// ========== threads_set_callback ==========
type
  Tfftw_threads_work_func = function(p: pchar): Pointer; cdecl;
  Tfftw_threads_parallel_loop_func = procedure(work: Tfftw_threads_work_func; jobdata: pchar; elsize: Ptruint; njobs: int32; data: Pointer); cdecl;

procedure fftwf_threads_set_callback(parallel_loop: Tfftw_threads_parallel_loop_func; data: Pointer); cdecl; external libfftw3;
procedure fftw_threads_set_callback(parallel_loop: Tfftw_threads_parallel_loop_func; data: Pointer); cdecl; external libfftw3;
procedure fftwl_threads_set_callback(parallel_loop: Tfftw_threads_parallel_loop_func; data: Pointer); cdecl; external libfftw3;
procedure fftwq_threads_set_callback(parallel_loop: Tfftw_threads_parallel_loop_func; data: Pointer); cdecl; external libfftw3;

// ========== make_planner_thread_safe ==========
procedure fftwf_make_planner_thread_safe; cdecl; external libfftw3;
procedure fftw_make_planner_thread_safe; cdecl; external libfftw3;
procedure fftwl_make_planner_thread_safe; cdecl; external libfftw3;
procedure fftwq_make_planner_thread_safe; cdecl; external libfftw3;

// ========== export_wisdom_to_filename ==========
function fftwf_export_wisdom_to_filename(filename: pansichar): int32; cdecl; external libfftw3;
function fftw_export_wisdom_to_filename(filename: pansichar): int32; cdecl; external libfftw3;
function fftwl_export_wisdom_to_filename(filename: pansichar): int32; cdecl; external libfftw3;
function fftwq_export_wisdom_to_filename(filename: pansichar): int32; cdecl; external libfftw3;

// ========== export_wisdom_to_file ==========
procedure fftwf_export_wisdom_to_file(output_file: Pointer); cdecl; external libfftw3;
procedure fftw_export_wisdom_to_file(output_file: Pointer); cdecl; external libfftw3;
procedure fftwl_export_wisdom_to_file(output_file: Pointer); cdecl; external libfftw3;
procedure fftwq_export_wisdom_to_file(output_file: Pointer); cdecl; external libfftw3;

// ========== export_wisdom_to_string ==========
function fftwf_export_wisdom_to_string: pansichar; cdecl; external libfftw3;
function fftw_export_wisdom_to_string: pansichar; cdecl; external libfftw3;
function fftwl_export_wisdom_to_string: pansichar; cdecl; external libfftw3;
function fftwq_export_wisdom_to_string: pansichar; cdecl; external libfftw3;

// ========== export_wisdom ==========
procedure fftwf_export_wisdom(write_char: fftwf_write_char_func; data: Pointer); cdecl; external libfftw3;
procedure fftw_export_wisdom(write_char: fftw_write_char_func; data: Pointer); cdecl; external libfftw3;
procedure fftwl_export_wisdom(write_char: fftwl_write_char_func; data: Pointer); cdecl; external libfftw3;
procedure fftwq_export_wisdom(write_char: fftwq_write_char_func; data: Pointer); cdecl; external libfftw3;

// ========== import_system_wisdom ==========
function fftwf_import_system_wisdom: int32; cdecl; external libfftw3;
function fftw_import_system_wisdom: int32; cdecl; external libfftw3;
function fftwl_import_system_wisdom: int32; cdecl; external libfftw3;
function fftwq_import_system_wisdom: int32; cdecl; external libfftw3;

// ========== import_wisdom_from_filename ==========
function fftwf_import_wisdom_from_filename(filename: pansichar): int32; cdecl; external libfftw3;
function fftw_import_wisdom_from_filename(filename: pansichar): int32; cdecl; external libfftw3;
function fftwl_import_wisdom_from_filename(filename: pansichar): int32; cdecl; external libfftw3;
function fftwq_import_wisdom_from_filename(filename: pansichar): int32; cdecl; external libfftw3;

// ========== import_wisdom_from_file ==========
function fftwf_import_wisdom_from_file(input_file: Pointer): int32; cdecl; external libfftw3;
function fftw_import_wisdom_from_file(input_file: Pointer): int32; cdecl; external libfftw3;
function fftwl_import_wisdom_from_file(input_file: Pointer): int32; cdecl; external libfftw3;
function fftwq_import_wisdom_from_file(input_file: Pointer): int32; cdecl; external libfftw3;

// ========== import_wisdom_from_string ==========
function fftwf_import_wisdom_from_string(input_string: pansichar): int32; cdecl; external libfftw3;
function fftw_import_wisdom_from_string(input_string: pansichar): int32; cdecl; external libfftw3;
function fftwl_import_wisdom_from_string(input_string: pansichar): int32; cdecl; external libfftw3;
function fftwq_import_wisdom_from_string(input_string: pansichar): int32; cdecl; external libfftw3;

// ========== import_wisdom ==========
function fftwf_import_wisdom(read_char: fftwf_read_char_func; data: Pointer): int32; cdecl; external libfftw3;
function fftw_import_wisdom(read_char: fftw_read_char_func; data: Pointer): int32; cdecl; external libfftw3;
function fftwl_import_wisdom(read_char: fftwl_read_char_func; data: Pointer): int32; cdecl; external libfftw3;
function fftwq_import_wisdom(read_char: fftwq_read_char_func; data: Pointer): int32; cdecl; external libfftw3;

// ========== fprint_plan ==========
procedure fftwf_fprint_plan(p: Tfftwf_plan; output_file: Pointer); cdecl; external libfftw3;
procedure fftw_fprint_plan(p: Tfftw_plan; output_file: Pointer); cdecl; external libfftw3;
procedure fftwl_fprint_plan(p: Tfftwl_plan; output_file: Pointer); cdecl; external libfftw3;
procedure fftwq_fprint_plan(p: Tfftwq_plan; output_file: Pointer); cdecl; external libfftw3;

// ========== print_plan ==========
procedure fftwf_print_plan(p: Tfftwf_plan); cdecl; external libfftw3;
procedure fftw_print_plan(p: Tfftw_plan); cdecl; external libfftw3;
procedure fftwl_print_plan(p: Tfftwl_plan); cdecl; external libfftw3;
procedure fftwq_print_plan(p: Tfftwq_plan); cdecl; external libfftw3;

// ========== sprint_plan ==========
function fftwf_sprint_plan(p: Tfftwf_plan): pansichar; cdecl; external libfftw3;
function fftw_sprint_plan(p: Tfftw_plan): pansichar; cdecl; external libfftw3;
function fftwl_sprint_plan(p: Tfftwl_plan): pansichar; cdecl; external libfftw3;
function fftwq_sprint_plan(p: Tfftwq_plan): pansichar; cdecl; external libfftw3;

// ========== malloc ==========
function fftwf_malloc(n: Ptruint): Pointer; cdecl; external libfftw3;
function fftw_malloc(n: Ptruint): Pointer; cdecl; external libfftw3;
function fftwl_malloc(n: Ptruint): Pointer; cdecl; external libfftw3;
function fftwq_malloc(n: Ptruint): Pointer; cdecl; external libfftw3;

// ========== alloc_real ==========
function fftwf_alloc_real(n: Ptruint): PSingle; cdecl; external libfftw3;
function fftw_alloc_real(n: Ptruint): PDouble; cdecl; external libfftw3;
function fftwl_alloc_real(n: Ptruint): Plongdouble; cdecl; external libfftw3;
function fftwq_alloc_real(n: Ptruint): PFloat128; cdecl; external libfftw3;

// ========== alloc_complex ==========
function fftwf_alloc_complex(n: Ptruint): Pfftwf_complex; cdecl; external libfftw3;
function fftw_alloc_complex(n: Ptruint): Pfftw_complex; cdecl; external libfftw3;
function fftwl_alloc_complex(n: Ptruint): Pfftwl_complex; cdecl; external libfftw3;
function fftwq_alloc_complex(n: Ptruint): Pfftwq_complex; cdecl; external libfftw3;

// ========== free ==========
procedure fftwf_free(p: Pointer); cdecl; external libfftw3;
procedure fftw_free(p: Pointer); cdecl; external libfftw3;
procedure fftwl_free(p: Pointer); cdecl; external libfftw3;
procedure fftwq_free(p: Pointer); cdecl; external libfftw3;

// ========== flops ==========
procedure fftwf_flops(p: Tfftwf_plan; add: PDouble; mul: PDouble; fmas: PDouble); cdecl; external libfftw3;
procedure fftw_flops(p: Tfftw_plan; add: PDouble; mul: PDouble; fmas: PDouble); cdecl; external libfftw3;
procedure fftwl_flops(p: Tfftwl_plan; add: PDouble; mul: PDouble; fmas: PDouble); cdecl; external libfftw3;
procedure fftwq_flops(p: Tfftwq_plan; add: PDouble; mul: PDouble; fmas: PDouble); cdecl; external libfftw3;

// ========== estimate_cost ==========
function fftwf_estimate_cost(p: Tfftwf_plan): double; cdecl; external libfftw3;
function fftw_estimate_cost(p: Tfftw_plan): double; cdecl; external libfftw3;
function fftwl_estimate_cost(p: Tfftwl_plan): double; cdecl; external libfftw3;
function fftwq_estimate_cost(p: Tfftwq_plan): double; cdecl; external libfftw3;

// ========== cost ==========
function fftwf_cost(p: Tfftwf_plan): double; cdecl; external libfftw3;
function fftw_cost(p: Tfftw_plan): double; cdecl; external libfftw3;
function fftwl_cost(p: Tfftwl_plan): double; cdecl; external libfftw3;
function fftwq_cost(p: Tfftwq_plan): double; cdecl; external libfftw3;

// ========== alignment_of ==========
function fftwf_alignment_of(p: PSingle): int32; cdecl; external libfftw3;
function fftw_alignment_of(p: PDouble): int32; cdecl; external libfftw3;
function fftwl_alignment_of(p: Plongdouble): int32; cdecl; external libfftw3;
function fftwq_alignment_of(p: PFloat128): int32; cdecl; external libfftw3;

// ========== version ==========
var
  fftwf_version: pansichar; cvar; external libfftw3;
  fftw_version: pansichar; cvar; external libfftw3;
  fftwl_version: pansichar; cvar; external libfftw3;
  fftwq_version: pansichar; cvar; external libfftw3;

  // ========== cc ==========
  fftwf_cc: pansichar; cvar; external libfftw3;
  fftw_cc: pansichar; cvar; external libfftw3;
  fftwl_cc: pansichar; cvar; external libfftw3;
  fftwq_cc: pansichar; cvar; external libfftw3;

  // ========== codelet_optim ==========
  fftwf_codelet_optim: pansichar; cvar; external libfftw3;
  fftw_codelet_optim: pansichar; cvar; external libfftw3;
  fftwl_codelet_optim: pansichar; cvar; external libfftw3;
  fftwq_codelet_optim: pansichar; cvar; external libfftw3;

const
  FFTW_FORWARD = -(1);
  FFTW_BACKWARD = (1);

const
  FFTW_NO_TIMELIMIT = -(1.0);
  FFTW_MEASURE = 0;
  FFTW_DESTROY_INPUT = 1 shl 0;
  FFTW_UNALIGNED = 1 shl 1;
  FFTW_CONSERVE_MEMORY = 1 shl 2;
  FFTW_EXHAUSTIVE = 1 shl 3;
  FFTW_PRESERVE_INPUT = 1 shl 4;
  FFTW_PATIENT = 1 shl 5;
  FFTW_ESTIMATE = 1 shl 6;
  FFTW_WISDOM_ONLY = 1 shl 21;
  FFTW_ESTIMATE_PATIENT = 1 shl 7;
  FFTW_BELIEVE_PCOST = 1 shl 8;
  FFTW_NO_DFT_R2HC = 1 shl 9;
  FFTW_NO_NONTHREADED = 1 shl 10;
  FFTW_NO_BUFFERING = 1 shl 11;
  FFTW_NO_INDIRECT_OP = 1 shl 12;
  FFTW_ALLOW_LARGE_GENERIC = 1 shl 13;
  FFTW_NO_RANK_SPLITS = 1 shl 14;
  FFTW_NO_VRANK_SPLITS = 1 shl 15;
  FFTW_NO_VRECURSE = 1 shl 16;
  FFTW_NO_SIMD = 1 shl 17;
  FFTW_NO_SLOW = 1 shl 18;
  FFTW_NO_FIXED_RADIX_LARGE_N = 1 shl 19;
  FFTW_ALLOW_PRUNING = 1 shl 20;

  // === Konventiert am: 2-9-26 15:02:50 ===


implementation

end.
