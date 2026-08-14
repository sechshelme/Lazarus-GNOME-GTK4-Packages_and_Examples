

  {$IFDEF read_struct}
type
  PGeglMatrix3 = ^TGeglMatrix3;
  TGeglMatrix3 = record
    coeff: array[0..2] of array[0..2] of Tgdouble;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_matrix3_get_type: TGType; cdecl; external libgegl;
function gegl_matrix3_new: PGeglMatrix3; cdecl; external libgegl;
procedure gegl_matrix3_identity(matrix: PGeglMatrix3); cdecl; external libgegl;
procedure gegl_matrix3_round_error(matrix: PGeglMatrix3); cdecl; external libgegl;
function gegl_matrix3_equal(matrix1: PGeglMatrix3; matrix2: PGeglMatrix3): Tgboolean; cdecl; external libgegl;
function gegl_matrix3_is_identity(matrix: PGeglMatrix3): Tgboolean; cdecl; external libgegl;
function gegl_matrix3_is_scale(matrix: PGeglMatrix3): Tgboolean; cdecl; external libgegl;
function gegl_matrix3_is_translate(matrix: PGeglMatrix3): Tgboolean; cdecl; external libgegl;
function gegl_matrix3_is_affine(matrix: PGeglMatrix3): Tgboolean; cdecl; external libgegl;
procedure gegl_matrix3_copy_into(dst: PGeglMatrix3; src: PGeglMatrix3); cdecl; external libgegl;
function gegl_matrix3_copy(matrix: PGeglMatrix3): PGeglMatrix3; cdecl; external libgegl;
function gegl_matrix3_determinant(matrix: PGeglMatrix3): Tgdouble; cdecl; external libgegl;
procedure gegl_matrix3_invert(matrix: PGeglMatrix3); cdecl; external libgegl;
procedure gegl_matrix3_multiply(left: PGeglMatrix3; right: PGeglMatrix3; product: PGeglMatrix3); cdecl; external libgegl;
procedure gegl_matrix3_originate(matrix: PGeglMatrix3; x: Tgdouble; y: Tgdouble); cdecl; external libgegl;
procedure gegl_matrix3_transform_point(matrix: PGeglMatrix3; x: Pgdouble; y: Pgdouble); cdecl; external libgegl;
procedure gegl_matrix3_parse_string(matrix: PGeglMatrix3; _string: Pgchar); cdecl; external libgegl;
function gegl_matrix3_to_string(matrix: PGeglMatrix3): Pgchar; cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:11:38 ===

function GEGL_TYPE_MATRIX3: TGType;

function GEGL_VALUE_HOLDS_MATRIX3(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_MATRIX3: TGType;
begin
  GEGL_TYPE_MATRIX3 := gegl_matrix3_get_type;
end;

function GEGL_VALUE_HOLDS_MATRIX3(obj: Pointer): Tgboolean;
begin
  GEGL_VALUE_HOLDS_MATRIX3 := G_TYPE_CHECK_VALUE_TYPE(obj, GEGL_TYPE_MATRIX3);
end;

{$ENDIF read_implementation}
