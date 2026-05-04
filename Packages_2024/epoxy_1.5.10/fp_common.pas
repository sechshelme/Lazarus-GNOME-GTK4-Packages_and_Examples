unit fp_common;

interface

uses
  fp_epoxy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pbool = ^Tbool;
  Tbool = Boolean8;


function epoxy_extension_in_string(extension_list: pchar; ext: pchar): Tbool; cdecl; external libepoxy;

// === Konventiert am: 4-5-26 15:03:40 ===


implementation



end.
