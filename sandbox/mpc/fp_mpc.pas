unit fp_mpc;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  MPC_VERSION_MAJOR = 1;  
  MPC_VERSION_MINOR = 3;  
  MPC_VERSION_PATCHLEVEL = 1;  
  MPC_VERSION_STRING = '1.3.1';  

  function MPC_VERSION_NUM(a,b,c : longint) : longint;
function MPC_VERSION : longint;

const
  _MPC_H_HAVE_INTMAX_T = 1;  

function MPC_INEX_POS(inex : longint) : longint;

{ Transform 2 to negative, 1 to positive, leave 0 unchanged  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_NEG(inex : longint) : longint;

{ The global inexact flag is made of (real flag) + 4 * (imaginary flag), where
   each of the real and imaginary inexact flag are:
   0 when the result is exact (no rounding error)
   1 when the result is larger than the exact value
   2 when the result is smaller than the exact value  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX(inex_re,inex_im : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_RE(inex : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_IM(inex : longint) : longint;

{ For functions computing two results, the return value is
   inexact1+16*inexact2, which is 0 iif both results are exact.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX12(inex1,inex2 : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX1(inex : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX2(inex : longint) : longint;

{ Definition of rounding modes  }
{ a complex rounding mode is just a pair of two real rounding modes
   we reserve four bits for a real rounding mode.   }
type
  Pmpc_rnd_t = ^Tmpc_rnd_t;
  Tmpc_rnd_t = longint;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MPC_RND(r1,r2 : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MPC_RND_RE(x : longint) : Tmpfr_rnd_t;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MPC_RND_IM(x : longint) : Tmpfr_rnd_t;

{ was #define dname def_expr }
function MPC_RNDNN : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDNZ : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDNU : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDND : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDNA : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDZN : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDZZ : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDZU : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDZD : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDZA : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDUN : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDUZ : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDUU : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDUD : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDUA : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDDN : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDDZ : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDDU : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDDD : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDDA : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDAN : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDAZ : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDAU : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDAD : longint; { return type might be wrong }

{ was #define dname def_expr }
function MPC_RNDAA : longint; { return type might be wrong }

{ Definitions of types and their semantics  }
type
  P_mpc_struct = ^T_mpc_struct;
  T_mpc_struct = record
      re : Tmpfr_t;
      im : Tmpfr_t;
    end;

  Pmpc_t = ^Tmpc_t;
  Tmpc_t = array[0..0] of Tmpc_struct;

  Pmpc_ptr = ^Tmpc_ptr;
  Tmpc_ptr = Pmpc_struct;

  Pmpc_srcptr = ^Tmpc_srcptr;
  Tmpc_srcptr = Pmpc_struct;

  P_mpcr_struct = ^T_mpcr_struct;
  T_mpcr_struct = record
      mant : Tint64_t;
      exp : Tint64_t;
    end;

  Pmpcr_t = ^Tmpcr_t;
  Tmpcr_t = array[0..0] of Tmpcr_struct;

  Pmpcr_ptr = ^Tmpcr_ptr;
  Tmpcr_ptr = Pmpcr_struct;

  Pmpcr_srcptr = ^Tmpcr_srcptr;
  Tmpcr_srcptr = Pmpcr_struct;

  P_mpcb_struct = ^T_mpcb_struct;
  T_mpcb_struct = record
      c : Tmpc_t;
      r : Tmpcr_t;
    end;

  Pmpcb_t = ^Tmpcb_t;
  Tmpcb_t = array[0..0] of Tmpcb_struct;

  Pmpcb_ptr = ^Tmpcb_ptr;
  Tmpcb_ptr = Pmpcb_struct;

  Pmpcb_srcptr = ^Tmpcb_srcptr;
  Tmpcb_srcptr = Pmpcb_struct;

function mpc_add(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_add_fr(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpfr_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_add_si(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_add_ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sub(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sub_fr(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpfr_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_fr_sub(para1:Tmpc_ptr; para2:Tmpfr_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sub_ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_ui_ui_sub(para1:Tmpc_ptr; para2:dword; para3:dword; para4:Tmpc_srcptr; para5:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul_fr(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpfr_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul_ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul_si(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul_i(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sqr(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_div(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow_fr(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpfr_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow_ld(para1:Tmpc_ptr; para2:Tmpc_srcptr; double:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow_d(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tdouble; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow_si(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow_ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_pow_z(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpz_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_div_fr(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpfr_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_fr_div(para1:Tmpc_ptr; para2:Tmpfr_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_div_ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_ui_div(para1:Tmpc_ptr; para2:dword; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_div_2ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul_2ui(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_div_2si(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_mul_2si(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_conj(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_neg(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sum(para1:Tmpc_ptr; para2:Pmpc_ptr; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_dot(para1:Tmpc_ptr; para2:Pmpc_ptr; para3:Pmpc_ptr; para4:dword; para5:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_norm(para1:Tmpfr_ptr; para2:Tmpc_srcptr; para3:Tmpfr_rnd_t):longint;cdecl;external libmpc;
function mpc_abs(para1:Tmpfr_ptr; para2:Tmpc_srcptr; para3:Tmpfr_rnd_t):longint;cdecl;external libmpc;
function mpc_sqrt(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_d(para1:Tmpc_ptr; para2:Tdouble; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_d_d(para1:Tmpc_ptr; para2:Tdouble; para3:Tdouble; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_ld(para1:Tmpc_ptr; double:longint; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_ld_ld(para1:Tmpc_ptr; double:longint; double:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_f(para1:Tmpc_ptr; para2:Tmpf_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_f_f(para1:Tmpc_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_fr(para1:Tmpc_ptr; para2:Tmpfr_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_fr_fr(para1:Tmpc_ptr; para2:Tmpfr_srcptr; para3:Tmpfr_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_q(para1:Tmpc_ptr; para2:Tmpq_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_q_q(para1:Tmpc_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_si(para1:Tmpc_ptr; para2:longint; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_si_si(para1:Tmpc_ptr; para2:longint; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_ui(para1:Tmpc_ptr; para2:dword; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_ui_ui(para1:Tmpc_ptr; para2:dword; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_z(para1:Tmpc_ptr; para2:Tmpz_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_z_z(para1:Tmpc_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
procedure mpc_swap(para1:Tmpc_ptr; para2:Tmpc_ptr);cdecl;external libmpc;
function mpc_fma(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_srcptr; para5:Tmpc_rnd_t):longint;cdecl;external libmpc;
procedure mpc_set_nan(para1:Tmpc_ptr);cdecl;external libmpc;
function mpc_real(para1:Tmpfr_ptr; para2:Tmpc_srcptr; para3:Tmpfr_rnd_t):longint;cdecl;external libmpc;
function mpc_imag(para1:Tmpfr_ptr; para2:Tmpc_srcptr; para3:Tmpfr_rnd_t):longint;cdecl;external libmpc;
function mpc_arg(para1:Tmpfr_ptr; para2:Tmpc_srcptr; para3:Tmpfr_rnd_t):longint;cdecl;external libmpc;
function mpc_proj(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_cmp(para1:Tmpc_srcptr; para2:Tmpc_srcptr):longint;cdecl;external libmpc;
function mpc_cmp_si_si(para1:Tmpc_srcptr; para2:longint; para3:longint):longint;cdecl;external libmpc;
function mpc_cmp_abs(para1:Tmpc_srcptr; para2:Tmpc_srcptr):longint;cdecl;external libmpc;
function mpc_exp(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_log(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_log10(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_agm(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sin(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_cos(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sin_cos(para1:Tmpc_ptr; para2:Tmpc_ptr; para3:Tmpc_srcptr; para4:Tmpc_rnd_t; para5:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_tan(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_sinh(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_cosh(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_tanh(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_asin(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_acos(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_atan(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_asinh(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_acosh(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_atanh(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_rootofunity(para1:Tmpc_ptr; para2:dword; para3:dword; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
procedure mpc_clear(para1:Tmpc_ptr);cdecl;external libmpc;
function mpc_urandom(para1:Tmpc_ptr; para2:Tgmp_randstate_t):longint;cdecl;external libmpc;
procedure mpc_init2(para1:Tmpc_ptr; para2:Tmpfr_prec_t);cdecl;external libmpc;
procedure mpc_init3(para1:Tmpc_ptr; para2:Tmpfr_prec_t; para3:Tmpfr_prec_t);cdecl;external libmpc;
function mpc_get_prec(x:Tmpc_srcptr):Tmpfr_prec_t;cdecl;external libmpc;
procedure mpc_get_prec2(pr:Pmpfr_prec_t; pi:Pmpfr_prec_t; x:Tmpc_srcptr);cdecl;external libmpc;
procedure mpc_set_prec(para1:Tmpc_ptr; para2:Tmpfr_prec_t);cdecl;external libmpc;
function mpc_get_version:Pchar;cdecl;external libmpc;
function mpc_strtoc(para1:Tmpc_ptr; para2:Pchar; para3:PPchar; para4:longint; para5:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_str(para1:Tmpc_ptr; para2:Pchar; para3:longint; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_get_str(para1:longint; para2:Tsize_t; para3:Tmpc_srcptr; para4:Tmpc_rnd_t):Pchar;cdecl;external libmpc;
procedure mpc_free_str(para1:Pchar);cdecl;external libmpc;
{ declare certain functions only if appropriate headers have been included  }
{$ifdef _MPC_H_HAVE_INTMAX_T}
function mpc_set_sj(para1:Tmpc_ptr; para2:Tintmax_t; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_uj(para1:Tmpc_ptr; para2:Tuintmax_t; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_sj_sj(para1:Tmpc_ptr; para2:Tintmax_t; para3:Tintmax_t; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_uj_uj(para1:Tmpc_ptr; para2:Tuintmax_t; para3:Tuintmax_t; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
{$endif}
{$ifdef _Complex_I}

function mpc_set_dc(para1:Tmpc_ptr; para2:Tdouble_Complex; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_set_ldc(para1:Tmpc_ptr; para2:Tlong_double_Complex; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_get_dc(para1:Tmpc_srcptr; para2:Tmpc_rnd_t):Tdouble_Complex;cdecl;external libmpc;
function mpc_get_ldc(para1:Tmpc_srcptr; para2:Tmpc_rnd_t):Tlong_double_Complex;cdecl;external libmpc;
{$endif}
{$ifdef _GMP_H_HAVE_FILE}

function mpc_inp_str(para1:Tmpc_ptr; para2:PFILE; para3:Psize_t; para4:longint; para5:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_out_str(para1:PFILE; para2:longint; para3:Tsize_t; para4:Tmpc_srcptr; para5:Tmpc_rnd_t):Tsize_t;cdecl;external libmpc;
procedure mpcb_out_str(f:PFILE; para2:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcr_out_str(f:PFILE; r:Tmpcr_srcptr);cdecl;external libmpc;
{$endif}

function mpcr_inf_p(r:Tmpcr_srcptr):longint;cdecl;external libmpc;
function mpcr_zero_p(r:Tmpcr_srcptr):longint;cdecl;external libmpc;
function mpcr_lt_half_p(r:Tmpcr_srcptr):longint;cdecl;external libmpc;
function mpcr_cmp(r:Tmpcr_srcptr; s:Tmpcr_srcptr):longint;cdecl;external libmpc;
procedure mpcr_set_inf(r:Tmpcr_ptr);cdecl;external libmpc;
procedure mpcr_set_zero(r:Tmpcr_ptr);cdecl;external libmpc;
procedure mpcr_set_one(r:Tmpcr_ptr);cdecl;external libmpc;
procedure mpcr_set(r:Tmpcr_ptr; s:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_set_ui64_2si64(r:Tmpcr_ptr; mant:Tuint64_t; exp:Tint64_t);cdecl;external libmpc;
procedure mpcr_max(r:Tmpcr_ptr; s:Tmpcr_srcptr; t:Tmpcr_srcptr);cdecl;external libmpc;
function mpcr_get_exp(r:Tmpcr_srcptr):Tint64_t;cdecl;external libmpc;
procedure mpcr_mul(r:Tmpcr_ptr; s:Tmpcr_srcptr; t:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_mul_2ui(r:Tmpcr_ptr; s:Tmpcr_srcptr; e:dword);cdecl;external libmpc;
procedure mpcr_sqr(r:Tmpcr_ptr; s:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_add(r:Tmpcr_ptr; s:Tmpcr_srcptr; t:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_sub(r:Tmpcr_ptr; s:Tmpcr_srcptr; t:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_sub_rnd(r:Tmpcr_ptr; s:Tmpcr_srcptr; t:Tmpcr_srcptr; rnd:Tmpfr_rnd_t);cdecl;external libmpc;
procedure mpcr_div(r:Tmpcr_ptr; s:Tmpcr_srcptr; t:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_div_2ui(r:Tmpcr_ptr; s:Tmpcr_srcptr; e:dword);cdecl;external libmpc;
function sqrt_int64(n:Tint64_t):Tint64_t;cdecl;external libmpc;
procedure mpcr_sqrt(r:Tmpcr_ptr; s:Tmpcr_srcptr);cdecl;external libmpc;
procedure mpcr_add_rounding_error(r:Tmpcr_ptr; p:Tmpfr_prec_t; rnd:Tmpfr_rnd_t);cdecl;external libmpc;
procedure mpcr_c_abs_rnd(r:Tmpcr_ptr; z:Tmpc_srcptr; rnd:Tmpfr_rnd_t);cdecl;external libmpc;
procedure mpcb_init(para1:Tmpcb_ptr);cdecl;external libmpc;
procedure mpcb_clear(para1:Tmpcb_ptr);cdecl;external libmpc;
function mpcb_get_prec(para1:Tmpcb_srcptr):Tmpfr_prec_t;cdecl;external libmpc;
procedure mpcb_set_prec(para1:Tmpcb_ptr; para2:Tmpfr_prec_t);cdecl;external libmpc;
procedure mpcb_set(para1:Tmpcb_ptr; para2:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_set_inf(para1:Tmpcb_ptr);cdecl;external libmpc;
procedure mpcb_set_c(para1:Tmpcb_ptr; para2:Tmpc_srcptr; para3:Tmpfr_prec_t; para4:dword; para5:dword);cdecl;external libmpc;
procedure mpcb_set_ui_ui(para1:Tmpcb_ptr; para2:dword; para3:dword; para4:Tmpfr_prec_t);cdecl;external libmpc;
procedure mpcb_neg(para1:Tmpcb_ptr; para2:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_mul(para1:Tmpcb_ptr; para2:Tmpcb_srcptr; para3:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_sqr(para1:Tmpcb_ptr; para2:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_pow_ui(para1:Tmpcb_ptr; para2:Tmpcb_srcptr; para3:dword);cdecl;external libmpc;
procedure mpcb_add(para1:Tmpcb_ptr; para2:Tmpcb_srcptr; para3:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_sqrt(para1:Tmpcb_ptr; para2:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_div(para1:Tmpcb_ptr; para2:Tmpcb_srcptr; para3:Tmpcb_srcptr);cdecl;external libmpc;
procedure mpcb_div_2ui(para1:Tmpcb_ptr; para2:Tmpcb_srcptr; para3:dword);cdecl;external libmpc;
function mpcb_can_round(para1:Tmpcb_srcptr; para2:Tmpfr_prec_t; para3:Tmpfr_prec_t; para4:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpcb_round(para1:Tmpc_ptr; para2:Tmpcb_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
function mpc_eta_fund(para1:Tmpc_ptr; para2:Tmpc_srcptr; para3:Tmpc_rnd_t):longint;cdecl;external libmpc;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_realref(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_imagref(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_cmp_si(x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_ui_sub(x,y,z,r : longint) : longint;

{
   Define a fake mpfr_set_fr so that, for instance, mpc_set_fr_z would
   be defined as follows:
   mpc_set_fr_z (mpc_t rop, mpfr_t x, mpz_t y, mpc_rnd_t rnd)
       MPC_SET_X_Y (fr, z, rop, x, y, rnd)
 }
{$ifndef mpfr_set_fr}

const
  mpfr_set_fr = mpfr_set;  
{$endif}
{$endif}
{ ifndef __MPC_H  }

// === Konventiert am: 14-11-25 17:24:48 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_VERSION_NUM(a,b,c : longint) : longint;
begin
  MPC_VERSION_NUM:=((a shl 16) or (b shl 8)) or c;
end;

{ was #define dname def_expr }
function MPC_VERSION : longint; { return type might be wrong }
  begin
    MPC_VERSION:=MPC_VERSION_NUM(MPC_VERSION_MAJOR,MPC_VERSION_MINOR,MPC_VERSION_PATCHLEVEL);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_POS(inex : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if inex<0 then
    if_local1:=2
  else
    if_local1:=inex=0;
  if if_local1 then
    if_local2:=0
  else
    if_local2:=1;
  MPC_INEX_POS:=if_local2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_NEG(inex : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if inex=2 then
    if_local1:=-(1)
  else
    if_local1:=inex=0;
  if if_local1 then
    if_local2:=0
  else
    if_local2:=1;
  MPC_INEX_NEG:=if_local2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX(inex_re,inex_im : longint) : longint;
begin
  MPC_INEX:=(MPC_INEX_POS(inex_re)) or ((MPC_INEX_POS(inex_im)) shl 2);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_RE(inex : longint) : longint;
begin
  MPC_INEX_RE:=MPC_INEX_NEG(Tinex(@(3)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX_IM(inex : longint) : longint;
begin
  MPC_INEX_IM:=MPC_INEX_NEG(inex shr 2);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX12(inex1,inex2 : longint) : longint;
begin
  MPC_INEX12:=inex1 or (inex2 shl 4);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX1(inex : longint) : longint;
begin
  MPC_INEX1:=inex and 15;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_INEX2(inex : longint) : longint;
begin
  MPC_INEX2:=inex shr 4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MPC_RND(r1,r2 : longint) : longint;
begin
  MPC_RND:=(longint(r1))+((longint(r2)) shl 4);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MPC_RND_RE(x : longint) : Tmpfr_rnd_t;
begin
  MPC_RND_RE:=Tmpfr_rnd_t(Tx(@($0F)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MPC_RND_IM(x : longint) : Tmpfr_rnd_t;
begin
  MPC_RND_IM:=Tmpfr_rnd_t(x shr 4);
end;

{ was #define dname def_expr }
function MPC_RNDNN : longint; { return type might be wrong }
  begin
    MPC_RNDNN:=MPC_RND(MPFR_RNDN,MPFR_RNDN);
  end;

{ was #define dname def_expr }
function MPC_RNDNZ : longint; { return type might be wrong }
  begin
    MPC_RNDNZ:=MPC_RND(MPFR_RNDN,MPFR_RNDZ);
  end;

{ was #define dname def_expr }
function MPC_RNDNU : longint; { return type might be wrong }
  begin
    MPC_RNDNU:=MPC_RND(MPFR_RNDN,MPFR_RNDU);
  end;

{ was #define dname def_expr }
function MPC_RNDND : longint; { return type might be wrong }
  begin
    MPC_RNDND:=MPC_RND(MPFR_RNDN,MPFR_RNDD);
  end;

{ was #define dname def_expr }
function MPC_RNDNA : longint; { return type might be wrong }
  begin
    MPC_RNDNA:=MPC_RND(MPFR_RNDN,MPFR_RNDA);
  end;

{ was #define dname def_expr }
function MPC_RNDZN : longint; { return type might be wrong }
  begin
    MPC_RNDZN:=MPC_RND(MPFR_RNDZ,MPFR_RNDN);
  end;

{ was #define dname def_expr }
function MPC_RNDZZ : longint; { return type might be wrong }
  begin
    MPC_RNDZZ:=MPC_RND(MPFR_RNDZ,MPFR_RNDZ);
  end;

{ was #define dname def_expr }
function MPC_RNDZU : longint; { return type might be wrong }
  begin
    MPC_RNDZU:=MPC_RND(MPFR_RNDZ,MPFR_RNDU);
  end;

{ was #define dname def_expr }
function MPC_RNDZD : longint; { return type might be wrong }
  begin
    MPC_RNDZD:=MPC_RND(MPFR_RNDZ,MPFR_RNDD);
  end;

{ was #define dname def_expr }
function MPC_RNDZA : longint; { return type might be wrong }
  begin
    MPC_RNDZA:=MPC_RND(MPFR_RNDZ,MPFR_RNDA);
  end;

{ was #define dname def_expr }
function MPC_RNDUN : longint; { return type might be wrong }
  begin
    MPC_RNDUN:=MPC_RND(MPFR_RNDU,MPFR_RNDN);
  end;

{ was #define dname def_expr }
function MPC_RNDUZ : longint; { return type might be wrong }
  begin
    MPC_RNDUZ:=MPC_RND(MPFR_RNDU,MPFR_RNDZ);
  end;

{ was #define dname def_expr }
function MPC_RNDUU : longint; { return type might be wrong }
  begin
    MPC_RNDUU:=MPC_RND(MPFR_RNDU,MPFR_RNDU);
  end;

{ was #define dname def_expr }
function MPC_RNDUD : longint; { return type might be wrong }
  begin
    MPC_RNDUD:=MPC_RND(MPFR_RNDU,MPFR_RNDD);
  end;

{ was #define dname def_expr }
function MPC_RNDUA : longint; { return type might be wrong }
  begin
    MPC_RNDUA:=MPC_RND(MPFR_RNDU,MPFR_RNDA);
  end;

{ was #define dname def_expr }
function MPC_RNDDN : longint; { return type might be wrong }
  begin
    MPC_RNDDN:=MPC_RND(MPFR_RNDD,MPFR_RNDN);
  end;

{ was #define dname def_expr }
function MPC_RNDDZ : longint; { return type might be wrong }
  begin
    MPC_RNDDZ:=MPC_RND(MPFR_RNDD,MPFR_RNDZ);
  end;

{ was #define dname def_expr }
function MPC_RNDDU : longint; { return type might be wrong }
  begin
    MPC_RNDDU:=MPC_RND(MPFR_RNDD,MPFR_RNDU);
  end;

{ was #define dname def_expr }
function MPC_RNDDD : longint; { return type might be wrong }
  begin
    MPC_RNDDD:=MPC_RND(MPFR_RNDD,MPFR_RNDD);
  end;

{ was #define dname def_expr }
function MPC_RNDDA : longint; { return type might be wrong }
  begin
    MPC_RNDDA:=MPC_RND(MPFR_RNDD,MPFR_RNDA);
  end;

{ was #define dname def_expr }
function MPC_RNDAN : longint; { return type might be wrong }
  begin
    MPC_RNDAN:=MPC_RND(MPFR_RNDA,MPFR_RNDN);
  end;

{ was #define dname def_expr }
function MPC_RNDAZ : longint; { return type might be wrong }
  begin
    MPC_RNDAZ:=MPC_RND(MPFR_RNDA,MPFR_RNDZ);
  end;

{ was #define dname def_expr }
function MPC_RNDAU : longint; { return type might be wrong }
  begin
    MPC_RNDAU:=MPC_RND(MPFR_RNDA,MPFR_RNDU);
  end;

{ was #define dname def_expr }
function MPC_RNDAD : longint; { return type might be wrong }
  begin
    MPC_RNDAD:=MPC_RND(MPFR_RNDA,MPFR_RNDD);
  end;

{ was #define dname def_expr }
function MPC_RNDAA : longint; { return type might be wrong }
  begin
    MPC_RNDAA:=MPC_RND(MPFR_RNDA,MPFR_RNDA);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_realref(x : longint) : longint;
begin
  mpc_realref:=x^.re;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_imagref(x : longint) : longint;
begin
  mpc_imagref:=x^.im;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_cmp_si(x,y : longint) : longint;
begin
  mpc_cmp_si:=mpc_cmp_si_si(x,y,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpc_ui_sub(x,y,z,r : longint) : longint;
begin
  mpc_ui_sub:=mpc_ui_ui_sub(x,y,0,z,r);
end;


end.
