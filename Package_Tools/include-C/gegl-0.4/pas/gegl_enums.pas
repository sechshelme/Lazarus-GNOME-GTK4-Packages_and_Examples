unit gegl_enums;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGeglDitherMethod = ^TGeglDitherMethod;
  TGeglDitherMethod = longint;
const
  GEGL_DITHER_NONE = 0;
  GEGL_DITHER_FLOYD_STEINBERG = 1;
  GEGL_DITHER_BAYER = 2;
  GEGL_DITHER_RANDOM = 3;
  GEGL_DITHER_RANDOM_COVARIANT = 4;
  GEGL_DITHER_ARITHMETIC_ADD = 5;
  GEGL_DITHER_ARITHMETIC_ADD_COVARIANT = 6;
  GEGL_DITHER_ARITHMETIC_XOR = 7;
  GEGL_DITHER_ARITHMETIC_XOR_COVARIANT = 8;
  GEGL_DITHER_BLUE_NOISE = 9;
  GEGL_DITHER_BLUE_NOISE_COVARIANT = 10;

type
  PGeglDistanceMetric = ^TGeglDistanceMetric;
  TGeglDistanceMetric = longint;
const
  GEGL_DISTANCE_METRIC_EUCLIDEAN = 0;
  GEGL_DISTANCE_METRIC_MANHATTAN = 1;
  GEGL_DISTANCE_METRIC_CHEBYSHEV = 2;

type
  PGeglOrientation = ^TGeglOrientation;
  TGeglOrientation = longint;
const
  GEGL_ORIENTATION_HORIZONTAL = 0;
  GEGL_ORIENTATION_VERTICAL = 1;

type
  PGeglBablVariant = ^TGeglBablVariant;
  TGeglBablVariant = longint;
const
  GEGL_BABL_VARIANT_FLOAT = 0;
  GEGL_BABL_VARIANT_LINEAR = 1;
  GEGL_BABL_VARIANT_NONLINEAR = 2;
  GEGL_BABL_VARIANT_PERCEPTUAL = 3;
  GEGL_BABL_VARIANT_LINEAR_PREMULTIPLIED = 4;
  GEGL_BABL_VARIANT_PERCEPTUAL_PREMULTIPLIED = 5;
  GEGL_BABL_VARIANT_LINEAR_PREMULTIPLIED_IF_ALPHA = 6;
  GEGL_BABL_VARIANT_PERCEPTUAL_PREMULTIPLIED_IF_ALPHA = 7;
  GEGL_BABL_VARIANT_ALPHA = 8;

type
  PGeglCachePolicy = ^TGeglCachePolicy;
  TGeglCachePolicy = longint;
const
  GEGL_CACHE_POLICY_AUTO = 0;
  GEGL_CACHE_POLICY_NEVER = 1;
  GEGL_CACHE_POLICY_ALWAYS = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gegl_dither_method_get_type: TGType; cdecl; external libgegl;
function gegl_distance_metric_get_type: TGType; cdecl; external libgegl;
function gegl_orientation_get_type: TGType; cdecl; external libgegl;
function gegl_babl_variant_get_type: TGType; cdecl; external libgegl;
function gegl_cache_policy_get_type: TGType; cdecl; external libgegl;

function GEGL_TYPE_DITHER_METHOD: TGType;
function GEGL_TYPE_DISTANCE_METRIC: TGType;
function GEGL_TYPE_ORIENTATION: TGType;
function GEGL_TYPE_BABL_VARIANT: TGType;
function GEGL_TYPE_CACHE_POLICY: TGType;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:47:18 ===

implementation

function GEGL_TYPE_DITHER_METHOD: TGType;
begin
  GEGL_TYPE_DITHER_METHOD := gegl_dither_method_get_type;
end;

function GEGL_TYPE_DISTANCE_METRIC: TGType;
begin
  GEGL_TYPE_DISTANCE_METRIC := gegl_distance_metric_get_type;
end;

function GEGL_TYPE_ORIENTATION: TGType;
begin
  GEGL_TYPE_ORIENTATION := gegl_orientation_get_type;
end;

function GEGL_TYPE_BABL_VARIANT: TGType;
begin
  GEGL_TYPE_BABL_VARIANT := gegl_babl_variant_get_type;
end;

function GEGL_TYPE_CACHE_POLICY: TGType;
begin
  GEGL_TYPE_CACHE_POLICY := gegl_cache_policy_get_type;
end;

end.
