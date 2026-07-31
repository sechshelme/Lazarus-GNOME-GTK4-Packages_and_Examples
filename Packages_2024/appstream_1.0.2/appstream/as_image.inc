

  {$IFDEF read_enum}
type
  PAsImageKind = ^TAsImageKind;
  TAsImageKind = longint;
const
  AS_IMAGE_KIND_UNKNOWN = 0;
  AS_IMAGE_KIND_SOURCE = 1;
  AS_IMAGE_KIND_THUMBNAIL = 2;
  AS_IMAGE_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsImage = record
    parent_instance: TGObject;
  end;
  PAsImage = ^TAsImage;

  PAsImageClass = ^TAsImageClass;
  TAsImageClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_image_get_type: TGType; cdecl; external libappstream;
function as_image_kind_from_string(kind: Pgchar): TAsImageKind; cdecl; external libappstream;
function as_image_kind_to_string(kind: TAsImageKind): Pgchar; cdecl; external libappstream;
function as_image_new: PAsImage; cdecl; external libappstream;
function as_image_get_kind(image: PAsImage): TAsImageKind; cdecl; external libappstream;
procedure as_image_set_kind(image: PAsImage; kind: TAsImageKind); cdecl; external libappstream;
function as_image_get_url(image: PAsImage): Pgchar; cdecl; external libappstream;
procedure as_image_set_url(image: PAsImage; url: Pgchar); cdecl; external libappstream;
function as_image_get_width(image: PAsImage): Tguint; cdecl; external libappstream;
procedure as_image_set_width(image: PAsImage; width: Tguint); cdecl; external libappstream;
function as_image_get_height(image: PAsImage): Tguint; cdecl; external libappstream;
procedure as_image_set_height(image: PAsImage; height: Tguint); cdecl; external libappstream;
function as_image_get_scale(image: PAsImage): Tguint; cdecl; external libappstream;
procedure as_image_set_scale(image: PAsImage; scale: Tguint); cdecl; external libappstream;
function as_image_get_locale(image: PAsImage): Pgchar; cdecl; external libappstream;
procedure as_image_set_locale(image: PAsImage; locale: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:56 ===

function AS_TYPE_IMAGE: TGType;
function AS_IMAGE(obj: Pointer): PAsImage;
function AS_IS_IMAGE(obj: Pointer): Tgboolean;
function AS_IMAGE_CLASS(klass: Pointer): PAsImageClass;
function AS_IS_IMAGE_CLASS(klass: Pointer): Tgboolean;
function AS_IMAGE_GET_CLASS(obj: Pointer): PAsImageClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_IMAGE: TGType;
begin
  Result := as_image_get_type;
end;

function AS_IMAGE(obj: Pointer): PAsImage;
begin
  Result := PAsImage(g_type_check_instance_cast(obj, AS_TYPE_IMAGE));
end;

function AS_IS_IMAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_IMAGE);
end;

function AS_IMAGE_CLASS(klass: Pointer): PAsImageClass;
begin
  Result := PAsImageClass(g_type_check_class_cast(klass, AS_TYPE_IMAGE));
end;

function AS_IS_IMAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_IMAGE);
end;

function AS_IMAGE_GET_CLASS(obj: Pointer): PAsImageClass;
begin
  Result := PAsImageClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
