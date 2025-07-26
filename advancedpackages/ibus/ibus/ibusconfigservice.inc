{$IFDEF read_interface}


type
  TIBusConfigService = record
    parent: TIBusService;
  end;
  PIBusConfigService = ^TIBusConfigService;

  TIBusConfigServiceClass = record
    parent: TIBusServiceClass;
    set_value: function(config: PIBusConfigService; section: Pgchar; name: Pgchar; value: PGVariant; error: PPGError): Tgboolean; cdecl;
    get_value: function(config: PIBusConfigService; section: Pgchar; name: Pgchar; error: PPGError): PGVariant; cdecl;
    unset_value: function(config: PIBusConfigService; section: Pgchar; name: Pgchar; error: PPGError): Tgboolean; cdecl;
    get_values: function(config: PIBusConfigService; section: Pgchar; error: PPGError): PGVariant; cdecl;
    pdummy: array[0..11] of Tgpointer;
  end;
  PIBusConfigServiceClass = ^TIBusConfigServiceClass;

function ibus_config_service_get_type: TGType; cdecl; external libibus;
function ibus_config_service_new(connection: PGDBusConnection): PIBusConfigService; cdecl; external libibus;
procedure ibus_config_service_value_changed(config: PIBusConfigService; section: Pgchar; name: Pgchar; value: PGVariant); cdecl; external libibus;

// === Konventiert am: 26-7-25 15:32:30 ===

function IBUS_TYPE_CONFIG_SERVICE: TGType;
function IBUS_CONFIG_SERVICE(obj: Pointer): PIBusConfigService;
function IBUS_CONFIG_SERVICE_CLASS(klass: Pointer): PIBusConfigServiceClass;
function IBUS_IS_CONFIG_SERVICE(obj: Pointer): Tgboolean;
function IBUS_IS_CONFIG_SERVICE_CLASS(klass: Pointer): Tgboolean;
function IBUS_CONFIG_SERVICE_GET_CLASS(obj: Pointer): PIBusConfigServiceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_CONFIG_SERVICE: TGType;
begin
  IBUS_TYPE_CONFIG_SERVICE := ibus_config_service_get_type;
end;

function IBUS_CONFIG_SERVICE(obj: Pointer): PIBusConfigService;
begin
  Result := PIBusConfigService(g_type_check_instance_cast(obj, IBUS_TYPE_CONFIG_SERVICE));
end;

function IBUS_CONFIG_SERVICE_CLASS(klass: Pointer): PIBusConfigServiceClass;
begin
  Result := PIBusConfigServiceClass(g_type_check_class_cast(klass, IBUS_TYPE_CONFIG_SERVICE));
end;

function IBUS_IS_CONFIG_SERVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_CONFIG_SERVICE);
end;

function IBUS_IS_CONFIG_SERVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_CONFIG_SERVICE);
end;

function IBUS_CONFIG_SERVICE_GET_CLASS(obj: Pointer): PIBusConfigServiceClass;
begin
  Result := PIBusConfigServiceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
