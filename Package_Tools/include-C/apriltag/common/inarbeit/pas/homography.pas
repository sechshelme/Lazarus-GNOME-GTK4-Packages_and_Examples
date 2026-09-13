unit homography;

interface

uses
  fp_apriltag, zarray, matd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  HOMOGRAPHY_COMPUTE_FLAG_INVERSE = 1;
  HOMOGRAPHY_COMPUTE_FLAG_SVD = 0;

function homography_compute(correspondences: Pzarray_t; flags: longint): Pmatd_t; cdecl; external libapriltag;

function homography_to_pose(H: Pmatd_t; fx: Tdouble; fy: Tdouble; cx: Tdouble; cy: Tdouble): Pmatd_t; cdecl; external libapriltag;
function homography_to_model_view(H: Pmatd_t; F: Tdouble; G: Tdouble; A: Tdouble; B: Tdouble;
  C: Tdouble; D: Tdouble): Pmatd_t; cdecl; external libapriltag;

procedure homography_project(const H: Pmatd_t; x, y: double; out ox, oy: double);

// === Konventiert am: 12-9-26 17:14:20 ===


implementation

procedure homography_project(const H: Pmatd_t; x, y: double; out ox, oy: double);
var
  xx, yy, zz: double;
begin
  xx := H^.data[0 * H^.ncols + 0] * x + H^.data[0 * H^.ncols + 1] * y + H^.data[0 * H^.ncols + 2];
  yy := H^.data[1 * H^.ncols + 0] * x + H^.data[1 * H^.ncols + 1] * y + H^.data[1 * H^.ncols + 2];
  zz := H^.data[2 * H^.ncols + 0] * x + H^.data[2 * H^.ncols + 1] * y + H^.data[2 * H^.ncols + 2];

  ox := xx / zz;
  oy := yy / zz;
end;


end.
