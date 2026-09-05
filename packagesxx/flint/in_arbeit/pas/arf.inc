{$IFDEF read_interface}


{
    Copyright (C) 2014 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
type
  Parf_rnd_t = ^Tarf_rnd_t;
  Tarf_rnd_t =  Longint;
  Const
    ARF_RND_DOWN = 0;
    ARF_RND_UP = 1;
    ARF_RND_FLOOR = 2;
    ARF_RND_CEIL = 3;
    ARF_RND_NEAR = 4;
;

function arf_rounds_down(rnd:Tarf_rnd_t; sgnbit:longint):longint;cdecl;external libflint;
function arf_rounds_up(rnd:Tarf_rnd_t; sgnbit:longint):longint;cdecl;external libflint;
{$ifdef __MPFR_H}
function arf_rnd_to_mpfr(rnd:Tarf_rnd_t):Tmpfr_rnd_t;cdecl;external libflint;
{$endif}
{ Allow 'infinite' precision for operations where a result can be computed exactly.  }

const
  ARF_PREC_EXACT = WORD_MAX;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ARF_PREC_ADD(prec,extra : longint) : longint;

const
  ARF_RESULT_EXACT = 0;  
  ARF_RESULT_INEXACT = 1;  
{ Range where we can skip fmpz overflow checks for exponent manipulation.  }
  ARF_MAX_LAGOM_EXP = MAG_MAX_LAGOM_EXP;  
  ARF_MIN_LAGOM_EXP = MAG_MIN_LAGOM_EXP;  
{ Exponent values used to encode special values.  }
  ARF_EXP_ZERO = 0;  
  ARF_EXP_NAN = COEFF_MIN;  
  ARF_EXP_POS_INF = COEFF_MIN+1;  
  ARF_EXP_NEG_INF = COEFF_MIN+2;  
{ Direct access to the exponent.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ARF_EXP(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARF_EXPREF(x : longint) : longint;

procedure _arf_promote(x:Tarf_t; n:Tmp_size_t);cdecl;external libflint;
procedure _arf_demote(x:Tarf_t);cdecl;external libflint;
procedure arf_init(x:Tarf_t);cdecl;external libflint;
procedure arf_clear(x:Tarf_t);cdecl;external libflint;
function _arf_vec_init(n:Tslong):Tarf_ptr;cdecl;external libflint;
procedure _arf_vec_clear(v:Tarf_ptr; n:Tslong);cdecl;external libflint;
procedure arf_zero(x:Tarf_t);cdecl;external libflint;
procedure arf_pos_inf(x:Tarf_t);cdecl;external libflint;
procedure arf_neg_inf(x:Tarf_t);cdecl;external libflint;
procedure arf_nan(x:Tarf_t);cdecl;external libflint;
function arf_is_special(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_zero(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_pos_inf(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_neg_inf(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_nan(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_normal(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_finite(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_inf(x:Tarf_t):longint;cdecl;external libflint;
procedure arf_one(x:Tarf_t);cdecl;external libflint;
function arf_is_one(x:Tarf_t):longint;cdecl;external libflint;
function arf_sgn(x:Tarf_t):longint;cdecl;external libflint;
function arf_cmp(x:Tarf_t; y:Tarf_t):longint;cdecl;external libflint;
function arf_cmpabs(x:Tarf_t; y:Tarf_t):longint;cdecl;external libflint;
function arf_cmpabs_ui(x:Tarf_t; y:Tulong):longint;cdecl;external libflint;
function arf_cmpabs_d(x:Tarf_t; y:Tdouble):longint;cdecl;external libflint;
function arf_cmp_si(x:Tarf_t; y:Tslong):longint;cdecl;external libflint;
function arf_cmp_ui(x:Tarf_t; y:Tulong):longint;cdecl;external libflint;
function arf_cmp_d(x:Tarf_t; y:Tdouble):longint;cdecl;external libflint;
procedure arf_swap(y:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_set(y:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_neg(y:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_init_set_ui(x:Tarf_t; v:Tulong);cdecl;external libflint;
{ FLINT_ABS is unsafe for x = WORD_MIN  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function UI_ABS_SI(x : longint) : longint;

procedure arf_init_set_si(x:Tarf_t; v:Tslong);cdecl;external libflint;
procedure arf_set_ui(x:Tarf_t; v:Tulong);cdecl;external libflint;
procedure arf_set_si(x:Tarf_t; v:Tslong);cdecl;external libflint;
procedure arf_init_set_shallow(z:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_init_neg_shallow(z:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_init_set_mag_shallow(y:Tarf_t; x:Tmag_t);cdecl;external libflint;
procedure arf_init_neg_mag_shallow(z:Tarf_t; x:Tmag_t);cdecl;external libflint;
function arf_cmpabs_mag(x:Tarf_t; y:Tmag_t):longint;cdecl;external libflint;
function arf_mag_cmpabs(x:Tmag_t; y:Tarf_t):longint;cdecl;external libflint;
{ Assumes xn > 0, x[xn-1] != 0.  }
{ TBD: 1, 2 limb versions  }
procedure arf_set_mpn(y:Tarf_t; x:Tmp_srcptr; xn:Tmp_size_t; sgnbit:longint);cdecl;external libflint;
procedure arf_set_mpz(y:Tarf_t; x:Tmpz_t);cdecl;external libflint;
procedure arf_set_fmpz(y:Tarf_t; x:Tfmpz_t);cdecl;external libflint;
function _arf_set_round_ui(x:Tarf_t; v:Tulong; sgnbit:longint; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function _arf_set_round_uiui(z:Tarf_t; fix:Pslong; hi:Tmp_limb_t; lo:Tmp_limb_t; sgnbit:longint; 
           prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function _arf_set_round_mpn(y:Tarf_t; exp_shift:Pslong; x:Tmp_srcptr; xn:Tmp_size_t; sgnbit:longint; 
           prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_set_round_ui(x:Tarf_t; v:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_set_round_si(x:Tarf_t; v:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_set_round_mpz(y:Tarf_t; x:Tmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_set_round_fmpz(y:Tarf_t; x:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_set_round(y:Tarf_t; x:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_neg_round(y:Tarf_t; x:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
{$ifdef __MPFR_H}
function arf_get_mpfr(x:Tmpfr_t; y:Tarf_t; rnd:Tmpfr_rnd_t):longint;cdecl;external libflint;
procedure arf_set_mpfr(x:Tarf_t; y:Tmpfr_t);cdecl;external libflint;
function _arf_call_mpfr_func(r1:Tarf_ptr; r2:Tarf_ptr; func:function :longint; x:Tarf_srcptr; y:Tarf_srcptr; 
           prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
{$endif}

function arf_equal(x:Tarf_t; y:Tarf_t):longint;cdecl;external libflint;
function arf_equal_si(x:Tarf_t; y:Tslong):longint;cdecl;external libflint;
function arf_equal_ui(x:Tarf_t; y:Tulong):longint;cdecl;external libflint;
function arf_equal_d(x:Tarf_t; y:Tdouble):longint;cdecl;external libflint;
procedure arf_min(z:Tarf_t; a:Tarf_t; b:Tarf_t);cdecl;external libflint;
procedure arf_max(z:Tarf_t; a:Tarf_t; b:Tarf_t);cdecl;external libflint;
procedure arf_abs(y:Tarf_t; x:Tarf_t);cdecl;external libflint;
function arf_bits(x:Tarf_t):Tslong;cdecl;external libflint;
procedure arf_bot(e:Tfmpz_t; x:Tarf_t);cdecl;external libflint;
function arf_is_int(x:Tarf_t):longint;cdecl;external libflint;
function arf_is_int_2exp_si(x:Tarf_t; e:Tslong):longint;cdecl;external libflint;
function arf_cmp_2exp_si(x:Tarf_t; e:Tslong):longint;cdecl;external libflint;
function arf_cmpabs_2exp_si(x:Tarf_t; e:Tslong):longint;cdecl;external libflint;
procedure arf_set_si_2exp_si(x:Tarf_t; man:Tslong; exp:Tslong);cdecl;external libflint;
procedure arf_set_ui_2exp_si(x:Tarf_t; man:Tulong; exp:Tslong);cdecl;external libflint;
procedure arf_mul_2exp_si(y:Tarf_t; x:Tarf_t; e:Tslong);cdecl;external libflint;
procedure arf_mul_2exp_fmpz(y:Tarf_t; x:Tarf_t; e:Tfmpz_t);cdecl;external libflint;
function arf_set_round_fmpz_2exp(y:Tarf_t; x:Tfmpz_t; exp:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
procedure arf_abs_bound_lt_2exp_fmpz(b:Tfmpz_t; x:Tarf_t);cdecl;external libflint;
procedure arf_abs_bound_le_2exp_fmpz(b:Tfmpz_t; x:Tarf_t);cdecl;external libflint;
function arf_abs_bound_lt_2exp_si(x:Tarf_t):Tslong;cdecl;external libflint;
procedure arf_frexp(man:Tarf_t; exp:Tfmpz_t; x:Tarf_t);cdecl;external libflint;
procedure arf_get_fmpz_2exp(man:Tfmpz_t; exp:Tfmpz_t; x:Tarf_t);cdecl;external libflint;
function _arf_get_integer_mpn(y:Tmp_ptr; x:Tmp_srcptr; xn:Tmp_size_t; exp:Tslong):longint;cdecl;external libflint;
function _arf_set_mpn_fixed(z:Tarf_t; xp:Tmp_srcptr; xn:Tmp_size_t; fixn:Tmp_size_t; negative:longint; 
           prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_get_fmpz(z:Tfmpz_t; x:Tarf_t; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_get_si(x:Tarf_t; rnd:Tarf_rnd_t):Tslong;cdecl;external libflint;
function arf_get_fmpz_fixed_fmpz(y:Tfmpz_t; x:Tarf_t; e:Tfmpz_t):longint;cdecl;external libflint;
function arf_get_fmpz_fixed_si(y:Tfmpz_t; x:Tarf_t; e:Tslong):longint;cdecl;external libflint;
procedure arf_set_fmpz_2exp(x:Tarf_t; man:Tfmpz_t; exp:Tfmpz_t);cdecl;external libflint;
procedure arf_floor(z:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_ceil(z:Tarf_t; x:Tarf_t);cdecl;external libflint;
procedure arf_debug(x:Tarf_t);cdecl;external libflint;
function arf_get_str(x:Tarf_t; d:Tslong):Pchar;cdecl;external libflint;
{$ifdef FLINT_HAVE_FILE}
procedure arf_fprint(file:PFILE; x:Tarf_t);cdecl;external libflint;
procedure arf_fprintd(file:PFILE; y:Tarf_t; d:Tslong);cdecl;external libflint;
{$endif}

procedure arf_print(x:Tarf_t);cdecl;external libflint;
procedure arf_printd(y:Tarf_t; d:Tslong);cdecl;external libflint;
procedure arf_randtest(x:Tarf_t; state:Tflint_rand_t; bits:Tslong; mag_bits:Tslong);cdecl;external libflint;
procedure arf_randtest_not_zero(x:Tarf_t; state:Tflint_rand_t; bits:Tslong; mag_bits:Tslong);cdecl;external libflint;
procedure arf_randtest_special(x:Tarf_t; state:Tflint_rand_t; bits:Tslong; mag_bits:Tslong);cdecl;external libflint;
procedure arf_urandom(x:Tarf_t; state:Tflint_rand_t; bits:Tslong; rnd:Tarf_rnd_t);cdecl;external libflint;
const
  MUL_MPFR_MIN_LIMBS = 25;  
{$ifdef FLINT_HAVE_FFT_SMALL}
  MUL_MPFR_MAX_LIMBS = 800;  
{$else}

const
  MUL_MPFR_MAX_LIMBS = 10000;  
{$endif}

const
  ARF_MUL_STACK_ALLOC = 40;  
  ARF_MUL_TLS_ALLOC = 1000;  
  var
    __arf_mul_tmp : Tmp_ptr;cvar;external libflint;
    __arf_mul_alloc : Tslong;cvar;external libflint;

procedure _arf_mul_tmp_cleanup;cdecl;external libflint;
procedure arf_mul_special(z:Tarf_t; x:Tarf_t; y:Tarf_t);cdecl;external libflint;
function arf_mul_via_mpfr(z:Tarf_t; x:Tarf_t; y:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_mul_rnd_any(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_mul_rnd_down(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong):longint;cdecl;external libflint;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arf_mul(z,x,y,prec,rnd : longint) : longint;

function arf_neg_mul(z:Tarf_t; x:Tarf_t; y:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_mul_ui(z:Tarf_ptr; x:Tarf_srcptr; y:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_mul_si(z:Tarf_ptr; x:Tarf_srcptr; y:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_mul_mpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_mul_fmpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
const
  ARF_ADD_STACK_ALLOC = 40;  
  ARF_ADD_TLS_ALLOC = 1000;  
  var
    __arf_add_tmp : Tmp_ptr;cvar;external libflint;
    __arf_add_alloc : Tslong;cvar;external libflint;

procedure _arf_add_tmp_cleanup;cdecl;external libflint;
function _arf_add_mpn(z:Tarf_t; xp:Tmp_srcptr; xn:Tmp_size_t; xsgnbit:longint; xexp:Tfmpz_t; 
           yp:Tmp_srcptr; yn:Tmp_size_t; ysgnbit:longint; shift:Tflint_bitcnt_t; prec:Tslong; 
           rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_add(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_add_si(z:Tarf_ptr; x:Tarf_srcptr; y:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_add_ui(z:Tarf_ptr; x:Tarf_srcptr; y:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_add_fmpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_add_fmpz_2exp(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; exp:Tfmpz_t; prec:Tslong; 
           rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sub(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sub_si(z:Tarf_ptr; x:Tarf_srcptr; y:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sub_ui(z:Tarf_ptr; x:Tarf_srcptr; y:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sub_fmpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_addmul(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_addmul_ui(z:Tarf_ptr; x:Tarf_srcptr; y:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_addmul_si(z:Tarf_ptr; x:Tarf_srcptr; y:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_addmul_mpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_addmul_fmpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_submul(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_submul_ui(z:Tarf_ptr; x:Tarf_srcptr; y:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_submul_si(z:Tarf_ptr; x:Tarf_srcptr; y:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_submul_mpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_submul_fmpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_fma(res:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; z:Tarf_srcptr; prec:Tslong; 
           rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sosq(z:Tarf_t; x:Tarf_t; y:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_div(z:Tarf_ptr; x:Tarf_srcptr; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_div_ui(z:Tarf_ptr; x:Tarf_srcptr; y:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_ui_div(z:Tarf_ptr; x:Tulong; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_div_si(z:Tarf_ptr; x:Tarf_srcptr; y:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_si_div(z:Tarf_ptr; x:Tslong; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_div_fmpz(z:Tarf_ptr; x:Tarf_srcptr; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_fmpz_div(z:Tarf_ptr; x:Tfmpz_t; y:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_fmpz_div_fmpz(z:Tarf_ptr; x:Tfmpz_t; y:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sqrt(z:Tarf_ptr; x:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sqrt_ui(z:Tarf_t; x:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sqrt_fmpz(z:Tarf_t; x:Tfmpz_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_rsqrt(z:Tarf_ptr; x:Tarf_srcptr; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_root(z:Tarf_ptr; x:Tarf_srcptr; k:Tulong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
{ Magnitude bounds  }
procedure arf_get_mag(y:Tmag_t; x:Tarf_t);cdecl;external libflint;
procedure arf_get_mag_lower(y:Tmag_t; x:Tarf_t);cdecl;external libflint;
procedure arf_set_mag(y:Tarf_t; x:Tmag_t);cdecl;external libflint;
procedure mag_init_set_arf(y:Tmag_t; x:Tarf_t);cdecl;external libflint;
procedure mag_fast_init_set_arf(y:Tmag_t; x:Tarf_t);cdecl;external libflint;
procedure arf_mag_fast_add_ulp(z:Tmag_t; x:Tmag_t; y:Tarf_t; prec:Tslong);cdecl;external libflint;
procedure arf_mag_add_ulp(z:Tmag_t; x:Tmag_t; y:Tarf_t; prec:Tslong);cdecl;external libflint;
procedure arf_mag_set_ulp(z:Tmag_t; y:Tarf_t; prec:Tslong);cdecl;external libflint;
procedure arf_get_fmpq(y:Tfmpq_t; x:Tarf_t);cdecl;external libflint;
function arf_set_fmpq(y:Tarf_t; x:Tfmpq_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_complex_mul(e:Tarf_t; f:Tarf_t; a:Tarf_t; b:Tarf_t; c:Tarf_t; 
           d:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_complex_mul_fallback(e:Tarf_t; f:Tarf_t; a:Tarf_t; b:Tarf_t; c:Tarf_t; 
           d:Tarf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_complex_sqr(e:Tarf_t; f:Tarf_t; a:Tarf_t; b:Tarf_t; prec:Tslong; 
           rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_sum(s:Tarf_t; terms:Tarf_srcptr; len:Tslong; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function arf_get_d(x:Tarf_t; rnd:Tarf_rnd_t):Tdouble;cdecl;external libflint;
procedure arf_set_d(x:Tarf_t; v:Tdouble);cdecl;external libflint;
function arf_allocated_bytes(x:Tarf_t):Tslong;cdecl;external libflint;
function arf_load_str(res:Tarf_t; data:Pchar):longint;cdecl;external libflint;
function arf_dump_str(x:Tarf_t):Pchar;cdecl;external libflint;
{$ifdef FLINT_HAVE_FILE}
function arf_load_file(res:Tarf_t; stream:PFILE):longint;cdecl;external libflint;
function arf_dump_file(stream:PFILE; x:Tarf_t):longint;cdecl;external libflint;
{$endif}

procedure arf_approx_dot(res:Tarf_t; initial:Tarf_t; subtract:longint; x:Tarf_srcptr; xstep:Tslong; 
            y:Tarf_srcptr; ystep:Tslong; len:Tslong; prec:Tslong; rnd:Tarf_rnd_t);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 19:59:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARF_PREC_ADD(prec,extra : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if ARF_PREC_EXACT then
    if_local1:=ARF_PREC_EXACT
  else
    if_local1:=Tprec(+(extra));
  ARF_PREC_ADD:=prec=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARF_EXP(x : longint) : longint;
begin
  ARF_EXP:=x^.exp;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARF_EXPREF(x : longint) : longint;
begin
  ARF_EXPREF:=@(x^.exp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function UI_ABS_SI(x : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if (Tslong(x))<0 then
    if_local1:=-(Tulong(x))
  else
    if_local1:=Tulong(x);
  UI_ABS_SI:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arf_mul(z,x,y,prec,rnd : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if rnd=ARF_RND_DOWN then
    if_local1:=arf_mul_rnd_down(z,x,y,prec)
  else
    if_local1:=arf_mul_rnd_any(z,x,y,prec,rnd);
  arf_mul:=if_local1;
end;


{$ENDIF read_implementation}
