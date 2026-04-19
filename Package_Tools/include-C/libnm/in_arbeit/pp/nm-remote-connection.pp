
unit nm-remote-connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-remote-connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-remote-connection.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGVariant  = ^GVariant;
PNMRemoteConnection  = ^NMRemoteConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
  }
{$ifndef __NM_REMOTE_CONNECTION_H__}
{$define __NM_REMOTE_CONNECTION_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{ was #define dname def_expr }
function NM_TYPE_REMOTE_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_REMOTE_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_REMOTE_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_REMOTE_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_REMOTE_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_REMOTE_CONNECTION_GET_CLASS(obj : longint) : longint;

{ Properties  }
const
  NM_REMOTE_CONNECTION_DBUS_CONNECTION = 'dbus-connection';  
  NM_REMOTE_CONNECTION_PATH = 'path';  
  NM_REMOTE_CONNECTION_UNSAVED = 'unsaved';  
  NM_REMOTE_CONNECTION_FLAGS = 'flags';  
  NM_REMOTE_CONNECTION_FILENAME = 'filename';  
  NM_REMOTE_CONNECTION_VERSION_ID = 'version-id';  
  NM_REMOTE_CONNECTION_VISIBLE = 'visible';  
{*
 * NMRemoteConnection:
  }
type

function nm_remote_connection_get_type:TGType;cdecl;external;
procedure nm_remote_connection_update2(connection:PNMRemoteConnection; settings:PGVariant; flags:TNMSettingsUpdate2Flags; args:PGVariant; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_remote_connection_update2_finish(connection:PNMRemoteConnection; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_remote_connection_commit_changes(connection:PNMRemoteConnection; save_to_disk:Tgboolean; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_remote_connection_commit_changes_async(connection:PNMRemoteConnection; save_to_disk:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_remote_connection_commit_changes_finish(connection:PNMRemoteConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_remote_connection_save(connection:PNMRemoteConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_remote_connection_save_async(connection:PNMRemoteConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_remote_connection_save_finish(connection:PNMRemoteConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_remote_connection_delete(connection:PNMRemoteConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_remote_connection_delete_async(connection:PNMRemoteConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_remote_connection_delete_finish(connection:PNMRemoteConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_remote_connection_get_secrets(connection:PNMRemoteConnection; setting_name:Pchar; cancellable:PGCancellable; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
procedure nm_remote_connection_get_secrets_async(connection:PNMRemoteConnection; setting_name:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_remote_connection_get_secrets_finish(connection:PNMRemoteConnection; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
function nm_remote_connection_get_unsaved(connection:PNMRemoteConnection):Tgboolean;cdecl;external;
function nm_remote_connection_get_flags(connection:PNMRemoteConnection):TNMSettingsConnectionFlags;cdecl;external;
(* Const before type ignored *)
function nm_remote_connection_get_filename(connection:PNMRemoteConnection):Pchar;cdecl;external;
function nm_remote_connection_get_visible(connection:PNMRemoteConnection):Tgboolean;cdecl;external;
function nm_remote_connection_get_version_id(connection:PNMRemoteConnection):Tguint64;cdecl;external;
{$endif}
{ __NM_REMOTE_CONNECTION__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_REMOTE_CONNECTION : longint; { return type might be wrong }
  begin
    NM_TYPE_REMOTE_CONNECTION:=nm_remote_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_REMOTE_CONNECTION(obj : longint) : longint;
begin
  NM_REMOTE_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_REMOTE_CONNECTION,NMRemoteConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_REMOTE_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_REMOTE_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_REMOTE_CONNECTION,NMRemoteConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_REMOTE_CONNECTION(obj : longint) : longint;
begin
  NM_IS_REMOTE_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_REMOTE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_REMOTE_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_IS_REMOTE_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_REMOTE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_REMOTE_CONNECTION_GET_CLASS(obj : longint) : longint;
begin
  NM_REMOTE_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_REMOTE_CONNECTION,NMRemoteConnectionClass);
end;


end.
