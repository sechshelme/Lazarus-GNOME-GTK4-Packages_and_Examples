{$IFDEF read_interface}


type
  TAVDownmixType = longint;

const
  AV_DOWNMIX_TYPE_UNKNOWN = 0;
  AV_DOWNMIX_TYPE_LORO = 1;
  AV_DOWNMIX_TYPE_LTRT = 2;
  AV_DOWNMIX_TYPE_DPLII = 3;
  AV_DOWNMIX_TYPE_NB = 4;

type
  TAVDownmixInfo = record
    preferred_downmix_type: TAVDownmixType;
    center_mix_level: double;
    center_mix_level_ltrt: double;
    surround_mix_level: double;
    surround_mix_level_ltrt: double;
    lfe_mix_level: double;
  end;
  PAVDownmixInfo = ^TAVDownmixInfo;

function av_downmix_info_update_side_data(frame: PAVFrame): PAVDownmixInfo; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
