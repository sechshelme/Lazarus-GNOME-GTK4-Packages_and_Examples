unit pk_results;

interface

uses
  fp_glib2, fp_packagekit, pk_enum, pk_error;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  PPkResultsPrivate = type Pointer;

  PPkResults = ^TPkResults;
  TPkResults = record
    parent: TGObject;
    priv: PPkResultsPrivate;
  end;

  PPkResultsClass = ^TPkResultsClass;
  TPkResultsClass = record
    parent_class: TGObjectClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_results_get_type: TGType; cdecl; external libpackagekit;
function pk_results_new: PPkResults; cdecl; external libpackagekit;

function pk_results_set_exit_code(results: PPkResults; exit_enum: TPkExitEnum): Tgboolean; cdecl; external libpackagekit;
function pk_results_set_role(results: PPkResults; role: TPkRoleEnum): Tgboolean; cdecl; external libpackagekit;
function pk_results_set_error_code(results: PPkResults; item: PPkError): Tgboolean; cdecl; external libpackagekit;

function pk_results_add_package(results: PPkResults; item: PPkPackage): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_details(results: PPkResults; item: PPkDetails): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_update_detail(results: PPkResults; item: PPkUpdateDetail): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_category(results: PPkResults; item: PPkCategory): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_distro_upgrade(results: PPkResults; item: PPkDistroUpgrade): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_require_restart(results: PPkResults; item: PPkRequireRestart): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_transaction(results: PPkResults; item: PPkTransactionPast): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_files(results: PPkResults; item: PPkFiles): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_repo_signature_required(results: PPkResults; item: PPkRepoSignatureRequired): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_eula_required(results: PPkResults; item: PPkEulaRequired): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_media_change_required(results: PPkResults; item: PPkMediaChangeRequired): Tgboolean; cdecl; external libpackagekit;
function pk_results_add_repo_detail(results: PPkResults; item: PPkRepoDetail): Tgboolean; cdecl; external libpackagekit;

function pk_results_get_exit_code(results: PPkResults): TPkExitEnum; cdecl; external libpackagekit;
function pk_results_get_package_sack(results: PPkResults): PPkPackageSack; cdecl; external libpackagekit;
function pk_results_get_error_code(results: PPkResults): PPkError; cdecl; external libpackagekit;
function pk_results_get_role(results: PPkResults): TPkRoleEnum; cdecl; external libpackagekit;
function pk_results_get_transaction_flags(results: PPkResults): TPkBitfield; cdecl; external libpackagekit;
function pk_results_get_require_restart_worst(results: PPkResults): TPkRestartEnum; cdecl; external libpackagekit;

function pk_results_get_package_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_details_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_update_detail_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_category_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_distro_upgrade_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_require_restart_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_transaction_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_files_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_repo_signature_required_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_eula_required_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_media_change_required_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;
function pk_results_get_repo_detail_array(results: PPkResults): PGPtrArray; cdecl; external libpackagekit;

function PK_RESULTS_TYPE_ERROR: TGType;

// === Konventiert am: 7-9-26 15:13:46 ===

function PK_TYPE_RESULTS: TGType;
function PK_RESULTS(obj: Pointer): PPkResults;
function PK_RESULTS_CLASS(klass: Pointer): PPkResultsClass;
function PK_IS_RESULTS(obj: Pointer): Tgboolean;
function PK_IS_RESULTS_CLASS(klass: Pointer): Tgboolean;
function PK_RESULTS_GET_CLASS(obj: Pointer): PPkResultsClass;

implementation

function PK_TYPE_RESULTS: TGType;
begin
  PK_TYPE_RESULTS := pk_results_get_type;
end;

function PK_RESULTS(obj: Pointer): PPkResults;
begin
  Result := PPkResults(g_type_check_instance_cast(obj, PK_TYPE_RESULTS));
end;

function PK_RESULTS_CLASS(klass: Pointer): PPkResultsClass;
begin
  Result := PPkResultsClass(g_type_check_class_cast(klass, PK_TYPE_RESULTS));
end;

function PK_IS_RESULTS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_RESULTS);
end;

function PK_IS_RESULTS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_RESULTS);
end;

function PK_RESULTS_GET_CLASS(obj: Pointer): PPkResultsClass;
begin
  Result := PPkResultsClass(PGTypeInstance(obj)^.g_class);
end;


function PK_RESULTS_TYPE_ERROR: TGType;
begin
  PK_RESULTS_TYPE_ERROR := pk_results_error_get_type;
end;


end.
