{$IFDEF read_interface}


type
  TsfTime = record
    microseconds: TsfInt64;
  end;
  PsfTime = ^TsfTime;

var
  sfTime_Zero: TsfTime; cvar;external libcsfml_system;

function sfTime_asSeconds(time: TsfTime): single; cdecl; external libcsfml_system;
function sfTime_asMilliseconds(time: TsfTime): TsfInt32; cdecl; external libcsfml_system;
function sfTime_asMicroseconds(time: TsfTime): TsfInt64; cdecl; external libcsfml_system;
function sfSeconds(amount: single): TsfTime; cdecl; external libcsfml_system;
function sfMilliseconds(amount: TsfInt32): TsfTime; cdecl; external libcsfml_system;
function sfMicroseconds(amount: TsfInt64): TsfTime; cdecl; external libcsfml_system;

// === Konventiert am: 24-9-25 16:57:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
