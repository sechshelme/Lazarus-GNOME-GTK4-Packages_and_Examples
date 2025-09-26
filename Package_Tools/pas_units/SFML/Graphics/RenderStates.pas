unit RenderStates;

interface

uses
  fp_sfml, Texture, Transform, BlendMode, Graphics_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfRenderStates = record
    blendMode: TsfBlendMode;
    transform: TsfTransform;
    texture: PsfTexture;
    shader: PsfShader;
  end;
  PsfRenderStates = ^TsfRenderStates;

function sfRenderStates_default: TsfRenderStates; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:55:14 ===


implementation



end.
