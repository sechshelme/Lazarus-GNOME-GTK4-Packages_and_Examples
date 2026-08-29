unit ca;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2020 Fredrik Johansson

    This file is part of Calcium.

    Calcium is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef CA_H}
{$define CA_H}
{ Number object ************************************************************ }
{ rational number  }
{ algebraic number field element  }
{ generic field element  }
type
  Pca_elem_struct = ^Tca_elem_struct;
  Tca_elem_struct = record
      case longint of
        0 : ( q : Tfmpq );
        1 : ( nf : Tnf_elem_struct );
        2 : ( mpoly_q : Pfmpz_mpoly_q_struct );
      end;

  Pca_struct = ^Tca_struct;
  Tca_struct = record
      field : Tulong;
      elem : Tca_elem_struct;
    end;

  Pca_t = ^Tca_t;
  Tca_t = array[0..0] of Tca_struct;

  Pca_ptr = ^Tca_ptr;
  Tca_ptr = Pca_struct;

  Pca_srcptr = ^Tca_srcptr;
  Tca_srcptr = Pca_struct;
{ Use the low two bits of the field pointer to encode special values.  }
{ The field pointer with the mask removed is NULL for
   Unknown/Undefined/Uinf, and a normal field pointer for signed
   infinity (encoding the sign).  }

{ was #define dname def_expr }
function CA_UNKNOWN : longint; { return type might be wrong }

{ was #define dname def_expr }
function CA_UNDEFINED : longint; { return type might be wrong }

{ was #define dname def_expr }
function CA_INF : longint; { return type might be wrong }

const
  CA_SPECIAL = (CA_UNKNOWN or CA_UNDEFINED) or CA_INF;  
{ Extension object ********************************************************* }
{ qqbar_t element  }
{ antic number field for fast arithmetic  }
type
  Pca_ext_qqbar = ^Tca_ext_qqbar;
  Tca_ext_qqbar = record
      x : Tqqbar_struct;
      nf : Pnf_struct;
    end;
{ Function arguments x1, ..., xn.  }
{ Number of function arguments n.  }
{ Cached numerical enclosure of f(x1,...,xn)  }
{ Working precision of cached enclosure  }
{ Cached qqbar  }

  Pca_ext_func_data = ^Tca_ext_func_data;
  Tca_ext_func_data = record
      args : Pca_struct;
      nargs : Tslong;
      enclosure : Tacb_struct;
      prec : Tslong;
      qqbar : Pqqbar_struct;
    end;
{ f = F_Pi, F_Exp, ...  }

  Pca_ext_struct = ^Tca_ext_struct;
  Tca_ext_struct = record
      head : Tcalcium_func_code;
      hash : Tulong;
      depth : Tslong;
      data : record
          case longint of
            0 : ( qqbar : Tca_ext_qqbar );
            1 : ( func_data : Tca_ext_func_data );
          end;
    end;

  Pca_ext_t = ^Tca_ext_t;
  Tca_ext_t = array[0..0] of Tca_ext_struct;

  Pca_ext_ptr = ^Tca_ext_ptr;
  Tca_ext_ptr = Pca_ext_struct;

  Pca_ext_srcptr = ^Tca_ext_srcptr;
  Tca_ext_srcptr = Pca_ext_struct;

  Pca_ext_cache_struct = ^Tca_ext_cache_struct;
  Tca_ext_cache_struct = record
      items : ^Pca_ext_struct;
      length : Tslong;
      alloc : Tslong;
      hash_size : Tslong;
      hash_table : Pslong;
    end;

  Pca_ext_cache_t = ^Tca_ext_cache_t;
  Tca_ext_cache_t = array[0..0] of Tca_ext_cache_struct;
{ Field object ************************************************************* }
{ Number of generators               }
{ Generators                         }
{ Algebraic relations for reduction  }

  Pca_field_struct = ^Tca_field_struct;
  Tca_field_struct = record
      length : Tslong;
      ext : ^Pca_ext_struct;
      ideal : Tfmpz_mpoly_vec_struct;
      hash : Tulong;
    end;

  Pca_field_t = ^Tca_field_t;
  Tca_field_t = array[0..0] of Tca_field_struct;

  Pca_field_ptr = ^Tca_field_ptr;
  Tca_field_ptr = Pca_field_struct;

  Pca_field_srcptr = ^Tca_field_srcptr;
  Tca_field_srcptr = Pca_field_struct;

  Pca_field_cache_struct = ^Tca_field_cache_struct;
  Tca_field_cache_struct = record
      items : ^Pca_field_struct;
      length : Tslong;
      alloc : Tslong;
      hash_size : Tslong;
      hash_table : Pslong;
    end;

  Pca_field_cache_t = ^Tca_field_cache_t;
  Tca_field_cache_t = array[0..0] of Tca_field_cache_struct;
{ Context object *********************************************************** }
  Txxxxxxxxxx =  Longint;
  Const
    CA_OPT_VERBOSE = 0;
    CA_OPT_PRINT_FLAGS = 1;
    CA_OPT_MPOLY_ORD = 2;
    CA_OPT_PREC_LIMIT = 3;
    CA_OPT_QQBAR_DEG_LIMIT = 4;
    CA_OPT_LOW_PREC = 5;
    CA_OPT_SMOOTH_LIMIT = 6;
    CA_OPT_LLL_PREC = 7;
    CA_OPT_POW_LIMIT = 8;
    CA_OPT_USE_GROEBNER = 9;
    CA_OPT_GROEBNER_LENGTH_LIMIT = 10;
    CA_OPT_GROEBNER_POLY_LENGTH_LIMIT = 11;
    CA_OPT_GROEBNER_POLY_BITS_LIMIT = 12;
    CA_OPT_VIETA_LIMIT = 13;
    CA_OPT_TRIG_FORM = 14;
    CA_OPT_NUM_OPTIONS = 15;

  CA_TRIG_DIRECT = 0;  
  CA_TRIG_EXPONENTIAL = 1;  
  CA_TRIG_SINE_COSINE = 2;  
  CA_TRIG_TANGENT = 3;  
{ Cached extension objects  }
{ Cached extension fields   }
{ Quick access to QQ       }
{ Quick access to QQ(i)    }
{ Cached contexts for multivariate polys  }
type
  Pca_ctx_struct = ^Tca_ctx_struct;
  Tca_ctx_struct = record
      ext_cache : Tca_ext_cache_struct;
      field_cache : Tca_field_cache_struct;
      field_qq : Pca_field_struct;
      field_qq_i : Pca_field_struct;
      mctx : ^Pfmpz_mpoly_ctx_struct;
      mctx_len : Tslong;
      options : Pslong;
    end;

  Pca_ctx_t = ^Tca_ctx_t;
  Tca_ctx_t = array[0..0] of Tca_ctx_struct;
{ Context management  }

procedure ca_ctx_init(ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ctx_clear(ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ctx_print(ctx:Tca_ctx_t);cdecl;external libflint;
function ca_ctx_get_option(ctx:Tca_ctx_t; i:Tslong):Tslong;cdecl;external libflint;
procedure ca_ctx_set_option(ctx:Tca_ctx_t; i:Tslong; value:Tslong);cdecl;external libflint;
function _ca_ctx_get_field_const(ctx:Tca_ctx_t; func:Tcalcium_func_code):Tca_field_ptr;cdecl;external libflint;
function _ca_ctx_get_field_fx(ctx:Tca_ctx_t; func:Tcalcium_func_code; x:Tca_t):Tca_field_ptr;cdecl;external libflint;
function _ca_ctx_get_field_fxy(ctx:Tca_ctx_t; func:Tcalcium_func_code; x:Tca_t; y:Tca_t):Tca_field_ptr;cdecl;external libflint;
{ Numbers  }
procedure ca_init(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_clear(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_swap(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_make_field_element(x:Tca_t; field:Tca_field_srcptr; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_make_fmpq(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_function_fx(res:Tca_t; func:Tcalcium_func_code; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_function_fxy(res:Tca_t; func:Tcalcium_func_code; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_transfer(res:Tca_t; res_ctx:Tca_ctx_t; src:Tca_t; src_ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_zero(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_one(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_neg_one(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_si(x:Tca_t; v:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_ui(x:Tca_t; v:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_fmpz(x:Tca_t; v:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_fmpq(x:Tca_t; v:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_d(res:Tca_t; x:Tdouble; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_d_d(res:Tca_t; x:Tdouble; y:Tdouble; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_i(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_neg_i(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pi(res:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pi_i(res:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_euler(res:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_unknown(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_undefined(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_uinf(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pos_inf(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_neg_inf(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pos_i_inf(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_neg_i_inf(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_set_qqbar(res:Tca_t; x:Tqqbar_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_can_evaluate_qqbar(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_get_qqbar(res:Tqqbar_t; x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_get_fmpq(res:Tfmpq_t; x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_get_fmpz(res:Tfmpz_t; x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
{ Symbolic expressions  }
const
  CA_FEXPR_SERIALIZATION = 1;  

procedure ca_get_fexpr(res:Tfexpr_t; x:Tca_t; flags:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_set_fexpr(res:Tca_t; expr:Tfexpr_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
{ Printing  }
{ was #define dname def_expr }
function CA_PRINT_N : longint; { return type might be wrong }

{ was #define dname def_expr }
function CA_PRINT_REPR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CA_PRINT_FIELD : longint; { return type might be wrong }

{ was #define dname def_expr }
function CA_PRINT_DIGITS : longint; { return type might be wrong }

const
  CA_PRINT_DEFAULT = CA_PRINT_N or CA_PRINT_REPR;  
  CA_PRINT_DEBUG = (CA_PRINT_N or CA_PRINT_REPR) or CA_PRINT_FIELD;  
{$ifdef FLINT_HAVE_FILE}

procedure ca_fprint(fp:PFILE; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{$endif}

procedure ca_print(x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_printn(x:Tca_t; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_get_str(x:Tca_t; ctx:Tca_ctx_t):Pchar;cdecl;external libflint;
{ Random generation  }
procedure ca_randtest_same_nf(res:Tca_t; state:Tflint_rand_t; x:Tca_t; bits:Tslong; den_bits:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_randtest_rational(res:Tca_t; state:Tflint_rand_t; bits:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_randtest(res:Tca_t; state:Tflint_rand_t; depth:Tslong; bits:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_randtest_special(res:Tca_t; state:Tflint_rand_t; depth:Tslong; bits:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Representation properties  }
function ca_is_special(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_unknown(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_qq_elem(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_qq_elem_zero(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_qq_elem_one(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_qq_elem_integer(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_nf_elem(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_generic_elem(x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_is_cyclotomic_nf_elem(p:Pslong; q:Pulong; x:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
{ Value predicates and comparisons  }
function ca_is_zero_check_fast(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_number(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_zero(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_one(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_neg_one(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_i(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_neg_i(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_algebraic(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_rational(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_integer(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_real(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_negative_real(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_imaginary(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_undefined(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_infinity(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_uinf(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_signed_inf(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_pos_inf(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_neg_inf(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_pos_i_inf(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_is_neg_i_inf(x:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_equal(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_lt(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_le(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_gt(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_check_ge(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_equal_repr(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_cmp_repr(x:Tca_t; y:Tca_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_hash_repr(x:Tca_t; ctx:Tca_ctx_t):Tulong;cdecl;external libflint;
{ Field structure operations  }
procedure ca_merge_fields(resx:Tca_t; resy:Tca_t; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_condense_field(res:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_is_gen_as_ext(x:Tca_t; ctx:Tca_ctx_t):Tca_ext_ptr;cdecl;external libflint;
{ Arithmetic  }
{ todo: document  }
procedure _ca_mpoly_q_reduce_ideal(res:Tfmpz_mpoly_q_t; field:Tca_field_srcptr; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_mpoly_q_simplify_fraction_ideal(res:Tfmpz_mpoly_q_t; field:Tca_field_srcptr; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_neg(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_add_fmpq(res:Tca_t; x:Tca_t; y:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_add_fmpz(res:Tca_t; x:Tca_t; y:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_add_ui(res:Tca_t; x:Tca_t; y:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_add_si(res:Tca_t; x:Tca_t; y:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_add(res:Tca_t; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sub_fmpq(res:Tca_t; x:Tca_t; y:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sub_fmpz(res:Tca_t; x:Tca_t; y:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sub_ui(res:Tca_t; x:Tca_t; y:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sub_si(res:Tca_t; x:Tca_t; y:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpq_sub(res:Tca_t; x:Tfmpq_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_sub(res:Tca_t; x:Tfmpz_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ui_sub(res:Tca_t; x:Tulong; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_si_sub(res:Tca_t; x:Tslong; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sub(res:Tca_t; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_mul_fmpq(res:Tca_t; x:Tca_t; y:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_mul_fmpz(res:Tca_t; x:Tca_t; y:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_mul_ui(res:Tca_t; x:Tca_t; y:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_mul_si(res:Tca_t; x:Tca_t; y:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_mul(res:Tca_t; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_inv(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpq_div(res:Tca_t; x:Tfmpq_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_div(res:Tca_t; x:Tfmpz_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ui_div(res:Tca_t; x:Tulong; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_si_div(res:Tca_t; x:Tslong; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_div_fmpq(res:Tca_t; x:Tca_t; y:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_div_fmpz(res:Tca_t; x:Tca_t; y:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_div_ui(res:Tca_t; x:Tca_t; y:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_div_si(res:Tca_t; x:Tca_t; y:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_div(res:Tca_t; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_dot(res:Tca_t; initial:Tca_t; subtract:longint; x:Tca_srcptr; xstep:Tslong; 
            y:Tca_srcptr; ystep:Tslong; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_poly_evaluate(res:Tca_t; poly:Tfmpz_poly_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpq_poly_evaluate(res:Tca_t; poly:Tfmpq_poly_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_mpoly_evaluate_horner(res:Tca_t; f:Tfmpz_mpoly_t; x:Tca_srcptr; mctx:Tfmpz_mpoly_ctx_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_mpoly_evaluate_iter(res:Tca_t; f:Tfmpz_mpoly_t; x:Tca_srcptr; mctx:Tfmpz_mpoly_ctx_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_mpoly_evaluate(res:Tca_t; f:Tfmpz_mpoly_t; x:Tca_srcptr; mctx:Tfmpz_mpoly_ctx_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_mpoly_q_evaluate(res:Tca_t; f:Tfmpz_mpoly_q_t; x:Tca_srcptr; mctx:Tfmpz_mpoly_ctx_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_fmpz_mpoly_q_evaluate_no_division_by_zero(res:Tca_t; f:Tfmpz_mpoly_q_t; x:Tca_srcptr; mctx:Tfmpz_mpoly_ctx_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_inv_no_division_by_zero(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Powers and roots  }
procedure ca_sqr(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pow_fmpq(res:Tca_t; x:Tca_t; y:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pow_fmpz(res:Tca_t; x:Tca_t; y:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pow_ui(res:Tca_t; x:Tca_t; y:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pow_si(res:Tca_t; x:Tca_t; y:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pow(res:Tca_t; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_pow_si_arithmetic(res:Tca_t; x:Tca_t; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sqrt_inert(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sqrt_nofactor(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sqrt_factor(res:Tca_t; x:Tca_t; flags:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sqrt(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sqrt_ui(res:Tca_t; n:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Complex parts  }
procedure ca_conj_shallow(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_conj_deep(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_conj(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_abs(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sgn(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_csgn(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_arg(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_re(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_im(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_floor(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ceil(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Elementary functions  }
procedure ca_exp(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_log(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sin_cos_exponential(res1:Tca_t; res2:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sin_cos_direct_exp_hack(res1:Tca_t; res2:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sin_cos_direct(res1:Tca_t; res2:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sin_cos_tangent(res1:Tca_t; res2:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sin_cos(res1:Tca_t; res2:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_sin(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_cos(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_tan_sine_cosine(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_tan_exponential(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_tan_direct(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_tan(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_cot(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_atan_logarithm(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_atan_direct(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_atan(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_asin_logarithm(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_asin_direct(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_asin(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_acos_logarithm(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_acos_direct(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_acos(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Special functions  }
procedure ca_erf(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_erfc(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_erfi(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_gamma(res:Tca_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Numerical evaluation  }
procedure ca_get_acb_raw(res:Tacb_t; x:Tca_t; prec:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_get_acb(res:Tacb_t; x:Tca_t; prec:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_get_acb_accurate_parts(res:Tacb_t; x:Tca_t; prec:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_get_decimal_str(x:Tca_t; digits:Tslong; flags:Tulong; ctx:Tca_ctx_t):Pchar;cdecl;external libflint;
{ Factorisation  }
const
  CA_FACTOR_ZZ_NONE = 0;  
  CA_FACTOR_ZZ_SMOOTH = 2;  
  CA_FACTOR_ZZ_FULL = 4;  
  CA_FACTOR_POLY_NONE = 0;  
  CA_FACTOR_POLY_CONTENT = 64;  
  CA_FACTOR_POLY_SQF = 128;  
  CA_FACTOR_POLY_FULL = 256;  
type
  Pca_factor_struct = ^Tca_factor_struct;
  Tca_factor_struct = record
      base : Tca_ptr;
      exp : Tca_ptr;
      length : Tslong;
      alloc : Tslong;
    end;

  Pca_factor_t = ^Tca_factor_t;
  Tca_factor_t = array[0..0] of Tca_factor_struct;

procedure ca_factor_init(fac:Tca_factor_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_factor_clear(fac:Tca_factor_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_factor_one(fac:Tca_factor_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_factor_print(fac:Tca_factor_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_factor_insert(fac:Tca_factor_t; base:Tca_t; exp:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_factor_get_ca(res:Tca_t; fac:Tca_factor_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_factor(res:Tca_factor_t; x:Tca_t; flags:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Test helpers  }

// === Konventiert am: 29-8-26 19:58:49 ===


implementation


{ was #define dname def_expr }
function CA_UNKNOWN : longint; { return type might be wrong }
  begin
    CA_UNKNOWN:=UWORD(1);
  end;

{ was #define dname def_expr }
function CA_UNDEFINED : longint; { return type might be wrong }
  begin
    CA_UNDEFINED:=UWORD(2);
  end;

{ was #define dname def_expr }
function CA_INF : longint; { return type might be wrong }
  begin
    CA_INF:=UWORD(3);
  end;

{ was #define dname def_expr }
function CA_PRINT_N : longint; { return type might be wrong }
  begin
    CA_PRINT_N:=UWORD(1);
  end;

{ was #define dname def_expr }
function CA_PRINT_REPR : longint; { return type might be wrong }
  begin
    CA_PRINT_REPR:=UWORD(2);
  end;

{ was #define dname def_expr }
function CA_PRINT_FIELD : longint; { return type might be wrong }
  begin
    CA_PRINT_FIELD:=UWORD(4);
  end;

{ was #define dname def_expr }
function CA_PRINT_DIGITS : longint; { return type might be wrong }
  begin
    CA_PRINT_DIGITS:=UWORD(16);
  end;


end.
