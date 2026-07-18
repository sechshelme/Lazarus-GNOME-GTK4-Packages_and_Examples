unit gstvkdescriptorset;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstvkdescriptorpool, gstvkdescriptorcache, gstvkhandle;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PPGstVulkanDescriptorSet = ^PGstVulkanDescriptorSet;
  PGstVulkanDescriptorSet = ^TGstVulkanDescriptorSet;
  TGstVulkanDescriptorSet = record
    parent: TGstMiniObject;
    set_: TVkDescriptorSet;
    pool: PGstVulkanDescriptorPool;
    cache: PGstVulkanDescriptorCache;
    n_layouts: Tguint;
    layouts: ^PGstVulkanHandle;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_descriptor_set_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_set_new_wrapped(pool: PGstVulkanDescriptorPool; set_: TVkDescriptorSet; n_layouts: Tguint; layouts: PPGstVulkanHandle): PGstVulkanDescriptorSet; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:36:32 ===

function GST_TYPE_VULKAN_DESCRIPTOR_SET: TGType;

function gst_vulkan_descriptor_set_ref(set_: PGstVulkanDescriptorSet): PGstVulkanDescriptorSet; inline;
procedure gst_vulkan_descriptor_set_unref(set_: PGstVulkanDescriptorSet); inline;
procedure gst_clear_vulkan_descriptor_set(set_ptr: PPGstVulkanDescriptorSet); inline;
{$ENDIF read_function}

implementation

function GST_TYPE_VULKAN_DESCRIPTOR_SET: TGType;
begin
  GST_TYPE_VULKAN_DESCRIPTOR_SET := gst_vulkan_descriptor_set_get_type;
end;

procedure gst_clear_vulkan_descriptor_set(var set_ptr: PGstVulkanDescriptorSet);
begin
  gst_clear_mini_object(PPGstMiniObject(@set_ptr));
end;

function gst_vulkan_descriptor_set_ref(set_: PGstVulkanDescriptorSet): PGstVulkanDescriptorSet;
begin
  Result := PGstVulkanDescriptorSet(gst_mini_object_ref(PGstMiniObject(set_)));
end;

procedure gst_vulkan_descriptor_set_unref(set_: PGstVulkanDescriptorSet);
begin
  gst_mini_object_unref(PGstMiniObject(set_));
end;

procedure gst_clear_vulkan_descriptor_set(set_ptr: PPGstVulkanDescriptorSet);
begin
  gst_clear_mini_object(PPGstMiniObject(@set_ptr));
end;

end.
