unit nm_vpn_editor_plugin;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_utils;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PNMVpnPluginInfo = type Pointer;
  PNMVpnEditorPlugin = type Pointer;
  PNMVpnEditor = type Pointer;

  TNMVpnEditorPluginFactory = function(error: PPGError): PNMVpnEditorPlugin; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_vpn_editor_plugin_factory(error: PPGError): PNMVpnEditorPlugin; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMVpnEditorPluginCapability = ^TNMVpnEditorPluginCapability;
  TNMVpnEditorPluginCapability = longint;

const
  NM_VPN_EDITOR_PLUGIN_CAPABILITY_NONE = $00;
  NM_VPN_EDITOR_PLUGIN_CAPABILITY_IMPORT = $01;
  NM_VPN_EDITOR_PLUGIN_CAPABILITY_EXPORT = $02;
  NM_VPN_EDITOR_PLUGIN_CAPABILITY_IPV6 = $04;

const
  NM_VPN_EDITOR_PLUGIN_NAME = 'name';
  NM_VPN_EDITOR_PLUGIN_DESCRIPTION = 'description';
  NM_VPN_EDITOR_PLUGIN_SERVICE = 'service';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMVpnEditorPluginVT = type Pointer;

  TNMVpnEditorPluginInterface = record
    g_iface: TGTypeInterface;
    get_editor: function(plugin: PNMVpnEditorPlugin; connection: PNMConnection; error: PPGError): PNMVpnEditor; cdecl;
    get_capabilities: function(plugin: PNMVpnEditorPlugin): TNMVpnEditorPluginCapability; cdecl;
    import_from_file: function(plugin: PNMVpnEditorPlugin; path: pchar; error: PPGError): PNMConnection; cdecl;
    export_to_file: function(plugin: PNMVpnEditorPlugin; path: pchar; connection: PNMConnection; error: PPGError): Tgboolean; cdecl;
    get_suggested_filename: function(plugin: PNMVpnEditorPlugin; connection: PNMConnection): pchar; cdecl;
    notify_plugin_info_set: procedure(plugin: PNMVpnEditorPlugin; plugin_info: PNMVpnPluginInfo); cdecl;
    get_vt: function(plugin: PNMVpnEditorPlugin; out_vt_size: Pgsize): PNMVpnEditorPluginVT; cdecl;
  end;
  PNMVpnEditorPluginInterface = ^TNMVpnEditorPluginInterface;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_vpn_editor_plugin_get_type: TGType; cdecl; external libnm;
function nm_vpn_editor_plugin_get_editor(plugin: PNMVpnEditorPlugin; connection: PNMConnection; error: PPGError): PNMVpnEditor; cdecl; external libnm;
function nm_vpn_editor_plugin_get_capabilities(plugin: PNMVpnEditorPlugin): TNMVpnEditorPluginCapability; cdecl; external libnm;
function nm_vpn_editor_plugin_get_vt(plugin: PNMVpnEditorPlugin; vt: PNMVpnEditorPluginVT; vt_size: Tgsize): Tgsize; cdecl; external libnm;
function nm_vpn_editor_plugin_import(plugin: PNMVpnEditorPlugin; path: pchar; error: PPGError): PNMConnection; cdecl; external libnm;
function nm_vpn_editor_plugin_export(plugin: PNMVpnEditorPlugin; path: pchar; connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_vpn_editor_plugin_get_suggested_filename(plugin: PNMVpnEditorPlugin; connection: PNMConnection): pchar; cdecl; external libnm;
function nm_vpn_editor_plugin_load_from_file(plugin_name: pchar; check_service: pchar; check_owner: longint; check_file: TNMUtilsCheckFilePredicate; user_data: Tgpointer;
  error: PPGError): PNMVpnEditorPlugin; cdecl; external libnm;
function nm_vpn_editor_plugin_load(plugin_name: pchar; check_service: pchar; error: PPGError): PNMVpnEditorPlugin; cdecl; external libnm;
function nm_vpn_editor_plugin_get_plugin_info(plugin: PNMVpnEditorPlugin): PNMVpnPluginInfo; cdecl; external libnm;
procedure nm_vpn_editor_plugin_set_plugin_info(plugin: PNMVpnEditorPlugin; plugin_info: PNMVpnPluginInfo); cdecl; external libnm;

// === Konventiert am: 19-4-26 19:19:36 ===

function NM_TYPE_VPN_EDITOR_PLUGIN: TGType;
function NM_VPN_EDITOR_PLUGIN(obj: Pointer): PNMVpnEditorPlugin;
function NM_IS_VPN_EDITOR_PLUGIN(obj: Pointer): Tgboolean;
function NM_VPN_EDITOR_PLUGIN_GET_INTERFACE(obj: Pointer): PNMVpnEditorPluginInterface;
{$ENDIF read_function}

implementation

function NM_TYPE_VPN_EDITOR_PLUGIN: TGType;
begin
  NM_TYPE_VPN_EDITOR_PLUGIN := nm_vpn_editor_plugin_get_type;
end;

function NM_VPN_EDITOR_PLUGIN(obj: Pointer): PNMVpnEditorPlugin;
begin
  Result := PNMVpnEditorPlugin(g_type_check_instance_cast(obj, NM_TYPE_VPN_EDITOR_PLUGIN));
end;

function NM_IS_VPN_EDITOR_PLUGIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_VPN_EDITOR_PLUGIN);
end;

function NM_VPN_EDITOR_PLUGIN_GET_INTERFACE(obj: Pointer): PNMVpnEditorPluginInterface;
begin
  Result := g_type_interface_peek(obj, NM_TYPE_VPN_EDITOR_PLUGIN);
end;



end.
