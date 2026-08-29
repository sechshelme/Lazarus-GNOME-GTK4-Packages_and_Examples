
unit ca_vec;
interface

{
  Automatically converted by H2Pas 1.0.0 from ca_vec.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ca_vec.h
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
Pca_vec_struct  = ^ca_vec_struct;
Pca_vec_t  = ^ca_vec_t;
Pfmpz  = ^fmpz;
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
{ Vector object  }
type
  Pca_vec_struct = ^Tca_vec_struct;
  Tca_vec_struct = record
      entries : Tca_ptr;
      alloc : Tslong;
      length : Tslong;
    end;

  Pca_vec_t = ^Tca_vec_t;
  Tca_vec_t = array[0..0] of Tca_vec_struct;

function ca_vec_entry_ptr(vec:Tca_vec_t; i:Tslong):Tca_ptr;cdecl;external;
{ Memory management  }
function _ca_vec_init(len:Tslong; ctx:Tca_ctx_t):Tca_ptr;cdecl;external;
procedure ca_vec_init(vec:Tca_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure _ca_vec_clear(v:Tca_ptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_vec_clear(vec:Tca_vec_t; ctx:Tca_ctx_t);cdecl;external;
procedure _ca_vec_swap(vec1:Tca_ptr; vec2:Tca_ptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_vec_swap(vec1:Tca_vec_t; vec2:Tca_vec_t; ctx:Tca_ctx_t);cdecl;external;
{ Length  }
(* Const before type ignored *)
function ca_vec_length(vec:Tca_vec_t; ctx:Tca_ctx_t):Tslong;cdecl;external;
procedure _ca_vec_fit_length(vec:Tca_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_vec_set_length(res:Tca_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
{ Assignment  }
procedure _ca_vec_set(res:Tca_ptr; src:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_vec_set(res:Tca_vec_t; src:Tca_vec_t; ctx:Tca_ctx_t);cdecl;external;
{ Special vectors  }
procedure _ca_vec_zero(res:Tca_ptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_vec_zero(res:Tca_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure _ca_vec_unknown(vec:Tca_ptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure _ca_vec_undefined(vec:Tca_ptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
{ Input and output  }
(* Const before type ignored *)
procedure ca_vec_print(vec:Tca_vec_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_vec_printn(vec:Tca_vec_t; digits:Tslong; ctx:Tca_ctx_t);cdecl;external;
{ List operations  }
(* Const before type ignored *)
procedure ca_vec_append(vec:Tca_vec_t; f:Tca_t; ctx:Tca_ctx_t);cdecl;external;
{ Arithmetic  }
procedure _ca_vec_neg(res:Tca_ptr; src:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_vec_neg(res:Tca_vec_t; src:Tca_vec_t; ctx:Tca_ctx_t);cdecl;external;
procedure _ca_vec_add(res:Tca_ptr; vec1:Tca_srcptr; vec2:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure _ca_vec_sub(res:Tca_ptr; vec1:Tca_srcptr; vec2:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure _ca_vec_scalar_mul_ca(res:Tca_ptr; src:Tca_srcptr; len:Tslong; c:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure _ca_vec_scalar_div_ca(res:Tca_ptr; src:Tca_srcptr; len:Tslong; c:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure _ca_vec_scalar_addmul_ca(res:Tca_ptr; vec:Tca_srcptr; len:Tslong; c:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure _ca_vec_scalar_submul_ca(res:Tca_ptr; vec:Tca_srcptr; len:Tslong; c:Tca_t; ctx:Tca_ctx_t);cdecl;external;
{ Comparisons and predicates  }
function _ca_vec_check_is_zero(vec:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
{ Internal representation  }
function _ca_vec_is_fmpq_vec(vec:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t):longint;cdecl;external;
function _ca_vec_fmpq_vec_is_fmpz_vec(vec:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t):longint;cdecl;external;
procedure _ca_vec_fmpq_vec_get_fmpz_vec_den(c:Pfmpz; den:Tfmpz_t; vec:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _ca_vec_set_fmpz_vec_div_fmpz(res:Tca_ptr; v:Pfmpz; den:Tfmpz_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external;
{$endif}

implementation


end.
