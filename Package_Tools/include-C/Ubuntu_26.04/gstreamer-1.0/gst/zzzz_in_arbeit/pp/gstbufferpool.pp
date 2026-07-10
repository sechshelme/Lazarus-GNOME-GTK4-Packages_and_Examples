
unit gstbufferpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbufferpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbufferpool.h
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
Pgchar  = ^gchar;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBuffer  = ^GstBuffer;
PGstBufferPool  = ^GstBufferPool;
PGstBufferPoolAcquireFlags  = ^GstBufferPoolAcquireFlags;
PGstBufferPoolAcquireParams  = ^GstBufferPoolAcquireParams;
PGstBufferPoolClass  = ^GstBufferPoolClass;
PGstBufferPoolPrivate  = ^GstBufferPoolPrivate;
PGstCaps  = ^GstCaps;
PGstStructure  = ^GstStructure;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2010 Wim Taymans <wim.taymans@gmail.com>
 *
 * gstbufferpool.h: Header for GstBufferPool object
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
{$ifndef __GST_BUFFER_POOL_H__}
{$define __GST_BUFFER_POOL_H__}
{$include <gst/gstminiobject.h>}
{$include <gst/gstpad.h>}
{$include <gst/gstbuffer.h>}
type

{ was #define dname def_expr }
function GST_TYPE_BUFFER_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_POOL_CAST(obj : longint) : PGstBufferPool;

{*
 * GstBufferPoolAcquireFlags:
 * @GST_BUFFER_POOL_ACQUIRE_FLAG_NONE: no flags
 * @GST_BUFFER_POOL_ACQUIRE_FLAG_KEY_UNIT: buffer is keyframe
 * @GST_BUFFER_POOL_ACQUIRE_FLAG_DONTWAIT: when the bufferpool is empty, acquire_buffer
 * will by default block until a buffer is released into the pool again. Setting
 * this flag makes acquire_buffer return #GST_FLOW_EOS instead of blocking.
 * @GST_BUFFER_POOL_ACQUIRE_FLAG_DISCONT: buffer is discont
 * @GST_BUFFER_POOL_ACQUIRE_FLAG_LAST: last flag, subclasses can use private flags
 *    starting from this value.
 *
 * Additional flags to control the allocation of a buffer
  }
type
  PGstBufferPoolAcquireFlags = ^TGstBufferPoolAcquireFlags;
  TGstBufferPoolAcquireFlags =  Longint;
  Const
    GST_BUFFER_POOL_ACQUIRE_FLAG_NONE = 0;
    GST_BUFFER_POOL_ACQUIRE_FLAG_KEY_UNIT = 1 shl 0;
    GST_BUFFER_POOL_ACQUIRE_FLAG_DONTWAIT = 1 shl 1;
    GST_BUFFER_POOL_ACQUIRE_FLAG_DISCONT = 1 shl 2;
    GST_BUFFER_POOL_ACQUIRE_FLAG_LAST = 1 shl 16;
;
type
{*
 * GstBufferPoolAcquireParams:
 * @format: the format of @start and @stop
 * @start: the start position
 * @stop: the stop position
 * @flags: additional flags
 *
 * Parameters passed to the gst_buffer_pool_acquire_buffer() function to control the
 * allocation of the buffer.
 *
 * The default implementation ignores the @start and @stop members but other
 * implementations can use this extra information to decide what buffer to
 * return.
  }
{< private > }
  PGstBufferPoolAcquireParams = ^TGstBufferPoolAcquireParams;
  TGstBufferPoolAcquireParams = record
      format : TGstFormat;
      start : Tgint64;
      stop : Tgint64;
      flags : TGstBufferPoolAcquireFlags;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_BUFFER_POOL_IS_FLUSHING:
 * @pool: a GstBufferPool
 *
 * Check if the bufferpool is flushing. Subclasses might want to check the
 * state of the pool in the acquire function.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BUFFER_POOL_IS_FLUSHING(pool : longint) : longint;

{*
 * GstBufferPool:
 * @object: the parent structure
 * @flushing: whether the pool is currently gathering back outstanding buffers
 *
 * The structure of a #GstBufferPool. Use the associated macros to access the public
 * variables.
  }
{< protected > }
{< private > }
type
  PGstBufferPool = ^TGstBufferPool;
  TGstBufferPool = record
      object : TGstObject;
      flushing : Tgint;
      priv : PGstBufferPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstBufferPoolClass:
 * @object_class:  Object parent class
 *
 * The #GstBufferPool class.
  }
{< public > }
{*
   * GstBufferPoolClass::get_options:
   * @pool: the #GstBufferPool
   *
   * Get a list of options supported by this pool
   *
   * Returns: (array zero-terminated=1) (transfer none): a %NULL terminated array
   *          of strings.
    }
(* Const before type ignored *)
{*
   * GstBufferPoolClass::set_config:
   * @pool: the #GstBufferPool
   * @config: the required configuration
   *
   * Apply the bufferpool configuration. The default configuration will parse
   * the default config parameters.
   *
   * Returns: whether the configuration could be set.
    }
{*
   * GstBufferPoolClass::start:
   * @pool: the #GstBufferPool
   *
   * Start the bufferpool. The default implementation will preallocate
   * min-buffers buffers and put them in the queue.
   *
   * Subclasses do not need to chain up to the parent's default implementation
   * if they don't want min-buffers based preallocation.
   *
   * Returns: whether the pool could be started.
    }
{*
   * GstBufferPoolClass::stop:
   * @pool: the #GstBufferPool
   *
   * Stop the bufferpool. the default implementation will free the
   * preallocated buffers. This function is called when all the buffers are
   * returned to the pool.
   *
   * Returns: whether the pool could be stopped.
    }
{*
   * GstBufferPoolClass::acquire_buffer:
   * @pool: the #GstBufferPool
   * @buffer: (out) (transfer full) (nullable): a location for a #GstBuffer
   * @params: (transfer none) (nullable): parameters.
   *
   * Get a new buffer from the pool. The default implementation
   * will take a buffer from the queue and optionally wait for a buffer to
   * be released when there are no buffers available.
   *
   * Returns: a #GstFlowReturn such as %GST_FLOW_FLUSHING when the pool is
   * inactive.
    }
{*
   * GstBufferPoolClass::alloc_buffer:
   * @pool: the #GstBufferPool
   * @buffer: (out) (transfer full) (nullable): a location for a #GstBuffer
   * @params: (transfer none) (nullable): parameters.
   *
   * Allocate a buffer. the default implementation allocates
   * buffers from the configured memory allocator and with the configured
   * parameters. All metadata that is present on the allocated buffer will
   * be marked as #GST_META_FLAG_POOLED and #GST_META_FLAG_LOCKED and will
   * not be removed from the buffer in #GstBufferPoolClass::reset_buffer.
   * The buffer should have the #GST_BUFFER_FLAG_TAG_MEMORY cleared.
   *
   * Returns: a #GstFlowReturn to indicate whether the allocation was
   * successful.
    }
{*
   * GstBufferPoolClass::reset_buffer:
   * @pool: the #GstBufferPool
   * @buffer: the #GstBuffer to reset
   *
   * Reset the buffer to its state when it was freshly allocated.
   * The default implementation will clear the flags, timestamps and
   * will remove the metadata without the #GST_META_FLAG_POOLED flag (even
   * the metadata with #GST_META_FLAG_LOCKED). If the
   * #GST_BUFFER_FLAG_TAG_MEMORY was set, this function can also try to
   * restore the memory and clear the #GST_BUFFER_FLAG_TAG_MEMORY again.
    }
{*
   * GstBufferPoolClass::release_buffer:
   * @pool: the #GstBufferPool
   * @buffer: the #GstBuffer to release
   *
   * Release a buffer back in the pool. The default implementation
   * will put the buffer back in the queue and notify any
   * blocking #GstBufferPoolClass::acquire_buffer calls when the
   * #GST_BUFFER_FLAG_TAG_MEMORY is not set on the buffer.
   * If #GST_BUFFER_FLAG_TAG_MEMORY is set, the buffer will be freed with
   * #GstBufferPoolClass::free_buffer.
    }
{*
   * GstBufferPoolClass::free_buffer:
   * @pool: the #GstBufferPool
   * @buffer: the #GstBuffer to free
   *
   * Free a buffer. The default implementation unrefs the buffer.
    }
{*
   * GstBufferPoolClass::flush_start:
   * @pool: the #GstBufferPool
   *
   * Enter the flushing state.
   *
   * Since: 1.4
    }
{*
   * GstBufferPoolClass::flush_stop:
   * @pool: the #GstBufferPool
   *
   * Leave the flushing state.
   *
   * Since: 1.4
    }
{< private > }
  PGstBufferPoolClass = ^TGstBufferPoolClass;
  TGstBufferPoolClass = record
      object_class : TGstObjectClass;
      get_options : function (pool:PGstBufferPool):PPgchar;cdecl;
      set_config : function (pool:PGstBufferPool; config:PGstStructure):Tgboolean;cdecl;
      start : function (pool:PGstBufferPool):Tgboolean;cdecl;
      stop : function (pool:PGstBufferPool):Tgboolean;cdecl;
      acquire_buffer : function (pool:PGstBufferPool; buffer:PPGstBuffer; params:PGstBufferPoolAcquireParams):TGstFlowReturn;cdecl;
      alloc_buffer : function (pool:PGstBufferPool; buffer:PPGstBuffer; params:PGstBufferPoolAcquireParams):TGstFlowReturn;cdecl;
      reset_buffer : procedure (pool:PGstBufferPool; buffer:PGstBuffer);cdecl;
      release_buffer : procedure (pool:PGstBufferPool; buffer:PGstBuffer);cdecl;
      free_buffer : procedure (pool:PGstBufferPool; buffer:PGstBuffer);cdecl;
      flush_start : procedure (pool:PGstBufferPool);cdecl;
      flush_stop : procedure (pool:PGstBufferPool);cdecl;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;


function gst_buffer_pool_get_type:TGType;cdecl;external;
{ allocation  }
function gst_buffer_pool_new:PGstBufferPool;cdecl;external;
{ state management  }
function gst_buffer_pool_set_active(pool:PGstBufferPool; active:Tgboolean):Tgboolean;cdecl;external;
function gst_buffer_pool_is_active(pool:PGstBufferPool):Tgboolean;cdecl;external;
function gst_buffer_pool_set_config(pool:PGstBufferPool; config:PGstStructure):Tgboolean;cdecl;external;
function gst_buffer_pool_get_config(pool:PGstBufferPool):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_buffer_pool_get_options(pool:PGstBufferPool):^Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_buffer_pool_has_option(pool:PGstBufferPool; option:Pgchar):Tgboolean;cdecl;external;
procedure gst_buffer_pool_set_flushing(pool:PGstBufferPool; flushing:Tgboolean);cdecl;external;
{ helpers for configuring the config structure  }
procedure gst_buffer_pool_config_set_params(config:PGstStructure; caps:PGstCaps; size:Tguint; min_buffers:Tguint; max_buffers:Tguint);cdecl;external;
function gst_buffer_pool_config_get_params(config:PGstStructure; caps:PPGstCaps; size:Pguint; min_buffers:Pguint; max_buffers:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_buffer_pool_config_set_allocator(config:PGstStructure; allocator:PGstAllocator; params:PGstAllocationParams);cdecl;external;
function gst_buffer_pool_config_get_allocator(config:PGstStructure; allocator:PPGstAllocator; params:PGstAllocationParams):Tgboolean;cdecl;external;
{ options  }
function gst_buffer_pool_config_n_options(config:PGstStructure):Tguint;cdecl;external;
(* Const before type ignored *)
procedure gst_buffer_pool_config_add_option(config:PGstStructure; option:Pgchar);cdecl;external;
(* Const before type ignored *)
function gst_buffer_pool_config_get_option(config:PGstStructure; index:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_buffer_pool_config_has_option(config:PGstStructure; option:Pgchar):Tgboolean;cdecl;external;
function gst_buffer_pool_config_validate_params(config:PGstStructure; caps:PGstCaps; size:Tguint; min_buffers:Tguint; max_buffers:Tguint):Tgboolean;cdecl;external;
{ buffer management  }
function gst_buffer_pool_acquire_buffer(pool:PGstBufferPool; buffer:PPGstBuffer; params:PGstBufferPoolAcquireParams):TGstFlowReturn;cdecl;external;
procedure gst_buffer_pool_release_buffer(pool:PGstBufferPool; buffer:PGstBuffer);cdecl;external;
{$endif}
{ __GST_BUFFER_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_BUFFER_POOL:=gst_buffer_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER_POOL(obj : longint) : longint;
begin
  GST_IS_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_BUFFER_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_BUFFER_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_BUFFER_POOL,GstBufferPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL(obj : longint) : longint;
begin
  GST_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_BUFFER_POOL,GstBufferPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL_CLASS(klass : longint) : longint;
begin
  GST_BUFFER_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_BUFFER_POOL,GstBufferPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_POOL_CAST(obj : longint) : PGstBufferPool;
begin
  GST_BUFFER_POOL_CAST:=PGstBufferPool(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_POOL_IS_FLUSHING(pool : longint) : longint;
begin
  GST_BUFFER_POOL_IS_FLUSHING:=g_atomic_int_get(@(pool^.flushing));
end;


end.
