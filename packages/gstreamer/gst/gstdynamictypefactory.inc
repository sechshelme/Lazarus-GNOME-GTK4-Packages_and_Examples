
{$IFDEF read_interface}

type
  TGstDynamicTypeFactory = record
  end;
  PGstDynamicTypeFactory = ^TGstDynamicTypeFactory;

  TGstDynamicTypeFactoryClass = record
  end;
  PGstDynamicTypeFactoryClass = ^TGstDynamicTypeFactoryClass;

function gst_dynamic_type_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_dynamic_type_factory_load(factoryname: Pgchar): TGType; cdecl; external libgstreamer;
function gst_dynamic_type_register(plugin: PGstPlugin; _type: TGType): Tgboolean; cdecl; external libgstreamer;

function GST_DYNAMIC_TYPE_FACTORY_CAST(obj: Pointer): PGstDynamicTypeFactory;

// === Konventiert am: 17-9-24 16:00:47 ===

function GST_TYPE_DYNAMIC_TYPE_FACTORY: TGType;
function GST_DYNAMIC_TYPE_FACTORY(obj: Pointer): PGstDynamicTypeFactory;
function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass: Pointer): PGstDynamicTypeFactoryClass;
function GST_IS_DYNAMIC_TYPE_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DYNAMIC_TYPE_FACTORY: TGType;
begin
  GST_TYPE_DYNAMIC_TYPE_FACTORY := gst_dynamic_type_factory_get_type;
end;

function GST_DYNAMIC_TYPE_FACTORY(obj: Pointer): PGstDynamicTypeFactory;
begin
  Result := PGstDynamicTypeFactory(g_type_check_instance_cast(obj, GST_TYPE_DYNAMIC_TYPE_FACTORY));
end;

function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass: Pointer): PGstDynamicTypeFactoryClass;
begin
  Result := PGstDynamicTypeFactoryClass(g_type_check_class_cast(klass, GST_TYPE_DYNAMIC_TYPE_FACTORY));
end;

function GST_IS_DYNAMIC_TYPE_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DYNAMIC_TYPE_FACTORY);
end;

function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DYNAMIC_TYPE_FACTORY);
end;


function GST_DYNAMIC_TYPE_FACTORY_CAST(obj: Pointer): PGstDynamicTypeFactory;
begin
  GST_DYNAMIC_TYPE_FACTORY_CAST := PGstDynamicTypeFactory(obj);
end;


{$ENDIF read_implementation}
