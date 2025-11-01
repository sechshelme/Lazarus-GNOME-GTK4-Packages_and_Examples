unit cd_icc_store;

interface

uses
  fp_glib2, fp_colord, cd_icc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCdIccStoreSearchFlags = ^TCdIccStoreSearchFlags;
  TCdIccStoreSearchFlags = longint;

const
  CD_ICC_STORE_SEARCH_FLAGS_NONE = 0;
  CD_ICC_STORE_SEARCH_FLAGS_CREATE_LOCATION = 1;
  CD_ICC_STORE_SEARCH_FLAGS_LAST = 2;

type
  PCdIccStoreSearchKind = ^TCdIccStoreSearchKind;
  TCdIccStoreSearchKind = longint;

const
  CD_ICC_STORE_SEARCH_KIND_SYSTEM = 0;
  CD_ICC_STORE_SEARCH_KIND_MACHINE = 1;
  CD_ICC_STORE_SEARCH_KIND_USER = 2;
  CD_ICC_STORE_SEARCH_KIND_LAST = 3;

type
  TCdIccStore = record
    parent_instance: TGObject;
  end;
  PCdIccStore = ^TCdIccStore;

  TCdIccStoreClass = record
    parent_class: TGObjectClass;
    added: procedure(icc: PCdIcc); cdecl;
    removed: procedure(icc: PCdIcc); cdecl;
  end;
  PCdIccStoreClass = ^TCdIccStoreClass;

function cd_icc_store_get_type: TGType; cdecl; external libcolord;
function cd_icc_store_new: PCdIccStore; cdecl; external libcolord;
function cd_icc_store_search_location(store: PCdIccStore; location: Pgchar; search_flags: TCdIccStoreSearchFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_store_search_kind(store: PCdIccStore; search_kind: TCdIccStoreSearchKind; search_flags: TCdIccStoreSearchFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_icc_store_set_load_flags(store: PCdIccStore; load_flags: TCdIccLoadFlags); cdecl; external libcolord;
function cd_icc_store_get_load_flags(store: PCdIccStore): TCdIccLoadFlags; cdecl; external libcolord;
procedure cd_icc_store_set_cache(store: PCdIccStore; cache: PGResource); cdecl; external libcolord;
function cd_icc_store_get_all(store: PCdIccStore): PGPtrArray; cdecl; external libcolord;
function cd_icc_store_find_by_filename(store: PCdIccStore; filename: Pgchar): PCdIcc; cdecl; external libcolord;
function cd_icc_store_find_by_checksum(store: PCdIccStore; checksum: Pgchar): PCdIcc; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:59 ===

function CD_TYPE_ICC_STORE: TGType;
function CD_ICC_STORE(obj: Pointer): PCdIccStore;
function CD_IS_ICC_STORE(obj: Pointer): Tgboolean;
function CD_ICC_STORE_CLASS(klass: Pointer): PCdIccStoreClass;
function CD_IS_ICC_STORE_CLASS(klass: Pointer): Tgboolean;
function CD_ICC_STORE_GET_CLASS(obj: Pointer): PCdIccStoreClass;

implementation

function CD_TYPE_ICC_STORE: TGType;
begin
  Result := cd_icc_store_get_type;
end;

function CD_ICC_STORE(obj: Pointer): PCdIccStore;
begin
  Result := PCdIccStore(g_type_check_instance_cast(obj, CD_TYPE_ICC_STORE));
end;

function CD_IS_ICC_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_ICC_STORE);
end;

function CD_ICC_STORE_CLASS(klass: Pointer): PCdIccStoreClass;
begin
  Result := PCdIccStoreClass(g_type_check_class_cast(klass, CD_TYPE_ICC_STORE));
end;

function CD_IS_ICC_STORE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_ICC_STORE);
end;

function CD_ICC_STORE_GET_CLASS(obj: Pointer): PCdIccStoreClass;
begin
  Result := PCdIccStoreClass(PGTypeInstance(obj)^.g_class);
end;



end.
