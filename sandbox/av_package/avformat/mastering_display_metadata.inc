{$IFDEF read_interface}


type
  TAVMasteringDisplayMetadata = record
    display_primaries: array[0..2] of array[0..1] of TAVRational;
    white_point: array[0..1] of TAVRational;
    min_luminance: TAVRational;
    max_luminance: TAVRational;
    has_primaries: longint;
    has_luminance: longint;
  end;
  PAVMasteringDisplayMetadata = ^TAVMasteringDisplayMetadata;

function av_mastering_display_metadata_alloc: PAVMasteringDisplayMetadata; cdecl; external libavutil;
function av_mastering_display_metadata_create_side_data(frame: PAVFrame): PAVMasteringDisplayMetadata; cdecl; external libavutil;

type
  TAVContentLightMetadata = record
    MaxCLL: dword;
    MaxFALL: dword;
  end;
  PAVContentLightMetadata = ^TAVContentLightMetadata;

function av_content_light_metadata_alloc(size: Psize_t): PAVContentLightMetadata; cdecl; external libavutil;
function av_content_light_metadata_create_side_data(frame: PAVFrame): PAVContentLightMetadata; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
