{$IFDEF read_interface}

type
  Pprivate_mp_word = ^Tprivate_mp_word;
  Tprivate_mp_word = dword;

const
  MP_SIZEOF_MP_DIGIT = 2;

const
  MP_DIGIT_BIT = 60;

const
  MP_MASK = ((Tmp_digit(1)) shl (Tmp_digit(MP_DIGIT_BIT))) - (Tmp_digit(1));

const
  MP_DIGIT_MAX = MP_MASK;
  MP_PRIME_BBS = $0001;
  MP_PRIME_SAFE = $0002;

type
  Pmp_sign = ^Tmp_sign;
  Tmp_sign = longint;

const
  MP_ZPOS = 0;
  MP_NEG = 1;

type
  Pmp_ord = ^Tmp_ord;
  Tmp_ord = longint;

const
  MP_LT = -(1);
  MP_EQ = 0;
  MP_GT = 1;

type
  Pmp_bool = ^Tmp_bool;
  Tmp_bool = longint;

const
  MP_NO = 0;
  MP_YES = 1;

type
  Pmp_err = ^Tmp_err;
  Tmp_err = longint;

const
  MP_OKAY = 0;
  MP_ERR = -(1);
  MP_MEM = -(2);
  MP_VAL = -(3);
  MP_ITER = -(4);
  MP_BUF = -(5);

type
  Pmp_order = ^Tmp_order;
  Tmp_order = longint;

const
  MP_LSB_FIRST = -(1);
  MP_MSB_FIRST = 1;

type
  Pmp_endian = ^Tmp_endian;
  Tmp_endian = longint;

const
  MP_LITTLE_ENDIAN = -(1);
  MP_NATIVE_ENDIAN = 0;
  MP_BIG_ENDIAN = 1;

const
  MP_PREC = 32;

const
  DIGIT_BIT = MP_DIGIT_BIT;

const
  PRIVATE_MP_PRIME_TAB_SIZE = 256;

type
  proc = procedure;

var
  ltm_rng: function(out_: pbyte; outlen: dword; callback: proc): dword; cvar;external libtcl8_6;
  ltm_rng_callback: procedure; cvar;external libtcl8_6;

var
  ltm_prime_tab: array[0..(PRIVATE_MP_PRIME_TAB_SIZE) - 1] of Tmp_digit; cvar;public;

function USED(m: Pmp_int): longint;
function DIGIT(m: Pmp_int; k: longint): longint;
function SIGN(m: Pmp_int): Tmp_sign;
function mp_iszero(a: Pmp_int): Tmp_bool;
function mp_isodd(a: Pmp_int): Tmp_bool;
function mp_iseven(a: Pmp_int): Tmp_bool;
function mp_isneg(a: Pmp_int): Tmp_bool;

// === Konventiert am: 15-4-25 13:26:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function USED(m: Pmp_int): longint;
begin
  USED := m^.used;
end;

function DIGIT(m: Pmp_int; k: longint): longint;
begin
  DIGIT := m^.dp[k];
end;

function SIGN(m: Pmp_int): Tmp_sign;
begin
  SIGN := m^.sign;
end;

function mp_iszero(a: Pmp_int): Tmp_bool;
begin
  if (a^.used) = 0 then begin
    Result := MP_YES;
  end else begin
    Result := MP_NO;
  end;
end;

function mp_isodd(a: Pmp_int): Tmp_bool;
begin
  if (a^.used <> 0) and (a^.dp[0] and 1 = 1) then begin
    Result := MP_YES;
  end else begin
    Result := MP_NO;
  end;
end;

function mp_iseven(a: Pmp_int): Tmp_bool;
begin
  if (a^.used = 0) or (a^.dp[0] and 1 = 0) then begin
    Result := MP_YES;
  end else begin
    Result := MP_NO;
  end;
end;

function mp_isneg(a: Pmp_int): Tmp_bool;
begin
  if (a^.sign) <> MP_ZPOS then begin
    Result := MP_YES;
  end else begin
    Result := MP_NO;
  end;
end;

{$ENDIF read_implementation}
