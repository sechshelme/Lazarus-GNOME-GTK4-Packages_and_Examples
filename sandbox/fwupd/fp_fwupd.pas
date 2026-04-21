unit fp_fwupd;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libfwupd = 'fwupd';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  type
  TFwupdKeyringKind=Integer;
  TFwupdTrustFlags=Integer;
  TFwupdReleaseFlags=Integer;
  TFwupdReleaseUrgency=Integer;
  TFwupdPluginFlags=Integer;
  TFwupdVersionFormat=Integer;
  TFwupdDeviceFlags=Integer;
  TFwupdDeviceProblem=Integer;
  TFwupdRequestFlags=Integer;
  TFwupdUpdateState=Integer;
  TFwupdStatus=Integer;
  TFwupdInstallFlags=Integer;
  TFwupdClientDownloadFlags=Integer;
  TFwupdSelfSignFlags=Integer;
  TFwupdFeatureFlags=Integer;
  TFwupdClientUploadFlags=Integer;

  PFwupdReport=Pointer;
  PFwupdRelease=Pointer;
  PFwupdClient=Pointer;
  PFwupdDevice=Pointer;
  PFwupdRemote=Pointer;
  PFwupdRequest=Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  //{$include fp_chafa_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_chafa_includes.inc}
{$UNDEF read_implementation}
end.

