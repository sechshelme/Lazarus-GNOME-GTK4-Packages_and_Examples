unit guuid;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function g_uuid_string_is_valid(str: Pgchar): Tgboolean; cdecl; external libglib2;
function g_uuid_string_random: Pgchar; cdecl; external libglib2;

// === Konventiert am: 22-6-26 20:02:59 ===


implementation



end.
