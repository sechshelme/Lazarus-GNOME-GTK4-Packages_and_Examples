{$IFDEF read_interface}


{
    Copyright (C) 2020 Fredrik Johansson

    This file is part of Calcium.

    Calcium is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{ Types ******************************************************************** }
{ note: types and macros are defined in ca.h since they are needed there  }

{ was #define dname def_expr }
function CA_FIELD_HASH_C : longint; { return type might be wrong }

procedure ca_field_init_qq(K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_init_nf(K:Tca_field_t; x:Tqqbar_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_init_const(K:Tca_field_t; func:Tcalcium_func_code; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_init_fx(K:Tca_field_t; func:Tcalcium_func_code; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_init_fxy(K:Tca_field_t; func:Tcalcium_func_code; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_init_multi(K:Tca_field_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_clear(K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_set_ext(K:Tca_field_t; i:Tslong; x:Tca_ext_srcptr; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_print(K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_field_cmp(K1:Tca_field_t; K2:Tca_field_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
procedure ca_field_build_ideal(K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_build_ideal_erf(K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_build_ideal_gamma(K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_cache_init(cache:Tca_field_cache_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_field_cache_clear(cache:Tca_field_cache_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_field_cache_insert_ext(cache:Tca_field_cache_t; x:PPca_ext_struct; length:Tslong; ctx:Tca_ctx_t):Tca_field_ptr;cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 19:58:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname def_expr }
function CA_FIELD_HASH_C : longint; { return type might be wrong }
  begin
    CA_FIELD_HASH_C:=UWORD(100003);
  end;


{$ENDIF read_implementation}
