unit gstvkvideofilter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, fp_gst_base, gstvkinstance, gstvkqueue;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstVulkanVideoFilter = type Pointer;

  PGstVulkanVideoFilterClass = ^TGstVulkanVideoFilterClass;
  TGstVulkanVideoFilterClass = record
    parent_class: TGstBaseTransformClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_video_filter_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_video_filter_get_instance(filter: PGstVulkanVideoFilter): PGstVulkanInstance; cdecl; external libgstvulkan;
function gst_vulkan_video_filter_get_device(filter: PGstVulkanVideoFilter): PGstVulkanDevice; cdecl; external libgstvulkan;
function gst_vulkan_video_filter_get_queue(filter: PGstVulkanVideoFilter): PGstVulkanQueue; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:49:31 ===

function GST_TYPE_VULKAN_VIDEO_FILTER: TGType;
function GST_VULKAN_VIDEO_FILTER(obj: Pointer): PGstVulkanVideoFilter;
function GST_VULKAN_VIDEO_FILTER_CLASS(klass: Pointer): PGstVulkanVideoFilterClass;
function GST_IS_VULKAN_VIDEO_FILTER(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_VIDEO_FILTER_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_VIDEO_FILTER_GET_CLASS(obj: Pointer): PGstVulkanVideoFilterClass;
{$ENDIF read_function}

implementation

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

end.
