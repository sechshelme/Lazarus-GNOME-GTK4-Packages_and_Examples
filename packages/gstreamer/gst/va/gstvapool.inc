/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   17:02                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


{ GStreamer
 * Copyright (C) 2020 Igalia, S.L.
 *     Author: Víctor Jáquez <vjaquez@igalia.com>
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
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/va/gstva.h>}

function gst_va_pool_get_type:TGType;cdecl;external libgstvap;
function gst_va_pool_new:PGstBufferPool;cdecl;external libgstvap;
function gst_va_pool_requires_video_meta(pool:PGstBufferPool):Tgboolean;cdecl;external libgstvap;
procedure gst_buffer_pool_config_set_va_allocation_params(config:PGstStructure; usage_hint:Tguint; use_derived:TGstVaFeature);cdecl;external libgstvap;
procedure gst_buffer_pool_config_set_va_alignment(config:PGstStructure; align:PGstVideoAlignment);cdecl;external libgstvap;
function gst_va_pool_new_with_config(caps:PGstCaps; min_buffers:Tguint; max_buffers:Tguint; usage_hint:Tguint; use_derived:TGstVaFeature; 
           allocator:PGstAllocator; alloc_params:PGstAllocationParams):PGstBufferPool;cdecl;external libgstvap;
function gst_va_pool_get_buffer_size(pool:PGstBufferPool; size:Pguint):Tgboolean;cdecl;external libgstvap;

// === Konventiert am: 8-10-24 16:14:14 ===

function GST_TYPE_VA_POOL : TGType;
function GST_VA_POOL(obj : Pointer) : PGstVaPool;
function GST_VA_POOL_CLASS(klass : Pointer) : PGstVaPoolClass;
function GST_IS_VA_POOL(obj : Pointer) : Tgboolean;
function GST_IS_VA_POOL_CLASS(klass : Pointer) : Tgboolean;
function GST_VA_POOL_GET_CLASS(obj : Pointer) : PGstVaPoolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VA_POOL : TGType;
  begin
    GST_TYPE_VA_POOL:=gst_va_pool_get_type;
  end;

function GST_VA_POOL(obj : Pointer) : PGstVaPool;
begin
  Result := PGstVaPool(g_type_check_instance_cast(obj, GST_TYPE_VA_POOL));
end;

function GST_VA_POOL_CLASS(klass : Pointer) : PGstVaPoolClass;
begin
  Result := PGstVaPoolClass(g_type_check_class_cast(klass, GST_TYPE_VA_POOL));
end;

function GST_IS_VA_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VA_POOL);
end;

function GST_IS_VA_POOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VA_POOL);
end;

function GST_VA_POOL_GET_CLASS(obj : Pointer) : PGstVaPoolClass;
begin
  Result := PGstVaPoolClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
