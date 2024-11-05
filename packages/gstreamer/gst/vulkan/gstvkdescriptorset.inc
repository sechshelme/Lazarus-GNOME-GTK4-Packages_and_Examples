/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_descriptor_set_get_type: TGType; cdecl; external libgstvulkan;

type
  TGstVulkanDescriptorSet = record
    parent: TGstMiniObject;
    set_: TVkDescriptorSet;
    pool: PGstVulkanDescriptorPool;
    cache: PGstVulkanDescriptorCache;
    n_layouts: Tguint;
    layouts: ^PGstVulkanHandle;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanDescriptorSet = ^TGstVulkanDescriptorSet;


function gst_vulkan_descriptor_set_new_wrapped(pool: PGstVulkanDescriptorPool; set_: TVkDescriptorSet; n_layouts: Tguint; layouts: PPGstVulkanHandle): PGstVulkanDescriptorSet; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 16:35:15 ===

function GST_TYPE_VULKAN_DESCRIPTOR_SET: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DESCRIPTOR_SET: TGType;
begin
  GST_TYPE_VULKAN_DESCRIPTOR_SET := gst_vulkan_descriptor_set_get_type;
end;



{$ENDIF read_implementation}
