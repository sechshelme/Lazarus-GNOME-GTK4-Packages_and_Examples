unit gpermission;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGPermissionPrivate = type Pointer;

  PGPermission = ^TGPermission;
  TGPermission = record
    parent_instance: TGObject;
    priv: PGPermissionPrivate;
  end;

  PGPermissionClass = ^TGPermissionClass;
  TGPermissionClass = record
    parent_class: TGObjectClass;
    acquire: function(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    acquire_async: procedure(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    acquire_finish: function(permission: PGPermission; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    release: function(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    release_async: procedure(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    release_finish: function(permission: PGPermission; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    reserved: array[0..15] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_permission_get_type: TGType; cdecl; external libgio2;
function g_permission_acquire(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_permission_acquire_async(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_permission_acquire_finish(permission: PGPermission; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_permission_release(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_permission_release_async(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_permission_release_finish(permission: PGPermission; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_permission_get_allowed(permission: PGPermission): Tgboolean; cdecl; external libgio2;
function g_permission_get_can_acquire(permission: PGPermission): Tgboolean; cdecl; external libgio2;
function g_permission_get_can_release(permission: PGPermission): Tgboolean; cdecl; external libgio2;
procedure g_permission_impl_update(permission: PGPermission; allowed: Tgboolean; can_acquire: Tgboolean; can_release: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:43:02 ===

function G_TYPE_PERMISSION: TGType;
function G_PERMISSION(obj: Pointer): PGPermission;
function G_PERMISSION_CLASS(klass: Pointer): PGPermissionClass;
function G_IS_PERMISSION(obj: Pointer): Tgboolean;
function G_IS_PERMISSION_CLASS(klass: Pointer): Tgboolean;
function G_PERMISSION_GET_CLASS(obj: Pointer): PGPermissionClass;
{$ENDIF read_function}

implementation

function G_TYPE_PERMISSION: TGType;
begin
  G_TYPE_PERMISSION := g_permission_get_type;
end;

function G_PERMISSION(obj: Pointer): PGPermission;
begin
  Result := PGPermission(g_type_check_instance_cast(obj, G_TYPE_PERMISSION));
end;

function G_PERMISSION_CLASS(klass: Pointer): PGPermissionClass;
begin
  Result := PGPermissionClass(g_type_check_class_cast(klass, G_TYPE_PERMISSION));
end;

function G_IS_PERMISSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PERMISSION);
end;

function G_IS_PERMISSION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_PERMISSION);
end;

function G_PERMISSION_GET_CLASS(obj: Pointer): PGPermissionClass;
begin
  Result := PGPermissionClass(PGTypeInstance(obj)^.g_class);
end;



end.
