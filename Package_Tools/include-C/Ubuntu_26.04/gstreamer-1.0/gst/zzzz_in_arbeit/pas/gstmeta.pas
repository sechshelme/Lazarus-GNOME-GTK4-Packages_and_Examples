unit gstmeta;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009 Wim Taymans <wim.taymans@gmail.be>
 *
 * gstmeta.h: Header for Metadata structures
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
{$ifndef __GST_META_H__}
{$define __GST_META_H__}
{$include <glib.h>}
{$include <gst/gstbytearrayinterface.h>}
{$include <gst/gststructure.h>}
type
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_META_CAST(meta : longint) : PGstMeta;

{*
 * GstMetaFlags:
 * @GST_META_FLAG_NONE: no flags
 * @GST_META_FLAG_READONLY: metadata should not be modified
 * @GST_META_FLAG_POOLED: metadata is managed by a bufferpool
 * @GST_META_FLAG_LOCKED: metadata should not be removed
 * @GST_META_FLAG_LAST: additional flags can be added starting from this flag.
 *
 * Extra metadata flags.
  }
type
  PGstMetaFlags = ^TGstMetaFlags;
  TGstMetaFlags =  Longint;
  Const
    GST_META_FLAG_NONE = 0;
    GST_META_FLAG_READONLY = 1 shl 0;
    GST_META_FLAG_POOLED = 1 shl 1;
    GST_META_FLAG_LOCKED = 1 shl 2;
    GST_META_FLAG_LAST = 1 shl 16;
;
  GST_META_TAG_MEMORY_STR = 'memory';  
{*
 * GST_META_TAG_MEMORY_REFERENCE_STR:
 *
 * This metadata stays relevant until a deep copy is made.
 *
 * Since: 1.20.4
  }
  GST_META_TAG_MEMORY_REFERENCE_STR = 'memory-reference';  
{*
 * GstMeta:
 * @flags: extra flags for the metadata
 * @info: pointer to the #GstMetaInfo
 *
 * Base structure for metadata. Custom metadata will put this structure
 * as the first member of their structure.
  }
type
  PGstMeta = ^TGstMeta;
  TGstMeta = record
      flags : TGstMetaFlags;
      info : PGstMetaInfo;
    end;

{*
 * GstCustomMeta.structure:
 *
 * #GstStructure containing custom metadata.
 *
 * Since: 1.24
  }
{*
 * GstCustomMeta:
 * @meta: parent #GstMeta
 * @structure: a #GstStructure containing custom metadata. (Since: 1.24)
 *
 * Extra custom metadata. The @structure field is the same as returned by
 * gst_custom_meta_get_structure().
 *
 * Since 1.24 it can be serialized using gst_meta_serialize() and
 * gst_meta_deserialize(), but only if the #GstStructure does not contain any
 * fields that cannot be serialized, see %GST_SERIALIZE_FLAG_STRICT.
 *
 * Since: 1.20
  }

  PGstCustomMeta = ^TGstCustomMeta;
  TGstCustomMeta = record
      meta : TGstMeta;
      structure : PGstStructure;
    end;
{$include <gst/gstbuffer.h>}
{*
 * GstMetaInitFunction:
 * @meta: a #GstMeta
 * @params: parameters passed to the init function
 * @buffer: a #GstBuffer
 *
 * Function called when @meta is initialized in @buffer.
  }
type

  TGstMetaInitFunction = function (meta:PGstMeta; params:Tgpointer; buffer:PGstBuffer):Tgboolean;cdecl;
{*
 * GstMetaFreeFunction:
 * @meta: a #GstMeta
 * @buffer: a #GstBuffer
 *
 * Function called when @meta is freed in @buffer.
  }

  TGstMetaFreeFunction = procedure (meta:PGstMeta; buffer:PGstBuffer);cdecl;
{*
 * gst_meta_transform_copy:
 *
 * GQuark for the "gst-copy" transform.
  }
  var
    _gst_meta_transform_copy : TGQuark;cvar;external libgstreamer;
{*
 * GST_META_TRANSFORM_IS_COPY:
 * @type: a transform type
 *
 * Check if the transform type is a copy transform
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_META_TRANSFORM_IS_COPY(_type : longint) : longint;

{*
 * GstMetaTransformCopy:
 * @region: %TRUE if only region is copied
 * @offset: the offset to copy, 0 if @region is %FALSE, otherwise > 0
 * @size: the size to copy, -1 or the buffer size when @region is %FALSE
 *
 * Extra data passed to a "gst-copy" transform #GstMetaTransformFunction.
  }
type
  PGstMetaTransformCopy = ^TGstMetaTransformCopy;
  TGstMetaTransformCopy = record
      region : Tgboolean;
      offset : Tgsize;
      size : Tgsize;
    end;
{*
 * GstMetaTransformFunction:
 * @transbuf: a #GstBuffer
 * @meta: a #GstMeta
 * @buffer: a #GstBuffer
 * @type: the transform type
 * @data: transform specific data.
 *
 * Function called for each @meta in @buffer as a result of performing a
 * transformation on @transbuf. Additional @type specific transform data
 * is passed to the function as @data.
 *
 * Implementations should check the @type of the transform and parse
 * additional type specific fields in @data that should be used to update
 * the metadata on @transbuf.
 *
 * Returns: %TRUE if the transform could be performed
  }

  TGstMetaTransformFunction = function (transbuf:PGstBuffer; meta:PGstMeta; buffer:PGstBuffer; _type:TGQuark; data:Tgpointer):Tgboolean;cdecl;
{*
 * GstCustomMetaTransformFunction:
 * @transbuf: a #GstBuffer
 * @meta: a #GstCustomMeta
 * @buffer: a #GstBuffer
 * @type: the transform type
 * @data: transform specific data.
 * @user_data: user data passed when registering the meta
 *
 * Function called for each @meta in @buffer as a result of performing a
 * transformation that yields @transbuf. Additional @type specific transform
 * data is passed to the function as @data.
 *
 * Implementations should check the @type of the transform and parse
 * additional type specific fields in @data that should be used to update
 * the metadata on @transbuf.
 *
 * Returns: %TRUE if the transform could be performed
 * Since: 1.20
  }

  TGstCustomMetaTransformFunction = function (transbuf:PGstBuffer; meta:PGstCustomMeta; buffer:PGstBuffer; _type:TGQuark; data:Tgpointer; 
               user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstMetaSerializeFunction:
 * @meta: a #GstMeta
 * @data: #GstByteArrayInterface to append serialization data
 * @version: (out): version of the serialization format
 *
 * Serialize @meta into a format that can be stored or transmitted and later
 * deserialized by #GstMetaDeserializeFunction.
 *
 * By default version is set to 0, it should be bumped if incompatible changes
 * are made to the format so %GstMetaDeserializeFunction can deserialize each
 * version.
 *
 * Returns: %TRUE on success, %FALSE otherwise.
 *
 * Since: 1.24
  }

  TGstMetaSerializeFunction = function (meta:PGstMeta; data:PGstByteArrayInterface; version:Pguint8):Tgboolean;cdecl;
{*
 * GstMetaDeserializeFunction:
 * @info: #GstMetaInfo of the meta
 * @buffer: a #GstBuffer
 * @data: data obtained from #GstMetaSerializeFunction
 * @size: size of data to avoid buffer overflow
 *
 * Recreate a #GstMeta from serialized data returned by
 * #GstMetaSerializeFunction and add it to @buffer.
 *
 * Returns: (transfer none) (nullable): the metadata owned by @buffer, or %NULL.
 *
 * Since: 1.24
  }

  PGstMetaDeserializeFunction = ^TGstMetaDeserializeFunction;
  TGstMetaDeserializeFunction = function (info:PGstMetaInfo; buffer:PGstBuffer; data:Pguint8; size:Tgsize; version:Tguint8):PGstMeta;cdecl;
{*
 * GstMetaClearFunction:
 * @buffer: a #GstBuffer
 * @meta: a #GstMeta
 *
 * Clears the content of the meta. This will be called by the GstBufferPool
 * when a pooled buffer is returned.
 *
 * Since: 1.24
  }

  TGstMetaClearFunction = procedure (buffer:PGstBuffer; meta:PGstMeta);cdecl;
{*
 * GstAllocationMetaParamsAggregator:
 * @aggregated_params: This structure will be updated with the
 *                     combined parameters from both @params0 and @params1.
 * @params0: a #GstStructure containing the new parameters to be aggregated.
 * @params1: a #GstStructure containing the new parameters to be aggregated.
 *
 * The aggregator function will combine the parameters from @params0 and @param1
 * and write the result back into @aggregated_params.
 *
 * Returns: %TRUE if the parameters were successfully aggregated, %FALSE otherwise.
 *
 * Since: 1.26
  }

  TGstAllocationMetaParamsAggregator = function (aggregated_params:PPGstStructure; params0:PGstStructure; params1:PGstStructure):Tgboolean;cdecl;
{*
 * GstMetaInfo.serialize_func:
 *
 * Function for serializing the metadata, or %NULL if not supported by this
 * meta.
 *
 * Since: 1.24
  }
{*
 * GstMetaInfo.deserialize_func:
 *
 * Function for deserializing the metadata, or %NULL if not supported by this
 * meta.
 *
 * Since: 1.24
  }
{*
 * GstMetaInfo.clear_func:
 *
 * Function for clearing the metadata, or %NULL if not supported by this
 * meta. This is called by the buffer pool when a buffer is returned for
 * pooled metas.
 *
 * Since: 1.24
  }
{*
 * GstMetaInfo:
 * @api: tag identifying the metadata structure and api
 * @type: type identifying the implementor of the api
 * @size: size of the metadata
 * @init_func: function for initializing the metadata
 * @free_func: function for freeing the metadata
 * @transform_func: function for transforming the metadata
 * @serialize_func: function for serializing the metadata into a #GstStructure,
 *  or %NULL if not supported by this meta. (Since 1.24)
 * @deserialize_func: function for deserializing the metadata from a
 *  #GstStructure, or %NULL if not supported by this meta. (Since 1.24)
 *
 * The #GstMetaInfo provides information about a specific metadata
 * structure.
  }
{ No padding needed, GstMetaInfo is always allocated by GStreamer and is
   * not subclassable or stack-allocatable, so we can extend it as we please
   * just like interfaces  }
  PGstMetaInfo = ^TGstMetaInfo;
  TGstMetaInfo = record
      api : TGType;cdecl;
      _type : TGType;
      size : Tgsize;
      init_func : TGstMetaInitFunction;
      free_func : TGstMetaFreeFunction;
      transform_func : TGstMetaTransformFunction;
      serialize_func : TGstMetaSerializeFunction;
      deserialize_func : TGstMetaDeserializeFunction;
      clear_func : TGstMetaClearFunction;
    end;


function gst_meta_api_type_register(api:Pgchar; tags:PPgchar):TGType;cdecl;external libgstreamer;
function gst_meta_api_type_has_tag(api:TGType; tag:TGQuark):Tgboolean;cdecl;external libgstreamer;
function gst_meta_api_type_aggregate_params(api:TGType; aggregated_params:PPGstStructure; params0:PGstStructure; params1:PGstStructure):Tgboolean;cdecl;external libgstreamer;
procedure gst_meta_api_type_set_params_aggregator(api:TGType; aggregator:TGstAllocationMetaParamsAggregator);cdecl;external libgstreamer;
function gst_meta_register(api:TGType; impl:Pgchar; size:Tgsize; init_func:TGstMetaInitFunction; free_func:TGstMetaFreeFunction; 
           transform_func:TGstMetaTransformFunction):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_info_new(api:TGType; impl:Pgchar; size:Tgsize):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_info_register(info:PGstMetaInfo):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_register_custom(name:Pgchar; tags:PPgchar; transform_func:TGstCustomMetaTransformFunction; user_data:Tgpointer; destroy_data:TGDestroyNotify):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_register_custom_simple(name:Pgchar):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_info_is_custom(info:PGstMetaInfo):Tgboolean;cdecl;external libgstreamer;
function gst_custom_meta_get_structure(meta:PGstCustomMeta):PGstStructure;cdecl;external libgstreamer;
function gst_custom_meta_has_name(meta:PGstCustomMeta; name:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_meta_get_info(impl:Pgchar):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_api_type_get_tags(api:TGType):^Pgchar;cdecl;external libgstreamer;
function gst_meta_api_type_tags_contain_only(api:TGType; valid_tags:PPgchar):Tgboolean;cdecl;external libgstreamer;
function gst_meta_get_seqnum(meta:PGstMeta):Tguint64;cdecl;external libgstreamer;
function gst_meta_compare_seqnum(meta1:PGstMeta; meta2:PGstMeta):Tgint;cdecl;external libgstreamer;
function gst_meta_serialize(meta:PGstMeta; data:PGstByteArrayInterface):Tgboolean;cdecl;external libgstreamer;
function gst_meta_serialize_simple(meta:PGstMeta; data:PGByteArray):Tgboolean;cdecl;external libgstreamer;
function gst_meta_deserialize(buffer:PGstBuffer; data:Pguint8; size:Tgsize; consumed:Pguint32):PGstMeta;cdecl;external libgstreamer;
{ some default tags  }
  var
    _gst_meta_tag_memory : TGQuark;cvar;external libgstreamer;
    _gst_meta_tag_memory_reference : TGQuark;cvar;external libgstreamer;
{*
 * GST_META_TAG_MEMORY:
 *
 * Metadata tagged with this tag depends on the particular memory
 * or buffer that it is on.
 *
 * Deprecated: The GQuarks are not exported by any public API, use
 *   GST_META_TAG_MEMORY_STR instead.
  }
{$ifndef GST_DISABLE_DEPRECATED}

const
  GST_META_TAG_MEMORY = _gst_meta_tag_memory;  
{$endif}
{$endif}
{ __GST_META_H__  }

// === Konventiert am: 11-7-26 15:18:37 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_META_CAST(meta : longint) : PGstMeta;
begin
  GST_META_CAST:=PGstMeta(meta);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_META_TRANSFORM_IS_COPY(_type : longint) : longint;
begin
  GST_META_TRANSFORM_IS_COPY:=_type=_gst_meta_transform_copy;
end;


end.
