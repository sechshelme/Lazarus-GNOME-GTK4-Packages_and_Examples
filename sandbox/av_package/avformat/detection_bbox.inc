{$IFDEF read_interface}


  const
    AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE = 64;
    AV_NUM_DETECTION_BBOX_CLASSIFY = 4;

type
  TAVDetectionBBox = record
    x: longint;
    y: longint;
    w: longint;
    h: longint;
    detect_label: array[0..(AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE) - 1] of char;
    detect_confidence: TAVRational;
    classify_count: Tuint32_t;
    classify_labels: array[0..(AV_NUM_DETECTION_BBOX_CLASSIFY) - 1] of array[0..(AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE) - 1] of char;
    classify_confidences: array[0..(AV_NUM_DETECTION_BBOX_CLASSIFY) - 1] of TAVRational;
  end;
  PAVDetectionBBox = ^TAVDetectionBBox;

type
  TAVDetectionBBoxHeader = record
    source: array[0..255] of char;
    nb_bboxes: Tuint32_t;
    bboxes_offset: Tsize_t;
    bbox_size: Tsize_t;
  end;
  PAVDetectionBBoxHeader = ^TAVDetectionBBoxHeader;

function av_detection_bbox_alloc(nb_bboxes: Tuint32_t; out_size: Psize_t): PAVDetectionBBoxHeader; cdecl; external libavutil;
function av_detection_bbox_create_side_data(frame: PAVFrame; nb_bboxes: Tuint32_t): PAVDetectionBBoxHeader; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
