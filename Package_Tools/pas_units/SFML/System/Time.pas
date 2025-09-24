unit Time;

interface

uses
  fp_sfml, Config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfTime = record
    microseconds: TsfInt64;
  end;
  PsfTime = ^TsfTime;

var
  sfTime_Zero: TsfTime; cvar;external libsfml_system;

function sfTime_asSeconds(time: TsfTime): single; cdecl; external libsfml_system;
function sfTime_asMilliseconds(time: TsfTime): TsfInt32; cdecl; external libsfml_system;
function sfTime_asMicroseconds(time: TsfTime): TsfInt64; cdecl; external libsfml_system;
function sfSeconds(amount: single): TsfTime; cdecl; external libsfml_system;
function sfMilliseconds(amount: TsfInt32): TsfTime; cdecl; external libsfml_system;
function sfMicroseconds(amount: TsfInt64): TsfTime; cdecl; external libsfml_system;

// === Konventiert am: 24-9-25 16:57:13 ===


implementation



end.
