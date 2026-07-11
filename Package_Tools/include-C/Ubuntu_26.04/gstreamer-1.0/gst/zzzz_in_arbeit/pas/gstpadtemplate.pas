unit gstpadtemplate;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *
 * gstpadtemplate.h: Header for GstPadTemplate object
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
{$ifndef __GST_PAD_TEMPLATE_H__}
{$define __GST_PAD_TEMPLATE_H__}
{$include <gst/gstconfig.h>}
type
{$include <gst/gstobject.h>}
{$include <gst/gstbuffer.h>}
{$include <gst/gstcaps.h>}
{$include <gst/gstevent.h>}
{$include <gst/gstquery.h>}
{$include <gst/gsttask.h>}

{ was #define dname def_expr }
function GST_TYPE_STATIC_PAD_TEMPLATE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_TYPE_PAD_TEMPLATE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE_CLASS(klass : longint) : longint;

{*
 * GstPadPresence:
 * @GST_PAD_ALWAYS: the pad is always available
 * @GST_PAD_SOMETIMES: the pad will become available depending on the media stream
 * @GST_PAD_REQUEST: the pad is only available on request with
 *  gst_element_request_pad().
 *
 * Indicates when this pad will become available.
  }
type
  PGstPadPresence = ^TGstPadPresence;
  TGstPadPresence =  Longint;
  Const
    GST_PAD_ALWAYS = 0;
    GST_PAD_SOMETIMES = 1;
    GST_PAD_REQUEST = 2;
;
{*
 * GstPadTemplateFlags:
 * @GST_PAD_TEMPLATE_FLAG_LAST: first flag that can be used by subclasses.
 *
 * Flags for the padtemplate
  }
{ padding  }
type
  PGstPadTemplateFlags = ^TGstPadTemplateFlags;
  TGstPadTemplateFlags =  Longint;
  Const
    GST_PAD_TEMPLATE_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 4;
;
{*
 * GST_PAD_TEMPLATE_IS_FIXED:
 * @templ: the template to query
 *
 * Check if the properties of the padtemplate are fixed
  }
{*
 * GstPadTemplate:
 *
 * The padtemplate object.
  }
{< private > }
type
  PGstPadTemplate = ^TGstPadTemplate;
  TGstPadTemplate = record
      object : TGstObject;
      name_template : Pgchar;
      direction : TGstPadDirection;
      presence : TGstPadPresence;
      caps : PGstCaps;
      ABI : record
          case longint of
            0 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
            1 : ( abi : record
                gtype : TGType;
                documentation_caps : PGstCaps;
              end );
          end;
    end;

{ signal callbacks  }
{< private > }
  PGstPadTemplateClass = ^TGstPadTemplateClass;
  TGstPadTemplateClass = record
      parent_class : TGstObjectClass;
      pad_created : procedure (templ:PGstPadTemplate; pad:PGstPad);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstStaticPadTemplate:
 * @name_template: the name of the template
 * @direction: the direction of the template
 * @presence: the presence of the template
 * @static_caps: the caps of the template.
 *
 * Structure describing the #GstStaticPadTemplate.
  }
  PGstStaticPadTemplate = ^TGstStaticPadTemplate;
  TGstStaticPadTemplate = record
      name_template : Pgchar;
      direction : TGstPadDirection;
      presence : TGstPadPresence;
      static_caps : TGstStaticCaps;
    end;

{*
 * GST_STATIC_PAD_TEMPLATE:
 * @padname: the name template of the pad
 * @dir: the GstPadDirection of the pad
 * @pres: the GstPadPresence of the pad
 * @caps: the GstStaticCaps of the pad
 *
 * Convenience macro to fill the values of a #GstStaticPadTemplate
 * structure.
 * Example:
 * |[<!-- language="C" -->
 * static GstStaticPadTemplate my_src_template = \
 *   GST_STATIC_PAD_TEMPLATE("src", GST_PAD_SRC, GST_PAD_ALWAYS,
 *                           GST_STATIC_CAPS_ANY);
 * ]|
  }

function gst_pad_template_get_type:TGType;cdecl;external libgstreamer;
{*
 * gst_static_pad_template_get_type: (attributes doc.skip=true)
  }
function gst_static_pad_template_get_type:TGType;cdecl;external libgstreamer;
function gst_pad_template_new(name_template:Pgchar; direction:TGstPadDirection; presence:TGstPadPresence; caps:PGstCaps):PGstPadTemplate;cdecl;external libgstreamer;
function gst_pad_template_new_with_gtype(name_template:Pgchar; direction:TGstPadDirection; presence:TGstPadPresence; caps:PGstCaps; pad_type:TGType):PGstPadTemplate;cdecl;external libgstreamer;
function gst_static_pad_template_get(pad_template:PGstStaticPadTemplate):PGstPadTemplate;cdecl;external libgstreamer;
function gst_pad_template_new_from_static_pad_template_with_gtype(pad_template:PGstStaticPadTemplate; pad_type:TGType):PGstPadTemplate;cdecl;external libgstreamer;
function gst_static_pad_template_get_caps(templ:PGstStaticPadTemplate):PGstCaps;cdecl;external libgstreamer;
function gst_pad_template_get_caps(templ:PGstPadTemplate):PGstCaps;cdecl;external libgstreamer;
procedure gst_pad_template_set_documentation_caps(templ:PGstPadTemplate; caps:PGstCaps);cdecl;external libgstreamer;
function gst_pad_template_get_documentation_caps(templ:PGstPadTemplate):PGstCaps;cdecl;external libgstreamer;
procedure gst_pad_template_pad_created(templ:PGstPadTemplate; pad:PGstPad);cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstPadTemplate, gst_object_unref) }
{$endif}
{ __GST_PAD_TEMPLATE_H__  }

// === Konventiert am: 11-7-26 15:17:47 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_STATIC_PAD_TEMPLATE : longint; { return type might be wrong }
  begin
    GST_TYPE_STATIC_PAD_TEMPLATE:=gst_static_pad_template_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_PAD_TEMPLATE : longint; { return type might be wrong }
  begin
    GST_TYPE_PAD_TEMPLATE:=gst_pad_template_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE(obj : longint) : longint;
begin
  GST_PAD_TEMPLATE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PAD_TEMPLATE,GstPadTemplate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_CLASS(klass : longint) : longint;
begin
  GST_PAD_TEMPLATE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PAD_TEMPLATE,GstPadTemplateClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE(obj : longint) : longint;
begin
  GST_IS_PAD_TEMPLATE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PAD_TEMPLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE_CLASS(klass : longint) : longint;
begin
  GST_IS_PAD_TEMPLATE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PAD_TEMPLATE);
end;


end.
