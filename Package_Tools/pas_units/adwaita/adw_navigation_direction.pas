unit adw_navigation_direction;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwNavigationDirection = ^TAdwNavigationDirection;
  TAdwNavigationDirection = longint;

const
  ADW_NAVIGATION_DIRECTION_BACK = 0;
  ADW_NAVIGATION_DIRECTION_FORWARD = 1;

  // === Konventiert am: 9-1-25 19:28:24 ===


implementation



end.
