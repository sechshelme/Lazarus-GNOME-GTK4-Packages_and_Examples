unit as_context;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsFormatVersion = ^TAsFormatVersion;
  TAsFormatVersion = longint;
const
  AS_FORMAT_VERSION_UNKNOWN = 0;
  AS_FORMAT_VERSION_V1_0 = 1;
  AS_FORMAT_VERSION_LAST = 2;
const
  AS_FORMAT_VERSION_LATEST = AS_FORMAT_VERSION_V1_0;

type
  PAsFormatStyle = ^TAsFormatStyle;
  TAsFormatStyle = longint;
const
  AS_FORMAT_STYLE_UNKNOWN = 0;
  AS_FORMAT_STYLE_METAINFO = 1;
  AS_FORMAT_STYLE_CATALOG = 2;
  AS_FORMAT_STYLE_LAST = 3;

type
  PAsFormatKind = ^TAsFormatKind;
  TAsFormatKind = longint;
const
  AS_FORMAT_KIND_UNKNOWN = 0;
  AS_FORMAT_KIND_XML = 1;
  AS_FORMAT_KIND_YAML = 2;
  AS_FORMAT_KIND_DESKTOP_ENTRY = 3;
  AS_FORMAT_KIND_LAST = 4;

type
  PAsValueFlags = ^TAsValueFlags;
  TAsValueFlags = longint;
const
  AS_VALUE_FLAG_NONE = 0;
  AS_VALUE_FLAG_DUPLICATE_CHECK = 1 shl 0;
  AS_VALUE_FLAG_NO_TRANSLATION_FALLBACK = 1 shl 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsContext = record
    parent_instance: TGObject;
  end;
  PAsContext = ^TAsContext;

  PAsContextClass = ^TAsContextClass;
  TAsContextClass = record
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
function as_context_get_type: TGType; cdecl; external libappstream;
function as_format_version_to_string(version: TAsFormatVersion): Pgchar; cdecl; external libappstream;
function as_format_version_from_string(version_str: Pgchar): TAsFormatVersion; cdecl; external libappstream;

function as_format_kind_to_string(kind: TAsFormatKind): Pgchar; cdecl; external libappstream;
function as_format_kind_from_string(kind_str: Pgchar): TAsFormatKind; cdecl; external libappstream;

function as_context_new: PAsContext; cdecl; external libappstream;
function as_context_get_format_version(ctx: PAsContext): TAsFormatVersion; cdecl; external libappstream;
procedure as_context_set_format_version(ctx: PAsContext; ver: TAsFormatVersion); cdecl; external libappstream;
function as_context_get_style(ctx: PAsContext): TAsFormatStyle; cdecl; external libappstream;
procedure as_context_set_style(ctx: PAsContext; style: TAsFormatStyle); cdecl; external libappstream;
function as_context_get_priority(ctx: PAsContext): Tgint; cdecl; external libappstream;
procedure as_context_set_priority(ctx: PAsContext; priority: Tgint); cdecl; external libappstream;
function as_context_get_origin(ctx: PAsContext): Pgchar; cdecl; external libappstream;
procedure as_context_set_origin(ctx: PAsContext; value: Pgchar); cdecl; external libappstream;
function as_context_get_locale(ctx: PAsContext): Pgchar; cdecl; external libappstream;
procedure as_context_set_locale(ctx: PAsContext; locale: Pgchar); cdecl; external libappstream;
function as_context_has_media_baseurl(ctx: PAsContext): Tgboolean; cdecl; external libappstream;
function as_context_get_media_baseurl(ctx: PAsContext): Pgchar; cdecl; external libappstream;
procedure as_context_set_media_baseurl(ctx: PAsContext; value: Pgchar); cdecl; external libappstream;
function as_context_get_locale_use_all(ctx: PAsContext): Tgboolean; cdecl; external libappstream;
function as_context_get_filename(ctx: PAsContext): Pgchar; cdecl; external libappstream;
procedure as_context_set_filename(ctx: PAsContext; fname: Pgchar); cdecl; external libappstream;
function as_context_get_value_flags(ctx: PAsContext): TAsValueFlags; cdecl; external libappstream;
procedure as_context_set_value_flags(ctx: PAsContext; flags: TAsValueFlags); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:11 ===

function AS_TYPE_CONTEXT: TGType;
function AS_CONTEXT(obj: Pointer): PAsContext;
function AS_IS_CONTEXT(obj: Pointer): Tgboolean;
function AS_CONTEXT_CLASS(klass: Pointer): PAsContextClass;
function AS_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function AS_CONTEXT_GET_CLASS(obj: Pointer): PAsContextClass;
{$ENDIF read_function}

implementation

function AS_TYPE_CONTEXT: TGType;
begin
  Result := as_context_get_type;
end;

function AS_CONTEXT(obj: Pointer): PAsContext;
begin
  Result := PAsContext(g_type_check_instance_cast(obj, AS_TYPE_CONTEXT));
end;

function AS_IS_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_CONTEXT);
end;

function AS_CONTEXT_CLASS(klass: Pointer): PAsContextClass;
begin
  Result := PAsContextClass(g_type_check_class_cast(klass, AS_TYPE_CONTEXT));
end;

function AS_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_CONTEXT);
end;

function AS_CONTEXT_GET_CLASS(obj: Pointer): PAsContextClass;
begin
  Result := PAsContextClass(PGTypeInstance(obj)^.g_class);
end;

end.
