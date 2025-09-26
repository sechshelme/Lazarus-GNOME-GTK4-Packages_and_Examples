unit BlendMode;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfBlendFactor = ^TsfBlendFactor;
  TsfBlendFactor = longint;

const
  sfBlendFactorZero = 0;
  sfBlendFactorOne = 1;
  sfBlendFactorSrcColor = 2;
  sfBlendFactorOneMinusSrcColor = 3;
  sfBlendFactorDstColor = 4;
  sfBlendFactorOneMinusDstColor = 5;
  sfBlendFactorSrcAlpha = 6;
  sfBlendFactorOneMinusSrcAlpha = 7;
  sfBlendFactorDstAlpha = 8;
  sfBlendFactorOneMinusDstAlpha = 9;

type
  PsfBlendEquation = ^TsfBlendEquation;
  TsfBlendEquation = longint;

const
  sfBlendEquationAdd = 0;
  sfBlendEquationSubtract = 1;
  sfBlendEquationReverseSubtract = 2;
  sfBlendEquationMin = 3;
  sfBlendEquationMax = 4;

type
  PsfBlendMode = ^TsfBlendMode;

  TsfBlendMode = record
    colorSrcFactor: TsfBlendFactor;
    colorDstFactor: TsfBlendFactor;
    colorEquation: TsfBlendEquation;
    alphaSrcFactor: TsfBlendFactor;
    alphaDstFactor: TsfBlendFactor;
    alphaEquation: TsfBlendEquation;
  end;

var
  sfBlendAlpha: TsfBlendMode; cvar;external libsfml_graphics;
  sfBlendAdd: TsfBlendMode; cvar;external libsfml_graphics;
  sfBlendMultiply: TsfBlendMode; cvar;external libsfml_graphics;
  sfBlendMin: TsfBlendMode; cvar;external libsfml_graphics;
  sfBlendMax: TsfBlendMode; cvar;external libsfml_graphics;
  sfBlendNone: TsfBlendMode; cvar;external libsfml_graphics;

  // === Konventiert am: 24-9-25 16:55:55 ===


implementation



end.
