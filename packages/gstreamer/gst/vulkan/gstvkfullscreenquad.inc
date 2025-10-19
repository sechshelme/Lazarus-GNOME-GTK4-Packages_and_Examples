
{$IFDEF read_interface}

function gst_vulkan_full_screen_quad_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_new(queue: PGstVulkanQueue): PGstVulkanFullScreenQuad; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_info(self: PGstVulkanFullScreenQuad; in_info: PGstVideoInfo; out_info: PGstVideoInfo): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_shaders(self: PGstVulkanFullScreenQuad; vert: PGstVulkanHandle; frag: PGstVulkanHandle): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_uniform_buffer(self: PGstVulkanFullScreenQuad; uniforms: PGstMemory; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_vertex_buffer(self: PGstVulkanFullScreenQuad; vertices: PGstMemory; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_index_buffer(self: PGstVulkanFullScreenQuad; indices: PGstMemory; n_indices: Tgsize; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_input_buffer(self: PGstVulkanFullScreenQuad; buffer: PGstBuffer; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_set_output_buffer(self: PGstVulkanFullScreenQuad; buffer: PGstBuffer; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_full_screen_quad_enable_blend(self: PGstVulkanFullScreenQuad; enable_blend: Tgboolean); cdecl; external libgstvulkan;
procedure gst_vulkan_full_screen_quad_set_blend_operation(self: PGstVulkanFullScreenQuad; colour_blend_op: TVkBlendOp; alpha_blend_op: TVkBlendOp); cdecl; external libgstvulkan;
procedure gst_vulkan_full_screen_quad_set_blend_factors(self: PGstVulkanFullScreenQuad; src_blend_factor: TVkBlendFactor; dst_blend_factor: TVkBlendFactor; src_alpha_blend_factor: TVkBlendFactor; dst_alpha_blend_factor: TVkBlendFactor); cdecl; external libgstvulkan;
procedure gst_vulkan_full_screen_quad_enable_clear(self: PGstVulkanFullScreenQuad; enable_clear: Tgboolean); cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_prepare_draw(self: PGstVulkanFullScreenQuad; fence: PGstVulkanFence; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_fill_command_buffer(self: PGstVulkanFullScreenQuad; cmd: PGstVulkanCommandBuffer; fence: PGstVulkanFence; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_submit(self: PGstVulkanFullScreenQuad; cmd: PGstVulkanCommandBuffer; fence: PGstVulkanFence; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_draw(self: PGstVulkanFullScreenQuad; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_full_screen_quad_get_last_fence(self: PGstVulkanFullScreenQuad): PGstVulkanFence; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 16:26:40 ===

function GST_TYPE_VULKAN_FULL_SCREEN_QUAD: TGType;
function GST_VULKAN_FULL_SCREEN_QUAD(obj: Pointer): PGstVulkanFullScreenQuad;
function GST_VULKAN_FULL_SCREEN_QUAD_CLASS(klass: Pointer): PGstVulkanFullScreenQuadClass;
function GST_IS_VULKAN_FULL_SCREEN_QUAD(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_FULL_SCREEN_QUAD_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_FULL_SCREEN_QUAD_GET_CLASS(obj: Pointer): PGstVulkanFullScreenQuadClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_FULL_SCREEN_QUAD: TGType;
begin
  GST_TYPE_VULKAN_FULL_SCREEN_QUAD := gst_vulkan_full_screen_quad_get_type;
end;

function GST_VULKAN_FULL_SCREEN_QUAD(obj: Pointer): PGstVulkanFullScreenQuad;
begin
  Result := PGstVulkanFullScreenQuad(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_FULL_SCREEN_QUAD));
end;

function GST_VULKAN_FULL_SCREEN_QUAD_CLASS(klass: Pointer): PGstVulkanFullScreenQuadClass;
begin
  Result := PGstVulkanFullScreenQuadClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_FULL_SCREEN_QUAD));
end;

function GST_IS_VULKAN_FULL_SCREEN_QUAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_FULL_SCREEN_QUAD);
end;

function GST_IS_VULKAN_FULL_SCREEN_QUAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_FULL_SCREEN_QUAD);
end;

function GST_VULKAN_FULL_SCREEN_QUAD_GET_CLASS(obj: Pointer): PGstVulkanFullScreenQuadClass;
begin
  Result := PGstVulkanFullScreenQuadClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
