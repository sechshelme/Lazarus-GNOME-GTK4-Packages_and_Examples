unit nm_device_macsec;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_MACSEC_PARENT = 'parent';
  NM_DEVICE_MACSEC_HW_ADDRESS = 'hw-address';
  NM_DEVICE_MACSEC_SCI = 'sci';
  NM_DEVICE_MACSEC_ICV_LENGTH = 'icv-length';
  NM_DEVICE_MACSEC_CIPHER_SUITE = 'cipher-suite';
  NM_DEVICE_MACSEC_WINDOW = 'window';
  NM_DEVICE_MACSEC_ENCODING_SA = 'encoding-sa';
  NM_DEVICE_MACSEC_VALIDATION = 'validation';
  NM_DEVICE_MACSEC_ENCRYPT = 'encrypt';
  NM_DEVICE_MACSEC_PROTECT = 'protect';
  NM_DEVICE_MACSEC_INCLUDE_SCI = 'include-sci';
  NM_DEVICE_MACSEC_ES = 'es';
  NM_DEVICE_MACSEC_SCB = 'scb';
  NM_DEVICE_MACSEC_REPLAY_PROTECT = 'replay-protect';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceMacsec = type Pointer;
  PNMDeviceMacsecClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_macsec_get_type: TGType; cdecl; external libnm;
function nm_device_macsec_get_parent(device: PNMDeviceMacsec): PNMDevice; cdecl; external libnm;
function nm_device_macsec_get_hw_address(device: PNMDeviceMacsec): pchar; cdecl; external libnm; deprecated;
function nm_device_macsec_get_sci(device: PNMDeviceMacsec): Tguint64; cdecl; external libnm;
function nm_device_macsec_get_icv_length(device: PNMDeviceMacsec): Tguint8; cdecl; external libnm;
function nm_device_macsec_get_cipher_suite(device: PNMDeviceMacsec): Tguint64; cdecl; external libnm;
function nm_device_macsec_get_window(device: PNMDeviceMacsec): Tguint; cdecl; external libnm;
function nm_device_macsec_get_encoding_sa(device: PNMDeviceMacsec): Tguint8; cdecl; external libnm;
function nm_device_macsec_get_validation(device: PNMDeviceMacsec): pchar; cdecl; external libnm;
function nm_device_macsec_get_encrypt(device: PNMDeviceMacsec): Tgboolean; cdecl; external libnm;
function nm_device_macsec_get_protect(device: PNMDeviceMacsec): Tgboolean; cdecl; external libnm;
function nm_device_macsec_get_include_sci(device: PNMDeviceMacsec): Tgboolean; cdecl; external libnm;
function nm_device_macsec_get_es(device: PNMDeviceMacsec): Tgboolean; cdecl; external libnm;
function nm_device_macsec_get_scb(device: PNMDeviceMacsec): Tgboolean; cdecl; external libnm;
function nm_device_macsec_get_replay_protect(device: PNMDeviceMacsec): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:48 ===

function NM_TYPE_DEVICE_MACSEC: TGType;
function NM_DEVICE_MACSEC(obj: Pointer): PNMDeviceMacsec;
function NM_DEVICE_MACSEC_CLASS(klass: Pointer): PNMDeviceMacsecClass;
function NM_IS_DEVICE_MACSEC(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_MACSEC_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_MACSEC_GET_CLASS(obj: Pointer): PNMDeviceMacsecClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_MACSEC: TGType;
begin
  NM_TYPE_DEVICE_MACSEC := nm_device_macsec_get_type;
end;

function NM_DEVICE_MACSEC(obj: Pointer): PNMDeviceMacsec;
begin
  Result := PNMDeviceMacsec(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_MACSEC));
end;

function NM_DEVICE_MACSEC_CLASS(klass: Pointer): PNMDeviceMacsecClass;
begin
  Result := PNMDeviceMacsecClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_MACSEC));
end;

function NM_IS_DEVICE_MACSEC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_MACSEC);
end;

function NM_IS_DEVICE_MACSEC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_MACSEC);
end;

function NM_DEVICE_MACSEC_GET_CLASS(obj: Pointer): PNMDeviceMacsecClass;
begin
  Result := PNMDeviceMacsecClass(PGTypeInstance(obj)^.g_class);
end;



end.
