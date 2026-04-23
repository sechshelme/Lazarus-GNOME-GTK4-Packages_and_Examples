unit nm_setting_link;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_LINK_SETTING_NAME = 'link';
  NM_SETTING_LINK_TX_QUEUE_LENGTH = 'tx-queue-length';
  NM_SETTING_LINK_GSO_MAX_SIZE = 'gso-max-size';
  NM_SETTING_LINK_GSO_MAX_SEGMENTS = 'gso-max-segments';
  NM_SETTING_LINK_GRO_MAX_SIZE = 'gro-max-size';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingLink = type Pointer;
  PNMSettingLinkClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_link_get_type: TGType; cdecl; external libnm;
function nm_setting_link_new: PNMSetting; cdecl; external libnm;
function nm_setting_link_get_tx_queue_length(setting: PNMSettingLink): Tgint64; cdecl; external libnm;
function nm_setting_link_get_gso_max_size(setting: PNMSettingLink): Tgint64; cdecl; external libnm;
function nm_setting_link_get_gso_max_segments(setting: PNMSettingLink): Tgint64; cdecl; external libnm;
function nm_setting_link_get_gro_max_size(setting: PNMSettingLink): Tgint64; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:26 ===

function NM_TYPE_SETTING_LINK: TGType;
function NM_SETTING_LINK(obj: Pointer): PNMSettingLink;
function NM_SETTING_LINK_CLASS(klass: Pointer): PNMSettingLinkClass;
function NM_IS_SETTING_LINK(obj: Pointer): Tgboolean;
function NM_IS_SETTING_LINK_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_LINK_GET_CLASS(obj: Pointer): PNMSettingLinkClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_LINK: TGType;
begin
  NM_TYPE_SETTING_LINK := nm_setting_link_get_type;
end;

function NM_SETTING_LINK(obj: Pointer): PNMSettingLink;
begin
  Result := PNMSettingLink(g_type_check_instance_cast(obj, NM_TYPE_SETTING_LINK));
end;

function NM_SETTING_LINK_CLASS(klass: Pointer): PNMSettingLinkClass;
begin
  Result := PNMSettingLinkClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_LINK));
end;

function NM_IS_SETTING_LINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_LINK);
end;

function NM_IS_SETTING_LINK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_LINK);
end;

function NM_SETTING_LINK_GET_CLASS(obj: Pointer): PNMSettingLinkClass;
begin
  Result := PNMSettingLinkClass(PGTypeInstance(obj)^.g_class);
end;



end.
