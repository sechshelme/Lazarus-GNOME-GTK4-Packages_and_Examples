unit Vertex;

interface

uses
  fp_sfml, Vector2, Color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfVertex = record
    position: TsfVector2f;
    color: TsfColor;
    texCoords: TsfVector2f;
  end;
  PsfVertex = ^TsfVertex;

  // === Konventiert am: 24-9-25 16:54:48 ===


implementation



end.
