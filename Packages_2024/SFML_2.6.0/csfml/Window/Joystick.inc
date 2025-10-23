{$IFDEF read_interface}


const
  sfJoystickCount = 8;
  sfJoystickButtonCount = 32;
  sfJoystickAxisCount = 8;

type
  PsfJoystickAxis = ^TsfJoystickAxis;
  TsfJoystickAxis = longint;

const
  sfJoystickX = 0;
  sfJoystickY = 1;
  sfJoystickZ = 2;
  sfJoystickR = 3;
  sfJoystickU = 4;
  sfJoystickV = 5;
  sfJoystickPovX = 6;
  sfJoystickPovY = 7;

function sfJoystick_isConnected(joystick: dword): TsfBool; cdecl; external libcsfml_window;
function sfJoystick_getButtonCount(joystick: dword): dword; cdecl; external libcsfml_window;
function sfJoystick_hasAxis(joystick: dword; axis: TsfJoystickAxis): TsfBool; cdecl; external libcsfml_window;
function sfJoystick_isButtonPressed(joystick: dword; button: dword): TsfBool; cdecl; external libcsfml_window;
function sfJoystick_getAxisPosition(joystick: dword; axis: TsfJoystickAxis): single; cdecl; external libcsfml_window;
function sfJoystick_getIdentification(joystick: dword): TsfJoystickIdentification; cdecl; external libcsfml_window;
procedure sfJoystick_update; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
