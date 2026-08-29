unit ca_ext;

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
{ Types ******************************************************************** }
{ note: types and macros are defined in ca.h since they are needed there  }

procedure ca_ext_init_qqbar(res:Tca_ext_t; x:Tqqbar_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_init_const(res:Tca_ext_t; func:Tcalcium_func_code; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_init_fx(res:Tca_ext_t; func:Tcalcium_func_code; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_init_fxy(res:Tca_ext_t; func:Tcalcium_func_code; x:Tca_t; y:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_init_fxn(res:Tca_ext_t; func:Tcalcium_func_code; x:Tca_srcptr; nargs:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ todo: this could avoid rehashing, ...  }
procedure ca_ext_init_set(res:Tca_ext_t; x:Tca_ext_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_clear(res:Tca_ext_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_ext_nargs(x:Tca_ext_t; ctx:Tca_ctx_t):Tslong;cdecl;external libflint;
procedure ca_ext_get_arg(res:Tca_t; x:Tca_ext_t; i:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_ext_hash(x:Tca_ext_t; ctx:Tca_ctx_t):Tulong;cdecl;external libflint;
function ca_ext_equal_repr(x:Tca_ext_t; y:Tca_ext_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_ext_cmp_repr(x:Tca_ext_t; y:Tca_ext_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
procedure ca_ext_print(x:Tca_ext_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_get_acb_raw(res:Tacb_t; x:Tca_ext_t; prec:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_cache_init(cache:Tca_ext_cache_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_ext_cache_clear(cache:Tca_ext_cache_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_ext_cache_insert(cache:Tca_ext_cache_t; x:Tca_ext_t; ctx:Tca_ctx_t):Tca_ext_ptr;cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 19:58:46 ===


implementation



end.
