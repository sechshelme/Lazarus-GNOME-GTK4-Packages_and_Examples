{$IFDEF read_interface}


function gsk_transform_get_type: TGType; cdecl; external libgtk4;
function gsk_transform_ref(self: PGskTransform): PGskTransform; cdecl; external libgtk4;
procedure gsk_transform_unref(self: PGskTransform); cdecl; external libgtk4;
procedure gsk_transform_print(self: PGskTransform; _string: PGString); cdecl; external libgtk4;
function gsk_transform_to_string(self: PGskTransform): pchar; cdecl; external libgtk4;
function gsk_transform_parse(_string: pchar; out_transform: PPGskTransform): Tgboolean; cdecl; external libgtk4;
procedure gsk_transform_to_matrix(self: PGskTransform; out_matrix: Pgraphene_matrix_t); cdecl; external libgtk4;
procedure gsk_transform_to_2d(self: PGskTransform; out_xx: Psingle; out_yx: Psingle; out_xy: Psingle; out_yy: Psingle;
  out_dx: Psingle; out_dy: Psingle); cdecl; external libgtk4;
procedure gsk_transform_to_2d_components(self: PGskTransform; out_skew_x: Psingle; out_skew_y: Psingle; out_scale_x: Psingle; out_scale_y: Psingle;
  out_angle: Psingle; out_dx: Psingle; out_dy: Psingle); cdecl; external libgtk4;
procedure gsk_transform_to_affine(self: PGskTransform; out_scale_x: Psingle; out_scale_y: Psingle; out_dx: Psingle; out_dy: Psingle); cdecl; external libgtk4;
procedure gsk_transform_to_translate(self: PGskTransform; out_dx: Psingle; out_dy: Psingle); cdecl; external libgtk4;
function gsk_transform_get_category(self: PGskTransform): TGskTransformCategory; cdecl; external libgtk4;
function gsk_transform_equal(first: PGskTransform; second: PGskTransform): Tgboolean; cdecl; external libgtk4;
function gsk_transform_new: PGskTransform; cdecl; external libgtk4;
function gsk_transform_transform(next: PGskTransform; other: PGskTransform): PGskTransform; cdecl; external libgtk4;
function gsk_transform_invert(self: PGskTransform): PGskTransform; cdecl; external libgtk4;
function gsk_transform_matrix(next: PGskTransform; matrix: Pgraphene_matrix_t): PGskTransform; cdecl; external libgtk4;
function gsk_transform_matrix_2d(next: PGskTransform; xx: single; yx: single; xy: single; yy: single;
  dx: single; dy: single): PGskTransform; cdecl; external libgtk4;
function gsk_transform_translate(next: PGskTransform; point: Pgraphene_point_t): PGskTransform; cdecl; external libgtk4;
function gsk_transform_translate_3d(next: PGskTransform; point: Pgraphene_point3d_t): PGskTransform; cdecl; external libgtk4;
function gsk_transform_skew(next: PGskTransform; skew_x: single; skew_y: single): PGskTransform; cdecl; external libgtk4;
function gsk_transform_rotate(next: PGskTransform; angle: single): PGskTransform; cdecl; external libgtk4;
function gsk_transform_rotate_3d(next: PGskTransform; angle: single; axis: Pgraphene_vec3_t): PGskTransform; cdecl; external libgtk4;
function gsk_transform_scale(next: PGskTransform; factor_x: single; factor_y: single): PGskTransform; cdecl; external libgtk4;
function gsk_transform_scale_3d(next: PGskTransform; factor_x: single; factor_y: single; factor_z: single): PGskTransform; cdecl; external libgtk4;
function gsk_transform_perspective(next: PGskTransform; depth: single): PGskTransform; cdecl; external libgtk4;
procedure gsk_transform_transform_bounds(self: PGskTransform; rect: Pgraphene_rect_t; out_rect: Pgraphene_rect_t); cdecl; external libgtk4;
procedure gsk_transform_transform_point(self: PGskTransform; point: Pgraphene_point_t; out_point: Pgraphene_point_t); cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:38:51 ===

function GSK_TYPE_TRANSFORM: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_TRANSFORM: TGType;
begin
  GSK_TYPE_TRANSFORM := gsk_transform_get_type;
end;



{$ENDIF read_implementation}
