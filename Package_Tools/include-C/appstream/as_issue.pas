unit as_issue;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsIssueKind = ^TAsIssueKind;
  TAsIssueKind = longint;
const
  AS_ISSUE_KIND_UNKNOWN = 0;
  AS_ISSUE_KIND_GENERIC = 1;
  AS_ISSUE_KIND_CVE = 2;
  AS_ISSUE_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsIssue = record
    parent_instance: TGObject;
  end;
  PAsIssue = ^TAsIssue;

  PAsIssueClass = ^TAsIssueClass;
  TAsIssueClass = record
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
function as_issue_get_type: TGType; cdecl; external libappstream;
function as_issue_kind_to_string(kind: TAsIssueKind): Pgchar; cdecl; external libappstream;
function as_issue_kind_from_string(kind_str: Pgchar): TAsIssueKind; cdecl; external libappstream;
function as_issue_new: PAsIssue; cdecl; external libappstream;
function as_issue_get_kind(issue: PAsIssue): TAsIssueKind; cdecl; external libappstream;
procedure as_issue_set_kind(issue: PAsIssue; kind: TAsIssueKind); cdecl; external libappstream;
function as_issue_get_id(issue: PAsIssue): Pgchar; cdecl; external libappstream;
procedure as_issue_set_id(issue: PAsIssue; id: Pgchar); cdecl; external libappstream;
function as_issue_get_url(issue: PAsIssue): Pgchar; cdecl; external libappstream;
procedure as_issue_set_url(issue: PAsIssue; url: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:53 ===

function AS_TYPE_ISSUE: TGType;
function AS_ISSUE(obj: Pointer): PAsIssue;
function AS_IS_ISSUE(obj: Pointer): Tgboolean;
function AS_ISSUE_CLASS(klass: Pointer): PAsIssueClass;
function AS_IS_ISSUE_CLASS(klass: Pointer): Tgboolean;
function AS_ISSUE_GET_CLASS(obj: Pointer): PAsIssueClass;
{$ENDIF read_function}

implementation

function AS_TYPE_ISSUE: TGType;
begin
  Result := as_issue_get_type;
end;

function AS_ISSUE(obj: Pointer): PAsIssue;
begin
  Result := PAsIssue(g_type_check_instance_cast(obj, AS_TYPE_ISSUE));
end;

function AS_IS_ISSUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_ISSUE);
end;

function AS_ISSUE_CLASS(klass: Pointer): PAsIssueClass;
begin
  Result := PAsIssueClass(g_type_check_class_cast(klass, AS_TYPE_ISSUE));
end;

function AS_IS_ISSUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_ISSUE);
end;

function AS_ISSUE_GET_CLASS(obj: Pointer): PAsIssueClass;
begin
  Result := PAsIssueClass(PGTypeInstance(obj)^.g_class);
end;

end.
