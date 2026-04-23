unit fp_nm;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libnm = 'libnm';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}


type
  TNMWimaxNspNetworkType = integer;
  TNM80211ApFlags=Integer;
  TNMVpnServiceState=Integer;
  TNMVpnPluginFailure=Integer;
  TNMSettingSecretFlags=Integer;
  PNMSettingSecretFlags=^TNMSettingSecretFlags;
  TNM80211ApSecurityFlags=Integer;
  TNMSettingCompareFlags=Integer;
  TNMSettingWirelessSecurityWpsMethod=Integer;

  PNMConnection=Pointer;
  PNMTCQdisc=Pointer;
  PNMTCAction=Pointer;
  PNMTCTfilter=Pointer;
  PNMSriovVF=Pointer;
  PNMTeamLinkWatcher=Pointer;
  PNMBridgeVlan=Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const  INET6_ADDRSTRLEN = 46;

  {$DEFINE read_enum}
  //  {$include fp_fwupd_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  //  {$include fp_fwupd_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  //  {$include fp_fwupd_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
//{$include fp_fwupd_includes.inc}
{$UNDEF read_implementation}

end.
