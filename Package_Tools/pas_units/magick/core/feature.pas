unit feature;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TChannelFeatures = record
    angular_second_moment: array[0..3] of double;
    contrast: array[0..3] of double;
    correlation: array[0..3] of double;
    variance_sum_of_squares: array[0..3] of double;
    inverse_difference_moment: array[0..3] of double;
    sum_average: array[0..3] of double;
    sum_variance: array[0..3] of double;
    sum_entropy: array[0..3] of double;
    entropy: array[0..3] of double;
    difference_variance: array[0..3] of double;
    difference_entropy: array[0..3] of double;
    measure_of_correlation_1: array[0..3] of double;
    measure_of_correlation_2: array[0..3] of double;
    maximum_correlation_coefficient: array[0..3] of double;
  end;
  PChannelFeatures = ^TChannelFeatures;

function GetImageChannelFeatures(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PChannelFeatures; cdecl; external libmagickcore;
function CannyEdgeImage(para1: PImage; para2: double; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function HoughLineImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: Tsize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MeanShiftImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:20 ===


implementation



end.
