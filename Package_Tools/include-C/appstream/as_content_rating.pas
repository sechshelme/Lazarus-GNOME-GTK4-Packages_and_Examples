unit as_content_rating;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsContentRatingSystem = ^TAsContentRatingSystem;
  TAsContentRatingSystem = longint;
const
  AS_CONTENT_RATING_SYSTEM_UNKNOWN = 0;
  AS_CONTENT_RATING_SYSTEM_INCAA = 1;
  AS_CONTENT_RATING_SYSTEM_ACB = 2;
  AS_CONTENT_RATING_SYSTEM_DJCTQ = 3;
  AS_CONTENT_RATING_SYSTEM_GSRR = 4;
  AS_CONTENT_RATING_SYSTEM_PEGI = 5;
  AS_CONTENT_RATING_SYSTEM_KAVI = 6;
  AS_CONTENT_RATING_SYSTEM_USK = 7;
  AS_CONTENT_RATING_SYSTEM_ESRA = 8;
  AS_CONTENT_RATING_SYSTEM_CERO = 9;
  AS_CONTENT_RATING_SYSTEM_OFLCNZ = 10;
  AS_CONTENT_RATING_SYSTEM_RUSSIA = 11;
  AS_CONTENT_RATING_SYSTEM_MDA = 12;
  AS_CONTENT_RATING_SYSTEM_GRAC = 13;
  AS_CONTENT_RATING_SYSTEM_ESRB = 14;
  AS_CONTENT_RATING_SYSTEM_IARC = 15;
  AS_CONTENT_RATING_SYSTEM_LAST = 16;

type
  PAsContentRatingValue = ^TAsContentRatingValue;
  TAsContentRatingValue = longint;
const
  AS_CONTENT_RATING_VALUE_UNKNOWN = 0;
  AS_CONTENT_RATING_VALUE_NONE = 1;
  AS_CONTENT_RATING_VALUE_MILD = 2;
  AS_CONTENT_RATING_VALUE_MODERATE = 3;
  AS_CONTENT_RATING_VALUE_INTENSE = 4;
  AS_CONTENT_RATING_VALUE_LAST = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsContentRating = record
    parent_instance: TGObject;
  end;
  PAsContentRating = ^TAsContentRating;

  PAsContentRatingClass = ^TAsContentRatingClass;
  TAsContentRatingClass = record
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
function as_content_rating_get_type: TGType; cdecl; external libappstream;
function as_content_rating_value_to_string(value: TAsContentRatingValue): Pgchar; cdecl; external libappstream;
function as_content_rating_value_from_string(value: Pgchar): TAsContentRatingValue; cdecl; external libappstream;
function as_content_rating_attribute_to_csm_age(id: Pgchar; value: TAsContentRatingValue): Tguint; cdecl; external libappstream;
function as_content_rating_get_all_rating_ids: PPgchar; cdecl; external libappstream;
function as_content_rating_system_to_string(system: TAsContentRatingSystem): Pgchar; cdecl; external libappstream;
function as_content_rating_system_format_age(system: TAsContentRatingSystem; age: Tguint): Pgchar; cdecl; external libappstream;
function as_content_rating_system_from_locale(locale: Pgchar): TAsContentRatingSystem; cdecl; external libappstream;
function as_content_rating_system_get_formatted_ages(system: TAsContentRatingSystem): PPgchar; cdecl; external libappstream;
function as_content_rating_system_get_csm_ages(system: TAsContentRatingSystem; length_out: Pgsize): Pguint; cdecl; external libappstream;
function as_content_rating_attribute_from_csm_age(id: Pgchar; age: Tguint): TAsContentRatingValue; cdecl; external libappstream;
function as_content_rating_attribute_get_description(id: Pgchar; value: TAsContentRatingValue): Pgchar; cdecl; external libappstream;
function as_content_rating_new: PAsContentRating; cdecl; external libappstream;
function as_content_rating_get_kind(content_rating: PAsContentRating): Pgchar; cdecl; external libappstream;
procedure as_content_rating_set_kind(content_rating: PAsContentRating; kind: Pgchar); cdecl; external libappstream;
function as_content_rating_get_minimum_age(content_rating: PAsContentRating): Tguint; cdecl; external libappstream;
function as_content_rating_get_value(content_rating: PAsContentRating; id: Pgchar): TAsContentRatingValue; cdecl; external libappstream;
procedure as_content_rating_set_value(content_rating: PAsContentRating; id: Pgchar; value: TAsContentRatingValue); cdecl; external libappstream;
function as_content_rating_get_rating_ids(content_rating: PAsContentRating): PPgchar; cdecl; external libappstream;
procedure as_content_rating_add_attribute(content_rating: PAsContentRating; id: Pgchar; value: TAsContentRatingValue); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:15 ===

function AS_TYPE_CONTENT_RATING: TGType;
function AS_CONTENT_RATING(obj: Pointer): PAsContentRating;
function AS_IS_CONTENT_RATING(obj: Pointer): Tgboolean;
function AS_CONTENT_RATING_CLASS(klass: Pointer): PAsContentRatingClass;
function AS_IS_CONTENT_RATING_CLASS(klass: Pointer): Tgboolean;
function AS_CONTENT_RATING_GET_CLASS(obj: Pointer): PAsContentRatingClass;
{$ENDIF read_function}

implementation

function AS_TYPE_CONTENT_RATING: TGType;
begin
  Result := as_content_rating_get_type;
end;

function AS_CONTENT_RATING(obj: Pointer): PAsContentRating;
begin
  Result := PAsContentRating(g_type_check_instance_cast(obj, AS_TYPE_CONTENT_RATING));
end;

function AS_IS_CONTENT_RATING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_CONTENT_RATING);
end;

function AS_CONTENT_RATING_CLASS(klass: Pointer): PAsContentRatingClass;
begin
  Result := PAsContentRatingClass(g_type_check_class_cast(klass, AS_TYPE_CONTENT_RATING));
end;

function AS_IS_CONTENT_RATING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_CONTENT_RATING);
end;

function AS_CONTENT_RATING_GET_CLASS(obj: Pointer): PAsContentRatingClass;
begin
  Result := PAsContentRatingClass(PGTypeInstance(obj)^.g_class);
end;

end.
