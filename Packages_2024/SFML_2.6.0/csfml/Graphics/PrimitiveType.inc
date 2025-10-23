{$IFDEF read_interface}


type
  PsfPrimitiveType = ^TsfPrimitiveType;
  TsfPrimitiveType = longint;

const
  sfPoints = 0;
  sfLines = 1;
  sfLineStrip = 2;
  sfTriangles = 3;
  sfTriangleStrip = 4;
  sfTriangleFan = 5;
  sfQuads = 6;
  sfLinesStrip = sfLineStrip;
  sfTrianglesStrip = sfTriangleStrip;
  sfTrianglesFan = sfTriangleFan;

  // === Konventiert am: 24-9-25 16:55:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
