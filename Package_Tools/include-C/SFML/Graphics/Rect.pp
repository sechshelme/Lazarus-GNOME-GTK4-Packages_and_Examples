
unit Rect;
interface

{
  Automatically converted by H2Pas 1.0.0 from Rect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Rect.h
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
PsfFloatRect  = ^sfFloatRect;
PsfIntRect  = ^sfIntRect;
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
{$ifndef SFML_RECT_H}
{$define SFML_RECT_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{$include <SFML/System/Vector2.h>}
{////////////////////////////////////////////////////////// }
{/ sfFloatRect and sfIntRect are utility classes for }
{/ manipulating rectangles. }
{////////////////////////////////////////////////////////// }
type
  PsfFloatRect = ^TsfFloatRect;
  TsfFloatRect = record
      left : single;
      top : single;
      width : single;
      height : single;
    end;

  PsfIntRect = ^TsfIntRect;
  TsfIntRect = record
      left : longint;
      top : longint;
      width : longint;
      height : longint;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a point is inside a rectangle's area }
{/ }
{/ \param rect Rectangle to test }
{/ \param x    X coordinate of the point to test }
{/ \param y    Y coordinate of the point to test }
{/ }
{/ \return sfTrue if the point is inside }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)

function sfFloatRect_contains(rect:PsfFloatRect; x:single; y:single):TsfBool;cdecl;external;
(* Const before type ignored *)
function sfIntRect_contains(rect:PsfIntRect; x:longint; y:longint):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Check intersection between two rectangles }
{/ }
{/ \param rect1        First rectangle to test }
{/ \param rect2        Second rectangle to test }
{/ \param intersection Rectangle to be filled with overlapping rect (can be NULL) }
{/ }
{/ \return sfTrue if rectangles overlap }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFloatRect_intersects(rect1:PsfFloatRect; rect2:PsfFloatRect; intersection:PsfFloatRect):TsfBool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sfIntRect_intersects(rect1:PsfIntRect; rect2:PsfIntRect; intersection:PsfIntRect):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the position of the rectangle's top-left corner }
{/ }
{/ \return Position of rectangle }
{/ }
{/ \see getSize }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFloatRect_getPosition(rect:PsfFloatRect):TsfVector2f;cdecl;external;
(* Const before type ignored *)
function sfIntRect_getPosition(rect:PsfIntRect):TsfVector2i;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the size of the rectangle }
{/ }
{/ \return Size of rectangle }
{/ }
{/ \see getPosition }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFloatRect_getSize(rect:PsfFloatRect):TsfVector2f;cdecl;external;
(* Const before type ignored *)
function sfIntRect_getSize(rect:PsfIntRect):TsfVector2i;cdecl;external;
{$endif}
{ SFML_RECT_H }

implementation


end.
