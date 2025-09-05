{$IFDEF read_interface}


type
  PPeasFactoryFunc = ^TPeasFactoryFunc;
  TPeasFactoryFunc = function(n_parameters: Tguint; parameters: PGParameter; user_data: Tgpointer): PGObject; cdecl;

  TPeasObjectModule = record
    parent_instance: TGTypeModule;
  end;
  PPeasObjectModule = ^TPeasObjectModule;

  TPeasObjectModuleClass = record
    parent_class: TGTypeModuleClass;
    _reserved: array[0..7] of Tgpointer;
  end;
  PPeasObjectModuleClass = ^TPeasObjectModuleClass;

function peas_object_module_get_type: TGType; cdecl; external libpeas2;
function peas_object_module_new(module_name: pchar; path: pchar; resident: Tgboolean): PPeasObjectModule; cdecl; external libpeas2;
function peas_object_module_new_full(module_name: pchar; path: pchar; resident: Tgboolean; local_linkage: Tgboolean): PPeasObjectModule; cdecl; external libpeas2;
function peas_object_module_new_embedded(module_name: pchar; symbol: pchar): PPeasObjectModule; cdecl; external libpeas2;
function peas_object_module_create_object(module: PPeasObjectModule; exten_type: TGType; n_parameters: Tguint; parameters: PGParameter): PGObject; cdecl; external libpeas2; deprecated;
function peas_object_module_provides_object(module: PPeasObjectModule; exten_type: TGType): Tgboolean; cdecl; external libpeas2;
function peas_object_module_get_path(module: PPeasObjectModule): pchar; cdecl; external libpeas2;
function peas_object_module_get_module_name(module: PPeasObjectModule): pchar; cdecl; external libpeas2;
function peas_object_module_get_symbol(module: PPeasObjectModule): pchar; cdecl; external libpeas2;
function peas_object_module_get_library(module: PPeasObjectModule): PGModule; cdecl; external libpeas2;
procedure peas_object_module_register_extension_factory(module: PPeasObjectModule; exten_type: TGType; factory_func: TPeasFactoryFunc; user_data: Tgpointer; destroy_func: TGDestroyNotify); cdecl; external libpeas2;
procedure peas_object_module_register_extension_type(module: PPeasObjectModule; exten_type: TGType; impl_type: TGType); cdecl; external libpeas2;

// === Konventiert am: 3-9-25 15:45:12 ===

function PEAS_TYPE_OBJECT_MODULE: TGType;
function PEAS_OBJECT_MODULE(obj: Pointer): PPeasObjectModule;
function PEAS_IS_OBJECT_MODULE(obj: Pointer): Tgboolean;
function PEAS_OBJECT_MODULE_CLASS(klass: Pointer): PPeasObjectModuleClass;
function PEAS_IS_OBJECT_MODULE_CLASS(klass: Pointer): Tgboolean;
function PEAS_OBJECT_MODULE_GET_CLASS(obj: Pointer): PPeasObjectModuleClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PEAS_TYPE_OBJECT_MODULE: TGType;
begin
  Result := peas_object_module_get_type;
end;

function PEAS_OBJECT_MODULE(obj: Pointer): PPeasObjectModule;
begin
  Result := PPeasObjectModule(g_type_check_instance_cast(obj, PEAS_TYPE_OBJECT_MODULE));
end;

function PEAS_IS_OBJECT_MODULE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PEAS_TYPE_OBJECT_MODULE);
end;

function PEAS_OBJECT_MODULE_CLASS(klass: Pointer): PPeasObjectModuleClass;
begin
  Result := PPeasObjectModuleClass(g_type_check_class_cast(klass, PEAS_TYPE_OBJECT_MODULE));
end;

function PEAS_IS_OBJECT_MODULE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PEAS_TYPE_OBJECT_MODULE);
end;

function PEAS_OBJECT_MODULE_GET_CLASS(obj: Pointer): PPeasObjectModuleClass;
begin
  Result := PPeasObjectModuleClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
