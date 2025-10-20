unit girepository;

interface

uses
  fp_glib2, fp_girepository, gitypes, gitypelib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGIRepositoryPrivate = type Pointer;

  TGIRepository = record
    parent: TGObject;
    priv: PGIRepositoryPrivate;
  end;
  PGIRepository = ^TGIRepository;

  TGIRepositoryClass = record
    parent: TGObjectClass;
  end;
  PGIRepositoryClass = ^TGIRepositoryClass;

type
  PGIRepositoryLoadFlags = ^TGIRepositoryLoadFlags;
  TGIRepositoryLoadFlags = longint;

const
  G_IREPOSITORY_LOAD_FLAG_LAZY = 1 shl 0;

function g_irepository_get_type: TGType; cdecl; external libgirepository;
function g_irepository_get_default: PGIRepository; cdecl; external libgirepository;
procedure g_irepository_prepend_search_path(directory: pchar); cdecl; external libgirepository;
procedure g_irepository_prepend_library_path(directory: pchar); cdecl; external libgirepository;
function g_irepository_get_search_path: PGSList; cdecl; external libgirepository;
function g_irepository_load_typelib(repository: PGIRepository; typelib: PGITypelib; flags: TGIRepositoryLoadFlags; error: PPGError): pchar; cdecl; external libgirepository;
function g_irepository_is_registered(repository: PGIRepository; namespace_: Pgchar; version: Pgchar): Tgboolean; cdecl; external libgirepository;
function g_irepository_find_by_name(repository: PGIRepository; namespace_: Pgchar; name: Pgchar): PGIBaseInfo; cdecl; external libgirepository;
function g_irepository_enumerate_versions(repository: PGIRepository; namespace_: Pgchar): PGList; cdecl; external libgirepository;
function g_irepository_require(repository: PGIRepository; namespace_: Pgchar; version: Pgchar; flags: TGIRepositoryLoadFlags; error: PPGError): PGITypelib; cdecl; external libgirepository;
function g_irepository_require_private(repository: PGIRepository; typelib_dir: Pgchar; namespace_: Pgchar; version: Pgchar; flags: TGIRepositoryLoadFlags;
  error: PPGError): PGITypelib; cdecl; external libgirepository;
function g_irepository_get_immediate_dependencies(repository: PGIRepository; namespace_: Pgchar): PPgchar; cdecl; external libgirepository;
function g_irepository_get_dependencies(repository: PGIRepository; namespace_: Pgchar): PPgchar; cdecl; external libgirepository;
function g_irepository_get_loaded_namespaces(repository: PGIRepository): PPgchar; cdecl; external libgirepository;
function g_irepository_find_by_gtype(repository: PGIRepository; gtype: TGType): PGIBaseInfo; cdecl; external libgirepository;
procedure g_irepository_get_object_gtype_interfaces(repository: PGIRepository; gtype: TGType; n_interfaces_out: Pguint; interfaces_out: PPPGIInterfaceInfo); cdecl; external libgirepository;
function g_irepository_get_n_infos(repository: PGIRepository; namespace_: Pgchar): Tgint; cdecl; external libgirepository;
function g_irepository_get_info(repository: PGIRepository; namespace_: Pgchar; index: Tgint): PGIBaseInfo; cdecl; external libgirepository;
function g_irepository_find_by_error_domain(repository: PGIRepository; domain: TGQuark): PGIEnumInfo; cdecl; external libgirepository;
function g_irepository_get_typelib_path(repository: PGIRepository; namespace_: Pgchar): Pgchar; cdecl; external libgirepository;
function g_irepository_get_shared_library(repository: PGIRepository; namespace_: Pgchar): Pgchar; cdecl; external libgirepository;
function g_irepository_get_c_prefix(repository: PGIRepository; namespace_: Pgchar): Pgchar; cdecl; external libgirepository;
function g_irepository_get_version(repository: PGIRepository; namespace_: Pgchar): Pgchar; cdecl; external libgirepository;
function g_irepository_get_option_group: PGOptionGroup; cdecl; external libgirepository;
function g_irepository_dump(arg: pchar; error: PPGError): Tgboolean; cdecl; external libgirepository;

type
  PGIRepositoryError = ^TGIRepositoryError;
  TGIRepositoryError = longint;

const
  G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND = 0;
  G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH = 1;
  G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT = 2;
  G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND = 3;

function G_IREPOSITORY_ERROR: TGQuark;

function g_irepository_error_quark: TGQuark; cdecl; external libgirepository;
procedure gi_cclosure_marshal_generic(closure: PGClosure; return_gvalue: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:13:59 ===

function G_TYPE_IREPOSITORY: TGType;
function G_IREPOSITORY(obj: Pointer): PGIRepository;
function G_IREPOSITORY_CLASS(klass: Pointer): PGIRepositoryClass;
function G_IS_IREPOSITORY(obj: Pointer): Tgboolean;
function G_IS_IREPOSITORY_CLASS(klass: Pointer): Tgboolean;
function G_IREPOSITORY_GET_CLASS(obj: Pointer): PGIRepositoryClass;

implementation

function G_TYPE_IREPOSITORY: TGType;
begin
  G_TYPE_IREPOSITORY := g_irepository_get_type;
end;

function G_IREPOSITORY(obj: Pointer): PGIRepository;
begin
  Result := PGIRepository(g_type_check_instance_cast(obj, G_TYPE_IREPOSITORY));
end;

function G_IREPOSITORY_CLASS(klass: Pointer): PGIRepositoryClass;
begin
  Result := PGIRepositoryClass(g_type_check_class_cast(klass, G_TYPE_IREPOSITORY));
end;

function G_IS_IREPOSITORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_IREPOSITORY);
end;

function G_IS_IREPOSITORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_IREPOSITORY);
end;

function G_IREPOSITORY_GET_CLASS(obj: Pointer): PGIRepositoryClass;
begin
  Result := PGIRepositoryClass(PGTypeInstance(obj)^.g_class);
end;


function G_IREPOSITORY_ERROR: TGQuark;
begin
  G_IREPOSITORY_ERROR := g_irepository_error_quark;
end;


end.
