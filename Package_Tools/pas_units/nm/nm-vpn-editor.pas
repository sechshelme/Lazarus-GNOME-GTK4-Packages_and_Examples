unit nm_vpn_editor;

interface

uses
  fp_glib2, fp_nm;

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

function nm_vpn_editor_get_type:TGType;cdecl;external libnm;
function nm_vpn_editor_get_widget(editor:PNMVpnEditor):PGObject;cdecl;external libnm;
function nm_vpn_editor_update_connection(editor:PNMVpnEditor; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_VPN_EDITOR_H__  }

// === Konventiert am: 19-4-26 19:19:45 ===

function NM_TYPE_VPN_EDITOR : TGType;
function NM_VPN_EDITOR(obj : Pointer) : PNMVpnEditor;
function NM_IS_VPN_EDITOR(obj : Pointer) : Tgboolean;
function NM_VPN_EDITOR_GET_INTERFACE(obj : Pointer) : PNMVpnEditorInterface;

implementation

function NM_TYPE_VPN_EDITOR : TGType;
  begin
    NM_TYPE_VPN_EDITOR:=nm_vpn_editor_get_type;
  end;

function NM_VPN_EDITOR(obj : Pointer) : PNMVpnEditor;
begin
  Result := PNMVpnEditor(g_type_check_instance_cast(obj, NM_TYPE_VPN_EDITOR));
end;

function NM_IS_VPN_EDITOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_VPN_EDITOR);
end;

function NM_VPN_EDITOR_GET_INTERFACE(obj : Pointer) : PNMVpnEditorInterface;
begin
  Result := g_type_interface_peek(obj, NM_TYPE_VPN_EDITOR);
end;



end.
