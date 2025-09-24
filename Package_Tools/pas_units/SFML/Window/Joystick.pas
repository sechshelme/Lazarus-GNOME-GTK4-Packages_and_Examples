unit Joystick;

interface

uses
  fp_sfml, Config, JoystickIdentification;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function sfJoystick_isConnected(joystick: dword): TsfBool; cdecl; external libsfml_window;
function sfJoystick_getButtonCount(joystick: dword): dword; cdecl; external libsfml_window;
function sfJoystick_hasAxis(joystick: dword; axis: TsfJoystickAxis): TsfBool; cdecl; external libsfml_window;
function sfJoystick_isButtonPressed(joystick: dword; button: dword): TsfBool; cdecl; external libsfml_window;
function sfJoystick_getAxisPosition(joystick: dword; axis: TsfJoystickAxis): single; cdecl; external libsfml_window;
function sfJoystick_getIdentification(joystick: dword): TsfJoystickIdentification; cdecl; external libsfml_window;
procedure sfJoystick_update; cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:19 ===


implementation



end.
