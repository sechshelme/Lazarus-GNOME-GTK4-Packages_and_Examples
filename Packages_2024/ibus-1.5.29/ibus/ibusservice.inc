{$IFDEF read_interface}


type
  PIBusServicePrivate = type Pointer;

  TIBusService = record
    parent: TIBusObject;
    priv: PIBusServicePrivate;
  end;
  PIBusService = ^TIBusService;

  TIBusServiceClass = record
    parent: TIBusObjectClass;
    service_method_call: procedure(service: PIBusService; connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar;
      method_name: Pgchar; parameters: PGVariant; invocation: PGDBusMethodInvocation); cdecl;
    service_get_property: function(service: PIBusService; connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar;
      property_name: Pgchar; error: PPGError): PGVariant; cdecl;
    service_set_property: function(service: PIBusService; connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar;
      property_name: Pgchar; value: PGVariant; error: PPGError): Tgboolean; cdecl;
    interfaces: PGArray;
    pdummy: array[0..3] of Tgpointer;
  end;
  PIBusServiceClass = ^TIBusServiceClass;

function ibus_service_get_type: TGType; cdecl; external libibus;
function ibus_service_new(connection: PGDBusConnection; path: Pgchar): PIBusService; cdecl; external libibus;
function ibus_service_get_object_path(service: PIBusService): Pgchar; cdecl; external libibus;
function ibus_service_get_connection(service: PIBusService): PGDBusConnection; cdecl; external libibus;
function ibus_service_register(service: PIBusService; connection: PGDBusConnection; error: PPGError): Tgboolean; cdecl; external libibus;
procedure ibus_service_unregister(service: PIBusService; connection: PGDBusConnection); cdecl; external libibus;
function ibus_service_emit_signal(service: PIBusService; dest_bus_name: Pgchar; interface_name: Pgchar; signal_name: Pgchar; parameters: PGVariant; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_service_class_add_interfaces(klass: PIBusServiceClass; xml_data: Pgchar): Tgboolean; cdecl; external libibus;
function ibus_service_class_free_interfaces(klass: PIBusServiceClass; depth: longint): longint; cdecl; external libibus;

// === Konventiert am: 25-7-25 19:47:17 ===

function IBUS_TYPE_SERVICE: TGType;
function IBUS_SERVICE(obj: Pointer): PIBusService;
function IBUS_SERVICE_CLASS(klass: Pointer): PIBusServiceClass;
function IBUS_IS_SERVICE(obj: Pointer): Tgboolean;
function IBUS_IS_SERVICE_CLASS(klass: Pointer): Tgboolean;
function IBUS_SERVICE_GET_CLASS(obj: Pointer): PIBusServiceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_SERVICE: TGType;
begin
  IBUS_TYPE_SERVICE := ibus_service_get_type;
end;

function IBUS_SERVICE(obj: Pointer): PIBusService;
begin
  Result := PIBusService(g_type_check_instance_cast(obj, IBUS_TYPE_SERVICE));
end;

function IBUS_SERVICE_CLASS(klass: Pointer): PIBusServiceClass;
begin
  Result := PIBusServiceClass(g_type_check_class_cast(klass, IBUS_TYPE_SERVICE));
end;

function IBUS_IS_SERVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_SERVICE);
end;

function IBUS_IS_SERVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_SERVICE);
end;

function IBUS_SERVICE_GET_CLASS(obj: Pointer): PIBusServiceClass;
begin
  Result := PIBusServiceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
