{$IFDEF read_interface}


type
  Papriltag_detection_info_t = ^Tapriltag_detection_info_t;
  Tapriltag_detection_info_t = record
    det: Papriltag_detection_t;
    tagsize: Tdouble;
    fx: Tdouble;
    fy: Tdouble;
    cx: Tdouble;
    cy: Tdouble;
  end;

  Papriltag_pose_t = ^Tapriltag_pose_t;
  Tapriltag_pose_t = record
    R: Pmatd_t;
    t: Pmatd_t;
  end;

procedure estimate_pose_for_tag_homography(info: Papriltag_detection_info_t; pose: Papriltag_pose_t); cdecl; external libapriltag;
procedure estimate_tag_pose_orthogonal_iteration(info: Papriltag_detection_info_t; err1: Pdouble; pose1: Papriltag_pose_t; err2: Pdouble; pose2: Papriltag_pose_t;
  nIters: longint); cdecl; external libapriltag;
function estimate_tag_pose(info: Papriltag_detection_info_t; pose: Papriltag_pose_t): Tdouble; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:04:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
