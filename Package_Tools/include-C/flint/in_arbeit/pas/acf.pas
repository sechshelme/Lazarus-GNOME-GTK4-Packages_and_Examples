unit acf;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2022 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function acf_realref(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acf_imagref(x : longint) : longint;

procedure acf_init(x:Tacf_t);cdecl;external libflint;
procedure acf_clear(x:Tacf_t);cdecl;external libflint;
function _acf_vec_init(n:Tslong):Tacf_ptr;cdecl;external libflint;
procedure _acf_vec_clear(v:Tacf_ptr; n:Tslong);cdecl;external libflint;
function acf_real_ptr(z:Tacf_t):Tarf_ptr;cdecl;external libflint;
function acf_imag_ptr(z:Tacf_t):Tarf_ptr;cdecl;external libflint;
procedure acf_set(z:Tacf_t; x:Tacf_t);cdecl;external libflint;
procedure acf_swap(z:Tacf_t; x:Tacf_t);cdecl;external libflint;
function acf_equal(x:Tacf_t; y:Tacf_t):longint;cdecl;external libflint;
{ todo: document  }
procedure acf_printd(x:Tacf_t; n:Tslong);cdecl;external libflint;
{ todo: document  }
function acf_bits(x:Tacf_t):Tslong;cdecl;external libflint;
function acf_allocated_bytes(x:Tacf_t):Tslong;cdecl;external libflint;
{ todo: document  }
procedure acf_randtest(x:Tacf_t; state:Tflint_rand_t; bits:Tslong; mag_bits:Tslong);cdecl;external libflint;
{ todo: document  }
procedure acf_get_mag(res:Tmag_t; x:Tacf_t);cdecl;external libflint;
{ todo: document  }
procedure acf_neg(z:Tacf_t; x:Tacf_t);cdecl;external libflint;
{ todo: document  }
function acf_set_round(res:Tacf_t; x:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
{ todo: document  }
function acf_neg_round(res:Tacf_t; x:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function acf_add(res:Tacf_t; x:Tacf_t; y:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function acf_sub(res:Tacf_t; x:Tacf_t; y:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
function acf_mul(res:Tacf_t; x:Tacf_t; y:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external libflint;
procedure acf_approx_inv(res:Tacf_t; x:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t);cdecl;external libflint;
procedure acf_approx_div(res:Tacf_t; x:Tacf_t; y:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t);cdecl;external libflint;
procedure acf_approx_sqrt(res:Tacf_t; x:Tacf_t; prec:Tslong; rnd:Tarf_rnd_t);cdecl;external libflint;
procedure acf_approx_dot(res:Tacf_t; initial:Tacf_t; subtract:longint; x:Tacf_srcptr; xstep:Tslong; 
            y:Tacf_srcptr; ystep:Tslong; len:Tslong; prec:Tslong; rnd:Tarf_rnd_t);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 16:12:29 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acf_realref(x : longint) : longint;
begin
  acf_realref:=@(x^.real);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acf_imagref(x : longint) : longint;
begin
  acf_imagref:=@(x^.imag);
end;


end.
