unit gstvkimageview;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PGstVulkanImageView = ^TGstVulkanImageView;
  TGstVulkanImageView = record
      parent : TGstMiniObject;
      device : PGstVulkanDevice;
      image : PGstVulkanImageMemory;
      view : TVkImageView;
      create_info : array[0..47] of Byte; // TVkImageViewCreateInfo;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
static inline GstVulkanImageView* gst_vulkan_image_view_ref(GstVulkanImageView* trash);
static inline GstVulkanImageView *
gst_vulkan_image_view_ref (GstVulkanImageView * trash)

  return (GstVulkanImageView *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (trash));


static inline void gst_vulkan_image_view_unref(GstVulkanImageView* trash);
static inline void
gst_vulkan_image_view_unref (GstVulkanImageView * trash)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (trash));


static inline void
gst_clear_vulkan_image_view (GstVulkanImageView ** view_ptr)

  gst_clear_mini_object ((GstMiniObject **) view_ptr);

 }

 function gst_vulkan_image_view_get_type:TGType;cdecl;external libgstvulkan;
function gst_vulkan_image_view_new(image:PGstVulkanImageMemory; create_info:PVkImageViewCreateInfo):PGstVulkanImageView;cdecl;external libgstvulkan;

// === Konventiert am: 17-7-26 15:47:15 ===

function GST_TYPE_VULKAN_IMAGE_VIEW : TGType;

implementation

function GST_TYPE_VULKAN_IMAGE_VIEW : TGType;
  begin
    GST_TYPE_VULKAN_IMAGE_VIEW:=gst_vulkan_image_view_get_type;
  end;



end.
