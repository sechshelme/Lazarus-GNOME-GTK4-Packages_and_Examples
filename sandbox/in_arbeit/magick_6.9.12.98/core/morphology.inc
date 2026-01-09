{$IFDEF read_interface}



function AcquireKernelInfo(para1: pchar): PKernelInfo; cdecl; external libmagickcore;
function AcquireKernelBuiltIn(para1: TKernelInfoType; para2: PGeometryInfo): PKernelInfo; cdecl; external libmagickcore;
function CloneKernelInfo(para1: PKernelInfo): PKernelInfo; cdecl; external libmagickcore;
function DestroyKernelInfo(para1: PKernelInfo): PKernelInfo; cdecl; external libmagickcore;
function MorphologyImage(para1: PImage; para2: TMorphologyMethod; para3: Tssize_t; para4: PKernelInfo; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MorphologyImageChannel(para1: PImage; para2: TChannelType; para3: TMorphologyMethod; para4: Tssize_t; para5: PKernelInfo;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
procedure ScaleGeometryKernelInfo(para1: PKernelInfo; para2: pchar); cdecl; external libmagickcore;
procedure ScaleKernelInfo(para1: PKernelInfo; para2: double; para3: TGeometryFlags); cdecl; external libmagickcore;
procedure ShowKernelInfo(para1: PKernelInfo); cdecl; external libmagickcore;
procedure UnityAddKernelInfo(para1: PKernelInfo; para2: double); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
