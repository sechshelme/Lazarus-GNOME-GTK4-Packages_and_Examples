
  {$IFDEF read_struct}
type
  PGstTracerPrivate = type Pointer;

  PGstTracer = ^TGstTracer;
  TGstTracer = record
    parent: TGstObject;
    priv: PGstTracerPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstTracerClass = ^TGstTracerClass;
  TGstTracerClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_tracer_get_type: TGType; cdecl; external libgstreamer;
procedure gst_tracing_register_hook(tracer: PGstTracer; detail: Pgchar; func: TGCallback); cdecl; external libgstreamer;
function gst_tracer_register(plugin: PGstPlugin; name: Pgchar; _type: TGType): Tgboolean; cdecl; external libgstreamer;
function gst_tracing_get_active_tracers: PGList; cdecl; external libgstreamer;
function gst_tracer_class_uses_structure_params(tracer_class: PGstTracerClass): Tgboolean; cdecl; external libgstreamer;
procedure gst_tracer_class_set_use_structure_params(tracer_class: PGstTracerClass; use_structure_params: Tgboolean); cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:32:47 ===

function GST_TYPE_TRACER: TGType;
function GST_TRACER(obj: Pointer): PGstTracer;
function GST_TRACER_CLASS(klass: Pointer): PGstTracerClass;
function GST_IS_TRACER(obj: Pointer): Tgboolean;
function GST_IS_TRACER_CLASS(klass: Pointer): Tgboolean;
function GST_TRACER_GET_CLASS(obj: Pointer): PGstTracerClass;
function GST_TRACER_CAST(obj: longint): PGstTracer;
{$ENDIF read_function}



{$IFDEF read_implementation}

function GST_TYPE_TRACER: TGType;
begin
  GST_TYPE_TRACER := gst_tracer_get_type;
end;

function GST_TRACER(obj: Pointer): PGstTracer;
begin
  Result := PGstTracer(g_type_check_instance_cast(obj, GST_TYPE_TRACER));
end;

function GST_TRACER_CLASS(klass: Pointer): PGstTracerClass;
begin
  Result := PGstTracerClass(g_type_check_class_cast(klass, GST_TYPE_TRACER));
end;

function GST_IS_TRACER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRACER);
end;

function GST_IS_TRACER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TRACER);
end;

function GST_TRACER_GET_CLASS(obj: Pointer): PGstTracerClass;
begin
  Result := PGstTracerClass(PGTypeInstance(obj)^.g_class);
end;

function GST_TRACER_CAST(obj: longint): PGstTracer;
begin
  GST_TRACER_CAST := PGstTracer(obj);
end;

{$ENDIF read_implementation}
