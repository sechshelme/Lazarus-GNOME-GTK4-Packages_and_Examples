/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   15:16                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstDirectControlBinding = ^TGstDirectControlBinding;
  TGstDirectControlBindingConvertValue = procedure(self: PGstDirectControlBinding; src_value: Tgdouble; dest_value: Tgpointer); cdecl;
  TGstDirectControlBindingConvertGValue = procedure(self: PGstDirectControlBinding; src_value: Tgdouble; dest_value: PGValue); cdecl;

  TGstDirectControlBinding = record
    parent: TGstControlBinding;
    cs: PGstControlSource;
    cur_value: TGValue;
    last_value: Tgdouble;
    byte_size: Tgint;
    convert_value: TGstDirectControlBindingConvertValue;
    convert_g_value: TGstDirectControlBindingConvertGValue;
    ABI: record
      case longint of
        0: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
        1: (abi: record
            want_absolute: Tgboolean;
            end);
      end;
  end;

  TGstDirectControlBindingClass = record
    parent_class: TGstControlBindingClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDirectControlBindingClass = ^TGstDirectControlBindingClass;

function gst_direct_control_binding_get_type: TGType; cdecl; external libgstcontroller;
function gst_direct_control_binding_new(obj: PGstObject; property_name: Pgchar; cs: PGstControlSource): PGstControlBinding; cdecl; external libgstcontroller;
function gst_direct_control_binding_new_absolute(obj: PGstObject; property_name: Pgchar; cs: PGstControlSource): PGstControlBinding; cdecl; external libgstcontroller;

// === Konventiert am: 7-10-24 14:52:03 ===

function GST_TYPE_DIRECT_CONTROL_BINDING: TGType;
function GST_DIRECT_CONTROL_BINDING(obj: Pointer): PGstDirectControlBinding;
function GST_DIRECT_CONTROL_BINDING_CLASS(klass: Pointer): PGstDirectControlBindingClass;
function GST_IS_DIRECT_CONTROL_BINDING(obj: Pointer): Tgboolean;
function GST_IS_DIRECT_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
function GST_DIRECT_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstDirectControlBindingClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DIRECT_CONTROL_BINDING: TGType;
begin
  GST_TYPE_DIRECT_CONTROL_BINDING := gst_direct_control_binding_get_type;
end;

function GST_DIRECT_CONTROL_BINDING(obj: Pointer): PGstDirectControlBinding;
begin
  Result := PGstDirectControlBinding(g_type_check_instance_cast(obj, GST_TYPE_DIRECT_CONTROL_BINDING));
end;

function GST_DIRECT_CONTROL_BINDING_CLASS(klass: Pointer): PGstDirectControlBindingClass;
begin
  Result := PGstDirectControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_DIRECT_CONTROL_BINDING));
end;

function GST_IS_DIRECT_CONTROL_BINDING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DIRECT_CONTROL_BINDING);
end;

function GST_IS_DIRECT_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DIRECT_CONTROL_BINDING);
end;

function GST_DIRECT_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstDirectControlBindingClass;
begin
  Result := PGstDirectControlBindingClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
