

  {$IFDEF read_enum}
type
  PAsColorKind = ^TAsColorKind;
  TAsColorKind = longint;
const
  AS_COLOR_KIND_UNKNOWN = 0;
  AS_COLOR_KIND_PRIMARY = 1;
  AS_COLOR_KIND_LAST = 2;

type
  PAsColorSchemeKind = ^TAsColorSchemeKind;
  TAsColorSchemeKind = longint;
const
  AS_COLOR_SCHEME_KIND_UNKNOWN = 0;
  AS_COLOR_SCHEME_KIND_LIGHT = 1;
  AS_COLOR_SCHEME_KIND_DARK = 2;
  AS_COLOR_SCHEME_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PAsBrandingColorIter = ^TAsBrandingColorIter;
  TAsBrandingColorIter = record
    dummy1: Tgpointer;
    dummy2: Tguint;
    dummy3: Tgpointer;
    dummy4: Tgpointer;
    dummy5: Tgpointer;
    dummy6: Tgpointer;
  end;

type
  TAsBranding = record
    parent_instance: TGObject;
  end;
  PAsBranding = ^TAsBranding;

  PAsBrandingClass = ^TAsBrandingClass;
  TAsBrandingClass = record
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
function as_branding_get_type: TGType; cdecl; external libappstream;
function as_color_kind_to_string(kind: TAsColorKind): Pgchar; cdecl; external libappstream;
function as_color_kind_from_string(str: Pgchar): TAsColorKind; cdecl; external libappstream;
function as_color_scheme_kind_to_string(kind: TAsColorSchemeKind): Pgchar; cdecl; external libappstream;
function as_color_scheme_kind_from_string(str: Pgchar): TAsColorSchemeKind; cdecl; external libappstream;
function as_branding_new: PAsBranding; cdecl; external libappstream;
procedure as_branding_set_color(branding: PAsBranding; kind: TAsColorKind; scheme_preference: TAsColorSchemeKind; colorcode: Pgchar); cdecl; external libappstream;
procedure as_branding_remove_color(branding: PAsBranding; kind: TAsColorKind; scheme_preference: TAsColorSchemeKind); cdecl; external libappstream;
procedure as_branding_color_iter_init(iter: PAsBrandingColorIter; branding: PAsBranding); cdecl; external libappstream;
function as_branding_color_iter_next(iter: PAsBrandingColorIter; kind: PAsColorKind; scheme_preference: PAsColorSchemeKind; value: PPgchar): Tgboolean; cdecl; external libappstream;
function as_branding_get_color(branding: PAsBranding; kind: TAsColorKind; scheme_kind: TAsColorSchemeKind): Pgchar; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:51 ===

function AS_TYPE_BRANDING: TGType;
function AS_BRANDING(obj: Pointer): PAsBranding;
function AS_IS_BRANDING(obj: Pointer): Tgboolean;
function AS_BRANDING_CLASS(klass: Pointer): PAsBrandingClass;
function AS_IS_BRANDING_CLASS(klass: Pointer): Tgboolean;
function AS_BRANDING_GET_CLASS(obj: Pointer): PAsBrandingClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_BRANDING: TGType;
begin
  Result := as_branding_get_type;
end;

function AS_BRANDING(obj: Pointer): PAsBranding;
begin
  Result := PAsBranding(g_type_check_instance_cast(obj, AS_TYPE_BRANDING));
end;

function AS_IS_BRANDING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_BRANDING);
end;

function AS_BRANDING_CLASS(klass: Pointer): PAsBrandingClass;
begin
  Result := PAsBrandingClass(g_type_check_class_cast(klass, AS_TYPE_BRANDING));
end;

function AS_IS_BRANDING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_BRANDING);
end;

function AS_BRANDING_GET_CLASS(obj: Pointer): PAsBrandingClass;
begin
  Result := PAsBrandingClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
