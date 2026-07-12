unit gstdynamictypefactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstplugin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstDynamicTypeFactory = type Pointer;
  PGstDynamicTypeFactoryClass = type Pointer;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_dynamic_type_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_dynamic_type_factory_load(factoryname: Pgchar): TGType; cdecl; external libgstreamer;
function gst_dynamic_type_register(plugin: PGstPlugin; _type: TGType): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 10:59:55 ===

function GST_DYNAMIC_TYPE_FACTORY_CAST(obj: Pointer): PGstDynamicTypeFactory;
function GST_TYPE_DYNAMIC_TYPE_FACTORY: TGType;
function GST_DYNAMIC_TYPE_FACTORY(obj: Pointer): PGstDynamicTypeFactory;
function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass: Pointer): PGstDynamicTypeFactoryClass;
function GST_IS_DYNAMIC_TYPE_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

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

end.
