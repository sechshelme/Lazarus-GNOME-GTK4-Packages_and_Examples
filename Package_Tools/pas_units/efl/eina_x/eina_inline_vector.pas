unit eina_inline_vector;

interface

uses
  fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure eina_vector2_set(dst: PEina_Vector2; x, y: double);
procedure eina_vector2_array_set(dst: PEina_Vector2; v: PDouble);
procedure eina_vector2_copy(dst: PEina_Vector2; src: PEina_Vector2);
procedure eina_vector2_negate(OutVector: PEina_Vector2; v: PEina_Vector2);
procedure eina_vector2_add(OutVector: PEina_Vector2; a, b: PEina_Vector2);
procedure eina_vector2_subtract(OutVector: PEina_Vector2; a, b: PEina_Vector2);
procedure eina_vector2_scale(OutVector: PEina_Vector2; v: PEina_Vector2; scale: double);
function eina_vector2_dot_product(a, b: PEina_Vector2): double;
function eina_vector2_length_get(v: PEina_Vector2): double;
function eina_vector2_length_square_get(v: PEina_Vector2): double;
function eina_vector2_distance_get(a, b: PEina_Vector2): double;
function eina_vector2_distance_square_get(a, b: PEina_Vector2): double;
procedure eina_vector2_normalize(OutVector: PEina_Vector2; v: PEina_Vector2);
procedure eina_vector2_transform(OutVector: PEina_Vector2; m: PEina_Matrix2; v: PEina_Vector2);
procedure eina_vector2_homogeneous_position_transform(OutVector: PEina_Vector2; m: PEina_Matrix3; v: PEina_Vector2);
procedure eina_vector2_homogeneous_direction_transform(OutVector: PEina_Vector2; m: PEina_Matrix3; v: PEina_Vector2);

procedure eina_vector3_set(dst: PEina_Vector3; x, y, z: double);
procedure eina_vector3_array_set(dst: PEina_Vector3; v: PDouble);
procedure eina_vector3_copy(dst: PEina_Vector3; src: PEina_Vector3);
procedure eina_vector3_negate(out_: PEina_Vector3; v: PEina_Vector3);
procedure eina_vector3_add(out_: PEina_Vector3; a, b: PEina_Vector3);
procedure eina_vector3_subtract(out_: PEina_Vector3; a, b: PEina_Vector3);
procedure eina_vector3_scale(out_: PEina_Vector3; v: PEina_Vector3; scale: double);
procedure eina_vector3_multiply(out_: PEina_Vector3; a, b: PEina_Vector3);
function eina_vector3_dot_product(a, b: PEina_Vector3): double;
procedure eina_vector3_cross_product(OutVector: PEina_Vector3; a, b: PEina_Vector3);
function eina_vector3_length_get(v: PEina_Vector3): double;
function eina_vector3_length_square_get(v: PEina_Vector3): double;
function eina_vector3_distance_get(a, b: PEina_Vector3): double;
function eina_vector3_distance_square_get(a, b: PEina_Vector3): double;
function eina_vector3_angle_get(a, b: PEina_Vector3): double;
procedure eina_vector3_normalize(out_: PEina_Vector3; v: PEina_Vector3);
procedure eina_vector3_transform(out_: PEina_Vector3; m: PEina_Matrix3; v: PEina_Vector3);
procedure eina_vector3_homogeneous_direction_transform(out_: PEina_Vector3; m: PEina_Matrix4; v: PEina_Vector3);
procedure eina_vector3_homogeneous_position_transform(out_: PEina_Vector3; m: PEina_Matrix4; v: PEina_Vector3);
procedure eina_vector3_quaternion_rotate(out_: PEina_Vector3; v: PEina_Vector3; q: PEina_Quaternion);
procedure eina_vector3_orthogonal_projection_on_plane(out_: PEina_Vector3; v: PEina_Vector3; normal: PEina_Vector3);
procedure eina_vector3_plane_by_points(out_: PEina_Quaternion; a, b, c: PEina_Vector3);
procedure eina_vector3_homogeneous_position_set(out_: PEina_Vector3; v: PEina_Quaternion);
procedure eina_vector3_homogeneous_direction_set(out_: PEina_Vector3; v: PEina_Quaternion);
function eina_vector3_equivalent(a: PEina_Vector3; b: PEina_Vector3): TEina_Bool;
function eina_vector3_triangle_equivalent(v0, v1, v2, w0, w1, w2: PEina_Vector3): TEina_Bool;

implementation

procedure eina_vector2_set(dst: PEina_Vector2; x, y: double);
begin
  dst^.x := x;
  dst^.y := y;
end;

procedure eina_vector2_array_set(dst: PEina_Vector2; v: PDouble);
begin
  dst^.x := v[0];
  dst^.y := v[1];
end;

procedure eina_vector2_copy(dst: PEina_Vector2; src: PEina_Vector2);
begin
  dst^.x := src^.x;
  dst^.y := src^.y;
end;

procedure eina_vector2_negate(OutVector: PEina_Vector2; v: PEina_Vector2);
begin
  OutVector^.x := -v^.x;
  OutVector^.y := -v^.y;
end;

procedure eina_vector2_add(OutVector: PEina_Vector2; a, b: PEina_Vector2);
begin
  OutVector^.x := a^.x + b^.x;
  OutVector^.y := a^.y + b^.y;
end;

procedure eina_vector2_subtract(OutVector: PEina_Vector2; a, b: PEina_Vector2);
begin
  OutVector^.x := a^.x - b^.x;
  OutVector^.y := a^.y - b^.y;
end;

procedure eina_vector2_scale(OutVector: PEina_Vector2; v: PEina_Vector2; scale: double);
begin
  OutVector^.x := scale * v^.x;
  OutVector^.y := scale * v^.y;
end;

function eina_vector2_dot_product(a, b: PEina_Vector2): double;
begin
  Result := (a^.x * b^.x) + (a^.y * b^.y);
end;

function eina_vector2_length_get(v: PEina_Vector2): double;
begin
  Result := sqrt((v^.x * v^.x) + (v^.y * v^.y));
end;

function eina_vector2_length_square_get(v: PEina_Vector2): double;
begin
  Result := (v^.x * v^.x) + (v^.y * v^.y);
end;

function eina_vector2_distance_get(a, b: PEina_Vector2): double;
var
  v: TEina_Vector2;
begin
  eina_vector2_subtract(@v, a, b);
  Result := eina_vector2_length_get(@v);
end;

function eina_vector2_distance_square_get(a, b: PEina_Vector2): double;
var
  v: TEina_Vector2;
begin
  eina_vector2_subtract(@v, a, b);
  Result := eina_vector2_length_square_get(@v);
end;

procedure eina_vector2_normalize(OutVector: PEina_Vector2; v: PEina_Vector2);
begin
  eina_vector2_scale(OutVector, v, 1.0 / eina_vector2_length_get(v));
end;

procedure eina_vector2_transform(OutVector: PEina_Vector2; m: PEina_Matrix2;  v: PEina_Vector2);
var
  tmp: Teina_Vector2;
begin
  tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y);
  tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y);
  eina_vector2_copy(OutVector, @tmp);
end;

procedure eina_vector2_homogeneous_position_transform(OutVector: PEina_Vector2;  m: PEina_Matrix3;  v: PEina_Vector2);
var
  tmp: Teina_Vector2;
begin
  tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + m^.zx;
  tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + m^.zy;

  eina_vector2_scale(OutVector, @tmp, 1.0 / ((m^.xz * v^.x) + (m^.yz * v^.y) + m^.zz));
end;

procedure eina_vector2_homogeneous_direction_transform(OutVector: PEina_Vector2;  m: PEina_Matrix3;  v: PEina_Vector2);
var
  tmp: Teina_Vector2;
begin
  tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y);
  tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y);
  eina_vector2_copy(OutVector, @tmp);
end;



procedure eina_vector3_set(dst: PEina_Vector3; x, y, z: double);
begin
  dst^.x := x;
  dst^.y := y;
  dst^.z := z;
end;

procedure eina_vector3_array_set(dst: PEina_Vector3; v: PDouble);
begin
  dst^.x := v[0];
  dst^.y := v[1];
  dst^.z := v[2];
end;

procedure eina_vector3_copy(dst: PEina_Vector3; src: PEina_Vector3);
begin
  dst^.x := src^.x;
  dst^.y := src^.y;
  dst^.z := src^.z;
end;

procedure eina_vector3_negate(out_: PEina_Vector3; v: PEina_Vector3);
begin
  out_^.x := -v^.x;
  out_^.y := -v^.y;
  out_^.z := -v^.z;
end;

procedure eina_vector3_add(out_: PEina_Vector3; a, b: PEina_Vector3);
begin
  out_^.x := a^.x + b^.x;
  out_^.y := a^.y + b^.y;
  out_^.z := a^.z + b^.z;
end;

procedure eina_vector3_subtract(out_: PEina_Vector3; a, b: PEina_Vector3);
begin
  out_^.x := a^.x - b^.x;
  out_^.y := a^.y - b^.y;
  out_^.z := a^.z - b^.z;
end;

procedure eina_vector3_scale(out_: PEina_Vector3; v: PEina_Vector3; scale: double);
begin
  out_^.x := scale * v^.x;
  out_^.y := scale * v^.y;
  out_^.z := scale * v^.z;
end;

procedure eina_vector3_multiply(out_: PEina_Vector3; a, b: PEina_Vector3);
begin
  out_^.x := a^.x * b^.x;
  out_^.y := a^.y * b^.y;
  out_^.z := a^.z * b^.z;
end;

function eina_vector3_dot_product(a, b: PEina_Vector3): double;
begin
  Result := (a^.x * b^.x) + (a^.y * b^.y) + (a^.z * b^.z);
end;

procedure eina_vector3_cross_product(OutVector: PEina_Vector3; a, b: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  tmp.x := a^.y * b^.z - a^.z * b^.y;
  tmp.y := a^.z * b^.x - a^.x * b^.z;
  tmp.z := a^.x * b^.y - a^.y * b^.x;
  eina_vector3_copy(OutVector, @tmp);
end;

function eina_vector3_length_get(v: PEina_Vector3): double;
begin
  Result := sqrt((v^.x * v^.x) + (v^.y * v^.y) + (v^.z * v^.z));
end;

function eina_vector3_length_square_get(v: PEina_Vector3): double;
begin
  Result := (v^.x * v^.x) + (v^.y * v^.y) + (v^.z * v^.z);
end;

function eina_vector3_distance_get(a, b: PEina_Vector3): double;
var
  v: Teina_Vector3;
begin
  eina_vector3_subtract(@v, a, b);
  Result := eina_vector3_length_get(@v);
end;

function eina_vector3_distance_square_get(a, b: PEina_Vector3): double;
var
  v: Teina_Vector3;
begin
  eina_vector3_subtract(@v, a, b);
  Result := eina_vector3_length_square_get(@v);
end;

function eina_vector3_angle_get(a, b: PEina_Vector3): double;
begin
  Result := eina_vector3_dot_product(a, b) / (eina_vector3_length_get(a) * eina_vector3_length_get(b));
end;

procedure eina_vector3_normalize(out_: PEina_Vector3; v: PEina_Vector3);
begin
  eina_vector3_scale(out_, v, 1.0 / eina_vector3_length_get(v));
end;

procedure eina_vector3_transform(out_: PEina_Vector3; m: PEina_Matrix3; v: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  if eina_matrix3_type_get(m) = EINA_MATRIX_TYPE_IDENTITY then begin
    eina_vector3_copy(out_, v);
    Exit;
  end;

  tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + (m^.zx * v^.z);
  tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + (m^.zy * v^.z);
  tmp.z := (m^.xz * v^.x) + (m^.yz * v^.y) + (m^.zz * v^.z);

  eina_vector3_copy(out_, @tmp);
end;

procedure eina_vector3_homogeneous_direction_transform(out_: PEina_Vector3; m: PEina_Matrix4; v: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  if eina_matrix4_type_get(m) = EINA_MATRIX_TYPE_IDENTITY then begin
    eina_vector3_copy(out_, v);
    Exit;
  end;

  tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + (m^.zx * v^.z);
  tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + (m^.zy * v^.z);
  tmp.z := (m^.xz * v^.x) + (m^.yz * v^.y) + (m^.zz * v^.z);

  eina_vector3_copy(out_, @tmp);
end;

procedure eina_vector3_homogeneous_position_transform(out_: PEina_Vector3; m: PEina_Matrix4;
  v: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  if eina_matrix4_type_get(m) = EINA_MATRIX_TYPE_IDENTITY then begin
    eina_vector3_copy(out_, v);
    Exit;
  end;

  if EINA_DOUBLE_EQUAL((m^.xw * v^.x) + (m^.yw * v^.y) + (m^.zw * v^.z) + m^.ww, 0.0) then begin
    Exit;
  end;

  tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + (m^.zx * v^.z) + m^.wx;
  tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + (m^.zy * v^.z) + m^.wy;
  tmp.z := (m^.xz * v^.x) + (m^.yz * v^.y) + (m^.zz * v^.z) + m^.wz;

  eina_vector3_scale(out_, @tmp, 1.0 / ((m^.xw * v^.x) + (m^.yw * v^.y) + (m^.zw * v^.z) + m^.ww));
end;

procedure eina_vector3_quaternion_rotate(out_: PEina_Vector3; v: PEina_Vector3;  q: PEina_Quaternion);
var
  uv, uuv: Teina_Vector3;
  axis: Teina_Vector3;
begin
  eina_vector3_set(@axis, q^.x, q^.y, q^.z);

  eina_vector3_cross_product(@uv, @axis, v);
  eina_vector3_cross_product(@uuv, @axis, @uv);

  eina_vector3_scale(@uv, @uv, 2.0 * q^.w);
  eina_vector3_scale(@uuv, @uuv, 2.0);

  out_^.x := v^.x + uv.x + uuv.x;
  out_^.y := v^.y + uv.y + uuv.y;
  out_^.z := v^.z + uv.z + uuv.z;
end;

procedure eina_vector3_orthogonal_projection_on_plane(out_: PEina_Vector3; v: PEina_Vector3;  normal: PEina_Vector3);
var
  a: double;
  projection: TEina_Vector3;
begin
  a := eina_vector3_dot_product(v, normal) / eina_vector3_length_square_get(normal);
  eina_vector3_scale(@projection, normal, a);
  eina_vector3_subtract(out_, v, @projection);
end;

procedure eina_vector3_plane_by_points(out_: PEina_Quaternion; a, b, c: PEina_Vector3);
begin
  out_^.x := (b^.y - a^.y) * (c^.z - a^.z) - (b^.z - a^.z) * (c^.y - a^.y);
  out_^.y := -(b^.x - a^.x) * (c^.z - a^.z) + (b^.z - a^.z) * (c^.x - a^.x);
  out_^.z := (b^.x - a^.x) * (c^.y - a^.y) - (b^.y - a^.y) * (c^.x - a^.x);
  out_^.w := (-a^.x) * ((b^.y - a^.y) * (c^.z - a^.z) - (b^.z - a^.z) * (c^.y - a^.y)) -
    (-a^.y) * ((b^.x - a^.x) * (c^.z - a^.z) - (b^.z - a^.z) * (c^.x - a^.x)) +
    (-a^.z) * ((b^.x - a^.x) * (c^.y - a^.y) - (b^.y - a^.y) * (c^.x - a^.x));
end;

procedure eina_vector3_homogeneous_position_set(out_: PEina_Vector3; v: PEina_Quaternion);
var
  h: double;
begin
  h := 1.0 / v^.w;

  out_^.x := v^.x * h;
  out_^.y := v^.y * h;
  out_^.z := v^.z * h;
end;

procedure eina_vector3_homogeneous_direction_set(out_: PEina_Vector3; v: PEina_Quaternion);
begin
  out_^.x := v^.x;
  out_^.y := v^.y;
  out_^.z := v^.z;
end;

function eina_vector3_equivalent(a: PEina_Vector3; b: PEina_Vector3): TEina_Bool;
begin
  Result := TEina_Bool(EINA_DOUBLE_EQUAL(a^.x, b^.x) and
    EINA_DOUBLE_EQUAL(a^.y, b^.y) and
    EINA_DOUBLE_EQUAL(a^.z, b^.z));
end;

function eina_vector3_triangle_equivalent(v0, v1, v2, w0, w1, w2: PEina_Vector3): TEina_Bool;
begin
  if (EINA_DOUBLE_EQUAL(v0^.x, w0^.x) and
    EINA_DOUBLE_EQUAL(v0^.y, w0^.y) and
    EINA_DOUBLE_EQUAL(v0^.z, w0^.z)) and
    (EINA_DOUBLE_EQUAL(v1^.x, w1^.x) and
    EINA_DOUBLE_EQUAL(v1^.y, w1^.y) and
    EINA_DOUBLE_EQUAL(v1^.z, w1^.z)) and
    (EINA_DOUBLE_EQUAL(v2^.x, w2^.x) and
    EINA_DOUBLE_EQUAL(v2^.y, w2^.y) and
    EINA_DOUBLE_EQUAL(v2^.z, w2^.z)) then begin
    Result := EINA_TRUE;
  end else begin
    Result := EINA_FALSE;
  end;
end;

end.
