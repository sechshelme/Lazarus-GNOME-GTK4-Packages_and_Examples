unit as_relation_check_result;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream, as_relation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsRelationStatus = ^TAsRelationStatus;
  TAsRelationStatus = longint;
const
  AS_RELATION_STATUS_UNKNOWN = 0;
  AS_RELATION_STATUS_ERROR = 1;
  AS_RELATION_STATUS_NOT_SATISFIED = 2;
  AS_RELATION_STATUS_SATISFIED = 3;
  AS_RELATION_STATUS_LAST = 4;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsRelationCheckResult = record
    parent_instance: TGObject;
  end;
  PAsRelationCheckResult = ^TAsRelationCheckResult;

  PAsRelationCheckResultClass = ^TAsRelationCheckResultClass;
  TAsRelationCheckResultClass = record
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
function as_relation_check_result_get_type: TGType; cdecl; external libappstream;
function as_relation_check_result_new: PAsRelationCheckResult; cdecl; external libappstream;
function as_relation_check_result_get_status(relcr: PAsRelationCheckResult): TAsRelationStatus; cdecl; external libappstream;
procedure as_relation_check_result_set_status(relcr: PAsRelationCheckResult; status: TAsRelationStatus); cdecl; external libappstream;
function as_relation_check_result_get_relation(relcr: PAsRelationCheckResult): PAsRelation; cdecl; external libappstream;
procedure as_relation_check_result_set_relation(relcr: PAsRelationCheckResult; relation: PAsRelation); cdecl; external libappstream;
function as_relation_check_result_get_message(relcr: PAsRelationCheckResult): Pgchar; cdecl; external libappstream;
procedure as_relation_check_result_set_message(relcr: PAsRelationCheckResult; format: Pgchar; args: array of const); cdecl; external libappstream;
procedure as_relation_check_result_set_message(relcr: PAsRelationCheckResult; format: Pgchar); cdecl; external libappstream;
function as_relation_check_result_get_error_code(relcr: PAsRelationCheckResult): TAsRelationError; cdecl; external libappstream;
procedure as_relation_check_result_set_error_code(relcr: PAsRelationCheckResult; ecode: TAsRelationError); cdecl; external libappstream;
function as_relation_check_results_get_compatibility_score(rc_results: PGPtrArray): Tgint; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:30 ===

function AS_TYPE_RELATION_CHECK_RESULT: TGType;
function AS_RELATION_CHECK_RESULT(obj: Pointer): PAsRelationCheckResult;
function AS_IS_RELATION_CHECK_RESULT(obj: Pointer): Tgboolean;
function AS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): PAsRelationCheckResultClass;
function AS_IS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): Tgboolean;
function AS_RELATION_CHECK_RESULT_GET_CLASS(obj: Pointer): PAsRelationCheckResultClass;
{$ENDIF read_function}

implementation

function AS_TYPE_RELATION_CHECK_RESULT: TGType;
begin
  Result := as_relation_check_result_get_type;
end;

function AS_RELATION_CHECK_RESULT(obj: Pointer): PAsRelationCheckResult;
begin
  Result := PAsRelationCheckResult(g_type_check_instance_cast(obj, AS_TYPE_RELATION_CHECK_RESULT));
end;

function AS_IS_RELATION_CHECK_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_RELATION_CHECK_RESULT);
end;

function AS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): PAsRelationCheckResultClass;
begin
  Result := PAsRelationCheckResultClass(g_type_check_class_cast(klass, AS_TYPE_RELATION_CHECK_RESULT));
end;

function AS_IS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_RELATION_CHECK_RESULT);
end;

function AS_RELATION_CHECK_RESULT_GET_CLASS(obj: Pointer): PAsRelationCheckResultClass;
begin
  Result := PAsRelationCheckResultClass(PGTypeInstance(obj)^.g_class);
end;

end.
