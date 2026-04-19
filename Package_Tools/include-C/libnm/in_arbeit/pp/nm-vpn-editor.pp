
unit nm-vpn-editor;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-vpn-editor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-vpn-editor
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
PGError  = ^GError;
PGObject  = ^GObject;
PNMConnection  = ^NMConnection;
PNMVpnEditor  = ^NMVpnEditor;
PNMVpnEditorInterface  = ^NMVpnEditorInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2008 Novell, Inc.
 * Copyright (C) 2008 - 2015 Red Hat, Inc.
  }
{$ifndef __NM_VPN_EDITOR_H__}
{$define __NM_VPN_EDITOR_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <glib-object.h>}
{$include "nm-vpn-editor-plugin.h"}
{*************************************************************************** }
{ Editor interface                                }
{*************************************************************************** }

{ was #define dname def_expr }
function NM_TYPE_VPN_EDITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_EDITOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR_GET_INTERFACE(obj : longint) : longint;

{*
 * NMVpnEditorInterface:
 * @g_iface: the parent interface
 * @get_widget: return the #GtkWidget for the VPN editor's UI
 * @placeholder: not currently used
 * @update_connection: called to save the user-entered options to the connection
 *   object.  Should return %FALSE and set @error if the current options are
 *   invalid.  @error should contain enough information for the plugin to
 *   determine which UI widget is invalid at a later point in time.  For
 *   example, creating unique error codes for what error occurred and populating
 *   the message field of @error with the name of the invalid property.
 * @changed: emitted when the value of a UI widget changes.  May trigger a
 *   validity check via @update_connection to write values to the connection.
 *
 * Interface for editing a specific #NMConnection
  }
type
  PNMVpnEditorInterface = ^TNMVpnEditorInterface;
  TNMVpnEditorInterface = record
      g_iface : TGTypeInterface;
      get_widget : function (editor:PNMVpnEditor):PGObject;cdecl;
      placeholder : procedure ;cdecl;
      update_connection : function (editor:PNMVpnEditor; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;
      changed : procedure (editor:PNMVpnEditor);cdecl;
    end;

function nm_vpn_editor_get_type:TGType;cdecl;external;
function nm_vpn_editor_get_widget(editor:PNMVpnEditor):PGObject;cdecl;external;
function nm_vpn_editor_update_connection(editor:PNMVpnEditor; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __NM_VPN_EDITOR_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_VPN_EDITOR : longint; { return type might be wrong }
  begin
    NM_TYPE_VPN_EDITOR:=nm_vpn_editor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR(obj : longint) : longint;
begin
  NM_VPN_EDITOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_VPN_EDITOR,NMVpnEditor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_EDITOR(obj : longint) : longint;
begin
  NM_IS_VPN_EDITOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_VPN_EDITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR_GET_INTERFACE(obj : longint) : longint;
begin
  NM_VPN_EDITOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,NM_TYPE_VPN_EDITOR,NMVpnEditorInterface);
end;


end.
