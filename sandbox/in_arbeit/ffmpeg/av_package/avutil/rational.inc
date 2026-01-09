{$IFDEF read_interface}


type
  TAVRational = record
    num: longint;
    den: longint;
  end;
  PAVRational = ^TAVRational;

function av_reduce(dst_num: Plongint; dst_den: Plongint; num: Tint64_t; den: Tint64_t; max: Tint64_t): longint; cdecl; external libavutil;
function av_mul_q(b: TAVRational; c: TAVRational): TAVRational; cdecl; external libavutil;
function av_div_q(b: TAVRational; c: TAVRational): TAVRational; cdecl; external libavutil;
function av_add_q(b: TAVRational; c: TAVRational): TAVRational; cdecl; external libavutil;
function av_sub_q(b: TAVRational; c: TAVRational): TAVRational; cdecl; external libavutil;
function av_d2q(d: double; max: longint): TAVRational; cdecl; external libavutil;
function av_nearer_q(q: TAVRational; q1: TAVRational; q2: TAVRational): longint; cdecl; external libavutil;
function av_find_nearest_q_idx(q: TAVRational; q_list: PAVRational): longint; cdecl; external libavutil;
function av_q2intfloat(q: TAVRational): Tuint32_t; cdecl; external libavutil;
function av_gcd_q(a: TAVRational; b: TAVRational; max_den: longint; def: TAVRational): TAVRational; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
