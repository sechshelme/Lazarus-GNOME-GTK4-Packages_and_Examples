{$IFDEF read_interface}



function AdaptiveBlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AdaptiveBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AdaptiveSharpenImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AdaptiveSharpenImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ConvolveImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ConvolveImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DespeckleImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EdgeImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EmbossImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FilterImage(para1: PImage; para2: PKernelInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FilterImageChannel(para1: PImage; para2: TChannelType; para3: PKernelInfo; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GaussianBlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GaussianBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function KuwaharaImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function KuwaharaImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function LocalContrastImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MotionBlurImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MotionBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PreviewImage(para1: PImage; para2: TPreviewType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RotationalBlurImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RotationalBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SelectiveBlurImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SelectiveBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShadeImage(para1: PImage; para2: TMagickBooleanType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SharpenImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SharpenImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SpreadImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function UnsharpMaskImage(para1: PImage; para2: double; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function UnsharpMaskImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: double; para7: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
