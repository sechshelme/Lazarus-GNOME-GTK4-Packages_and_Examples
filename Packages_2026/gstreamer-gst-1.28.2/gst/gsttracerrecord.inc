

  {$IFDEF read_enum}
type
  PGstTracerValueScope = ^TGstTracerValueScope;
  TGstTracerValueScope = longint;
const
  GST_TRACER_VALUE_SCOPE_PROCESS = 0;
  GST_TRACER_VALUE_SCOPE_THREAD = 1;
  GST_TRACER_VALUE_SCOPE_ELEMENT = 2;
  GST_TRACER_VALUE_SCOPE_PAD = 3;

type
  PGstTracerValueFlags = ^TGstTracerValueFlags;
  TGstTracerValueFlags = longint;
const
  GST_TRACER_VALUE_FLAGS_NONE = 0;
  GST_TRACER_VALUE_FLAGS_OPTIONAL = 1 shl 0;
  GST_TRACER_VALUE_FLAGS_AGGREGATED = 1 shl 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstTracerRecord = type Pointer;
  PGstTracerRecordClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_tracer_record_get_type: TGType; cdecl; external libgstreamer;
function gst_tracer_record_new(name: Pgchar; firstfield: Pgchar): PGstTracerRecord; cdecl; varargs; external libgstreamer;
procedure gst_tracer_record_log(self: PGstTracerRecord); cdecl; varargs; external libgstreamer;

// === Konventiert am: 11-7-26 15:54:37 ===

function GST_TYPE_TRACER_RECORD: TGType;
function GST_TRACER_RECORD(obj: Pointer): PGstTracerRecord;
function GST_TRACER_RECORD_CLASS(klass: Pointer): PGstTracerRecordClass;
function GST_IS_TRACER_RECORD(obj: Pointer): Tgboolean;
function GST_IS_TRACER_RECORD_CLASS(klass: Pointer): Tgboolean;
function GST_TRACER_RECORD_GET_CLASS(obj: Pointer): PGstTracerRecordClass;
function GST_TRACER_RECORD_CAST(obj: Pointer): PGstTracerRecord;
{$ENDIF read_function}



{$IFDEF read_implementation}

function GST_TYPE_TRACER_RECORD: TGType;
begin
  GST_TYPE_TRACER_RECORD := gst_tracer_record_get_type;
end;

function GST_TRACER_RECORD(obj: Pointer): PGstTracerRecord;
begin
  Result := PGstTracerRecord(g_type_check_instance_cast(obj, GST_TYPE_TRACER_RECORD));
end;

function GST_TRACER_RECORD_CLASS(klass: Pointer): PGstTracerRecordClass;
begin
  Result := PGstTracerRecordClass(g_type_check_class_cast(klass, GST_TYPE_TRACER_RECORD));
end;

function GST_IS_TRACER_RECORD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRACER_RECORD);
end;

function GST_IS_TRACER_RECORD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TRACER_RECORD);
end;

function GST_TRACER_RECORD_GET_CLASS(obj: Pointer): PGstTracerRecordClass;
begin
  Result := PGstTracerRecordClass(PGTypeInstance(obj)^.g_class);
end;

function GST_TRACER_RECORD_CAST(obj: Pointer): PGstTracerRecord;
begin
  GST_TRACER_RECORD_CAST := PGstTracerRecord(obj);
end;


{$ENDIF read_implementation}
