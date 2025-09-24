unit Cursor;

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
{$ifndef SFML_CURSOR_H}
{$define SFML_CURSOR_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/System/Vector2.h>}
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Types.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Enumeration of the native system cursor types }
{/ }
{/ Refer to the following table to determine which cursor }
{/ is available on which platform. }
{/ }
{/  Type                               | Linux | Mac OS X | Windows }
{/ ------------------------------------|:-----:|:--------:|:--------: }
{/  sfCursorArrow                  |  yes  |    yes   |   yes }
{/  sfCursorArrowWait              |  no   |    no    |   yes }
{/  sfCursorWait                   |  yes  |    no    |   yes }
{/  sfCursorText                   |  yes  |    yes   |   yes }
{/  sfCursorHand                   |  yes  |    yes   |   yes }
{/  sfCursorSizeHorizontal         |  yes  |    yes   |   yes }
{/  sfCursorSizeVertical           |  yes  |    yes   |   yes }
{/  sfCursorSizeTopLeftBottomRight |  no   |    no    |   yes }
{/  sfCursorSizeBottomLeftTopRight |  no   |    no    |   yes }
{/  sfCursorSizeLeft               |  yes  |    yes   |   yes }
{/  sfCursorSizeRight              |  yes  |    yes   |   yes }
{/  sfCursorSizeTop                |  yes  |    yes   |   yes }
{/  sfCursorSizeBottom             |  yes  |    yes   |   yes }
{/  sfCursorSizeTopLeft            |  yes  |    yes   |   yes }
{/  sfCursorSizeTopRight           |  yes  |    yes   |   yes }
{/  sfCursorSizeBottomLeft         |  yes  |    yes   |   yes }
{/  sfCursorSizeBottomRight        |  yes  |    yes   |   yes }
{/  sfCursorSizeAll                |  yes  |    no    |   yes }
{/  sfCursorCross                  |  yes  |    yes   |   yes }
{/  sfCursorHelp                   |  yes  |    no    |   yes }
{/  sfCursorNotAllowed             |  yes  |    yes   |   yes }
{/ }
{////////////////////////////////////////////////////////// }
{/< Arrow cursor (default) }
{/< Busy arrow cursor }
{/< Busy cursor }
{/< I-beam, cursor when hovering over a field allowing text entry }
{/< Pointing hand cursor }
{/< Horizontal double arrow cursor }
{/< Vertical double arrow cursor }
{/< Double arrow cursor going from top-left to bottom-right }
{/< Double arrow cursor going from bottom-left to top-right }
{/< Left arrow cursor on Linux, same as SizeHorizontal on other platforms }
{/< Right arrow cursor on Linux, same as SizeHorizontal on other platforms }
{/< Up arrow cursor on Linux, same as SizeVertical on other platforms }
{/< Down arrow cursor on Linux, same as SizeVertical on other platforms }
{/< Top-left arrow cursor on Linux, same as SizeTopLeftBottomRight on other platforms }
{/< Bottom-right arrow cursor on Linux, same as SizeTopLeftBottomRight on other platforms }
{/< Bottom-left arrow cursor on Linux, same as SizeBottomLeftTopRight on other platforms }
{/< Top-right arrow cursor on Linux, same as SizeBottomLeftTopRight on other platforms }
{/< Combination of SizeHorizontal and SizeVertical }
{/< Crosshair cursor }
{/< Help cursor }
{/< Action not allowed cursor }
type
  PsfCursorType = ^TsfCursorType;
  TsfCursorType =  Longint;
  Const
    sfCursorArrow = 0;
    sfCursorArrowWait = 1;
    sfCursorWait = 2;
    sfCursorText = 3;
    sfCursorHand = 4;
    sfCursorSizeHorizontal = 5;
    sfCursorSizeVertical = 6;
    sfCursorSizeTopLeftBottomRight = 7;
    sfCursorSizeBottomLeftTopRight = 8;
    sfCursorSizeLeft = 9;
    sfCursorSizeRight = 10;
    sfCursorSizeTop = 11;
    sfCursorSizeBottom = 12;
    sfCursorSizeTopLeft = 13;
    sfCursorSizeBottomRight = 14;
    sfCursorSizeBottomLeft = 15;
    sfCursorSizeTopRight = 16;
    sfCursorSizeAll = 17;
    sfCursorCross = 18;
    sfCursorHelp = 19;
    sfCursorNotAllowed = 20;
;
{////////////////////////////////////////////////////////// }
{/ \brief Create a cursor with the provided image }
{/ }
{/ \a pixels must be an array of \a width by \a height pixels }
{/ in 32-bit RGBA format. If not, this will cause undefined behavior. }
{/ }
{/ If \a pixels is null or either \a width or \a height are 0, }
{/ the current cursor is left unchanged and the function will }
{/ return false. }
{/ }
{/ In addition to specifying the pixel data, you can also }
{/ specify the location of the hotspot of the cursor. The }
{/ hotspot is the pixel coordinate within the cursor image }
{/ which will be located exactly where the mouse pointer }
{/ position is. Any mouse actions that are performed will }
{/ return the window/screen location of the hotspot. }
{/ }
{/ \warning On Unix, the pixels are mapped into a monochrome }
{/          bitmap: pixels with an alpha channel to 0 are }
{/          transparent, black if the RGB channel are close }
{/          to zero, and white otherwise. }
{/ }
{/ \param pixels   Array of pixels of the image }
{/ \param size     Width and height of the image }
{/ \param hotspot  (x,y) location of the hotspot }
{/ \return A new sfCursor object }
{/ }
{////////////////////////////////////////////////////////// }

function sfCursor_createFromPixels(pixels:PsfUint8; size:TsfVector2u; hotspot:TsfVector2u):PsfCursor;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Create a native system cursor }
{/ }
{/ Refer to the list of cursor available on each system }
{/ (see sfCursorType) to know whether a given cursor is }
{/ expected to load successfully or is not supported by }
{/ the operating system. }
{/ }
{/ \param type Native system cursor type }
{/ \return A new sfCursor object }
{/ }
{////////////////////////////////////////////////////////// }
function sfCursor_createFromSystem(_type:TsfCursorType):PsfCursor;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a cursor }
{/ }
{/ \param cursor Cursor to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfCursor_destroy(cursor:PsfCursor);cdecl;external libsfml_window;
{$endif}
{ SFML_CURSOR_H }

// === Konventiert am: 24-9-25 16:58:26 ===


implementation



end.
