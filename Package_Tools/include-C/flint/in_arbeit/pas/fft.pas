unit fft;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2009, 2011 William Hart

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{$if defined(__MPIR_VERSION)}

function mpn_sumdiff_n(s:Tmp_ptr; d:Tmp_ptr; x:Tmp_srcptr; y:Tmp_srcptr; n:Tmp_size_t):Tmp_limb_t;cdecl;external libflint;
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function fft_sumdiff(t,u,r,s,n : longint) : longint;

procedure mpn_addmod_2expp1_1(r:Pmp_limb_t; limbs:Tmp_size_t; c:Tmp_limb_signed_t);cdecl;external libflint;
procedure fft_combine_limbs(res:Pmp_limb_t; poly:PPmp_limb_t; length:Tslong; coeff_limbs:Tmp_size_t; output_limbs:Tmp_size_t; 
            total_limbs:Tmp_size_t);cdecl;external libflint;
procedure fft_combine_bits(res:Pmp_limb_t; poly:PPmp_limb_t; length:Tslong; bits:Tflint_bitcnt_t; output_limbs:Tmp_size_t; 
            total_limbs:Tmp_size_t);cdecl;external libflint;
function fft_split_limbs(poly:PPmp_limb_t; limbs:Tmp_srcptr; total_limbs:Tmp_size_t; coeff_limbs:Tmp_size_t; output_limbs:Tmp_size_t):Tmp_size_t;cdecl;external libflint;
function fft_split_bits(poly:PPmp_limb_t; limbs:Tmp_srcptr; total_limbs:Tmp_size_t; bits:Tflint_bitcnt_t; output_limbs:Tmp_size_t):Tmp_size_t;cdecl;external libflint;
procedure fermat_to_mpz(m:Tmpz_t; i:Pmp_limb_t; limbs:Tmp_size_t);cdecl;external libflint;
procedure mpn_normmod_2expp1(t:Pmp_limb_t; limbs:Tmp_size_t);cdecl;external libflint;
procedure butterfly_lshB(t:Pmp_limb_t; u:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; limbs:Tmp_size_t; 
            x:Tmp_size_t; y:Tmp_size_t);cdecl;external libflint;
procedure butterfly_rshB(t:Pmp_limb_t; u:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; limbs:Tmp_size_t; 
            x:Tmp_size_t; y:Tmp_size_t);cdecl;external libflint;
procedure mpn_negmod_2expp1(z:Pmp_limb_t; a:Pmp_limb_t; limbs:Tmp_size_t);cdecl;external libflint;
procedure mpn_mul_2expmod_2expp1(t:Pmp_limb_t; i1:Pmp_limb_t; limbs:Tmp_size_t; d:Tflint_bitcnt_t);cdecl;external libflint;
procedure mpn_div_2expmod_2expp1(t:Pmp_limb_t; i1:Pmp_limb_t; limbs:Tmp_size_t; d:Tflint_bitcnt_t);cdecl;external libflint;
procedure fft_adjust(r:Pmp_limb_t; i1:Pmp_limb_t; i:Tmp_size_t; limbs:Tmp_size_t; w:Tflint_bitcnt_t);cdecl;external libflint;
procedure fft_butterfly(s:Pmp_limb_t; t:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; i:Tmp_size_t; 
            limbs:Tmp_size_t; w:Tflint_bitcnt_t);cdecl;external libflint;
procedure ifft_butterfly(s:Pmp_limb_t; t:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; i:Tmp_size_t; 
            limbs:Tmp_size_t; w:Tflint_bitcnt_t);cdecl;external libflint;
procedure fft_radix2(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t);cdecl;external libflint;
procedure fft_truncate1(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            trunc:Tmp_size_t);cdecl;external libflint;
procedure fft_truncate(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            trunc:Tmp_size_t);cdecl;external libflint;
procedure ifft_radix2(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t);cdecl;external libflint;
procedure ifft_truncate1(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            trunc:Tmp_size_t);cdecl;external libflint;
procedure ifft_truncate(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            trunc:Tmp_size_t);cdecl;external libflint;
procedure fft_butterfly_sqrt2(s:Pmp_limb_t; t:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; i:Tmp_size_t; 
            limbs:Tmp_size_t; w:Tflint_bitcnt_t; temp:Pmp_limb_t);cdecl;external libflint;
procedure ifft_butterfly_sqrt2(s:Pmp_limb_t; t:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; i:Tmp_size_t; 
            limbs:Tmp_size_t; w:Tflint_bitcnt_t; temp:Pmp_limb_t);cdecl;external libflint;
procedure fft_adjust_sqrt2(r:Pmp_limb_t; i1:Pmp_limb_t; i:Tmp_size_t; limbs:Tmp_size_t; w:Tflint_bitcnt_t; 
            temp:Pmp_limb_t);cdecl;external libflint;
procedure fft_truncate_sqrt2(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t; trunc:Tmp_size_t);cdecl;external libflint;
procedure ifft_truncate_sqrt2(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t; trunc:Tmp_size_t);cdecl;external libflint;
procedure mul_truncate_sqrt2(r1:Tmp_ptr; i1:Tmp_srcptr; n1:Tmp_size_t; i2:Tmp_srcptr; n2:Tmp_size_t; 
            depth:Tflint_bitcnt_t; w:Tflint_bitcnt_t);cdecl;external libflint;
procedure fft_butterfly_twiddle(u:Pmp_limb_t; v:Pmp_limb_t; s:Pmp_limb_t; t:Pmp_limb_t; limbs:Tmp_size_t; 
            b1:Tflint_bitcnt_t; b2:Tflint_bitcnt_t);cdecl;external libflint;
procedure ifft_butterfly_twiddle(u:Pmp_limb_t; v:Pmp_limb_t; s:Pmp_limb_t; t:Pmp_limb_t; limbs:Tmp_size_t; 
            b1:Tflint_bitcnt_t; b2:Tflint_bitcnt_t);cdecl;external libflint;
procedure fft_radix2_twiddle(ii:PPmp_limb_t; is:Tmp_size_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; 
            t2:PPmp_limb_t; ws:Tmp_size_t; r:Tmp_size_t; c:Tmp_size_t; rs:Tmp_size_t);cdecl;external libflint;
procedure ifft_radix2_twiddle(ii:PPmp_limb_t; is:Tmp_size_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; 
            t2:PPmp_limb_t; ws:Tmp_size_t; r:Tmp_size_t; c:Tmp_size_t; rs:Tmp_size_t);cdecl;external libflint;
procedure fft_truncate1_twiddle(ii:PPmp_limb_t; is:Tmp_size_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; 
            t2:PPmp_limb_t; ws:Tmp_size_t; r:Tmp_size_t; c:Tmp_size_t; rs:Tmp_size_t; 
            trunc:Tmp_size_t);cdecl;external libflint;
procedure ifft_truncate1_twiddle(ii:PPmp_limb_t; is:Tmp_size_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; 
            t2:PPmp_limb_t; ws:Tmp_size_t; r:Tmp_size_t; c:Tmp_size_t; rs:Tmp_size_t; 
            trunc:Tmp_size_t);cdecl;external libflint;
procedure fft_mfa_truncate_sqrt2(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t; n1:Tmp_size_t; trunc:Tmp_size_t);cdecl;external libflint;
procedure ifft_mfa_truncate_sqrt2(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t; n1:Tmp_size_t; trunc:Tmp_size_t);cdecl;external libflint;
procedure mul_mfa_truncate_sqrt2(r1:Tmp_ptr; i1:Tmp_srcptr; n1:Tmp_size_t; i2:Tmp_srcptr; n2:Tmp_size_t; 
            depth:Tflint_bitcnt_t; w:Tflint_bitcnt_t);cdecl;external libflint;
procedure fft_mfa_truncate_sqrt2_outer(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t; n1:Tmp_size_t; trunc:Tmp_size_t);cdecl;external libflint;
procedure fft_mfa_truncate_sqrt2_inner(ii:PPmp_limb_t; jj:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; 
            t2:PPmp_limb_t; temp:PPmp_limb_t; n1:Tmp_size_t; trunc:Tmp_size_t; tt:PPmp_limb_t);cdecl;external libflint;
procedure ifft_mfa_truncate_sqrt2_outer(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t; n1:Tmp_size_t; trunc:Tmp_size_t);cdecl;external libflint;
procedure fft_negacyclic(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t);cdecl;external libflint;
procedure ifft_negacyclic(ii:PPmp_limb_t; n:Tmp_size_t; w:Tflint_bitcnt_t; t1:PPmp_limb_t; t2:PPmp_limb_t; 
            temp:PPmp_limb_t);cdecl;external libflint;
procedure fft_naive_convolution_1(r:Pmp_limb_t; ii:Pmp_limb_t; jj:Pmp_limb_t; m:Tmp_size_t);cdecl;external libflint;
procedure _fft_mulmod_2expp1(r1:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; r_limbs:Tmp_size_t; depth:Tflint_bitcnt_t; 
            w:Tflint_bitcnt_t);cdecl;external libflint;
function fft_adjust_limbs(limbs:Tmp_size_t):Tslong;cdecl;external libflint;
procedure fft_mulmod_2expp1(r:Pmp_limb_t; i1:Pmp_limb_t; i2:Pmp_limb_t; n:Tmp_size_t; w:Tmp_size_t; 
            tt:Pmp_limb_t);cdecl;external libflint;
procedure flint_mpn_mul_fft_main(r1:Tmp_ptr; i1:Tmp_srcptr; n1:Tmp_size_t; i2:Tmp_srcptr; n2:Tmp_size_t);cdecl;external libflint;
procedure fft_convolution_basic(ii:PPmp_limb_t; jj:PPmp_limb_t; depth:Tslong; limbs:Tslong; trunc:Tslong; 
            t1:PPmp_limb_t; t2:PPmp_limb_t; s1:PPmp_limb_t; tt:PPmp_limb_t);cdecl;external libflint;
procedure fft_convolution(ii:PPmp_limb_t; jj:PPmp_limb_t; depth:Tslong; limbs:Tslong; trunc:Tslong; 
            t1:PPmp_limb_t; t2:PPmp_limb_t; s1:PPmp_limb_t; tt:PPmp_limb_t);cdecl;external libflint;
{**** FFT Precaching **** }
procedure fft_precache(jj:PPmp_limb_t; depth:Tslong; limbs:Tslong; trunc:Tslong; t1:PPmp_limb_t; 
            t2:PPmp_limb_t; s1:PPmp_limb_t);cdecl;external libflint;
procedure fft_convolution_precache(ii:PPmp_limb_t; jj:PPmp_limb_t; depth:Tslong; limbs:Tslong; trunc:Tslong; 
            t1:PPmp_limb_t; t2:PPmp_limb_t; s1:PPmp_limb_t; tt:PPmp_limb_t);cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:33 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fft_sumdiff(t,u,r,s,n : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=0
  else
    if_local1:=mpn_sumdiff_n(t,u,r,s,n);
  fft_sumdiff:=n=(if_local1);
end;


end.
