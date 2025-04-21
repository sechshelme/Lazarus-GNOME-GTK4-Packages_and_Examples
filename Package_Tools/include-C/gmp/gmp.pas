unit gmp;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF Linux}
  libgmp = 'libgmp';
  {$ENDIF}

 type
   PFILE=Pointer;
   Pobstack=Pointer;
   Tva_list=Pointer;

   Tsize_t=SizeInt;
   Psize_t=^Tsize_t;

// =====================

const
  __GMP_HAVE_HOST_CPU_FAMILY_power = 0;  
  __GMP_HAVE_HOST_CPU_FAMILY_powerpc = 0;  
  GMP_LIMB_BITS = 64;  
  GMP_NAIL_BITS = 0;  

type
  Pmp_limb_t = ^Tmp_limb_t;
  Tmp_limb_t = qword;

  Pmp_limb_signed_t = ^Tmp_limb_signed_t;
  Tmp_limb_signed_t = int64;

type
  Pmp_bitcnt_t = ^Tmp_bitcnt_t;
  Tmp_bitcnt_t = dword;

  Pmpz_struct = ^Tmpz_struct;
  Tmpz_struct = record
      _mp_alloc : longint;
      _mp_size : longint;
      _mp_d : Pmp_limb_t;
    end;

const
  GMP_NUMB_BITS = GMP_LIMB_BITS - GMP_NAIL_BITS;
  GMP_NUMB_MASK = (not Tmp_limb_t(0)) shr GMP_NAIL_BITS;
  GMP_NUMB_MAX  = GMP_NUMB_MASK;
  GMP_NAIL_MASK = not GMP_NUMB_MASK;

type
  PMP_INT = ^TMP_INT;
  TMP_INT = Tmpz_struct;

  Pmpz_t = ^Tmpz_t;
//  Tmpz_t = array[0..0] of Tmpz_struct;
  Tmpz_t = Tmpz_struct;

  Pmp_ptr = ^Tmp_ptr;
  Tmp_ptr = Pmp_limb_t;

  //Pmp_srcptr = ^Tmp_srcptr;
  Tmp_srcptr = Pmp_limb_t;

type
  Pmp_size_t = ^Tmp_size_t;
  Tmp_size_t = SizeInt;

  Pmp_exp_t = ^Tmp_exp_t;
  Tmp_exp_t = longint;

type
  Pmpq_struct = ^Tmpq_struct;
  Tmpq_struct = record
      _mp_num : Tmpz_struct;
      _mp_den : Tmpz_struct;
    end;

  PMP_RAT = ^TMP_RAT;
  TMP_RAT = Tmpq_struct;

  Pmpf_struct = ^Tmpf_struct;
  Tmpf_struct = record
      _mp_prec : longint;
      _mp_size : longint;
      _mp_exp : Tmp_exp_t;
      _mp_d : Pmp_limb_t;
    end;

  Pmpq_t = ^Tmpq_t;
  Tmpq_t = array[0..0] of Tmpq_struct;

  Pgmp_randalg_t = ^Tgmp_randalg_t;
  Tgmp_randalg_t =  Longint;
  Const
    GMP_RAND_ALG_DEFAULT = 0;
    GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT;
type
  Pgmp_randstate_struct = ^Tgmp_randstate_struct;
  Tgmp_randstate_struct = record
      _mp_seed : Tmpz_t;
      _mp_alg : Tgmp_randalg_t;
      _mp_algdata : record
          case longint of
            0 : ( _mp_lc : pointer );
          end;
    end;

  Pgmp_randstate_t = ^Tgmp_randstate_t;
  Tgmp_randstate_t = array[0..0] of Tgmp_randstate_struct;

  Pmpz_srcptr = ^Tmpz_srcptr;
  Tmpz_srcptr = Pmpz_struct;

  Pmpz_ptr = ^Tmpz_ptr;
  Tmpz_ptr = Pmpz_struct;

  Pmpf_srcptr = ^Tmpf_srcptr;
  Tmpf_srcptr = Pmpf_struct;

  Pmpf_ptr = ^Tmpf_ptr;
  Tmpf_ptr = Pmpf_struct;

  Pmpq_srcptr = ^Tmpq_srcptr;
  Tmpq_srcptr = Pmpq_struct;

  Pmpq_ptr = ^Tmpq_ptr;
  Tmpq_ptr = Pmpq_struct;

  Pgmp_randstate_ptr = ^Tgmp_randstate_ptr;
  Tgmp_randstate_ptr = Pgmp_randstate_struct;

  Pgmp_randstate_srcptr = ^Tgmp_randstate_srcptr;
  Tgmp_randstate_srcptr = Pgmp_randstate_struct;

const
  _GMP_H_HAVE_OBSTACK = 1;  


//procedure mp_set_memory_functions(para1:Pprocedure (para1:Tsize_t); para2:Pprocedure (para1:pointer; para2:Tsize_t; para3:Tsize_t); para3:procedure (para1:pointer; para2:Tsize_t));cdecl;external libgmp;
//procedure mp_get_memory_functions(para1:PPprocedure (para1:Tsize_t); para2:PPprocedure (para1:pointer; para2:Tsize_t; para3:Tsize_t); para3:Pprocedure (para1:pointer; para2:Tsize_t));cdecl;external libgmp;
  var
    mp_bits_per_limb : longint;cvar;external libgmp;
    gmp_errno : longint;cvar;external libgmp;
    gmp_version : Pchar;cvar;external libgmp;
{*************** Random number routines.  *************** }

procedure gmp_randinit(para1:Tgmp_randstate_ptr; para2:Tgmp_randalg_t);varargs; cdecl;external libgmp;
procedure gmp_randinit_default(para1:Tgmp_randstate_ptr);cdecl;external libgmp;
procedure gmp_randinit_lc_2exp(para1:Tgmp_randstate_ptr; para2:Tmpz_srcptr; para3:dword; para4:Tmp_bitcnt_t);cdecl;external libgmp;
function gmp_randinit_lc_2exp_size(para1:Tgmp_randstate_ptr; para2:Tmp_bitcnt_t):longint;cdecl;external libgmp;
procedure gmp_randinit_mt(para1:Tgmp_randstate_ptr);cdecl;external libgmp;
procedure gmp_randinit_set(para1:Tgmp_randstate_ptr; para2:Tgmp_randstate_srcptr);cdecl;external libgmp;
procedure gmp_randseed(para1:Tgmp_randstate_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure gmp_randseed_ui(para1:Tgmp_randstate_ptr; para2:dword);cdecl;external libgmp;
procedure gmp_randclear(para1:Tgmp_randstate_ptr);cdecl;external libgmp;
function gmp_urandomb_ui(para1:Tgmp_randstate_ptr; para2:dword):dword;cdecl;external libgmp;
function gmp_urandomm_ui(para1:Tgmp_randstate_ptr; para2:dword):dword;cdecl;external libgmp;
{*************** Formatted output routines.  *************** }
function gmp_asprintf(para1:PPchar; para2:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_fprintf(para1:PFILE; para2:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_obstack_printf(para1:Pobstack; para2:Pchar):longint;cdecl;external libgmp;
function gmp_obstack_vprintf(para1:Pobstack; para2:Pchar; para3:Tva_list):longint;cdecl;external libgmp;
function gmp_printf(para1:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_snprintf(para1:Pchar; para2:Tsize_t; para3:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_sprintf(para1:Pchar; para2:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_vasprintf(para1:PPchar; para2:Pchar; para3:Tva_list):longint;cdecl;external libgmp;
function gmp_vfprintf(para1:PFILE; para2:Pchar; para3:Tva_list):longint;cdecl;external libgmp;
function gmp_vprintf(para1:Pchar; para2:Tva_list):longint;cdecl;external libgmp;
function gmp_vsnprintf(para1:Pchar; para2:Tsize_t; para3:Pchar; para4:Tva_list):longint;cdecl;external libgmp;
function gmp_vsprintf(para1:Pchar; para2:Pchar; para3:Tva_list):longint;cdecl;external libgmp;
{*************** Formatted input routines.  *************** }
function gmp_fscanf(para1:PFILE; para2:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_scanf(para1:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_sscanf(para1:Pchar; para2:Pchar):longint;varargs;cdecl;external libgmp;
function gmp_vfscanf(para1:PFILE; para2:Pchar; para3:Tva_list):longint;cdecl;external libgmp;
function gmp_vscanf(para1:Pchar; para2:Tva_list):longint;cdecl;external libgmp;
function gmp_vsscanf(para1:Pchar; para2:Pchar; para3:Tva_list):longint;cdecl;external libgmp;
{*************** Integer (i.e. Z) routines.  *************** }
function _mpz_realloc(para1:Tmpz_ptr; para2:Tmp_size_t):pointer;cdecl;external libgmp;
procedure mpz_abs(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_add(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_add_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_addmul(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_addmul_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_and(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_array_init(para1:Tmpz_ptr; para2:Tmp_size_t; para3:Tmp_size_t);cdecl;external libgmp;
procedure mpz_bin_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_bin_uiui(para1:Tmpz_ptr; para2:dword; para3:dword);cdecl;external libgmp;
procedure mpz_cdiv_q(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_cdiv_q_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_cdiv_q_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
procedure mpz_cdiv_qr(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external libgmp;
function mpz_cdiv_qr_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword):dword;cdecl;external libgmp;
procedure mpz_cdiv_r(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_cdiv_r_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_cdiv_r_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
function mpz_cdiv_ui(para1:Tmpz_srcptr; para2:dword):dword;cdecl;external libgmp;
procedure mpz_clear(para1:Tmpz_ptr);cdecl;external libgmp;
procedure mpz_clears(para1:Tmpz_ptr);varargs;cdecl;external libgmp;
procedure mpz_clrbit(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_cmp(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_cmp_d(para1:Tmpz_srcptr; para2:double):longint;cdecl;external libgmp;
function _mpz_cmp_si(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external libgmp;
function _mpz_cmp_ui(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external libgmp;
function mpz_cmpabs(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_cmpabs_d(para1:Tmpz_srcptr; para2:double):longint;cdecl;external libgmp;
function mpz_cmpabs_ui(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external libgmp;
procedure mpz_com(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_combit(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_congruent_p(para1:Tmpz_srcptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_congruent_2exp_p(para1:Tmpz_srcptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t):longint;cdecl;external libgmp;
function mpz_congruent_ui_p(para1:Tmpz_srcptr; para2:dword; para3:dword):longint;cdecl;external libgmp;
procedure mpz_divexact(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_divexact_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
function mpz_divisible_p(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_divisible_ui_p(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external libgmp;
function mpz_divisible_2exp_p(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):longint;cdecl;external libgmp;
procedure mpz_dump(para1:Tmpz_srcptr);cdecl;external libgmp;
function mpz_export(para1:pointer; para2:Psize_t; para3:longint; para4:Tsize_t; para5:longint; 
           para6:Tsize_t; para7:Tmpz_srcptr):pointer;cdecl;external libgmp;
procedure mpz_fac_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
procedure mpz_2fac_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
procedure mpz_mfac_uiui(para1:Tmpz_ptr; para2:dword; para3:dword);cdecl;external libgmp;
procedure mpz_primorial_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
procedure mpz_fdiv_q(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_fdiv_q_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_fdiv_q_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
procedure mpz_fdiv_qr(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external libgmp;
function mpz_fdiv_qr_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword):dword;cdecl;external libgmp;
procedure mpz_fdiv_r(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_fdiv_r_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_fdiv_r_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
function mpz_fdiv_ui(para1:Tmpz_srcptr; para2:dword):dword;cdecl;external libgmp;
procedure mpz_fib_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
procedure mpz_fib2_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:dword);cdecl;external libgmp;
function mpz_fits_sint_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_fits_slong_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_fits_sshort_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_fits_uint_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_fits_ulong_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_fits_ushort_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
procedure mpz_gcd(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
function mpz_gcd_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
procedure mpz_gcdext(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_ptr; para4:Tmpz_srcptr; para5:Tmpz_srcptr);cdecl;external libgmp;
function mpz_get_d(para1:Tmpz_srcptr):double;cdecl;external libgmp;
function mpz_get_d_2exp(para1:Plongint; para2:Tmpz_srcptr):double;cdecl;external libgmp;
function mpz_get_si(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_get_str(para1:Pchar; para2:longint; para3:Tmpz_srcptr):Pchar;cdecl;external libgmp;
function mpz_get_ui(para1:Tmpz_srcptr):dword;cdecl;external libgmp;
function mpz_getlimbn(para1:Tmpz_srcptr; para2:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpz_hamdist(para1:Tmpz_srcptr; para2:Tmpz_srcptr):Tmp_bitcnt_t;cdecl;external libgmp;
procedure mpz_import(para1:Tmpz_ptr; para2:Tsize_t; para3:longint; para4:Tsize_t; para5:longint; 
            para6:Tsize_t; para7:pointer);cdecl;external libgmp;
procedure mpz_init(para1:Tmpz_ptr);cdecl;external libgmp;
procedure mpz_init2(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpz_inits(para1:Tmpz_ptr);varargs;cdecl;external libgmp;
procedure mpz_init_set(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_init_set_d(para1:Tmpz_ptr; para2:double);cdecl;external libgmp;
procedure mpz_init_set_si(para1:Tmpz_ptr; para2:longint);cdecl;external libgmp;
function mpz_init_set_str(para1:Tmpz_ptr; para2:Pchar; para3:longint):longint;cdecl;external libgmp;
procedure mpz_init_set_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
function mpz_inp_raw(para1:Tmpz_ptr; para2:PFILE):Tsize_t;cdecl;external libgmp;
function mpz_inp_str(para1:Tmpz_ptr; para2:PFILE; para3:longint):Tsize_t;cdecl;external libgmp;
function mpz_invert(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr):longint;cdecl;external libgmp;
procedure mpz_ior(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
function mpz_jacobi(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_kronecker_si(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external libgmp;
function mpz_kronecker_ui(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external libgmp;
function mpz_si_kronecker(para1:longint; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_ui_kronecker(para1:dword; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
procedure mpz_lcm(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_lcm_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_lucnum_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
procedure mpz_lucnum2_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:dword);cdecl;external libgmp;
function mpz_millerrabin(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external libgmp;
procedure mpz_mod(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_mul(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_mul_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpz_mul_si(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:longint);cdecl;external libgmp;
procedure mpz_mul_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_neg(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_nextprime(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
function mpz_prevprime(para1:Tmpz_ptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_out_raw(para1:PFILE; para2:Tmpz_srcptr):Tsize_t;cdecl;external libgmp;
function mpz_out_str(para1:PFILE; para2:longint; para3:Tmpz_srcptr):Tsize_t;cdecl;external libgmp;
function mpz_perfect_power_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_perfect_square_p(para1:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpz_popcount(para1:Tmpz_srcptr):Tmp_bitcnt_t;cdecl;external libgmp;
procedure mpz_pow_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_powm(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_powm_sec(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_powm_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword; para4:Tmpz_srcptr);cdecl;external libgmp;
function mpz_probab_prime_p(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external libgmp;
procedure mpz_random(para1:Tmpz_ptr; para2:Tmp_size_t);cdecl;external libgmp;
procedure mpz_random2(para1:Tmpz_ptr; para2:Tmp_size_t);cdecl;external libgmp;
procedure mpz_realloc2(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_remove(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr):Tmp_bitcnt_t;cdecl;external libgmp;
function mpz_root(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):longint;cdecl;external libgmp;
procedure mpz_rootrem(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword);cdecl;external libgmp;
procedure mpz_rrandomb(para1:Tmpz_ptr; para2:Tgmp_randstate_ptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_scan0(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external libgmp;
function mpz_scan1(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external libgmp;
procedure mpz_set(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_set_d(para1:Tmpz_ptr; para2:double);cdecl;external libgmp;
procedure mpz_set_f(para1:Tmpz_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpz_set_q(para1:Tmpz_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
procedure mpz_set_si(para1:Tmpz_ptr; para2:longint);cdecl;external libgmp;
function mpz_set_str(para1:Tmpz_ptr; para2:Pchar; para3:longint):longint;cdecl;external libgmp;
procedure mpz_set_ui(para1:Tmpz_ptr; para2:dword);cdecl;external libgmp;
procedure mpz_setbit(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_size(para1:Tmpz_srcptr):Tsize_t;cdecl;external libgmp;
function mpz_sizeinbase(para1:Tmpz_srcptr; para2:longint):Tsize_t;cdecl;external libgmp;
procedure mpz_sqrt(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_sqrtrem(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_sub(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_sub_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_ui_sub(para1:Tmpz_ptr; para2:dword; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_submul(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_submul_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external libgmp;
procedure mpz_swap(para1:Tmpz_ptr; para2:Tmpz_ptr);cdecl;external libgmp;
function mpz_tdiv_ui(para1:Tmpz_srcptr; para2:dword):dword;cdecl;external libgmp;
procedure mpz_tdiv_q(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_tdiv_q_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_tdiv_q_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
procedure mpz_tdiv_qr(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external libgmp;
function mpz_tdiv_qr_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword):dword;cdecl;external libgmp;
procedure mpz_tdiv_r(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_tdiv_r_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpz_tdiv_r_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external libgmp;
function mpz_tstbit(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):longint;cdecl;external libgmp;
procedure mpz_ui_pow_ui(para1:Tmpz_ptr; para2:dword; para3:dword);cdecl;external libgmp;
procedure mpz_urandomb(para1:Tmpz_ptr; para2:Tgmp_randstate_ptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpz_urandomm(para1:Tmpz_ptr; para2:Tgmp_randstate_ptr; para3:Tmpz_srcptr);cdecl;external libgmp;
procedure mpz_xor(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external libgmp;
function mpz_limbs_read(para1:Tmpz_srcptr):Tmp_srcptr;cdecl;external libgmp;
function mpz_limbs_write(para1:Tmpz_ptr; para2:Tmp_size_t):Tmp_ptr;cdecl;external libgmp;
function mpz_limbs_modify(para1:Tmpz_ptr; para2:Tmp_size_t):Tmp_ptr;cdecl;external libgmp;
procedure mpz_limbs_finish(para1:Tmpz_ptr; para2:Tmp_size_t);cdecl;external libgmp;
function mpz_roinit_n(para1:Tmpz_ptr; para2:Tmp_srcptr; para3:Tmp_size_t):Tmpz_srcptr;cdecl;external libgmp;
{*************** Rational (i.e. Q) routines.  *************** }
procedure mpq_abs(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_add(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_canonicalize(para1:Tmpq_ptr);cdecl;external libgmp;
procedure mpq_clear(para1:Tmpq_ptr);cdecl;external libgmp;
procedure mpq_clears(para1:Tmpq_ptr);varargs;cdecl;external libgmp;
function mpq_cmp(para1:Tmpq_srcptr; para2:Tmpq_srcptr):longint;cdecl;external libgmp;
function _mpq_cmp_si(para1:Tmpq_srcptr; para2:longint; para3:dword):longint;cdecl;external libgmp;
function _mpq_cmp_ui(para1:Tmpq_srcptr; para2:dword; para3:dword):longint;cdecl;external libgmp;
function mpq_cmp_z(para1:Tmpq_srcptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
procedure mpq_div(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_div_2exp(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
function mpq_equal(para1:Tmpq_srcptr; para2:Tmpq_srcptr):longint;cdecl;external libgmp;
procedure mpq_get_num(para1:Tmpz_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_get_den(para1:Tmpz_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
function mpq_get_d(para1:Tmpq_srcptr):double;cdecl;external libgmp;
function mpq_get_str(para1:Pchar; para2:longint; para3:Tmpq_srcptr):Pchar;cdecl;external libgmp;
procedure mpq_init(para1:Tmpq_ptr);cdecl;external libgmp;
procedure mpq_inits(para1:Tmpq_ptr);varargs;cdecl;external libgmp;
function mpq_inp_str(para1:Tmpq_ptr; para2:PFILE; para3:longint):Tsize_t;cdecl;external libgmp;
procedure mpq_inv(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_mul(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_mul_2exp(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpq_neg(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
function mpq_out_str(para1:PFILE; para2:longint; para3:Tmpq_srcptr):Tsize_t;cdecl;external libgmp;
procedure mpq_set(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_set_d(para1:Tmpq_ptr; para2:double);cdecl;external libgmp;
procedure mpq_set_den(para1:Tmpq_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpq_set_f(para1:Tmpq_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpq_set_num(para1:Tmpq_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpq_set_si(para1:Tmpq_ptr; para2:longint; para3:dword);cdecl;external libgmp;
function mpq_set_str(para1:Tmpq_ptr; para2:Pchar; para3:longint):longint;cdecl;external libgmp;
procedure mpq_set_ui(para1:Tmpq_ptr; para2:dword; para3:dword);cdecl;external libgmp;
procedure mpq_set_z(para1:Tmpq_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
procedure mpq_sub(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external libgmp;
procedure mpq_swap(para1:Tmpq_ptr; para2:Tmpq_ptr);cdecl;external libgmp;
{*************** Float (i.e. F) routines.  *************** }
procedure mpf_abs(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_add(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_add_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external libgmp;
procedure mpf_ceil(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_clear(para1:Tmpf_ptr);cdecl;external libgmp;
procedure mpf_clears(para1:Tmpf_ptr);varargs;cdecl;external libgmp;
function mpf_cmp(para1:Tmpf_srcptr; para2:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_cmp_z(para1:Tmpf_srcptr; para2:Tmpz_srcptr):longint;cdecl;external libgmp;
function mpf_cmp_d(para1:Tmpf_srcptr; para2:double):longint;cdecl;external libgmp;
function mpf_cmp_si(para1:Tmpf_srcptr; para2:longint):longint;cdecl;external libgmp;
function mpf_cmp_ui(para1:Tmpf_srcptr; para2:dword):longint;cdecl;external libgmp;
procedure mpf_div(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_div_2exp(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpf_div_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external libgmp;
procedure mpf_dump(para1:Tmpf_srcptr);cdecl;external libgmp;
function mpf_eq(para1:Tmpf_srcptr; para2:Tmpf_srcptr; para3:Tmp_bitcnt_t):longint;cdecl;external libgmp;
function mpf_fits_sint_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_fits_slong_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_fits_sshort_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_fits_uint_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_fits_ulong_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_fits_ushort_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
procedure mpf_floor(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
function mpf_get_d(para1:Tmpf_srcptr):double;cdecl;external libgmp;
function mpf_get_d_2exp(para1:Plongint; para2:Tmpf_srcptr):double;cdecl;external libgmp;
function mpf_get_default_prec:Tmp_bitcnt_t;cdecl;external libgmp;
function mpf_get_prec(para1:Tmpf_srcptr):Tmp_bitcnt_t;cdecl;external libgmp;
function mpf_get_si(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
function mpf_get_str(para1:Pchar; para2:Pmp_exp_t; para3:longint; para4:Tsize_t; para5:Tmpf_srcptr):Pchar;cdecl;external libgmp;
function mpf_get_ui(para1:Tmpf_srcptr):dword;cdecl;external libgmp;
procedure mpf_init(para1:Tmpf_ptr);cdecl;external libgmp;
procedure mpf_init2(para1:Tmpf_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpf_inits(para1:Tmpf_ptr);varargs;cdecl;external libgmp;
procedure mpf_init_set(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_init_set_d(para1:Tmpf_ptr; para2:double);cdecl;external libgmp;
procedure mpf_init_set_si(para1:Tmpf_ptr; para2:longint);cdecl;external libgmp;
function mpf_init_set_str(para1:Tmpf_ptr; para2:Pchar; para3:longint):longint;cdecl;external libgmp;
procedure mpf_init_set_ui(para1:Tmpf_ptr; para2:dword);cdecl;external libgmp;
function mpf_inp_str(para1:Tmpf_ptr; para2:PFILE; para3:longint):Tsize_t;cdecl;external libgmp;
function mpf_integer_p(para1:Tmpf_srcptr):longint;cdecl;external libgmp;
procedure mpf_mul(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_mul_2exp(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpf_mul_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external libgmp;
procedure mpf_neg(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
function mpf_out_str(para1:PFILE; para2:longint; para3:Tsize_t; para4:Tmpf_srcptr):Tsize_t;cdecl;external libgmp;
procedure mpf_pow_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external libgmp;
procedure mpf_random2(para1:Tmpf_ptr; para2:Tmp_size_t; para3:Tmp_exp_t);cdecl;external libgmp;
procedure mpf_reldiff(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_set(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_set_d(para1:Tmpf_ptr; para2:double);cdecl;external libgmp;
procedure mpf_set_default_prec(para1:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpf_set_prec(para1:Tmpf_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpf_set_prec_raw(para1:Tmpf_ptr; para2:Tmp_bitcnt_t);cdecl;external libgmp;
procedure mpf_set_q(para1:Tmpf_ptr; para2:Tmpq_srcptr);cdecl;external libgmp;
procedure mpf_set_si(para1:Tmpf_ptr; para2:longint);cdecl;external libgmp;
function mpf_set_str(para1:Tmpf_ptr; para2:Pchar; para3:longint):longint;cdecl;external libgmp;
procedure mpf_set_ui(para1:Tmpf_ptr; para2:dword);cdecl;external libgmp;
procedure mpf_set_z(para1:Tmpf_ptr; para2:Tmpz_srcptr);cdecl;external libgmp;
function mpf_size(para1:Tmpf_srcptr):Tsize_t;cdecl;external libgmp;
procedure mpf_sqrt(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_sqrt_ui(para1:Tmpf_ptr; para2:dword);cdecl;external libgmp;
procedure mpf_sub(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_sub_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external libgmp;
procedure mpf_swap(para1:Tmpf_ptr; para2:Tmpf_ptr);cdecl;external libgmp;
procedure mpf_trunc(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_ui_div(para1:Tmpf_ptr; para2:dword; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_ui_sub(para1:Tmpf_ptr; para2:dword; para3:Tmpf_srcptr);cdecl;external libgmp;
procedure mpf_urandomb(para1:Tmpf_ptr; para2:Tgmp_randstate_ptr; para3:Tmp_bitcnt_t);cdecl;external libgmp;
{*********** Low level positive-integer (i.e. N) routines.  *********** }
function mpn_add(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_add_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_add_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_addmul_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_cmp(para1:Tmp_srcptr; para2:Tmp_srcptr; para3:Tmp_size_t):longint;cdecl;external libgmp;
function mpn_zero_p(para1:Tmp_srcptr; para2:Tmp_size_t):longint;cdecl;external libgmp;
procedure mpn_divexact_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t);cdecl;external libgmp;
function mpn_divexact_by3c(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_divrem(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_ptr; para4:Tmp_size_t; para5:Tmp_srcptr; 
           para6:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_divrem_1(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_divrem_2(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_ptr; para4:Tmp_size_t; para5:Tmp_srcptr):Tmp_limb_t;cdecl;external libgmp;
function mpn_div_qr_1(para1:Tmp_ptr; para2:Pmp_limb_t; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_div_qr_2(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_srcptr):Tmp_limb_t;cdecl;external libgmp;
function mpn_gcd(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_size_t; para4:Tmp_ptr; para5:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
function mpn_gcd_11(para1:Tmp_limb_t; para2:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_gcd_1(para1:Tmp_srcptr; para2:Tmp_size_t; para3:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_gcdext_1(para1:Pmp_limb_signed_t; para2:Pmp_limb_signed_t; para3:Tmp_limb_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_gcdext(para1:Tmp_ptr; para2:Tmp_ptr; para3:Pmp_size_t; para4:Tmp_ptr; para5:Tmp_size_t; 
           para6:Tmp_ptr; para7:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
function mpn_get_str(para1:Pbyte; para2:longint; para3:Tmp_ptr; para4:Tmp_size_t):Tsize_t;cdecl;external libgmp;
function mpn_hamdist(para1:Tmp_srcptr; para2:Tmp_srcptr; para3:Tmp_size_t):Tmp_bitcnt_t;cdecl;external libgmp;
function mpn_lshift(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:dword):Tmp_limb_t;cdecl;external libgmp;
function mpn_mod_1(para1:Tmp_srcptr; para2:Tmp_size_t; para3:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_mul(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_mul_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
procedure mpn_mul_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_sqr(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external libgmp;
function mpn_neg(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
procedure mpn_com(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external libgmp;
function mpn_perfect_square_p(para1:Tmp_srcptr; para2:Tmp_size_t):longint;cdecl;external libgmp;
function mpn_perfect_power_p(para1:Tmp_srcptr; para2:Tmp_size_t):longint;cdecl;external libgmp;
function mpn_popcount(para1:Tmp_srcptr; para2:Tmp_size_t):Tmp_bitcnt_t;cdecl;external libgmp;
function mpn_pow_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t; para5:Tmp_ptr):Tmp_size_t;cdecl;external libgmp;
function mpn_preinv_mod_1(para1:Tmp_srcptr; para2:Tmp_size_t; para3:Tmp_limb_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
procedure mpn_random(para1:Tmp_ptr; para2:Tmp_size_t);cdecl;external libgmp;
procedure mpn_random2(para1:Tmp_ptr; para2:Tmp_size_t);cdecl;external libgmp;
function mpn_rshift(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:dword):Tmp_limb_t;cdecl;external libgmp;
function mpn_scan0(para1:Tmp_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external libgmp;
function mpn_scan1(para1:Tmp_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external libgmp;
function mpn_set_str(para1:Tmp_ptr; para2:Pbyte; para3:Tsize_t; para4:longint):Tmp_size_t;cdecl;external libgmp;
function mpn_sizeinbase(para1:Tmp_srcptr; para2:Tmp_size_t; para3:longint):Tsize_t;cdecl;external libgmp;
function mpn_sqrtrem(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
function mpn_sub(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_sub_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_sub_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_submul_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external libgmp;
procedure mpn_tdiv_qr(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t; 
            para6:Tmp_srcptr; para7:Tmp_size_t);cdecl;external libgmp;
procedure mpn_and_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_andn_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_nand_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_ior_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_iorn_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_nior_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_xor_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_xnor_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_copyi(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external libgmp;
procedure mpn_copyd(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external libgmp;
procedure mpn_zero(para1:Tmp_ptr; para2:Tmp_size_t);cdecl;external libgmp;
function mpn_cnd_add_n(para1:Tmp_limb_t; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_cnd_sub_n(para1:Tmp_limb_t; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external libgmp;
function mpn_sec_add_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t; para5:Tmp_ptr):Tmp_limb_t;cdecl;external libgmp;
function mpn_sec_add_1_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
function mpn_sec_sub_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t; para5:Tmp_ptr):Tmp_limb_t;cdecl;external libgmp;
function mpn_sec_sub_1_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
procedure mpn_cnd_swap(para1:Tmp_limb_t; para2:Pmp_limb_t; para3:Pmp_limb_t; para4:Tmp_size_t);cdecl;external libgmp;
procedure mpn_sec_mul(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t; 
            para6:Tmp_ptr);cdecl;external libgmp;
function mpn_sec_mul_itch(para1:Tmp_size_t; para2:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
procedure mpn_sec_sqr(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_ptr);cdecl;external libgmp;
function mpn_sec_sqr_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
procedure mpn_sec_powm(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_bitcnt_t; 
            para6:Tmp_srcptr; para7:Tmp_size_t; para8:Tmp_ptr);cdecl;external libgmp;
function mpn_sec_powm_itch(para1:Tmp_size_t; para2:Tmp_bitcnt_t; para3:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
procedure mpn_sec_tabselect(para1:Pmp_limb_t; para2:Pmp_limb_t; para3:Tmp_size_t; para4:Tmp_size_t; para5:Tmp_size_t);cdecl;external libgmp;
function mpn_sec_div_qr(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t; 
           para6:Tmp_ptr):Tmp_limb_t;cdecl;external libgmp;
function mpn_sec_div_qr_itch(para1:Tmp_size_t; para2:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
procedure mpn_sec_div_r(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_ptr);cdecl;external libgmp;
function mpn_sec_div_r_itch(para1:Tmp_size_t; para2:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;
function mpn_sec_invert(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_bitcnt_t; 
           para6:Tmp_ptr):longint;cdecl;external libgmp;
function mpn_sec_invert_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external libgmp;

const  GMP_ERROR_NONE = 0;
  GMP_ERROR_UNSUPPORTED_ARGUMENT = 1;
  GMP_ERROR_DIVISION_BY_ZERO = 2;
  GMP_ERROR_SQRT_OF_NEGATIVE = 4;
  GMP_ERROR_INVALID_ARGUMENT = 8;
  GMP_ERROR_MPZ_OVERFLOW = 16  ;

  __GMP_CC = 'x86_64-linux-gnu-gcc';
  __GMP_CFLAGS = '-g -O2 -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -ffile-prefix-map=BUILDPATH=. -flto=auto -ffat-lto-objects -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -fdebug-prefix-map=BUILDPATH=/usr/src/gmp-2:6.3.0+dfsg-2ubuntu6.1 -O3';

    __GNU_MP_VERSION = 6;
  __GNU_MP_VERSION_MINOR = 3;  
  __GNU_MP_VERSION_PATCHLEVEL = 0;  
__GNU_MP_RELEASE =(__GNU_MP_VERSION * 10000 + __GNU_MP_VERSION_MINOR * 100 + __GNU_MP_VERSION_PATCHLEVEL) ;


function mpq_numref(Q : Pmpq_struct) : Pmpz_struct;
function mpq_denref(Q : Pmpq_struct) : Pmpz_struct;


// === Konventiert am: 21-4-25 15:21:24 ===


implementation


function mpq_numref(Q: Pmpq_struct): Pmpz_struct;
begin
  mpq_numref:=@(Q^._mp_num);
end;

function mpq_denref(Q: Pmpq_struct): Pmpz_struct;
begin
  mpq_denref:=@(Q^._mp_den);
end;

end.
