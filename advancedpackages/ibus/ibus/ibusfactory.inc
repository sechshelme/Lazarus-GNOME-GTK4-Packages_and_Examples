{$IFDEF read_interface}


type
  PIBusFactoryPrivate = type Pointer;

  TIBusFactory = record
    parent: TIBusService;
    priv: PIBusFactoryPrivate;
  end;
  PIBusFactory = ^TIBusFactory;

  TIBusFactoryClass = record
    parent: TIBusServiceClass;
    create_engine: function(factory: PIBusFactory; engine_name: Pgchar): PIBusEngine; cdecl;
    pdummy: array[0..6] of Tgpointer;
  end;
  PIBusFactoryClass = ^TIBusFactoryClass;

function ibus_factory_get_type: TGType; cdecl; external libibus;
function ibus_factory_new(connection: PGDBusConnection): PIBusFactory; cdecl; external libibus;
procedure ibus_factory_add_engine(factory: PIBusFactory; engine_name: Pgchar; engine_type: TGType); cdecl; external libibus;
function ibus_factory_create_engine(factory: PIBusFactory; engine_name: Pgchar): PIBusEngine; cdecl; external libibus;

// === Konventiert am: 26-7-25 16:00:01 ===

function IBUS_TYPE_FACTORY: TGType;
function IBUS_FACTORY(obj: Pointer): PIBusFactory;
function IBUS_FACTORY_CLASS(klass: Pointer): PIBusFactoryClass;
function IBUS_IS_FACTORY(obj: Pointer): Tgboolean;
function IBUS_IS_FACTORY_CLASS(klass: Pointer): Tgboolean;
function IBUS_FACTORY_GET_CLASS(obj: Pointer): PIBusFactoryClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_FACTORY: TGType;
begin
  IBUS_TYPE_FACTORY := ibus_factory_get_type;
end;

function IBUS_FACTORY(obj: Pointer): PIBusFactory;
begin
  Result := PIBusFactory(g_type_check_instance_cast(obj, IBUS_TYPE_FACTORY));
end;

function IBUS_FACTORY_CLASS(klass: Pointer): PIBusFactoryClass;
begin
  Result := PIBusFactoryClass(g_type_check_class_cast(klass, IBUS_TYPE_FACTORY));
end;

function IBUS_IS_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_FACTORY);
end;

function IBUS_IS_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_FACTORY);
end;

function IBUS_FACTORY_GET_CLASS(obj: Pointer): PIBusFactoryClass;
begin
  Result := PIBusFactoryClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
