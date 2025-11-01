unit cd_color;

interface

uses
  fp_glib2, fp_colord;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCdColorRGB8 = record
    R: Tguint8;
    G: Tguint8;
    B: Tguint8;
  end;
  PCdColorRGB8 = ^TCdColorRGB8;

  TCdColorLab = record
    L: Tgdouble;
    a: Tgdouble;
    b: Tgdouble;
  end;
  PCdColorLab = ^TCdColorLab;

  TCdColorYxy = record
    Y: Tgdouble;
    x: Tgdouble;
    y_: Tgdouble;
  end;
  PCdColorYxy = ^TCdColorYxy;

  TCdColorXYZ = record
    X: Tgdouble;
    Y: Tgdouble;
    Z: Tgdouble;
  end;
  PCdColorXYZ = ^TCdColorXYZ;

  TCdColorRGB = record
    R: Tgdouble;
    G: Tgdouble;
    B: Tgdouble;
  end;
  PCdColorRGB = ^TCdColorRGB;

  TCdColorUVW = record
    U: Tgdouble;
    V: Tgdouble;
    W: Tgdouble;
  end;
  PCdColorUVW = ^TCdColorUVW;

type
  PCdColorBlackbodyFlags = ^TCdColorBlackbodyFlags;
  TCdColorBlackbodyFlags = longint;

const
  CD_COLOR_BLACKBODY_FLAG_NONE = 0;
  CD_COLOR_BLACKBODY_FLAG_USE_PLANCKIAN = 1;
  CD_COLOR_BLACKBODY_FLAG_LAST = 2;

type
  PCdColorSwatch = type Pointer;

function cd_color_xyz_get_type: TGType; cdecl; external libcolord;
function cd_color_lab_get_type: TGType; cdecl; external libcolord;
function cd_color_rgb_get_type: TGType; cdecl; external libcolord;
function cd_color_yxy_get_type: TGType; cdecl; external libcolord;
function cd_color_uvw_get_type: TGType; cdecl; external libcolord;
function cd_color_swatch_get_type: TGType; cdecl; external libcolord;
function cd_color_swatch_get_name(swatch: PCdColorSwatch): Pgchar; cdecl; external libcolord;
function cd_color_swatch_get_value(swatch: PCdColorSwatch): PCdColorLab; cdecl; external libcolord;
function cd_color_xyz_new: PCdColorXYZ; cdecl; external libcolord;
function cd_color_lab_new: PCdColorLab; cdecl; external libcolord;
function cd_color_rgb_new: PCdColorRGB; cdecl; external libcolord;
function cd_color_yxy_new: PCdColorYxy; cdecl; external libcolord;
function cd_color_uvw_new: PCdColorUVW; cdecl; external libcolord;
function cd_color_swatch_new: PCdColorSwatch; cdecl; external libcolord;
procedure cd_color_xyz_free(src: PCdColorXYZ); cdecl; external libcolord;
procedure cd_color_rgb_free(src: PCdColorRGB); cdecl; external libcolord;
procedure cd_color_lab_free(src: PCdColorLab); cdecl; external libcolord;
procedure cd_color_yxy_free(src: PCdColorYxy); cdecl; external libcolord;
procedure cd_color_uvw_free(src: PCdColorUVW); cdecl; external libcolord;
procedure cd_color_swatch_free(src: PCdColorSwatch); cdecl; external libcolord;
function cd_color_xyz_dup(src: PCdColorXYZ): PCdColorXYZ; cdecl; external libcolord;
function cd_color_lab_dup(src: PCdColorLab): PCdColorLab; cdecl; external libcolord;
function cd_color_rgb_dup(src: PCdColorRGB): PCdColorRGB; cdecl; external libcolord;
function cd_color_yxy_dup(src: PCdColorYxy): PCdColorYxy; cdecl; external libcolord;
function cd_color_uvw_dup(src: PCdColorUVW): PCdColorUVW; cdecl; external libcolord;
function cd_color_swatch_dup(src: PCdColorSwatch): PCdColorSwatch; cdecl; external libcolord;
procedure cd_color_xyz_set(dest: PCdColorXYZ; X: Tgdouble; Y: Tgdouble; Z: Tgdouble); cdecl; external libcolord;
procedure cd_color_rgb_set(dest: PCdColorRGB; R: Tgdouble; G: Tgdouble; B: Tgdouble); cdecl; external libcolord;
procedure cd_color_lab_set(dest: PCdColorLab; L: Tgdouble; a: Tgdouble; b: Tgdouble); cdecl; external libcolord;
procedure cd_color_yxy_set(dest: PCdColorYxy; Y: Tgdouble; x: Tgdouble; y2: Tgdouble); cdecl; external libcolord;
procedure cd_color_uvw_set(dest: PCdColorUVW; U: Tgdouble; V: Tgdouble; W: Tgdouble); cdecl; external libcolord;
procedure cd_color_swatch_set_name(dest: PCdColorSwatch; name: Pgchar); cdecl; external libcolord;
procedure cd_color_swatch_set_value(dest: PCdColorSwatch; value: PCdColorLab); cdecl; external libcolord;
procedure cd_color_xyz_copy(src: PCdColorXYZ; dest: PCdColorXYZ); cdecl; external libcolord;
procedure cd_color_yxy_copy(src: PCdColorYxy; dest: PCdColorYxy); cdecl; external libcolord;
procedure cd_color_uvw_copy(src: PCdColorUVW; dest: PCdColorUVW); cdecl; external libcolord;
procedure cd_color_lab_copy(src: PCdColorLab; dest: PCdColorLab); cdecl; external libcolord;
function cd_color_lab_delta_e76(p1: PCdColorLab; p2: PCdColorLab): Tgdouble; cdecl; external libcolord;
procedure cd_color_xyz_clear(dest: PCdColorXYZ); cdecl; external libcolord;
procedure cd_color_rgb_copy(src: PCdColorRGB; dest: PCdColorRGB); cdecl; external libcolord;
procedure cd_color_rgb8_to_rgb(src: PCdColorRGB8; dest: PCdColorRGB); cdecl; external libcolord;
procedure cd_color_rgb_to_rgb8(src: PCdColorRGB; dest: PCdColorRGB8); cdecl; external libcolord;
procedure cd_color_yxy_to_xyz(src: PCdColorYxy; dest: PCdColorXYZ); cdecl; external libcolord;
procedure cd_color_xyz_to_yxy(src: PCdColorXYZ; dest: PCdColorYxy); cdecl; external libcolord;
procedure cd_color_xyz_to_uvw(src: PCdColorXYZ; whitepoint: PCdColorXYZ; dest: PCdColorUVW); cdecl; external libcolord;
procedure cd_color_yxy_to_uvw(src: PCdColorYxy; dest: PCdColorUVW); cdecl; external libcolord;
procedure cd_color_uvw_set_planckian_locus(dest: PCdColorUVW; temp: Tgdouble); cdecl; external libcolord;
function cd_color_uvw_get_chroma_difference(p1: PCdColorUVW; p2: PCdColorUVW): Tgdouble; cdecl; external libcolord;
function cd_color_get_blackbody_rgb(temp: Tguint; result: PCdColorRGB): Tgboolean; cdecl; external libcolord;
function cd_color_get_blackbody_rgb_full(temp: Tgdouble; result: PCdColorRGB; flags: TCdColorBlackbodyFlags): Tgboolean; cdecl; external libcolord;
procedure cd_color_rgb_interpolate(p1: PCdColorRGB; p2: PCdColorRGB; index: Tgdouble; result: PCdColorRGB); cdecl; external libcolord;
procedure cd_color_rgb_from_wavelength(dest: PCdColorRGB; wavelength: Tgdouble); cdecl; external libcolord;
function cd_color_xyz_to_cct(src: PCdColorXYZ): Tgdouble; cdecl; external libcolord;
procedure cd_color_xyz_normalize(src: PCdColorXYZ; max: Tgdouble; dest: PCdColorXYZ); cdecl; external libcolord;
function cd_color_rgb_array_new: PGPtrArray; cdecl; external libcolord;
function cd_color_rgb_array_is_monotonic(arr: PGPtrArray): Tgboolean; cdecl; external libcolord;
function cd_color_rgb_array_interpolate(arr: PGPtrArray; new_length: Tguint): PGPtrArray; cdecl; external libcolord;

function CD_TYPE_COLOR_RGB: TGType;
function CD_TYPE_COLOR_XYZ: TGType;
function CD_TYPE_COLOR_LAB: TGType;
function CD_TYPE_COLOR_YXY: TGType;
function CD_TYPE_COLOR_UVW: TGType;
function CD_TYPE_COLOR_SWATCH: TGType;



// === Konventiert am: 1-11-25 16:08:29 ===


implementation


function CD_TYPE_COLOR_RGB: TGType;
begin
  CD_TYPE_COLOR_RGB := cd_color_rgb_get_type;
end;

function CD_TYPE_COLOR_XYZ: TGType;
begin
  CD_TYPE_COLOR_XYZ := cd_color_xyz_get_type;
end;

function CD_TYPE_COLOR_LAB: TGType;
begin
  CD_TYPE_COLOR_LAB := cd_color_lab_get_type;
end;

function CD_TYPE_COLOR_YXY: TGType;
begin
  CD_TYPE_COLOR_YXY := cd_color_yxy_get_type;
end;

function CD_TYPE_COLOR_UVW: TGType;
begin
  CD_TYPE_COLOR_UVW := cd_color_uvw_get_type;
end;

function CD_TYPE_COLOR_SWATCH: TGType;
begin
  CD_TYPE_COLOR_SWATCH := cd_color_swatch_get_type;
end;


end.
