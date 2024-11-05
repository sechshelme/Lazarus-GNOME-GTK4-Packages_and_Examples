/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstTimedValue = record
    timestamp: TGstClockTime;
    Value: Tgdouble;
  end;
  PGstTimedValue = ^TGstTimedValue;

  PGstControlSource = ^TGstControlSource;
  TGstControlSourceGetValue = function(self: PGstControlSource; timestamp: TGstClockTime; Value: Pgdouble): Tgboolean; cdecl;
  TGstControlSourceGetValueArray = function(self: PGstControlSource; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint; values: Pgdouble): Tgboolean; cdecl;

  TGstControlSource = record
    parent: TGstObject;
    get_value: TGstControlSourceGetValue;
    get_value_array: TGstControlSourceGetValueArray;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstControlSourceClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstControlSourceClass = ^TGstControlSourceClass;

function gst_control_source_get_type: TGType; cdecl; external libgstreamer;
function gst_control_source_get_value(self: PGstControlSource; timestamp: TGstClockTime; Value: Pgdouble): Tgboolean; cdecl; external libgstreamer;
function gst_control_source_get_value_array(self: PGstControlSource; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint; values: Pgdouble): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 16-9-24 19:34:19 ===

function GST_TYPE_CONTROL_SOURCE: TGType;
function GST_CONTROL_SOURCE(obj: Pointer): PGstControlSource;
function GST_CONTROL_SOURCE_CLASS(klass: Pointer): PGstControlSourceClass;
function GST_IS_CONTROL_SOURCE(obj: Pointer): Tgboolean;
function GST_IS_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GST_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstControlSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CONTROL_SOURCE: TGType;
begin
  GST_TYPE_CONTROL_SOURCE := gst_control_source_get_type;
end;

function GST_CONTROL_SOURCE(obj: Pointer): PGstControlSource;
begin
  Result := PGstControlSource(g_type_check_instance_cast(obj, GST_TYPE_CONTROL_SOURCE));
end;

function GST_CONTROL_SOURCE_CLASS(klass: Pointer): PGstControlSourceClass;
begin
  Result := PGstControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_CONTROL_SOURCE));
end;

function GST_IS_CONTROL_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CONTROL_SOURCE);
end;

function GST_IS_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CONTROL_SOURCE);
end;

function GST_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstControlSourceClass;
begin
  Result := PGstControlSourceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
