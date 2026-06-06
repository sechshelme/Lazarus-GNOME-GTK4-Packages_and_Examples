unit vulkan_video_codec_h264std_encode;

interface

uses
  fp_vulkan, vulkan_video_codec_h264std;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0 = $00400000;
  VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0;
  VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h264_encode';

type
  TStdVideoEncodeH264WeightTableFlags = record
    luma_weight_l0_flag: Tuint32_t;
    chroma_weight_l0_flag: Tuint32_t;
    luma_weight_l1_flag: Tuint32_t;
    chroma_weight_l1_flag: Tuint32_t;
  end;
  PStdVideoEncodeH264WeightTableFlags = ^TStdVideoEncodeH264WeightTableFlags;

  TStdVideoEncodeH264WeightTable = record
    flags: TStdVideoEncodeH264WeightTableFlags;
    luma_log2_weight_denom: Tuint8_t;
    chroma_log2_weight_denom: Tuint8_t;
    luma_weight_l0: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    luma_offset_l0: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    chroma_weight_l0: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H264_MAX_CHROMA_PLANES) - 1] of Tint8_t;
    chroma_offset_l0: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H264_MAX_CHROMA_PLANES) - 1] of Tint8_t;
    luma_weight_l1: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    luma_offset_l1: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of Tint8_t;
    chroma_weight_l1: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H264_MAX_CHROMA_PLANES) - 1] of Tint8_t;
    chroma_offset_l1: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of array[0..(STD_VIDEO_H264_MAX_CHROMA_PLANES) - 1] of Tint8_t;
  end;
  PStdVideoEncodeH264WeightTable = ^TStdVideoEncodeH264WeightTable;

  TStdVideoEncodeH264SliceHeaderFlags = bitpacked record
    direct_spatial_mv_pred_flag: 0..1;
    num_ref_idx_active_override_flag: 0..1;
    reserved: 0..$3FFFFFFF
  end;
  PStdVideoEncodeH264SliceHeaderFlags = ^TStdVideoEncodeH264SliceHeaderFlags;

type
  TStdVideoEncodeH264PictureInfoFlags = bitpacked record
    IdrPicFlag: 0..1;
    is_reference: 0..1;
    no_output_of_prior_pics_flag: 0..1;
    long_term_reference_flag: 0..1;
    adaptive_ref_pic_marking_mode_flag: 0..1;
    reserved: 0..$7FFFFFF;
  end;
  PStdVideoEncodeH264PictureInfoFlags = ^TStdVideoEncodeH264PictureInfoFlags;

type
  TStdVideoEncodeH264ReferenceInfoFlags = bitpacked record
    used_for_long_term_reference: 0..1;
    reserved: 0..$7FFFFFFF;
  end;
  PStdVideoEncodeH264ReferenceInfoFlags = ^TStdVideoEncodeH264ReferenceInfoFlags;

type
  TStdVideoEncodeH264ReferenceListsInfoFlags = bitpacked record
    ref_pic_list_modification_flag_l0: 0..1;
    ref_pic_list_modification_flag_l1: 0..1;
    reserved: 0..$3FFFFFFF;
  end;
  PStdVideoEncodeH264ReferenceListsInfoFlags = ^TStdVideoEncodeH264ReferenceListsInfoFlags;

type
  TStdVideoEncodeH264RefListModEntry = record
    modification_of_pic_nums_idc: TStdVideoH264ModificationOfPicNumsIdc;
    abs_diff_pic_num_minus1: Tuint16_t;
    long_term_pic_num: Tuint16_t;
  end;
  PStdVideoEncodeH264RefListModEntry = ^TStdVideoEncodeH264RefListModEntry;

  TStdVideoEncodeH264RefPicMarkingEntry = record
    memory_management_control_operation: TStdVideoH264MemMgmtControlOp;
    difference_of_pic_nums_minus1: Tuint16_t;
    long_term_pic_num: Tuint16_t;
    long_term_frame_idx: Tuint16_t;
    max_long_term_frame_idx_plus1: Tuint16_t;
  end;
  PStdVideoEncodeH264RefPicMarkingEntry = ^TStdVideoEncodeH264RefPicMarkingEntry;

  TStdVideoEncodeH264ReferenceListsInfo = record
    flags: TStdVideoEncodeH264ReferenceListsInfoFlags;
    num_ref_idx_l0_active_minus1: Tuint8_t;
    num_ref_idx_l1_active_minus1: Tuint8_t;
    RefPicList0: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of Tuint8_t;
    RefPicList1: array[0..(STD_VIDEO_H264_MAX_NUM_LIST_REF) - 1] of Tuint8_t;
    refList0ModOpCount: Tuint8_t;
    refList1ModOpCount: Tuint8_t;
    refPicMarkingOpCount: Tuint8_t;
    reserved1: array[0..6] of Tuint8_t;
    pRefList0ModOperations: PStdVideoEncodeH264RefListModEntry;
    pRefList1ModOperations: PStdVideoEncodeH264RefListModEntry;
    pRefPicMarkingOperations: PStdVideoEncodeH264RefPicMarkingEntry;
  end;
  PStdVideoEncodeH264ReferenceListsInfo = ^TStdVideoEncodeH264ReferenceListsInfo;

  TStdVideoEncodeH264PictureInfo = record
    flags: TStdVideoEncodeH264PictureInfoFlags;
    seq_parameter_set_id: Tuint8_t;
    pic_parameter_set_id: Tuint8_t;
    idr_pic_id: Tuint16_t;
    primary_pic_type: TStdVideoH264PictureType;
    frame_num: Tuint32_t;
    PicOrderCnt: Tint32_t;
    temporal_id: Tuint8_t;
    reserved1: array[0..2] of Tuint8_t;
    pRefLists: PStdVideoEncodeH264ReferenceListsInfo;
  end;
  PStdVideoEncodeH264PictureInfo = ^TStdVideoEncodeH264PictureInfo;

  TStdVideoEncodeH264ReferenceInfo = record
    flags: TStdVideoEncodeH264ReferenceInfoFlags;
    primary_pic_type: TStdVideoH264PictureType;
    FrameNum: Tuint32_t;
    PicOrderCnt: Tint32_t;
    long_term_pic_num: Tuint16_t;
    long_term_frame_idx: Tuint16_t;
    temporal_id: Tuint8_t;
  end;
  PStdVideoEncodeH264ReferenceInfo = ^TStdVideoEncodeH264ReferenceInfo;

  TStdVideoEncodeH264SliceHeader = record
    flags: TStdVideoEncodeH264SliceHeaderFlags;
    first_mb_in_slice: Tuint32_t;
    slice_type: TStdVideoH264SliceType;
    slice_alpha_c0_offset_div2: Tint8_t;
    slice_beta_offset_div2: Tint8_t;
    slice_qp_delta: Tint8_t;
    reserved1: Tuint8_t;
    cabac_init_idc: TStdVideoH264CabacInitIdc;
    disable_deblocking_filter_idc: TStdVideoH264DisableDeblockingFilterIdc;
    pWeightTable: PStdVideoEncodeH264WeightTable;
  end;
  PStdVideoEncodeH264SliceHeader = ^TStdVideoEncodeH264SliceHeader;

  // === Konventiert am: 6-6-26 19:13:53 ===


implementation



end.
