
unit Clipboard;
interface

{
  Automatically converted by H2Pas 1.0.0 from Clipboard.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Clipboard.h
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
PsfUint32  = ^sfUint32;
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
{$ifndef SFML_CLIPBOARD_H}
{$define SFML_CLIPBOARD_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Types.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Get the content of the clipboard as string data (returns an ANSI string) }
{/ }
{/ This function returns the content of the clipboard }
{/ as a string. If the clipboard does not contain string }
{/ it returns an empty string. }
{/ }
{/ \return Clipboard contents as a locale-dependent ANSI string }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)

function sfClipboard_getString:Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the content of the clipboard as string data (returns a Unicode string) }
{/ }
{/ This function returns the content of the clipboard }
{/ as a string. If the clipboard does not contain string }
{/ it returns an empty string. }
{/ }
{/ \return Clipboard contents as UTF-32 }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfClipboard_getUnicodeString:PsfUint32;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the content of the clipboard as ANSI string data }
{/ }
{/ This function sets the content of the clipboard as an }
{/ ANSI string. }
{/ }
{/ \param text ANSI string containing the data to be sent }
{/ to the clipboard }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfClipboard_setString(text:Pchar);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the content of the clipboard as Unicode string data }
{/ }
{/ This function sets the content of the clipboard as a }
{/ Unicode string. }
{/ }
{/ \param text Unicode string containing the data to be sent }
{/ to the clipboard }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfClipboard_setUnicodeString(text:PsfUint32);cdecl;external;
{$endif}
{ SFML_CURSOR_H }

implementation


end.
