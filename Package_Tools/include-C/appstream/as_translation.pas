unit as_translation;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsTranslationKind = ^TAsTranslationKind;
  TAsTranslationKind = longint;
const
  AS_TRANSLATION_KIND_UNKNOWN = 0;
  AS_TRANSLATION_KIND_GETTEXT = 1;
  AS_TRANSLATION_KIND_QT = 2;
  AS_TRANSLATION_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsTranslation = record
    parent_instance: TGObject;
  end;
  PAsTranslation = ^TAsTranslation;

  PAsTranslationClass = ^TAsTranslationClass;
  TAsTranslationClass = record
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
function as_translation_get_type: TGType; cdecl; external libappstream;
function as_translation_kind_to_string(kind: TAsTranslationKind): Pgchar; cdecl; external libappstream;
function as_translation_kind_from_string(kind_str: Pgchar): TAsTranslationKind; cdecl; external libappstream;
function as_translation_new: PAsTranslation; cdecl; external libappstream;
function as_translation_get_kind(tr: PAsTranslation): TAsTranslationKind; cdecl; external libappstream;
procedure as_translation_set_kind(tr: PAsTranslation; kind: TAsTranslationKind); cdecl; external libappstream;
function as_translation_get_id(tr: PAsTranslation): Pgchar; cdecl; external libappstream;
procedure as_translation_set_id(tr: PAsTranslation; id: Pgchar); cdecl; external libappstream;
function as_translation_get_source_locale(tr: PAsTranslation): Pgchar; cdecl; external libappstream;
procedure as_translation_set_source_locale(tr: PAsTranslation; locale: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:33 ===

function AS_TYPE_TRANSLATION: TGType;
function AS_TRANSLATION(obj: Pointer): PAsTranslation;
function AS_IS_TRANSLATION(obj: Pointer): Tgboolean;
function AS_TRANSLATION_CLASS(klass: Pointer): PAsTranslationClass;
function AS_IS_TRANSLATION_CLASS(klass: Pointer): Tgboolean;
function AS_TRANSLATION_GET_CLASS(obj: Pointer): PAsTranslationClass;
{$ENDIF read_function}

implementation

function AS_TYPE_TRANSLATION: TGType;
begin
  Result := as_translation_get_type;
end;

function AS_TRANSLATION(obj: Pointer): PAsTranslation;
begin
  Result := PAsTranslation(g_type_check_instance_cast(obj, AS_TYPE_TRANSLATION));
end;

function AS_IS_TRANSLATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_TRANSLATION);
end;

function AS_TRANSLATION_CLASS(klass: Pointer): PAsTranslationClass;
begin
  Result := PAsTranslationClass(g_type_check_class_cast(klass, AS_TYPE_TRANSLATION));
end;

function AS_IS_TRANSLATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_TRANSLATION);
end;

function AS_TRANSLATION_GET_CLASS(obj: Pointer): PAsTranslationClass;
begin
  Result := PAsTranslationClass(PGTypeInstance(obj)^.g_class);
end;

end.
