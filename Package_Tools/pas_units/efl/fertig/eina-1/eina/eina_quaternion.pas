unit eina_quaternion;

interface

uses
  ctypes, efl, eina_types, eina_fp, eina_matrix;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Quaternion = record
    x: double;
    y: double;
    z: double;
    w: double;
  end;
  PEina_Quaternion = ^TEina_Quaternion;

  TEina_Quaternion_F16p16 = record
    x: TEina_F16p16;
    y: TEina_F16p16;
    z: TEina_F16p16;
    w: TEina_F16p16;
  end;
  PEina_Quaternion_F16p16 = ^TEina_Quaternion_F16p16;

  TEina_Point_3D = record
    x: double;
    y: double;
    z: double;
  end;
  PEina_Point_3D = ^TEina_Point_3D;

  TEina_Point_3D_F16p16 = record
    x: TEina_F16p16;
    y: TEina_F16p16;
    z: TEina_F16p16;
  end;
  PEina_Point_3D_F16p16 = ^TEina_Point_3D_F16p16;

procedure eina_quaternion_f16p16_set(out_: PEina_Quaternion; x: TEina_F16p16; y: TEina_F16p16; z: TEina_F16p16; w: TEina_F16p16); cdecl; external libeina;
function eina_quaternion_f16p16_norm(q: PEina_Quaternion_F16p16): TEina_F16p16; cdecl; external libeina;
procedure eina_quaternion_f16p16_negative(out_: PEina_Quaternion_F16p16; in_: PEina_Quaternion_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_add(out_: PEina_Quaternion_F16p16; a: PEina_Quaternion_F16p16; b: PEina_Quaternion_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_mul(out_: PEina_Quaternion_F16p16; a: PEina_Quaternion_F16p16; b: PEina_Quaternion_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_scale(out_: PEina_Quaternion_F16p16; a: PEina_Quaternion_F16p16; b: TEina_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_conjugate(out_: PEina_Quaternion_F16p16; in_: PEina_Quaternion_F16p16); cdecl; external libeina;
function eina_quaternion_f16p16_dot(a: PEina_Quaternion_F16p16; b: PEina_Quaternion_F16p16): TEina_F16p16; cdecl; external libeina;
procedure eina_quaternion_f16p16_lerp(out_: PEina_Quaternion_F16p16; a: PEina_Quaternion_F16p16; b: PEina_Quaternion_F16p16; pos: TEina_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_slerp(out_: PEina_Quaternion_F16p16; a: PEina_Quaternion_F16p16; b: PEina_Quaternion_F16p16; pos: TEina_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_nlerp(out_: PEina_Quaternion_F16p16; a: PEina_Quaternion_F16p16; b: PEina_Quaternion_F16p16; pos: TEina_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_rotate(p: PEina_Point_3D_F16p16; center: PEina_Point_3D_F16p16; q: PEina_Quaternion_F16p16); cdecl; external libeina;
procedure eina_quaternion_f16p16_rotation_matrix3_get(m: PEina_Matrix3_F16p16; q: PEina_Quaternion_F16p16); cdecl; external libeina;
procedure eina_quaternion_set(q: PEina_Quaternion; x: double; y: double; z: double; w: double); cdecl; external libeina;
function eina_quaternion_norm(q: PEina_Quaternion): double; cdecl; external libeina;
procedure eina_quaternion_negative(out_: PEina_Quaternion; in_: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_add(out_: PEina_Quaternion; a: PEina_Quaternion; b: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_mul(out_: PEina_Quaternion; a: PEina_Quaternion; b: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_scale(out_: PEina_Quaternion; a: PEina_Quaternion; b: double); cdecl; external libeina;
procedure eina_quaternion_conjugate(out_: PEina_Quaternion; in_: PEina_Quaternion); cdecl; external libeina;
function eina_quaternion_dot(a: PEina_Quaternion; b: PEina_Quaternion): double; cdecl; external libeina;
procedure eina_quaternion_normalized(out_: PEina_Quaternion; in_: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_lerp(out_: PEina_Quaternion; a: PEina_Quaternion; b: PEina_Quaternion; pos: double); cdecl; external libeina;
procedure eina_quaternion_slerp(out_: PEina_Quaternion; a: PEina_Quaternion; b: PEina_Quaternion; pos: double); cdecl; external libeina;
procedure eina_quaternion_nlerp(out_: PEina_Quaternion; a: PEina_Quaternion; b: PEina_Quaternion; pos: double); cdecl; external libeina;
procedure eina_quaternion_rotate(p: PEina_Point_3D; center: PEina_Point_3D; q: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_rotation_matrix3_get(m: PEina_Matrix3; q: PEina_Quaternion); cdecl; external libeina;
procedure eina_matrix3_quaternion_get(q: PEina_Quaternion; m: PEina_Matrix3); cdecl; external libeina;
function eina_matrix4_quaternion_to(rotation: PEina_Quaternion; perspective: PEina_Quaternion; translation: PEina_Point_3D; scale: PEina_Point_3D; skew: PEina_Point_3D; m: PEina_Matrix4): TEina_Bool; cdecl; external libeina;
procedure eina_quaternion_matrix4_to(m: PEina_Matrix4; rotation: PEina_Quaternion; perspective: PEina_Quaternion; translation: PEina_Point_3D; scale: PEina_Point_3D; skew: PEina_Point_3D); cdecl; external libeina;
procedure eina_quaternion_inverse(out_: PEina_Quaternion; q: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_array_set(dst: PEina_Quaternion; v: Pdouble); cdecl; external libeina;
procedure eina_quaternion_copy(dst: PEina_Quaternion; src: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_homogeneous_regulate(out_: PEina_Quaternion; v: PEina_Quaternion); cdecl; external libeina;
procedure eina_quaternion_subtract(out_: PEina_Quaternion; a: PEina_Quaternion; b: PEina_Quaternion); cdecl; external libeina;
function eina_quaternion_length_get(v: PEina_Quaternion): double; cdecl; external libeina;
function eina_quaternion_length_square_get(v: PEina_Quaternion): double; cdecl; external libeina;
function eina_quaternion_distance_get(a: PEina_Quaternion; b: PEina_Quaternion): double; cdecl; external libeina;
function eina_quaternion_distance_square_get(a: PEina_Quaternion; b: PEina_Quaternion): double; cdecl; external libeina;
procedure eina_quaternion_transform(out_: PEina_Quaternion; v: PEina_Quaternion; m: PEina_Matrix4); cdecl; external libeina;
function eina_quaternion_angle_plains(a: PEina_Quaternion; b: PEina_Quaternion): double; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:01:46 ===


implementation



end.
