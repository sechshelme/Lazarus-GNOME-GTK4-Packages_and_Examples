unit nm_device_ppp;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PNMDevicePpp = type Pointer;
  PNMDevicePppClass = type Pointer;

function nm_device_ppp_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:26:17 ===

function NM_TYPE_DEVICE_PPP: TGType;
function NM_DEVICE_PPP(obj: Pointer): PNMDevicePpp;
function NM_DEVICE_PPP_CLASS(klass: Pointer): PNMDevicePppClass;
function NM_IS_DEVICE_PPP(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_PPP_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_PPP_GET_CLASS(obj: Pointer): PNMDevicePppClass;

implementation

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



end.
