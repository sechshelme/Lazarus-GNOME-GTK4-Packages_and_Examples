unit gsl_complex;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgsl_complex_packed = ^Tgsl_complex_packed;
  Tgsl_complex_packed = Pdouble;

  Pgsl_complex_packed_float = ^Tgsl_complex_packed_float;
  Tgsl_complex_packed_float = Psingle;

  Pgsl_complex_packed_long_double = ^Tgsl_complex_packed_long_double;
  Tgsl_complex_packed_long_double = Plong_double;

  Pgsl_const_complex_packed = ^Tgsl_const_complex_packed;
  Tgsl_const_complex_packed = Pdouble;

  Pgsl_const_complex_packed_float = ^Tgsl_const_complex_packed_float;
  Tgsl_const_complex_packed_float = Psingle;

  Pgsl_const_complex_packed_long_double = ^Tgsl_const_complex_packed_long_double;
  Tgsl_const_complex_packed_long_double = Plong_double;

  Pgsl_complex_packed_array = ^Tgsl_complex_packed_array;
  Tgsl_complex_packed_array = Pdouble;

  Pgsl_complex_packed_array_float = ^Tgsl_complex_packed_array_float;
  Tgsl_complex_packed_array_float = Psingle;

  Pgsl_complex_packed_array_long_double = ^Tgsl_complex_packed_array_long_double;
  Tgsl_complex_packed_array_long_double = Plong_double;

  Pgsl_const_complex_packed_array = ^Tgsl_const_complex_packed_array;
  Tgsl_const_complex_packed_array = Pdouble;

  Pgsl_const_complex_packed_array_float = ^Tgsl_const_complex_packed_array_float;
  Tgsl_const_complex_packed_array_float = Psingle;

  Pgsl_const_complex_packed_array_long_double = ^Tgsl_const_complex_packed_array_long_double;
  Tgsl_const_complex_packed_array_long_double = Plong_double;

  Pgsl_complex_packed_ptr = ^Tgsl_complex_packed_ptr;
  Tgsl_complex_packed_ptr = Pdouble;

  Pgsl_complex_packed_float_ptr = ^Tgsl_complex_packed_float_ptr;
  Tgsl_complex_packed_float_ptr = Psingle;

  Pgsl_complex_packed_long_double_ptr = ^Tgsl_complex_packed_long_double_ptr;
  Tgsl_complex_packed_long_double_ptr = Plong_double;

  Pgsl_const_complex_packed_ptr = ^Tgsl_const_complex_packed_ptr;
  Tgsl_const_complex_packed_ptr = Pdouble;

  Pgsl_const_complex_packed_float_ptr = ^Tgsl_const_complex_packed_float_ptr;
  Tgsl_const_complex_packed_float_ptr = Psingle;

  Pgsl_const_complex_packed_long_double_ptr = ^Tgsl_const_complex_packed_long_double_ptr;
  Tgsl_const_complex_packed_long_double_ptr = Plong_double;


type
  Tgsl_complex = record
    dat: array [0..1] of double;
  end;
  Pgsl_complex = ^Tgsl_complex;

  Tgsl_complex_float = record
    dat: array [0..1] of single;
  end;
  Pgsl_complex_float = ^Tgsl_complex_float;

  Tgsl_complex_long_double = record
    dat: array [0..1] of Tlong_double;
  end;
  Pgsl_complex_long_double = ^Tgsl_complex_long_double;


{ ====== Double-Version ====== }
function GSL_REAL(const z: Tgsl_complex): double; inline;
function GSL_IMAG(const z: Tgsl_complex): double; inline;
function GSL_COMPLEX_P(zp: Pgsl_complex): PDouble; inline;
function GSL_COMPLEX_P_REAL(zp: Pgsl_complex): double; inline;
function GSL_COMPLEX_P_IMAG(zp: Pgsl_complex): double; inline;
function GSL_COMPLEX_EQ(const z1, z2: Tgsl_complex): boolean; inline;

procedure GSL_SET_COMPLEX(z: Pgsl_complex; x, y: double); inline;
procedure GSL_SET_REAL(z: Pgsl_complex; x: double); inline;
procedure GSL_SET_IMAG(z: Pgsl_complex; y: double); inline;
procedure GSL_SET_COMPLEX_PACKED(zp: PDouble; n: SizeInt; x, y: double); inline;

{ ====== Single-Version ====== }
function GSL_REAL(const z: Tgsl_complex_float): single; inline;
function GSL_IMAG(const z: Tgsl_complex_float): single; inline;
function GSL_COMPLEX_P(zp: Pgsl_complex_float): PSingle; inline;
function GSL_COMPLEX_P_REAL(zp: Pgsl_complex_float): single; inline;
function GSL_COMPLEX_P_IMAG(zp: Pgsl_complex_float): single; inline;
function GSL_COMPLEX_EQ(const z1, z2: Tgsl_complex_float): boolean; inline;

procedure GSL_SET_COMPLEX(z: Pgsl_complex_float; x, y: single); inline;
procedure GSL_SET_REAL(z: Pgsl_complex_float; x: single); inline;
procedure GSL_SET_IMAG(z: Pgsl_complex_float; y: single); inline;
procedure GSL_SET_COMPLEX_PACKED(zp: PSingle; n: SizeInt; x, y: single); inline;

{ ====== LongDouble-Version ====== }
function GSL_REAL(const z: Tgsl_complex_long_double): Tlong_double; inline;
function GSL_IMAG(const z: Tgsl_complex_long_double): Tlong_double; inline;
function GSL_COMPLEX_P(zp: Pgsl_complex_long_double): Plong_double; inline;
function GSL_COMPLEX_P_REAL(zp: Pgsl_complex_long_double): Tlong_double; inline;
function GSL_COMPLEX_P_IMAG(zp: Pgsl_complex_long_double): Tlong_double; inline;
function GSL_COMPLEX_EQ(const z1, z2: Tgsl_complex_long_double): boolean; inline;

procedure GSL_SET_COMPLEX(z: Pgsl_complex_long_double; x, y: Tlong_double); inline;
procedure GSL_SET_REAL(z: Pgsl_complex_long_double; x: Tlong_double); inline;
procedure GSL_SET_IMAG(z: Pgsl_complex_long_double; y: Tlong_double); inline;
procedure GSL_SET_COMPLEX_PACKED(zp: Plong_double; n: SizeInt; x, y: Tlong_double); inline;


implementation

{ ====== Double-Version ====== }
function GSL_REAL(const z: Tgsl_complex): double; inline;
begin
  Result := z.dat[0];
end;

function GSL_IMAG(const z: Tgsl_complex): double; inline;
begin
  Result := z.dat[1];
end;

function GSL_COMPLEX_P(zp: Pgsl_complex): PDouble; inline;
begin
  Result := zp^.dat;
end;

function GSL_COMPLEX_P_REAL(zp: Pgsl_complex): double; inline;
begin
  Result := zp^.dat[0];
end;

function GSL_COMPLEX_P_IMAG(zp: Pgsl_complex): double; inline;
begin
  Result := zp^.dat[1];
end;

function GSL_COMPLEX_EQ(const z1, z2: Tgsl_complex): boolean; inline;
begin
  Result := (z1.dat[0] = z2.dat[0]) and (z1.dat[1] = z2.dat[1]);
end;

procedure GSL_SET_COMPLEX(z: Pgsl_complex; x, y: double); inline;
begin
  z^.dat[0] := x;
  z^.dat[1] := y;
end;

procedure GSL_SET_REAL(z: Pgsl_complex; x: double); inline;
begin
  z^.dat[0] := x;
end;

procedure GSL_SET_IMAG(z: Pgsl_complex; y: double); inline;
begin
  z^.dat[1] := y;
end;

procedure GSL_SET_COMPLEX_PACKED(zp: PDouble; n: SizeInt; x, y: double); inline;
begin
  (zp + 2 * n)^ := x;
  (zp + 2 * n + 1)^ := y;
end;


{ ====== Single-Version ====== }
function GSL_REAL(const z: Tgsl_complex_float): single; inline;
begin
  Result := z.dat[0];
end;

function GSL_IMAG(const z: Tgsl_complex_float): single; inline;
begin
  Result := z.dat[1];
end;

function GSL_COMPLEX_P(zp: Pgsl_complex_float): PSingle; inline;
begin
  Result := zp^.dat;
end;

function GSL_COMPLEX_P_REAL(zp: Pgsl_complex_float): single; inline;
begin
  Result := zp^.dat[0];
end;

function GSL_COMPLEX_P_IMAG(zp: Pgsl_complex_float): single; inline;
begin
  Result := zp^.dat[1];
end;

function GSL_COMPLEX_EQ(const z1, z2: Tgsl_complex_float): boolean; inline;
begin
  Result := (z1.dat[0] = z2.dat[0]) and (z1.dat[1] = z2.dat[1]);
end;

procedure GSL_SET_COMPLEX(z: Pgsl_complex_float; x, y: single); inline;
begin
  z^.dat[0] := x;
  z^.dat[1] := y;
end;

procedure GSL_SET_REAL(z: Pgsl_complex_float; x: single); inline;
begin
  z^.dat[0] := x;
end;

procedure GSL_SET_IMAG(z: Pgsl_complex_float; y: single); inline;
begin
  z^.dat[1] := y;
end;

procedure GSL_SET_COMPLEX_PACKED(zp: PSingle; n: SizeInt; x, y: single); inline;
begin
  (zp + 2 * n)^ := x;
  (zp + 2 * n + 1)^ := y;
end;

{ ====== LongDouble-Version ====== }
function GSL_REAL(const z: Tgsl_complex_long_double): Tlong_double; inline;
begin
  Result := z.dat[0];
end;

function GSL_IMAG(const z: Tgsl_complex_long_double): Tlong_double; inline;
begin
  Result := z.dat[1];
end;

function GSL_COMPLEX_P(zp: Pgsl_complex_long_double): Plong_double; inline;
begin
  Result := zp^.dat;
end;

function GSL_COMPLEX_P_REAL(zp: Pgsl_complex_long_double): Tlong_double; inline;
begin
  Result := zp^.dat[0];
end;

function GSL_COMPLEX_P_IMAG(zp: Pgsl_complex_long_double): Tlong_double; inline;
begin
  Result := zp^.dat[1];
end;

function GSL_COMPLEX_EQ(const z1, z2: Tgsl_complex_long_double): boolean; inline;
begin
  Result := (z1.dat[0] = z2.dat[0]) and (z1.dat[1] = z2.dat[1]);
end;

procedure GSL_SET_COMPLEX(z: Pgsl_complex_long_double; x, y: Tlong_double); inline;
begin
  z^.dat[0] := x;
  z^.dat[1] := y;
end;

procedure GSL_SET_REAL(z: Pgsl_complex_long_double; x: Tlong_double); inline;
begin
  z^.dat[0] := x;
end;

procedure GSL_SET_IMAG(z: Pgsl_complex_long_double; y: Tlong_double); inline;
begin
  z^.dat[1] := y;
end;

procedure GSL_SET_COMPLEX_PACKED(zp: Plong_double; n: SizeInt; x, y: Tlong_double); inline;
begin
  (zp + 2 * n)^ := x;
  (zp + 2 * n + 1)^ := y;
end;


end.
