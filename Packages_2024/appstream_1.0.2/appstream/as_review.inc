

  {$IFDEF read_enum}
type
  PAsReviewFlags = ^TAsReviewFlags;
  TAsReviewFlags = longint;
const
  AS_REVIEW_FLAG_NONE = 0;
  AS_REVIEW_FLAG_SELF = 1 shl 0;
  AS_REVIEW_FLAG_VOTED = 1 shl 1;
  AS_REVIEW_FLAG_LAST = (1 shl 1) + 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsReview = record
    parent_instance: TGObject;
  end;
  PAsReview = ^TAsReview;

  PAsReviewClass = ^TAsReviewClass;
  TAsReviewClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
    _as_reserved7: procedure; cdecl;
    _as_reserved8: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_review_get_type: TGType; cdecl; external libappstream;
function as_review_new: PAsReview; cdecl; external libappstream;
function as_review_get_priority(review: PAsReview): Tgint; cdecl; external libappstream;
procedure as_review_set_priority(review: PAsReview; priority: Tgint); cdecl; external libappstream;
function as_review_get_id(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_id(review: PAsReview; id: Pgchar); cdecl; external libappstream;
function as_review_get_summary(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_summary(review: PAsReview; summary: Pgchar); cdecl; external libappstream;
function as_review_get_description(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_description(review: PAsReview; description: Pgchar); cdecl; external libappstream;
function as_review_get_locale(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_locale(review: PAsReview; locale: Pgchar); cdecl; external libappstream;
function as_review_get_rating(review: PAsReview): Tgint; cdecl; external libappstream;
procedure as_review_set_rating(review: PAsReview; rating: Tgint); cdecl; external libappstream;
function as_review_get_version(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_version(review: PAsReview; version: Pgchar); cdecl; external libappstream;
function as_review_get_reviewer_id(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_reviewer_id(review: PAsReview; reviewer_id: Pgchar); cdecl; external libappstream;
function as_review_get_reviewer_name(review: PAsReview): Pgchar; cdecl; external libappstream;
procedure as_review_set_reviewer_name(review: PAsReview; reviewer_name: Pgchar); cdecl; external libappstream;
function as_review_get_date(review: PAsReview): PGDateTime; cdecl; external libappstream;
procedure as_review_set_date(review: PAsReview; date: PGDateTime); cdecl; external libappstream;
function as_review_get_flags(review: PAsReview): TAsReviewFlags; cdecl; external libappstream;
procedure as_review_set_flags(review: PAsReview; flags: TAsReviewFlags); cdecl; external libappstream;
procedure as_review_add_flags(review: PAsReview; flags: TAsReviewFlags); cdecl; external libappstream;
function as_review_get_metadata_item(review: PAsReview; key: Pgchar): Pgchar; cdecl; external libappstream;
procedure as_review_add_metadata(review: PAsReview; key: Pgchar; value: Pgchar); cdecl; external libappstream;
function as_review_equal(review1: PAsReview; review2: PAsReview): Tgboolean; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:58 ===

function AS_TYPE_REVIEW: TGType;
function AS_REVIEW(obj: Pointer): PAsReview;
function AS_IS_REVIEW(obj: Pointer): Tgboolean;
function AS_REVIEW_CLASS(klass: Pointer): PAsReviewClass;
function AS_IS_REVIEW_CLASS(klass: Pointer): Tgboolean;
function AS_REVIEW_GET_CLASS(obj: Pointer): PAsReviewClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_REVIEW: TGType;
begin
  Result := as_review_get_type;
end;

function AS_REVIEW(obj: Pointer): PAsReview;
begin
  Result := PAsReview(g_type_check_instance_cast(obj, AS_TYPE_REVIEW));
end;

function AS_IS_REVIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_REVIEW);
end;

function AS_REVIEW_CLASS(klass: Pointer): PAsReviewClass;
begin
  Result := PAsReviewClass(g_type_check_class_cast(klass, AS_TYPE_REVIEW));
end;

function AS_IS_REVIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_REVIEW);
end;

function AS_REVIEW_GET_CLASS(obj: Pointer): PAsReviewClass;
begin
  Result := PAsReviewClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
