unit girepository;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo, gitypelib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {G_DECLARE_FINAL_TYPE (GIRepository, gi_repository, GI, REPOSITORY, GObject) }
type
  PGIRepositoryLoadFlags = ^TGIRepositoryLoadFlags;
  TGIRepositoryLoadFlags = longint;

const
  GI_REPOSITORY_LOAD_FLAG_NONE = 0;
  GI_REPOSITORY_LOAD_FLAG_LAZY = 1 shl 0;

type
  TGIRepository = record
  end;
  PGIRepository = ^TGIRepository;

  TGIRepositoryClass = record
    parent_class: TGObjectClass;
  end;
  PGIRepositoryClass = ^TGIRepositoryClass;

function gi_repository_get_type: TGType; cdecl; external libgirepository2;
function gi_repository_new: PGIRepository; cdecl; external libgirepository2;
procedure gi_repository_prepend_search_path(repository: PGIRepository; directory: pchar); cdecl; external libgirepository2;
procedure gi_repository_prepend_library_path(repository: PGIRepository; directory: pchar); cdecl; external libgirepository2;
function gi_repository_get_search_path(repository: PGIRepository; n_paths_out: Psize_t): PPchar; cdecl; external libgirepository2;
function gi_repository_get_library_path(repository: PGIRepository; n_paths_out: Psize_t): PPchar; cdecl; external libgirepository2;
function gi_repository_load_typelib(repository: PGIRepository; typelib: PGITypelib; flags: TGIRepositoryLoadFlags; error: PPGError): pchar; cdecl; external libgirepository2;
function gi_repository_is_registered(repository: PGIRepository; namespace_: pchar; version: pchar): Tgboolean; cdecl; external libgirepository2;
function gi_repository_find_by_name(repository: PGIRepository; namespace_: pchar; name: pchar): PGIBaseInfo; cdecl; external libgirepository2;
function gi_repository_enumerate_versions(repository: PGIRepository; namespace_: pchar; n_versions_out: Psize_t): Ppchar; cdecl; external libgirepository2;
function gi_repository_require(repository: PGIRepository; namespace_: pchar; version: pchar; flags: TGIRepositoryLoadFlags; error: PPGError): PGITypelib; cdecl; external libgirepository2;
function gi_repository_require_private(repository: PGIRepository; typelib_dir: pchar; namespace_: pchar; version: pchar; flags: TGIRepositoryLoadFlags;
  error: PPGError): PGITypelib; cdecl; external libgirepository2;
function gi_repository_get_immediate_dependencies(repository: PGIRepository; namespace_: pchar; n_dependencies_out: Psize_t): Ppchar; cdecl; external libgirepository2;
function gi_repository_get_dependencies(repository: PGIRepository; namespace_: pchar; n_dependencies_out: Psize_t): Ppchar; cdecl; external libgirepository2;
function gi_repository_get_loaded_namespaces(repository: PGIRepository; n_namespaces_out: Psize_t): Ppchar; cdecl; external libgirepository2;
function gi_repository_find_by_gtype(repository: PGIRepository; gtype: TGType): PGIBaseInfo; cdecl; external libgirepository2;
procedure gi_repository_get_object_gtype_interfaces(repository: PGIRepository; gtype: TGType; n_interfaces_out: Psize_t; interfaces_out: PPPGIInterfaceInfo); cdecl; external libgirepository2;
function gi_repository_get_n_infos(repository: PGIRepository; namespace_: pchar): dword; cdecl; external libgirepository2;
function gi_repository_get_info(repository: PGIRepository; namespace_: pchar; idx: dword): PGIBaseInfo; cdecl; external libgirepository2;
function gi_repository_find_by_error_domain(repository: PGIRepository; domain: TGQuark): PGIEnumInfo; cdecl; external libgirepository2;
function gi_repository_get_typelib_path(repository: PGIRepository; namespace_: pchar): pchar; cdecl; external libgirepository2;
function gi_repository_get_shared_libraries(repository: PGIRepository; namespace_: pchar; out_n_elements: Psize_t): Ppchar; cdecl; external libgirepository2;
function gi_repository_get_c_prefix(repository: PGIRepository; namespace_: pchar): pchar; cdecl; external libgirepository2;
function gi_repository_get_version(repository: PGIRepository; namespace_: pchar): pchar; cdecl; external libgirepository2;
function gi_repository_get_option_group: PGOptionGroup; cdecl; external libgirepository2;
function gi_repository_dump(input_filename: pchar; output_filename: pchar; error: PPGError): Tgboolean; cdecl; external libgirepository2;

type
  PGIRepositoryError = ^TGIRepositoryError;
  TGIRepositoryError = longint;

const
  GI_REPOSITORY_ERROR_TYPELIB_NOT_FOUND = 0;
  GI_REPOSITORY_ERROR_NAMESPACE_MISMATCH = 1;
  GI_REPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT = 2;
  GI_REPOSITORY_ERROR_LIBRARY_NOT_FOUND = 3;

function GI_REPOSITORY_ERROR: TGQuark;

function gi_repository_error_quark: TGQuark; cdecl; external libgirepository2;
procedure gi_cclosure_marshal_generic(closure: PGClosure; return_gvalue: PGValue; n_param_values: dword; param_values: PGValue; invocation_hint: pointer;
  marshal_data: pointer); cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:54 ===

function GI_TYPE_REPOSITORY: TGType;
function GI_REPOSITORY(obj: Pointer): PGIRepository;
function GI_IS_REPOSITORY(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_REPOSITORY: TGType;
begin
  Result := gi_repository_get_type;
end;

function GI_REPOSITORY(obj: Pointer): PGIRepository;
begin
  Result := PGIRepository(g_type_check_instance_cast(obj, GI_TYPE_REPOSITORY));
end;

function GI_IS_REPOSITORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_REPOSITORY);
end;


function GI_REPOSITORY_ERROR: TGQuark;
begin
  GI_REPOSITORY_ERROR := gi_repository_error_quark;
end;


end.
