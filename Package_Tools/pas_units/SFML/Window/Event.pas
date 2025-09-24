unit Event;

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
{$ifndef SFML_EVENT_H}
{$define SFML_EVENT_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Joystick.h>}
{$include <SFML/Window/Keyboard.h>}
{$include <SFML/Window/Mouse.h>}
{$include <SFML/Window/Sensor.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Definition of all the event types }
{/ }
{////////////////////////////////////////////////////////// }
{/< The window requested to be closed (no data) }
{/< The window was resized (data in event.size) }
{/< The window lost the focus (no data) }
{/< The window gained the focus (no data) }
{/< A character was entered (data in event.text) }
{/< A key was pressed (data in event.key) }
{/< A key was released (data in event.key) }
{/< The mouse wheel was scrolled (data in event.mouseWheel) (deprecated) }
{/< The mouse wheel was scrolled (data in event.mouseWheelScroll) }
{/< A mouse button was pressed (data in event.mouseButton) }
{/< A mouse button was released (data in event.mouseButton) }
{/< The mouse cursor moved (data in event.mouseMove) }
{/< The mouse cursor entered the area of the window (no data) }
{/< The mouse cursor left the area of the window (no data) }
{/< A joystick button was pressed (data in event.joystickButton) }
{/< A joystick button was released (data in event.joystickButton) }
{/< The joystick moved along an axis (data in event.joystickMove) }
{/< A joystick was connected (data in event.joystickConnect) }
{/< A joystick was disconnected (data in event.joystickConnect) }
{/< A touch event began (data in event.touch) }
{/< A touch moved (data in event.touch) }
{/< A touch event ended (data in event.touch) }
{/< A sensor value changed (data in event.sensor) }
{/< Keep last -- the total number of event types }
type
  PsfEventType = ^TsfEventType;
  TsfEventType =  Longint;
  Const
    sfEvtClosed = 0;
    sfEvtResized = 1;
    sfEvtLostFocus = 2;
    sfEvtGainedFocus = 3;
    sfEvtTextEntered = 4;
    sfEvtKeyPressed = 5;
    sfEvtKeyReleased = 6;
    sfEvtMouseWheelMoved = 7;
    sfEvtMouseWheelScrolled = 8;
    sfEvtMouseButtonPressed = 9;
    sfEvtMouseButtonReleased = 10;
    sfEvtMouseMoved = 11;
    sfEvtMouseEntered = 12;
    sfEvtMouseLeft = 13;
    sfEvtJoystickButtonPressed = 14;
    sfEvtJoystickButtonReleased = 15;
    sfEvtJoystickMoved = 16;
    sfEvtJoystickConnected = 17;
    sfEvtJoystickDisconnected = 18;
    sfEvtTouchBegan = 19;
    sfEvtTouchMoved = 20;
    sfEvtTouchEnded = 21;
    sfEvtSensorChanged = 22;
    sfEvtCount = 23;
;
{////////////////////////////////////////////////////////// }
{/ \brief Keyboard event parameters }
{/ }
{////////////////////////////////////////////////////////// }
type
  PsfKeyEvent = ^TsfKeyEvent;
  TsfKeyEvent = record
      _type : TsfEventType;
      code : TsfKeyCode;
      scancode : TsfScancode;
      alt : TsfBool;
      control : TsfBool;
      shift : TsfBool;
      system : TsfBool;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Text event parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfTextEvent = ^TsfTextEvent;
  TsfTextEvent = record
      _type : TsfEventType;
      unicode : TsfUint32;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Mouse move event parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfMouseMoveEvent = ^TsfMouseMoveEvent;
  TsfMouseMoveEvent = record
      _type : TsfEventType;
      x : longint;
      y : longint;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Mouse buttons events parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfMouseButtonEvent = ^TsfMouseButtonEvent;
  TsfMouseButtonEvent = record
      _type : TsfEventType;
      button : TsfMouseButton;
      x : longint;
      y : longint;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Mouse wheel events parameters }
{/ }
{/ \deprecated }
{/ Use sfMouseWheelScrollEvent instead. }
{/ }
{////////////////////////////////////////////////////////// }

  PCSFML_DEPRECATED = ^TCSFML_DEPRECATED;
  TCSFML_DEPRECATED = record
      _type : TsfEventType;
      delta : longint;
      x : longint;
      y : longint;
    end;
  TsfMouseWheelEvent = TCSFML_DEPRECATED;
  PsfMouseWheelEvent = ^TsfMouseWheelEvent;
{////////////////////////////////////////////////////////// }
{/ \brief Mouse wheel events parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfMouseWheelScrollEvent = ^TsfMouseWheelScrollEvent;
  TsfMouseWheelScrollEvent = record
      _type : TsfEventType;
      wheel : TsfMouseWheel;
      delta : single;
      x : longint;
      y : longint;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Joystick axis move event parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfJoystickMoveEvent = ^TsfJoystickMoveEvent;
  TsfJoystickMoveEvent = record
      _type : TsfEventType;
      joystickId : dword;
      axis : TsfJoystickAxis;
      position : single;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Joystick buttons events parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfJoystickButtonEvent = ^TsfJoystickButtonEvent;
  TsfJoystickButtonEvent = record
      _type : TsfEventType;
      joystickId : dword;
      button : dword;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Joystick connection/disconnection event parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfJoystickConnectEvent = ^TsfJoystickConnectEvent;
  TsfJoystickConnectEvent = record
      _type : TsfEventType;
      joystickId : dword;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Size events parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfSizeEvent = ^TsfSizeEvent;
  TsfSizeEvent = record
      _type : TsfEventType;
      width : dword;
      height : dword;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Touch events parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfTouchEvent = ^TsfTouchEvent;
  TsfTouchEvent = record
      _type : TsfEventType;
      finger : dword;
      x : longint;
      y : longint;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Sensor event parameters }
{/ }
{////////////////////////////////////////////////////////// }

  PsfSensorEvent = ^TsfSensorEvent;
  TsfSensorEvent = record
      _type : TsfEventType;
      sensorType : TsfSensorType;
      x : single;
      y : single;
      z : single;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief sfEvent defines a system event and its parameters }
{/ }
{////////////////////////////////////////////////////////// }
{/< Type of the event }
{/< Size event parameters }
{/< Key event parameters }
{/< Text event parameters }
{/< Mouse move event parameters }
{/< Mouse button event parameters }
{/< Mouse wheel event parameters (deprecated) }
{/< Mouse wheel event parameters }
{/< Joystick move event parameters }
{/< Joystick button event parameters }
{/< Joystick (dis)connect event parameters }
{/< Touch events parameters }
{/< Sensor event parameters }

  PsfEvent = ^TsfEvent;
  TsfEvent = record
      case longint of
        0 : ( _type : TsfEventType );
        1 : ( size : TsfSizeEvent );
        2 : ( key : TsfKeyEvent );
        3 : ( text : TsfTextEvent );
        4 : ( mouseMove : TsfMouseMoveEvent );
        5 : ( mouseButton : TsfMouseButtonEvent );
        6 : ( mouseWheel : TsfMouseWheelEvent );
        7 : ( mouseWheelScroll : TsfMouseWheelScrollEvent );
        8 : ( joystickMove : TsfJoystickMoveEvent );
        9 : ( joystickButton : TsfJoystickButtonEvent );
        10 : ( joystickConnect : TsfJoystickConnectEvent );
        11 : ( touch : TsfTouchEvent );
        12 : ( sensor : TsfSensorEvent );
      end;
{$endif}
{ SFML_EVENT_H }

// === Konventiert am: 24-9-25 16:58:23 ===


implementation



end.
