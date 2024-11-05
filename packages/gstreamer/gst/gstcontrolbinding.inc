/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstControlBindingConvert = procedure(binding: PGstControlBinding; src_value: Tgdouble; dest_value: PGValue); cdecl;
  PGstControlBindingClass = ^TGstControlBindingClass;

  TGstControlBindingClass = record
    parent_class: TGstObjectClass;
    sync_values: function(binding: PGstControlBinding; obj: PGstObject; timestamp: TGstClockTime; last_sync: TGstClockTime): Tgboolean; cdecl;
    get_value: function(binding: PGstControlBinding; timestamp: TGstClockTime): PGValue; cdecl;
    get_value_array: function(binding: PGstControlBinding; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint; values: Tgpointer): Tgboolean; cdecl;
    get_g_value_array: function(binding: PGstControlBinding; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint; values: PGValue): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_control_binding_get_type: TGType; cdecl; external libgstreamer;
function gst_control_binding_sync_values(binding: PGstControlBinding; obj: PGstObject; timestamp: TGstClockTime; last_sync: TGstClockTime): Tgboolean; cdecl; external libgstreamer;
function gst_control_binding_get_value(binding: PGstControlBinding; timestamp: TGstClockTime): PGValue; cdecl; external libgstreamer;
function gst_control_binding_get_value_array(binding: PGstControlBinding; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint; values: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_control_binding_get_g_value_array(binding: PGstControlBinding; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint; values: PGValue): Tgboolean; cdecl; external libgstreamer;
procedure gst_control_binding_set_disabled(binding: PGstControlBinding; disabled: Tgboolean); cdecl; external libgstreamer;
function gst_control_binding_is_disabled(binding: PGstControlBinding): Tgboolean; cdecl; external libgstreamer;

function GST_CONTROL_BINDING_PSPEC(cb: Pointer): PGParamSpec;

// === Konventiert am: 11-9-24 14:04:05 ===

function GST_TYPE_CONTROL_BINDING: TGType;
function GST_CONTROL_BINDING(obj: Pointer): PGstControlBinding;
function GST_CONTROL_BINDING_CLASS(klass: Pointer): PGstControlBindingClass;
function GST_IS_CONTROL_BINDING(obj: Pointer): Tgboolean;
function GST_IS_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
function GST_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstControlBindingClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CONTROL_BINDING: TGType;
begin
  GST_TYPE_CONTROL_BINDING := gst_control_binding_get_type;
end;

function GST_CONTROL_BINDING(obj: Pointer): PGstControlBinding;
begin
  Result := PGstControlBinding(g_type_check_instance_cast(obj, GST_TYPE_CONTROL_BINDING));
end;

function GST_CONTROL_BINDING_CLASS(klass: Pointer): PGstControlBindingClass;
begin
  Result := PGstControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_CONTROL_BINDING));
end;

function GST_IS_CONTROL_BINDING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CONTROL_BINDING);
end;

function GST_IS_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CONTROL_BINDING);
end;

function GST_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstControlBindingClass;
begin
  Result := PGstControlBindingClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_CONTROL_BINDING_PSPEC(cb: Pointer): PGParamSpec;
begin
  GST_CONTROL_BINDING_PSPEC := (PGstControlBinding(cb))^.pspec;
end;


{$ENDIF read_implementation}
