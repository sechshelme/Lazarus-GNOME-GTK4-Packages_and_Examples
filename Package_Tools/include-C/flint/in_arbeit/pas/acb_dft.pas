unit acb_dft;

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
{$include "ulong_extras.h"}
{$include "acb.h"}
{ C++ extern C conditionnal removed }

procedure _acb_dft_naive(w:Tacb_ptr; v:Tacb_srcptr; dv:Tslong; z:Tacb_srcptr; dz:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_naive(w:Tacb_ptr; v:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_crt(w:Tacb_ptr; v:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_cyc(w:Tacb_ptr; v:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_rad2_inplace(v:Tacb_ptr; e:longint; prec:Tslong);cdecl;external libflint;
procedure acb_dft_rad2(w:Tacb_ptr; v:Tacb_srcptr; e:longint; prec:Tslong);cdecl;external libflint;
procedure acb_dft_bluestein(w:Tacb_ptr; v:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_prod(w:Tacb_ptr; v:Tacb_srcptr; cyc:Pslong; num:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_rad2_inplace_threaded(v:Tacb_ptr; e:longint; prec:Tslong);cdecl;external libflint;
procedure acb_dft_convol_naive(w:Tacb_ptr; f:Tacb_srcptr; g:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_convol_dft(w:Tacb_ptr; f:Tacb_srcptr; g:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_convol_rad2(w:Tacb_ptr; f:Tacb_srcptr; g:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_convol_mullow(w:Tacb_ptr; f:Tacb_srcptr; g:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_convol(w:Tacb_ptr; f:Tacb_srcptr; g:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
const
  CRT_MAX = 15;  
type
  Pcrt_struct = ^Tcrt_struct;
  Tcrt_struct = record
      num : longint;
      n : Tnmod_t;
      m : array[0..(CRT_MAX)-1] of Tslong;
      M : array[0..(CRT_MAX)-1] of Tulong;
      vM : array[0..(CRT_MAX)-1] of Tulong;
    end;

  Pcrt_t = ^Tcrt_t;
  Tcrt_t = array[0..0] of Tcrt_struct;

procedure crt_init(c:Tcrt_t; n:Tulong);cdecl;external libflint;
procedure crt_decomp(y:Tacb_ptr; x:Tacb_srcptr; dx:Tslong; c:Tcrt_t; len:Tulong);cdecl;external libflint;
procedure crt_recomp(y:Tacb_ptr; x:Tacb_srcptr; c:Tcrt_t; len:Tulong);cdecl;external libflint;
type

  Pacb_dft_step_ptr = ^Tacb_dft_step_ptr;
  Tacb_dft_step_ptr = Pacb_dft_step_struct;

  Pacb_dft_cyc_struct = ^Tacb_dft_cyc_struct;
  Tacb_dft_cyc_struct = record
      n : Tslong;
      z : Tacb_ptr;
      zclear : longint;
      num : Tslong;
      cyc : Tacb_dft_step_ptr;
    end;

  Pacb_dft_cyc_t = ^Tacb_dft_cyc_t;
  Tacb_dft_cyc_t = array[0..0] of Tacb_dft_cyc_struct;
{ = 1 << e  }
{ = n but could be bigger  }

  Pacb_dft_rad2_struct = ^Tacb_dft_rad2_struct;
  Tacb_dft_rad2_struct = record
      e : longint;
      n : Tslong;
      dv : Tslong;
      nz : Tslong;
      z : Tacb_ptr;
    end;

  Pacb_dft_rad2_t = ^Tacb_dft_rad2_t;
  Tacb_dft_rad2_t = array[0..0] of Tacb_dft_rad2_struct;
{ z[k] = e(k^2/2n)  }
{ g[k] = dft( z )  }

  Pacb_dft_bluestein_struct = ^Tacb_dft_bluestein_struct;
  Tacb_dft_bluestein_struct = record
      n : Tslong;
      dv : Tslong;
      z : Tacb_ptr;
      g : Tacb_ptr;
      rad2 : Tacb_dft_rad2_t;
    end;

  Pacb_dft_bluestein_t = ^Tacb_dft_bluestein_t;
  Tacb_dft_bluestein_t = array[0..0] of Tacb_dft_bluestein_struct;

  Pacb_dft_prod_struct = ^Tacb_dft_prod_struct;
  Tacb_dft_prod_struct = record
      n : Tslong;
      num : Tslong;
      cyc : Tacb_dft_step_ptr;
    end;

  Pacb_dft_prod_t = ^Tacb_dft_prod_t;
  Tacb_dft_prod_t = array[0..0] of Tacb_dft_prod_struct;
{ then a product  }

  Pacb_dft_crt_struct = ^Tacb_dft_crt_struct;
  Tacb_dft_crt_struct = record
      n : Tslong;
      c : Tcrt_t;
      dv : Tslong;
      cyc : Tacb_dft_step_ptr;
    end;

  Pacb_dft_crt_t = ^Tacb_dft_crt_t;
  Tacb_dft_crt_t = array[0..0] of Tacb_dft_crt_struct;

  Pacb_dft_naive_struct = ^Tacb_dft_naive_struct;
  Tacb_dft_naive_struct = record
      n : Tslong;
      dv : Tslong;
      zclear : longint;
      z : Tacb_ptr;
      dz : Tslong;
    end;

  Pacb_dft_naive_t = ^Tacb_dft_naive_t;
  Tacb_dft_naive_t = array[0..0] of Tacb_dft_naive_struct;

  Pacb_dft_pre_struct = ^Tacb_dft_pre_struct;
  Tacb_dft_pre_struct = record
      n : Tslong;
      _type : longint;
      t : record
          case longint of
            0 : ( rad2 : Tacb_dft_rad2_t );
            1 : ( cyc : Tacb_dft_cyc_t );
            2 : ( prod : Tacb_dft_prod_t );
            3 : ( crt : Tacb_dft_crt_t );
            4 : ( naive : Tacb_dft_naive_t );
            5 : ( bluestein : Tacb_dft_bluestein_t );
          end;
    end;

  Pacb_dft_pre_t = ^Tacb_dft_pre_t;
  Tacb_dft_pre_t = array[0..0] of Tacb_dft_pre_struct;
{ covers both product and cyclic case  }
{ [G:H]  }
{ card H  }
{ = M for prod, also = M if cyc is reordered  }
{ pointer on some roots of unity, if needed  }
{ index of mM in z  }
{ dft to call on H  }
{ dft to call on G/H ?  }
  Pacb_dft_step_struct = ^Tacb_dft_step_struct;
  Tacb_dft_step_struct = record
      m : Tslong;
      M : Tslong;
      dv : Tslong;
      z : Tacb_srcptr;
      dz : Tslong;
      pre : Tacb_dft_pre_t;
    end;

{typedef acb_dft_pre_struct acb_dft_pre_t[1]; }

const
  DFT_VERB = 0;  
type
  Txxxxxxx =  Longint;
  Const
    DFT_NAIVE = 0;
    DFT_CYC = 1;
    DFT_PROD = 2;
    DFT_CRT = 3;
    DFT_RAD2 = 4;
    DFT_CONV = 5;


procedure acb_dft_step(w:Tacb_ptr; v:Tacb_srcptr; cyc:Tacb_dft_step_ptr; num:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_precomp(w:Tacb_ptr; v:Tacb_srcptr; pre:Tacb_dft_pre_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_inverse_precomp(w:Tacb_ptr; v:Tacb_srcptr; pre:Tacb_dft_pre_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_naive_precomp(w:Tacb_ptr; v:Tacb_srcptr; pol:Tacb_dft_naive_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_cyc_precomp(w:Tacb_ptr; v:Tacb_srcptr; cyc:Tacb_dft_cyc_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_rad2_precomp_inplace(v:Tacb_ptr; rad2:Tacb_dft_rad2_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_rad2_precomp(w:Tacb_ptr; v:Tacb_srcptr; rad2:Tacb_dft_rad2_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_crt_precomp(w:Tacb_ptr; v:Tacb_srcptr; crt:Tacb_dft_crt_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_prod_precomp(w:Tacb_ptr; v:Tacb_srcptr; prod:Tacb_dft_prod_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_bluestein_precomp(w:Tacb_ptr; v:Tacb_srcptr; t:Tacb_dft_bluestein_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_rad2_precomp_inplace_threaded(v:Tacb_ptr; rad2:Tacb_dft_rad2_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_inverse_rad2_precomp_inplace(v:Tacb_ptr; rad2:Tacb_dft_rad2_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_inverse_rad2_precomp(w:Tacb_ptr; v:Tacb_srcptr; rad2:Tacb_dft_rad2_t; prec:Tslong);cdecl;external libflint;
procedure acb_dft_convol_rad2_precomp(w:Tacb_ptr; f:Tacb_srcptr; g:Tacb_srcptr; len:Tslong; para5:Tacb_dft_rad2_t; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_dft_precomp_init(pre:Tacb_dft_pre_t; dv:Tslong; z:Tacb_ptr; dz:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_dft_precomp_init(pre:Tacb_dft_pre_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_precomp_clear(pre:Tacb_dft_pre_t);cdecl;external libflint;
procedure acb_dft(w:Tacb_ptr; v:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_inverse(w:Tacb_ptr; v:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
function _acb_dft_steps_prod(m:Pslong; num:Tslong; prec:Tslong):Tacb_dft_step_ptr;cdecl;external libflint;
{
ACB_DFT_INLINE void
acb_dft_prod_init(acb_dft_prod_t t, slong * cyc, slong num, slong prec)

    t->num = num;
    t->cyc = _acb_dft_steps_prod(cyc, num, prec);

 }
procedure acb_dft_prod_clear(t:Tacb_dft_prod_t);cdecl;external libflint;
procedure _acb_dft_cyc_init_z_fac(t:Tacb_dft_cyc_t; fac:Tn_factor_t; dv:Tslong; z:Tacb_ptr; dz:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_dft_cyc_init(t:Tacb_dft_cyc_t; dv:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
{
ACB_DFT_INLINE void
acb_dft_cyc_init(acb_dft_cyc_t t, slong len, slong prec)

    _acb_dft_cyc_init(t, 1, len, prec);

 }
procedure acb_dft_cyc_clear(t:Tacb_dft_cyc_t);cdecl;external libflint;
procedure _acb_dft_naive_init(pol:Tacb_dft_naive_t; dv:Tslong; z:Tacb_ptr; dz:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
{
ACB_DFT_INLINE void
acb_dft_naive_init(acb_dft_naive_t pol, slong len, slong prec)

    _acb_dft_naive_init(pol, 1, NULL, 0, len, prec);


ACB_DFT_INLINE void
acb_dft_naive_clear(acb_dft_naive_t pol)

    if (pol->zclear)
        _acb_vec_clear(pol->z, pol->n);

 }
procedure _acb_dft_rad2_init(t:Tacb_dft_rad2_t; dv:Tslong; e:longint; prec:Tslong);cdecl;external libflint;
{
ACB_DFT_INLINE void
acb_dft_rad2_init(acb_dft_rad2_t t, int e, slong prec)

    _acb_dft_rad2_init(t, 1, e, prec);


ACB_DFT_INLINE void
acb_dft_rad2_clear(acb_dft_rad2_t t)

    _acb_vec_clear(t->z, t->nz);

 }
procedure _acb_dft_bluestein_init(t:Tacb_dft_bluestein_t; dv:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
{
ACB_DFT_INLINE void
acb_dft_bluestein_init(acb_dft_bluestein_t t, slong n, slong prec)

    _acb_dft_bluestein_init(t, 1, n, prec);


ACB_DFT_INLINE void
acb_dft_bluestein_clear(acb_dft_bluestein_t t)

    if (t->n != 0)
    
        _acb_vec_clear(t->z, t->n);
        _acb_vec_clear(t->g, t->rad2->n);
        acb_dft_rad2_clear(t->rad2);
    

 }
procedure _acb_dft_crt_init(crt:Tacb_dft_crt_t; dv:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_crt_init(crt:Tacb_dft_crt_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_dft_crt_clear(crt:Tacb_dft_crt_t);cdecl;external libflint;
{ 
ACB_DFT_INLINE void
acb_swap_ri(acb_t x)

    arb_swap(acb_realref(x), acb_imagref(x));


ACB_DFT_INLINE void
acb_vec_swap_ri(acb_ptr v, slong len)

    slong k;
    for (k = 0; k < len; k++)
        acb_swap_ri(v + k);


ACB_DFT_INLINE void
_acb_vec_kronecker_mul(acb_ptr z, acb_srcptr x, acb_srcptr y, slong len, slong prec)

    slong k;
    for (k = 0; k < len; k++)
        acb_mul(z + k, x + k, y + k, prec);


ACB_DFT_INLINE void
_acb_vec_kronecker_mul_step(acb_ptr z, acb_srcptr x, acb_srcptr y, slong step, slong len, slong prec)

    slong k;
    for (k = 0; k < len; k++)
    
        acb_mul(z + k, x + k, y + k * step, prec);
    


ACB_DFT_INLINE void
acb_vec_printd_index(acb_srcptr vec, slong len, slong digits)

    slong i;
    for (i = 0; i < len; i++)
    
        flint_printf("[%wd] ", i);
        acb_printd(vec + i, digits);
        flint_printf("\n");
    

 }

// === Konventiert am: 29-8-26 16:12:48 ===


implementation



end.
