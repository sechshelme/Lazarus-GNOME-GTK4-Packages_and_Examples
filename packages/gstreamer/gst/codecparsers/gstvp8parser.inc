/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   14:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

  {#warning "The VP8 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
type
  PGstVp8ParserResult = ^TGstVp8ParserResult;
  TGstVp8ParserResult = longint;

const
  GST_VP8_PARSER_OK = 0;
  GST_VP8_PARSER_BROKEN_DATA = 1;
  GST_VP8_PARSER_ERROR = 2;

type
  TGstVp8QuantIndices = record
    y_ac_qi: Tguint8;
    y_dc_delta: Tgint8;
    y2_dc_delta: Tgint8;
    y2_ac_delta: Tgint8;
    uv_dc_delta: Tgint8;
    uv_ac_delta: Tgint8;
  end;
  PGstVp8QuantIndices = ^TGstVp8QuantIndices;

  TGstVp8Segmentation = record
    segmentation_enabled: Tguint8;
    update_mb_segmentation_map: Tguint8;
    update_segment_feature_data: Tguint8;
    segment_feature_mode: Tguint8;
    quantizer_update_value: array[0..3] of Tgint8;
    lf_update_value: array[0..3] of Tgint8;
    segment_prob: array[0..2] of Tguint8;
  end;
  PGstVp8Segmentation = ^TGstVp8Segmentation;

  TGstVp8MbLfAdjustments = record
    loop_filter_adj_enable: Tguint8;
    mode_ref_lf_delta_update: Tguint8;
    ref_frame_delta: array[0..3] of Tgint8;
    mb_mode_delta: array[0..3] of Tgint8;
  end;
  PGstVp8MbLfAdjustments = ^TGstVp8MbLfAdjustments;

  TGstVp8TokenProbs = record
    prob: array[0..3] of array[0..7] of array[0..2] of array[0..10] of Tguint8;
  end;
  PGstVp8TokenProbs = ^TGstVp8TokenProbs;

  TGstVp8MvProbs = record
    prob: array[0..1] of array[0..18] of Tguint8;
  end;
  PGstVp8MvProbs = ^TGstVp8MvProbs;

  TGstVp8ModeProbs = record
    y_prob: array[0..3] of Tguint8;
    uv_prob: array[0..2] of Tguint8;
  end;
  PGstVp8ModeProbs = ^TGstVp8ModeProbs;

  TGstVp8FrameHdr = record
    key_frame: Tguint8;
    version: Tguint8;
    show_frame: Tguint8;
    data_chunk_size: Tguint8;
    first_part_size: Tguint32;
    Width: Tguint16;
    Height: Tguint16;
    horiz_scale_code: Tguint8;
    vert_scale_code: Tguint8;
    color_space: Tguint8;
    clamping_type: Tguint8;
    filter_type: Tguint8;
    loop_filter_level: Tguint8;
    sharpness_level: Tguint8;
    log2_nbr_of_dct_partitions: Tguint8;
    partition_size: array[0..7] of Tguint;
    quant_indices: TGstVp8QuantIndices;
    token_probs: TGstVp8TokenProbs;
    mv_probs: TGstVp8MvProbs;
    mode_probs: TGstVp8ModeProbs;
    refresh_entropy_probs: Tguint8;
    refresh_last: Tguint8;
    refresh_golden_frame: Tguint8;
    refresh_alternate_frame: Tguint8;
    copy_buffer_to_golden: Tguint8;
    copy_buffer_to_alternate: Tguint8;
    sign_bias_golden: Tguint8;
    sign_bias_alternate: Tguint8;
    mb_no_skip_coeff: Tguint8;
    prob_skip_false: Tguint8;
    prob_intra: Tguint8;
    prob_last: Tguint8;
    prob_gf: Tguint8;
    rd_range: Tguint8;
    rd_value: Tguint8;
    rd_count: Tguint8;
    header_size: Tguint;
  end;
  PGstVp8FrameHdr = ^TGstVp8FrameHdr;

  TGstVp8Parser = record
    segmentation: TGstVp8Segmentation;
    mb_lf_adjust: TGstVp8MbLfAdjustments;
    token_probs: TGstVp8TokenProbs;
    mv_probs: TGstVp8MvProbs;
    mode_probs: TGstVp8ModeProbs;
  end;
  PGstVp8Parser = ^TGstVp8Parser;

procedure gst_vp8_parser_init(parser: PGstVp8Parser); cdecl; external libgstcodecparsers;
function gst_vp8_parser_parse_frame_header(parser: PGstVp8Parser; frame_hdr: PGstVp8FrameHdr; Data: Pguint8; size: Tgsize): TGstVp8ParserResult; cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:30:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
