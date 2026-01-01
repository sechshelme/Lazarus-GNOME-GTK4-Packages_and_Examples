{$IFDEF read_interface}


function fribidi_get_bracket(ch: TFriBidiChar): TFriBidiBracketType; cdecl; external libfribidi;
procedure fribidi_get_bracket_types(str: PFriBidiChar; len: TFriBidiStrIndex; types: PFriBidiCharType; btypes: PFriBidiBracketType); cdecl; external libfribidi;

const
  FRIBIDI_BRACKET_OPEN_MASK = $80000000;
  FRIBIDI_BRACKET_ID_MASK = $7fffffff;

function FRIBIDI_IS_BRACKET_OPEN(bt: longint): boolean;
function FRIBIDI_BRACKET_ID(bt: longint): longint;


// === Konventiert am: 31-12-25 16:08:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function FRIBIDI_IS_BRACKET_OPEN(bt: longint): boolean;
begin
  FRIBIDI_IS_BRACKET_OPEN := (bt and FRIBIDI_BRACKET_OPEN_MASK) > 0;
end;

function FRIBIDI_BRACKET_ID(bt: longint): longint;
begin
  FRIBIDI_BRACKET_ID := bt and FRIBIDI_BRACKET_ID_MASK;
end;


{$ENDIF read_implementation}
