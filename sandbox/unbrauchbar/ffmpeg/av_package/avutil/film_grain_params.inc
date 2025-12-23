{$IFDEF read_interface}


type
  TAVFilmGrainParamsType = longint;

const
  AV_FILM_GRAIN_PARAMS_NONE = 0;
  AV_FILM_GRAIN_PARAMS_AV1 = 1;
  AV_FILM_GRAIN_PARAMS_H274 = 2;

type
  TAVFilmGrainAOMParams = record
    num_y_points: longint;
    y_points: array[0..13] of array[0..1] of Tuint8_t;
    chroma_scaling_from_luma: longint;
    num_uv_points: array[0..1] of longint;
    uv_points: array[0..1] of array[0..9] of array[0..1] of Tuint8_t;
    scaling_shift: longint;
    ar_coeff_lag: longint;
    ar_coeffs_y: array[0..23] of Tint8_t;
    ar_coeffs_uv: array[0..1] of array[0..24] of Tint8_t;
    ar_coeff_shift: longint;
    grain_scale_shift: longint;
    uv_mult: array[0..1] of longint;
    uv_mult_luma: array[0..1] of longint;
    uv_offset: array[0..1] of longint;
    overlap_flag: longint;
    limit_output_range: longint;
  end;
  PAVFilmGrainAOMParams = ^TAVFilmGrainAOMParams;

  TAVFilmGrainH274Params = record
    model_id: longint;
    bit_depth_luma: longint;
    bit_depth_chroma: longint;
    color_range: TAVColorRange;
    color_primaries: TAVColorPrimaries;
    color_trc: TAVColorTransferCharacteristic;
    color_space: TAVColorSpace;
    blending_mode_id: longint;
    log2_scale_factor: longint;
    component_model_present: array[0..2] of longint;
    num_intensity_intervals: array[0..2] of Tuint16_t;
    num_model_values: array[0..2] of Tuint8_t;
    intensity_interval_lower_bound: array[0..2] of array[0..255] of Tuint8_t;
    intensity_interval_upper_bound: array[0..2] of array[0..255] of Tuint8_t;
    comp_model_value: array[0..2] of array[0..255] of array[0..5] of Tint16_t;
  end;
  PAVFilmGrainH274Params = ^TAVFilmGrainH274Params;

  TAVFilmGrainParams = record
    _type: TAVFilmGrainParamsType;
    seed: Tuint64_t;
    codec: record
      case longint of
        0: (aom: TAVFilmGrainAOMParams);
        1: (h274: TAVFilmGrainH274Params);
      end;
  end;
  PAVFilmGrainParams = ^TAVFilmGrainParams;

function av_film_grain_params_alloc(size: Psize_t): PAVFilmGrainParams; cdecl; external libavutil;
function av_film_grain_params_create_side_data(frame: PAVFrame): PAVFilmGrainParams; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
