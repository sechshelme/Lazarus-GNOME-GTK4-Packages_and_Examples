{$IFDEF read_interface}



type
  PCdTransformError = ^TCdTransformError;
  TCdTransformError = longint;

const
  CD_TRANSFORM_ERROR_FAILED_TO_SETUP_TRANSFORM = 0;
  CD_TRANSFORM_ERROR_INVALID_COLORSPACE = 1;
  CD_TRANSFORM_ERROR_LAST = 2;

type
  TCdTransformClass = record
    parent_class: TGObjectClass;
    _cd_transform_reserved1: procedure; cdecl;
    _cd_transform_reserved2: procedure; cdecl;
    _cd_transform_reserved3: procedure; cdecl;
    _cd_transform_reserved4: procedure; cdecl;
    _cd_transform_reserved5: procedure; cdecl;
    _cd_transform_reserved6: procedure; cdecl;
    _cd_transform_reserved7: procedure; cdecl;
    _cd_transform_reserved8: procedure; cdecl;
  end;
  PCdTransformClass = ^TCdTransformClass;

type
  TCdTransform = record
    parent_instance: TGObject;
  end;
  PCdTransform = ^TCdTransform;

function cd_transform_get_type: TGType; cdecl; external libcolord;
function cd_transform_error_quark: TGQuark; cdecl; external libcolord;
function cd_transform_new: PCdTransform; cdecl; external libcolord;
procedure cd_transform_set_input_icc(transform: PCdTransform; icc: PCdIcc); cdecl; external libcolord;
procedure cd_transform_set_input_pixel_format(transform: PCdTransform; pixel_format: TCdPixelFormat); cdecl; external libcolord;
function cd_transform_get_input_icc(transform: PCdTransform): PCdIcc; cdecl; external libcolord;
function cd_transform_get_input_pixel_format(transform: PCdTransform): TCdPixelFormat; cdecl; external libcolord;
procedure cd_transform_set_output_icc(transform: PCdTransform; icc: PCdIcc); cdecl; external libcolord;
procedure cd_transform_set_output_pixel_format(transform: PCdTransform; pixel_format: TCdPixelFormat); cdecl; external libcolord;
function cd_transform_get_output_icc(transform: PCdTransform): PCdIcc; cdecl; external libcolord;
function cd_transform_get_output_pixel_format(transform: PCdTransform): TCdPixelFormat; cdecl; external libcolord;
procedure cd_transform_set_abstract_icc(transform: PCdTransform; icc: PCdIcc); cdecl; external libcolord;
function cd_transform_get_abstract_icc(transform: PCdTransform): PCdIcc; cdecl; external libcolord;
procedure cd_transform_set_rendering_intent(transform: PCdTransform; rendering_intent: TCdRenderingIntent); cdecl; external libcolord;
function cd_transform_get_rendering_intent(transform: PCdTransform): TCdRenderingIntent; cdecl; external libcolord;
procedure cd_transform_set_bpc(transform: PCdTransform; bpc: Tgboolean); cdecl; external libcolord;
function cd_transform_get_bpc(transform: PCdTransform): Tgboolean; cdecl; external libcolord;
procedure cd_transform_set_max_threads(transform: PCdTransform; max_threads: Tguint); cdecl; external libcolord;
function cd_transform_get_max_threads(transform: PCdTransform): Tguint; cdecl; external libcolord;
function cd_transform_process(transform: PCdTransform; data_in: Tgpointer; data_out: Tgpointer; width: Tguint; height: Tguint;
  rowstride: Tguint; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:02:56 ===

function CD_TYPE_TRANSFORM: TGType;
function CD_TRANSFORM(obj: Pointer): PCdTransform;
function CD_IS_TRANSFORM(obj: Pointer): Tgboolean;
function CD_TRANSFORM_CLASS(klass: Pointer): PCdTransformClass;
function CD_IS_TRANSFORM_CLASS(klass: Pointer): Tgboolean;
function CD_TRANSFORM_GET_CLASS(obj: Pointer): PCdTransformClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function CD_TYPE_TRANSFORM: TGType;
begin
  Result := cd_transform_get_type;
end;

function CD_TRANSFORM(obj: Pointer): PCdTransform;
begin
  Result := PCdTransform(g_type_check_instance_cast(obj, CD_TYPE_TRANSFORM));
end;

function CD_IS_TRANSFORM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_TRANSFORM);
end;

function CD_TRANSFORM_CLASS(klass: Pointer): PCdTransformClass;
begin
  Result := PCdTransformClass(g_type_check_class_cast(klass, CD_TYPE_TRANSFORM));
end;

function CD_IS_TRANSFORM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_TRANSFORM);
end;

function CD_TRANSFORM_GET_CLASS(obj: Pointer): PCdTransformClass;
begin
  Result := PCdTransformClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
