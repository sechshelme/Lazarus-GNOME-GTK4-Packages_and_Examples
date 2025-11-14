unit fp_gmp;

interface

const
  {$IFDEF Linux}
  libgmp = 'libgmp';
  {$ENDIF}

  {$IFDEF windows}
  libgmp = 'libgmp-10.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  Tlong_double = extended;
  {$ENDIF}

  {$IFDEF Windows}
  Tculong = uint32;
  Tclong = int64;
  Tlong_double = double;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

type
  PFILE = Pointer;
  Pobstack = Pointer;
  Tva_list = Pointer; // ????

  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  // ptr und struc in den Bezeichnern wurde entfernt und durch Pascal taugliches T und P ersetzt.

  // =====================

type
  Tgmp_randalg_t = longint;

const
  GMP_RAND_ALG_DEFAULT = 0;
  GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT;

type
  Pmp_limb_t = ^Tmp_limb_t;
  Tmp_limb_t = uint64;

  Pmp_limb_signed_t = ^Tmp_limb_signed_t;
  Tmp_limb_signed_t = int64;

  Tmp_bitcnt_t = uint64;

  Pmp_size_t = ^Tmp_size_t;
  Tmp_size_t = SizeInt;

  Pmp_exp_t = ^Tmp_exp_t;
  Tmp_exp_t = SizeInt;

type
  Tmpz = record
    _mp_alloc: longint;
    _mp_size: longint;
    _mp_d: Pmp_limb_t;
  end;
  Pmpz = ^Tmpz;

  Tmpq = record
    _mp_num: Tmpz;
    _mp_den: Tmpz;
  end;
  Pmpq = ^Tmpq;

  Tmpf = record
    _mp_prec: Tclong;
    _mp_size: Tclong;
    _mp_exp: Tmp_exp_t;
    _mp_d: Pmp_limb_t;
  end;
  Pmpf = ^Tmpf;

  Tgmp_randstate = record
    _mp_seed: Tmpz;
    _mp_alg: Tgmp_randalg_t;
    _mp_algdata: record
      case longint of
        0: (_mp_lc: pointer);
      end;
  end;
  Pgmp_randstate = ^Tgmp_randstate;

const
  GMP_LIMB_BITS = 64;
  GMP_NAIL_BITS = 0;
  GMP_NUMB_BITS = GMP_LIMB_BITS - GMP_NAIL_BITS;
  GMP_NUMB_MASK = (not Tmp_limb_t(0)) shr GMP_NAIL_BITS;
  GMP_NUMB_MAX = GMP_NUMB_MASK;
  GMP_NAIL_MASK = not GMP_NUMB_MASK;

var
  __gmp_bits_per_limb: longint; cvar;external libgmp;
  mp_bits_per_limb: longint absolute __gmp_bits_per_limb;
  __gmp_errno: longint; cvar;external libgmp;
  gmp_errno: longint absolute __gmp_errno;
  __gmp_version: pchar; cvar;external libgmp;
  gmp_version: pchar absolute __gmp_version;

{*************** Random number routines.  *************** }
procedure gmp_randinit(para1: Pgmp_randstate; para2: Tgmp_randalg_t); varargs; cdecl; external libgmp name '__gmp_randinit';
procedure gmp_randinit_default(para1: Pgmp_randstate); cdecl; external libgmp name '__gmp_randinit_default';
procedure gmp_randinit_lc_2exp(para1: Pgmp_randstate; para2: Pmpz; para3: Tculong; para4: Tmp_bitcnt_t); cdecl; external libgmp name '__gmp_randinit_lc_2exp';
function gmp_randinit_lc_2exp_size(para1: Pgmp_randstate; para2: Tmp_bitcnt_t): longint; cdecl; external libgmp name '__gmp_randinit_lc_2exp_size';
procedure gmp_randinit_mt(para1: Pgmp_randstate); cdecl; external libgmp name '__gmp_randinit_mt';
procedure gmp_randinit_set(para1: Pgmp_randstate; para2: Pgmp_randstate); cdecl; external libgmp name '__gmp_randinit_set';
procedure gmp_randseed(para1: Pgmp_randstate; para2: Pmpz); cdecl; external libgmp name '__gmp_randseed';
procedure gmp_randseed_ui(para1: Pgmp_randstate; para2: Tculong); cdecl; external libgmp name '__gmp_randseed_ui';
procedure gmp_randclear(para1: Pgmp_randstate); cdecl; external libgmp name '__gmp_randclear';
function gmp_urandomb_ui(para1: Pgmp_randstate; para2: Tculong): Tculong; cdecl; external libgmp name '__gmp_urandomb_ui';
function gmp_urandomm_ui(para1: Pgmp_randstate; para2: Tculong): Tculong; cdecl; external libgmp name '__gmp_urandomm_ui';

{*************** Formatted output routines.  *************** }
function gmp_asprintf(para1: PPchar; para2: pchar): longint; varargs; cdecl; external libgmp name '__gmp_asprintf';
function gmp_fprintf(para1: PFILE; para2: pchar): longint; varargs; cdecl; external libgmp name '__gmp_fprintf';
function gmp_obstack_printf(para1: Pobstack; para2: pchar): longint; cdecl; external libgmp name '__gmp_obstack_printf';
function gmp_obstack_vprintf(para1: Pobstack; para2: pchar; para3: Tva_list): longint; cdecl; external libgmp name '__gmp_obstack_vprintf';
function gmp_printf(para1: pchar): longint; varargs; cdecl; external libgmp name '__gmp_printf';
function gmp_snprintf(para1: pchar; para2: Tsize_t; para3: pchar): longint; varargs; cdecl; external libgmp name '__gmp_snprintf';
function gmp_sprintf(para1: pchar; para2: pchar): longint; varargs; cdecl; external libgmp name '__gmp_sprintf';
function gmp_vasprintf(para1: PPchar; para2: pchar; para3: Tva_list): longint; cdecl; external libgmp name '__gmp_vasprintf';
function gmp_vfprintf(para1: PFILE; para2: pchar; para3: Tva_list): longint; cdecl; external libgmp name '__gmp_vfprintf';
function gmp_vprintf(para1: pchar; para2: Tva_list): longint; cdecl; external libgmp name '__gmp_vprintf';
function gmp_vsnprintf(para1: pchar; para2: Tsize_t; para3: pchar; para4: Tva_list): longint; cdecl; external libgmp name '__gmp_vsnprintf';
function gmp_vsprintf(para1: pchar; para2: pchar; para3: Tva_list): longint; cdecl; external libgmp name '__gmp_vsprintf';

{*************** Formatted input routines.  *************** }
function gmp_fscanf(para1: PFILE; para2: pchar): longint; varargs; cdecl; external libgmp name '__gmp_fscanf';
function gmp_scanf(para1: pchar): longint; varargs; cdecl; external libgmp name '__gmp_scanf';
function gmp_sscanf(para1: pchar; para2: pchar): longint; varargs; cdecl; external libgmp name '__gmp_sscanf';
function gmp_vfscanf(para1: PFILE; para2: pchar; para3: Tva_list): longint; cdecl; external libgmp name '__gmp_vfscanf';
function gmp_vscanf(para1: pchar; para2: Tva_list): longint; cdecl; external libgmp name '__gmp_vscanf';
function gmp_vsscanf(para1: pchar; para2: pchar; para3: Tva_list): longint; cdecl; external libgmp name '__gmp_vsscanf';

{*************** Integer (i.e. Z) routines.  *************** }
function _mpz_realloc(para1: Pmpz; para2: Tmp_size_t): pointer; cdecl; external libgmp name '__g_mpz_realloc';
procedure mpz_abs(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_abs';
procedure mpz_add(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_add';
procedure mpz_add_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_add_ui';
procedure mpz_addmul(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_addmul';
procedure mpz_addmul_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_addmul_ui';
procedure mpz_and(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_and';
procedure mpz_array_init(para1: Pmpz; para2: Tmp_size_t; para3: Tmp_size_t); cdecl; external libgmp name '__gmpz_array_init';
procedure mpz_bin_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_bin_ui';
procedure mpz_bin_uiui(para1: Pmpz; para2: Tculong; para3: Tculong); cdecl; external libgmp name '__gmpz_bin_uiui';
procedure mpz_cdiv_q(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_cdiv_q';
procedure mpz_cdiv_q_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_cdiv_q_2exp';
function mpz_cdiv_q_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_cdiv_q_ui';
procedure mpz_cdiv_qr(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Pmpz); cdecl; external libgmp name '__gmpz_cdiv_qr';
function mpz_cdiv_qr_ui(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Tculong): Tculong; cdecl; external libgmp name '__gmpz_cdiv_qr_ui';
procedure mpz_cdiv_r(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_cdiv_r';
procedure mpz_cdiv_r_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_cdiv_r_2exp';
function mpz_cdiv_r_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_cdiv_r_ui';
function mpz_cdiv_ui(para1: Pmpz; para2: Tculong): Tculong; cdecl; external libgmp name '__gmpz_cdiv_ui';
procedure mpz_clear(para1: Pmpz); cdecl; external libgmp name '__gmpz_clear';
procedure mpz_clears(para1: Pmpz); varargs; cdecl; external libgmp name '__gmpz_clears';
procedure mpz_clrbit(para1: Pmpz; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_clrbit';
function mpz_cmp(para1: Pmpz; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_cmp';
function mpz_cmp_d(para1: Pmpz; para2: double): longint; cdecl; external libgmp name '__gmpz_cmp_d';
function _mpz_cmp_si(para1: Pmpz; para2: Tclong): longint; cdecl; external libgmp name '__gmpz_cmp_si';
function _mpz_cmp_ui(para1: Pmpz; para2: Tculong): longint; cdecl; external libgmp name '__gmpz_cmp_ui';
function mpz_cmpabs(para1: Pmpz; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_cmpabs';
function mpz_cmpabs_d(para1: Pmpz; para2: double): longint; cdecl; external libgmp name '__gmpz_cmpabs_d';
function mpz_cmpabs_ui(para1: Pmpz; para2: Tculong): longint; cdecl; external libgmp name '__gmpz_cmpabs_ui';
procedure mpz_com(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_com';
procedure mpz_combit(para1: Pmpz; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_combit';
function mpz_congruent_p(para1: Pmpz; para2: Pmpz; para3: Pmpz): longint; cdecl; external libgmp name '__gmpz_congruent_p';
function mpz_congruent_2exp_p(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t): longint; cdecl; external libgmp name '__gmpz_congruent_2exp_p';
function mpz_congruent_ui_p(para1: Pmpz; para2: Tculong; para3: Tculong): longint; cdecl; external libgmp name '__gmpz_congruent_ui_p';
procedure mpz_divexact(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_divexact';
procedure mpz_divexact_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_divexact_ui';
function mpz_divisible_p(para1: Pmpz; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_divisible_p';
function mpz_divisible_ui_p(para1: Pmpz; para2: dword): Tculong; cdecl; external libgmp name '__gmpz_divisible_ui_p';
function mpz_divisible_2exp_p(para1: Pmpz; para2: Tmp_bitcnt_t): longint; cdecl; external libgmp name '__gmpz_divisible_2exp_p';
procedure mpz_dump(para1: Pmpz); cdecl; external libgmp name '__gmpz_dump';
function mpz_export(para1: pointer; para2: Psize_t; para3: longint; para4: Tsize_t; para5: longint; para6: Tsize_t; para7: Pmpz): pointer; cdecl; external libgmp name '__gmpz_export';
procedure mpz_fac_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_fac_ui';
procedure mpz_2fac_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_2fac_ui';
procedure mpz_mfac_uiui(para1: Pmpz; para2: Tculong; para3: Tculong); cdecl; external libgmp name '__gmpz_mfac_uiui';
procedure mpz_primorial_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_primorial_ui';
procedure mpz_fdiv_q(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_fdiv_q';
procedure mpz_fdiv_q_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_fdiv_q_2exp';
function mpz_fdiv_q_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_fdiv_q_ui';
procedure mpz_fdiv_qr(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Pmpz); cdecl; external libgmp name '__gmpz_fdiv_qr';
function mpz_fdiv_qr_ui(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Tculong): Tculong; cdecl; external libgmp name '__gmpz_fdiv_qr_ui';
procedure mpz_fdiv_r(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_fdiv_r';
procedure mpz_fdiv_r_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_fdiv_r_2exp';
function mpz_fdiv_r_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_fdiv_r_ui';
function mpz_fdiv_ui(para1: Pmpz; para2: Tculong): Tculong; cdecl; external libgmp name '__gmpz_fdiv_ui';
procedure mpz_fib_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_fib_ui';
procedure mpz_fib2_ui(para1: Pmpz; para2: Pmpz; Tculong: dword); cdecl; external libgmp name '__gmpz_fib2_ui';
function mpz_fits_sint_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_fits_sint_p';
function mpz_fits_slong_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_fits_slong_p';
function mpz_fits_sshort_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_fits_sshort_p';
function mpz_fits_uint_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_fits_uint_p';
function mpz_fits_ulong_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_fits_ulong_p';
function mpz_fits_ushort_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_fits_ushort_p';
procedure mpz_gcd(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_gcd';
function mpz_gcd_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_gcd_ui';
procedure mpz_gcdext(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Pmpz; para5: Pmpz); cdecl; external libgmp name '__gmpz_gcdext';
function mpz_get_d(para1: Pmpz): double; cdecl; external libgmp name '__gmpz_get_d';
function mpz_get_d_2exp(para1: Pculong; para2: Pmpz): double; cdecl; external libgmp name '__gmpz_get_d_2exp';
function mpz_get_si(para1: Pmpz): Tclong; cdecl; external libgmp name '__gmpz_get_si';
function mpz_get_str(para1: pchar; para2: longint; para3: Pmpz): pchar; cdecl; external libgmp name '__gmpz_get_str';
function mpz_get_ui(para1: Pmpz): Tculong; cdecl; external libgmp name '__gmpz_get_ui';
function mpz_getlimbn(para1: Pmpz; para2: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpz_getlimbn';
function mpz_hamdist(para1: Pmpz; para2: Pmpz): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpz_hamdist';
procedure mpz_import(para1: Pmpz; para2: Tsize_t; para3: longint; para4: Tsize_t; para5: longint; para6: Tsize_t; para7: pointer); cdecl; external libgmp name '__gmpz_import';
procedure mpz_init(para1: Pmpz); cdecl; external libgmp name '__gmpz_init';
procedure mpz_init2(para1: Pmpz; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_init2';
procedure mpz_inits(para1: Pmpz); varargs; cdecl; external libgmp name '__gmpz_inits';
procedure mpz_init_set(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_init_set';
procedure mpz_init_set_d(para1: Pmpz; para2: double); cdecl; external libgmp name '__gmpz_init_set_d';
procedure mpz_init_set_si(para1: Pmpz; para2: Tclong); cdecl; external libgmp name '__gmpz_init_set_si';
function mpz_init_set_str(para1: Pmpz; para2: pchar; para3: longint): longint; cdecl; external libgmp name '__gmpz_init_set_str';
procedure mpz_init_set_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_init_set_ui';
function mpz_inp_raw(para1: Pmpz; para2: PFILE): Tsize_t; cdecl; external libgmp name '__gmpz_inp_raw';
function mpz_inp_str(para1: Pmpz; para2: PFILE; para3: longint): Tsize_t; cdecl; external libgmp name '__gmpz_inp_str';
function mpz_invert(para1: Pmpz; para2: Pmpz; para3: Pmpz): longint; cdecl; external libgmp name '__gmpz_invert';
procedure mpz_ior(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_ior';
function mpz_jacobi(para1: Pmpz; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_jacobi';
function mpz_kronecker_si(para1: Pmpz; para2: Tclong): longint; cdecl; external libgmp name '__gmpz_kronecker_si';
function mpz_kronecker_ui(para1: Pmpz; para2: Tculong): longint; cdecl; external libgmp name '__gmpz_kronecker_ui';
function mpz_si_kronecker(para1: Tclong; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_si_kronecker';
function mpz_ui_kronecker(para1: Tculong; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_ui_kronecker';
procedure mpz_lcm(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_lcm';
procedure mpz_lcm_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_lcm_ui';
procedure mpz_lucnum_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_lucnum_ui';
procedure mpz_lucnum2_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_lucnum2_ui';
function mpz_millerrabin(para1: Pmpz; para2: longint): longint; cdecl; external libgmp name '__gmpz_millerrabin';
procedure mpz_mod(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_mod';
procedure mpz_mul(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_mul';
procedure mpz_mul_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_mul_2exp';
procedure mpz_mul_si(para1: Pmpz; para2: Pmpz; para3: Tclong); cdecl; external libgmp name '__gmpz_mul_si';
procedure mpz_mul_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_mul_ui';
procedure mpz_neg(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_neg';
procedure mpz_nextprime(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_nextprime';
function mpz_prevprime(para1: Pmpz; para2: Pmpz): longint; cdecl; external libgmp name '__gmpz_prevprime';
function mpz_out_raw(para1: PFILE; para2: Pmpz): Tsize_t; cdecl; external libgmp name '__gmpz_out_raw';
function mpz_out_str(para1: PFILE; para2: longint; para3: Pmpz): Tsize_t; cdecl; external libgmp name '__gmpz_out_str';
function mpz_perfect_power_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_perfect_power_p';
function mpz_perfect_square_p(para1: Pmpz): longint; cdecl; external libgmp name '__gmpz_perfect_square_p';
function mpz_popcount(para1: Pmpz): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpz_popcount';
procedure mpz_pow_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_pow_ui';
procedure mpz_powm(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Pmpz); cdecl; external libgmp name '__gmpz_powm';
procedure mpz_powm_sec(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Pmpz); cdecl; external libgmp name '__gmpz_powm_sec';
procedure mpz_powm_ui(para1: Pmpz; para2: Pmpz; para3: Tculong; para4: Pmpz); cdecl; external libgmp name '__gmpz_powm_ui';
function mpz_probab_prime_p(para1: Pmpz; para2: longint): longint; cdecl; external libgmp name '__gmpz_probab_prime_p';
procedure mpz_random(para1: Pmpz; para2: Tmp_size_t); cdecl; external libgmp name '__gmpz_random';
procedure mpz_random2(para1: Pmpz; para2: Tmp_size_t); cdecl; external libgmp name '__gmpz_random2';
procedure mpz_realloc2(para1: Pmpz; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_realloc2';
function mpz_remove(para1: Pmpz; para2: Pmpz; para3: Pmpz): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpz_remove';
function mpz_root(para1: Pmpz; para2: Pmpz; para3: Tculong): longint; cdecl; external libgmp name '__gmpz_root';
procedure mpz_rootrem(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Tculong); cdecl; external libgmp name '__gmpz_rootrem';
procedure mpz_rrandomb(para1: Pmpz; para2: Pgmp_randstate; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_rrandomb';
function mpz_scan0(para1: Pmpz; para2: Tmp_bitcnt_t): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpz_scan0';
function mpz_scan1(para1: Pmpz; para2: Tmp_bitcnt_t): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpz_scan1';
procedure mpz_set(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_set';
procedure mpz_set_d(para1: Pmpz; para2: double); cdecl; external libgmp name '__gmpz_set_d';
procedure mpz_set_f(para1: Pmpz; para2: Pmpf); cdecl; external libgmp name '__gmpz_set_f';
procedure mpz_set_q(para1: Pmpz; para2: Pmpq); cdecl; external libgmp name '__gmpz_set_q';
procedure mpz_set_si(para1: Pmpz; para2: Tclong); cdecl; external libgmp name '__gmpz_set_si';
function mpz_set_str(para1: Pmpz; para2: pchar; para3: longint): longint; cdecl; external libgmp name '__gmpz_set_str';
procedure mpz_set_ui(para1: Pmpz; para2: Tculong); cdecl; external libgmp name '__gmpz_set_ui';
procedure mpz_setbit(para1: Pmpz; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_setbit';
function mpz_size(para1: Pmpz): Tsize_t; cdecl; external libgmp name '__gmpz_size';
function mpz_sizeinbase(para1: Pmpz; para2: longint): Tsize_t; cdecl; external libgmp name '__gmpz_sizeinbase';
procedure mpz_sqrt(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_sqrt';
procedure mpz_sqrtrem(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_sqrtrem';
procedure mpz_sub(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_sub';
procedure mpz_sub_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_sub_ui';
procedure mpz_ui_sub(para1: Pmpz; para2: Tculong; para3: Pmpz); cdecl; external libgmp name '__gmpz_ui_sub';
procedure mpz_submul(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_submul';
procedure mpz_submul_ui(para1: Pmpz; para2: Pmpz; para3: Tculong); cdecl; external libgmp name '__gmpz_submul_ui';
procedure mpz_swap(para1: Pmpz; para2: Pmpz); cdecl; external libgmp name '__gmpz_swap';
function mpz_tdiv_ui(para1: Pmpz; para2: Tculong): Tculong; cdecl; external libgmp name '__gmpz_tdiv_ui';
procedure mpz_tdiv_q(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_tdiv_q';
procedure mpz_tdiv_q_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_tdiv_q_2exp';
function mpz_tdiv_q_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_tdiv_q_ui';
procedure mpz_tdiv_qr(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Pmpz); cdecl; external libgmp name '__gmpz_tdiv_qr';
function mpz_tdiv_qr_ui(para1: Pmpz; para2: Pmpz; para3: Pmpz; para4: Tculong): Tculong; cdecl; external libgmp name '__gmpz_tdiv_qr_ui';
procedure mpz_tdiv_r(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_tdiv_r';
procedure mpz_tdiv_r_2exp(para1: Pmpz; para2: Pmpz; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_tdiv_r_2exp';
function mpz_tdiv_r_ui(para1: Pmpz; para2: Pmpz; para3: Tculong): Tculong; cdecl; external libgmp name '__gmpz_tdiv_r_ui';
function mpz_tstbit(para1: Pmpz; para2: Tmp_bitcnt_t): longint; cdecl; external libgmp name '__gmpz_tstbit';
procedure mpz_ui_pow_ui(para1: Pmpz; para2: Tculong; para3: Tculong); cdecl; external libgmp name '__gmpz_ui_pow_ui';
procedure mpz_urandomb(para1: Pmpz; para2: Pgmp_randstate; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpz_urandomb';
procedure mpz_urandomm(para1: Pmpz; para2: Pgmp_randstate; para3: Pmpz); cdecl; external libgmp name '__gmpz_urandomm';
procedure mpz_xor(para1: Pmpz; para2: Pmpz; para3: Pmpz); cdecl; external libgmp name '__gmpz_xor';
function mpz_limbs_read(para1: Pmpz): Pmp_limb_t; cdecl; external libgmp name '__gmpz_limbs_read';
function mpz_limbs_write(para1: Pmpz; para2: Tmp_size_t): Pmp_limb_t; cdecl; external libgmp name '__gmpz_limbs_write';
function mpz_limbs_modify(para1: Pmpz; para2: Tmp_size_t): Pmp_limb_t; cdecl; external libgmp name '__gmpz_limbs_modify';
procedure mpz_limbs_finish(para1: Pmpz; para2: Tmp_size_t); cdecl; external libgmp name '__gmpz_limbs_finish';
function mpz_roinit_n(para1: Pmpz; para2: Pmp_limb_t; para3: Tmp_size_t): Pmpz; cdecl; external libgmp name '__gmpz_roinit_n';

{*************** Rational (i.e. Q) routines.  *************** }
procedure mpq_abs(para1: Pmpq; para2: Pmpq); cdecl; external libgmp name '__gmpq_abs';
procedure mpq_add(para1: Pmpq; para2: Pmpq; para3: Pmpq); cdecl; external libgmp name '__gmpq_add';
procedure mpq_canonicalize(para1: Pmpq); cdecl; external libgmp name '__gmpq_canonicalize';
procedure mpq_clear(para1: Pmpq); cdecl; external libgmp name '__gmpq_clear';
procedure mpq_clears(para1: Pmpq); varargs; cdecl; external libgmp name '__gmpq_clears';
function mpq_cmp(para1: Pmpq; para2: Pmpq): longint; cdecl; external libgmp name '__gmpq_cmp';
function _mpq_cmp_si(para1: Pmpq; para2: Tclong; para3: Tculong): longint; cdecl; external libgmp name '__gmpq_cmp_si';
function _mpq_cmp_ui(para1: Pmpq; para2: Tculong; para3: Tculong): longint; cdecl; external libgmp name '__gmpq_cmp_ui';
function mpq_cmp_z(para1: Pmpq; para2: Pmpz): longint; cdecl; external libgmp name '__gmpq_cmp_z';
procedure mpq_div(para1: Pmpq; para2: Pmpq; para3: Pmpq); cdecl; external libgmp name '__gmpq_div';
procedure mpq_div_2exp(para1: Pmpq; para2: Pmpq; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpq_div_2exp';
function mpq_equal(para1: Pmpq; para2: Pmpq): longint; cdecl; external libgmp name '__gmpq_equal';
procedure mpq_get_num(para1: Pmpz; para2: Pmpq); cdecl; external libgmp name '__gmpq_get_num';
procedure mpq_get_den(para1: Pmpz; para2: Pmpq); cdecl; external libgmp name '__gmpq_get_den';
function mpq_get_d(para1: Pmpq): double; cdecl; external libgmp name '__gmpq_get_d';
function mpq_get_str(para1: pchar; para2: longint; para3: Pmpq): pchar; cdecl; external libgmp name '__gmpq_get_str';
procedure mpq_init(para1: Pmpq); cdecl; external libgmp name '__gmpq_init';
procedure mpq_inits(para1: Pmpq); varargs; cdecl; external libgmp name '__gmpq_inits';
function mpq_inp_str(para1: Pmpq; para2: PFILE; para3: longint): Tsize_t; cdecl; external libgmp name '__gmpq_inp_str';
procedure mpq_inv(para1: Pmpq; para2: Pmpq); cdecl; external libgmp name '__gmpq_inv';
procedure mpq_mul(para1: Pmpq; para2: Pmpq; para3: Pmpq); cdecl; external libgmp name '__gmpq_mul';
procedure mpq_mul_2exp(para1: Pmpq; para2: Pmpq; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpq_mul_2exp';
procedure mpq_neg(para1: Pmpq; para2: Pmpq); cdecl; external libgmp name '__gmpq_neg';
function mpq_out_str(para1: PFILE; para2: longint; para3: Pmpq): Tsize_t; cdecl; external libgmp name '__gmpq_out_str';
procedure mpq_set(para1: Pmpq; para2: Pmpq); cdecl; external libgmp name '__gmpq_set';
procedure mpq_set_d(para1: Pmpq; para2: double); cdecl; external libgmp name '__gmpq_set_d';
procedure mpq_set_den(para1: Pmpq; para2: Pmpz); cdecl; external libgmp name '__gmpq_set_den';
procedure mpq_set_f(para1: Pmpq; para2: Pmpf); cdecl; external libgmp name '__gmpq_set_f';
procedure mpq_set_num(para1: Pmpq; para2: Pmpz); cdecl; external libgmp name '__gmpq_set_num';
procedure mpq_set_si(para1: Pmpq; para2: Tclong; para3: Tculong); cdecl; external libgmp name '__gmpq_set_si';
function mpq_set_str(para1: Pmpq; para2: pchar; para3: longint): longint; cdecl; external libgmp name '__gmpq_set_str';
procedure mpq_set_ui(para1: Pmpq; para2: Tculong; para3: Tculong); cdecl; external libgmp name '__gmpq_set_ui';
procedure mpq_set_z(para1: Pmpq; para2: Pmpz); cdecl; external libgmp name '__gmpq_set_z';
procedure mpq_sub(para1: Pmpq; para2: Pmpq; para3: Pmpq); cdecl; external libgmp name '__gmpq_sub';
procedure mpq_swap(para1: Pmpq; para2: Pmpq); cdecl; external libgmp name '__gmpq_swap';

{*************** Float (i.e. F) routines.  *************** }
procedure mpf_abs(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_abs';
procedure mpf_add(para1: Pmpf; para2: Pmpf; para3: Pmpf); cdecl; external libgmp name '__gmpf_add';
procedure mpf_add_ui(para1: Pmpf; para2: Pmpf; para3: Tculong); cdecl; external libgmp name '__gmpf_add_ui';
procedure mpf_ceil(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_ceil';
procedure mpf_clear(para1: Pmpf); cdecl; external libgmp name '__gmpf_clear';
procedure mpf_clears(para1: Pmpf); varargs; cdecl; external libgmp name '__gmpf_clears';
function mpf_cmp(para1: Pmpf; para2: Pmpf): longint; cdecl; external libgmp name '__gmpf_cmp';
function mpf_cmp_z(para1: Pmpf; para2: Pmpz): longint; cdecl; external libgmp name '__gmpf_cmp_z';
function mpf_cmp_d(para1: Pmpf; para2: double): longint; cdecl; external libgmp name '__gmpf_cmp_d';
function mpf_cmp_si(para1: Pmpf; para2: Tclong): longint; cdecl; external libgmp name '__gmpf_cmp_si';
function mpf_cmp_ui(para1: Pmpf; para2: Tculong): longint; cdecl; external libgmp name '__gmpf_cmp_ui';
procedure mpf_div(para1: Pmpf; para2: Pmpf; para3: Pmpf); cdecl; external libgmp name '__gmpf_div';
procedure mpf_div_2exp(para1: Pmpf; para2: Pmpf; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_div_2exp';
procedure mpf_div_ui(para1: Pmpf; para2: Pmpf; para3: Tculong); cdecl; external libgmp name '__gmpf_div_ui';
procedure mpf_dump(para1: Pmpf); cdecl; external libgmp name '__gmpf_dump';
function mpf_eq(para1: Pmpf; para2: Pmpf; para3: Tmp_bitcnt_t): longint; cdecl; external libgmp name '__gmpf_eq';
function mpf_fits_sint_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_fits_sint_p';
function mpf_fits_slong_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_fits_slong_p';
function mpf_fits_sshort_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_fits_sshort_p';
function mpf_fits_uint_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_fits_uint_p';
function mpf_fits_ulong_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_fits_ulong_p';
function mpf_fits_ushort_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_fits_ushort_p';
procedure mpf_floor(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_floor';
function mpf_get_d(para1: Pmpf): double; cdecl; external libgmp name '__gmpf_get_d';
function mpf_get_d_2exp(para1: Pclong; para2: Pmpf): double; cdecl; external libgmp name '__gmpf_get_d_2exp';
function mpf_get_default_prec: Tmp_bitcnt_t; cdecl; external libgmp name '__g';
function mpf_get_prec(para1: Pmpf): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpf_get_prec';
function mpf_get_si(para1: Pmpf): Tclong; cdecl; external libgmp name '__gmpf_get_si';
function mpf_get_str(para1: pchar; para2: Pmp_exp_t; para3: longint; para4: Tsize_t; para5: Pmpf): pchar; cdecl; external libgmp name '__gmpf_get_str';
function mpf_get_ui(para1: Pmpf): Tculong; cdecl; external libgmp name '__gmpf_get_ui';
procedure mpf_init(para1: Pmpf); cdecl; external libgmp name '__gmpf_init';
procedure mpf_init2(para1: Pmpf; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_init2';
procedure mpf_inits(para1: Pmpf); varargs; cdecl; external libgmp name '__gmpf_inits';
procedure mpf_init_set(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_init_set';
procedure mpf_init_set_d(para1: Pmpf; para2: double); cdecl; external libgmp name '__gmpf_init_set_d';
procedure mpf_init_set_si(para1: Pmpf; para2: Tclong); cdecl; external libgmp name '__gmpf_init_set_si';
function mpf_init_set_str(para1: Pmpf; para2: pchar; para3: longint): longint; cdecl; external libgmp name '__gmpf_init_set_str';
procedure mpf_init_set_ui(para1: Pmpf; para2: Tculong); cdecl; external libgmp name '__gmpf_init_set_ui';
function mpf_inp_str(para1: Pmpf; para2: PFILE; para3: longint): Tsize_t; cdecl; external libgmp name '__gmpf_inp_str';
function mpf_integer_p(para1: Pmpf): longint; cdecl; external libgmp name '__gmpf_integer_p';
procedure mpf_mul(para1: Pmpf; para2: Pmpf; para3: Pmpf); cdecl; external libgmp name '__gmpf_mul';
procedure mpf_mul_2exp(para1: Pmpf; para2: Pmpf; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_mul_2exp';
procedure mpf_mul_ui(para1: Pmpf; para2: Pmpf; para3: Tculong); cdecl; external libgmp name '__gmpf_mul_ui';
procedure mpf_neg(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_neg';
function mpf_out_str(para1: PFILE; para2: longint; para3: Tsize_t; para4: Pmpf): Tsize_t; cdecl; external libgmp name '__gmpf_out_str';
procedure mpf_pow_ui(para1: Pmpf; para2: Pmpf; para3: Tculong); cdecl; external libgmp name '__gmpf_pow_ui';
procedure mpf_random2(para1: Pmpf; para2: Tmp_size_t; para3: Tmp_exp_t); cdecl; external libgmp name '__gmpf_random2';
procedure mpf_reldiff(para1: Pmpf; para2: Pmpf; para3: Pmpf); cdecl; external libgmp name '__gmpf_reldiff';
procedure mpf_set(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_set';
procedure mpf_set_d(para1: Pmpf; para2: double); cdecl; external libgmp name '__gmpf_set_d';
procedure mpf_set_default_prec(para1: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_set_default_prec';
procedure mpf_set_prec(para1: Pmpf; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_set_prec';
procedure mpf_set_prec_raw(para1: Pmpf; para2: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_set_prec_raw';
procedure mpf_set_q(para1: Pmpf; para2: Pmpq); cdecl; external libgmp name '__gmpf_set_q';
procedure mpf_set_si(para1: Pmpf; para2: Tclong); cdecl; external libgmp name '__gmpf_set_si';
function mpf_set_str(para1: Pmpf; para2: pchar; para3: longint): longint; cdecl; external libgmp name '__gmpf_set_str';
procedure mpf_set_ui(para1: Pmpf; para2: Tculong); cdecl; external libgmp name '__gmpf_set_ui';
procedure mpf_set_z(para1: Pmpf; para2: Pmpz); cdecl; external libgmp name '__gmpf_set_z';
function mpf_size(para1: Pmpf): Tsize_t; cdecl; external libgmp name '__gmpf_size';
procedure mpf_sqrt(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_sqrt';
procedure mpf_sqrt_ui(para1: Pmpf; para2: Tculong); cdecl; external libgmp name '__gmpf_sqrt_ui';
procedure mpf_sub(para1: Pmpf; para2: Pmpf; para3: Pmpf); cdecl; external libgmp name '__gmpf_sub';
procedure mpf_sub_ui(para1: Pmpf; para2: Pmpf; para3: Tculong); cdecl; external libgmp name '__gmpf_sub_ui';
procedure mpf_swap(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_swap';
procedure mpf_trunc(para1: Pmpf; para2: Pmpf); cdecl; external libgmp name '__gmpf_trunc';
procedure mpf_ui_div(para1: Pmpf; para2: Tculong; para3: Pmpf); cdecl; external libgmp name '__gmpf_ui_div';
procedure mpf_ui_sub(para1: Pmpf; para2: Tculong; para3: Pmpf); cdecl; external libgmp name '__gmpf_ui_sub';
procedure mpf_urandomb(para1: Pmpf; para2: Pgmp_randstate; para3: Tmp_bitcnt_t); cdecl; external libgmp name '__gmpf_urandomb';

{*********** Low level positive-integer (i.e. N) routines.  *********** }
function mpn_add(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_add';
function mpn_add_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_add_1';
function mpn_add_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_add_n';
function mpn_addmul_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_addmul_1';
function mpn_cmp(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t): longint; cdecl; external libgmp name '__gmpn_cmp';
function mpn_zero_p(para1: Pmp_limb_t; para2: Tmp_size_t): longint; cdecl; external libgmp name '__gmpn_zero_p';
procedure mpn_divexact_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t); cdecl; external libgmp name '__gmpn_divexact_1';
function mpn_divexact_by3c(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_divexact_by3c';
function mpn_divrem(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Pmp_limb_t; para6: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_divrem';
function mpn_divrem_1(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_divrem_1';
function mpn_divrem_2(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Pmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_divrem_2';
function mpn_div_qr_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_div_qr_1';
function mpn_div_qr_2(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Pmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_div_qr_2';
function mpn_gcd(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_gcd';
function mpn_gcd_11(para1: Tmp_limb_t; para2: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_gcd_11';
function mpn_gcd_1(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_gcd_1';
function mpn_gcdext_1(para1: Pmp_limb_signed_t; para2: Pmp_limb_signed_t; para3: Tmp_limb_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_gcdext_1';
function mpn_gcdext(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t; para6: Pmp_limb_t; para7: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_gcdext';
function mpn_get_str(para1: pbyte; para2: longint; para3: Pmp_limb_t; para4: Tmp_size_t): Tsize_t; cdecl; external libgmp name '__gmpn_get_str';
function mpn_hamdist(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpn_hamdist';
function mpn_lshift(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: dword): Tmp_limb_t; cdecl; external libgmp name '__gmpn_lshift';
function mpn_mod_1(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_mod_1';
function mpn_mul(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_mul';
function mpn_mul_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_mul_1';
procedure mpn_mul_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_mul_n';
procedure mpn_sqr(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t); cdecl; external libgmp name '__gmpn_sqr';
function mpn_neg(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_neg';
procedure mpn_com(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t); cdecl; external libgmp name '__gmpn_com';
function mpn_perfect_square_p(para1: Pmp_limb_t; para2: Tmp_size_t): longint; cdecl; external libgmp name '__gmpn_perfect_square_p';
function mpn_perfect_power_p(para1: Pmp_limb_t; para2: Tmp_size_t): longint; cdecl; external libgmp name '__gmpn_perfect_power_p';
function mpn_popcount(para1: Pmp_limb_t; para2: Tmp_size_t): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpn_popcount';
function mpn_pow_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t; para5: Pmp_limb_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_pow_1';
function mpn_preinv_mod_1(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Tmp_limb_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_preinv_mod_1';
procedure mpn_random(para1: Pmp_limb_t; para2: Tmp_size_t); cdecl; external libgmp name '__gmpn_random';
procedure mpn_random2(para1: Pmp_limb_t; para2: Tmp_size_t); cdecl; external libgmp name '__gmpn_random2';
function mpn_rshift(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: dword): Tmp_limb_t; cdecl; external libgmp name '__gmpn_rshift';
function mpn_scan0(para1: Pmp_limb_t; para2: Tmp_bitcnt_t): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpn_scan0';
function mpn_scan1(para1: Pmp_limb_t; para2: Tmp_bitcnt_t): Tmp_bitcnt_t; cdecl; external libgmp name '__gmpn_scan1';
function mpn_set_str(para1: Pmp_limb_t; para2: pbyte; para3: Tsize_t; para4: longint): Tmp_size_t; cdecl; external libgmp name '__gmpn_set_str';
function mpn_sizeinbase(para1: Pmp_limb_t; para2: Tmp_size_t; para3: longint): Tsize_t; cdecl; external libgmp name '__gmpn_sizeinbase';
function mpn_sqrtrem(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sqrtrem';
function mpn_sub(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_sub';
function mpn_sub_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_sub_1';
function mpn_sub_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_sub_n';
function mpn_submul_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_submul_1';
procedure mpn_tdiv_qr(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t; para6: Pmp_limb_t; para7: Tmp_size_t); cdecl; external libgmp name '__gmpn_tdiv_qr';
procedure mpn_and_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_and_n';
procedure mpn_andn_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_andn_n';
procedure mpn_nand_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_nand_n';
procedure mpn_ior_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_ior_n';
procedure mpn_iorn_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_iorn_n';
procedure mpn_nior_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_nior_n';
procedure mpn_xor_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_xor_n';
procedure mpn_xnor_n(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_xnor_n';
procedure mpn_copyi(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t); cdecl; external libgmp name '__gmpn_copyi';
procedure mpn_copyd(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t); cdecl; external libgmp name '__gmpn_copyd';
procedure mpn_zero(para1: Pmp_limb_t; para2: Tmp_size_t); cdecl; external libgmp name '__gmpn_zero';
function mpn_cnd_add_n(para1: Tmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Pmp_limb_t; para5: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_cnd_add_n';
function mpn_cnd_sub_n(para1: Tmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Pmp_limb_t; para5: Tmp_size_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_cnd_sub_n';
function mpn_sec_add_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t; para5: Pmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_sec_add_1';
function mpn_sec_add_1_itch(para1: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_add_1_itch';
function mpn_sec_sub_1(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_limb_t; para5: Pmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_sec_sub_1';
function mpn_sec_sub_1_itch(para1: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_sub_1_itch';
procedure mpn_cnd_swap(para1: Tmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t); cdecl; external libgmp name '__gmpn_cnd_swap';
procedure mpn_sec_mul(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t; para6: Pmp_limb_t); cdecl; external libgmp name '__gmpn_sec_mul';
function mpn_sec_mul_itch(para1: Tmp_size_t; para2: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_mul_itch';
procedure mpn_sec_sqr(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t); cdecl; external libgmp name '__gmpn_sec_sqr';
function mpn_sec_sqr_itch(para1: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_sqr_itch';
procedure mpn_sec_powm(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_bitcnt_t; para6: Pmp_limb_t; para7: Tmp_size_t; para8: Pmp_limb_t); cdecl; external libgmp name '__gmpn_sec_powm';
function mpn_sec_powm_itch(para1: Tmp_size_t; para2: Tmp_bitcnt_t; para3: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_powm_itch';
procedure mpn_sec_tabselect(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Tmp_size_t; para5: Tmp_size_t); cdecl; external libgmp name '__gmpn_sec_tabselect';
function mpn_sec_div_qr(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Tmp_size_t; para4: Pmp_limb_t; para5: Tmp_size_t; para6: Pmp_limb_t): Tmp_limb_t; cdecl; external libgmp name '__gmpn_sec_div_qr';
function mpn_sec_div_qr_itch(para1: Tmp_size_t; para2: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_div_qr_itch';
procedure mpn_sec_div_r(para1: Pmp_limb_t; para2: Tmp_size_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Pmp_limb_t); cdecl; external libgmp name '__gmpn_sec_div_r';
function mpn_sec_div_r_itch(para1: Tmp_size_t; para2: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_div_r_itch';
function mpn_sec_invert(para1: Pmp_limb_t; para2: Pmp_limb_t; para3: Pmp_limb_t; para4: Tmp_size_t; para5: Tmp_bitcnt_t; para6: Pmp_limb_t): longint; cdecl; external libgmp name '__gmpn_sec_invert';
function mpn_sec_invert_itch(para1: Tmp_size_t): Tmp_size_t; cdecl; external libgmp name '__gmpn_sec_invert_itch';

const
  GMP_ERROR_NONE = 0;
  GMP_ERROR_UNSUPPORTED_ARGUMENT = 1;
  GMP_ERROR_DIVISION_BY_ZERO = 2;
  GMP_ERROR_SQRT_OF_NEGATIVE = 4;
  GMP_ERROR_INVALID_ARGUMENT = 8;
  GMP_ERROR_MPZ_OVERFLOW = 16;

  __GMP_CC = 'x86_64-linux-gnu-gcc';
  __GMP_CFLAGS = '-g -O2 -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -ffile-prefix-map=BUILDPATH=. -flto=auto -ffat-lto-objects -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -fdebug-prefix-map=BUILDPATH=/usr/src/gmp-2:6.3.0+dfsg-2ubuntu6.1 -O3';

  __GNU_MP_VERSION = 6;
  __GNU_MP_VERSION_MINOR = 3;
  __GNU_MP_VERSION_PATCHLEVEL = 0;
  __GNU_MP_RELEASE = (__GNU_MP_VERSION * 10000 + __GNU_MP_VERSION_MINOR * 100 + __GNU_MP_VERSION_PATCHLEVEL);


function mpq_numref(Q: Pmpq): Pmpz;
function mpq_denref(Q: Pmpq): Pmpz;
function mpz_sgn(Z: Pmpz): longint;
function mpf_sgn(F: Pmpf): longint;
function mpq_sgn(Q: Pmpq): longint;
function mpz_cmp_ui(Z: Pmpz; UI: cardinal): longint;
function mpz_cmp_si(Z: Pmpz; UI: cardinal): longint;
function mpq_cmp_ui(Q: Pmpq; NUI, DUI: cardinal): longint;
function mpq_cmp_si(q: Pmpq; n: longint; d: cardinal): longint;
function mpz_odd_p(z: Pmpz): boolean;
function mpz_even_p(z: Pmpz): boolean;
function mpn_divmod(qp, np: Pointer; nsize: Tmp_size_t; dp: Pointer; dsize: Tmp_size_t): Tmp_limb_t;
procedure mpz_mdivmod_ui(q, r, n: Pmpz; d: Tmp_limb_t);
function mpz_mmod_ui(r, n: Pmpz; d: Tmp_limb_t): Tmp_limb_t;



// === Konventiert am: 21-4-25 15:21:24 ===


implementation


function mpq_numref(Q: Pmpq): Pmpz;
begin
  mpq_numref := @(Q^._mp_num);
end;

function mpq_denref(Q: Pmpq): Pmpz;
begin
  mpq_denref := @(Q^._mp_den);
end;

function mpz_sgn(Z: Pmpz): longint;
begin
  if Z^._mp_size < 0 then begin
    Result := -1;
  end else if Z^._mp_size > 0 then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;

function mpf_sgn(F: Pmpf): longint;
begin
  if F^._mp_size < 0 then begin
    Result := -1;
  end else if F^._mp_size > 0 then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;

function mpq_sgn(Q: Pmpq): longint;
begin
  if Q^._mp_num._mp_size < 0 then begin
    Result := -1;
  end else if Q^._mp_num._mp_size > 0 then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;

function mpz_cmp_ui(Z: Pmpz; UI: cardinal): longint;
begin
  mpz_cmp_ui := _mpz_cmp_ui(Z, UI);
end;

function mpz_cmp_si(Z: Pmpz; UI: cardinal): longint;
begin
  mpz_cmp_si := _mpz_cmp_si(Z, UI);
end;

function mpq_cmp_ui(Q: Pmpq; NUI, DUI: cardinal): longint;
begin
  mpq_cmp_ui := _mpq_cmp_ui(Q, NUI, DUI);
end;

function mpq_cmp_si(q: Pmpq; n: longint; d: cardinal): longint;
begin
  mpq_cmp_si := _mpq_cmp_si(q, n, d);
end;

function mpz_odd_p(z: Pmpz): boolean;
begin
  mpz_odd_p := (z^._mp_size <> 0) and ((z^._mp_d^ and 1) <> 0);
end;

function mpz_even_p(z: Pmpz): boolean;
begin
  mpz_even_p := not (mpz_odd_p(z));
end;

function mpn_divmod(qp, np: Pointer; nsize: Tmp_size_t; dp: Pointer; dsize: Tmp_size_t): Tmp_limb_t;
begin
  Result := mpn_divrem(qp, 0, np, nsize, dp, dsize);
end;

procedure mpz_mdivmod_ui(q, r, n: Pmpz; d: Tmp_limb_t);
begin
  if r = nil then begin
    mpz_fdiv_q_ui(q, n, d);
  end else begin
    mpz_fdiv_qr_ui(q, r, n, d);
  end;
end;

function mpz_mmod_ui(r, n: Pmpz; d: Tmp_limb_t): Tmp_limb_t;
begin
  if r = nil then begin
    Result := mpz_fdiv_ui(n, d);
  end else begin
    Result := mpz_fdiv_r_ui(r, n, d);
  end;
end;

procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;

begin
  //  SetMXCSR;
end.
