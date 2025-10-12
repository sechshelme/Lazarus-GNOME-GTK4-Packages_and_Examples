
{$IFDEF read_interface}

type
  TPangoMatrix = record
    xx: double;
    xy: double;
    yx: double;
    yy: double;
    x0: double;
    y0: double;
  end;
  PPangoMatrix = ^TPangoMatrix;

const
  PANGO_MATRIX_INIT: TPangoMatrix = (xx: 1.0; xy: 0.0; yx: 0.0; yy: 1.0; x0: 0.0; y0: 0.0);

function pango_matrix_get_type: TGType; cdecl; external libpango;
function pango_matrix_copy(matrix: PPangoMatrix): PPangoMatrix; cdecl; external libpango;
procedure pango_matrix_free(matrix: PPangoMatrix); cdecl; external libpango;
procedure pango_matrix_translate(matrix: PPangoMatrix; tx: double; ty: double); cdecl; external libpango;
procedure pango_matrix_scale(matrix: PPangoMatrix; scale_x: double; scale_y: double); cdecl; external libpango;
procedure pango_matrix_rotate(matrix: PPangoMatrix; degrees: double); cdecl; external libpango;
procedure pango_matrix_concat(matrix: PPangoMatrix; new_matrix: PPangoMatrix); cdecl; external libpango;
procedure pango_matrix_transform_point(matrix: PPangoMatrix; x: Pdouble; y: Pdouble); cdecl; external libpango;
procedure pango_matrix_transform_distance(matrix: PPangoMatrix; dx: Pdouble; dy: Pdouble); cdecl; external libpango;
procedure pango_matrix_transform_rectangle(matrix: PPangoMatrix; rect: PPangoRectangle); cdecl; external libpango;
procedure pango_matrix_transform_pixel_rectangle(matrix: PPangoMatrix; rect: PPangoRectangle); cdecl; external libpango;
function pango_matrix_get_font_scale_factor(matrix: PPangoMatrix): double; cdecl; external libpango;
procedure pango_matrix_get_font_scale_factors(matrix: PPangoMatrix; xscale: Pdouble; yscale: Pdouble); cdecl; external libpango;
function pango_matrix_get_slant_ratio(matrix: PPangoMatrix): double; cdecl; external libpango;

// === Konventiert am: 23-11-24 18:04:48 ===

function PANGO_TYPE_MATRIX: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_MATRIX: TGType;
begin
  PANGO_TYPE_MATRIX := pango_matrix_get_type;
end;



{$ENDIF read_implementation}
