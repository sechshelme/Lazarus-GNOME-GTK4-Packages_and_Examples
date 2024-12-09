
{$IFDEF read_interface}

type
  TGstARGBControlBinding = record
    parent: TGstControlBinding;
    cs_a: PGstControlSource;
    cs_r: PGstControlSource;
    cs_g: PGstControlSource;
    cs_b: PGstControlSource;
    cur_value: TGValue;
    last_value: Tguint32;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstARGBControlBinding = ^TGstARGBControlBinding;

  TGstARGBControlBindingClass = record
    parent_class: TGstControlBindingClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstARGBControlBindingClass = ^TGstARGBControlBindingClass;


function gst_argb_control_binding_get_type: TGType; cdecl; external libgstcontroller;
function gst_argb_control_binding_new(obj: PGstObject; property_name: Pgchar; cs_a: PGstControlSource; cs_r: PGstControlSource; cs_g: PGstControlSource;
  cs_b: PGstControlSource): PGstControlBinding; cdecl; external libgstcontroller;

// === Konventiert am: 7-10-24 14:51:56 ===

function GST_TYPE_ARGB_CONTROL_BINDING: TGType;
function GST_ARGB_CONTROL_BINDING(obj: Pointer): PGstARGBControlBinding;
function GST_ARGB_CONTROL_BINDING_CLASS(klass: Pointer): PGstARGBControlBindingClass;
function GST_IS_ARGB_CONTROL_BINDING(obj: Pointer): Tgboolean;
function GST_IS_ARGB_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
function GST_ARGB_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstARGBControlBindingClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ARGB_CONTROL_BINDING: TGType;
begin
  GST_TYPE_ARGB_CONTROL_BINDING := gst_argb_control_binding_get_type;
end;

function GST_ARGB_CONTROL_BINDING(obj: Pointer): PGstARGBControlBinding;
begin
  Result := PGstARGBControlBinding(g_type_check_instance_cast(obj, GST_TYPE_ARGB_CONTROL_BINDING));
end;

function GST_ARGB_CONTROL_BINDING_CLASS(klass: Pointer): PGstARGBControlBindingClass;
begin
  Result := PGstARGBControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_ARGB_CONTROL_BINDING));
end;

function GST_IS_ARGB_CONTROL_BINDING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ARGB_CONTROL_BINDING);
end;

function GST_IS_ARGB_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_ARGB_CONTROL_BINDING);
end;

function GST_ARGB_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstARGBControlBindingClass;
begin
  Result := PGstARGBControlBindingClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
