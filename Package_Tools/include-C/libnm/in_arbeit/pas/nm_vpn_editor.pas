unit nm_vpn_editor;

interface

uses
  fp_glib2, fp_nm, nm_core_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PNMVpnEditor = type Pointer;

  PNMVpnEditorInterface = ^TNMVpnEditorInterface;
  TNMVpnEditorInterface = record
    g_iface: TGTypeInterface;
    get_widget: function(editor: PNMVpnEditor): PGObject; cdecl;
    placeholder: procedure; cdecl;
    update_connection: function(editor: PNMVpnEditor; connection: PNMConnection; error: PPGError): Tgboolean; cdecl;
    changed: procedure(editor: PNMVpnEditor); cdecl;
  end;

function nm_vpn_editor_get_type: TGType; cdecl; external libnm;
function nm_vpn_editor_get_widget(editor: PNMVpnEditor): PGObject; cdecl; external libnm;
function nm_vpn_editor_update_connection(editor: PNMVpnEditor; connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;

// === Konventiert am: 5-8-26 20:08:34 ===

function NM_TYPE_VPN_EDITOR: TGType;
function NM_VPN_EDITOR(obj: Pointer): PNMVpnEditor;
function NM_IS_VPN_EDITOR(obj: Pointer): Tgboolean;
function NM_VPN_EDITOR_GET_INTERFACE(obj: Pointer): PNMVpnEditorInterface;

implementation

function NM_TYPE_VPN_EDITOR: TGType;
begin
  NM_TYPE_VPN_EDITOR := nm_vpn_editor_get_type;
end;

function NM_VPN_EDITOR(obj: Pointer): PNMVpnEditor;
begin
  Result := PNMVpnEditor(g_type_check_instance_cast(obj, NM_TYPE_VPN_EDITOR));
end;

function NM_IS_VPN_EDITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_VPN_EDITOR);
end;

function NM_VPN_EDITOR_GET_INTERFACE(obj: Pointer): PNMVpnEditorInterface;
begin
  Result := g_type_interface_peek(obj, NM_TYPE_VPN_EDITOR);
end;



end.
