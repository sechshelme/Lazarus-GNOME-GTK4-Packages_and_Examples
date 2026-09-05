{$IFDEF read_interface}


{
    Copyright (C) 2017 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ACB_ELLIPTIC_H}
{$define ACB_ELLIPTIC_H}
{$include "acb_types.h"}
{ C++ extern C conditionnal removed }

procedure acb_elliptic_k(k:Tacb_t; m:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_k_jet(w:Tacb_ptr; m:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_elliptic_k_series(res:Tacb_ptr; m:Tacb_srcptr; zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_k_series(res:Tacb_poly_t; m:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_e(res:Tacb_t; m:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_rf(res:Tacb_t; x:Tacb_t; y:Tacb_t; z:Tacb_t; flags:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_rj(res:Tacb_t; x:Tacb_t; y:Tacb_t; z:Tacb_t; p:Tacb_t; 
            flags:longint; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_rj_carlson(res:Tacb_t; x:Tacb_t; y:Tacb_t; z:Tacb_t; p:Tacb_t; 
            flags:longint; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_rj_integration(res:Tacb_t; x:Tacb_t; y:Tacb_t; z:Tacb_t; p:Tacb_t; 
            flags:longint; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_rg(res:Tacb_t; x:Tacb_t; y:Tacb_t; z:Tacb_t; flags:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_rc1(res:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_f(res:Tacb_t; phi:Tacb_t; m:Tacb_t; times_pi:longint; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_e_inc(res:Tacb_t; phi:Tacb_t; m:Tacb_t; times_pi:longint; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_pi(r:Tacb_t; n:Tacb_t; m:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_pi_inc(res:Tacb_t; n:Tacb_t; phi:Tacb_t; m:Tacb_t; times_pi:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_p(r:Tacb_t; z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_p_prime(r:Tacb_t; z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_p_jet(r:Tacb_ptr; z:Tacb_t; tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_elliptic_p_series(res:Tacb_ptr; z:Tacb_srcptr; zlen:Tslong; tau:Tacb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_p_series(res:Tacb_poly_t; z:Tacb_poly_t; tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_zeta(res:Tacb_t; z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_sigma(res:Tacb_t; z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_roots(e1:Tacb_t; e2:Tacb_t; e3:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_invariants(g2:Tacb_t; g3:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_elliptic_inv_p(res:Tacb_t; z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 16:12:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
