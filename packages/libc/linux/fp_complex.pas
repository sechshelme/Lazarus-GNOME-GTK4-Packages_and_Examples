unit fp_complex;

interface

{$modeswitch advancedrecords on}

uses
  clib;

type
  TComplexDouble = record
    private
    Re: double;
    Im: double;
  end;

  TComplexSingle = record
    private
    Re: single;
    Im: single;
  end;

  TComplexLongDouble = record
    private
    Re: TLongDouble;
    Im: TLongDouble;
  end;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

operator +(const c0, c1: TComplexDouble): TComplexDouble; inline;
operator -(const c0, c1: TComplexDouble): TComplexDouble; inline;
operator *(const c0, c1: TComplexDouble): TComplexDouble; inline;
operator /(const c0, c1: TComplexDouble): TComplexDouble; inline;

operator +(const c0, c1: TComplexSingle): TComplexSingle; inline;
operator -(const c0, c1: TComplexSingle): TComplexSingle; inline;
operator *(const c0, c1: TComplexSingle): TComplexSingle; inline;
operator /(const c0, c1: TComplexSingle): TComplexSingle; inline;

operator +(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
operator -(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
operator *(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
operator /(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;


//operator +(const c0, c1: TComplexDouble) Res: TComplexDouble; inline;


// /usr/include/x86_64-linux-gnu/bits/cmathcalls.h

function cacos(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function casin(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function catan(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function ccos(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function csin(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function ctan(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function cacosh(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function casinh(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function catanh(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function ccosh(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function csinh(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function ctanh(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function cexp(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function clog(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function clog10(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function cpow(x, y: TComplexDouble): TComplexDouble; cdecl; external libm;
function csqrt(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function cabs(z: TComplexDouble): double; cdecl; external libm;
function carg(z: TComplexDouble): double; cdecl; external libm;
function conj(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function cproj(z: TComplexDouble): TComplexDouble; cdecl; external libm;
function cimag(z: TComplexDouble): double; cdecl; external libm;
function creal(z: TComplexDouble): double; cdecl; external libm;


function cacosf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function casinf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function catanf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function ccosf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function csinf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function ctanf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function cacoshf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function casinhf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function catanhf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function ccoshf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function csinhf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function ctanhf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function cexpf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function clogf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function clog10f(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function cpowf(x, y: TComplexSingle): TComplexSingle; cdecl; external libm;
function csqrtf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function cabsf(z: TComplexSingle): single; cdecl; external libm;
function cargf(z: TComplexSingle): single; cdecl; external libm;
function conjf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function cprojf(z: TComplexSingle): TComplexSingle; cdecl; external libm;
function cimagf(z: TComplexSingle): single; cdecl; external libm;
function crealf(z: TComplexSingle): single; cdecl; external libm;


function cacosl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function casinl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function catanl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function ccosl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function csinl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function ctanl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function cacoshl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function casinhl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function catanhl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function ccoshl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function csinhl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function ctanhl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function cexpl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function clogl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function clog10l(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function cpowl(x, y: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function csqrtl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function cabsl(z: TComplexLongDouble): TLongDouble; cdecl; external libm;
function cargl(z: TComplexLongDouble): TLongDouble; cdecl; external libm;
function conjl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function cprojl(z: TComplexLongDouble): TComplexLongDouble; cdecl; external libm;
function cimagl(z: TComplexLongDouble): TLongDouble; cdecl; external libm;
function creall(z: TComplexLongDouble): TLongDouble; cdecl; external libm;

function CMPLX(re, im: double): TComplexDouble;


// === Konventiert am: 7-8-25 15:18:21 ===


implementation

function CMPLX(re, im: double): TComplexDouble;
begin
  Result.Re := re;
  Result.Im := im;
end;



// --- TComplexDouble ---

operator +(const c0, c1: TComplexDouble): TComplexDouble; inline;
begin
  Result.Re := c0.Re + c1.Re;
  Result.Im := c0.Im + c1.Im;
end;

operator -(const c0, c1: TComplexDouble): TComplexDouble; inline;
begin
  Result.Re := c0.Re - c1.Re;
  Result.Im := c0.Im - c1.Im;
end;

operator *(const c0, c1: TComplexDouble): TComplexDouble; inline;
begin
  Result.Re := c0.Re * c1.Re - c0.Im * c1.Im;
  Result.Im := c0.Re * c1.Im + c0.Im * c1.Re;
end;

operator /(const c0, c1: TComplexDouble): TComplexDouble; inline;
var
  denom: double;
begin
  denom := c1.Re * c1.Re + c1.Im * c1.Im;
  Result.Re := (c0.Re * c1.Re + c0.Im * c1.Im) / denom;
  Result.Im := (c0.Im * c1.Re - c0.Re * c1.Im) / denom;
end;

// --- TComplexSingle ---

operator +(const c0, c1: TComplexSingle): TComplexSingle; inline;
begin
  Result.Re := c0.Re + c1.Re;
  Result.Im := c0.Im + c1.Im;
end;

operator -(const c0, c1: TComplexSingle): TComplexSingle; inline;
begin
  Result.Re := c0.Re - c1.Re;
  Result.Im := c0.Im - c1.Im;
end;

operator *(const c0, c1: TComplexSingle): TComplexSingle; inline;
begin
  Result.Re := c0.Re * c1.Re - c0.Im * c1.Im;
  Result.Im := c0.Re * c1.Im + c0.Im * c1.Re;
end;

operator /(const c0, c1: TComplexSingle): TComplexSingle; inline;
var
  denom: single;
begin
  denom := c1.Re * c1.Re + c1.Im * c1.Im;
  Result.Re := (c0.Re * c1.Re + c0.Im * c1.Im) / denom;
  Result.Im := (c0.Im * c1.Re - c0.Re * c1.Im) / denom;
end;

// --- TComplexLongDouble ---

operator +(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
begin
  Result.Re := c0.Re + c1.Re;
  Result.Im := c0.Im + c1.Im;
end;

operator -(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
begin
  Result.Re := c0.Re - c1.Re;
  Result.Im := c0.Im - c1.Im;
end;

operator *(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
begin
  Result.Re := c0.Re * c1.Re - c0.Im * c1.Im;
  Result.Im := c0.Re * c1.Im + c0.Im * c1.Re;
end;

operator /(const c0, c1: TComplexLongDouble): TComplexLongDouble; inline;
var
  denom: TLongDouble;
begin
  denom := c1.Re * c1.Re + c1.Im * c1.Im;
  Result.Re := (c0.Re * c1.Re + c0.Im * c1.Im) / denom;
  Result.Im := (c0.Im * c1.Re - c0.Re * c1.Im) / denom;
end;

end.
