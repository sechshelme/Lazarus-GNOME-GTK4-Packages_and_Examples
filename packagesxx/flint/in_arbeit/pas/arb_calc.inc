{$IFDEF read_interface}


{
    Copyright (C) 2013 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ARB_CALC_H}
{$define ARB_CALC_H}
{$include "arb.h"}
{ C++ extern C conditionnal removed }
  var
    arb_calc_verbose : longint;cvar;external libflint;
type

  Tarb_calc_func_t = function (out:Tarb_ptr; inp:Tarb_t; param:pointer; order:Tslong; prec:Tslong):longint;cdecl;

const
  ARB_CALC_SUCCESS = 0;  
  ARB_CALC_IMPRECISE_INPUT = 1;  
  ARB_CALC_NO_CONVERGENCE = 2;  
{

static __inline__ void
arf_interval_init(arf_interval_t v)

    arf_init(&v->a);
    arf_init(&v->b);


static __inline__ void
arf_interval_clear(arf_interval_t v)

    arf_clear(&v->a);
    arf_clear(&v->b);


static __inline__ arf_interval_ptr
_arf_interval_vec_init(slong n)

    slong i;
    arf_interval_ptr v = (arf_interval_ptr) flint_malloc(sizeof(arf_interval_struct) * n);

    for (i = 0; i < n; i++)
        arf_interval_init(v + i);

    return v;


static __inline__ void
_arf_interval_vec_clear(arf_interval_ptr v, slong n)

    slong i;
    for (i = 0; i < n; i++)
        arf_interval_clear(v + i);
    flint_free(v);


static __inline__ void
arf_interval_set(arf_interval_t v, const arf_interval_t u)

    arf_set(&v->a, &u->a);
    arf_set(&v->b, &u->b);


static __inline__ void
arf_interval_swap(arf_interval_t v, arf_interval_t u)

    arf_swap(&v->a, &u->a);
    arf_swap(&v->b, &u->b);


static __inline__ void
arf_interval_get_arb(arb_t x, const arf_interval_t v, slong prec)

    arb_set_interval_arf(x, &v->a, &v->b, prec);


 }
{$ifdef FLINT_HAVE_FILE}

procedure arf_interval_fprintd(file:PFILE; v:Tarf_interval_t; n:Tslong);cdecl;external libflint;
{$endif}

procedure arf_interval_printd(v:Tarf_interval_t; n:Tslong);cdecl;external libflint;
{ bisection  }
function arb_calc_partition(L:Tarf_interval_t; R:Tarf_interval_t; func:Tarb_calc_func_t; param:pointer; block:Tarf_interval_t; 
           prec:Tslong):longint;cdecl;external libflint;
function arb_calc_isolate_roots(blocks:Parf_interval_ptr; flags:PPlongint; func:Tarb_calc_func_t; param:pointer; block:Tarf_interval_t; 
           maxdepth:Tslong; maxeval:Tslong; maxfound:Tslong; prec:Tslong):Tslong;cdecl;external libflint;
function arb_calc_refine_root_bisect(r:Tarf_interval_t; func:Tarb_calc_func_t; param:pointer; start:Tarf_interval_t; iter:Tslong; 
           prec:Tslong):longint;cdecl;external libflint;
{ newton iteration  }
procedure arb_calc_newton_conv_factor(conv_factor:Tarf_t; func:Tarb_calc_func_t; param:pointer; conv_region:Tarb_t; prec:Tslong);cdecl;external libflint;
function arb_calc_newton_step(xnew:Tarb_t; func:Tarb_calc_func_t; param:pointer; x:Tarb_t; conv_region:Tarb_t; 
           conv_factor:Tarf_t; prec:Tslong):longint;cdecl;external libflint;
function arb_calc_refine_root_newton(r:Tarb_t; func:Tarb_calc_func_t; param:pointer; start:Tarb_t; conv_region:Tarb_t; 
           conv_factor:Tarf_t; eval_extra_prec:Tslong; prec:Tslong):longint;cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 17:30:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
