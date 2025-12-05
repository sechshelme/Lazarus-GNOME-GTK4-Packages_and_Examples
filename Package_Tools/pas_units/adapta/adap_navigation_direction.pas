unit adap_navigation_direction;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapNavigationDirection = ^TAdapNavigationDirection;
  TAdapNavigationDirection = longint;

const
  ADAP_NAVIGATION_DIRECTION_BACK = 0;
  ADAP_NAVIGATION_DIRECTION_FORWARD = 1;

  // === Konventiert am: 4-12-25 17:18:09 ===


implementation



end.
