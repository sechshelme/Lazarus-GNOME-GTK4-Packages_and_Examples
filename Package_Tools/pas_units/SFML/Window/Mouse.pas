unit Mouse;

interface

uses
  fp_sfml;

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
{$ifndef SFML_MOUSE_H}
{$define SFML_MOUSE_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Types.h>}
{$include <SFML/System/Vector2.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Mouse buttons }
{/ }
{////////////////////////////////////////////////////////// }
{/< The left mouse button }
{/< The right mouse button }
{/< The middle (wheel) mouse button }
{/< The first extra mouse button }
{/< The second extra mouse button }
{/< Keep last -- the total number of mouse buttons }
type
  PsfMouseButton = ^TsfMouseButton;
  TsfMouseButton =  Longint;
  Const
    sfMouseLeft = 0;
    sfMouseRight = 1;
    sfMouseMiddle = 2;
    sfMouseXButton1 = 3;
    sfMouseXButton2 = 4;
    sfMouseButtonCount = 5;
;
{////////////////////////////////////////////////////////// }
{/ \brief Mouse wheels }
{/ }
{////////////////////////////////////////////////////////// }
{/< The vertical mouse wheel }
{/< The horizontal mouse wheel }
type
  PsfMouseWheel = ^TsfMouseWheel;
  TsfMouseWheel =  Longint;
  Const
    sfMouseVerticalWheel = 0;
    sfMouseHorizontalWheel = 1;
;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a mouse button is pressed }
{/ }
{/ \param button Button to check }
{/ }
{/ \return sfTrue if the button is pressed, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }

function sfMouse_isButtonPressed(button:TsfMouseButton):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get the current position of the mouse }
{/ }
{/ This function returns the current position of the mouse }
{/ cursor relative to the given window, or desktop if NULL is passed. }
{/ }
{/ \param relativeTo Reference window }
{/ }
{/ \return Position of the mouse cursor, relative to the given window }
{/ }
{////////////////////////////////////////////////////////// }
function sfMouse_getPosition(relativeTo:PsfWindow):TsfVector2i;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Set the current position of the mouse }
{/ }
{/ This function sets the current position of the mouse }
{/ cursor relative to the given window, or desktop if NULL is passed. }
{/ }
{/ \param position   New position of the mouse }
{/ \param relativeTo Reference window }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMouse_setPosition(position:TsfVector2i; relativeTo:PsfWindow);cdecl;external libsfml_window;
{$endif}
{ SFML_MOUSE_H }

// === Konventiert am: 24-9-25 16:58:11 ===


implementation



end.
