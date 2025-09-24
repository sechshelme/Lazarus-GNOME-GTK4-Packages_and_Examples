
unit Window;
interface

{
  Automatically converted by H2Pas 1.0.0 from Window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Window.h
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
PsfContextAttribute  = ^sfContextAttribute;
PsfContextSettings  = ^sfContextSettings;
PsfCursor  = ^sfCursor;
PsfEvent  = ^sfEvent;
PsfUint32  = ^sfUint32;
PsfUint8  = ^sfUint8;
PsfWindow  = ^sfWindow;
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
{$ifndef SFML_WINDOW_H}
{$define SFML_WINDOW_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Event.h>}
{$include <SFML/Window/VideoMode.h>}
{$include <SFML/Window/WindowBase.h>}
{$include <SFML/Window/WindowHandle.h>}
{$include <SFML/Window/Types.h>}
{$include <SFML/System/Vector2.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Enumeration of the context attribute flags }
{/ }
{////////////////////////////////////////////////////////// }
{/< Non-debug, compatibility context (this and the core attribute are mutually exclusive) }
{/< Core attribute }
{/< Debug attribute }
type
  PsfContextAttribute = ^TsfContextAttribute;
  TsfContextAttribute =  Longint;
  Const
    sfContextDefault = 0;
    sfContextCore = 1 shl 0;
    sfContextDebug = 1 shl 2;
;
{////////////////////////////////////////////////////////// }
{/ \brief Structure defining the window's creation settings }
{/ }
{////////////////////////////////////////////////////////// }
{/< Bits of the depth buffer }
{/< Bits of the stencil buffer }
{/< Level of antialiasing }
{/< Major number of the context version to create }
{/< Minor number of the context version to create }
{/< The attribute flags to create the context with }
{/< Whether the context framebuffer is sRGB capable }
type
  PsfContextSettings = ^TsfContextSettings;
  TsfContextSettings = record
      depthBits : dword;
      stencilBits : dword;
      antialiasingLevel : dword;
      majorVersion : dword;
      minorVersion : dword;
      attributeFlags : TsfUint32;
      sRgbCapable : TsfBool;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a new window }
{/ }
{/ This function creates the window with the size and pixel }
{/ depth defined in \a mode. An optional style can be passed to }
{/ customize the look and behaviour of the window (borders, }
{/ title bar, resizable, closable, ...). If \a style contains }
{/ sfFullscreen, then \a mode must be a valid video mode. }
{/ }
{/ The fourth parameter is a pointer to a structure specifying }
{/ advanced OpenGL context settings such as antialiasing, }
{/ depth-buffer bits, etc. }
{/ }
{/ \param mode     Video mode to use (defines the width, height and depth of the rendering area of the window) }
{/ \param title    Title of the window }
{/ \param style    Window style }
{/ \param settings Additional settings for the underlying OpenGL context }
{/ }
{/ \return A new sfWindow object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)

function sfWindow_create(mode:TsfVideoMode; title:Pchar; style:TsfUint32; settings:PsfContextSettings):PsfWindow;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a new window (with a UTF-32 title) }
{/ }
{/ This function creates the window with the size and pixel }
{/ depth defined in \a mode. An optional style can be passed to }
{/ customize the look and behaviour of the window (borders, }
{/ title bar, resizable, closable, ...). If \a style contains }
{/ sfFullscreen, then \a mode must be a valid video mode. }
{/ }
{/ The fourth parameter is a pointer to a structure specifying }
{/ advanced OpenGL context settings such as antialiasing, }
{/ depth-buffer bits, etc. }
{/ }
{/ \param mode     Video mode to use (defines the width, height and depth of the rendering area of the window) }
{/ \param title    Title of the window (UTF-32) }
{/ \param style    Window style }
{/ \param settings Additional settings for the underlying OpenGL context }
{/ }
{/ \return A new sfWindow object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfWindow_createUnicode(mode:TsfVideoMode; title:PsfUint32; style:TsfUint32; settings:PsfContextSettings):PsfWindow;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a window from an existing control }
{/ }
{/ Use this constructor if you want to create an OpenGL }
{/ rendering area into an already existing control. }
{/ }
{/ The second parameter is a pointer to a structure specifying }
{/ advanced OpenGL context settings such as antialiasing, }
{/ depth-buffer bits, etc. }
{/ }
{/ \param handle   Platform-specific handle of the control }
{/ \param settings Additional settings for the underlying OpenGL context }
{/ }
{/ \return A new sfWindow object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_createFromHandle(handle:TsfWindowHandle; settings:PsfContextSettings):PsfWindow;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a window }
{/ }
{/ \param window Window to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_destroy(window:PsfWindow);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Close a window and destroy all the attached resources }
{/ }
{/ After calling this function, the sfWindow object remains }
{/ valid, you must call sfWindow_destroy to actually delete it. }
{/ All other functions such as sfWindow_pollEvent or sfWindow_display }
{/ will still work (i.e. you don't have to test sfWindow_isOpen }
{/ every time), and will have no effect on closed windows. }
{/ }
{/ \param window Window object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_close(window:PsfWindow);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether or not a window is opened }
{/ }
{/ This function returns whether or not the window exists. }
{/ Note that a hidden window (sfWindow_setVisible(sfFalse)) will return }
{/ sfTrue. }
{/ }
{/ \param window Window object }
{/ }
{/ \return sfTrue if the window is opened, sfFalse if it has been closed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_isOpen(window:PsfWindow):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the settings of the OpenGL context of a window }
{/ }
{/ Note that these settings may be different from what was }
{/ passed to the sfWindow_create function, }
{/ if one or more settings were not supported. In this case, }
{/ SFML chose the closest match. }
{/ }
{/ \param window Window object }
{/ }
{/ \return Structure containing the OpenGL context settings }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_getSettings(window:PsfWindow):TsfContextSettings;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Pop the event on top of event queue, if any, and return it }
{/ }
{/ This function is not blocking: if there's no pending event then }
{/ it will return false and leave \a event unmodified. }
{/ Note that more than one event may be present in the event queue, }
{/ thus you should always call this function in a loop }
{/ to make sure that you process every pending event. }
{/ }
{/ \param window Window object }
{/ \param event  Event to be returned }
{/ }
{/ \return sfTrue if an event was returned, or sfFalse if the event queue was empty }
{/ }
{////////////////////////////////////////////////////////// }
function sfWindow_pollEvent(window:PsfWindow; event:PsfEvent):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Wait for an event and return it }
{/ }
{/ This function is blocking: if there's no pending event then }
{/ it will wait until an event is received. }
{/ After this function returns (and no error occured), }
{/ the \a event object is always valid and filled properly. }
{/ This function is typically used when you have a thread that }
{/ is dedicated to events handling: you want to make this thread }
{/ sleep as long as no new event is received. }
{/ }
{/ \param window Window object }
{/ \param event  Event to be returned }
{/ }
{/ \return sfFalse if any error occured }
{/ }
{////////////////////////////////////////////////////////// }
function sfWindow_waitEvent(window:PsfWindow; event:PsfEvent):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the position of a window }
{/ }
{/ \param window Window object }
{/ }
{/ \return Position in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_getPosition(window:PsfWindow):TsfVector2i;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the position of a window on screen }
{/ }
{/ This function only works for top-level windows }
{/ (i.e. it will be ignored for windows created from }
{/ the handle of a child window/control). }
{/ }
{/ \param window   Window object }
{/ \param position New position of the window, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setPosition(window:PsfWindow; position:TsfVector2i);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the size of the rendering region of a window }
{/ }
{/ The size doesn't include the titlebar and borders }
{/ of the window. }
{/ }
{/ \param window Window object }
{/ }
{/ \return Size in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_getSize(window:PsfWindow):TsfVector2u;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the size of the rendering region of a window }
{/ }
{/ \param window Window object }
{/ \param size   New size, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setSize(window:PsfWindow; size:TsfVector2u);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the title of a window }
{/ }
{/ \param window Window object }
{/ \param title  New title }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfWindow_setTitle(window:PsfWindow; title:Pchar);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the title of a window (with a UTF-32 string) }
{/ }
{/ \param window Window object }
{/ \param title  New title }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfWindow_setUnicodeTitle(window:PsfWindow; title:PsfUint32);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change a window's icon }
{/ }
{/ \a pixels must be an array of \a width x \a height pixels }
{/ in 32-bits RGBA format. }
{/ }
{/ \param window Window object }
{/ \param width  Icon's width, in pixels }
{/ \param height Icon's height, in pixels }
{/ \param pixels Pointer to the array of pixels in memory }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfWindow_setIcon(window:PsfWindow; width:dword; height:dword; pixels:PsfUint8);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Show or hide a window }
{/ }
{/ \param window  Window object }
{/ \param visible sfTrue to show the window, sfFalse to hide it }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setVisible(window:PsfWindow; visible:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Enable or disable vertical synchronization }
{/ }
{/ Activating vertical synchronization will limit the number }
{/ of frames displayed to the refresh rate of the monitor. }
{/ This can avoid some visual artifacts, and limit the framerate }
{/ to a good value (but not constant across different computers). }
{/ }
{/ \param window  Window object }
{/ \param enabled sfTrue to enable v-sync, sfFalse to deactivate }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setVerticalSyncEnabled(window:PsfWindow; enabled:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Show or hide the mouse cursor }
{/ }
{/ \param window  Window object }
{/ \param visible sfTrue to show, sfFalse to hide }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setMouseCursorVisible(window:PsfWindow; visible:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Grab or release the mouse cursor }
{/ }
{/ If set, grabs the mouse cursor inside this window's client }
{/ area so it may no longer be moved outside its bounds. }
{/ Note that grabbing is only active while the window has }
{/ focus and calling this function for fullscreen windows }
{/ won't have any effect (fullscreen windows always grab the }
{/ cursor). }
{/ }
{/ \param grabbed sfTrue to enable, sfFalse to disable }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setMouseCursorGrabbed(window:PsfWindow; grabbed:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the displayed cursor to a native system cursor }
{/ }
{/ Upon window creation, the arrow cursor is used by default. }
{/ }
{/ \warning The cursor must not be destroyed while in use by }
{/          the window. }
{/ }
{/ \warning Features related to Cursor are not supported on }
{/          iOS and Android. }
{/ }
{/ \param window Window object }
{/ \param cursor Native system cursor type to display }
{/ }
{/ \see sfCursor_createFromSystem }
{/ \see sfCursor_createFromPixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfWindow_setMouseCursor(window:PsfWindow; cursor:PsfCursor);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Enable or disable automatic key-repeat }
{/ }
{/ If key repeat is enabled, you will receive repeated }
{/ KeyPress events while keeping a key pressed. If it is disabled, }
{/ you will only get a single event when the key is pressed. }
{/ }
{/ Key repeat is enabled by default. }
{/ }
{/ \param window  Window object }
{/ \param enabled sfTrue to enable, sfFalse to disable }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setKeyRepeatEnabled(window:PsfWindow; enabled:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Limit the framerate to a maximum fixed frequency }
{/ }
{/ If a limit is set, the window will use a small delay after }
{/ each call to sfWindow_display to ensure that the current frame }
{/ lasted long enough to match the framerate limit. }
{/ }
{/ \param window Window object }
{/ \param limit  Framerate limit, in frames per seconds (use 0 to disable limit) }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setFramerateLimit(window:PsfWindow; limit:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the joystick threshold }
{/ }
{/ The joystick threshold is the value below which }
{/ no JoystickMoved event will be generated. }
{/ }
{/ \param window    Window object }
{/ \param threshold New threshold, in the range [0, 100] }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_setJoystickThreshold(window:PsfWindow; threshold:single);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Activate or deactivate a window as the current target }
{/        for OpenGL rendering }
{/ }
{/ A window is active only on the current thread, if you want to }
{/ make it active on another thread you have to deactivate it }
{/ on the previous thread first if it was active. }
{/ Only one window can be active on a thread at a time, thus }
{/ the window previously active (if any) automatically gets deactivated. }
{/ This is not to be confused with sfWindow_requestFocus(). }
{/ }
{/ \param window Window object }
{/ \param active sfTrue to activate, sfFalse to deactivate }
{/ }
{/ \return sfTrue if operation was successful, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }
function sfWindow_setActive(window:PsfWindow; active:TsfBool):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Request the current window to be made the active }
{/ foreground window }
{/ }
{/ At any given time, only one window may have the input focus }
{/ to receive input events such as keystrokes or mouse events. }
{/ If a window requests focus, it only hints to the operating }
{/ system, that it would like to be focused. The operating system }
{/ is free to deny the request. }
{/ This is not to be confused with sfWindow_setActive(). }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_requestFocus(window:PsfWindow);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Check whether the window has the input focus }
{/ }
{/ At any given time, only one window may have the input focus }
{/ to receive input events such as keystrokes or most mouse }
{/ events. }
{/ }
{/ \return True if window has focus, false otherwise }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_hasFocus(window:PsfWindow):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Display on screen what has been rendered to the }
{/        window so far }
{/ }
{/ This function is typically called after all OpenGL rendering }
{/ has been done for the current frame, in order to show }
{/ it on screen. }
{/ }
{/ \param window Window object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfWindow_display(window:PsfWindow);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the OS-specific handle of the window }
{/ }
{/ The type of the returned handle is sfWindowHandle, }
{/ which is a typedef to the handle type defined by the OS. }
{/ You shouldn't need to use this function, unless you have }
{/ very specific stuff to implement that SFML doesn't support, }
{/ or implement a temporary workaround until a bug is fixed. }
{/ }
{/ \param window Window object }
{/ }
{/ \return System handle of the window }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfWindow_getSystemHandle(window:PsfWindow):TsfWindowHandle;cdecl;external;
{$endif}
{ SFML_WINDOW_H }

implementation


end.
