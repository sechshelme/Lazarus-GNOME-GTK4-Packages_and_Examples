{$IFDEF read_interface}


function PEAS_PLUGIN_INFO_ERROR: TGQuark;

type
  PPeasPluginInfoError = ^TPeasPluginInfoError;
  TPeasPluginInfoError = longint;

const
  PEAS_PLUGIN_INFO_ERROR_LOADING_FAILED = 0;
  PEAS_PLUGIN_INFO_ERROR_LOADER_NOT_FOUND = 1;
  PEAS_PLUGIN_INFO_ERROR_DEP_NOT_FOUND = 2;
  PEAS_PLUGIN_INFO_ERROR_DEP_LOADING_FAILED = 3;

type
  TPeasPluginInfo = record
  end;
  PPeasPluginInfo = ^TPeasPluginInfo;

  TPeasPluginInfoClass = record
    parent_class: TGObjectClass;
  end;
  PPeasPluginInfoClass = ^TPeasPluginInfoClass;

function peas_plugin_info_get_type: TGType; cdecl; external libpeas2;
function peas_plugin_info_error_quark: TGQuark; cdecl; external libpeas2;
function peas_plugin_info_is_loaded(info: PPeasPluginInfo): Tgboolean; cdecl; external libpeas2;
function peas_plugin_info_is_available(info: PPeasPluginInfo; error: PPGError): Tgboolean; cdecl; external libpeas2;
function peas_plugin_info_is_builtin(info: PPeasPluginInfo): Tgboolean; cdecl; external libpeas2;
function peas_plugin_info_is_hidden(info: PPeasPluginInfo): Tgboolean; cdecl; external libpeas2;
function peas_plugin_info_get_module_name(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_module_dir(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_data_dir(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_settings(info: PPeasPluginInfo; schema_id: pchar): PGSettings; cdecl; external libpeas2;
function peas_plugin_info_get_dependencies(info: PPeasPluginInfo): PPchar; cdecl; external libpeas2;
function peas_plugin_info_has_dependency(info: PPeasPluginInfo; module_name: pchar): Tgboolean; cdecl; external libpeas2;
function peas_plugin_info_get_name(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_description(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_icon_name(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_authors(info: PPeasPluginInfo): PPchar; cdecl; external libpeas2;
function peas_plugin_info_get_website(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_copyright(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_version(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_help_uri(info: PPeasPluginInfo): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_external_data(info: PPeasPluginInfo; key: pchar): pchar; cdecl; external libpeas2;
function peas_plugin_info_get_resource(info: PPeasPluginInfo; filename: pchar; error: PPGError): PGResource; cdecl; external libpeas2;
procedure peas_plugin_info_load_resource(info: PPeasPluginInfo; filename: pchar; error: PPGError); cdecl; external libpeas2;

// === Konventiert am: 3-9-25 15:45:26 ===

function PEAS_TYPE_PLUGIN_INFO: TGType;
function PEAS_PLUGIN_INFO(obj: Pointer): PPeasPluginInfo;
function PEAS_IS_PLUGIN_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PEAS_TYPE_PLUGIN_INFO: TGType;
begin
  Result := peas_plugin_info_get_type;
end;

function PEAS_PLUGIN_INFO(obj: Pointer): PPeasPluginInfo;
begin
  Result := PPeasPluginInfo(g_type_check_instance_cast(obj, PEAS_TYPE_PLUGIN_INFO));
end;

function PEAS_IS_PLUGIN_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PEAS_TYPE_PLUGIN_INFO);
end;



function PEAS_PLUGIN_INFO_ERROR: TGQuark;
begin
  PEAS_PLUGIN_INFO_ERROR := peas_plugin_info_error_quark;
end;


{$ENDIF read_implementation}
