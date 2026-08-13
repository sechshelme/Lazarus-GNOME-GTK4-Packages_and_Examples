unit gegl_color;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglColorPrivate = type Pointer;

  PGeglColor = ^TGeglColor;
  TGeglColor = record
    parent_instance: TGObject;
    priv: PGeglColorPrivate;
  end;

  PGeglColorClass = ^TGeglColorClass;
  TGeglColorClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_color_get_type: TGType; cdecl; external libgegl;
function gegl_color_new(_string: Pgchar): PGeglColor; cdecl; external libgegl;
function gegl_color_duplicate(color: PGeglColor): PGeglColor; cdecl; external libgegl;
procedure gegl_color_get_rgba(color: PGeglColor; red: Pgdouble; green: Pgdouble; blue: Pgdouble; alpha: Pgdouble); cdecl; external libgegl;
procedure gegl_color_set_rgba(color: PGeglColor; red: Tgdouble; green: Tgdouble; blue: Tgdouble; alpha: Tgdouble); cdecl; external libgegl;
procedure gegl_color_get_rgba_with_space(color: PGeglColor; red: Pgdouble; green: Pgdouble; blue: Pgdouble; alpha: Pgdouble; space: PBabl); cdecl; external libgegl;
procedure gegl_color_set_rgba_with_space(color: PGeglColor; red: Tgdouble; green: Tgdouble; blue: Tgdouble; alpha: Tgdouble; space: PBabl); cdecl; external libgegl;
procedure gegl_color_get_cmyk(color: PGeglColor; cyan: Pgdouble; magenta: Pgdouble; yellow: Pgdouble; key: Pgdouble; alpha: Pgdouble; space: PBabl); cdecl; external libgegl;
procedure gegl_color_set_cmyk(color: PGeglColor; cyan: Tgdouble; magenta: Tgdouble; yellow: Tgdouble; key: Tgdouble; alpha: Tgdouble; space: PBabl); cdecl; external libgegl;
procedure gegl_color_set_pixel(color: PGeglColor; format: PBabl; pixel: pointer); cdecl; external libgegl;
procedure gegl_color_get_pixel(color: PGeglColor; format: PBabl; pixel: pointer); cdecl; external libgegl;
procedure gegl_color_set_bytes(color: PGeglColor; format: PBabl; bytes: PGBytes); cdecl; external libgegl;
function gegl_color_get_bytes(color: PGeglColor; format: PBabl): PGBytes; cdecl; external libgegl;

function gegl_param_color_get_type: TGType; cdecl; external libgegl;

function gegl_param_spec_color(name: Pgchar; nick: Pgchar; blurb: Pgchar; default_color: PGeglColor; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
function gegl_param_spec_color_from_string(name: Pgchar; nick: Pgchar; blurb: Pgchar; default_color_string: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;
function gegl_param_spec_color_get_default(self: PGParamSpec): PGeglColor; cdecl; external libgegl;
function gegl_color_get_format(color: PGeglColor): PBabl; cdecl; external libgegl;

// === Konventiert am: 12-8-26 14:47:50 ===

function GEGL_TYPE_COLOR: TGType;
function GEGL_COLOR(obj: Pointer): PGeglColor;
function GEGL_COLOR_CLASS(klass: Pointer): PGeglColorClass;
function GEGL_IS_COLOR(obj: Pointer): Tgboolean;
function GEGL_IS_COLOR_CLASS(klass: Pointer): Tgboolean;
function GEGL_COLOR_GET_CLASS(obj: Pointer): PGeglColorClass;

function GEGL_TYPE_PARAM_COLOR: TGType;
function GEGL_IS_PARAM_SPEC_COLOR(pspec: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GEGL_TYPE_COLOR: TGType;
begin
  GEGL_TYPE_COLOR := gegl_color_get_type;
end;

function GEGL_COLOR(obj: Pointer): PGeglColor;
begin
  Result := PGeglColor(g_type_check_instance_cast(obj, GEGL_TYPE_COLOR));
end;

function GEGL_COLOR_CLASS(klass: Pointer): PGeglColorClass;
begin
  Result := PGeglColorClass(g_type_check_class_cast(klass, GEGL_TYPE_COLOR));
end;

function GEGL_IS_COLOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_COLOR);
end;

function GEGL_IS_COLOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_COLOR);
end;

function GEGL_COLOR_GET_CLASS(obj: Pointer): PGeglColorClass;
begin
  Result := PGeglColorClass(PGTypeInstance(obj)^.g_class);
end;


function GEGL_TYPE_PARAM_COLOR: TGType;
begin
  GEGL_TYPE_PARAM_COLOR := gegl_param_color_get_type;
end;

function GEGL_IS_PARAM_SPEC_COLOR(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_COLOR);
end;

end.
