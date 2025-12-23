{$IFDEF read_interface}


type
  PAVVorbisParseContext = type Pointer;
  PPAVVorbisParseContext = type Pointer;

function av_vorbis_parse_init(extradata: Puint8_t; extradata_size: longint): PAVVorbisParseContext; cdecl; external libavcodec;
procedure av_vorbis_parse_free(s: PPAVVorbisParseContext); cdecl; external libavcodec;

const
  VORBIS_FLAG_HEADER = $00000001;
  VORBIS_FLAG_COMMENT = $00000002;
  VORBIS_FLAG_SETUP = $00000004;

function av_vorbis_parse_frame_flags(s: PAVVorbisParseContext; buf: Puint8_t; buf_size: longint; flags: Plongint): longint; cdecl; external libavcodec;
function av_vorbis_parse_frame(s: PAVVorbisParseContext; buf: Puint8_t; buf_size: longint): longint; cdecl; external libavcodec;
procedure av_vorbis_parse_reset(s: PAVVorbisParseContext); cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
