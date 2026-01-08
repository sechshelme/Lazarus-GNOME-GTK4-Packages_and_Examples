unit client;

interface

uses
  fp_magiccore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function GetClientPath: pchar; cdecl; external libmagickcore;
function GetClientName: pchar; cdecl; external libmagickcore;
function SetClientName(para1: pchar): pchar; cdecl; external libmagickcore;
function SetClientPath(para1: pchar): pchar; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:00 ===


implementation



end.
