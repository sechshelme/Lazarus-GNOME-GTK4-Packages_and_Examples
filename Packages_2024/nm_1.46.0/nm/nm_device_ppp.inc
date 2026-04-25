

  {$IFDEF read_struct}
type
  PNMDevicePpp = type Pointer;
  PNMDevicePppClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_ppp_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:26 ===

function NM_TYPE_DEVICE_PPP: TGType;
function NM_DEVICE_PPP(obj: Pointer): PNMDevicePpp;
function NM_DEVICE_PPP_CLASS(klass: Pointer): PNMDevicePppClass;
function NM_IS_DEVICE_PPP(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_PPP_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_PPP_GET_CLASS(obj: Pointer): PNMDevicePppClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_PPP: TGType;
begin
  NM_TYPE_DEVICE_PPP := nm_device_ppp_get_type;
end;

function NM_DEVICE_PPP(obj: Pointer): PNMDevicePpp;
begin
  Result := PNMDevicePpp(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_PPP));
end;

function NM_DEVICE_PPP_CLASS(klass: Pointer): PNMDevicePppClass;
begin
  Result := PNMDevicePppClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_PPP));
end;

function NM_IS_DEVICE_PPP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_PPP);
end;

function NM_IS_DEVICE_PPP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_PPP);
end;

function NM_DEVICE_PPP_GET_CLASS(obj: Pointer): PNMDevicePppClass;
begin
  Result := PNMDevicePppClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
