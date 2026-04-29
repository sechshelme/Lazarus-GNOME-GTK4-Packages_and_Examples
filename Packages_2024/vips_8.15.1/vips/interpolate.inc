

  {$IFDEF read_struct}
type
  TVipsInterpolate = record
    parent_object: TVipsObject;
  end;
  PVipsInterpolate = ^TVipsInterpolate;

  TVipsInterpolateMethod = procedure(interpolate: PVipsInterpolate; out_: pointer; in_: PVipsRegion; x: double; y: double); cdecl;

  TVipsInterpolateClass = record
    parent_class: TVipsObjectClass;
    interpolate: TVipsInterpolateMethod;
    get_window_size: function(interpolate: PVipsInterpolate): longint; cdecl;
    window_size: longint;
    get_window_offset: function(interpolate: PVipsInterpolate): longint; cdecl;
    window_offset: longint;
  end;
  PVipsInterpolateClass = ^TVipsInterpolateClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_interpolate_get_type: TGType; cdecl; external libvips;
procedure vips_interpolate(interpolate: PVipsInterpolate; out_: pointer; in_: PVipsRegion; x: double; y: double); cdecl; external libvips;
function vips_interpolate_get_method(interpolate: PVipsInterpolate): TVipsInterpolateMethod; cdecl; external libvips;
function vips_interpolate_get_window_size(interpolate: PVipsInterpolate): longint; cdecl; external libvips;
function vips_interpolate_get_window_offset(interpolate: PVipsInterpolate): longint; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
const
  VIPS_TRANSFORM_SHIFT = 6;
  VIPS_TRANSFORM_SCALE = 1 shl VIPS_TRANSFORM_SHIFT;
  VIPS_INTERPOLATE_SHIFT = 12;
  VIPS_INTERPOLATE_SCALE = 1 shl VIPS_INTERPOLATE_SHIFT;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_interpolate_nearest_static: PVipsInterpolate; cdecl; external libvips;
function vips_interpolate_bilinear_static: PVipsInterpolate; cdecl; external libvips;
function vips_interpolate_new(nickname: pchar): PVipsInterpolate; cdecl; external libvips;

// === Konventiert am: 26-4-26 16:12:52 ===

function VIPS_TYPE_INTERPOLATE: TGType;
function VIPS_INTERPOLATE(obj: Pointer): PVipsInterpolate;
function VIPS_INTERPOLATE_CLASS(klass: Pointer): PVipsInterpolateClass;
function VIPS_IS_INTERPOLATE(obj: Pointer): Tgboolean;
function VIPS_IS_INTERPOLATE_CLASS(klass: Pointer): Tgboolean;
function VIPS_INTERPOLATE_GET_CLASS(obj: Pointer): PVipsInterpolateClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function VIPS_TYPE_INTERPOLATE: TGType;
begin
  VIPS_TYPE_INTERPOLATE := vips_interpolate_get_type;
end;

function VIPS_INTERPOLATE(obj: Pointer): PVipsInterpolate;
begin
  Result := PVipsInterpolate(g_type_check_instance_cast(obj, VIPS_TYPE_INTERPOLATE));
end;

function VIPS_INTERPOLATE_CLASS(klass: Pointer): PVipsInterpolateClass;
begin
  Result := PVipsInterpolateClass(g_type_check_class_cast(klass, VIPS_TYPE_INTERPOLATE));
end;

function VIPS_IS_INTERPOLATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_INTERPOLATE);
end;

function VIPS_IS_INTERPOLATE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_INTERPOLATE);
end;

function VIPS_INTERPOLATE_GET_CLASS(obj: Pointer): PVipsInterpolateClass;
begin
  Result := PVipsInterpolateClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
