
unit Buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from Buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Buffer.h
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
PsfBuffer  = ^sfBuffer;
PsfUint8  = ^sfUint8;
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
{$ifndef SFML_BUFFER_H}
{$define SFML_BUFFER_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/System/Export.h>}
{$include <SFML/System/Types.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create an empty buffer }
{/ }
{/ \return A new sfBuffer object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }

function sfBuffer_create:PsfBuffer;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy an existing buffer }
{/ }
{/ \param buffer Buffer to delete }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfBuffer_destroy(buffer:PsfBuffer);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return the size of a buffer }
{/ }
{/ \param buffer Buffer object }
{/ }
{/ \return Size in bytes }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfBuffer_getSize(buffer:PsfBuffer):Tsize_t;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get a read-only pointer to the array of bytes of a buffer }
{/ }
{/ \param buffer Buffer object }
{/ }
{/ \return Read-only pointer to the array of bytes }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfBuffer_getData(buffer:PsfBuffer):PsfUint8;cdecl;external;
{$endif}
{ SFML_BUFFER_H }

implementation


end.
