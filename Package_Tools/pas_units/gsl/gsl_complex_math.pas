unit gsl_complex_math;

interface

uses
  fp_gsl, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_complex_polar(r: Tdouble; theta: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_rect(x: Tdouble; y: Tdouble): Tgsl_complex; cdecl; external libgsl;

function GSL_COMPLEX_ONE: Tgsl_complex;
function GSL_COMPLEX_ZERO: Tgsl_complex;
function GSL_COMPLEX_NEGONE: Tgsl_complex;

function gsl_complex_arg(z: Tgsl_complex): Tdouble; cdecl; external libgsl;
function gsl_complex_abs(z: Tgsl_complex): Tdouble; cdecl; external libgsl;
function gsl_complex_abs2(z: Tgsl_complex): Tdouble; cdecl; external libgsl;
function gsl_complex_logabs(z: Tgsl_complex): Tdouble; cdecl; external libgsl;
function gsl_complex_add(a: Tgsl_complex; b: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sub(a: Tgsl_complex; b: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_mul(a: Tgsl_complex; b: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_div(a: Tgsl_complex; b: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_add_real(a: Tgsl_complex; x: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sub_real(a: Tgsl_complex; x: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_mul_real(a: Tgsl_complex; x: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_div_real(a: Tgsl_complex; x: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_add_imag(a: Tgsl_complex; y: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sub_imag(a: Tgsl_complex; y: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_mul_imag(a: Tgsl_complex; y: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_div_imag(a: Tgsl_complex; y: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_conjugate(z: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_inverse(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_negative(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sqrt(z: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sqrt_real(x: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_pow(a: Tgsl_complex; b: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_pow_real(a: Tgsl_complex; b: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_exp(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_log(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_log10(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_log_b(a: Tgsl_complex; b: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sin(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_cos(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sec(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_csc(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_tan(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_cot(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arcsin(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arcsin_real(a: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccos(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccos_real(a: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arcsec(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arcsec_real(a: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccsc(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccsc_real(a: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arctan(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccot(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sinh(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_cosh(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_sech(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_csch(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_tanh(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_coth(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arcsinh(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccosh(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccosh_real(a: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arcsech(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccsch(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arctanh(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arctanh_real(a: Tdouble): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_arccoth(a: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:36:40 ===


implementation


function GSL_COMPLEX_ONE: Tgsl_complex;
begin
  GSL_COMPLEX_ONE := gsl_complex_rect(1.0, 0.0);
end;

function GSL_COMPLEX_ZERO: Tgsl_complex;
begin
  GSL_COMPLEX_ZERO := gsl_complex_rect(0.0, 0.0);
end;

function GSL_COMPLEX_NEGONE: Tgsl_complex;
begin
  GSL_COMPLEX_NEGONE := gsl_complex_rect(-(1.0), 0.0);
end;


end.
