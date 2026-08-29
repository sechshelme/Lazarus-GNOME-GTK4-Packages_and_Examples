
unit aprcl;
interface

{
  Automatically converted by H2Pas 1.0.0 from aprcl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    aprcl.h
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
Paprcl_config  = ^aprcl_config;
Pfmpz_mod_poly_t  = ^fmpz_mod_poly_t;
Pfmpz_t  = ^fmpz_t;
Plongint  = ^longint;
Pprimality_test_status  = ^primality_test_status;
Punity_zp  = ^unity_zp;
Punity_zpq  = ^unity_zpq;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2015, Vladimir Glazchev

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{$ifndef APRCL_H}
{$define APRCL_H}
{$include "thread_pool.h"}
{$include "ulong_extras.h"}
{$include "fmpz_types.h"}
{$include "fmpz_mod_types.h"}

const
  SQUARING_SPACE = 70;  
{ Configuration struct  }
type
  Paprcl_config = ^Taprcl_config;
  Taprcl_config = record
      R : Tulong;
      s : Tfmpz_t;
      rs : Tn_factor_t;
      qs : Tfmpz_factor_t;
      qs_used : Plongint;
    end;

  Paprcl_config = ^Taprcl_config;
  Taprcl_config = array[0..0] of Taprcl_config;
{ Z[unity_root_q, unity_root_p]/(n) struct  }

  Punity_zpq = ^Tunity_zpq;
  Tunity_zpq = record
      polys : Pfmpz_mod_poly_t;
      p : Tulong;
      q : Tulong;
      ctx : Tfmpz_mod_ctx_t;
    end;

  Punity_zpq = ^Tunity_zpq;
  Tunity_zpq = array[0..0] of Tunity_zpq;
{ Z[unity_root]/(n) struct  }

  Punity_zp = ^Tunity_zp;
  Tunity_zp = record
      poly : Tfmpz_mod_poly_t;
      p : Tulong;
      exp : Tulong;
      ctx : Tfmpz_mod_ctx_t;
    end;

  Punity_zp = ^Tunity_zp;
  Tunity_zp = array[0..0] of Tunity_zp;
{ Primality test status  }

  Pprimality_test_status = ^Tprimality_test_status;
  Tprimality_test_status =  Longint;
  Const
    UNKNOWN = 0;
    PRIME = 1;
    COMPOSITE = 2;
    PROBABPRIME = 3;
;
{ Useful functions  }
(* Const before type ignored *)

function _aprcl_p_ind(conf:Taprcl_config; p:Tulong):longint;cdecl;external;
function aprcl_p_power_in_q(q:Tulong; p:Tulong):Tulong;cdecl;external;
(* Const before type ignored *)
function aprcl_is_mul_coprime_ui_ui(x:Tulong; y:Tulong; n:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function aprcl_is_mul_coprime_ui_fmpz(x:Tulong; y:Tfmpz_t; n:Tfmpz_t):longint;cdecl;external;
{
                            Primality tests
--------------------------------------------------------------------------------
 }
(* Const before type ignored *)
function aprcl_is_prime(n:Tfmpz_t):longint;cdecl;external;
{ Gauss test configuration  }
(* Const before type ignored *)
procedure aprcl_config_gauss_init(conf:Taprcl_config; n:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure aprcl_config_gauss_init_min_R(conf:Taprcl_config; n:Tfmpz_t; R:Tulong);cdecl;external;
procedure aprcl_config_gauss_clear(conf:Taprcl_config);cdecl;external;
{ Jacobi test configuration  }
(* Const before type ignored *)
function aprcl_R_value(n:Tfmpz_t):Tulong;cdecl;external;
(* Const before type ignored *)
procedure aprcl_config_jacobi_init(conf:Taprcl_config; n:Tfmpz_t);cdecl;external;
procedure aprcl_config_jacobi_clear(conf:Taprcl_config);cdecl;external;
{  Gauss sums primality test  }
(* Const before type ignored *)
function aprcl_is_prime_gauss(n:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
function aprcl_is_prime_gauss_min_R(n:Tfmpz_t; R:Tulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _aprcl_is_prime_gauss(n:Tfmpz_t; config:Taprcl_config):Tprimality_test_status;cdecl;external;
(* Const before type ignored *)
function _aprcl_is_gausspower_2q_equal_first(q:Tulong; n:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
function _aprcl_is_gausspower_2q_equal_second(q:Tulong; n:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
function _aprcl_is_gausspower_from_unity_p(q:Tulong; r:Tulong; n:Tfmpz_t):Tslong;cdecl;external;
{ Jacobi sums primality test  }
(* Const before type ignored *)
function aprcl_is_prime_jacobi(n:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _aprcl_is_prime_jacobi(n:Tfmpz_t; config:Taprcl_config):Tprimality_test_status;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _aprcl_is_prime_jacobi_check_pk(j:Tunity_zp; u:Tfmpz_t; v:Tulong):Tslong;cdecl;external;
(* Const before type ignored *)
function _aprcl_is_prime_jacobi_check_21(q:Tulong; n:Tfmpz_t):Tslong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _aprcl_is_prime_jacobi_check_22(j:Tunity_zp; u:Tfmpz_t; v:Tulong; q:Tulong):Tslong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function _aprcl_is_prime_jacobi_check_2k(j:Tunity_zp; j2_1:Tunity_zp; j2_2:Tunity_zp; u:Tfmpz_t; v:Tulong):Tslong;cdecl;external;
(* Const before type ignored *)
function _aprcl_is_prime_jacobi_additional_test(n:Tfmpz_t; p:Tulong):longint;cdecl;external;
{ Final division functions  }
(* Const before type ignored *)
(* Const before type ignored *)
function aprcl_is_prime_divisors_in_residue(n:Tfmpz_t; s:Tfmpz_t; r:Tulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function aprcl_is_prime_final_division(n:Tfmpz_t; s:Tfmpz_t; r:Tulong):longint;cdecl;external;
{
                        Z[unity_root]/(n) operations
--------------------------------------------------------------------------------
 }
{ Memory management  }
(* Const before type ignored *)
procedure unity_zp_init(f:Tunity_zp; p:Tulong; exp:Tulong; n:Tfmpz_t);cdecl;external;
procedure unity_zp_clear(f:Tunity_zp);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_copy(f:Tunity_zp; g:Tunity_zp);cdecl;external;
procedure unity_zp_swap(f:Tunity_zp; g:Tunity_zp);cdecl;external;
procedure unity_zp_set_zero(f:Tunity_zp);cdecl;external;
{ Comparison  }
function unity_zp_is_unity(f:Tunity_zp):Tslong;cdecl;external;
function unity_zp_equal(f:Tunity_zp; g:Tunity_zp):longint;cdecl;external;
{ Output  }
(* Const before type ignored *)
procedure unity_zp_print(f:Tunity_zp);cdecl;external;
{ Coefficient management  }
(* Const before type ignored *)
procedure unity_zp_coeff_set_fmpz(f:Tunity_zp; ind:Tulong; x:Tfmpz_t);cdecl;external;
procedure unity_zp_coeff_set_ui(f:Tunity_zp; ind:Tulong; x:Tulong);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_coeff_add_fmpz(f:Tunity_zp; ind:Tulong; x:Tfmpz_t);cdecl;external;
procedure unity_zp_coeff_add_ui(f:Tunity_zp; ind:Tulong; x:Tulong);cdecl;external;
procedure unity_zp_coeff_inc(f:Tunity_zp; ind:Tulong);cdecl;external;
procedure unity_zp_coeff_dec(f:Tunity_zp; ind:Tulong);cdecl;external;
{ Scalar multiplication  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul_scalar_fmpz(f:Tunity_zp; g:Tunity_zp; s:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_mul_scalar_ui(f:Tunity_zp; g:Tunity_zp; s:Tulong);cdecl;external;
{ Addition  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_add(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp);cdecl;external;
{ General multiplication and squaring  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr(f:Tunity_zp; g:Tunity_zp);cdecl;external;
{ Special multiplication and squaring  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul_inplace(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr_inplace(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
procedure unity_zp_ar1(t:Pfmpz_t);cdecl;external;
procedure unity_zp_ar2(t:Pfmpz_t);cdecl;external;
procedure unity_zp_ar3(t:Pfmpz_t);cdecl;external;
procedure unity_zp_ar4(t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul3(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul9(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul4(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul8(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul16(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul5(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul7(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_mul11(f:Tunity_zp; g:Tunity_zp; h:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr3(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr9(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr4(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr8(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr16(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr5(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr7(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_sqr11(f:Tunity_zp; g:Tunity_zp; t:Pfmpz_t);cdecl;external;
{ Powering functions  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_pow_fmpz(f:Tunity_zp; g:Tunity_zp; pow:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_pow_ui(f:Tunity_zp; g:Tunity_zp; pow:Tulong);cdecl;external;
(* Const before type ignored *)
function _unity_zp_pow_select_k(n:Tfmpz_t):Tulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zp_pow_2k_fmpz(f:Tunity_zp; g:Tunity_zp; pow:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_pow_2k_ui(f:Tunity_zp; g:Tunity_zp; pow:Tulong);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_pow_sliding_fmpz(f:Tunity_zp; g:Tunity_zp; pow:Tfmpz_t);cdecl;external;
{ Cyclotomic reduction  }
procedure _unity_zp_reduce_cyclotomic_divmod(f:Tunity_zp);cdecl;external;
procedure _unity_zp_reduce_cyclotomic(f:Tunity_zp);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_reduce_cyclotomic(f:Tunity_zp; g:Tunity_zp);cdecl;external;
{ Automorphism and inverse computation  }
(* Const before type ignored *)
procedure unity_zp_aut(f:Tunity_zp; g:Tunity_zp; x:Tulong);cdecl;external;
(* Const before type ignored *)
procedure unity_zp_aut_inv(f:Tunity_zp; g:Tunity_zp; x:Tulong);cdecl;external;
{ Jacobi sum computation.  }
(* Const before type ignored *)
function aprcl_f_table(q:Tulong):Tmp_ptr;cdecl;external;
(* Const before type ignored *)
procedure _unity_zp_jacobi_sum_pq_general(f:Tunity_zp; table:Tmp_ptr; p:Tulong; q:Tulong; k:Tulong; 
            a:Tulong; b:Tulong);cdecl;external;
procedure unity_zp_jacobi_sum_pq(f:Tunity_zp; q:Tulong; p:Tulong);cdecl;external;
procedure unity_zp_jacobi_sum_2q_one(f:Tunity_zp; q:Tulong);cdecl;external;
procedure unity_zp_jacobi_sum_2q_two(f:Tunity_zp; q:Tulong);cdecl;external;
{
                Z[unity_root_q, unity_root_p]/(n) operations
--------------------------------------------------------------------------------
 }
{ Memory management  }
(* Const before type ignored *)
procedure unity_zpq_init(f:Tunity_zpq; q:Tulong; p:Tulong; n:Tfmpz_t);cdecl;external;
procedure unity_zpq_clear(f:Tunity_zpq);cdecl;external;
(* Const before type ignored *)
procedure unity_zpq_copy(f:Tunity_zpq; g:Tunity_zpq);cdecl;external;
procedure unity_zpq_swap(f:Tunity_zpq; g:Tunity_zpq);cdecl;external;
{ Comparison  }
(* Const before type ignored *)
(* Const before type ignored *)
function unity_zpq_equal(f:Tunity_zpq; g:Tunity_zpq):longint;cdecl;external;
(* Const before type ignored *)
function unity_zpq_p_unity(f:Tunity_zpq):Tslong;cdecl;external;
(* Const before type ignored *)
function unity_zpq_is_p_unity(f:Tunity_zpq):longint;cdecl;external;
(* Const before type ignored *)
function unity_zpq_is_p_unity_generator(f:Tunity_zpq):longint;cdecl;external;
{ Coefficient management  }
(* Const before type ignored *)
procedure unity_zpq_coeff_set_fmpz(f:Tunity_zpq; i:Tslong; j:Tslong; x:Tfmpz_t);cdecl;external;
procedure unity_zpq_coeff_set_ui(f:Tunity_zpq; i:Tslong; j:Tslong; x:Tulong);cdecl;external;
(* Const before type ignored *)
procedure unity_zpq_coeff_add(f:Tunity_zpq; i:Tslong; j:Tslong; x:Tfmpz_t);cdecl;external;
procedure unity_zpq_coeff_add_ui(f:Tunity_zpq; i:Tslong; j:Tslong; x:Tulong);cdecl;external;
{ Scalar multiplication  }
(* Const before type ignored *)
procedure unity_zpq_scalar_mul_ui(f:Tunity_zpq; g:Tunity_zpq; s:Tulong);cdecl;external;
{ Addition and multiplication  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zpq_add(f:Tunity_zpq; g:Tunity_zpq; h:Tunity_zpq);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zpq_mul(f:Tunity_zpq; g:Tunity_zpq; h:Tunity_zpq);cdecl;external;
procedure _unity_zpq_mul_unity_p(f:Tunity_zpq);cdecl;external;
(* Const before type ignored *)
procedure unity_zpq_mul_unity_p_pow(f:Tunity_zpq; g:Tunity_zpq; p:Tslong);cdecl;external;
{ Powering  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure unity_zpq_pow(f:Tunity_zpq; g:Tunity_zpq; p:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure unity_zpq_pow_ui(f:Tunity_zpq; g:Tunity_zpq; pow:Tulong);cdecl;external;
{ Gauss sum computation  }
procedure unity_zpq_gauss_sum(f:Tunity_zpq; q:Tulong; p:Tulong);cdecl;external;
procedure unity_zpq_gauss_sum_character_pow(f:Tunity_zpq; q:Tulong; p:Tulong; pow:Tulong);cdecl;external;
procedure unity_zpq_gauss_sum_sigma_pow(f:Tunity_zpq; q:Tulong; p:Tulong);cdecl;external;
{$endif}

implementation


end.
