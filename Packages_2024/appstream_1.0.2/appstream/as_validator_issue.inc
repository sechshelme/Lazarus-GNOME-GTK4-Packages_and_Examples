

  {$IFDEF read_enum}
type
  PAsIssueSeverity = ^TAsIssueSeverity;
  TAsIssueSeverity = longint;
const
  AS_ISSUE_SEVERITY_UNKNOWN = 0;
  AS_ISSUE_SEVERITY_PEDANTIC = 1;
  AS_ISSUE_SEVERITY_INFO = 2;
  AS_ISSUE_SEVERITY_WARNING = 3;
  AS_ISSUE_SEVERITY_ERROR = 4;
  AS_ISSUE_SEVERITY_LAST = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsValidatorIssue = record
    parent_instance: TGObject;
  end;
  PAsValidatorIssue = ^TAsValidatorIssue;

  PAsValidatorIssueClass = ^TAsValidatorIssueClass;
  TAsValidatorIssueClass = record
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
function as_validator_issue_get_type: TGType; cdecl; external libappstream;
function as_issue_severity_from_string(str: Pgchar): TAsIssueSeverity; cdecl; external libappstream;
function as_issue_severity_to_string(severity: TAsIssueSeverity): Pgchar; cdecl; external libappstream;
function as_validator_issue_new: PAsValidatorIssue; cdecl; external libappstream;
function as_validator_issue_get_tag(issue: PAsValidatorIssue): Pgchar; cdecl; external libappstream;
procedure as_validator_issue_set_tag(issue: PAsValidatorIssue; tag: Pgchar); cdecl; external libappstream;
function as_validator_issue_get_severity(issue: PAsValidatorIssue): TAsIssueSeverity; cdecl; external libappstream;
procedure as_validator_issue_set_severity(issue: PAsValidatorIssue; severity: TAsIssueSeverity); cdecl; external libappstream;
function as_validator_issue_get_hint(issue: PAsValidatorIssue): Pgchar; cdecl; external libappstream;
procedure as_validator_issue_set_hint(issue: PAsValidatorIssue; hint: Pgchar); cdecl; external libappstream;
function as_validator_issue_get_explanation(issue: PAsValidatorIssue): Pgchar; cdecl; external libappstream;
procedure as_validator_issue_set_explanation(issue: PAsValidatorIssue; explanation: Pgchar); cdecl; external libappstream;
function as_validator_issue_get_cid(issue: PAsValidatorIssue): Pgchar; cdecl; external libappstream;
procedure as_validator_issue_set_cid(issue: PAsValidatorIssue; cid: Pgchar); cdecl; external libappstream;
function as_validator_issue_get_filename(issue: PAsValidatorIssue): Pgchar; cdecl; external libappstream;
procedure as_validator_issue_set_filename(issue: PAsValidatorIssue; fname: Pgchar); cdecl; external libappstream;
function as_validator_issue_get_line(issue: PAsValidatorIssue): Tglong; cdecl; external libappstream;
procedure as_validator_issue_set_line(issue: PAsValidatorIssue; line: Tglong); cdecl; external libappstream;
function as_validator_issue_get_location(issue: PAsValidatorIssue): Pgchar; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:18 ===

function AS_TYPE_VALIDATOR_ISSUE: TGType;
function AS_VALIDATOR_ISSUE(obj: Pointer): PAsValidatorIssue;
function AS_IS_VALIDATOR_ISSUE(obj: Pointer): Tgboolean;
function AS_VALIDATOR_ISSUE_CLASS(klass: Pointer): PAsValidatorIssueClass;
function AS_IS_VALIDATOR_ISSUE_CLASS(klass: Pointer): Tgboolean;
function AS_VALIDATOR_ISSUE_GET_CLASS(obj: Pointer): PAsValidatorIssueClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_VALIDATOR_ISSUE: TGType;
begin
  Result := as_validator_issue_get_type;
end;

function AS_VALIDATOR_ISSUE(obj: Pointer): PAsValidatorIssue;
begin
  Result := PAsValidatorIssue(g_type_check_instance_cast(obj, AS_TYPE_VALIDATOR_ISSUE));
end;

function AS_IS_VALIDATOR_ISSUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_VALIDATOR_ISSUE);
end;

function AS_VALIDATOR_ISSUE_CLASS(klass: Pointer): PAsValidatorIssueClass;
begin
  Result := PAsValidatorIssueClass(g_type_check_class_cast(klass, AS_TYPE_VALIDATOR_ISSUE));
end;

function AS_IS_VALIDATOR_ISSUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_VALIDATOR_ISSUE);
end;

function AS_VALIDATOR_ISSUE_GET_CLASS(obj: Pointer): PAsValidatorIssueClass;
begin
  Result := PAsValidatorIssueClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
