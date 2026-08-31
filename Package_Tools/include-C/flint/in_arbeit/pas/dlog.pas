unit dlog;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2016 Pascal Molin

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef DLOG_H}
{$define DLOG_H}
{$include "ulong_extras.h"}
{ C++ extern C conditionnal removed }
type
  Txxxxxx =  Longint;
  Const
    DLOG_MODPE = 0;
    DLOG_CRT = 1;
    DLOG_POWER = 2;
    DLOG_BSGS = 3;
    DLOG_TABLE = 4;
    DLOG_23 = 5;

type

  Pdlog_precomp_ptr = ^Tdlog_precomp_ptr;
  Tdlog_precomp_ptr = Pdlog_precomp_struct;
{ log in (1+pZ/p^eZ), e small: use recursion formulas
 * could use padic log instead but exponent is small
 * for ulongs  }
{ 1 / (1 + p)  }
{ 1 / log(a^(p-1),1+p)  }

  Pdlog_1modpe_struct = ^Tdlog_1modpe_struct;
  Tdlog_1modpe_struct = record
      inv1p : Tulong;
      invloga1 : Tulong;
    end;

  Pdlog_1modpe_t = ^Tdlog_1modpe_t;
  Tdlog_1modpe_t = array[0..0] of Tdlog_1modpe_struct;
{ log in (Z/p^eZ)^*  }
{ p^(e-1)  }

  Pdlog_modpe_struct = ^Tdlog_modpe_struct;
  Tdlog_modpe_struct = record
      p : Tulong;
      e : Tulong;
      pe1 : Tulong;
      inva : Tulong;
      pe : Tnmod_t;
      modp : Pdlog_precomp_struct;
      modpe : Tdlog_1modpe_t;
    end;

  Pdlog_modpe_t = ^Tdlog_modpe_t;
  Tdlog_modpe_t = array[0..0] of Tdlog_modpe_struct;
{ all logs precomputed in (Z/modZ)^ast  }

  Pdlog_table_struct = ^Tdlog_table_struct;
  Tdlog_table_struct = record
      mod : Tulong;
      table : Pulong;
    end;

  Pdlog_table_t = ^Tdlog_table_t;
  Tdlog_table_t = array[0..0] of Tdlog_table_struct;
{ bsgs table, already in flint  }

  Papow = ^Tapow;
  Tapow = record
      k : Tulong;
      ak : Tulong;
    end;
  Tapow_t = Tapow;
  Papow_t = ^Tapow_t;

function apow_cmp(x:Papow_t; y:Papow_t):longint;cdecl;external libflint;
type
  Pdlog_bsgs_struct = ^Tdlog_bsgs_struct;
  Tdlog_bsgs_struct = record
      mod : Tnmod_t;
      m : Tulong;
      am : Tulong;
      g : Tulong;
      table : Papow_t;
    end;

  Pdlog_bsgs_t = ^Tdlog_bsgs_t;
  Tdlog_bsgs_t = array[0..0] of Tdlog_bsgs_struct;
{ typedef bsgs_t dlog_bsgs_t;  }
{ Pollard rho  }

  Pdlog_rho_struct = ^Tdlog_rho_struct;
  Tdlog_rho_struct = record
      a : Tulong;
      n : Tnmod_t;
      mod : Tnmod_t;
      nisprime : longint;
    end;

  Pdlog_rho_t = ^Tdlog_rho_t;
  Tdlog_rho_t = array[0..0] of Tdlog_rho_struct;
{ CRT decomposition (Pohlig-Hellman)  }

  Pdlog_crt_struct = ^Tdlog_crt_struct;
  Tdlog_crt_struct = record
      mod : Tnmod_t;
      n : Tnmod_t;
      num : Tulong;
      expo : Pulong;
      crt_coeffs : Pulong;
      pre : Tdlog_precomp_ptr;
    end;

  Pdlog_crt_t = ^Tdlog_crt_t;
  Tdlog_crt_t = array[0..0] of Tdlog_crt_struct;
{ dlog when generator has prime power order  }

  Pdlog_power_struct = ^Tdlog_power_struct;
  Tdlog_power_struct = record
      mod : Tnmod_t;
      p : Tulong;
      e : Tulong;
      apk : Pulong;
      pre : Pdlog_precomp_struct;
    end;

  Pdlog_power_t = ^Tdlog_power_t;
  Tdlog_power_t = array[0..0] of Tdlog_power_struct;

  Pdlog_order23_t = ^Tdlog_order23_t;
  Tdlog_order23_t = array[0..0] of Tulong;
{ generic decomposition  }
{typedef  }
  Pdlog_precomp_struct = ^Tdlog_precomp_struct;
  Tdlog_precomp_struct = record
      _type : longint;
      cost : Tulong;
      t : record
          case longint of
            0 : ( table : Tdlog_table_t );
            1 : ( bsgs : Tdlog_bsgs_t );
            2 : ( crt : Tdlog_crt_t );
            3 : ( power : Tdlog_power_t );
            4 : ( modpe : Tdlog_modpe_t );
            5 : ( order23 : Tdlog_order23_t );
          end;
    end;


  Pdlog_precomp_t = ^Tdlog_precomp_t;
  Tdlog_precomp_t = array[0..0] of Tdlog_precomp_struct;

procedure dlog_precomp_modpe_init(pre:Tdlog_precomp_t; a:Tulong; p:Tulong; e:Tulong; pe:Tulong; 
            num:Tulong);cdecl;external libflint;
procedure dlog_precomp_small_init(pre:Tdlog_precomp_t; a:Tulong; mod:Tulong; n:Tulong; num:Tulong);cdecl;external libflint;
procedure dlog_precomp_n_init(pre:Tdlog_precomp_t; a:Tulong; mod:Tulong; n:Tulong; num:Tulong);cdecl;external libflint;
procedure dlog_precomp_p_init(pre:Tdlog_precomp_t; a:Tulong; mod:Tulong; p:Tulong; num:Tulong);cdecl;external libflint;
procedure dlog_precomp_pe_init(pre:Tdlog_precomp_t; a:Tulong; mod:Tulong; p:Tulong; e:Tulong; 
            pe:Tulong; num:Tulong);cdecl;external libflint;
procedure dlog_precomp_clear(pre:Tdlog_precomp_t);cdecl;external libflint;
function dlog_precomp(pre:Tdlog_precomp_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_order23_init(t:Tdlog_order23_t; a:Tulong):Tulong;cdecl;external libflint;
function dlog_table_init(t:Tdlog_table_t; a:Tulong; mod:Tulong):Tulong;cdecl;external libflint;
function dlog_crt_init(t:Tdlog_crt_t; a:Tulong; mod:Tulong; n:Tulong; num:Tulong):Tulong;cdecl;external libflint;
function dlog_power_init(t:Tdlog_power_t; a:Tulong; mod:Tulong; p:Tulong; e:Tulong; 
           num:Tulong):Tulong;cdecl;external libflint;
function dlog_modpe_init(t:Tdlog_modpe_t; a:Tulong; p:Tulong; e:Tulong; pe:Tulong; 
           num:Tulong):Tulong;cdecl;external libflint;
function dlog_bsgs_init(t:Tdlog_bsgs_t; a:Tulong; mod:Tulong; n:Tulong; m:Tulong):Tulong;cdecl;external libflint;
procedure dlog_1modpe_init(t:Tdlog_1modpe_t; a1:Tulong; p:Tulong; e:Tulong; pe:Tnmod_t);cdecl;external libflint;
procedure dlog_rho_init(t:Tdlog_rho_t; a:Tulong; mod:Tulong; n:Tulong);cdecl;external libflint;
{#define dlog_bsgs_init(t, a, n, m) bsgs_table_init(t, a, n, m) }
function dlog_once(b:Tulong; a:Tulong; mod:Tnmod_t; n:Tulong):Tulong;cdecl;external libflint;
{xxxxxxx
DLOG_INLINE void
dlog_order23_clear(dlog_order23_t t)

    return;


DLOG_INLINE void
dlog_table_clear(dlog_table_t t)

    flint_free(t->table);


void dlog_crt_clear(dlog_crt_t t);

DLOG_INLINE void
dlog_power_clear(dlog_power_t t)

    flint_free(t->apk);
    dlog_precomp_clear(t->pre);
    flint_free(t->pre);


DLOG_INLINE void
dlog_modpe_clear(dlog_modpe_t t)

    dlog_precomp_clear(t->modp);
    flint_free(t->modp);



DLOG_INLINE void
dlog_bsgs_clear(dlog_bsgs_t t)

    flint_free(t->table);



DLOG_INLINE void
dlog_rho_clear(dlog_rho_t t)

    return;



DLOG_INLINE ulong
dlog_bsgs_size(ulong n, ulong num)

    if (2 * num < n)
        return (1 + n_sqrt(n)) * (1 + n_sqrt(num));
    else
        return n;



 }
function dlog_order23(t:Tdlog_order23_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_table(t:Tdlog_table_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_crt(t:Tdlog_crt_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_power(t:Tdlog_power_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_modpe(t:Tdlog_modpe_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_bsgs(t:Tdlog_bsgs_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_rho(t:Tdlog_rho_t; b:Tulong):Tulong;cdecl;external libflint;
function dlog_1modpe_1modp(b1:Tulong; p:Tulong; e:Tulong; inv1p:Tulong; pe:Tnmod_t):Tulong;cdecl;external libflint;
function dlog_1modpe(t:Tdlog_1modpe_t; b1:Tulong; p:Tulong; e:Tulong; pe:Tnmod_t):Tulong;cdecl;external libflint;
function dlog_mod2e_1mod4(b1:Tulong; e:Tulong; inva:Tulong; pe:Tnmod_t):Tulong;cdecl;external libflint;
function dlog_mod2e(t:Tdlog_modpe_t; b:Tulong):Tulong;cdecl;external libflint;
{#define dlog_bsgs(t, b) n_discrete_log_bsgs_table(t, b) }
const
  DLOG_SMALL_LIM = 50;  
  DLOG_TABLE_LIM = 50;  
  DLOG_TABLE_P_LIM = 50;  
  DLOG_TABLE_MODPE_LIM = 50;  
  DLOG_TABLE_PE_LIM = 50;  
  DLOG_TABLE_N_LIM = 50;  
  DLOG_BSGS_LIM = 500;  
  DLOG_LOOP_MAX_FACTOR = 6;  
  DLOG_G_SMALL = 0;  
  DLOG_G_BIG = 1;  

procedure dlog_n_factor_group(fac:Pn_factor_t; bound:Tulong);cdecl;external libflint;
const
  DLOG_NOT_FOUND = UWORD_MAX;  
  DLOG_NONE = UWORD_MAX;  

function dlog_vec_pindex_factorgcd(v:Pulong; nv:Tulong; p:Tulong; mod:Tnmod_t; a:Tulong; 
           na:Tulong; loga:Tulong; logm1:Tulong; order:Tnmod_t; maxtry:longint):Tulong;cdecl;external libflint;
procedure dlog_vec_fill(v:Pulong; nv:Tulong; x:Tulong);cdecl;external libflint;
procedure dlog_vec_set_not_found(v:Pulong; nv:Tulong; mod:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_loop(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_loop_add(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_eratos_add(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_eratos(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_sieve_add(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_sieve(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_add(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec(v:Pulong; nv:Tulong; a:Tulong; va:Tulong; mod:Tnmod_t; 
            na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_sieve_precomp(v:Pulong; nv:Tulong; pre:Tdlog_precomp_t; a:Tulong; va:Tulong; 
            mod:Tnmod_t; na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_sieve_add_precomp(v:Pulong; nv:Tulong; pre:Tdlog_precomp_t; a:Tulong; va:Tulong; 
            mod:Tnmod_t; na:Tulong; order:Tnmod_t);cdecl;external libflint;
procedure dlog_vec_add_precomp(v:Pulong; nv:Tulong; pre:Tdlog_precomp_t; a:Tulong; va:Tulong; 
            mod:Tnmod_t; na:Tulong; order:Tnmod_t);cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:50 ===


implementation



end.
