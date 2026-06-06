{$IFDEF read_interface}


const
  VULKAN_VIDEO_CODEC_H265STD_ENCODE_H_ = 1;
  VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0 = $00400000;
  VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0;
  VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h265_encode';

type
  TStdVideoEncodeH265WeightTableFlags = record
    luma_weight_l0_flag: Tuint16_t;
    chroma_weight_l0_flag: Tuint16_t;
    luma_weight_l1_flag: Tuint16_t;
    chroma_weight_l1_flag: Tuint16_t;
  end;
  PStdVideoEncodeH265WeightTableFlags = ^TStdVideoEncodeH265WeightTableFlags;

  TStdVideoEncodeH265WeightTable = record
    flags: TStdVideoEncodeH265WeightTableFlags;
    luma_log2_weight_denom: Tuint8_t;
    delta_chroma_log2_weight_denom: Tint8_t;
    delta_luma_weight_l0: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    luma_offset_l0: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    delta_chroma_weight_l0: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H265_MAX_CHROMA_PLANES) - 1] of Tint8_t;
    delta_chroma_offset_l0: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H265_MAX_CHROMA_PLANES) - 1] of Tint8_t;
    delta_luma_weight_l1: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    luma_offset_l1: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    delta_chroma_weight_l1: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H265_MAX_CHROMA_PLANES) - 1] of Tint8_t;
    delta_chroma_offset_l1: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H265_MAX_CHROMA_PLANES) - 1] of Tint8_t;
  end;
  PStdVideoEncodeH265WeightTable = ^TStdVideoEncodeH265WeightTable;

type
  TStdVideoEncodeH265SliceSegmentHeaderFlags = bitpacked record
    first_slice_segment_in_pic_flag: 0..1;
    dependent_slice_segment_flag: 0..1;
    slice_sao_luma_flag: 0..1;
    slice_sao_chroma_flag: 0..1;
    num_ref_idx_active_override_flag: 0..1;
    mvd_l1_zero_flag: 0..1;
    cabac_init_flag: 0..1;
    cu_chroma_qp_offset_enabled_flag: 0..1;
    deblocking_filter_override_flag: 0..1;
    slice_deblocking_filter_disabled_flag: 0..1;
    collocated_from_l0_flag: 0..1;
    slice_loop_filter_across_slices_enabled_flag: 0..1;
    reserved: 0..$FFFFF;
  end;
  PStdVideoEncodeH265SliceSegmentHeaderFlags = ^TStdVideoEncodeH265SliceSegmentHeaderFlags;

type
  TStdVideoEncodeH265SliceSegmentHeader = record
    flags: TStdVideoEncodeH265SliceSegmentHeaderFlags;
    slice_type: TStdVideoH265SliceType;
    slice_segment_address: Tuint32_t;
    collocated_ref_idx: Tuint8_t;
    MaxNumMergeCand: Tuint8_t;
    slice_cb_qp_offset: Tint8_t;
    slice_cr_qp_offset: Tint8_t;
    slice_beta_offset_div2: Tint8_t;
    slice_tc_offset_div2: Tint8_t;
    slice_act_y_qp_offset: Tint8_t;
    slice_act_cb_qp_offset: Tint8_t;
    slice_act_cr_qp_offset: Tint8_t;
    slice_qp_delta: Tint8_t;
    reserved1: Tuint16_t;
    pWeightTable: PStdVideoEncodeH265WeightTable;
  end;
  PStdVideoEncodeH265SliceSegmentHeader = ^TStdVideoEncodeH265SliceSegmentHeader;

type
  TStdVideoEncodeH265ReferenceListsInfoFlags = bitpacked record
    ref_pic_list_modification_flag_l0: 0..1;
    ref_pic_list_modification_flag_l1: 0..1;
    reserved: 0..$3FFFFFFF;
  end;
  PStdVideoEncodeH265ReferenceListsInfoFlags = ^TStdVideoEncodeH265ReferenceListsInfoFlags;

type
  TStdVideoEncodeH265ReferenceListsInfo = record
    flags: TStdVideoEncodeH265ReferenceListsInfoFlags;
    num_ref_idx_l0_active_minus1: Tuint8_t;
    num_ref_idx_l1_active_minus1: Tuint8_t;
    RefPicList0: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tuint8_t;
    RefPicList1: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tuint8_t;
    list_entry_l0: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tuint8_t;
    list_entry_l1: array[0..(STD_VIDEO_H265_MAX_NUM_LIST_REF) - 1] of Tuint8_t;
  end;
  PStdVideoEncodeH265ReferenceListsInfo = ^TStdVideoEncodeH265ReferenceListsInfo;

type
  TStdVideoEncodeH265PictureInfoFlags = bitpacked record
    is_reference: 0..1;
    IrapPicFlag: 0..1;
    used_for_long_term_reference: 0..1;
    discardable_flag: 0..1;
    cross_layer_bla_flag: 0..1;
    pic_output_flag: 0..1;
    no_output_of_prior_pics_flag: 0..1;
    short_term_ref_pic_set_sps_flag: 0..1;
    slice_temporal_mvp_enabled_flag: 0..1;
    reserved: 0..$7FFFFF;
  end;
  PStdVideoEncodeH265PictureInfoFlags = ^TStdVideoEncodeH265PictureInfoFlags;

type
  TStdVideoEncodeH265LongTermRefPics = record
    num_long_term_sps: Tuint8_t;
    num_long_term_pics: Tuint8_t;
    lt_idx_sps: array[0..(STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS) - 1] of Tuint8_t;
    poc_lsb_lt: array[0..(STD_VIDEO_H265_MAX_LONG_TERM_PICS) - 1] of Tuint8_t;
    used_by_curr_pic_lt_flag: Tuint16_t;
    delta_poc_msb_present_flag: array[0..(STD_VIDEO_H265_MAX_DELTA_POC) - 1] of Tuint8_t;
    delta_poc_msb_cycle_lt: array[0..(STD_VIDEO_H265_MAX_DELTA_POC) - 1] of Tuint8_t;
  end;
  PStdVideoEncodeH265LongTermRefPics = ^TStdVideoEncodeH265LongTermRefPics;

  TStdVideoEncodeH265PictureInfo = record
    flags: TStdVideoEncodeH265PictureInfoFlags;
    pic_type: TStdVideoH265PictureType;
    sps_video_parameter_set_id: Tuint8_t;
    pps_seq_parameter_set_id: Tuint8_t;
    pps_pic_parameter_set_id: Tuint8_t;
    short_term_ref_pic_set_idx: Tuint8_t;
    PicOrderCntVal: Tint32_t;
    TemporalId: Tuint8_t;
    reserved1: array[0..6] of Tuint8_t;
    pRefLists: PStdVideoEncodeH265ReferenceListsInfo;
    pShortTermRefPicSet: PStdVideoH265ShortTermRefPicSet;
    pLongTermRefPics: PStdVideoEncodeH265LongTermRefPics;
  end;
  PStdVideoEncodeH265PictureInfo = ^TStdVideoEncodeH265PictureInfo;

type
  TStdVideoEncodeH265ReferenceInfoFlags = bitpacked record
    used_for_long_term_reference: 0..1;
    unused_for_reference: 0..1;
    reserved: 0..$3FFFFFFF;
  end;
  PStdVideoEncodeH265ReferenceInfoFlags = ^TStdVideoEncodeH265ReferenceInfoFlags;

type
  TStdVideoEncodeH265ReferenceInfo = record
    flags: TStdVideoEncodeH265ReferenceInfoFlags;
    pic_type: TStdVideoH265PictureType;
    PicOrderCntVal: Tint32_t;
    TemporalId: Tuint8_t;
  end;
  PStdVideoEncodeH265ReferenceInfo = ^TStdVideoEncodeH265ReferenceInfo;

  // === Konventiert am: 6-6-26 19:13:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
