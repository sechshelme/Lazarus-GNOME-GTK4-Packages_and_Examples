unit peas_engine;

interface

uses
  fp_glib2, fp_peas2, peas_plugin_info;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TPeasEngine = record
  end;
  PPeasEngine = ^TPeasEngine;

  TPeasEngineClass = record
    parent_class: TGObjectClass;
  end;
  PPeasEngineClass = ^TPeasEngineClass;

function peas_engine_get_type: TGType; cdecl; external libpeas2;
function peas_engine_new: PPeasEngine; cdecl; external libpeas2;
function peas_engine_new_with_nonglobal_loaders: PPeasEngine; cdecl; external libpeas2;
function peas_engine_get_default: PPeasEngine; cdecl; external libpeas2;
procedure peas_engine_add_search_path(engine: PPeasEngine; module_dir: pchar; data_dir: pchar); cdecl; external libpeas2;
procedure peas_engine_enable_loader(engine: PPeasEngine; loader_name: pchar); cdecl; external libpeas2;
procedure peas_engine_rescan_plugins(engine: PPeasEngine); cdecl; external libpeas2;
function peas_engine_dup_loaded_plugins(engine: PPeasEngine): Ppchar; cdecl; external libpeas2;
procedure peas_engine_set_loaded_plugins(engine: PPeasEngine; plugin_names: PPchar); cdecl; external libpeas2;
function peas_engine_get_plugin_info(engine: PPeasEngine; plugin_name: pchar): PPeasPluginInfo; cdecl; external libpeas2;
function peas_engine_load_plugin(engine: PPeasEngine; info: PPeasPluginInfo): Tgboolean; cdecl; external libpeas2;
function peas_engine_unload_plugin(engine: PPeasEngine; info: PPeasPluginInfo): Tgboolean; cdecl; external libpeas2;
procedure peas_engine_garbage_collect(engine: PPeasEngine); cdecl; external libpeas2;
function peas_engine_provides_extension(engine: PPeasEngine; info: PPeasPluginInfo; extension_type: TGType): Tgboolean; cdecl; external libpeas2;
function peas_engine_create_extension_with_properties(engine: PPeasEngine; info: PPeasPluginInfo; extension_type: TGType; n_properties: Tguint; prop_names: PPchar;
  prop_values: PGValue): PGObject; cdecl; external libpeas2;
function peas_engine_create_extension_valist(engine: PPeasEngine; info: PPeasPluginInfo; extension_type: TGType; first_property: pchar; var_args: Tva_list): PGObject; cdecl; external libpeas2;
function peas_engine_create_extension(engine: PPeasEngine; info: PPeasPluginInfo; extension_type: TGType; first_property: pchar; args: array of const): PGObject; cdecl; external libpeas2;
function peas_engine_create_extension(engine: PPeasEngine; info: PPeasPluginInfo; extension_type: TGType; first_property: pchar): PGObject; cdecl; external libpeas2;

// === Konventiert am: 3-9-25 15:44:49 ===

function PEAS_TYPE_ENGINE: TGType;
function PEAS_ENGINE(obj: Pointer): PPeasEngine;
function PEAS_IS_ENGINE(obj: Pointer): Tgboolean;

implementation

function PEAS_TYPE_ENGINE: TGType;
begin
  Result := peas_engine_get_type;
end;

function PEAS_ENGINE(obj: Pointer): PPeasEngine;
begin
  Result := PPeasEngine(g_type_check_instance_cast(obj, PEAS_TYPE_ENGINE));
end;

function PEAS_IS_ENGINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PEAS_TYPE_ENGINE);
end;


end.
