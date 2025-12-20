{$IFDEF read_interface}


type
  TAVCodecDescriptor = record
    id: TAVCodecID;
    _type: TAVMediaType;
    name: pchar;
    long_name: pchar;
    props: longint;
    mime_types: ^pchar;
    profiles: PAVProfile;
  end;
  PAVCodecDescriptor = ^TAVCodecDescriptor;

const
  AV_CODEC_PROP_INTRA_ONLY = 1 shl 0;
  AV_CODEC_PROP_LOSSY = 1 shl 1;
  AV_CODEC_PROP_LOSSLESS = 1 shl 2;
  AV_CODEC_PROP_REORDER = 1 shl 3;
  AV_CODEC_PROP_FIELDS = 1 shl 4;
  AV_CODEC_PROP_BITMAP_SUB = 1 shl 16;
  AV_CODEC_PROP_TEXT_SUB = 1 shl 17;

function avcodec_descriptor_get(id: TAVCodecID): PAVCodecDescriptor; cdecl; external libavcodec;
function avcodec_descriptor_next(prev: PAVCodecDescriptor): PAVCodecDescriptor; cdecl; external libavcodec;
function avcodec_descriptor_get_by_name(name: pchar): PAVCodecDescriptor; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:10:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
