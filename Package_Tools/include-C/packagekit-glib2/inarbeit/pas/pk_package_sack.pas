unit pk_package_sack;

interface

uses
  fp_glib2, fp_packagekit, pk_package, pk_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  PPkPackageSackPrivate = type Pointer;

  PPkPackageSack = ^TPkPackageSack;
  TPkPackageSack = record
    parent: TGObject;
    priv: PPkPackageSackPrivate;
  end;

  PPkPackageSackClass = ^TPkPackageSackClass;
  TPkPackageSackClass = record
    parent_class: TGObjectClass;
    changed: procedure(sack: PPkPackageSack); cdecl;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

type
  PPkPackageSackSortType = ^TPkPackageSackSortType;
  TPkPackageSackSortType = longint;
const
  PK_PACKAGE_SACK_SORT_TYPE_NAME = 0;
  PK_PACKAGE_SACK_SORT_TYPE_INFO = 1;
  PK_PACKAGE_SACK_SORT_TYPE_PACKAGE_ID = 2;
  PK_PACKAGE_SACK_SORT_TYPE_SUMMARY = 3;
  PK_PACKAGE_SACK_SORT_TYPE_LAST = 4;

function pk_package_sack_get_type: TGType; cdecl; external libpackagekit;
function pk_package_sack_new: PPkPackageSack; cdecl; external libpackagekit;

type
  TPkPackageSackFilterFunc = function(package: PPkPackage; user_data: Tgpointer): Tgboolean; cdecl;

procedure pk_package_sack_clear(sack: PPkPackageSack); cdecl; external libpackagekit;
function pk_package_sack_get_ids(sack: PPkPackageSack): PPgchar; cdecl; external libpackagekit;
function pk_package_sack_get_size(sack: PPkPackageSack): Tguint; cdecl; external libpackagekit;
function pk_package_sack_get_array(sack: PPkPackageSack): PGPtrArray; cdecl; external libpackagekit;
procedure pk_package_sack_sort(sack: PPkPackageSack; _type: TPkPackageSackSortType); cdecl; external libpackagekit;
function pk_package_sack_add_package(sack: PPkPackageSack; package: PPkPackage): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_add_package_by_id(sack: PPkPackageSack; package_id: Pgchar; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_add_packages_from_file(sack: PPkPackageSack; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_to_file(sack: PPkPackageSack; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_remove_package(sack: PPkPackageSack; package: PPkPackage): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_remove_package_by_id(sack: PPkPackageSack; package_id: Pgchar): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_remove_by_filter(sack: PPkPackageSack; filter_cb: TPkPackageSackFilterFunc; user_data: Tgpointer): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_find_by_id(sack: PPkPackageSack; package_id: Pgchar): PPkPackage; cdecl; external libpackagekit;
function pk_package_sack_find_by_id_name_arch(sack: PPkPackageSack; package_id: Pgchar): PPkPackage; cdecl; external libpackagekit;
function pk_package_sack_filter_by_info(sack: PPkPackageSack; info: TPkInfoEnum): PPkPackageSack; cdecl; external libpackagekit;
function pk_package_sack_filter(sack: PPkPackageSack; filter_cb: TPkPackageSackFilterFunc; user_data: Tgpointer): PPkPackageSack; cdecl; external libpackagekit;
function pk_package_sack_get_total_bytes(sack: PPkPackageSack): Tguint64; cdecl; external libpackagekit;
function pk_package_sack_merge_generic_finish(sack: PPkPackageSack; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libpackagekit;
procedure pk_package_sack_resolve_async(sack: PPkPackageSack; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_package_sack_get_details_async(sack: PPkPackageSack; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_package_sack_get_update_detail_async(sack: PPkPackageSack; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libpackagekit;

function PK_PACKAGE_SACK_TYPE_ERROR: tgtylongint;


// === Konventiert am: 7-9-26 15:10:52 ===

function PK_TYPE_PACKAGE_SACK: TGType;
function PK_PACKAGE_SACK(obj: Pointer): PPkPackageSack;
function PK_PACKAGE_SACK_CLASS(klass: Pointer): PPkPackageSackClass;
function PK_IS_PACKAGE_SACK(obj: Pointer): Tgboolean;
function PK_IS_PACKAGE_SACK_CLASS(klass: Pointer): Tgboolean;
function PK_PACKAGE_SACK_GET_CLASS(obj: Pointer): PPkPackageSackClass;

implementation

function PK_TYPE_PACKAGE_SACK: TGType;
begin
  PK_TYPE_PACKAGE_SACK := pk_package_sack_get_type;
end;

function PK_PACKAGE_SACK(obj: Pointer): PPkPackageSack;
begin
  Result := PPkPackageSack(g_type_check_instance_cast(obj, PK_TYPE_PACKAGE_SACK));
end;

function PK_PACKAGE_SACK_CLASS(klass: Pointer): PPkPackageSackClass;
begin
  Result := PPkPackageSackClass(g_type_check_class_cast(klass, PK_TYPE_PACKAGE_SACK));
end;

function PK_IS_PACKAGE_SACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_PACKAGE_SACK);
end;

function PK_IS_PACKAGE_SACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_PACKAGE_SACK);
end;

function PK_PACKAGE_SACK_GET_CLASS(obj: Pointer): PPkPackageSackClass;
begin
  Result := PPkPackageSackClass(PGTypeInstance(obj)^.g_class);
end;


function PK_PACKAGE_SACK_TYPE_ERROR: longint;
begin
  PK_PACKAGE_SACK_TYPE_ERROR := pk_package_sack_error_get_type;
end;


end.
