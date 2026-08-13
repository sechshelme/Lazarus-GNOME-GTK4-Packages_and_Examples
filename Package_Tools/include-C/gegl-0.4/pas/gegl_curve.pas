unit gegl_curve;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglCurve = ^TGeglCurve;
  TGeglCurve = record
    parent_instance: TGObject;
  end;

  PGeglCurveClass = ^TGeglCurveClass;
  TGeglCurveClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_curve_get_type: TGType; cdecl; external libgegl;
function gegl_curve_new(y_min: Tgdouble; y_max: Tgdouble): PGeglCurve; cdecl; external libgegl;
function gegl_curve_new_default: PGeglCurve; cdecl; external libgegl;
function gegl_curve_duplicate(curve: PGeglCurve): PGeglCurve; cdecl; external libgegl;
procedure gegl_curve_get_y_bounds(curve: PGeglCurve; min_y: Pgdouble; max_y: Pgdouble); cdecl; external libgegl;
function gegl_curve_add_point(curve: PGeglCurve; x: Tgdouble; y: Tgdouble): Tguint; cdecl; external libgegl;
procedure gegl_curve_get_point(curve: PGeglCurve; index: Tguint; x: Pgdouble; y: Pgdouble); cdecl; external libgegl;
procedure gegl_curve_set_point(curve: PGeglCurve; index: Tguint; x: Tgdouble; y: Tgdouble); cdecl; external libgegl;
function gegl_curve_num_points(curve: PGeglCurve): Tguint; cdecl; external libgegl;
function gegl_curve_calc_value(curve: PGeglCurve; x: Tgdouble): Tgdouble; cdecl; external libgegl;
procedure gegl_curve_calc_values(curve: PGeglCurve; x_min: Tgdouble; x_max: Tgdouble; num_samples: Tguint; xs: Pgdouble; ys: Pgdouble); cdecl; external libgegl;

function gegl_param_curve_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_curve(name: Pgchar; nick: Pgchar; blurb: Pgchar; default_curve: PGeglCurve; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;

// === Konventiert am: 12-8-26 14:47:31 ===

function GEGL_TYPE_CURVE: TGType;
function GEGL_CURVE(obj: Pointer): PGeglCurve;
function GEGL_CURVE_CLASS(klass: Pointer): PGeglCurveClass;
function GEGL_IS_CURVE(obj: Pointer): Tgboolean;
function GEGL_IS_CURVE_CLASS(klass: Pointer): Tgboolean;
function GEGL_CURVE_GET_CLASS(obj: Pointer): PGeglCurveClass;

function GEGL_TYPE_PARAM_CURVE: TGType;
function GEGL_IS_PARAM_SPEC_CURVE(pspec: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GEGL_TYPE_CURVE: TGType;
begin
  GEGL_TYPE_CURVE := gegl_curve_get_type;
end;

function GEGL_CURVE(obj: Pointer): PGeglCurve;
begin
  Result := PGeglCurve(g_type_check_instance_cast(obj, GEGL_TYPE_CURVE));
end;

function GEGL_CURVE_CLASS(klass: Pointer): PGeglCurveClass;
begin
  Result := PGeglCurveClass(g_type_check_class_cast(klass, GEGL_TYPE_CURVE));
end;

function GEGL_IS_CURVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_CURVE);
end;

function GEGL_IS_CURVE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_CURVE);
end;

function GEGL_CURVE_GET_CLASS(obj: Pointer): PGeglCurveClass;
begin
  Result := PGeglCurveClass(PGTypeInstance(obj)^.g_class);
end;


function GEGL_TYPE_PARAM_CURVE: TGType;
begin
  GEGL_TYPE_PARAM_CURVE := gegl_param_curve_get_type;
end;

function GEGL_IS_PARAM_SPEC_CURVE(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_CURVE);
end;

end.
