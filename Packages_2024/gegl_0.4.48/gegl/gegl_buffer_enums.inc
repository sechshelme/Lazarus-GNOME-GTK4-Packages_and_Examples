

  {$IFDEF read_enum}
type
  PGeglAbyssPolicy = ^TGeglAbyssPolicy;
  TGeglAbyssPolicy = longint;
const
  GEGL_ABYSS_NONE = 0;
  GEGL_ABYSS_CLAMP = 1;
  GEGL_ABYSS_LOOP = 2;
  GEGL_ABYSS_BLACK = 3;
  GEGL_ABYSS_WHITE = 4;
  GEGL_BUFFER_FILTER_AUTO = 0;
  GEGL_BUFFER_FILTER_BILINEAR = 16;
  GEGL_BUFFER_FILTER_NEAREST = 32;
  GEGL_BUFFER_FILTER_BOX = 48;
  GEGL_BUFFER_FILTER_ALL = (GEGL_BUFFER_FILTER_BILINEAR or GEGL_BUFFER_FILTER_NEAREST) or GEGL_BUFFER_FILTER_BOX;

type
  PGeglAccessMode = ^TGeglAccessMode;
  TGeglAccessMode = longint;
const
  GEGL_ACCESS_READ = 1 shl 0;
  GEGL_ACCESS_WRITE = 1 shl 1;
  GEGL_ACCESS_READWRITE = GEGL_ACCESS_READ or GEGL_ACCESS_WRITE;

type
  PGeglSamplerType = ^TGeglSamplerType;
  TGeglSamplerType = longint;
const
  GEGL_SAMPLER_NEAREST = 0;
  GEGL_SAMPLER_LINEAR = 1;
  GEGL_SAMPLER_CUBIC = 2;
  GEGL_SAMPLER_NOHALO = 3;
  GEGL_SAMPLER_LOHALO = 4;

type
  PGeglRectangleAlignment = ^TGeglRectangleAlignment;
  TGeglRectangleAlignment = longint;
const
  GEGL_RECTANGLE_ALIGNMENT_SUBSET = 0;
  GEGL_RECTANGLE_ALIGNMENT_SUPERSET = 1;
  GEGL_RECTANGLE_ALIGNMENT_NEAREST = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gegl_abyss_policy_get_type: TGType; cdecl; external libgegl;
function gegl_access_mode_get_type: TGType; cdecl; external libgegl;
function gegl_sampler_type_get_type: TGType; cdecl; external libgegl;
function gegl_rectangle_alignment_get_type: TGType; cdecl; external libgegl;

function GEGL_TYPE_ABYSS_POLICY: TGType;
function GEGL_TYPE_ACCESS_MODE: TGType;
function GEGL_TYPE_SAMPLER_TYPE: TGType;
function GEGL_TYPE_RECTANGLE_ALIGNMENT: TGType;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:31:03 ===


{$IFDEF read_implementation}

function GEGL_TYPE_ABYSS_POLICY: TGType;
begin
  GEGL_TYPE_ABYSS_POLICY := gegl_abyss_policy_get_type;
end;

function GEGL_TYPE_ACCESS_MODE: TGType;
begin
  GEGL_TYPE_ACCESS_MODE := gegl_access_mode_get_type;
end;

function GEGL_TYPE_SAMPLER_TYPE: TGType;
begin
  GEGL_TYPE_SAMPLER_TYPE := gegl_sampler_type_get_type;
end;

function GEGL_TYPE_RECTANGLE_ALIGNMENT: TGType;
begin
  GEGL_TYPE_RECTANGLE_ALIGNMENT := gegl_rectangle_alignment_get_type;
end;

{$ENDIF read_implementation}
