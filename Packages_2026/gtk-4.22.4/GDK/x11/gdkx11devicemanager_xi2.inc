
{$IFDEF read_interface}

type
  PGdkX11DeviceManagerXI2 = type Pointer;
  PGdkX11DeviceManagerXI2Class = type Pointer;

function gdk_x11_device_manager_xi2_get_type: TGType; cdecl; external libgtk4; deprecated;

// === Konventiert am: 3-8-24 17:28:56 ===

function GDK_TYPE_X11_DEVICE_MANAGER_XI2: TGType;
function GDK_X11_DEVICE_MANAGER_XI2(obj: Pointer): PGdkX11DeviceManagerXI2;
function GDK_X11_DEVICE_MANAGER_XI2_CLASS(klass: Pointer): PGdkX11DeviceManagerXI2Class;
function GDK_IS_X11_DEVICE_MANAGER_XI2(obj: Pointer): Tgboolean;
function GDK_IS_X11_DEVICE_MANAGER_XI2_CLASS(klass: Pointer): Tgboolean;
function GDK_X11_DEVICE_MANAGER_XI2_GET_CLASS(obj: Pointer): PGdkX11DeviceManagerXI2Class;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_X11_DEVICE_MANAGER_XI2: TGType;
begin
  GDK_TYPE_X11_DEVICE_MANAGER_XI2 := gdk_x11_device_manager_xi2_get_type;
end;

function GDK_X11_DEVICE_MANAGER_XI2(obj: Pointer): PGdkX11DeviceManagerXI2;
begin
  Result := PGdkX11DeviceManagerXI2(g_type_check_instance_cast(obj, GDK_TYPE_X11_DEVICE_MANAGER_XI2));
end;

function GDK_X11_DEVICE_MANAGER_XI2_CLASS(klass: Pointer): PGdkX11DeviceManagerXI2Class;
begin
  Result := PGdkX11DeviceManagerXI2Class(g_type_check_class_cast(klass, GDK_TYPE_X11_DEVICE_MANAGER_XI2));
end;

function GDK_IS_X11_DEVICE_MANAGER_XI2(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_X11_DEVICE_MANAGER_XI2);
end;

function GDK_IS_X11_DEVICE_MANAGER_XI2_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_X11_DEVICE_MANAGER_XI2);
end;

function GDK_X11_DEVICE_MANAGER_XI2_GET_CLASS(obj: Pointer): PGdkX11DeviceManagerXI2Class;
begin
  Result := PGdkX11DeviceManagerXI2Class(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
