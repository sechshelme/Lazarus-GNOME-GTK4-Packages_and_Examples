
unit gstvkfullscreenquad;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkfullscreenquad.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkfullscreenquad.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGError  = ^GError;
PGstBuffer  = ^GstBuffer;
PGstMemory  = ^GstMemory;
PGstVideoInfo  = ^GstVideoInfo;
PGstVulkanCommandBuffer  = ^GstVulkanCommandBuffer;
PGstVulkanCommandPool  = ^GstVulkanCommandPool;
PGstVulkanDescriptorCache  = ^GstVulkanDescriptorCache;
PGstVulkanDescriptorSet  = ^GstVulkanDescriptorSet;
PGstVulkanFence  = ^GstVulkanFence;
PGstVulkanFullScreenQuad  = ^GstVulkanFullScreenQuad;
PGstVulkanFullScreenQuadClass  = ^GstVulkanFullScreenQuadClass;
PGstVulkanHandle  = ^GstVulkanHandle;
PGstVulkanQueue  = ^GstVulkanQueue;
PGstVulkanTrashList  = ^GstVulkanTrashList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer Plugins
 * Copyright (C) 2019 Matthew Waters <matthew@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VULKAN_FULL_SCREEN_QUAD_H__}
{$define __GST_VULKAN_FULL_SCREEN_QUAD_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan.h>}

function gst_vulkan_full_screen_quad_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_FULL_SCREEN_QUAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FULL_SCREEN_QUAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FULL_SCREEN_QUAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FULL_SCREEN_QUAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FULL_SCREEN_QUAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FULL_SCREEN_QUAD_GET_CLASS(obj : longint) : longint;

{*
 * GstVulkanFullScreenQuad:
 * @parent: the parent #GstObject
 * @in_info: the configured input #GstVideoInfo
 * @out_info: the configured output #GstVideoInfo
 * @queue: the #GstVulkanQueue to submit #GstVulkanCommandBuffer's on
 * @render_pass: the configured `VkRenderPass`
 * @pipeline_layout: the configured `VkPipelineLayout`
 * @graphics_pipeline: the configured `VkPipeline`
 * @descriptor_set_layout: the configured `VkDescriptorSetLayout`
 * @descriptor_cache: the configured #GstVulkanDescriptorCache
 * @descriptor_set: the configured #GstVulkanDescriptorSet
 * @framebuffer: the configured `VkFramebuffer`
 * @sampler: the configured `VkSampler`
 * @cmd_pool: the #GstVulkanCommandPool to allocate #GstVulkanCommandBuffer's from
 * @trash_list: the #GstVulkanTrashList for freeing unused resources
 * @last_fence: the last configured #GstVulkanFences
 *
 * Since: 1.18
  }
{ <protected>  }
{ <private>  }
type
  PGstVulkanFullScreenQuad = ^TGstVulkanFullScreenQuad;
  TGstVulkanFullScreenQuad = record
      parent : TGstObject;
      out_info : TGstVideoInfo;
      in_info : TGstVideoInfo;
      queue : PGstVulkanQueue;
      render_pass : PGstVulkanHandle;
      pipeline_layout : PGstVulkanHandle;
      graphics_pipeline : PGstVulkanHandle;
      descriptor_set_layout : PGstVulkanHandle;
      descriptor_cache : PGstVulkanDescriptorCache;
      descriptor_set : PGstVulkanDescriptorSet;
      framebuffer : PGstVulkanHandle;
      sampler : PGstVulkanHandle;
      cmd_pool : PGstVulkanCommandPool;
      trash_list : PGstVulkanTrashList;
      last_fence : PGstVulkanFence;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanFullScreenQuadClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanFullScreenQuadClass = ^TGstVulkanFullScreenQuadClass;
  TGstVulkanFullScreenQuadClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanFullScreenQuad, gst_object_unref) }

function gst_vulkan_full_screen_quad_new(queue:PGstVulkanQueue):PGstVulkanFullScreenQuad;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_vulkan_full_screen_quad_set_info(self:PGstVulkanFullScreenQuad; in_info:PGstVideoInfo; out_info:PGstVideoInfo):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_set_shaders(self:PGstVulkanFullScreenQuad; vert:PGstVulkanHandle; frag:PGstVulkanHandle):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_set_uniform_buffer(self:PGstVulkanFullScreenQuad; uniforms:PGstMemory; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_set_vertex_buffer(self:PGstVulkanFullScreenQuad; vertices:PGstMemory; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_set_index_buffer(self:PGstVulkanFullScreenQuad; indices:PGstMemory; n_indices:Tgsize; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_set_input_buffer(self:PGstVulkanFullScreenQuad; buffer:PGstBuffer; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_set_output_buffer(self:PGstVulkanFullScreenQuad; buffer:PGstBuffer; error:PPGError):Tgboolean;cdecl;external;
procedure gst_vulkan_full_screen_quad_enable_blend(self:PGstVulkanFullScreenQuad; enable_blend:Tgboolean);cdecl;external;
procedure gst_vulkan_full_screen_quad_set_blend_operation(self:PGstVulkanFullScreenQuad; colour_blend_op:TVkBlendOp; alpha_blend_op:TVkBlendOp);cdecl;external;
procedure gst_vulkan_full_screen_quad_set_blend_factors(self:PGstVulkanFullScreenQuad; src_blend_factor:TVkBlendFactor; dst_blend_factor:TVkBlendFactor; src_alpha_blend_factor:TVkBlendFactor; dst_alpha_blend_factor:TVkBlendFactor);cdecl;external;
procedure gst_vulkan_full_screen_quad_enable_clear(self:PGstVulkanFullScreenQuad; enable_clear:Tgboolean);cdecl;external;
function gst_vulkan_full_screen_quad_prepare_draw(self:PGstVulkanFullScreenQuad; fence:PGstVulkanFence; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_fill_command_buffer(self:PGstVulkanFullScreenQuad; cmd:PGstVulkanCommandBuffer; fence:PGstVulkanFence; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_submit(self:PGstVulkanFullScreenQuad; cmd:PGstVulkanCommandBuffer; fence:PGstVulkanFence; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_draw(self:PGstVulkanFullScreenQuad; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_full_screen_quad_get_last_fence(self:PGstVulkanFullScreenQuad):PGstVulkanFence;cdecl;external;
function gst_vulkan_full_screen_quad_get_queue(self:PGstVulkanFullScreenQuad):PGstVulkanQueue;cdecl;external;
{$endif}
{ __GST_VULKAN_FULL_SCREEN_QUAD_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_FULL_SCREEN_QUAD : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_FULL_SCREEN_QUAD:=gst_vulkan_full_screen_quad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FULL_SCREEN_QUAD(obj : longint) : longint;
begin
  GST_VULKAN_FULL_SCREEN_QUAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_FULL_SCREEN_QUAD,GstVulkanFullScreenQuad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FULL_SCREEN_QUAD_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_FULL_SCREEN_QUAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_FULL_SCREEN_QUAD,GstVulkanFullScreenQuadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FULL_SCREEN_QUAD(obj : longint) : longint;
begin
  GST_IS_VULKAN_FULL_SCREEN_QUAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_FULL_SCREEN_QUAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FULL_SCREEN_QUAD_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_FULL_SCREEN_QUAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_FULL_SCREEN_QUAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FULL_SCREEN_QUAD_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_FULL_SCREEN_QUAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VULKAN_FULL_SCREEN_QUAD,GstVulkanFullScreenQuadClass);
end;


end.
