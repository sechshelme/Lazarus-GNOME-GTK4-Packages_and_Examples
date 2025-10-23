unit fp_portal_gtk4;

interface

uses
  fp_GTK4, fp_portal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function xdp_parent_new_gtk(window: PGtkWindow): PXdpParent; cdecl; external libportal_gtk4;

// === Konventiert am: 30-8-25 13:59:40 ===


implementation



end.
