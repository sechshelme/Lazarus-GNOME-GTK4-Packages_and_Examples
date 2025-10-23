{$IFDEF read_interface}


type
  TsfColor = record
    r: TsfUint8;
    g: TsfUint8;
    b: TsfUint8;
    a: TsfUint8;
  end;
  PsfColor = ^TsfColor;

var
  sfBlack: TsfColor; cvar;external libcsfml_graphics;
  sfWhite: TsfColor; cvar;external libcsfml_graphics;
  sfRed: TsfColor; cvar;external libcsfml_graphics;
  sfGreen: TsfColor; cvar;external libcsfml_graphics;
  sfBlue: TsfColor; cvar;external libcsfml_graphics;
  sfYellow: TsfColor; cvar;external libcsfml_graphics;
  sfMagenta: TsfColor; cvar;external libcsfml_graphics;
  sfCyan: TsfColor; cvar;external libcsfml_graphics;
  sfTransparent: TsfColor; cvar;external libcsfml_graphics;

function sfColor_fromRGB(red: TsfUint8; green: TsfUint8; blue: TsfUint8): TsfColor; cdecl; external libcsfml_graphics;
function sfColor_fromRGBA(red: TsfUint8; green: TsfUint8; blue: TsfUint8; alpha: TsfUint8): TsfColor; cdecl; external libcsfml_graphics;
function sfColor_fromInteger(color: TsfUint32): TsfColor; cdecl; external libcsfml_graphics;
function sfColor_toInteger(color: TsfColor): TsfUint32; cdecl; external libcsfml_graphics;
function sfColor_add(color1: TsfColor; color2: TsfColor): TsfColor; cdecl; external libcsfml_graphics;
function sfColor_subtract(color1: TsfColor; color2: TsfColor): TsfColor; cdecl; external libcsfml_graphics;
function sfColor_modulate(color1: TsfColor; color2: TsfColor): TsfColor; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
