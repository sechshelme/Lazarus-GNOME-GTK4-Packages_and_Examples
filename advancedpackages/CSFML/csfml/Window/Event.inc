{$IFDEF read_interface}


type
  PsfEventType = ^TsfEventType;
  TsfEventType = longint;

const
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

type
  TsfKeyEvent = record
    _type: TsfEventType;
    code: TsfKeyCode;
    scancode: TsfScancode;
    alt: TsfBool;
    control: TsfBool;
    shift: TsfBool;
    system: TsfBool;
  end;
  PsfKeyEvent = ^TsfKeyEvent;

  TsfTextEvent = record
    _type: TsfEventType;
    unicode: TsfUint32;
  end;
  PsfTextEvent = ^TsfTextEvent;

  TsfMouseMoveEvent = record
    _type: TsfEventType;
    x: longint;
    y: longint;
  end;
  PsfMouseMoveEvent = ^TsfMouseMoveEvent;

  TsfMouseButtonEvent = record
    _type: TsfEventType;
    button: TsfMouseButton;
    x: longint;
    y: longint;
  end;
  PsfMouseButtonEvent = ^TsfMouseButtonEvent;

  TCSFML_DEPRECATED = record
    _type: TsfEventType;
    delta: longint;
    x: longint;
    y: longint;
  end;
  PCSFML_DEPRECATED = ^TCSFML_DEPRECATED;

  TsfMouseWheelEvent = TCSFML_DEPRECATED;
  PsfMouseWheelEvent = ^TsfMouseWheelEvent;

  TsfMouseWheelScrollEvent = record
    _type: TsfEventType;
    wheel: TsfMouseWheel;
    delta: single;
    x: longint;
    y: longint;
  end;
  PsfMouseWheelScrollEvent = ^TsfMouseWheelScrollEvent;

  TsfJoystickMoveEvent = record
    _type: TsfEventType;
    joystickId: dword;
    axis: TsfJoystickAxis;
    position: single;
  end;
  PsfJoystickMoveEvent = ^TsfJoystickMoveEvent;

  TsfJoystickButtonEvent = record
    _type: TsfEventType;
    joystickId: dword;
    button: dword;
  end;
  PsfJoystickButtonEvent = ^TsfJoystickButtonEvent;

  TsfJoystickConnectEvent = record
    _type: TsfEventType;
    joystickId: dword;
  end;
  PsfJoystickConnectEvent = ^TsfJoystickConnectEvent;

  TsfSizeEvent = record
    _type: TsfEventType;
    width: dword;
    height: dword;
  end;
  PsfSizeEvent = ^TsfSizeEvent;

  TsfTouchEvent = record
    _type: TsfEventType;
    finger: dword;
    x: longint;
    y: longint;
  end;
  PsfTouchEvent = ^TsfTouchEvent;

  TsfSensorEvent = record
    _type: TsfEventType;
    sensorType: TsfSensorType;
    x: single;
    y: single;
    z: single;
  end;
  PsfSensorEvent = ^TsfSensorEvent;

  TsfEvent = record
    case longint of
      0: (_type: TsfEventType);
      1: (size: TsfSizeEvent);
      2: (key: TsfKeyEvent);
      3: (text: TsfTextEvent);
      4: (mouseMove: TsfMouseMoveEvent);
      5: (mouseButton: TsfMouseButtonEvent);
      6: (mouseWheel: TsfMouseWheelEvent);
      7: (mouseWheelScroll: TsfMouseWheelScrollEvent);
      8: (joystickMove: TsfJoystickMoveEvent);
      9: (joystickButton: TsfJoystickButtonEvent);
      10: (joystickConnect: TsfJoystickConnectEvent);
      11: (touch: TsfTouchEvent);
      12: (sensor: TsfSensorEvent);
  end;
  PsfEvent = ^TsfEvent;

  // === Konventiert am: 24-9-25 16:58:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
