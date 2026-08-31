unit fexpr;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2021 Fredrik Johansson

    This file is part of Calcium.

    Calcium is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }

{ was #define dname def_expr }
function FEXPR_TYPE_SMALL_INT : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_SMALL_SYMBOL : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_SMALL_STRING : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_INT_POS : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_INT_NEG : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_SYMBOL : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_STRING : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_CALL0 : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_CALL1 : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_CALL2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_CALL3 : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_CALL4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_TYPE_CALLN : longint; { return type might be wrong }

const
  FEXPR_TYPE_BITS = 4;  

{ was #define dname def_expr }
function FEXPR_TYPE_MASK : longint; { return type might be wrong }

{ was #define dname def_expr }
function FEXPR_COEFF_MAX : longint; { return type might be wrong }

const
  FEXPR_COEFF_MIN = -(FEXPR_COEFF_MAX);  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function FEXPR_TYPE(head : longint) : Thead;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FEXPR_SIZE(head : longint) : Tslong;

{ was #define dname def_expr }
function FEXPR_HEADER_SIZE : longint; { return type might be wrong }

const
  FEXPR_SMALL_SYMBOL_LEN = (FLINT_BITS/8)-1;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function FEXPR_BUILTIN_ID(head : longint) : longint;

type
  Pfexpr_struct = ^Tfexpr_struct;
  Tfexpr_struct = record
      data : Pulong;
      alloc : Tslong;
    end;

  Pfexpr_t = ^Tfexpr_t;
  Tfexpr_t = array[0..0] of Tfexpr_struct;

  Pfexpr_ptr = ^Tfexpr_ptr;
  Tfexpr_ptr = Pfexpr_struct;

  Pfexpr_srcptr = ^Tfexpr_srcptr;
  Tfexpr_srcptr = Pfexpr_struct;

  Pfexpr_vec_struct = ^Tfexpr_vec_struct;
  Tfexpr_vec_struct = record
      entries : Pfexpr_struct;
      alloc : Tslong;
      length : Tslong;
    end;

  Pfexpr_vec_t = ^Tfexpr_vec_t;
  Tfexpr_vec_t = array[0..0] of Tfexpr_vec_struct;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function fexpr_vec_entry(vec,i : longint) : longint;

procedure fexpr_init(expr:Tfexpr_t);cdecl;external libflint;
procedure fexpr_clear(expr:Tfexpr_t);cdecl;external libflint;
function _fexpr_vec_init(len:Tslong):Tfexpr_ptr;cdecl;external libflint;
procedure _fexpr_vec_clear(vec:Tfexpr_ptr; len:Tslong);cdecl;external libflint;
procedure fexpr_fit_size(expr:Tfexpr_t; size:Tslong);cdecl;external libflint;
function _fexpr_size(expr:Pulong):Tslong;cdecl;external libflint;
function fexpr_size(expr:Tfexpr_t):Tslong;cdecl;external libflint;
procedure fexpr_set(res:Tfexpr_t; expr:Tfexpr_t);cdecl;external libflint;
procedure fexpr_swap(a:Tfexpr_t; b:Tfexpr_t);cdecl;external libflint;
function _mpn_equal(a:Tmp_srcptr; b:Tmp_srcptr; len:Tslong):longint;cdecl;external libflint;
function fexpr_equal(a:Tfexpr_t; b:Tfexpr_t):longint;cdecl;external libflint;
{ todo: document, test  }
function fexpr_equal_si(expr:Tfexpr_t; c:Tslong):longint;cdecl;external libflint;
function fexpr_equal_ui(expr:Tfexpr_t; c:Tulong):longint;cdecl;external libflint;
function fexpr_hash(expr:Tfexpr_t):Tulong;cdecl;external libflint;
function fexpr_cmp_fast(a:Tfexpr_t; b:Tfexpr_t):longint;cdecl;external libflint;
procedure _fexpr_vec_sort_fast(vec:Tfexpr_ptr; len:Tslong);cdecl;external libflint;
function _fexpr_is_integer(expr:Pulong):longint;cdecl;external libflint;
function fexpr_is_integer(expr:Tfexpr_t):longint;cdecl;external libflint;
{ todo: document, test  }
function fexpr_is_neg_integer(expr:Tfexpr_t):longint;cdecl;external libflint;
function _fexpr_is_symbol(expr:Pulong):longint;cdecl;external libflint;
function fexpr_is_symbol(expr:Tfexpr_t):longint;cdecl;external libflint;
function _fexpr_is_string(expr:Pulong):longint;cdecl;external libflint;
function fexpr_is_string(expr:Tfexpr_t):longint;cdecl;external libflint;
function _fexpr_is_atom(expr:Pulong):longint;cdecl;external libflint;
function fexpr_is_atom(expr:Tfexpr_t):longint;cdecl;external libflint;
procedure fexpr_zero(res:Tfexpr_t);cdecl;external libflint;
function fexpr_is_zero(expr:Tfexpr_t):longint;cdecl;external libflint;
procedure fexpr_set_si(res:Tfexpr_t; c:Tslong);cdecl;external libflint;
procedure fexpr_set_ui(res:Tfexpr_t; c:Tulong);cdecl;external libflint;
procedure fexpr_set_fmpz(res:Tfexpr_t; c:Tfmpz_t);cdecl;external libflint;
function fexpr_get_fmpz(c:Tfmpz_t; x:Tfexpr_t):longint;cdecl;external libflint;
procedure fexpr_set_fmpq(res:Tfexpr_t; x:Tfmpq_t);cdecl;external libflint;
procedure fexpr_set_symbol_builtin(res:Tfexpr_t; id:Tslong);cdecl;external libflint;
procedure fexpr_set_symbol_str(res:Tfexpr_t; s:Pchar);cdecl;external libflint;
function fexpr_get_symbol_str(expr:Tfexpr_t):Pchar;cdecl;external libflint;
procedure fexpr_set_string(res:Tfexpr_t; s:Pchar);cdecl;external libflint;
function fexpr_get_string(expr:Tfexpr_t):Pchar;cdecl;external libflint;
function fexpr_depth(expr:Tfexpr_t):Tslong;cdecl;external libflint;
function fexpr_num_leaves(expr:Tfexpr_t):Tslong;cdecl;external libflint;
function fexpr_size_bytes(expr:Tfexpr_t):Tslong;cdecl;external libflint;
function fexpr_allocated_bytes(expr:Tfexpr_t):Tslong;cdecl;external libflint;
{ todo: document  }
function fexpr_is_any_builtin_symbol(expr:Tfexpr_t):longint;cdecl;external libflint;
{ todo: document  }
function fexpr_is_builtin_symbol(expr:Tfexpr_t; i:Tslong):longint;cdecl;external libflint;
{ todo: document, test  }
function fexpr_is_builtin_call(expr:Tfexpr_t; i:Tslong):longint;cdecl;external libflint;
function fexpr_is_any_builtin_call(expr:Tfexpr_t):longint;cdecl;external libflint;
function fexpr_nargs(expr:Tfexpr_t):Tslong;cdecl;external libflint;
procedure fexpr_func(res:Tfexpr_t; expr:Tfexpr_t);cdecl;external libflint;
procedure fexpr_view_func(res:Tfexpr_t; expr:Tfexpr_t);cdecl;external libflint;
procedure fexpr_arg(res:Tfexpr_t; expr:Tfexpr_t; i:Tslong);cdecl;external libflint;
procedure fexpr_view_arg(res:Tfexpr_t; expr:Tfexpr_t; i:Tslong);cdecl;external libflint;
procedure fexpr_view_next(view:Tfexpr_t);cdecl;external libflint;
{ todo: handle aliasing!  }
procedure fexpr_call0(res:Tfexpr_t; f:Tfexpr_t);cdecl;external libflint;
procedure fexpr_call1(res:Tfexpr_t; f:Tfexpr_t; x1:Tfexpr_t);cdecl;external libflint;
procedure fexpr_call2(res:Tfexpr_t; f:Tfexpr_t; x1:Tfexpr_t; x2:Tfexpr_t);cdecl;external libflint;
procedure fexpr_call3(res:Tfexpr_t; f:Tfexpr_t; x1:Tfexpr_t; x2:Tfexpr_t; x3:Tfexpr_t);cdecl;external libflint;
procedure fexpr_call4(res:Tfexpr_t; f:Tfexpr_t; x1:Tfexpr_t; x2:Tfexpr_t; x3:Tfexpr_t; 
            x4:Tfexpr_t);cdecl;external libflint;
procedure fexpr_call_vec(res:Tfexpr_t; f:Tfexpr_t; args:Tfexpr_srcptr; len:Tslong);cdecl;external libflint;
procedure fexpr_call_builtin1(res:Tfexpr_t; f:Tslong; x:Tfexpr_t);cdecl;external libflint;
procedure fexpr_call_builtin2(res:Tfexpr_t; f:Tslong; x:Tfexpr_t; y:Tfexpr_t);cdecl;external libflint;
{ Subexpressions and replacement  }
function fexpr_contains(expr:Tfexpr_t; x:Tfexpr_t):longint;cdecl;external libflint;
function fexpr_replace(res:Tfexpr_t; expr:Tfexpr_t; x:Tfexpr_t; y:Tfexpr_t):longint;cdecl;external libflint;
function fexpr_replace2(res:Tfexpr_t; expr:Tfexpr_t; x1:Tfexpr_t; y1:Tfexpr_t; x2:Tfexpr_t; 
           y2:Tfexpr_t):longint;cdecl;external libflint;
function fexpr_replace_vec(res:Tfexpr_t; expr:Tfexpr_t; xs:Tfexpr_vec_t; ys:Tfexpr_vec_t):longint;cdecl;external libflint;
{ Input/output  }
procedure fexpr_write(stream:Tcalcium_stream_t; expr:Tfexpr_t);cdecl;external libflint;
procedure fexpr_print(expr:Tfexpr_t);cdecl;external libflint;
function fexpr_get_str(expr:Tfexpr_t):Pchar;cdecl;external libflint;
{ LaTeX output  }
const
  FEXPR_LATEX_SMALL = 1;  
  FEXPR_LATEX_LOGIC = 2;  

procedure fexpr_write_latex(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_print_latex(expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
function fexpr_get_str_latex(expr:Tfexpr_t; flags:Tulong):Pchar;cdecl;external libflint;
procedure fexpr_write_latex_call(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_subscript(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_subscript_call(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_infix(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_mul(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_div(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_neg_pos(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_add(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_sub(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_pow(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_exp(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_factorial(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_integral(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_sum_product(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_divsum(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_limit(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_derivative(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_logic(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_collection(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_matrix(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_simple(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_simple2(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_simple2_small(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_alg_structure(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_setop(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_cases(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_where(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_show_form(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_range(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_decimal(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_call1_optional_derivative(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_call2_optional_derivative(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_sub1_call1_optional_derivative(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_sub1_call2_optional_derivative(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_misc_special(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_write_latex_residue(out:Tcalcium_stream_t; expr:Tfexpr_t; flags:Tulong);cdecl;external libflint;
procedure fexpr_set_arf(res:Tfexpr_t; x:Tarf_t);cdecl;external libflint;
procedure fexpr_set_d(res:Tfexpr_t; x:Tdouble);cdecl;external libflint;
procedure fexpr_set_re_im_d(res:Tfexpr_t; x:Tdouble; y:Tdouble);cdecl;external libflint;
procedure fexpr_neg(res:Tfexpr_t; a:Tfexpr_t);cdecl;external libflint;
procedure fexpr_add(res:Tfexpr_t; a:Tfexpr_t; b:Tfexpr_t);cdecl;external libflint;
procedure fexpr_sub(res:Tfexpr_t; a:Tfexpr_t; b:Tfexpr_t);cdecl;external libflint;
procedure fexpr_mul(res:Tfexpr_t; a:Tfexpr_t; b:Tfexpr_t);cdecl;external libflint;
procedure fexpr_div(res:Tfexpr_t; a:Tfexpr_t; b:Tfexpr_t);cdecl;external libflint;
procedure fexpr_pow(res:Tfexpr_t; a:Tfexpr_t; b:Tfexpr_t);cdecl;external libflint;
function fexpr_is_arithmetic_operation(expr:Tfexpr_t):longint;cdecl;external libflint;
procedure fexpr_arithmetic_nodes(nodes:Tfexpr_vec_t; expr:Tfexpr_t);cdecl;external libflint;
function fexpr_get_fmpz_mpoly_q(res:Tfmpz_mpoly_q_t; expr:Tfexpr_t; vars:Tfexpr_vec_t; ctx:Tfmpz_mpoly_ctx_t):longint;cdecl;external libflint;
procedure fexpr_set_fmpz_mpoly(res:Tfexpr_t; poly:Tfmpz_mpoly_t; vars:Tfexpr_vec_t; ctx:Tfmpz_mpoly_ctx_t);cdecl;external libflint;
procedure fexpr_set_fmpz_mpoly_q(res:Tfexpr_t; frac:Tfmpz_mpoly_q_t; vars:Tfexpr_vec_t; ctx:Tfmpz_mpoly_ctx_t);cdecl;external libflint;
function fexpr_expanded_normal_form(res:Tfexpr_t; expr:Tfexpr_t; flags:Tulong):longint;cdecl;external libflint;
{ Vectors  }
procedure fexpr_vec_init(vec:Tfexpr_vec_t; len:Tslong);cdecl;external libflint;
procedure fexpr_vec_print(F:Tfexpr_vec_t);cdecl;external libflint;
procedure fexpr_vec_swap(x:Tfexpr_vec_t; y:Tfexpr_vec_t);cdecl;external libflint;
procedure fexpr_vec_fit_length(vec:Tfexpr_vec_t; len:Tslong);cdecl;external libflint;
procedure fexpr_vec_clear(vec:Tfexpr_vec_t);cdecl;external libflint;
procedure fexpr_vec_set(dest:Tfexpr_vec_t; src:Tfexpr_vec_t);cdecl;external libflint;
procedure fexpr_vec_append(vec:Tfexpr_vec_t; f:Tfexpr_t);cdecl;external libflint;
function fexpr_vec_insert_unique(vec:Tfexpr_vec_t; f:Tfexpr_t):Tslong;cdecl;external libflint;
procedure fexpr_vec_set_length(vec:Tfexpr_vec_t; len:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:38 ===


implementation


{ was #define dname def_expr }
function FEXPR_TYPE_SMALL_INT : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_SMALL_INT:=UWORD(0);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_SMALL_SYMBOL : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_SMALL_SYMBOL:=UWORD(1);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_SMALL_STRING : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_SMALL_STRING:=UWORD(2);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_INT_POS : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_BIG_INT_POS:=UWORD(3);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_INT_NEG : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_BIG_INT_NEG:=UWORD(4);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_SYMBOL : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_BIG_SYMBOL:=UWORD(5);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_BIG_STRING : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_BIG_STRING:=UWORD(6);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_CALL0 : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_CALL0:=UWORD(7);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_CALL1 : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_CALL1:=UWORD(8);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_CALL2 : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_CALL2:=UWORD(9);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_CALL3 : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_CALL3:=UWORD(10);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_CALL4 : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_CALL4:=UWORD(11);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_CALLN : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_CALLN:=UWORD(12);
  end;

{ was #define dname def_expr }
function FEXPR_TYPE_MASK : longint; { return type might be wrong }
  begin
    FEXPR_TYPE_MASK:=((UWORD(1)) shl FEXPR_TYPE_BITS)-1;
  end;

{ was #define dname def_expr }
function FEXPR_COEFF_MAX : longint; { return type might be wrong }
  begin
    FEXPR_COEFF_MAX:=((WORD(1)) shl ((FLINT_BITS-FEXPR_TYPE_BITS)-1))-1;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FEXPR_TYPE(head : longint) : Thead;
begin
  FEXPR_TYPE:=Thead(@(FEXPR_TYPE_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FEXPR_SIZE(head : longint) : Tslong;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if (FEXPR_TYPE(head))<=FEXPR_TYPE_SMALL_STRING then
    if_local1:=1
  else
    if_local1:=head shr FEXPR_TYPE_BITS;
  FEXPR_SIZE:=Tslong(if_local1);
end;

{ was #define dname def_expr }
function FEXPR_HEADER_SIZE : longint; { return type might be wrong }
  begin
    FEXPR_HEADER_SIZE:=WORD(1);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FEXPR_BUILTIN_ID(head : longint) : longint;
begin
  FEXPR_BUILTIN_ID:=head shr 16;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fexpr_vec_entry(vec,i : longint) : longint;
begin
  fexpr_vec_entry:=(vec^.entries)+i;
end;


end.
