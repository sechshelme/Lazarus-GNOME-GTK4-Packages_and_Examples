unit Glsl;

interface

uses
  fp_sfml, Config, Vector2, Vector3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfGlslVec2 = ^TsfGlslVec2;
  TsfGlslVec2 = TsfVector2f;

  PsfGlslIvec2 = ^TsfGlslIvec2;
  TsfGlslIvec2 = TsfVector2i;

  TsfGlslBvec2 = record
    x: TsfBool;
    y: TsfBool;
  end;
  PsfGlslBvec2 = ^TsfGlslBvec2;

  PsfGlslVec3 = ^TsfGlslVec3;
  TsfGlslVec3 = TsfVector3f;

  TsfGlslIvec3 = record
    x: longint;
    y: longint;
    z: longint;
  end;
  PsfGlslIvec3 = ^TsfGlslIvec3;

  TsfGlslBvec3 = record
    x: TsfBool;
    y: TsfBool;
    z: TsfBool;
  end;
  PsfGlslBvec3 = ^TsfGlslBvec3;

  TsfGlslVec4 = record
    x: single;
    y: single;
    z: single;
    w: single;
  end;
  PsfGlslVec4 = ^TsfGlslVec4;

  TsfGlslIvec4 = record
    x: longint;
    y: longint;
    z: longint;
    w: longint;
  end;
  PsfGlslIvec4 = ^TsfGlslIvec4;

  TsfGlslBvec4 = record
    x: TsfBool;
    y: TsfBool;
    z: TsfBool;
    w: TsfBool;
  end;
  PsfGlslBvec4 = ^TsfGlslBvec4;

  TsfGlslMat3 = record
    arr: array[0..(3 * 3) - 1] of single;
  end;
  PsfGlslMat3 = ^TsfGlslMat3;

  TsfGlslMat4 = record
    arr: array[0..(4 * 4) - 1] of single;
  end;
  PsfGlslMat4 = ^TsfGlslMat4;

  // === Konventiert am: 24-9-25 16:55:34 ===


implementation



end.
