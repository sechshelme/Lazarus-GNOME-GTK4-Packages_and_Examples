unit odemath;

interface

uses
  fp_ode, common, odeconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  { Indizes für Vektoren }
  dV3E_X = 0;
  dV3E_Y = 1;
  dV3E_Z = 2;
  { Indizes für Matrizen (4x3 Layout in ODE) }
  dM3E_XX = 0;
  dM3E_XY = 1;
  dM3E_XZ = 2;
  dM3E_YX = 4;
  dM3E_YY = 5;
  dM3E_YZ = 6;
  dM3E_ZX = 8;
  dM3E_ZY = 9;
  dM3E_ZZ = 10;
  { Indizes für Matrix4 (4x4) }
  dM4E_XX = 0;
  dM4E_XY = 1;
  dM4E_XZ = 2;
  dM4E_XO = 3;
  dM4E_YX = 4;
  dM4E_YY = 5;
  dM4E_YZ = 6;
  dM4E_YO = 7;
  dM4E_ZX = 8;
  dM4E_ZY = 9;
  dM4E_ZZ = 10;
  dM4E_ZO = 11;
  dM4E_OX = 12;
  dM4E_OY = 13;
  dM4E_OZ = 14;
  dM4E_OO = 15;

type
  dReal = TdReal;

function dSafeNormalize4(a: TdVector4): longint; cdecl; external libodes;
procedure dNormalize3(a: TdVector3); cdecl; external libodes;
procedure dNormalize4(a: TdVector4); cdecl; external libodes;
procedure dPlaneSpace(n: TdVector3; p: TdVector3; q: TdVector3); cdecl; external libodes;
function dOrthogonalizeR(m: TdMatrix3): longint; cdecl; external libodes;

function dSqrt(x: TdReal): TdReal; inline;
function dRecip(x: TdReal): TdReal; inline;

procedure dZeroVector3(var res: TdVector3); inline;
procedure dAssignVector3(var res: TdVector3; x, y, z: TdReal); inline;
procedure dZeroMatrix3(var res: TdMatrix3); inline;
procedure dZeroMatrix4(var res: TdMatrix4); inline;
procedure dAddVectors3(res, a, b: PdReal); inline;
procedure dSubtractVectors3(res, a, b: PdReal); inline;
procedure dAddVectorScaledVector3(res, a, b: PdReal; b_scale: TdReal); inline;
procedure dAddScaledVectors3(res, a, b: PdReal; a_scale, b_scale: TdReal); inline;
procedure dAddThreeScaledVectors3(res, a, b, c: PdReal; a_scale, b_scale, c_scale: TdReal); inline;
procedure dScaleVector3(res: PdReal; nScale: TdReal); inline;
procedure dNegateVector3(res: PdReal); inline;
procedure dCopyVector3(res, a: PdReal); inline;
procedure dCopyScaledVector3(res, a: PdReal; nScale: TdReal); inline;
procedure dCopyNegatedVector3(res, a: PdReal); inline;
procedure dCopyVector4(res, a: PdReal); inline;
procedure dCopyMatrix4x4(res, a: PdReal); inline;
procedure dCopyMatrix4x3(res, a: PdReal); inline;
procedure dGetMatrixColumn3(res, a: PdReal; n: cardinal); inline;
function dCalcVectorLength3( a: PdReal): TdReal; inline;
function dCalcVectorLengthSquare3( a: PdReal): TdReal; inline;
function dCalcPointDepth3( test_p, plane_p, plane_n: PdReal): TdReal; inline;
function _dCalcVectorDot3( a, b: PdReal; step_a, step_b: cardinal): TdReal; inline;
function dCalcVectorDot3( a, b: PdReal): TdReal; inline;
function dCalcVectorDot3_13(a, b: PdReal): dReal; inline;
function dCalcVectorDot3_31(a, b: PdReal): dReal; inline;
function dCalcVectorDot3_33(a, b: PdReal): dReal; inline;
function dCalcVectorDot3_14(a, b: PdReal): dReal; inline;
function dCalcVectorDot3_41(a, b: PdReal): dReal; inline;
function dCalcVectorDot3_44(a, b: PdReal): dReal; inline;
procedure _dCalcVectorCross3(res, a, b: PdReal; step_res, step_a, step_b: cardinal); inline;
procedure dCalcVectorCross3(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_114(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_141(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_144(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_411(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_414(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_441(res, a, b: PdReal); inline;
procedure dCalcVectorCross3_444(res, a, b: PdReal); inline;
procedure dAddVectorCross3(res, a, b: PdReal); inline;
procedure dSubtractVectorCross3(res, a, b: PdReal); inline;
procedure dSetCrossMatrixPlus(res, a: PdReal; skip: cardinal); inline;
procedure dSetCrossMatrixMinus(res, a: PdReal; skip: cardinal); inline;
function dCalcPointsDistance3(const a, b: PdReal): TdReal; inline;
procedure dMultiply0_331(res, a, b: PdReal); inline;
procedure dMultiply1_331(res, a, b: PdReal); inline;
procedure dMultiply0_133(res, a, b: PdReal); inline;
procedure dMultiplyHelper0_331(res, a, b: PdReal); inline;
procedure dMultiplyHelper1_331(res, a, b: PdReal); inline;
procedure dMultiplyHelper0_133(res, a, b: PdReal); inline;
procedure dMultiplyHelper1_133(res, a, b: PdReal); inline;
procedure dMultiply0_333(res, a, b: PdReal); inline;
procedure dMultiply1_333(res, a, b: PdReal); inline;
procedure dMultiply2_333(res, a, b: PdReal); inline;
procedure dMultiplyAdd0_331(res, a, b: PdReal); inline;
procedure dMultiplyAdd1_331(res, a, b: PdReal); inline;
procedure dMultiplyAdd0_133(res, a, b: PdReal); inline;
procedure dMultiplyAdd0_333(res, a, b: PdReal); inline;
procedure dMultiplyAdd1_333(res, a, b: PdReal); inline;
procedure dMultiplyAdd2_333(res, a, b: PdReal); inline;
function dCalcMatrix3Det(const mat: PdReal): TdReal; inline;
function dInvertMatrix3(dst, ma: PdReal): TdReal; inline;

implementation

function dSqrt(x: TdReal): TdReal; inline;
begin
  Result := Sqrt(x);
end;

function dRecip(x: TdReal): TdReal; inline;
begin
  Result := 1.0 / x;
end;

procedure dZeroVector3(var res: TdVector3);
begin
  res[dV3E_X] := 0.0;
  res[dV3E_Y] := 0.0;
  res[dV3E_Z] := 0.0;
end;

procedure dAssignVector3(var res: TdVector3; x, y, z: TdReal);
begin
  res[dV3E_X] := x;
  res[dV3E_Y] := y;
  res[dV3E_Z] := z;
end;

procedure dZeroMatrix3(var res: TdMatrix3);
begin
  FillChar(res, SizeOf(TdMatrix3), 0);
end;

procedure dZeroMatrix4(var res: TdMatrix4);
begin
  FillChar(res, SizeOf(TdMatrix4), 0);
end;

procedure dAddVectors3(res, a, b: PdReal); inline;
var
  r0, r1, r2: TdReal;
begin
  r0 := a[0] + b[0];
  r1 := a[1] + b[1];
  r2 := a[2] + b[2];
  res[0] := r0;
  res[1] := r1;
  res[2] := r2;
end;

procedure dSubtractVectors3(res, a, b: PdReal); inline;
var
  r0, r1, r2: TdReal;
begin
  r0 := a[0] - b[0];
  r1 := a[1] - b[1];
  r2 := a[2] - b[2];
  res[0] := r0;
  res[1] := r1;
  res[2] := r2;
end;

procedure dAddVectorScaledVector3(res, a, b: PdReal; b_scale: TdReal); inline;
begin
  res[0] := a[0] + b_scale * b[0];
  res[1] := a[1] + b_scale * b[1];
  res[2] := a[2] + b_scale * b[2];
end;

procedure dAddScaledVectors3(res, a, b: PdReal; a_scale, b_scale: TdReal); inline;
begin
  res[0] := a_scale * a[0] + b_scale * b[0];
  res[1] := a_scale * a[1] + b_scale * b[1];
  res[2] := a_scale * a[2] + b_scale * b[2];
end;

procedure dAddThreeScaledVectors3(res, a, b, c: PdReal; a_scale, b_scale, c_scale: TdReal); inline;
begin
  res[0] := a_scale * a[0] + b_scale * b[0] + c_scale * c[0];
  res[1] := a_scale * a[1] + b_scale * b[1] + c_scale * c[1];
  res[2] := a_scale * a[2] + b_scale * b[2] + c_scale * c[2];
end;

procedure dScaleVector3(res: PdReal; nScale: TdReal); inline;
begin
  res[0] := res[0] * nScale;
  res[1] := res[1] * nScale;
  res[2] := res[2] * nScale;
end;

procedure dNegateVector3(res: PdReal); inline;
begin
  res[0] := -res[0];
  res[1] := -res[1];
  res[2] := -res[2];
end;

procedure dCopyVector3(res, a: PdReal); inline;
begin
  res[0] := a[0];
  res[1] := a[1];
  res[2] := a[2];
end;

procedure dCopyScaledVector3(res, a: PdReal; nScale: TdReal); inline;
begin
  res[0] := a[0] * nScale;
  res[1] := a[1] * nScale;
  res[2] := a[2] * nScale;
end;

procedure dCopyNegatedVector3(res, a: PdReal); inline;
begin
  res[0] := -a[0];
  res[1] := -a[1];
  res[2] := -a[2];
end;

procedure dCopyVector4(res, a: PdReal); inline;
begin
  res[0] := a[0];
  res[1] := a[1];
  res[2] := a[2];
  res[3] := a[3];
end;

procedure dCopyMatrix4x4(res, a: PdReal); inline;
begin
  dCopyVector4(@res[0], @a[0]);
  dCopyVector4(@res[4], @a[4]);
  dCopyVector4(@res[8], @a[8]);
end;

procedure dCopyMatrix4x3(res, a: PdReal); inline;
begin
  dCopyVector3(@res[0], @a[0]);
  dCopyVector3(@res[4], @a[4]);
  dCopyVector3(@res[8], @a[8]);
end;

procedure dGetMatrixColumn3(res, a: PdReal; n: cardinal); inline;
begin
  res[0] := a[n + 0];
  res[1] := a[n + 4];
  res[2] := a[n + 8];
end;

function dCalcVectorLength3(a: PdReal): TdReal;
begin
  Result := dSqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
end;

function dCalcVectorLengthSquare3(a: PdReal): TdReal;
begin
  Result := a[0] * a[0] + a[1] * a[1] + a[2] * a[2];
end;

function dCalcPointDepth3(test_p, plane_p, plane_n: PdReal): TdReal;
begin
  Result := (plane_p[0] - test_p[0]) * plane_n[0] +
    (plane_p[1] - test_p[1]) * plane_n[1] +
    (plane_p[2] - test_p[2]) * plane_n[2];
end;

function _dCalcVectorDot3(a, b: PdReal; step_a, step_b: cardinal): TdReal;
begin
  Result := a[0] * b[0] + a[step_a] * b[step_b] + a[2 * step_a] * b[2 * step_b];
end;

function dCalcVectorDot3(a, b: PdReal): TdReal;
begin
  Result := _dCalcVectorDot3(a, b, 1, 1);
end;

function dCalcVectorDot3_13(a, b: PdReal): dReal;
begin
  Result := _dCalcVectorDot3(a, b, 1, 3);
end;

function dCalcVectorDot3_31(a, b: PdReal): dReal;
begin
  Result := _dCalcVectorDot3(a, b, 3, 1);
end;

function dCalcVectorDot3_33(a, b: PdReal): dReal;
begin
  Result := _dCalcVectorDot3(a, b, 3, 3);
end;

function dCalcVectorDot3_14(a, b: PdReal): dReal;
begin
  Result := _dCalcVectorDot3(a, b, 1, 4);
end;

function dCalcVectorDot3_41(a, b: PdReal): dReal;
begin
  Result := _dCalcVectorDot3(a, b, 4, 1);
end;

function dCalcVectorDot3_44(a, b: PdReal): dReal;
begin
  Result := _dCalcVectorDot3(a, b, 4, 4);
end;

procedure _dCalcVectorCross3(res, a, b: PdReal; step_res, step_a, step_b: cardinal); inline;
var
  r0, r1, r2: TdReal;
begin
  r0 := a[step_a] * b[2 * step_b] - a[2 * step_a] * b[step_b];
  r1 := a[2 * step_a] * b[0] - a[0] * b[2 * step_b];
  r2 := a[0] * b[step_b] - a[step_a] * b[0];
  res[0] := r0;
  res[step_res] := r1;
  res[2 * step_res] := r2;
end;

procedure dCalcVectorCross3(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 1, 1, 1);
end;

procedure dCalcVectorCross3_114(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 1, 1, 4);
end;

procedure dCalcVectorCross3_141(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 1, 4, 1);
end;

procedure dCalcVectorCross3_144(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 1, 4, 4);
end;

procedure dCalcVectorCross3_411(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 4, 1, 1);
end;

procedure dCalcVectorCross3_414(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 4, 1, 4);
end;

procedure dCalcVectorCross3_441(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 4, 4, 1);
end;

procedure dCalcVectorCross3_444(res, a, b: PdReal); inline;
begin
  _dCalcVectorCross3(res, a, b, 4, 4, 4);
end;

procedure dAddVectorCross3(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of TdReal;
begin
  dCalcVectorCross3(@tmp[0], a, b);
  dAddVectors3(res, res, @tmp[0]);
end;

procedure dSubtractVectorCross3(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of TdReal;
begin
  dCalcVectorCross3(@tmp[0], a, b);
  dSubtractVectors3(res, res, @tmp[0]);
end;

procedure dSetCrossMatrixPlus(res, a: PdReal; skip: cardinal); inline;
begin
  res[1] := -a[2];
  res[2] := a[1];
  res[skip + 0] := a[2];
  res[skip + 2] := -a[0];
  res[2 * skip + 0] := -a[1];
  res[2 * skip + 1] := a[0];
end;

procedure dSetCrossMatrixMinus(res, a: PdReal; skip: cardinal); inline;
begin
  res[1] := a[2];
  res[2] := -a[1];
  res[skip + 0] := -a[2];
  res[skip + 2] := a[0];
  res[2 * skip + 0] := a[1];
  res[2 * skip + 1] := -a[0];
end;

function dCalcPointsDistance3(const a, b: PdReal): TdReal; inline;
var
  tmp: array[0..2] of TdReal;
begin
  dSubtractVectors3(@tmp[0], a, b);
  Result := dCalcVectorLength3(@tmp[0]);
end;


procedure dMultiplyHelper0_331(res, a, b: PdReal); inline;
var
  r0, r1, r2: dReal;
begin
  r0 := dCalcVectorDot3(a, b);
  r1 := dCalcVectorDot3(@a[4], b);
  r2 := dCalcVectorDot3(@a[8], b);
  res[0] := r0;
  res[1] := r1;
  res[2] := r2;
end;

procedure dMultiplyHelper1_331(res, a, b: PdReal); inline;
var
  r0, r1, r2: dReal;
begin
  r0 := dCalcVectorDot3_41(a, b);
  r1 := dCalcVectorDot3_41(@a[1], b);
  r2 := dCalcVectorDot3_41(@a[2], b);
  res[0] := r0;
  res[1] := r1;
  res[2] := r2;
end;

procedure dMultiplyHelper0_133(res, a, b: PdReal); inline;
begin
  dMultiplyHelper1_331(res, b, a);
end;

procedure dMultiplyHelper1_133(res, a, b: PdReal); inline;
var
  r0, r1, r2: dReal;
begin
  r0 := dCalcVectorDot3_44(a, b);
  r1 := dCalcVectorDot3_44(@a[1], b);
  r2 := dCalcVectorDot3_44(@a[2], b);
  res[0] := r0;
  res[1] := r1;
  res[2] := r2;
end;

procedure dMultiply0_331(res, a, b: PdReal); inline;
begin
  dMultiplyHelper0_331(res, a, b);
end;

procedure dMultiply1_331(res, a, b: PdReal); inline;
begin
  dMultiplyHelper1_331(res, a, b);
end;

procedure dMultiply0_133(res, a, b: PdReal); inline;
begin
  dMultiplyHelper0_133(res, a, b);
end;

procedure dMultiply0_333(res, a, b: PdReal); inline;
begin
  dMultiplyHelper0_133(@res[0], @a[0], b);
  dMultiplyHelper0_133(@res[4], @a[4], b);
  dMultiplyHelper0_133(@res[8], @a[8], b);
end;

procedure dMultiply1_333(res, a, b: PdReal); inline;
begin
  dMultiplyHelper1_133(@res[0], b, @a[0]);
  dMultiplyHelper1_133(@res[4], b, @a[1]);
  dMultiplyHelper1_133(@res[8], b, @a[2]);
end;

procedure dMultiply2_333(res, a, b: PdReal); inline;
begin
  dMultiplyHelper0_331(@res[0], b, @a[0]);
  dMultiplyHelper0_331(@res[4], b, @a[4]);
  dMultiplyHelper0_331(@res[8], b, @a[8]);
end;

procedure dMultiplyAdd0_331(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of dReal;
begin
  dMultiplyHelper0_331(@tmp[0], a, b);
  dAddVectors3(res, res, @tmp[0]);
end;

procedure dMultiplyAdd1_331(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of dReal;
begin
  dMultiplyHelper1_331(@tmp[0], a, b);
  dAddVectors3(res, res, @tmp[0]);
end;

procedure dMultiplyAdd0_133(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of dReal;
begin
  dMultiplyHelper0_133(@tmp[0], a, b);
  dAddVectors3(res, res, @tmp[0]);
end;

procedure dMultiplyAdd0_333(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of dReal;
begin
  dMultiplyHelper0_133(@tmp[0], @a[0], b);
  dAddVectors3(@res[0], @res[0], @tmp[0]);
  dMultiplyHelper0_133(@tmp[0], @a[4], b);
  dAddVectors3(@res[4], @res[4], @tmp[0]);
  dMultiplyHelper0_133(@tmp[0], @a[8], b);
  dAddVectors3(@res[8], @res[8], @tmp[0]);
end;

procedure dMultiplyAdd1_333(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of dReal;
begin
  dMultiplyHelper1_133(@tmp[0], b, @a[0]);
  dAddVectors3(@res[0], @res[0], @tmp[0]);
  dMultiplyHelper1_133(@tmp[0], b, @a[1]);
  dAddVectors3(@res[4], @res[4], @tmp[0]);
  dMultiplyHelper1_133(@tmp[0], b, @a[2]);
  dAddVectors3(@res[8], @res[8], @tmp[0]);
end;

procedure dMultiplyAdd2_333(res, a, b: PdReal); inline;
var
  tmp: array[0..2] of dReal;
begin
  dMultiplyHelper0_331(@tmp[0], b, @a[0]);
  dAddVectors3(@res[0], @res[0], @tmp[0]);
  dMultiplyHelper0_331(@tmp[0], b, @a[4]);
  dAddVectors3(@res[4], @res[4], @tmp[0]);
  dMultiplyHelper0_331(@tmp[0], b, @a[8]);
  dAddVectors3(@res[8], @res[8], @tmp[0]);
end;

function dCalcMatrix3Det(const mat: PdReal): TdReal; inline;
begin
  Result := mat[0] * (mat[5] * mat[10] - mat[9] * mat[6])
    - mat[1] * (mat[4] * mat[10] - mat[8] * mat[6])
    + mat[2] * (mat[4] * mat[9] - mat[8] * mat[5]);
end;

function dInvertMatrix3(dst, ma: PdReal): TdReal; inline;
var
  det, detRecip: TdReal;
begin
  det := dCalcMatrix3Det(ma);
  if det = 0 then begin
    Exit(0);
  end;
  detRecip := dRecip(det);
  dst[0] := (ma[5] * ma[10] - ma[6] * ma[9]) * detRecip;
  dst[1] := (ma[9] * ma[2] - ma[1] * ma[10]) * detRecip;
  dst[2] := (ma[1] * ma[6] - ma[5] * ma[2]) * detRecip;
  dst[4] := (ma[6] * ma[8] - ma[4] * ma[10]) * detRecip;
  dst[5] := (ma[0] * ma[10] - ma[8] * ma[2]) * detRecip;
  dst[6] := (ma[4] * ma[2] - ma[0] * ma[6]) * detRecip;
  dst[8] := (ma[4] * ma[9] - ma[8] * ma[5]) * detRecip;
  dst[9] := (ma[8] * ma[1] - ma[0] * ma[9]) * detRecip;
  dst[10] := (ma[0] * ma[5] - ma[1] * ma[4]) * detRecip;
  Result := det;
end;

end.
implementation
end.
