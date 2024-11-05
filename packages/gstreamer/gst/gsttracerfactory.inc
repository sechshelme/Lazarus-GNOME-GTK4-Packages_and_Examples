/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstTracerFactoryClass = record
  end;
  PGstTracerFactoryClass = ^TGstTracerFactoryClass;

  TGstTracerFactory = record
  end;
  PGstTracerFactory = ^TGstTracerFactory;

function gst_tracer_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_tracer_factory_get_list: PGList; cdecl; external libgstreamer;
function gst_tracer_factory_get_tracer_type(factory: PGstTracerFactory): TGType; cdecl; external libgstreamer;

function GST_TRACER_FACTORY_CAST(obj: Pointer): PGstTracerFactory;


// === Konventiert am: 18-9-24 15:43:53 ===

function GST_TYPE_TRACER_FACTORY: TGType;
function GST_TRACER_FACTORY(obj: Pointer): PGstTracerFactory;
function GST_TRACER_FACTORY_CLASS(klass: Pointer): PGstTracerFactoryClass;
function GST_IS_TRACER_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_TRACER_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GST_TRACER_FACTORY_GET_CLASS(obj: Pointer): PGstTracerFactoryClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TRACER_FACTORY: TGType;
begin
  GST_TYPE_TRACER_FACTORY := gst_tracer_factory_get_type;
end;

function GST_TRACER_FACTORY(obj: Pointer): PGstTracerFactory;
begin
  Result := PGstTracerFactory(g_type_check_instance_cast(obj, GST_TYPE_TRACER_FACTORY));
end;

function GST_TRACER_FACTORY_CLASS(klass: Pointer): PGstTracerFactoryClass;
begin
  Result := PGstTracerFactoryClass(g_type_check_class_cast(klass, GST_TYPE_TRACER_FACTORY));
end;

function GST_IS_TRACER_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRACER_FACTORY);
end;

function GST_IS_TRACER_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TRACER_FACTORY);
end;

function GST_TRACER_FACTORY_GET_CLASS(obj: Pointer): PGstTracerFactoryClass;
begin
  Result := PGstTracerFactoryClass(PGTypeInstance(obj)^.g_class);
end;


function GST_TRACER_FACTORY_CAST(obj: Pointer): PGstTracerFactory;
begin
  GST_TRACER_FACTORY_CAST := PGstTracerFactory(obj);
end;


{$ENDIF read_implementation}
