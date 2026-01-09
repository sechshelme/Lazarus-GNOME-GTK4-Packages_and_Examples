{$IFDEF read_interface}




function GetImageChannelStatistics(para1: PImage; para2: PExceptionInfo): PChannelStatistics; cdecl; external libmagickcore;
function GetImageChannelMoments(para1: PImage; para2: PExceptionInfo): PChannelMoments; cdecl; external libmagickcore;
function GetImageChannelPerceptualHash(para1: PImage; para2: PExceptionInfo): PChannelPerceptualHash; cdecl; external libmagickcore;
function EvaluateImages(para1: PImage; para2: TMagickEvaluateOperator; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolynomialImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolynomialImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StatisticImage(para1: PImage; para2: TStatisticType; para3: Tsize_t; para4: Tsize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StatisticImageChannel(para1: PImage; para2: TChannelType; para3: TStatisticType; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EvaluateImage(para1: PImage; para2: TMagickEvaluateOperator; para3: double; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function EvaluateImageChannel(para1: PImage; para2: TChannelType; para3: TMagickEvaluateOperator; para4: double; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FunctionImage(para1: PImage; para2: TMagickFunction; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FunctionImageChannel(para1: PImage; para2: TChannelType; para3: TMagickFunction; para4: Tsize_t; para5: Pdouble;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelEntropy(para1: PImage; para2: TChannelType; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelExtrema(para1: PImage; para2: TChannelType; para3: Psize_t; para4: Psize_t; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelMean(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelKurtosis(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelRange(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageEntropy(para1: PImage; para2: Pdouble; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageExtrema(para1: PImage; para2: Psize_t; para3: Psize_t; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageMean(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageKurtosis(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageRange(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
