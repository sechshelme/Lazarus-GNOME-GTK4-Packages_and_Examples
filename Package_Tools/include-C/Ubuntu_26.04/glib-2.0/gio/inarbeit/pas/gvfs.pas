unit gvfs;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  G_VFS_EXTENSION_POINT_NAME = 'gio-vfs';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGVfs = ^TGVfs;
  TGVfs = record
    parent_instance: TGObject;
  end;

  PGVfsFileLookupFunc = ^TGVfsFileLookupFunc;
  TGVfsFileLookupFunc = function(vfs: PGVfs; identifier: pchar; user_data: Tgpointer): PGFile; cdecl;

  PGVfsClass = ^TGVfsClass;
  TGVfsClass = record
    parent_class: TGObjectClass;
    is_active: function(vfs: PGVfs): Tgboolean; cdecl;
    get_file_for_path: function(vfs: PGVfs; path: pchar): PGFile; cdecl;
    get_file_for_uri: function(vfs: PGVfs; uri: pchar): PGFile; cdecl;
    get_supported_uri_schemes: function(vfs: PGVfs): PPgchar; cdecl;
    parse_name: function(vfs: PGVfs; parse_name: pchar): PGFile; cdecl;
    local_file_add_info: procedure(vfs: PGVfs; filename: pchar; device: Tguint64; attribute_matcher: PGFileAttributeMatcher; info: PGFileInfo;
      cancellable: PGCancellable; extra_data: Pgpointer; free_extra_data: PGDestroyNotify); cdecl;
    add_writable_namespaces: procedure(vfs: PGVfs; list: PGFileAttributeInfoList); cdecl;
    local_file_set_attributes: function(vfs: PGVfs; filename: pchar; info: PGFileInfo; flags: TGFileQueryInfoFlags; cancellable: PGCancellable;
      error: PPGError): Tgboolean; cdecl;
    local_file_removed: procedure(vfs: PGVfs; filename: pchar); cdecl;
    local_file_moved: procedure(vfs: PGVfs; source: pchar; dest: pchar); cdecl;
    deserialize_icon: function(vfs: PGVfs; value: PGVariant): PGIcon; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_function}

{$IFDEF read_function}
function g_vfs_get_type: TGType; cdecl; external libgio2;
function g_vfs_is_active(vfs: PGVfs): Tgboolean; cdecl; external libgio2;
function g_vfs_get_file_for_path(vfs: PGVfs; path: pchar): PGFile; cdecl; external libgio2;
function g_vfs_get_file_for_uri(vfs: PGVfs; uri: pchar): PGFile; cdecl; external libgio2;
function g_vfs_get_supported_uri_schemes(vfs: PGVfs): PPgchar; cdecl; external libgio2;
function g_vfs_parse_name(vfs: PGVfs; parse_name: pchar): PGFile; cdecl; external libgio2;
function g_vfs_get_default: PGVfs; cdecl; external libgio2;
function g_vfs_get_local: PGVfs; cdecl; external libgio2;
function g_vfs_register_uri_scheme(vfs: PGVfs; scheme: pchar; uri_func: TGVfsFileLookupFunc; uri_data: Tgpointer; uri_destroy: TGDestroyNotify;
  parse_name_func: TGVfsFileLookupFunc; parse_name_data: Tgpointer; parse_name_destroy: TGDestroyNotify): Tgboolean; cdecl; external libgio2;
function g_vfs_unregister_uri_scheme(vfs: PGVfs; scheme: pchar): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:07:19 ===

function G_TYPE_VFS: TGType;
function G_VFS(obj: Pointer): PGVfs;
function G_VFS_CLASS(klass: Pointer): PGVfsClass;
function G_IS_VFS(obj: Pointer): Tgboolean;
function G_IS_VFS_CLASS(klass: Pointer): Tgboolean;
function G_VFS_GET_CLASS(obj: Pointer): PGVfsClass;
{$ENDIF read_function}

implementation

function G_TYPE_VFS: TGType;
begin
  G_TYPE_VFS := g_vfs_get_type;
end;

function G_VFS(obj: Pointer): PGVfs;
begin
  Result := PGVfs(g_type_check_instance_cast(obj, G_TYPE_VFS));
end;

function G_VFS_CLASS(klass: Pointer): PGVfsClass;
begin
  Result := PGVfsClass(g_type_check_class_cast(klass, G_TYPE_VFS));
end;

function G_IS_VFS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_VFS);
end;

function G_IS_VFS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_VFS);
end;

function G_VFS_GET_CLASS(obj: Pointer): PGVfsClass;
begin
  Result := PGVfsClass(PGTypeInstance(obj)^.g_class);
end;

end.
