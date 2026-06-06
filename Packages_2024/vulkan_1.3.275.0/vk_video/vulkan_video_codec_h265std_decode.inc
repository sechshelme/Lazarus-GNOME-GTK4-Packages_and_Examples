{$IFDEF read_interface}


const
  VULKAN_VIDEO_CODEC_H265STD_DECODE_H_ = 1;
  VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0 = $00400000;
  VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0;
  VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h265_decode';
  STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE = 8;

type
  TStdVideoDecodeH265PictureInfoFlags = bitpacked record
    IrapPicFlag: 0..1;
    IdrPicFlag: 0..1;
    IsReference: 0..1;
    short_term_ref_pic_set_sps_flag: 0..1;
  end;
  PStdVideoDecodeH265PictureInfoFlags = ^TStdVideoDecodeH265PictureInfoFlags;

type
  TStdVideoDecodeH265PictureInfo = record
    flags: TStdVideoDecodeH265PictureInfoFlags;
    sps_video_parameter_set_id: Tuint8_t;
    pps_seq_parameter_set_id: Tuint8_t;
    pps_pic_parameter_set_id: Tuint8_t;
    NumDeltaPocsOfRefRpsIdx: Tuint8_t;
    PicOrderCntVal: Tint32_t;
    NumBitsForSTRefPicSetInSlice: Tuint16_t;
    reserved: Tuint16_t;
    RefPicSetStCurrBefore: array[0..(STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE) - 1] of Tuint8_t;
    RefPicSetStCurrAfter: array[0..(STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE) - 1] of Tuint8_t;
    RefPicSetLtCurr: array[0..(STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE) - 1] of Tuint8_t;
  end;
  PStdVideoDecodeH265PictureInfo = ^TStdVideoDecodeH265PictureInfo;

type
  TStdVideoDecodeH265ReferenceInfoFlags = bitpacked record
    used_for_long_term_reference: 0..1;
    unused_for_reference: 0..1;
  end;
  PStdVideoDecodeH265ReferenceInfoFlags = ^TStdVideoDecodeH265ReferenceInfoFlags;

type
  TStdVideoDecodeH265ReferenceInfo = record
    flags: TStdVideoDecodeH265ReferenceInfoFlags;
    PicOrderCntVal: Tint32_t;
  end;
  PStdVideoDecodeH265ReferenceInfo = ^TStdVideoDecodeH265ReferenceInfo;

  // === Konventiert am: 6-6-26 19:13:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
