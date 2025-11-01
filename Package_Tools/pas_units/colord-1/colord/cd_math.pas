unit cd_math;

interface

uses
  fp_glib2, fp_colord;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCdMat3x3 = record
    m00: Tgdouble;
    m01: Tgdouble;
    m02: Tgdouble;
    m10: Tgdouble;
    m11: Tgdouble;
    m12: Tgdouble;
    m20: Tgdouble;
    m21: Tgdouble;
    m22: Tgdouble;
  end;
  PCdMat3x3 = ^TCdMat3x3;

  TCdVec3 = record
    v0: double;
    v1: double;
    v2: double;
  end;
  PCdVec3 = ^TCdVec3;

procedure cd_vec3_clear(src: PCdVec3); cdecl; external libcolord;
procedure cd_vec3_add(src1: PCdVec3; src2: PCdVec3; dest: PCdVec3); cdecl; external libcolord;
procedure cd_vec3_subtract(src1: PCdVec3; src2: PCdVec3; dest: PCdVec3); cdecl; external libcolord;
procedure cd_vec3_scalar_multiply(src: PCdVec3; value: Tgdouble; dest: PCdVec3); cdecl; external libcolord;
procedure cd_vec3_copy(src: PCdVec3; dest: PCdVec3); cdecl; external libcolord;
function cd_vec3_squared_error(src1: PCdVec3; src2: PCdVec3): Tgdouble; cdecl; external libcolord;
function cd_vec3_to_string(src: PCdVec3): Pgchar; cdecl; external libcolord;
function cd_vec3_get_data(src: PCdVec3): Pgdouble; cdecl; external libcolord;
procedure cd_vec3_init(dest: PCdVec3; v0: Tgdouble; v1: Tgdouble; v2: Tgdouble); cdecl; external libcolord;
procedure cd_mat33_init(dest: PCdMat3x3; m00: Tgdouble; m01: Tgdouble; m02: Tgdouble; m10: Tgdouble;
  m11: Tgdouble; m12: Tgdouble; m20: Tgdouble; m21: Tgdouble; m22: Tgdouble); cdecl; external libcolord;
procedure cd_mat33_clear(src: PCdMat3x3); cdecl; external libcolord;
function cd_mat33_to_string(src: PCdMat3x3): Pgchar; cdecl; external libcolord;
function cd_mat33_get_data(src: PCdMat3x3): Pgdouble; cdecl; external libcolord;
procedure cd_mat33_set_identity(src: PCdMat3x3); cdecl; external libcolord;
procedure cd_mat33_scalar_multiply(mat_src: PCdMat3x3; value: Tgdouble; mat_dest: PCdMat3x3); cdecl; external libcolord;
procedure cd_mat33_vector_multiply(mat_src: PCdMat3x3; vec_src: PCdVec3; vec_dest: PCdVec3); cdecl; external libcolord;
procedure cd_mat33_matrix_multiply(mat_src1: PCdMat3x3; mat_src2: PCdMat3x3; mat_dest: PCdMat3x3); cdecl; external libcolord;
function cd_mat33_reciprocal(src: PCdMat3x3; dest: PCdMat3x3): Tgboolean; cdecl; external libcolord;
function cd_mat33_determinant(src: PCdMat3x3): Tgdouble; cdecl; external libcolord;
procedure cd_mat33_normalize(src: PCdMat3x3; dest: PCdMat3x3); cdecl; external libcolord;
procedure cd_mat33_copy(src: PCdMat3x3; dest: PCdMat3x3); cdecl; external libcolord;
function cd_mat33_is_finite(mat: PCdMat3x3; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:13 ===


implementation



end.
