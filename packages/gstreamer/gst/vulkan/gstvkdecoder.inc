
{$IFDEF read_interface}

function gst_vulkan_decoder_get_type: TGType; cdecl; external libgstvulkan;

type
  PGstVulkanDecoderPicture = ^TGstVulkanDecoderPicture;

  TGstVulkanDecoderPicture = record
    _out: PGstBuffer;
    dpb: PGstBuffer;
    img_view_ref: PGstVulkanImageView;
    img_view_out: PGstVulkanImageView;
    slice_offs: PGArray;
    refs: array[0..35] of PGstVulkanDecoderPicture;
    pics_res: array[0..35] of TVkVideoPictureResourceInfoKHR;
    slots: array[0..35] of TVkVideoReferenceSlotInfoKHR;
    pic_res: TVkVideoPictureResourceInfoKHR;
    slot: TVkVideoReferenceSlotInfoKHR;
    decode_info: TVkVideoDecodeInfoKHR;
  end;

  TGstVulkanDecoder = record
    parent: TGstObject;
    queue: PGstVulkanQueue;
    codec: Tguint;
    profile: TGstVulkanVideoProfile;
    input_buffer: PGstBuffer;
    layered_buffer: PGstBuffer;
    dedicated_dpb: Tgboolean;
    layered_dpb: Tgboolean;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanDecoder = ^TGstVulkanDecoder;

  TGstVulkanDecoderClass = record
    parent: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanDecoderClass = ^TGstVulkanDecoderClass;

  TGstVulkanDecoderParameters = record
    case longint of
      0: (h264: TVkVideoDecodeH264SessionParametersCreateInfoKHR);
      1: (h265: TVkVideoDecodeH265SessionParametersCreateInfoKHR);
  end;
  PGstVulkanDecoderParameters = ^TGstVulkanDecoderParameters;

function gst_vulkan_decoder_start(self: PGstVulkanDecoder; profile: PGstVulkanVideoProfile; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_stop(self: PGstVulkanDecoder): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_update_video_session_parameters(self: PGstVulkanDecoder; params: PGstVulkanDecoderParameters; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_create_dpb_pool(self: PGstVulkanDecoder; caps: PGstCaps): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_flush(self: PGstVulkanDecoder; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_decode(self: PGstVulkanDecoder; pic: PGstVulkanDecoderPicture; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_is_started(self: PGstVulkanDecoder): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_caps(self: PGstVulkanDecoder; caps: PGstVulkanVideoCapabilities): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_out_format(self: PGstVulkanDecoder; format: PVkVideoFormatPropertiesKHR): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_profile_caps(self: PGstVulkanDecoder): PGstCaps; cdecl; external libgstvulkan;
function gst_vulkan_decoder_update_ycbcr_sampler(self: PGstVulkanDecoder; range: TVkSamplerYcbcrRange; xloc: TVkChromaLocation; yloc: TVkChromaLocation; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_picture_create_view(self: PGstVulkanDecoder; buf: PGstBuffer; is_out: Tgboolean): PGstVulkanImageView; cdecl; external libgstvulkan;
function gst_vulkan_decoder_picture_init(self: PGstVulkanDecoder; pic: PGstVulkanDecoderPicture; _out: PGstBuffer): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_decoder_picture_release(pic: PGstVulkanDecoderPicture); cdecl; external libgstvulkan;
function gst_vulkan_decoder_append_slice(self: PGstVulkanDecoder; pic: PGstVulkanDecoderPicture; Data: Pguint8; size: Tsize_t; add_startcode: Tgboolean): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_decoder_wait(self: PGstVulkanDecoder): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 15:17:16 ===

function GST_TYPE_VULKAN_DECODER: TGType;
function GST_VULKAN_DECODER(obj: Pointer): PGstVulkanDecoder;
function GST_VULKAN_DECODER_CLASS(klass: Pointer): PGstVulkanDecoderClass;
function GST_IS_VULKAN_DECODER(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_DECODER_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_DECODER_GET_CLASS(obj: Pointer): PGstVulkanDecoderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DECODER: TGType;
begin
  GST_TYPE_VULKAN_DECODER := gst_vulkan_decoder_get_type;
end;

function GST_VULKAN_DECODER(obj: Pointer): PGstVulkanDecoder;
begin
  Result := PGstVulkanDecoder(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DECODER));
end;

function GST_VULKAN_DECODER_CLASS(klass: Pointer): PGstVulkanDecoderClass;
begin
  Result := PGstVulkanDecoderClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DECODER));
end;

function GST_IS_VULKAN_DECODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DECODER);
end;

function GST_IS_VULKAN_DECODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DECODER);
end;

function GST_VULKAN_DECODER_GET_CLASS(obj: Pointer): PGstVulkanDecoderClass;
begin
  Result := PGstVulkanDecoderClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
