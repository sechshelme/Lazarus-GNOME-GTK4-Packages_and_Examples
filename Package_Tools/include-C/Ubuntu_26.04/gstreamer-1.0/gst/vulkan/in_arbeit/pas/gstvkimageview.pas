unit gstvkimageview;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PPGstVulkanImageView = ^PGstVulkanImageView;
  PGstVulkanImageView = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_image_view_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_image_view_new(image: PGstVulkanImageMemory; create_info: PVkImageViewCreateInfo): PGstVulkanImageView; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:47:15 ===

function gst_vulkan_image_view_ref(trash: PGstVulkanImageView): PGstVulkanImageView;
procedure gst_vulkan_image_view_unref(trash: PGstVulkanImageView);
procedure gst_clear_vulkan_image_view(view_ptr: PPGstVulkanImageView);

function GST_TYPE_VULKAN_IMAGE_VIEW: TGType;
{$ENDIF read_function}

implementation

function GST_TYPE_VULKAN_IMAGE_VIEW: TGType;
begin
  GST_TYPE_VULKAN_IMAGE_VIEW := gst_vulkan_image_view_get_type;
end;

function gst_vulkan_image_view_ref(trash: PGstVulkanImageView): PGstVulkanImageView;
begin
  Result := PGstVulkanImageView(gst_mini_object_ref(PGstMiniObject(trash)));
end;

procedure gst_vulkan_image_view_unref(trash: PGstVulkanImageView);
begin
  gst_mini_object_unref(PGstMiniObject(trash));
end;

procedure gst_clear_vulkan_image_view(view_ptr: PPGstVulkanImageView);
begin
  gst_clear_mini_object(PPGstMiniObject(view_ptr));
end;

end.
