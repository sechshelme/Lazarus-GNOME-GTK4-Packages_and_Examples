

  {$IFDEF read_enum}
const
  GEGL_PARAM_NO_VALIDATE = 1 shl (6 + G_PARAM_USER_SHIFT);
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglParamSpecDouble = ^TGeglParamSpecDouble;
  TGeglParamSpecDouble = record
    parent_instance: TGParamSpecDouble;
    ui_minimum: Tgdouble;
    ui_maximum: Tgdouble;
    ui_gamma: Tgdouble;
    ui_step_small: Tgdouble;
    ui_step_big: Tgdouble;
    ui_digits: Tgint;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_double_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_double(name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgdouble; maximum: Tgdouble;
  default_value: Tgdouble; ui_minimum: Tgdouble; ui_maximum: Tgdouble; ui_gamma: Tgdouble; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
procedure gegl_param_spec_double_set_steps(pspec: PGeglParamSpecDouble; small_step: Tgdouble; big_step: Tgdouble); cdecl; external libgegl;
procedure gegl_param_spec_double_set_digits(pspec: PGeglParamSpecDouble; digits: Tgint); cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecInt = ^TGeglParamSpecInt;
  TGeglParamSpecInt = record
    parent_instance: TGParamSpecInt;
    ui_minimum: Tgint;
    ui_maximum: Tgint;
    ui_gamma: Tgdouble;
    ui_step_small: Tgint;
    ui_step_big: Tgint;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_int_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_int(name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgint; maximum: Tgint;
  default_value: Tgint; ui_minimum: Tgint; ui_maximum: Tgint; ui_gamma: Tgdouble; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
procedure gegl_param_spec_int_set_steps(pspec: PGeglParamSpecInt; small_step: Tgint; big_step: Tgint); cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecString = ^TGeglParamSpecString;
  TGeglParamSpecString = bitpacked record
    parent_instance: TGParamSpecString;
    no_validate: 0..1;
    null_ok: 0..1;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_string_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_string(name: Pgchar; nick: Pgchar; blurb: Pgchar; no_validate: Tgboolean; null_ok: Tgboolean;
  default_value: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecFilePath = ^TGeglParamSpecFilePath;
  TGeglParamSpecFilePath = bitpacked record
    parent_instance: TGParamSpecString;
    no_validate: 0..1;
    null_ok: 0..1;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_file_path_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_file_path(name: Pgchar; nick: Pgchar; blurb: Pgchar; no_validate: Tgboolean; null_ok: Tgboolean;
  default_value: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecEnum = ^TGeglParamSpecEnum;
  TGeglParamSpecEnum = record
    parent_instance: TGParamSpecEnum;
    excluded_values: PGSList;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_enum_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_enum(name: Pgchar; nick: Pgchar; blurb: Pgchar; enum_type: TGType; default_value: Tgint;
  flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
procedure gegl_param_spec_enum_exclude_value(espec: PGeglParamSpecEnum; value: Tgint); cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecSeed = ^TGeglParamSpecSeed;
  TGeglParamSpecSeed = record
    parent_instance: TGParamSpecUInt;
    ui_minimum: Tguint;
    ui_maximum: Tguint;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_seed_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_seed(name: Pgchar; nick: Pgchar; blurb: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecFormat = ^TGeglParamSpecFormat;
  TGeglParamSpecFormat = record
    parent_instance: TGParamSpecPointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_format_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_format(name: Pgchar; nick: Pgchar; blurb: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGeglParamSpecUri = ^TGeglParamSpecUri;
  TGeglParamSpecUri = bitpacked record
    parent_instance: TGParamSpecString;
    no_validate: 0..1;
    null_ok: 0..1;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_param_uri_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_uri(name: Pgchar; nick: Pgchar; blurb: Pgchar; no_validate: Tgboolean; null_ok: Tgboolean;
  default_value: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:25:15 ===

function GEGL_TYPE_PARAM_DOUBLE: TGType;
function GEGL_PARAM_SPEC_DOUBLE(pspec: Pointer): PGeglParamSpecDouble;
function GEGL_IS_PARAM_SPEC_DOUBLE(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_INT: TGType;
function GEGL_PARAM_SPEC_INT(pspec: Pointer): PGeglParamSpecInt;
function GEGL_IS_PARAM_SPEC_INT(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_STRING: TGType;
function GEGL_PARAM_SPEC_STRING(pspec: Pointer): PGeglParamSpecString;
function GEGL_IS_PARAM_SPEC_STRING(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_FILE_PATH: TGType;
function GEGL_PARAM_SPEC_FILE_PATH(pspec: Pointer): PGeglParamSpecFilePath;
function GEGL_IS_PARAM_SPEC_FILE_PATH(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_ENUM: TGType;
function GEGL_PARAM_SPEC_ENUM(pspec: Pointer): PGeglParamSpecEnum;
function GEGL_IS_PARAM_SPEC_ENUM(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_SEED: TGType;
function GEGL_PARAM_SPEC_SEED(pspec: Pointer): PGeglParamSpecSeed;
function GEGL_IS_PARAM_SPEC_SEED(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_FORMAT: TGType;
function GEGL_PARAM_SPEC_FORMAT(pspec: Pointer): PGeglParamSpecFormat;
function GEGL_IS_PARAM_SPEC_FORMAT(pspec: Pointer): Tgboolean;

function GEGL_TYPE_PARAM_URI: TGType;
function GEGL_PARAM_SPEC_URI(pspec: Pointer): PGeglParamSpecUri;
function GEGL_IS_PARAM_SPEC_URI(pspec: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_PARAM_DOUBLE: TGType;
begin
  Result := gegl_param_double_get_type;
end;

function GEGL_PARAM_SPEC_DOUBLE(pspec: Pointer): PGeglParamSpecDouble;
begin
  Result := PGeglParamSpecDouble(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_DOUBLE));
end;

function GEGL_IS_PARAM_SPEC_DOUBLE(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_DOUBLE);
end;


function GEGL_TYPE_PARAM_INT: TGType;
begin
  Result := gegl_param_int_get_type;
end;

function GEGL_PARAM_SPEC_INT(pspec: Pointer): PGeglParamSpecInt;
begin
  Result := PGeglParamSpecInt(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_INT));
end;

function GEGL_IS_PARAM_SPEC_INT(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_INT);
end;


function GEGL_TYPE_PARAM_STRING: TGType;
begin
  Result := gegl_param_string_get_type;
end;

function GEGL_PARAM_SPEC_STRING(pspec: Pointer): PGeglParamSpecString;
begin
  Result := PGeglParamSpecString(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_STRING));
end;

function GEGL_IS_PARAM_SPEC_STRING(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_STRING);
end;


function GEGL_TYPE_PARAM_FILE_PATH: TGType;
begin
  Result := gegl_param_file_path_get_type;
end;

function GEGL_PARAM_SPEC_FILE_PATH(pspec: Pointer): PGeglParamSpecFilePath;
begin
  Result := PGeglParamSpecFilePath(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_FILE_PATH));
end;

function GEGL_IS_PARAM_SPEC_FILE_PATH(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_FILE_PATH);
end;


function GEGL_TYPE_PARAM_ENUM: TGType;
begin
  Result := gegl_param_enum_get_type;
end;

function GEGL_PARAM_SPEC_ENUM(pspec: Pointer): PGeglParamSpecEnum;
begin
  Result := PGeglParamSpecEnum(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_ENUM));
end;

function GEGL_IS_PARAM_SPEC_ENUM(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_ENUM);
end;


function GEGL_TYPE_PARAM_SEED: TGType;
begin
  Result := gegl_param_seed_get_type;
end;

function GEGL_PARAM_SPEC_SEED(pspec: Pointer): PGeglParamSpecSeed;
begin
  Result := PGeglParamSpecSeed(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_SEED));
end;

function GEGL_IS_PARAM_SPEC_SEED(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_SEED);
end;


function GEGL_TYPE_PARAM_FORMAT: TGType;
begin
  Result := gegl_param_format_get_type;
end;

function GEGL_PARAM_SPEC_FORMAT(pspec: Pointer): PGeglParamSpecFormat;
begin
  Result := PGeglParamSpecFormat(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_FORMAT));
end;

function GEGL_IS_PARAM_SPEC_FORMAT(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_FORMAT);
end;


function GEGL_TYPE_PARAM_URI: TGType;
begin
  Result := gegl_param_uri_get_type;
end;

function GEGL_PARAM_SPEC_URI(pspec: Pointer): PGeglParamSpecUri;
begin
  Result := PGeglParamSpecUri(g_type_check_instance_cast(pspec, GEGL_TYPE_PARAM_URI));
end;

function GEGL_IS_PARAM_SPEC_URI(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_URI);
end;

{$ENDIF read_implementation}
