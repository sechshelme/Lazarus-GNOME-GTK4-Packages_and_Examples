{$IFDEF read_interface}


{
    Copyright (C) 2016 Pascal Molin

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }

const
  MAX_FACTORS = 15;  
{ should this dlog pointer be in the prime or the global group?  }
{ underlying prime  }
{ exponent  }
{ modulus  }
{ phi(p^e)  }
{ conrey generator  }
{ precomputed data for discrete log mod p^e  }
type
  Pdirichlet_prime_group_struct = ^Tdirichlet_prime_group_struct;
  Tdirichlet_prime_group_struct = record
      p : Tulong;
      e : longint;
      pe : Tnmod_t;
      phi : Tnmod_t;
      g : Tulong;
      dlog : Pdlog_precomp_struct;
    end;
{ modulus  }
{ even part of modulus  }
{ modulus with precomputed inverse  }
{ radical = product of odd primes  }
{ phi(q) = group size  }
{ number of even components (in 0,1,2) }
{ number of prime components (even + odd)  }
{ exponent = largest order in G  }
{ generators lifted mod q  }
{ PHI(k) = expo / phi(k)         }

  Pdirichlet_group_struct = ^Tdirichlet_group_struct;
  Tdirichlet_group_struct = record
      q : Tulong;
      q_even : Tulong;
      mod : Tnmod_t;
      rad_q : Tulong;
      phi_q : Tulong;
      neven : Tslong;
      num : Tslong;
      expo : Tulong;
      P : Pdirichlet_prime_group_struct;
      generators : Pulong;
      PHI : Pulong;
    end;

  Pdirichlet_group_t = ^Tdirichlet_group_t;
  Tdirichlet_group_t = array[0..0] of Tdirichlet_group_struct;

function dirichlet_group_size(G:Tdirichlet_group_t):Tulong;cdecl;external libflint;
function dirichlet_group_num_primitive(G:Tdirichlet_group_t):Tulong;cdecl;external libflint;
function dirichlet_group_init(G:Tdirichlet_group_t; q:Tulong):longint;cdecl;external libflint;
procedure dirichlet_subgroup_init(H:Tdirichlet_group_t; G:Tdirichlet_group_t; h:Tulong);cdecl;external libflint;
procedure dirichlet_group_clear(G:Tdirichlet_group_t);cdecl;external libflint;
procedure dirichlet_group_dlog_precompute(G:Tdirichlet_group_t; num:Tulong);cdecl;external libflint;
procedure dirichlet_group_dlog_clear(G:Tdirichlet_group_t);cdecl;external libflint;
{ properties of elements without log  }
function dirichlet_conductor_ui(G:Tdirichlet_group_t; a:Tulong):Tulong;cdecl;external libflint;
function dirichlet_parity_ui(G:Tdirichlet_group_t; a:Tulong):longint;cdecl;external libflint;
function dirichlet_order_ui(G:Tdirichlet_group_t; a:Tulong):Tulong;cdecl;external libflint;
{ characters, keep both number and log  }
{ number  }
{ s.t. prod generators[k]^log[k] = number  }
type
  Pdirichlet_char_struct = ^Tdirichlet_char_struct;
  Tdirichlet_char_struct = record
      n : Tulong;
      log : Pulong;
    end;

  Pdirichlet_char_t = ^Tdirichlet_char_t;
  Tdirichlet_char_t = array[0..0] of Tdirichlet_char_struct;

procedure dirichlet_char_init(x:Tdirichlet_char_t; G:Tdirichlet_group_t);cdecl;external libflint;
procedure dirichlet_char_clear(x:Tdirichlet_char_t);cdecl;external libflint;
procedure dirichlet_char_print(G:Tdirichlet_group_t; x:Tdirichlet_char_t);cdecl;external libflint;
procedure dirichlet_char_set(x:Tdirichlet_char_t; G:Tdirichlet_group_t; y:Tdirichlet_char_t);cdecl;external libflint;
function dirichlet_char_eq(x:Tdirichlet_char_t; y:Tdirichlet_char_t):longint;cdecl;external libflint;
function dirichlet_char_eq_deep(G:Tdirichlet_group_t; x:Tdirichlet_char_t; y:Tdirichlet_char_t):longint;cdecl;external libflint;
function dirichlet_parity_char(G:Tdirichlet_group_t; x:Tdirichlet_char_t):longint;cdecl;external libflint;
function dirichlet_conductor_char(G:Tdirichlet_group_t; x:Tdirichlet_char_t):Tulong;cdecl;external libflint;
function dirichlet_order_char(G:Tdirichlet_group_t; x:Tdirichlet_char_t):Tulong;cdecl;external libflint;
procedure dirichlet_char_log(x:Tdirichlet_char_t; G:Tdirichlet_group_t; m:Tulong);cdecl;external libflint;
function dirichlet_char_exp(G:Tdirichlet_group_t; x:Tdirichlet_char_t):Tulong;cdecl;external libflint;
function _dirichlet_char_exp(x:Tdirichlet_char_t; G:Tdirichlet_group_t):Tulong;cdecl;external libflint;
procedure dirichlet_char_index(x:Tdirichlet_char_t; G:Tdirichlet_group_t; j:Tulong);cdecl;external libflint;
function dirichlet_index_char(G:Tdirichlet_group_t; x:Tdirichlet_char_t):Tulong;cdecl;external libflint;
procedure dirichlet_char_one(x:Tdirichlet_char_t; G:Tdirichlet_group_t);cdecl;external libflint;
procedure dirichlet_char_first_primitive(x:Tdirichlet_char_t; G:Tdirichlet_group_t);cdecl;external libflint;
function dirichlet_char_next(x:Tdirichlet_char_t; G:Tdirichlet_group_t):longint;cdecl;external libflint;
function dirichlet_char_next_primitive(x:Tdirichlet_char_t; G:Tdirichlet_group_t):longint;cdecl;external libflint;
procedure dirichlet_char_mul(c:Tdirichlet_char_t; G:Tdirichlet_group_t; a:Tdirichlet_char_t; b:Tdirichlet_char_t);cdecl;external libflint;
procedure dirichlet_char_pow(c:Tdirichlet_char_t; G:Tdirichlet_group_t; a:Tdirichlet_char_t; n:Tulong);cdecl;external libflint;
procedure dirichlet_char_lower(y:Tdirichlet_char_t; H:Tdirichlet_group_t; x:Tdirichlet_char_t; G:Tdirichlet_group_t);cdecl;external libflint;
procedure dirichlet_char_lift(y:Tdirichlet_char_t; G:Tdirichlet_group_t; x:Tdirichlet_char_t; H:Tdirichlet_group_t);cdecl;external libflint;
const
  DIRICHLET_CHI_NULL = UWORD_MAX;  

function dirichlet_pairing(G:Tdirichlet_group_t; m:Tulong; n:Tulong):Tulong;cdecl;external libflint;
function dirichlet_pairing_char(G:Tdirichlet_group_t; a:Tdirichlet_char_t; b:Tdirichlet_char_t):Tulong;cdecl;external libflint;
function dirichlet_char_is_principal(G:Tdirichlet_group_t; chi:Tdirichlet_char_t):longint;cdecl;external libflint;
function dirichlet_char_is_real(G:Tdirichlet_group_t; chi:Tdirichlet_char_t):longint;cdecl;external libflint;
function dirichlet_char_is_primitive(G:Tdirichlet_group_t; chi:Tdirichlet_char_t):longint;cdecl;external libflint;
function dirichlet_chi(G:Tdirichlet_group_t; chi:Tdirichlet_char_t; n:Tulong):Tulong;cdecl;external libflint;
procedure dirichlet_vec_set_null(v:Pulong; G:Tdirichlet_group_t; nv:Tslong);cdecl;external libflint;
procedure dirichlet_chi_vec_loop(v:Pulong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; nv:Tslong);cdecl;external libflint;
procedure dirichlet_chi_vec_primeloop(v:Pulong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; nv:Tslong);cdecl;external libflint;
procedure dirichlet_chi_vec(v:Pulong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; nv:Tslong);cdecl;external libflint;
procedure dirichlet_chi_vec_loop_order(v:Pulong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; order:Tulong; nv:Tslong);cdecl;external libflint;
procedure dirichlet_chi_vec_primeloop_order(v:Pulong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; order:Tulong; nv:Tslong);cdecl;external libflint;
procedure dirichlet_chi_vec_order(v:Pulong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; order:Tulong; nv:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
