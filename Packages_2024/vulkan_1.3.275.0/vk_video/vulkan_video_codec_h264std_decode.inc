{$IFDEF read_interface}


const
  VULKAN_VIDEO_CODEC_H264STD_DECODE_H_ = 1;
  VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0 = $00400000;
  VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0;
  VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h264_decode';
  STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE = 2;

type
  PStdVideoDecodeH264FieldOrderCount = ^TStdVideoDecodeH264FieldOrderCount;
  TStdVideoDecodeH264FieldOrderCount = longint;

const
  STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_TOP = 0;
  STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_BOTTOM = 1;
  STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_INVALID = $7FFFFFFF;
  STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_MAX_ENUM = $7FFFFFFF;

type
  TStdVideoDecodeH264PictureInfoFlags =bitpacked record
    field_pic_flag: 0..1;
    is_intra: 0..1;
    IdrPicFlag: 0..1;
    bottom_field_flag: 0..1;
    is_reference: 0..1;
    complementary_field_pair: 0..1;
  end;
  PStdVideoDecodeH264PictureInfoFlags = ^TStdVideoDecodeH264PictureInfoFlags;

type
  TStdVideoDecodeH264PictureInfo = record
    flags: TStdVideoDecodeH264PictureInfoFlags;
    seq_parameter_set_id: Tuint8_t;
    pic_parameter_set_id: Tuint8_t;
    reserved1: Tuint8_t;
    reserved2: Tuint8_t;
    frame_num: Tuint16_t;
    idr_pic_id: Tuint16_t;
    PicOrderCnt: array[0..(STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE) - 1] of Tint32_t;
  end;
  PStdVideoDecodeH264PictureInfo = ^TStdVideoDecodeH264PictureInfo;

  TStdVideoDecodeH264ReferenceInfoFlags =bitpacked record
    top_field_flag: 0..1;
    bottom_field_flag: 0..1;
    used_for_long_term_reference: 0..1;
    is_non_existing: 0..1;
  end;
  PStdVideoDecodeH264ReferenceInfoFlags = ^TStdVideoDecodeH264ReferenceInfoFlags;

type
  TStdVideoDecodeH264ReferenceInfo = record
    flags: TStdVideoDecodeH264ReferenceInfoFlags;
    FrameNum: Tuint16_t;
    reserved: Tuint16_t;
    PicOrderCnt: array[0..(STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE) - 1] of Tint32_t;
  end;
  PStdVideoDecodeH264ReferenceInfo = ^TStdVideoDecodeH264ReferenceInfo;

  // === Konventiert am: 6-6-26 19:13:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
