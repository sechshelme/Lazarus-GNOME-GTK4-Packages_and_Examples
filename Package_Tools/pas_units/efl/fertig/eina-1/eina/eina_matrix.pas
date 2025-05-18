unit eina_matrix;

interface

uses
  ctypes, efl, eina_types, eina_fp, eina_rectangle, eina_quad;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Matrix_Type = ^TEina_Matrix_Type;
  TEina_Matrix_Type = longint;

const
  EINA_MATRIX_TYPE_IDENTITY = 0;
  EINA_MATRIX_TYPE_AFFINE = 1;
  EINA_MATRIX_TYPE_PROJECTIVE = 2;
  EINA_MATRIX_TYPE_LAST = 3;

type
  PEina_Matrix_Axis = ^TEina_Matrix_Axis;
  TEina_Matrix_Axis = longint;

const
  EINA_MATRIX_AXIS_X = 0;
  EINA_MATRIX_AXIS_Y = 1;
  EINA_MATRIX_AXIS_Z = 2;

type
  TEina_Matrix3 = record
    xx: double;
    xy: double;
    xz: double;
    yx: double;
    yy: double;
    yz: double;
    zx: double;
    zy: double;
    zz: double;
  end;
  PEina_Matrix3 = ^TEina_Matrix3;

  TEina_Matrix4 = record
    xx: double;
    xy: double;
    xz: double;
    xw: double;
    yx: double;
    yy: double;
    yz: double;
    yw: double;
    zx: double;
    zy: double;
    zz: double;
    zw: double;
    wx: double;
    wy: double;
    wz: double;
    ww: double;
  end;
  PEina_Matrix4 = ^TEina_Matrix4;

  PEina_Matrix3_F16p16 = ^TEina_Matrix3_F16p16;

  TEina_Matrix3_F16p16 = record
    xx: TEina_F16p16;
    xy: TEina_F16p16;
    xz: TEina_F16p16;
    yx: TEina_F16p16;
    yy: TEina_F16p16;
    yz: TEina_F16p16;
    zx: TEina_F16p16;
    zy: TEina_F16p16;
    zz: TEina_F16p16;
  end;


procedure eina_matrix3_f16p16_identity(m: PEina_Matrix3_F16p16); cdecl; external libeina;
procedure eina_matrix3_f16p16_compose(m1: PEina_Matrix3_F16p16; m2: PEina_Matrix3_F16p16; dst: PEina_Matrix3_F16p16); cdecl; external libeina;
function eina_matrix3_f16p16_type_get(m: PEina_Matrix3_F16p16): TEina_Matrix_Type; cdecl; external libeina;

const
  EINA_MATRIX3_FORMAT = 'g %g %g | %g %g %g | %g %g %g';

function eina_matrix3_type_get(m: PEina_Matrix3): TEina_Matrix_Type; cdecl; external libeina;
procedure eina_matrix3_values_set(m: PEina_Matrix3; xx: double; xy: double; xz: double; yx: double; yy: double; yz: double; zx: double; zy: double; zz: double); cdecl; external libeina;
procedure eina_matrix3_values_get(m: PEina_Matrix3; xx: Pdouble; xy: Pdouble; xz: Pdouble; yx: Pdouble; yy: Pdouble; yz: Pdouble; zx: Pdouble; zy: Pdouble; zz: Pdouble); cdecl; external libeina;
procedure eina_matrix3_fixed_values_get(m: PEina_Matrix3; xx: PEina_F16p16; xy: PEina_F16p16; xz: PEina_F16p16; yx: PEina_F16p16; yy: PEina_F16p16; yz: PEina_F16p16; zx: PEina_F16p16; zy: PEina_F16p16; zz: PEina_F16p16); cdecl; external libeina;
procedure eina_matrix3_matrix3_f16p16_to(m: PEina_Matrix3; fm: PEina_Matrix3_F16p16); cdecl; external libeina;
function eina_matrix3_equal(m1: PEina_Matrix3; m2: PEina_Matrix3): TEina_Bool; cdecl; external libeina;
procedure eina_matrix3_compose(m1: PEina_Matrix3; m2: PEina_Matrix3; dst: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_translate(m: PEina_Matrix3; tx: double; ty: double); cdecl; external libeina;
procedure eina_matrix3_scale(m: PEina_Matrix3; sx: double; sy: double); cdecl; external libeina;
procedure eina_matrix3_rotate(m: PEina_Matrix3; rad: double); cdecl; external libeina;
procedure eina_matrix3_identity(m: PEina_Matrix3); cdecl; external libeina;
function eina_matrix3_determinant(m: PEina_Matrix3): double; cdecl; external libeina;
procedure eina_matrix3_divide(m: PEina_Matrix3; scalar: double); cdecl; external libeina;
procedure eina_matrix3_inverse(m: PEina_Matrix3; m2: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_transpose(m: PEina_Matrix3; a: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_cofactor(m: PEina_Matrix3; a: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_adjoint(m: PEina_Matrix3; a: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_point_transform(m: PEina_Matrix3; x: double; y: double; xr: Pdouble; yr: Pdouble); cdecl; external libeina;
procedure eina_matrix3_rectangle_transform(m: PEina_Matrix3; r: PEina_Rectangle; q: PEina_Quad); cdecl; external libeina;
function eina_matrix3_quad_quad_map(m: PEina_Matrix3; src: PEina_Quad; dst: PEina_Quad): TEina_Bool; cdecl; external libeina;
function eina_matrix3_square_quad_map(m: PEina_Matrix3; q: PEina_Quad): TEina_Bool; cdecl; external libeina;
function eina_matrix3_quad_square_map(m: PEina_Matrix3; q: PEina_Quad): TEina_Bool; cdecl; external libeina;
procedure eina_matrix3_array_set(m: PEina_Matrix3; v: Pdouble); cdecl; external libeina;
procedure eina_matrix3_copy(dst: PEina_Matrix3; src: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_multiply(out_: PEina_Matrix3; mat_a: PEina_Matrix3; mat_b: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_multiply_copy(out_: PEina_Matrix3; mat_a: PEina_Matrix3; mat_b: PEina_Matrix3); cdecl; external libeina;
procedure eina_matrix3_scale_transform_set(out_: PEina_Matrix3; s_x: double; s_y: double); cdecl; external libeina;
procedure eina_matrix3_position_transform_set(out_: PEina_Matrix3; p_x: double; p_y: double); cdecl; external libeina;
procedure eina_normal3_matrix_get(out_: PEina_Matrix3; m: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix3_matrix4_to(m4: PEina_Matrix4; m3: PEina_Matrix3); cdecl; external libeina;
function eina_matrix4_type_get(m: PEina_Matrix4): TEina_Matrix_Type; cdecl; external libeina;
procedure eina_matrix4_values_set(m: PEina_Matrix4; xx: double; xy: double; xz: double; xw: double;
  yx: double; yy: double; yz: double; yw: double; zx: double;
  zy: double; zz: double; zw: double; wx: double; wy: double;
  wz: double; ww: double); cdecl; external libeina;
procedure eina_matrix4_values_get(m: PEina_Matrix4; xx: Pdouble; xy: Pdouble; xz: Pdouble; xw: Pdouble;
  yx: Pdouble; yy: Pdouble; yz: Pdouble; yw: Pdouble; zx: Pdouble;
  zy: Pdouble; zz: Pdouble; zw: Pdouble; wx: Pdouble; wy: Pdouble;
  wz: Pdouble; ww: Pdouble); cdecl; external libeina;
function eina_matrix4_determinant(m: PEina_Matrix4): double; cdecl; external libeina;
function eina_matrix4_normalized(out_: PEina_Matrix4; in_: PEina_Matrix4): TEina_Bool; cdecl; external libeina;
function eina_matrix4_inverse(out_: PEina_Matrix4; in_: PEina_Matrix4): TEina_Bool; cdecl; external libeina;
procedure eina_matrix4_transpose(out_: PEina_Matrix4; in_: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_matrix3_to(m3: PEina_Matrix3; m4: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_identity(out_: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_multiply_copy(out_: PEina_Matrix4; mat_a: PEina_Matrix4; mat_b: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_array_set(m: PEina_Matrix4; v: Pdouble); cdecl; external libeina;
procedure eina_matrix4_copy(dst: PEina_Matrix4; src: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_multiply(out_: PEina_Matrix4; mat_a: PEina_Matrix4; mat_b: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_ortho_set(m: PEina_Matrix4; left: double; right: double; bottom: double; top: double; dnear: double; dfar: double); cdecl; external libeina;
procedure eina_matrix4_compose(mat_a: PEina_Matrix4; mat_b: PEina_Matrix4; out_: PEina_Matrix4); cdecl; external libeina;
procedure eina_matrix4_translate(t: PEina_Matrix4; tx: double; ty: double; tz: double); cdecl; external libeina;
procedure eina_matrix4_scale(t: PEina_Matrix4; sx: double; sy: double; sz: double); cdecl; external libeina;
procedure eina_matrix4_rotate(t: PEina_Matrix4; rad: double; axis: TEina_Matrix_Axis); cdecl; external libeina;

type
  TEina_Matrix2 = record
    xx: double;
    xy: double;
    yx: double;
    yy: double;
  end;
  PEina_Matrix2 = ^TEina_Matrix2;


procedure eina_matrix2_values_set(m: PEina_Matrix2; xx: double; xy: double; yx: double; yy: double); cdecl; external libeina;
procedure eina_matrix2_values_get(m: PEina_Matrix2; xx: Pdouble; xy: Pdouble; yx: Pdouble; yy: Pdouble); cdecl; external libeina;
procedure eina_matrix2_inverse(out_: PEina_Matrix2; mat: PEina_Matrix2); cdecl; external libeina;
procedure eina_matrix2_identity(m: PEina_Matrix2); cdecl; external libeina;
procedure eina_matrix2_array_set(m: PEina_Matrix2; v: Pdouble); cdecl; external libeina;
procedure eina_matrix2_copy(dst: PEina_Matrix2; src: PEina_Matrix2); cdecl; external libeina;
procedure eina_matrix2_multiply(out_: PEina_Matrix2; mat_a: PEina_Matrix2; mat_b: PEina_Matrix2); cdecl; external libeina;
procedure eina_matrix2_multiply_copy(out_: PEina_Matrix2; mat_a: PEina_Matrix2; mat_b: PEina_Matrix2); cdecl; external libeina;
function eina_matrix2_type_get(m: PEina_Matrix2): TEina_Matrix_Type; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:12:55 ===


implementation



end.
