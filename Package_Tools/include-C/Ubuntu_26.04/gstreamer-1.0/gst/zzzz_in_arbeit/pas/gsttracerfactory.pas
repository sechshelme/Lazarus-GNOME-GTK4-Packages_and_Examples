unit gsttracerfactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstTracerFactory = type Pointer;
  PGstTracerFactoryClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_tracer_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_tracer_factory_get_list: PGList; cdecl; external libgstreamer;
function gst_tracer_factory_get_tracer_type(factory: PGstTracerFactory): TGType; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:54:58 ===

function GST_TRACER_FACTORY_CAST(obj: Pointer): PGstTracerFactory;
function GST_TYPE_TRACER_FACTORY: TGType;
function GST_TRACER_FACTORY(obj: Pointer): PGstTracerFactory;
function GST_TRACER_FACTORY_CLASS(klass: Pointer): PGstTracerFactoryClass;
function GST_IS_TRACER_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_TRACER_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GST_TRACER_FACTORY_GET_CLASS(obj: Pointer): PGstTracerFactoryClass;
{$ENDIF read_function}

implementation

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

end.
