
unit gstbasetransform;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbasetransform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbasetransform.h
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
Pgsize  = ^gsize;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBaseTransform  = ^GstBaseTransform;
PGstBaseTransformClass  = ^GstBaseTransformClass;
PGstBaseTransformPrivate  = ^GstBaseTransformPrivate;
PGstBuffer  = ^GstBuffer;
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstEvent  = ^GstEvent;
PGstMeta  = ^GstMeta;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2005 Wim Taymans <wim@fluendo.com>
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
{$ifndef __GST_BASE_TRANSFORM_H__}
{$define __GST_BASE_TRANSFORM_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_BASE_TRANSFORM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_TRANSFORM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_TRANSFORM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_TRANSFORM_CAST(obj : longint) : PGstBaseTransform;

{*
 * GST_BASE_TRANSFORM_SINK_NAME:
 *
 * The name of the templates for the sink pad.
  }
const
  GST_BASE_TRANSFORM_SINK_NAME = 'sink';  
{*
 * GST_BASE_TRANSFORM_SRC_NAME:
 *
 * The name of the templates for the source pad.
  }
  GST_BASE_TRANSFORM_SRC_NAME = 'src';  
{*
 * GST_BASE_TRANSFORM_SRC_PAD:
 * @obj: base transform instance
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BASE_TRANSFORM_SRC_PAD(obj : longint) : longint;

{*
 * GST_BASE_TRANSFORM_SINK_PAD:
 * @obj: base transform instance
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_SINK_PAD(obj : longint) : longint;

{*
 * GST_BASE_TRANSFORM_FLOW_DROPPED:
 *
 * A #GstFlowReturn that can be returned from transform and transform_ip to
 * indicate that no output buffer was generated.
  }
const
  GST_BASE_TRANSFORM_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS;  
type
{*
 * GstBaseTransform:
 *
 * The opaque #GstBaseTransform data structure.
  }
{< protected > }
{ source and sink pads  }
{ MT-protected (with STREAM_LOCK)  }
{ Default submit_input_buffer places the buffer here,
   * for consumption by the generate_output method:  }
{< private > }
  PGstBaseTransform = ^TGstBaseTransform;
  TGstBaseTransform = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      have_segment : Tgboolean;
      segment : TGstSegment;
      queued_buf : PGstBuffer;
      priv : PGstBaseTransformPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE-1)-1] of Tgpointer;
    end;

{*
 * GstBaseTransformClass:
 * @parent_class:   Element parent class
 * @passthrough_on_same_caps: If set to %TRUE, passthrough mode will be
 *                            automatically enabled if the caps are the same.
 *                            Set to %FALSE by default.
 * @transform_ip_on_passthrough: If set to %TRUE, @transform_ip will be called in
 *                           passthrough mode. The passed buffer might not be
 *                           writable. When %FALSE, neither @transform nor
 *                           @transform_ip will be called in passthrough mode.
 *                           Set to %TRUE by default.
 * @transform_caps: Optional.  Given the pad in this direction and the given
 *                  caps, what caps are allowed on the other pad in this
 *                  element ?
 * @fixate_caps:    Optional. Given the pad in this direction and the given
 *                  caps, fixate the caps on the other pad. The function takes
 *                  ownership of @othercaps and returns a fixated version of
 *                  @othercaps. @othercaps is not guaranteed to be writable.
 * @accept_caps:    Optional.
 *                  Subclasses can override this method to check if @caps can be
 *                  handled by the element. The default implementation might not be
 *                  the most optimal way to check this in all cases.
 * @set_caps:       Allows the subclass to be notified of the actual caps set.
 * @query:          Optional.
 *                  Handle a requested query. Subclasses that implement this
 *                  must chain up to the parent if they didn't handle the
 *                  query
 * @decide_allocation: Setup the allocation parameters for allocating output
 *                    buffers. The passed in query contains the result of the
 *                    downstream allocation query. This function is only called
 *                    when not operating in passthrough mode. The default
 *                    implementation will remove all memory dependent metadata.
 *                    If there is a @filter_meta method implementation, it will
 *                    be called for all metadata API in the downstream query,
 *                    otherwise the metadata API is removed.
 * @filter_meta: Return %TRUE if the metadata API should be proposed in the
 *               upstream allocation query. The default implementation is %NULL
 *               and will cause all metadata to be removed.
 * @propose_allocation: Propose buffer allocation parameters for upstream elements.
 *                      This function must be implemented if the element reads or
 *                      writes the buffer content. The query that was passed to
 *                      the decide_allocation is passed in this method (or %NULL
 *                      when the element is in passthrough mode). The default
 *                      implementation will pass the query downstream when in
 *                      passthrough mode and will copy all the filtered metadata
 *                      API in non-passthrough mode.
 * @transform_size: Optional. Given the size of a buffer in the given direction
 *                  with the given caps, calculate the size in bytes of a buffer
 *                  on the other pad with the given other caps.
 *                  The default implementation uses get_unit_size and keeps
 *                  the number of units the same.
 * @get_unit_size:  Required if the transform is not in-place.
 *                  Get the size in bytes of one unit for the given caps.
 * @start:          Optional.
 *                  Called when the element starts processing.
 *                  Allows opening external resources.
 * @stop:           Optional.
 *                  Called when the element stops processing.
 *                  Allows closing external resources.
 * @sink_event:     Optional.
 *                  Event handler on the sink pad. The default implementation
 *                  handles the event and forwards it downstream.
 * @src_event:      Optional.
 *                  Event handler on the source pad. The default implementation
 *                  handles the event and forwards it upstream.
 * @prepare_output_buffer: Optional.
 *                         Subclasses can override this to do their own
 *                         allocation of output buffers.  Elements that only do
 *                         analysis can return a subbuffer or even just
 *                         return a reference to the input buffer (if in
 *                         passthrough mode). The default implementation will
 *                         use the negotiated allocator or bufferpool and
 *                         transform_size to allocate an output buffer or it
 *                         will return the input buffer in passthrough mode.
 * @copy_metadata: Optional.
 *                 Copy the metadata from the input buffer to the output buffer.
 *                 The default implementation will copy the flags, timestamps and
 *                 offsets of the buffer.
 * @transform_meta: Optional. Transform the metadata on the input buffer to the
 *                  output buffer. By default this method copies all meta without
 *                  tags. Subclasses can implement this method and return %TRUE if
 *                  the metadata is to be copied.
 * @before_transform: Optional.
 *                    This method is called right before the base class will
 *                    start processing. Dynamic properties or other delayed
 *                    configuration could be performed in this method.
 * @transform:      Required if the element does not operate in-place.
 *                  Transforms one incoming buffer to one outgoing buffer.
 *                  The function is allowed to change size/timestamp/duration
 *                  of the outgoing buffer.
 * @transform_ip:   Required if the element operates in-place.
 *                  Transform the incoming buffer in-place.
 * @submit_input_buffer: Function which accepts a new input buffer and pre-processes it.
 *                  The default implementation performs caps (re)negotiation, then
 *                  QoS if needed, and places the input buffer into the @queued_buf
 *                  member variable. If the buffer is dropped due to QoS, it returns
 *                  GST_BASE_TRANSFORM_FLOW_DROPPED. If this input buffer is not
 *                  contiguous with any previous input buffer, then @is_discont
 *                  is set to %TRUE. (Since: 1.6)
 * @generate_output: Called after each new input buffer is submitted repeatedly
 *                   until it either generates an error or fails to generate an output
 *                   buffer. The default implementation takes the contents of the
 *                   @queued_buf variable, generates an output buffer if needed
 *                   by calling the class @prepare_output_buffer, and then
 *                   calls either @transform or @transform_ip. Elements that don't
 *                   do 1-to-1 transformations of input to output buffers can either
 *                   return GST_BASE_TRANSFORM_FLOW_DROPPED or simply not generate
 *                   an output buffer until they are ready to do so. (Since: 1.6)
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At minimum either @transform or @transform_ip need to be overridden.
 * If the element can overwrite the input data with the results (data is of the
 * same type and quantity) it should provide @transform_ip.
  }
{< public > }
{ virtual methods for subclasses  }
{*
   * GstBaseTransformClass::fixate_caps:
   * @othercaps: (transfer full):
    }
{ decide allocation query for output buffers  }
(* Const before type ignored *)
{ propose allocation query parameters for input buffers  }
{*
   * GstBaseTransformClass::transform_size:
   * @othersize: (out):
    }
{*
   * GstBaseTransformClass::get_unit_size:
   * @size: (out):
    }
{ states  }
{ sink and src pad event handlers  }
{*
   * GstBaseTransformClass::sink_event:
   * @event: (transfer full):
    }
{*
   * GstBaseTransformClass::src_event:
   * @event: (transfer full):
    }
{*
   * GstBaseTransformClass::prepare_output_buffer:
   * @outbuf: (out):
    }
{ metadata  }
{ transform  }
{*
   * GstBaseTransformClass::generate_output:
   * @outbuf: (out):
    }
{< private > }
  PGstBaseTransformClass = ^TGstBaseTransformClass;
  TGstBaseTransformClass = record
      parent_class : TGstElementClass;
      passthrough_on_same_caps : Tgboolean;
      transform_ip_on_passthrough : Tgboolean;
      transform_caps : function (trans:PGstBaseTransform; direction:TGstPadDirection; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;
      fixate_caps : function (trans:PGstBaseTransform; direction:TGstPadDirection; caps:PGstCaps; othercaps:PGstCaps):PGstCaps;cdecl;
      accept_caps : function (trans:PGstBaseTransform; direction:TGstPadDirection; caps:PGstCaps):Tgboolean;cdecl;
      set_caps : function (trans:PGstBaseTransform; incaps:PGstCaps; outcaps:PGstCaps):Tgboolean;cdecl;
      query : function (trans:PGstBaseTransform; direction:TGstPadDirection; query:PGstQuery):Tgboolean;cdecl;
      decide_allocation : function (trans:PGstBaseTransform; query:PGstQuery):Tgboolean;cdecl;
      filter_meta : function (trans:PGstBaseTransform; query:PGstQuery; api:TGType; params:PGstStructure):Tgboolean;cdecl;
      propose_allocation : function (trans:PGstBaseTransform; decide_query:PGstQuery; query:PGstQuery):Tgboolean;cdecl;
      transform_size : function (trans:PGstBaseTransform; direction:TGstPadDirection; caps:PGstCaps; size:Tgsize; othercaps:PGstCaps; 
                   othersize:Pgsize):Tgboolean;cdecl;
      get_unit_size : function (trans:PGstBaseTransform; caps:PGstCaps; size:Pgsize):Tgboolean;cdecl;
      start : function (trans:PGstBaseTransform):Tgboolean;cdecl;
      stop : function (trans:PGstBaseTransform):Tgboolean;cdecl;
      sink_event : function (trans:PGstBaseTransform; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (trans:PGstBaseTransform; event:PGstEvent):Tgboolean;cdecl;
      prepare_output_buffer : function (trans:PGstBaseTransform; input:PGstBuffer; outbuf:PPGstBuffer):TGstFlowReturn;cdecl;
      copy_metadata : function (trans:PGstBaseTransform; input:PGstBuffer; outbuf:PGstBuffer):Tgboolean;cdecl;
      transform_meta : function (trans:PGstBaseTransform; outbuf:PGstBuffer; meta:PGstMeta; inbuf:PGstBuffer):Tgboolean;cdecl;
      before_transform : procedure (trans:PGstBaseTransform; buffer:PGstBuffer);cdecl;
      transform : function (trans:PGstBaseTransform; inbuf:PGstBuffer; outbuf:PGstBuffer):TGstFlowReturn;cdecl;
      transform_ip : function (trans:PGstBaseTransform; buf:PGstBuffer):TGstFlowReturn;cdecl;
      submit_input_buffer : function (trans:PGstBaseTransform; is_discont:Tgboolean; input:PGstBuffer):TGstFlowReturn;cdecl;
      generate_output : function (trans:PGstBaseTransform; outbuf:PPGstBuffer):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-2)-1] of Tgpointer;
    end;


function gst_base_transform_get_type:TGType;cdecl;external;
procedure gst_base_transform_set_passthrough(trans:PGstBaseTransform; passthrough:Tgboolean);cdecl;external;
function gst_base_transform_is_passthrough(trans:PGstBaseTransform):Tgboolean;cdecl;external;
procedure gst_base_transform_set_in_place(trans:PGstBaseTransform; in_place:Tgboolean);cdecl;external;
function gst_base_transform_is_in_place(trans:PGstBaseTransform):Tgboolean;cdecl;external;
procedure gst_base_transform_update_qos(trans:PGstBaseTransform; proportion:Tgdouble; diff:TGstClockTimeDiff; timestamp:TGstClockTime);cdecl;external;
procedure gst_base_transform_set_qos_enabled(trans:PGstBaseTransform; enabled:Tgboolean);cdecl;external;
function gst_base_transform_is_qos_enabled(trans:PGstBaseTransform):Tgboolean;cdecl;external;
procedure gst_base_transform_set_gap_aware(trans:PGstBaseTransform; gap_aware:Tgboolean);cdecl;external;
procedure gst_base_transform_set_prefer_passthrough(trans:PGstBaseTransform; prefer_passthrough:Tgboolean);cdecl;external;
function gst_base_transform_get_buffer_pool(trans:PGstBaseTransform):PGstBufferPool;cdecl;external;
procedure gst_base_transform_get_allocator(trans:PGstBaseTransform; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
procedure gst_base_transform_reconfigure_sink(trans:PGstBaseTransform);cdecl;external;
procedure gst_base_transform_reconfigure_src(trans:PGstBaseTransform);cdecl;external;
function gst_base_transform_update_src_caps(trans:PGstBaseTransform; updated_caps:PGstCaps):Tgboolean;cdecl;external;
function gst_base_transform_reconfigure(trans:PGstBaseTransform):Tgboolean;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstBaseTransform, gst_object_unref) }
{$endif}
{ __GST_BASE_TRANSFORM_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BASE_TRANSFORM : longint; { return type might be wrong }
  begin
    GST_TYPE_BASE_TRANSFORM:=gst_base_transform_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM(obj : longint) : longint;
begin
  GST_BASE_TRANSFORM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_BASE_TRANSFORM,GstBaseTransform);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_CLASS(klass : longint) : longint;
begin
  GST_BASE_TRANSFORM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_BASE_TRANSFORM,GstBaseTransformClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_GET_CLASS(obj : longint) : longint;
begin
  GST_BASE_TRANSFORM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_BASE_TRANSFORM,GstBaseTransformClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_TRANSFORM(obj : longint) : longint;
begin
  GST_IS_BASE_TRANSFORM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_BASE_TRANSFORM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_TRANSFORM_CLASS(klass : longint) : longint;
begin
  GST_IS_BASE_TRANSFORM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_BASE_TRANSFORM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_TRANSFORM_CAST(obj : longint) : PGstBaseTransform;
begin
  GST_BASE_TRANSFORM_CAST:=PGstBaseTransform(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_SRC_PAD(obj : longint) : longint;
begin
  GST_BASE_TRANSFORM_SRC_PAD:=(GST_BASE_TRANSFORM_CAST(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_TRANSFORM_SINK_PAD(obj : longint) : longint;
begin
  GST_BASE_TRANSFORM_SINK_PAD:=(GST_BASE_TRANSFORM_CAST(obj))^.sinkpad;
end;


end.
