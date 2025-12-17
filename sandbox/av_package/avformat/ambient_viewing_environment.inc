{$IFDEF read_interface}


type
  TAVAmbientViewingEnvironment = record
    ambient_illuminance: TAVRational;
    ambient_light_x: TAVRational;
    ambient_light_y: TAVRational;
  end;
  PAVAmbientViewingEnvironment = ^TAVAmbientViewingEnvironment;

function av_ambient_viewing_environment_alloc(size: Psize_t): PAVAmbientViewingEnvironment; cdecl; external libavutil;
function av_ambient_viewing_environment_create_side_data(frame: PAVFrame): PAVAmbientViewingEnvironment; cdecl; external libavutil;

// === Konventiert am: 14-12-25 16:00:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
