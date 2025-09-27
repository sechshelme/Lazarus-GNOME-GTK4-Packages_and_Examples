{$IFDEF read_interface}


type
  PsfMouseButton = ^TsfMouseButton;
  TsfMouseButton = longint;

const
  sfMouseLeft = 0;
  sfMouseRight = 1;
  sfMouseMiddle = 2;
  sfMouseXButton1 = 3;
  sfMouseXButton2 = 4;
  sfMouseButtonCount = 5;

type
  PsfMouseWheel = ^TsfMouseWheel;
  TsfMouseWheel = longint;

const
  sfMouseVerticalWheel = 0;
  sfMouseHorizontalWheel = 1;

function sfMouse_isButtonPressed(button: TsfMouseButton): TsfBool; cdecl; external libcsfml_window;
function sfMouse_getPosition(relativeTo: PsfWindow): TsfVector2i; cdecl; external libcsfml_window;
procedure sfMouse_setPosition(position: TsfVector2i; relativeTo: PsfWindow); cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
