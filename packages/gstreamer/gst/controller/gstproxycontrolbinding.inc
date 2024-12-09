
{$IFDEF read_interface}

type
  TGstProxyControlBinding = record
    parent: TGstControlBinding;
    ref_object: TGWeakRef;
    property_name: Pgchar;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstProxyControlBinding = ^TGstProxyControlBinding;

  TGstProxyControlBindingClass = record
    parent_class: TGstControlBindingClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstProxyControlBindingClass = ^TGstProxyControlBindingClass;


function gst_proxy_control_binding_get_type: TGType; cdecl; external libgstcontroller;
function gst_proxy_control_binding_new(obj: PGstObject; property_name: Pgchar; ref_object: PGstObject; ref_property_name: Pgchar): PGstControlBinding; cdecl; external libgstcontroller;

// === Konventiert am: 7-10-24 14:52:22 ===

function GST_TYPE_PROXY_CONTROL_BINDING: TGType;
function GST_PROXY_CONTROL_BINDING(obj: Pointer): PGstProxyControlBinding;
function GST_PROXY_CONTROL_BINDING_CLASS(klass: Pointer): PGstProxyControlBindingClass;
function GST_IS_PROXY_CONTROL_BINDING(obj: Pointer): Tgboolean;
function GST_IS_PROXY_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
function GST_PROXY_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstProxyControlBindingClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PROXY_CONTROL_BINDING: TGType;
begin
  GST_TYPE_PROXY_CONTROL_BINDING := gst_proxy_control_binding_get_type;
end;

function GST_PROXY_CONTROL_BINDING(obj: Pointer): PGstProxyControlBinding;
begin
  Result := PGstProxyControlBinding(g_type_check_instance_cast(obj, GST_TYPE_PROXY_CONTROL_BINDING));
end;

function GST_PROXY_CONTROL_BINDING_CLASS(klass: Pointer): PGstProxyControlBindingClass;
begin
  Result := PGstProxyControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_PROXY_CONTROL_BINDING));
end;

function GST_IS_PROXY_CONTROL_BINDING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PROXY_CONTROL_BINDING);
end;

function GST_IS_PROXY_CONTROL_BINDING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PROXY_CONTROL_BINDING);
end;

function GST_PROXY_CONTROL_BINDING_GET_CLASS(obj: Pointer): PGstProxyControlBindingClass;
begin
  Result := PGstProxyControlBindingClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
