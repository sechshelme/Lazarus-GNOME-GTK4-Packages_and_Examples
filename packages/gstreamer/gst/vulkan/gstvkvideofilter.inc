/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_video_filter_get_type: TGType; cdecl; external libgstvulkan;

type
  TGstVulkanVideoFilter = record
    parent: TGstBaseTransform;
    instance: PGstVulkanInstance;
    device: PGstVulkanDevice;
    queue: PGstVulkanQueue;
    in_caps: PGstCaps;
    in_info: TGstVideoInfo;
    out_caps: PGstCaps;
    out_info: TGstVideoInfo;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanVideoFilter = ^TGstVulkanVideoFilter;

  TGstVulkanVideoFilterClass = record
    parent_class: TGstBaseTransformClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanVideoFilterClass = ^TGstVulkanVideoFilterClass;

  // === Konventiert am: 10-10-24 17:06:06 ===

function GST_TYPE_VULKAN_VIDEO_FILTER: TGType;
function GST_VULKAN_VIDEO_FILTER(obj: Pointer): PGstVulkanVideoFilter;
function GST_VULKAN_VIDEO_FILTER_CLASS(klass: Pointer): PGstVulkanVideoFilterClass;
function GST_IS_VULKAN_VIDEO_FILTER(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_VIDEO_FILTER_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_VIDEO_FILTER_GET_CLASS(obj: Pointer): PGstVulkanVideoFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_VIDEO_FILTER: TGType;
begin
  GST_TYPE_VULKAN_VIDEO_FILTER := gst_vulkan_video_filter_get_type;
end;

function GST_VULKAN_VIDEO_FILTER(obj: Pointer): PGstVulkanVideoFilter;
begin
  Result := PGstVulkanVideoFilter(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_VIDEO_FILTER));
end;

function GST_VULKAN_VIDEO_FILTER_CLASS(klass: Pointer): PGstVulkanVideoFilterClass;
begin
  Result := PGstVulkanVideoFilterClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_VIDEO_FILTER));
end;

function GST_IS_VULKAN_VIDEO_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_VIDEO_FILTER);
end;

function GST_IS_VULKAN_VIDEO_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_VIDEO_FILTER);
end;

function GST_VULKAN_VIDEO_FILTER_GET_CLASS(obj: Pointer): PGstVulkanVideoFilterClass;
begin
  Result := PGstVulkanVideoFilterClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
