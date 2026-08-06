unit nm_setting_ovs_dpdk;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_OVS_DPDK_SETTING_NAME = 'ovs-dpdk';
  NM_SETTING_OVS_DPDK_DEVARGS = 'devargs';
  NM_SETTING_OVS_DPDK_N_RXQ = 'n-rxq';
  NM_SETTING_OVS_DPDK_N_RXQ_DESC = 'n-rxq-desc';
  NM_SETTING_OVS_DPDK_N_TXQ_DESC = 'n-txq-desc';

type
  PNMSettingOvsDpdk = type Pointer;
  PNMSettingOvsDpdkClass = type Pointer;

function nm_setting_ovs_dpdk_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_dpdk_new: PNMSetting; cdecl; external libnm;
function nm_setting_ovs_dpdk_get_devargs(self: PNMSettingOvsDpdk): pchar; cdecl; external libnm;
function nm_setting_ovs_dpdk_get_n_rxq(self: PNMSettingOvsDpdk): Tguint32; cdecl; external libnm;
function nm_setting_ovs_dpdk_get_n_rxq_desc(self: PNMSettingOvsDpdk): Tguint32; cdecl; external libnm;
function nm_setting_ovs_dpdk_get_n_txq_desc(self: PNMSettingOvsDpdk): Tguint32; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:54:31 ===

function NM_TYPE_SETTING_OVS_DPDK: TGType;
function NM_SETTING_OVS_DPDK(obj: Pointer): PNMSettingOvsDpdk;
function NM_SETTING_OVS_DPDK_CLASS(klass: Pointer): PNMSettingOvsDpdkClass;
function NM_IS_SETTING_OVS_DPDK(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_DPDK_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_DPDK_GET_CLASS(obj: Pointer): PNMSettingOvsDpdkClass;

implementation

function NM_TYPE_SETTING_OVS_DPDK: TGType;
begin
  NM_TYPE_SETTING_OVS_DPDK := nm_setting_ovs_dpdk_get_type;
end;

function NM_SETTING_OVS_DPDK(obj: Pointer): PNMSettingOvsDpdk;
begin
  Result := PNMSettingOvsDpdk(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_DPDK));
end;

function NM_SETTING_OVS_DPDK_CLASS(klass: Pointer): PNMSettingOvsDpdkClass;
begin
  Result := PNMSettingOvsDpdkClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_DPDK));
end;

function NM_IS_SETTING_OVS_DPDK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OVS_DPDK);
end;

function NM_IS_SETTING_OVS_DPDK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OVS_DPDK);
end;

function NM_SETTING_OVS_DPDK_GET_CLASS(obj: Pointer): PNMSettingOvsDpdkClass;
begin
  Result := PNMSettingOvsDpdkClass(PGTypeInstance(obj)^.g_class);
end;



end.
