unit fourier;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PComplexOperator = ^TComplexOperator;
  TComplexOperator = longint;

const
  UndefinedComplexOperator = 0;
  AddComplexOperator = 1;
  ConjugateComplexOperator = 2;
  DivideComplexOperator = 3;
  MagnitudePhaseComplexOperator = 4;
  MultiplyComplexOperator = 5;
  RealImaginaryComplexOperator = 6;
  SubtractComplexOperator = 7;

function ComplexImages(para1: PImage; para2: TComplexOperator; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ForwardFourierTransformImage(para1: PImage; para2: TMagickBooleanType; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function InverseFourierTransformImage(para1: PImage; para2: PImage; para3: TMagickBooleanType; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:17:24 ===


implementation



end.
