unit Sleep;

interface

uses
  fp_sfml, Time;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure sfSleep(duration: TsfTime); cdecl; external libsfml_system;

// === Konventiert am: 24-9-25 16:57:22 ===


implementation



end.
