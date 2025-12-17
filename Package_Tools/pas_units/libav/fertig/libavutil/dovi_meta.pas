unit dovi_meta;

interface

uses
  fp_ffmpeg, rational;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVDOVIDecoderConfigurationRecord = record
    dv_version_major: Tuint8_t;
    dv_version_minor: Tuint8_t;
    dv_profile: Tuint8_t;
    dv_level: Tuint8_t;
    rpu_present_flag: Tuint8_t;
    el_present_flag: Tuint8_t;
    bl_present_flag: Tuint8_t;
    dv_bl_signal_compatibility_id: Tuint8_t;
  end;
  PAVDOVIDecoderConfigurationRecord = ^TAVDOVIDecoderConfigurationRecord;

function av_dovi_alloc(size: Psize_t): PAVDOVIDecoderConfigurationRecord; cdecl; external libavutil;

type
  TAVDOVIRpuDataHeader = record
    rpu_type: Tuint8_t;
    rpu_format: Tuint16_t;
    vdr_rpu_profile: Tuint8_t;
    vdr_rpu_level: Tuint8_t;
    chroma_resampling_explicit_filter_flag: Tuint8_t;
    coef_data_type: Tuint8_t;
    coef_log2_denom: Tuint8_t;
    vdr_rpu_normalized_idc: Tuint8_t;
    bl_video_full_range_flag: Tuint8_t;
    bl_bit_depth: Tuint8_t;
    el_bit_depth: Tuint8_t;
    vdr_bit_depth: Tuint8_t;
    spatial_resampling_filter_flag: Tuint8_t;
    el_spatial_resampling_filter_flag: Tuint8_t;
    disable_residual_flag: Tuint8_t;
  end;
  PAVDOVIRpuDataHeader = ^TAVDOVIRpuDataHeader;

type
  TAVDOVIMappingMethod = longint;

const
  AV_DOVI_MAPPING_POLYNOMIAL = 0;
  AV_DOVI_MAPPING_MMR = 1;

const
  AV_DOVI_MAX_PIECES = 8;

type
  PAVDOVIReshapingCurve = ^TAVDOVIReshapingCurve;

  TAVDOVIReshapingCurve = record
    num_pivots: Tuint8_t;
    pivots: array[0..(AV_DOVI_MAX_PIECES + 1) - 1] of Tuint16_t;
    mapping_idc: array[0..(AV_DOVI_MAX_PIECES) - 1] of TAVDOVIMappingMethod;
    poly_order: array[0..(AV_DOVI_MAX_PIECES) - 1] of Tuint8_t;
    poly_coef: array[0..(AV_DOVI_MAX_PIECES) - 1] of array[0..2] of Tint64_t;
    mmr_order: array[0..(AV_DOVI_MAX_PIECES) - 1] of Tuint8_t;
    mmr_constant: array[0..(AV_DOVI_MAX_PIECES) - 1] of Tint64_t;
    mmr_coef: array[0..(AV_DOVI_MAX_PIECES) - 1] of array[0..2] of array[0..6] of Tint64_t;
  end;

type
  TAVDOVINLQMethod = longint;

const
  AV_DOVI_NLQ_NONE = -(1);
  AV_DOVI_NLQ_LINEAR_DZ = 0;

type
  TAVDOVINLQParams = record
    nlq_offset: Tuint16_t;
    vdr_in_max: Tuint64_t;
    linear_deadzone_slope: Tuint64_t;
    linear_deadzone_threshold: Tuint64_t;
  end;
  PAVDOVINLQParams = ^TAVDOVINLQParams;

  TAVDOVIDataMapping = record
    vdr_rpu_id: Tuint8_t;
    mapping_color_space: Tuint8_t;
    mapping_chroma_format_idc: Tuint8_t;
    curves: array[0..2] of TAVDOVIReshapingCurve;
    nlq_method_idc: TAVDOVINLQMethod;
    num_x_partitions: Tuint32_t;
    num_y_partitions: Tuint32_t;
    nlq: array[0..2] of TAVDOVINLQParams;
  end;
  PAVDOVIDataMapping = ^TAVDOVIDataMapping;

  TAVDOVIColorMetadata = record
    dm_metadata_id: Tuint8_t;
    scene_refresh_flag: Tuint8_t;
    ycc_to_rgb_matrix: array[0..8] of TAVRational;
    ycc_to_rgb_offset: array[0..2] of TAVRational;
    rgb_to_lms_matrix: array[0..8] of TAVRational;
    signal_eotf: Tuint16_t;
    signal_eotf_param0: Tuint16_t;
    signal_eotf_param1: Tuint16_t;
    signal_eotf_param2: Tuint32_t;
    signal_bit_depth: Tuint8_t;
    signal_color_space: Tuint8_t;
    signal_chroma_format: Tuint8_t;
    signal_full_range_flag: Tuint8_t;
    source_min_pq: Tuint16_t;
    source_max_pq: Tuint16_t;
    source_diagonal: Tuint16_t;
  end;
  PAVDOVIColorMetadata = ^TAVDOVIColorMetadata;

  TAVDOVIMetadata = record
    header_offset: Tsize_t;
    mapping_offset: Tsize_t;
    color_offset: Tsize_t;
  end;
  PAVDOVIMetadata = ^TAVDOVIMetadata;

function av_dovi_metadata_alloc(size: Psize_t): PAVDOVIMetadata; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:35 ===


implementation



end.
