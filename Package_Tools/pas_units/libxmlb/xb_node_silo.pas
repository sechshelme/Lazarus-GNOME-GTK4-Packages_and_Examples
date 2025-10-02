unit xb_node_silo;

interface

uses
  fp_glib2, fp_xmlb, xb_node;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function xb_node_get_silo(self: PXbNode): PXbSilo; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:29 ===


implementation



end.
