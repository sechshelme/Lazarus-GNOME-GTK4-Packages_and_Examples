{$IFDEF read_interface}



function CatchImageException(para1:PImage):TExceptionType;cdecl;external libmagickcore;
function GetImageInfoFile(para1:PImageInfo):PFILE;cdecl;external libmagickcore;
function AcquireImage(para1:PImageInfo):PImage;cdecl;external libmagickcore;
function AppendImages(para1:PImage; para2:TMagickBooleanType; para3:PExceptionInfo):PImage;cdecl;external libmagickcore;
function CloneImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:TMagickBooleanType; para5:PExceptionInfo):PImage;cdecl;external libmagickcore;
function DestroyImage(para1:PImage):PImage;cdecl;external libmagickcore;
function GetImageClipMask(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagickcore;
function GetImageMask(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagickcore;
function NewMagickImage(para1:PImageInfo; para2:Tsize_t; para3:Tsize_t; para4:PMagickPixelPacket):PImage;cdecl;external libmagickcore;
function ReferenceImage(para1:PImage):PImage;cdecl;external libmagickcore;
function SmushImages(para1:PImage; para2:TMagickBooleanType; para3:Tssize_t; para4:PExceptionInfo):PImage;cdecl;external libmagickcore;
function AcquireImageInfo:PImageInfo;cdecl;external libmagickcore;
function CloneImageInfo(para1:PImageInfo):PImageInfo;cdecl;external libmagickcore;
function DestroyImageInfo(para1:PImageInfo):PImageInfo;cdecl;external libmagickcore;
function ClipImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function ClipImagePath(para1:PImage; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagickcore;
function CopyImagePixels(para1:PImage; para2:PImage; para3:PRectangleInfo; para4:POffsetInfo; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function IsTaintImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function IsMagickConflict(para1:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function IsHighDynamicRangeImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function IsImageObject(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function ListMagickInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function ModifyImage(para1:PPImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function ResetImagePage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function ResetImagePixels(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageBackgroundColor(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageClipMask(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageColor(para1:PImage; para2:PMagickPixelPacket):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageExtent(para1:PImage; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageInfo(para1:PImageInfo; para2:dword; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageMask(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageOpacity(para1:PImage; para2:TQuantum):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageChannels(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageStorageClass(para1:PImage; para2:TClassType):TMagickBooleanType;cdecl;external libmagickcore;
function StripImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SyncImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SyncImageSettings(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SyncImagesSettings(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function InterpretImageFilename(para1:PImageInfo; para2:PImage; para3:Pchar; para4:longint; para5:Pchar):Tsize_t;cdecl;external libmagickcore;
function GetImageReferenceCount(para1:PImage):Tssize_t;cdecl;external libmagickcore;
function GetImageChannels(para1:PImage):Tsize_t;cdecl;external libmagickcore;
function GetImageVirtualPixelMethod(para1:PImage):TVirtualPixelMethod;cdecl;external libmagickcore;
function SetImageVirtualPixelMethod(para1:PImage; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external libmagickcore;
procedure AcquireNextImage(para1:PImageInfo; para2:PImage);cdecl;external libmagickcore;
procedure DestroyImagePixels(para1:PImage);cdecl;external libmagickcore;
procedure DisassociateImageStream(para1:PImage);cdecl;external libmagickcore;
procedure GetImageException(para1:PImage; para2:PExceptionInfo);cdecl;external libmagickcore;
procedure GetImageInfo(para1:PImageInfo);cdecl;external libmagickcore;
procedure SetImageInfoBlob(para1:PImageInfo; para2:pointer; para3:Tsize_t);cdecl;external libmagickcore;
procedure SetImageInfoFile(para1:PImageInfo; para2:PFILE);cdecl;external libmagickcore;

// === Konventiert am: 6-1-26 14:01:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
