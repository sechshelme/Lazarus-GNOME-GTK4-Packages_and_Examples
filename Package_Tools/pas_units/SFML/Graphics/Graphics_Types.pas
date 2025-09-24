unit Graphics_Types;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfCircleShape = type Pointer;
  PsfConvexShape = type Pointer;
  PsfFont = type Pointer;
  PsfImage = type Pointer;
  PsfShader = type Pointer;
  PsfRectangleShape = type Pointer;
  PsfRenderTexture = type Pointer;
  PsfRenderWindow = type Pointer;
  PsfShape = type Pointer;
  PsfSprite = type Pointer;
  PsfText = type Pointer;
  PsfTexture = type Pointer;
  PsfTransformable = type Pointer;
  PsfVertexArray = type Pointer;
  PsfVertexBuffer = type Pointer;
  PsfView = type Pointer;


  // === Konventiert am: 24-9-25 16:55:30 ===


implementation



end.
