{$IFDEF read_interface}


type
  TAVVideoRect = record
    x: Tuint32_t;
    y: Tuint32_t;
    width: Tuint32_t;
    height: Tuint32_t;
  end;
  PAVVideoRect = ^TAVVideoRect;

type
  PAVVideoHintType = ^TAVVideoHintType;
  TAVVideoHintType = longint;

const
  AV_VIDEO_HINT_TYPE_CONSTANT = 0;
  AV_VIDEO_HINT_TYPE_CHANGED = 1;

type
  TAVVideoHint = record
    nb_rects: Tsize_t;
    rect_offset: Tsize_t;
    rect_size: Tsize_t;
    _type: TAVVideoHintType;
  end;
  PAVVideoHint = ^TAVVideoHint;

function av_video_hint_alloc(nb_rects: Tsize_t; out_size: Psize_t): PAVVideoHint; cdecl; external libavutil;
function av_video_hint_create_side_data(frame: PAVFrame; nb_rects: Tsize_t): PAVVideoHint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:41:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
