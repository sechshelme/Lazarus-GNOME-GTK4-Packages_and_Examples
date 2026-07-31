unit as_release;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream, as_context, as_issue, as_artifact;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsReleaseKind = ^TAsReleaseKind;
  TAsReleaseKind = longint;
const
  AS_RELEASE_KIND_UNKNOWN = 0;
  AS_RELEASE_KIND_STABLE = 1;
  AS_RELEASE_KIND_DEVELOPMENT = 2;
  AS_RELEASE_KIND_SNAPSHOT = 3;
  AS_RELEASE_KIND_LAST = 4;

type
  PAsUrgencyKind = ^TAsUrgencyKind;
  TAsUrgencyKind = longint;
const
  AS_URGENCY_KIND_UNKNOWN = 0;
  AS_URGENCY_KIND_LOW = 1;
  AS_URGENCY_KIND_MEDIUM = 2;
  AS_URGENCY_KIND_HIGH = 3;
  AS_URGENCY_KIND_CRITICAL = 4;
  AS_URGENCY_KIND_LAST = 5;

type
  PAsReleaseUrlKind = ^TAsReleaseUrlKind;
  TAsReleaseUrlKind = longint;
const
  AS_RELEASE_URL_KIND_UNKNOWN = 0;
  AS_RELEASE_URL_KIND_DETAILS = 1;
  AS_RELEASE_URL_KIND_LAST = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsRelease = record
    parent_instance: TGObject;
  end;
  PAsRelease = ^TAsRelease;

  PAsReleaseClass = ^TAsReleaseClass;
  TAsReleaseClass = record
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
function as_release_get_type: TGType; cdecl; external libappstream;

function as_release_kind_to_string(kind: TAsReleaseKind): Pgchar; cdecl; external libappstream;
function as_release_kind_from_string(kind_str: Pgchar): TAsReleaseKind; cdecl; external libappstream;

function as_urgency_kind_to_string(urgency_kind: TAsUrgencyKind): Pgchar; cdecl; external libappstream;
function as_urgency_kind_from_string(urgency_kind: Pgchar): TAsUrgencyKind; cdecl; external libappstream;

function as_release_url_kind_to_string(kind: TAsReleaseUrlKind): Pgchar; cdecl; external libappstream;
function as_release_url_kind_from_string(kind_str: Pgchar): TAsReleaseUrlKind; cdecl; external libappstream;
function as_release_new: PAsRelease; cdecl; external libappstream;
function as_release_get_context(release: PAsRelease): PAsContext; cdecl; external libappstream;
procedure as_release_set_context(release: PAsRelease; context: PAsContext); cdecl; external libappstream;
function as_release_get_kind(release: PAsRelease): TAsReleaseKind; cdecl; external libappstream;
procedure as_release_set_kind(release: PAsRelease; kind: TAsReleaseKind); cdecl; external libappstream;
function as_release_get_version(release: PAsRelease): Pgchar; cdecl; external libappstream;
procedure as_release_set_version(release: PAsRelease; version: Pgchar); cdecl; external libappstream;
function as_release_vercmp(rel1: PAsRelease; rel2: PAsRelease): Tgint; cdecl; external libappstream;
function as_release_get_date(release: PAsRelease): Pgchar; cdecl; external libappstream;
procedure as_release_set_date(release: PAsRelease; date: Pgchar); cdecl; external libappstream;
function as_release_get_timestamp(release: PAsRelease): Tguint64; cdecl; external libappstream;
procedure as_release_set_timestamp(release: PAsRelease; timestamp: Tguint64); cdecl; external libappstream;
function as_release_get_date_eol(release: PAsRelease): Pgchar; cdecl; external libappstream;
procedure as_release_set_date_eol(release: PAsRelease; date: Pgchar); cdecl; external libappstream;
function as_release_get_timestamp_eol(release: PAsRelease): Tguint64; cdecl; external libappstream;
procedure as_release_set_timestamp_eol(release: PAsRelease; timestamp: Tguint64); cdecl; external libappstream;
function as_release_get_description(release: PAsRelease): Pgchar; cdecl; external libappstream;
procedure as_release_set_description(release: PAsRelease; description: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_release_get_urgency(release: PAsRelease): TAsUrgencyKind; cdecl; external libappstream;
procedure as_release_set_urgency(release: PAsRelease; urgency: TAsUrgencyKind); cdecl; external libappstream;
function as_release_get_issues(release: PAsRelease): PGPtrArray; cdecl; external libappstream;
procedure as_release_add_issue(release: PAsRelease; issue: PAsIssue); cdecl; external libappstream;
function as_release_get_artifacts(release: PAsRelease): PGPtrArray; cdecl; external libappstream;
procedure as_release_add_artifact(release: PAsRelease; artifact: PAsArtifact); cdecl; external libappstream;
function as_release_get_url(release: PAsRelease; url_kind: TAsReleaseUrlKind): Pgchar; cdecl; external libappstream;
procedure as_release_set_url(release: PAsRelease; url_kind: TAsReleaseUrlKind; url: Pgchar); cdecl; external libappstream;
procedure as_release_clear_tags(release: PAsRelease); cdecl; external libappstream;
function as_release_add_tag(release: PAsRelease; ns: Pgchar; tag: Pgchar): Tgboolean; cdecl; external libappstream;
function as_release_remove_tag(release: PAsRelease; ns: Pgchar; tag: Pgchar): Tgboolean; cdecl; external libappstream;
function as_release_has_tag(release: PAsRelease; ns: Pgchar; tag: Pgchar): Tgboolean; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:26 ===

function AS_TYPE_RELEASE: TGType;
function AS_RELEASE(obj: Pointer): PAsRelease;
function AS_IS_RELEASE(obj: Pointer): Tgboolean;
function AS_RELEASE_CLASS(klass: Pointer): PAsReleaseClass;
function AS_IS_RELEASE_CLASS(klass: Pointer): Tgboolean;
function AS_RELEASE_GET_CLASS(obj: Pointer): PAsReleaseClass;
{$ENDIF read_function}

implementation

function AS_TYPE_RELEASE: TGType;
begin
  Result := as_release_get_type;
end;

function AS_RELEASE(obj: Pointer): PAsRelease;
begin
  Result := PAsRelease(g_type_check_instance_cast(obj, AS_TYPE_RELEASE));
end;

function AS_IS_RELEASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_RELEASE);
end;

function AS_RELEASE_CLASS(klass: Pointer): PAsReleaseClass;
begin
  Result := PAsReleaseClass(g_type_check_class_cast(klass, AS_TYPE_RELEASE));
end;

function AS_IS_RELEASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_RELEASE);
end;

function AS_RELEASE_GET_CLASS(obj: Pointer): PAsReleaseClass;
begin
  Result := PAsReleaseClass(PGTypeInstance(obj)^.g_class);
end;

end.
