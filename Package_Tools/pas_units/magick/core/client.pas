unit client;

interface

uses
  fp_magiccore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function GetClientPath: pchar; cdecl; external libmagiccore;
function GetClientName: pchar; cdecl; external libmagiccore;
function SetClientName(para1: pchar): pchar; cdecl; external libmagiccore;
function SetClientPath(para1: pchar): pchar; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:23:00 ===


implementation



end.
