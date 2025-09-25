unit Color;

interface

uses
  fp_sfml, Config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfColor = record
    r: TsfUint8;
    g: TsfUint8;
    b: TsfUint8;
    a: TsfUint8;
  end;
  PsfColor = ^TsfColor;

var
  sfBlack: TsfColor; cvar;external libsfml_graphics;
  sfWhite: TsfColor; cvar;external libsfml_graphics;
  sfRed: TsfColor; cvar;external libsfml_graphics;
  sfGreen: TsfColor; cvar;external libsfml_graphics;
  sfBlue: TsfColor; cvar;external libsfml_graphics;
  sfYellow: TsfColor; cvar;external libsfml_graphics;
  sfMagenta: TsfColor; cvar;external libsfml_graphics;
  sfCyan: TsfColor; cvar;external libsfml_graphics;
  sfTransparent: TsfColor; cvar;external libsfml_graphics;

function sfColor_fromRGB(red: TsfUint8; green: TsfUint8; blue: TsfUint8): TsfColor; cdecl; external libsfml_graphics;
function sfColor_fromRGBA(red: TsfUint8; green: TsfUint8; blue: TsfUint8; alpha: TsfUint8): TsfColor; cdecl; external libsfml_graphics;
function sfColor_fromInteger(color: TsfUint32): TsfColor; cdecl; external libsfml_graphics;
function sfColor_toInteger(color: TsfColor): TsfUint32; cdecl; external libsfml_graphics;
function sfColor_add(color1: TsfColor; color2: TsfColor): TsfColor; cdecl; external libsfml_graphics;
function sfColor_subtract(color1: TsfColor; color2: TsfColor): TsfColor; cdecl; external libsfml_graphics;
function sfColor_modulate(color1: TsfColor; color2: TsfColor): TsfColor; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:55:47 ===


implementation



end.
