unit xcb_atom;

interface

uses
  fp_xcb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function xcb_atom_name_by_screen(base: pchar; screen: Tuint8_t): pchar; cdecl; external libxcb;
function xcb_atom_name_by_resource(base: pchar; resource: Tuint32_t): pchar; cdecl; external libxcb;
function xcb_atom_name_unique(base: pchar; id: Tuint32_t): pchar; cdecl; external libxcb;

// === Konventiert am: 9-10-25 19:41:20 ===


implementation



end.
