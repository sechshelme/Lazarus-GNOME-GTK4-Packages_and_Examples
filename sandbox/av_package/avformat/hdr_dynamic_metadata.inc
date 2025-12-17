{$IFDEF read_interface}


type
  TAVHDRPlusOverlapProcessOption = longint;

const
  AV_HDR_PLUS_OVERLAP_PROCESS_WEIGHTED_AVERAGING = 0;
  AV_HDR_PLUS_OVERLAP_PROCESS_LAYERING = 1;

type
  TAVHDRPlusPercentile = record
    percentage: Tuint8_t;
    percentile: TAVRational;
  end;
  PAVHDRPlusPercentile = ^TAVHDRPlusPercentile;

  TAVHDRPlusColorTransformParams = record
    window_upper_left_corner_x: TAVRational;
    window_upper_left_corner_y: TAVRational;
    window_lower_right_corner_x: TAVRational;
    window_lower_right_corner_y: TAVRational;
    center_of_ellipse_x: Tuint16_t;
    center_of_ellipse_y: Tuint16_t;
    rotation_angle: Tuint8_t;
    semimajor_axis_internal_ellipse: Tuint16_t;
    semimajor_axis_external_ellipse: Tuint16_t;
    semiminor_axis_external_ellipse: Tuint16_t;
    overlap_process_option: TAVHDRPlusOverlapProcessOption;
    maxscl: array[0..2] of TAVRational;
    average_maxrgb: TAVRational;
    num_distribution_maxrgb_percentiles: Tuint8_t;
    distribution_maxrgb: array[0..14] of TAVHDRPlusPercentile;
    fraction_bright_pixels: TAVRational;
    tone_mapping_flag: Tuint8_t;
    knee_point_x: TAVRational;
    knee_point_y: TAVRational;
    num_bezier_curve_anchors: Tuint8_t;
    bezier_curve_anchors: array[0..14] of TAVRational;
    color_saturation_mapping_flag: Tuint8_t;
    color_saturation_weight: TAVRational;
  end;
  PAVHDRPlusColorTransformParams = ^TAVHDRPlusColorTransformParams;

  TAVDynamicHDRPlus = record
    itu_t_t35_country_code: Tuint8_t;
    application_version: Tuint8_t;
    num_windows: Tuint8_t;
    params: array[0..2] of TAVHDRPlusColorTransformParams;
    targeted_system_display_maximum_luminance: TAVRational;
    targeted_system_display_actual_peak_luminance_flag: Tuint8_t;
    num_rows_targeted_system_display_actual_peak_luminance: Tuint8_t;
    num_cols_targeted_system_display_actual_peak_luminance: Tuint8_t;
    targeted_system_display_actual_peak_luminance: array[0..24] of array[0..24] of TAVRational;
    mastering_display_actual_peak_luminance_flag: Tuint8_t;
    num_rows_mastering_display_actual_peak_luminance: Tuint8_t;
    num_cols_mastering_display_actual_peak_luminance: Tuint8_t;
    mastering_display_actual_peak_luminance: array[0..24] of array[0..24] of TAVRational;
  end;
  PAVDynamicHDRPlus = ^TAVDynamicHDRPlus;

function av_dynamic_hdr_plus_alloc(size: Psize_t): PAVDynamicHDRPlus; cdecl; external libavutil;
function av_dynamic_hdr_plus_create_side_data(frame: PAVFrame): PAVDynamicHDRPlus; cdecl; external libavutil;
function av_dynamic_hdr_plus_from_t35(s: PAVDynamicHDRPlus; data: Puint8_t; size: Tsize_t): longint; cdecl; external libavutil;

const
  AV_HDR_PLUS_MAX_PAYLOAD_SIZE = 907;

function av_dynamic_hdr_plus_to_t35(s: PAVDynamicHDRPlus; data: PPuint8_t; size: Psize_t): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
