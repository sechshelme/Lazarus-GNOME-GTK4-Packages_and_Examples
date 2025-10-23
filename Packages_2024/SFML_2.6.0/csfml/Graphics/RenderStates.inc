{$IFDEF read_interface}


type
  TsfRenderStates = record
    blendMode: TsfBlendMode;
    transform: TsfTransform;
    texture: PsfTexture;
    shader: PsfShader;
  end;
  PsfRenderStates = ^TsfRenderStates;

function sfRenderStates_default: TsfRenderStates; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
