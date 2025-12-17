unit spherical;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVSphericalProjection = longint;

const
  AV_SPHERICAL_EQUIRECTANGULAR = 0;
  AV_SPHERICAL_CUBEMAP = 1;
  AV_SPHERICAL_EQUIRECTANGULAR_TILE = 2;

type
  TAVSphericalMapping = record
    projection: TAVSphericalProjection;
    yaw: Tint32_t;
    pitch: Tint32_t;
    roll: Tint32_t;
    bound_left: Tuint32_t;
    bound_top: Tuint32_t;
    bound_right: Tuint32_t;
    bound_bottom: Tuint32_t;
    padding: Tuint32_t;
  end;
  PAVSphericalMapping = ^TAVSphericalMapping;

function av_spherical_alloc(size: Psize_t): PAVSphericalMapping; cdecl; external libavutil;
procedure av_spherical_tile_bounds(map: PAVSphericalMapping; width: Tsize_t; height: Tsize_t; left: Psize_t; top: Psize_t; right: Psize_t; bottom: Psize_t); cdecl; external libavutil;
function av_spherical_projection_name(projection: TAVSphericalProjection): pchar; cdecl; external libavutil;
function av_spherical_from_name(name: pchar): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:20 ===


implementation



end.
