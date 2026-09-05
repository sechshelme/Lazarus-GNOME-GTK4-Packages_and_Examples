{$IFDEF read_interface}


{
    Copyright (C) 2013 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ACB_CALC_H}
{$define ACB_CALC_H}
{$include "acb_types.h"}
{ C++ extern C conditionnal removed }
type

  Tacb_calc_func_t = function (out:Tacb_ptr; inp:Tacb_t; param:pointer; order:Tslong; prec:Tslong):longint;cdecl;
{ Integration (old)  }

procedure acb_calc_cauchy_bound(bound:Tarb_t; func:Tacb_calc_func_t; param:pointer; x:Tacb_t; radius:Tarb_t; 
            maxdepth:Tslong; prec:Tslong);cdecl;external libflint;
function acb_calc_integrate_taylor(res:Tacb_t; func:Tacb_calc_func_t; param:pointer; a:Tacb_t; b:Tacb_t; 
           inner_radius:Tarf_t; outer_radius:Tarf_t; accuracy_goal:Tslong; prec:Tslong):longint;cdecl;external libflint;
{ Integration  }
type
  Pacb_calc_integrate_opt_struct = ^Tacb_calc_integrate_opt_struct;
  Tacb_calc_integrate_opt_struct = record
      deg_limit : Tslong;
      eval_limit : Tslong;
      depth_limit : Tslong;
      use_heap : longint;
      verbose : longint;
    end;

  Pacb_calc_integrate_opt_t = ^Tacb_calc_integrate_opt_t;
  Tacb_calc_integrate_opt_t = array[0..0] of Tacb_calc_integrate_opt_struct;

procedure acb_calc_integrate_opt_init(options:Tacb_calc_integrate_opt_t);cdecl;external libflint;
function acb_calc_integrate(res:Tacb_t; f:Tacb_calc_func_t; param:pointer; a:Tacb_t; b:Tacb_t; 
           goal:Tslong; tol:Tmag_t; options:Tacb_calc_integrate_opt_t; prec:Tslong):longint;cdecl;external libflint;
function acb_calc_integrate_gl_auto_deg(res:Tacb_t; eval_count:Pslong; f:Tacb_calc_func_t; param:pointer; a:Tacb_t; 
           b:Tacb_t; tol:Tmag_t; deg_limit:Tslong; verbose:longint; prec:Tslong):longint;cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 16:13:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
