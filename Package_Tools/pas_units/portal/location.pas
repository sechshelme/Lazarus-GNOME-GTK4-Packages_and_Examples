unit location;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpLocationAccuracy = ^TXdpLocationAccuracy;
  TXdpLocationAccuracy = longint;

const
  XDP_LOCATION_ACCURACY_NONE = 0;
  XDP_LOCATION_ACCURACY_COUNTRY = 1;
  XDP_LOCATION_ACCURACY_CITY = 2;
  XDP_LOCATION_ACCURACY_NEIGHBORHOOD = 3;
  XDP_LOCATION_ACCURACY_STREET = 4;
  XDP_LOCATION_ACCURACY_EXACT = 5;

type
  PXdpLocationMonitorFlags = ^TXdpLocationMonitorFlags;
  TXdpLocationMonitorFlags = longint;

const
  XDP_LOCATION_MONITOR_FLAG_NONE = 0;

procedure xdp_portal_location_monitor_start(portal: PXdpPortal; parent: PXdpParent; distance_threshold: Tguint; time_threshold: Tguint; accuracy: TXdpLocationAccuracy;
  flags: TXdpLocationMonitorFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_location_monitor_start_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_portal_location_monitor_stop(portal: PXdpPortal); cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:56 ===


implementation



end.
