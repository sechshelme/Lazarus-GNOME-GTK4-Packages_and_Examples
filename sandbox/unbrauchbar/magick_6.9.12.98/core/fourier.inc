{$IFDEF read_interface}


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

function ComplexImages(para1: PImage; para2: TComplexOperator; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ForwardFourierTransformImage(para1: PImage; para2: TMagickBooleanType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function InverseFourierTransformImage(para1: PImage; para2: PImage; para3: TMagickBooleanType; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
