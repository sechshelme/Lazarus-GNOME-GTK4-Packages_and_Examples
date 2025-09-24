
unit Font;
interface

{
  Automatically converted by H2Pas 1.0.0 from Font.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Font.h
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
Pchar  = ^char;
PsfFont  = ^sfFont;
PsfInputStream  = ^sfInputStream;
PsfTexture  = ^sfTexture;
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
{$ifndef SFML_FONT_H}
{$define SFML_FONT_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{$include <SFML/Graphics/FontInfo.h>}
{$include <SFML/Graphics/Glyph.h>}
{$include <SFML/Graphics/Types.h>}
{$include <SFML/System/InputStream.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create a new font from a file }
{/ }
{/ \param filename Path of the font file to load }
{/ }
{/ \return A new sfFont object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)

function sfFont_createFromFile(filename:Pchar):PsfFont;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new image font a file in memory }
{/ }
{/ \param data        Pointer to the file data in memory }
{/ \param sizeInBytes Size of the data to load, in bytes }
{/ }
{/ \return A new sfFont object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_createFromMemory(data:pointer; sizeInBytes:Tsize_t):PsfFont;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new image font a custom stream }
{/ }
{/ \param stream Source stream to read from }
{/ }
{/ \return A new sfFont object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
function sfFont_createFromStream(stream:PsfInputStream):PsfFont;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Copy an existing font }
{/ }
{/ \param font Font to copy }
{/ }
{/ \return Copied object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_copy(font:PsfFont):PsfFont;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy an existing font }
{/ }
{/ \param font Font to delete }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfFont_destroy(font:PsfFont);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get a glyph in a font }
{/ }
{/ \param font             Source font }
{/ \param codePoint        Unicode code point of the character to get }
{/ \param characterSize    Character size, in pixels }
{/ \param bold             Retrieve the bold version or the regular one? }
{/ \param outlineThickness Thickness of outline (when != 0 the glyph will not be filled) }
{/ }
{/ \return The corresponding glyph }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getGlyph(font:PsfFont; codePoint:TsfUint32; characterSize:dword; bold:TsfBool; outlineThickness:single):TsfGlyph;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the kerning value corresponding to a given pair of characters in a font }
{/ }
{/ \param font          Source font }
{/ \param first         Unicode code point of the first character }
{/ \param second        Unicode code point of the second character }
{/ \param characterSize Character size, in pixels }
{/ }
{/ \return Kerning offset, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getKerning(font:PsfFont; first:TsfUint32; second:TsfUint32; characterSize:dword):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the bold kerning value corresponding to a given pair of characters in a font }
{/ }
{/ \param font          Source font }
{/ \param first         Unicode code point of the first character }
{/ \param second        Unicode code point of the second character }
{/ \param characterSize Character size, in pixels }
{/ }
{/ \return Kerning offset, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getBoldKerning(font:PsfFont; first:TsfUint32; second:TsfUint32; characterSize:dword):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the line spacing value }
{/ }
{/ \param font          Source font }
{/ \param characterSize Character size, in pixels }
{/ }
{/ \return Line spacing, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getLineSpacing(font:PsfFont; characterSize:dword):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the position of the underline }
{/ }
{/ Underline position is the vertical offset to apply between the }
{/ baseline and the underline. }
{/ }
{/ \param font          Source font }
{/ \param characterSize Reference character size }
{/ }
{/ \return Underline position, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getUnderlinePosition(font:PsfFont; characterSize:dword):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the thickness of the underline }
{/ }
{/ Underline thickness is the vertical size of the underline. }
{/ }
{/ \param font          Source font }
{/ \param characterSize Reference character size }
{/ }
{/ \return Underline thickness, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getUnderlineThickness(font:PsfFont; characterSize:dword):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the texture containing the glyphs of a given size in a font }
{/ }
{/ \param font          Source font }
{/ \param characterSize Character size, in pixels }
{/ }
{/ \return Read-only pointer to the texture }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getTexture(font:PsfFont; characterSize:dword):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Enable or disable the smooth filter }
{/ }
{/ When the filter is activated, the font appears smoother }
{/ so that pixels are less noticeable. However if you want }
{/ the font to look exactly the same as its source file, }
{/ you should disable it. }
{/ The smooth filter is enabled by default. }
{/ }
{/ \param font          Source font }
{/ \param smooth        sfTrue to enable smoothing, sfFalse to disable it }
{/ }
{/ \see isSmooth }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfFont_setSmooth(font:PsfFont; smooth:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether the smooth filter is enabled or disabled }
{/ }
{/ \param font          Source font }
{/ }
{/ \return sfTrue if smoothing is enabled, sfFalse if it is disabled }
{/ }
{/ \see setSmooth }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_isSmooth(font:PsfFont):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the font information }
{/ }
{/ The returned structure will remain valid only if the font }
{/ is still valid. If the font is invalid an invalid structure }
{/ is returned. }
{/ }
{/ \param font Source font }
{/ }
{/ \return A structure that holds the font information }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFont_getInfo(font:PsfFont):TsfFontInfo;cdecl;external;
{$endif}
{ SFML_FONT_H }

implementation


end.
