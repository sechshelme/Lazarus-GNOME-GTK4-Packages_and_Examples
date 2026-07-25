{$IFDEF read_interface}


type
  PGstTriggerControlSourcePrivate = type Pointer;

  PGstTriggerControlSource = ^TGstTriggerControlSource;
  TGstTriggerControlSource = record
    parent: TGstTimedValueControlSource;
    priv: PGstTriggerControlSourcePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstTriggerControlSourceClass = ^TGstTriggerControlSourceClass;
  TGstTriggerControlSourceClass = record
    parent_class: TGstTimedValueControlSourceClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_trigger_control_source_get_type: TGType; cdecl; external libgstcontroller;
function gst_trigger_control_source_new: PGstControlSource; cdecl; external libgstcontroller;

// === Konventiert am: 25-7-26 13:21:37 ===

function GST_TYPE_TRIGGER_CONTROL_SOURCE: TGType;
function GST_TRIGGER_CONTROL_SOURCE(obj: Pointer): PGstTriggerControlSource;
function GST_TRIGGER_CONTROL_SOURCE_CLASS(klass: Pointer): PGstTriggerControlSourceClass;
function GST_IS_TRIGGER_CONTROL_SOURCE(obj: Pointer): Tgboolean;
function GST_IS_TRIGGER_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GST_TRIGGER_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstTriggerControlSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TRIGGER_CONTROL_SOURCE: TGType;
begin
  GST_TYPE_TRIGGER_CONTROL_SOURCE := gst_trigger_control_source_get_type;
end;

function GST_TRIGGER_CONTROL_SOURCE(obj: Pointer): PGstTriggerControlSource;
begin
  Result := PGstTriggerControlSource(g_type_check_instance_cast(obj, GST_TYPE_TRIGGER_CONTROL_SOURCE));
end;

function GST_TRIGGER_CONTROL_SOURCE_CLASS(klass: Pointer): PGstTriggerControlSourceClass;
begin
  Result := PGstTriggerControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_TRIGGER_CONTROL_SOURCE));
end;

function GST_IS_TRIGGER_CONTROL_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRIGGER_CONTROL_SOURCE);
end;

function GST_IS_TRIGGER_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TRIGGER_CONTROL_SOURCE);
end;

function GST_TRIGGER_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstTriggerControlSourceClass;
begin
  Result := PGstTriggerControlSourceClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
