unit nm_core_types;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PNMConnection = type Pointer;
  PNMSetting = type Pointer;
  PNMSetting6Lowpan = type Pointer;
  PNMSetting8021x = type Pointer;
  PNMSettingAdsl = type Pointer;
  PNMSettingBluetooth = type Pointer;
  PNMSettingBond = type Pointer;
  PNMSettingBondPort = type Pointer;
  PNMSettingBridge = type Pointer;
  PNMSettingBridgePort = type Pointer;
  PNMSettingCdma = type Pointer;
  PNMSettingConnection = type Pointer;
  PNMSettingDcb = type Pointer;
  PNMSettingDummy = type Pointer;
  PNMSettingEthtool = type Pointer;
  PNMSettingGeneric = type Pointer;
  PNMSettingGsm = type Pointer;
  PNMSettingHostname = type Pointer;
  PNMSettingHsr = type Pointer;
  PNMSettingIP4Config = type Pointer;
  PNMSettingIP6Config = type Pointer;
  PNMSettingIPConfig = type Pointer;
  PNMSettingIPTunnel = type Pointer;
  PNMSettingInfiniband = type Pointer;
  PNMSettingLink = type Pointer;
  PNMSettingLoopback = type Pointer;
  PNMSettingMacsec = type Pointer;
  PNMSettingMacvlan = type Pointer;
  PNMSettingMatch = type Pointer;
  PNMSettingOlpcMesh = type Pointer;
  PNMSettingOvsBridge = type Pointer;
  PNMSettingOvsDpdk = type Pointer;
  PNMSettingOvsOtherConfig = type Pointer;
  PNMSettingOvsExternalIDs = type Pointer;
  PNMSettingOvsInterface = type Pointer;
  PNMSettingOvsPatch = type Pointer;
  PNMSettingOvsPort = type Pointer;
  PNMSettingPpp = type Pointer;
  PNMSettingPppoe = type Pointer;
  PNMSettingProxy = type Pointer;
  PNMSettingSerial = type Pointer;
  PNMSettingSriov = type Pointer;
  PNMSettingTCConfig = type Pointer;
  PNMSettingTeam = type Pointer;
  PNMSettingTeamPort = type Pointer;
  PNMSettingTun = type Pointer;
  PNMSettingUser = type Pointer;
  PNMSettingVeth = type Pointer;
  PNMSettingVlan = type Pointer;
  PNMSettingVpn = type Pointer;
  PNMSettingVrf = type Pointer;
  PNMSettingVxlan = type Pointer;
  PNMSettingWifiP2P = type Pointer;
  PNMSettingWimax = type Pointer;
  PNMSettingWired = type Pointer;
  PNMSettingWireGuard = type Pointer;
  PNMSettingWireless = type Pointer;
  PNMSettingWirelessSecurity = type Pointer;
  PNMSettingWpan = type Pointer;
  PNMSimpleConnection = type Pointer;

  TNMUtilsPredicateStr = function(str: pchar): Tgboolean; cdecl;
  {$ENDIF read_struct}

  // === Konventiert am: 19-4-26 19:32:27 ===


implementation



end.
