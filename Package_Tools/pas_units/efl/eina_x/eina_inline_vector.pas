unit eina_inline_vector;


interface

uses
  fp_eina, // Assuming Eina.Types contains Teina_Bool, Teina_Vector2, Teina_Vector3, Teina_Matrix2, Teina_Matrix3, Teina_Matrix4, Teina_Quaternion
  Math;       // For sqrt function

//type
//  PEina_Vector2 = ^Teina_Vector2;
//  PEina_Vector3 = ^Teina_Vector3;
//  PEina_Matrix2 = ^Teina_Matrix2;
//  PEina_Matrix3 = ^Teina_Matrix3;
//  PEina_Matrix4 = ^Teina_Matrix4;
//  PEina_Quaternion = ^Teina_Quaternion;

// Eina_Vector2 functions
procedure eina_vector2_set(dst: PEina_Vector2; x, y: Double); inline;
procedure eina_vector2_array_set(dst: PEina_Vector2; const v: array of Double); inline;
procedure eina_vector2_copy(dst: PEina_Vector2; const src: PEina_Vector2); inline;
procedure eina_vector2_negate(OutVector: PEina_Vector2; const v: PEina_Vector2); inline;
procedure eina_vector2_add(OutVector: PEina_Vector2; const a, b: PEina_Vector2); inline;
procedure eina_vector2_subtract(OutVector: PEina_Vector2; const a, b: PEina_Vector2); inline;
procedure eina_vector2_scale(OutVector: PEina_Vector2; const v: PEina_Vector2; scale: Double); inline;
function eina_vector2_dot_product(const a, b: PEina_Vector2): Double; inline;
function eina_vector2_length_get(const v: PEina_Vector2): Double; inline;
function eina_vector2_length_square_get(const v: PEina_Vector2): Double; inline;
function eina_vector2_distance_get(const a, b: PEina_Vector2): Double; inline;
function eina_vector2_distance_square_get(const a, b: PEina_Vector2): Double; inline;
procedure eina_vector2_normalize(OutVector: PEina_Vector2; const v: PEina_Vector2); inline;
procedure eina_vector2_transform(OutVector: PEina_Vector2; const m: PEina_Matrix2; const v: PEina_Vector2); inline;
procedure eina_vector2_homogeneous_position_transform(OutVector: PEina_Vector2; const m: PEina_Matrix3; const v: PEina_Vector2); inline;
procedure eina_vector2_homogeneous_direction_transform(OutVector: PEina_Vector2; const m: PEina_Matrix3; const v: PEina_Vector2); inline;

// Eina_Vector3 functions
procedure eina_vector3_set(dst: PEina_Vector3; x, y, z: Double); inline;
procedure eina_vector3_array_set(dst: PEina_Vector3; const v: array of Double); inline;
procedure eina_vector3_copy(dst: PEina_Vector3; const src: PEina_Vector3); inline;
procedure eina_vector3_negate(OutVector: PEina_Vector3; const v: PEina_Vector3); inline;
procedure eina_vector3_add(OutVector: PEina_Vector3; const a, b: PEina_Vector3); inline;
procedure eina_vector3_subtract(OutVector: PEina_Vector3; const a, b: PEina_Vector3); inline;
procedure eina_vector3_scale(OutVector: PEina_Vector3; const v: PEina_Vector3; scale: Double); inline;
procedure eina_vector3_multiply(OutVector: PEina_Vector3; const a, b: PEina_Vector3); inline;
function eina_vector3_dot_product(const a, b: PEina_Vector3): Double; inline;
procedure eina_vector3_cross_product(OutVector: PEina_Vector3; const a, b: PEina_Vector3); inline;
function eina_vector3_length_get(const v: PEina_Vector3): Double; inline;
function eina_vector3_length_square_get(const v: PEina_Vector3): Double; inline;
function eina_vector3_distance_get(const a, b: PEina_Vector3): Double; inline;
function eina_vector3_distance_square_get(const a, b: PEina_Vector3): Double; inline;
function eina_vector3_angle_get(const a, b: PEina_Vector3): Double; inline;
procedure eina_vector3_normalize(OutVector: PEina_Vector3; const v: PEina_Vector3); inline;
procedure eina_vector3_transform(OutVector: PEina_Vector3; const m: PEina_Matrix3; const v: PEina_Vector3); inline;
procedure eina_vector3_homogeneous_direction_transform(OutVector: PEina_Vector3; const m: PEina_Matrix4; const v: PEina_Vector3); inline;
procedure eina_vector3_homogeneous_position_transform(OutVector: PEina_Vector3; const m: PEina_Matrix4; const v: PEina_Vector3); inline;
procedure eina_vector3_quaternion_rotate(OutVector: PEina_Vector3; const v: PEina_Vector3; const q: PEina_Quaternion); inline;
procedure eina_vector3_orthogonal_projection_on_plane(OutVector: PEina_Vector3; const v: PEina_Vector3; const normal: PEina_Vector3); inline;
procedure eina_vector3_plane_by_points(OutQuaternion: PEina_Quaternion; const a, b, c: PEina_Vector3); inline;
procedure eina_vector3_homogeneous_position_set(OutVector: PEina_Vector3; const v: PEina_Quaternion); inline;
procedure eina_vector3_homogeneous_direction_set(OutVector: PEina_Vector3; const v: PEina_Quaternion); inline;
function eina_vector3_equivalent(a: PEina_Vector3; const b: PEina_Vector3): Teina_Bool; inline;
function eina_vector3_triangle_equivalent(v0, v1, v2, w0, w1, w2: PEina_Vector3): Teina_Bool; inline;

implementation

// Eina_Vector2 functions
procedure eina_vector2_set(dst: PEina_Vector2; x, y: Double);
begin
  if Assigned(dst) then
  begin
    dst^.x := x;
    dst^.y := y;
  end;
end;

procedure eina_vector2_array_set(dst: PEina_Vector2; const v: array of Double);
begin
  if Assigned(dst) and (Length(v) >= 2) then
  begin
    dst^.x := v[0];
    dst^.y := v[1];
  end;
end;

procedure eina_vector2_copy(dst: PEina_Vector2; const src: PEina_Vector2);
begin
  if Assigned(dst) and Assigned(src) then
  begin
    dst^.x := src^.x;
    dst^.y := src^.y;
  end;
end;

procedure eina_vector2_negate(OutVector: PEina_Vector2; const v: PEina_Vector2);
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    OutVector^.x := -v^.x;
    OutVector^.y := -v^.y;
  end;
end;

procedure eina_vector2_add(OutVector: PEina_Vector2; const a, b: PEina_Vector2);
begin
  if Assigned(OutVector) and Assigned(a) and Assigned(b) then
  begin
    OutVector^.x := a^.x + b^.x;
    OutVector^.y := a^.y + b^.y;
  end;
end;

procedure eina_vector2_subtract(OutVector: PEina_Vector2; const a, b: PEina_Vector2);
begin
  if Assigned(OutVector) and Assigned(a) and Assigned(b) then
  begin
    OutVector^.x := a^.x - b^.x;
    OutVector^.y := a^.y - b^.y;
  end;
end;

procedure eina_vector2_scale(OutVector: PEina_Vector2; const v: PEina_Vector2; scale: Double);
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    OutVector^.x := scale * v^.x;
    OutVector^.y := scale * v^.y;
  end;
end;

function eina_vector2_dot_product(const a, b: PEina_Vector2): Double;
begin
  if Assigned(a) and Assigned(b) then
    Result := (a^.x * b^.x) + (a^.y * b^.y)
  else
    Result := 0.0;
end;

function eina_vector2_length_get(const v: PEina_Vector2): Double;
begin
  if Assigned(v) then
    Result := sqrt((v^.x * v^.x) + (v^.y * v^.y))
  else
    Result := 0.0;
end;

function eina_vector2_length_square_get(const v: PEina_Vector2): Double;
begin
  if Assigned(v) then
    Result := (v^.x * v^.x) + (v^.y * v^.y)
  else
    Result := 0.0;
end;

function eina_vector2_distance_get(const a, b: PEina_Vector2): Double;
var
  v: Teina_Vector2;
begin
  if Assigned(a) and Assigned(b) then
  begin
    eina_vector2_subtract(@v, a, b);
    Result := eina_vector2_length_get(@v);
  end
  else
    Result := 0.0;
end;

function eina_vector2_distance_square_get(const a, b: PEina_Vector2): Double;
var
  v: Teina_Vector2;
begin
  if Assigned(a) and Assigned(b) then
  begin
    eina_vector2_subtract(@v, a, b);
    Result := eina_vector2_length_square_get(@v);
  end
  else
    Result := 0.0;
end;

procedure eina_vector2_normalize(OutVector: PEina_Vector2; const v: PEina_Vector2);
var
  len: Double;
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    len := eina_vector2_length_get(v);
    if len <> 0.0 then // Avoid division by zero for zero vectors
      eina_vector2_scale(OutVector, v, 1.0 / len);
    // Else, if v is a zero vector, OutVector remains a zero vector (or is initialized to zero)
  end;
end;

procedure eina_vector2_transform(OutVector: PEina_Vector2; const m: PEina_Matrix2;
                       const v: PEina_Vector2);
var
  tmp: Teina_Vector2;
begin
  if Assigned(OutVector) and Assigned(m) and Assigned(v) then
  begin
    tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y);
    tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y);
    eina_vector2_copy(OutVector, @tmp);
  end;
end;

procedure eina_vector2_homogeneous_position_transform(OutVector: PEina_Vector2;
                                            const m: PEina_Matrix3;
                                            const v: PEina_Vector2);
var
  tmp: Teina_Vector2;
  divisor: Double;
begin
  if Assigned(OutVector) and Assigned(m) and Assigned(v) then
  begin
    tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + m^.zx;
    tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + m^.zy;

    divisor := (m^.xz * v^.x) + (m^.yz * v^.y) + m^.zz;
    if divisor <> 0.0 then // Avoid division by zero
      eina_vector2_scale(OutVector, @tmp, 1.0 / divisor);
    // Else, handle case where divisor is zero (e.g., set OutVector to zero or return an error)
  end;
end;

procedure eina_vector2_homogeneous_direction_transform(OutVector: PEina_Vector2;
                                             const m: PEina_Matrix3;
                                             const v: PEina_Vector2);
var
  tmp: Teina_Vector2;
begin
  if Assigned(OutVector) and Assigned(m) and Assigned(v) then
  begin
    tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y);
    tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y);
    eina_vector2_copy(OutVector, @tmp);
  end;
end;

// Eina_Vector3 functions
procedure eina_vector3_set(dst: PEina_Vector3; x, y, z: Double);
begin
  if Assigned(dst) then
  begin
    dst^.x := x;
    dst^.y := y;
    dst^.z := z;
  end;
end;

procedure eina_vector3_array_set(dst: PEina_Vector3; const v: array of Double);
begin
  if Assigned(dst) and (Length(v) >= 3) then
  begin
    dst^.x := v[0];
    dst^.y := v[1];
    dst^.z := v[2];
  end;
end;

procedure eina_vector3_copy(dst: PEina_Vector3; const src: PEina_Vector3);
begin
  if Assigned(dst) and Assigned(src) then
  begin
    dst^.x := src^.x;
    dst^.y := src^.y;
    dst^.z := src^.z;
  end;
end;

procedure eina_vector3_negate(OutVector: PEina_Vector3; const v: PEina_Vector3);
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    OutVector^.x := -v^.x;
    OutVector^.y := -v^.y;
    OutVector^.z := -v^.z;
  end;
end;

procedure eina_vector3_add(OutVector: PEina_Vector3; const a, b: PEina_Vector3);
begin
  if Assigned(OutVector) and Assigned(a) and Assigned(b) then
  begin
    OutVector^.x := a^.x + b^.x;
    OutVector^.y := a^.y + b^.y;
    OutVector^.z := a^.z + b^.z;
  end;
end;

procedure eina_vector3_subtract(OutVector: PEina_Vector3; const a, b: PEina_Vector3);
begin
  if Assigned(OutVector) and Assigned(a) and Assigned(b) then
  begin
    OutVector^.x := a^.x - b^.x;
    OutVector^.y := a^.y - b^.y;
    OutVector^.z := a^.z - b^.z;
  end;
end;

procedure eina_vector3_scale(OutVector: PEina_Vector3; const v: PEina_Vector3; scale: Double);
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    OutVector^.x := scale * v^.x;
    OutVector^.y := scale * v^.y;
    OutVector^.z := scale * v^.z;
  end;
end;

procedure eina_vector3_multiply(OutVector: PEina_Vector3; const a, b: PEina_Vector3);
begin
  if Assigned(OutVector) and Assigned(a) and Assigned(b) then
  begin
    OutVector^.x := a^.x * b^.x;
    OutVector^.y := a^.y * b^.y;
    OutVector^.z := a^.z * b^.z;
  end;
end;

function eina_vector3_dot_product(const a, b: PEina_Vector3): Double;
begin
  if Assigned(a) and Assigned(b) then
    Result := (a^.x * b^.x) + (a^.y * b^.y) + (a^.z * b^.z)
  else
    Result := 0.0;
end;

procedure eina_vector3_cross_product(OutVector: PEina_Vector3; const a, b: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  if Assigned(OutVector) and Assigned(a) and Assigned(b) then
  begin
    tmp.x := a^.y * b^.z - a^.z * b^.y;
    tmp.y := a^.z * b^.x - a^.x * b^.z;
    tmp.z := a^.x * b^.y - a^.y * b^.x;
    eina_vector3_copy(OutVector, @tmp);
  end;
end;

function eina_vector3_length_get(const v: PEina_Vector3): Double;
begin
  if Assigned(v) then
    Result := sqrt((v^.x * v^.x) + (v^.y * v^.y) + (v^.z * v^.z))
  else
    Result := 0.0;
end;

function eina_vector3_length_square_get(const v: PEina_Vector3): Double;
begin
  if Assigned(v) then
    Result := (v^.x * v^.x) + (v^.y * v^.y) + (v^.z * v^.z)
  else
    Result := 0.0;
end;

function eina_vector3_distance_get(const a, b: PEina_Vector3): Double;
var
  v: Teina_Vector3;
begin
  if Assigned(a) and Assigned(b) then
  begin
    eina_vector3_subtract(@v, a, b);
    Result := eina_vector3_length_get(@v);
  end
  else
    Result := 0.0;
end;

function eina_vector3_distance_square_get(const a, b: PEina_Vector3): Double;
var
  v: Teina_Vector3;
begin
  if Assigned(a) and Assigned(b) then
  begin
    eina_vector3_subtract(@v, a, b);
    Result := eina_vector3_length_square_get(@v);
  end
  else
    Result := 0.0;
end;

function eina_vector3_angle_get(const a, b: PEina_Vector3): Double;
var
  len_a, len_b: Double;
begin
  if Assigned(a) and Assigned(b) then
  begin
    len_a := eina_vector3_length_get(a);
    len_b := eina_vector3_length_get(b);

    if (len_a <> 0.0) and (len_b <> 0.0) then
      Result := eina_vector3_dot_product(a, b) / (len_a * len_b)
    else
      Result := 0.0; // Handle zero length vectors appropriately
  end
  else
    Result := 0.0;
end;

procedure eina_vector3_normalize(OutVector: PEina_Vector3; const v: PEina_Vector3);
var
  len: Double;
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    len := eina_vector3_length_get(v);
    if len <> 0.0 then // Assume "v" is not a zero vector in the original C code's comment, but good to check
      eina_vector3_scale(OutVector, v, 1.0 / len);
  end;
end;

procedure eina_vector3_transform(OutVector: PEina_Vector3; const m: PEina_Matrix3;  const v: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  if Assigned(OutVector) and Assigned(m) and Assigned(v) then
  begin
    if eina_matrix3_type_get(m) = EINA_MATRIX_TYPE_IDENTITY then // Assuming eina_matrix3_type_get and EINA_MATRIX_TYPE_IDENTITY exist
    begin
      eina_vector3_copy(OutVector, v);
      Exit;
    end;

    tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + (m^.zx * v^.z);
    tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + (m^.zy * v^.z);
    tmp.z := (m^.xz * v^.x) + (m^.yz * v^.y) + (m^.zz * v^.z);

    eina_vector3_copy(OutVector, @tmp);
  end;
end;

procedure eina_vector3_homogeneous_direction_transform(OutVector: PEina_Vector3; const m: PEina_Matrix4;  const v: PEina_Vector3);
var
  tmp: Teina_Vector3;
begin
  if Assigned(OutVector) and Assigned(m) and Assigned(v) then
  begin
    if eina_matrix4_type_get(m) = EINA_MATRIX_TYPE_IDENTITY then // Assuming eina_matrix4_type_get and EINA_MATRIX_TYPE_IDENTITY exist
    begin
      eina_vector3_copy(OutVector, v);
      Exit;
    end;

    tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + (m^.zx * v^.z);
    tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + (m^.zy * v^.z);
    tmp.z := (m^.xz * v^.x) + (m^.yz * v^.y) + (m^.zz * v^.z);

    eina_vector3_copy(OutVector, @tmp);
  end;
end;

procedure eina_vector3_homogeneous_position_transform(OutVector: PEina_Vector3; const m: PEina_Matrix4;
                                            const v: PEina_Vector3);
var
  tmp: Teina_Vector3;
  divisor: Double;
begin
  if Assigned(OutVector) and Assigned(m) and Assigned(v) then
  begin
    if eina_matrix4_type_get(m) = EINA_MATRIX_TYPE_IDENTITY then
    begin
      eina_vector3_copy(OutVector, v);
      Exit;
    end;

    divisor := (m^.xw * v^.x) + (m^.yw * v^.y) + (m^.zw * v^.z) + m^.ww;
    if EINA_DOUBLE_EQUAL(divisor, 0.0) then // Assuming EINA_DOUBLE_EQUAL exists
      Exit; // Return if divisor is zero, as in C code

    tmp.x := (m^.xx * v^.x) + (m^.yx * v^.y) + (m^.zx * v^.z) + m^.wx;
    tmp.y := (m^.xy * v^.x) + (m^.yy * v^.y) + (m^.zy * v^.z) + m^.wy;
    tmp.z := (m^.xz * v^.x) + (m^.yz * v^.y) + (m^.zz * v^.z) + m^.wz;

    eina_vector3_scale(OutVector, @tmp, 1.0 / divisor);
  end;
end;

procedure eina_vector3_quaternion_rotate(OutVector: PEina_Vector3; const v: PEina_Vector3;
                               const q: PEina_Quaternion);
var
  uv, uuv: Teina_Vector3;
  axis: Teina_Vector3;
begin
  if Assigned(OutVector) and Assigned(v) and Assigned(q) then
  begin
    eina_vector3_set(@axis, q^.x, q^.y, q^.z);

    eina_vector3_cross_product(@uv, @axis, v);
    eina_vector3_cross_product(@uuv, @axis, @uv);

    eina_vector3_scale(@uv, @uv, 2.0 * q^.w);
    eina_vector3_scale(@uuv, @uuv, 2.0);

    OutVector^.x := v^.x + uv.x + uuv.x;
    OutVector^.y := v^.y + uv.y + uuv.y;
    OutVector^.z := v^.z + uv.z + uuv.z;
  end;
end;

procedure eina_vector3_orthogonal_projection_on_plane(OutVector: PEina_Vector3; const v: PEina_Vector3;
                                            const normal: PEina_Vector3);
var
  a: Double;
  projection: Teina_Vector3;
  normal_square_len: Double;
begin
  if Assigned(OutVector) and Assigned(v) and Assigned(normal) then
  begin
    normal_square_len := eina_vector3_length_square_get(normal);
    if normal_square_len = 0.0 then
    begin
        // Handle case where normal is a zero vector.
        // A common approach is to return the original vector, or an error.
        eina_vector3_copy(OutVector, v);
        Exit;
    end;

    a := eina_vector3_dot_product(v, normal) / normal_square_len;
    eina_vector3_scale(@projection, normal, a);
    eina_vector3_subtract(OutVector, v, @projection);
  end;
end;

procedure eina_vector3_plane_by_points(OutQuaternion: PEina_Quaternion; const a, b, c: PEina_Vector3);
begin
  if Assigned(OutQuaternion) and Assigned(a) and Assigned(b) and Assigned(c) then
  begin
    OutQuaternion^.x := (b^.y - a^.y) * (c^.z - a^.z) - (b^.z - a^.z) * (c^.y - a^.y);
    OutQuaternion^.y := -(b^.x - a^.x) * (c^.z - a^.z) + (b^.z - a^.z) * (c^.x - a^.x);
    OutQuaternion^.z := (b^.x - a^.x) * (c^.y - a^.y) - (b^.y - a^.y) * (c^.x - a^.x);
    OutQuaternion^.w := (-a^.x) * ((b^.y - a^.y)*(c^.z - a^.z) - (b^.z - a^.z) * (c^.y - a^.y)) -
                        (-a^.y) * ((b^.x - a^.x) * (c^.z - a^.z) - (b^.z - a^.z) * (c^.x - a^.x)) +
                        (-a^.z) * ((b^.x - a^.x) * (c^.y - a^.y) - (b^.y - a^.y) * (c^.x - a^.x));
  end;
end;

procedure eina_vector3_homogeneous_position_set(OutVector: PEina_Vector3; const v: PEina_Quaternion);
var
  h: Double;
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    if EINA_DOUBLE_EQUAL(v^.w, 0.0) then
      Exit; // Handle case where v->w is zero, assuming it's a directional vector then.

    h := 1.0 / v^.w;

    OutVector^.x := v^.x * h;
    OutVector^.y := v^.y * h;
    OutVector^.z := v^.z * h;
  end;
end;

procedure eina_vector3_homogeneous_direction_set(OutVector: PEina_Vector3; const v: PEina_Quaternion);
begin
  if Assigned(OutVector) and Assigned(v) then
  begin
    OutVector^.x := v^.x;
    OutVector^.y := v^.y;
    OutVector^.z := v^.z;
  end;
end;

function eina_vector3_equivalent(a: PEina_Vector3; const b: PEina_Vector3): Teina_Bool;
begin
  if Assigned(a) and Assigned(b) then
    Result := Teina_Bool(EINA_DOUBLE_EQUAL(a^.x, b^.x) and
                         EINA_DOUBLE_EQUAL(a^.y, b^.y) and
                         EINA_DOUBLE_EQUAL(a^.z, b^.z))
  else
    Result := EINA_FALSE; // Handle cases where one or both pointers are nil
end;

function eina_vector3_triangle_equivalent(v0, v1, v2, w0, w1, w2: PEina_Vector3): Teina_Bool;
begin
  if Assigned(v0) and Assigned(v1) and Assigned(v2) and
     Assigned(w0) and Assigned(w1) and Assigned(w2) then
  begin
    if (EINA_DOUBLE_EQUAL(v0^.x, w0^.x) and
        EINA_DOUBLE_EQUAL(v0^.y, w0^.y) and
        EINA_DOUBLE_EQUAL(v0^.z, w0^.z)) and
       (EINA_DOUBLE_EQUAL(v1^.x, w1^.x) and
        EINA_DOUBLE_EQUAL(v1^.y, w1^.y) and
        EINA_DOUBLE_EQUAL(v1^.z, w1^.z)) and
       (EINA_DOUBLE_EQUAL(v2^.x, w2^.x) and
        EINA_DOUBLE_EQUAL(v2^.y, w2^.y) and
        EINA_DOUBLE_EQUAL(v2^.z, w2^.z)) then
      Result := EINA_TRUE
    else
      Result := EINA_FALSE;
  end
  else
    Result := EINA_FALSE; // Handle cases where some pointers are nil
end;

end.
