
unit Color;
interface

{
  Automatically converted by H2Pas 1.0.0 from Color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Color.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PsfColor  = ^sfColor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_COLOR_H}
{$define SFML_COLOR_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Utility class for manpulating RGBA colors }
{/ }
{////////////////////////////////////////////////////////// }
type
  PsfColor = ^TsfColor;
  TsfColor = record
      r : TsfUint8;
      g : TsfUint8;
      b : TsfUint8;
      a : TsfUint8;
    end;
  var
    sfBlack : TsfColor;cvar;external;
{/< Black predefined color }
    sfWhite : TsfColor;cvar;external;
{/< White predefined color }
    sfRed : TsfColor;cvar;external;
{/< Red predefined color }
    sfGreen : TsfColor;cvar;external;
{/< Green predefined color }
    sfBlue : TsfColor;cvar;external;
{/< Blue predefined color }
    sfYellow : TsfColor;cvar;external;
{/< Yellow predefined color }
    sfMagenta : TsfColor;cvar;external;
{/< Magenta predefined color }
    sfCyan : TsfColor;cvar;external;
{/< Cyan predefined color }
    sfTransparent : TsfColor;cvar;external;
{/< Transparent (black) predefined color }
{////////////////////////////////////////////////////////// }
{/ \brief Construct a color from its 3 RGB components }
{/ }
{/ \param red   Red component   (0 .. 255) }
{/ \param green Green component (0 .. 255) }
{/ \param blue  Blue component  (0 .. 255) }
{/ }
{/ \return sfColor constructed from the components }
{/ }
{////////////////////////////////////////////////////////// }

function sfColor_fromRGB(red:TsfUint8; green:TsfUint8; blue:TsfUint8):TsfColor;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a color from its 4 RGBA components }
{/ }
{/ \param red   Red component   (0 .. 255) }
{/ \param green Green component (0 .. 255) }
{/ \param blue  Blue component  (0 .. 255) }
{/ \param alpha Alpha component (0 .. 255) }
{/ }
{/ \return sfColor constructed from the components }
{/ }
{////////////////////////////////////////////////////////// }
function sfColor_fromRGBA(red:TsfUint8; green:TsfUint8; blue:TsfUint8; alpha:TsfUint8):TsfColor;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct the color from 32-bit unsigned integer }
{/ }
{/ \param color Number containing the RGBA components (in that order) }
{/ }
{/ \return sfColor constructed from the 32-bit unsigned integer }
{/ }
{////////////////////////////////////////////////////////// }
function sfColor_fromInteger(color:TsfUint32):TsfColor;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Convert a color to a 32-bit unsigned integer }
{/ }
{/ \return Color represented as a 32-bit unsigned integer }
{/ }
{////////////////////////////////////////////////////////// }
function sfColor_toInteger(color:TsfColor):TsfUint32;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Add two colors }
{/ }
{/ \param color1 First color }
{/ \param color2 Second color }
{/ }
{/ \return Component-wise saturated addition of the two colors }
{/ }
{////////////////////////////////////////////////////////// }
function sfColor_add(color1:TsfColor; color2:TsfColor):TsfColor;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Subtract two colors }
{/ }
{/ \param color1 First color }
{/ \param color2 Second color }
{/ }
{/ \return Component-wise saturated subtraction of the two colors }
{/ }
{////////////////////////////////////////////////////////// }
function sfColor_subtract(color1:TsfColor; color2:TsfColor):TsfColor;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Modulate two colors }
{/ }
{/ \param color1 First color }
{/ \param color2 Second color }
{/ }
{/ \return Component-wise multiplication of the two colors }
{/ }
{////////////////////////////////////////////////////////// }
function sfColor_modulate(color1:TsfColor; color2:TsfColor):TsfColor;cdecl;external;
{$endif}
{ SFML_COLOR_H }

implementation


end.
