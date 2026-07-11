unit gstghostpad;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *                    2005 Andy Wingo <wingo@pobox.com>
 *
 * gstghostpad.h: Proxy pads
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
{$ifndef __GST_GHOST_PAD_H__}
{$define __GST_GHOST_PAD_H__}
{$include <gst/gstpad.h>}

{ was #define dname def_expr }
function GST_TYPE_PROXY_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_PAD_CLASS(klass : longint) : longint;

type
{< private > }
  PGstProxyPad = ^TGstProxyPad;
  TGstProxyPad = record
      pad : TGstPad;
      priv : PGstProxyPadPrivate;
    end;

{< private > }
  PGstProxyPadClass = ^TGstProxyPadClass;
  TGstProxyPadClass = record
      parent_class : TGstPadClass;
      _gst_reserved : array[0..0] of Tgpointer;
    end;


function gst_proxy_pad_get_type:TGType;cdecl;external libgstreamer;
function gst_proxy_pad_get_internal(pad:PGstProxyPad):PGstProxyPad;cdecl;external libgstreamer;
function gst_proxy_pad_iterate_internal_links_default(pad:PGstPad; parent:PGstObject):PGstIterator;cdecl;external libgstreamer;
function gst_proxy_pad_chain_default(pad:PGstPad; parent:PGstObject; buffer:PGstBuffer):TGstFlowReturn;cdecl;external libgstreamer;
function gst_proxy_pad_chain_list_default(pad:PGstPad; parent:PGstObject; list:PGstBufferList):TGstFlowReturn;cdecl;external libgstreamer;
function gst_proxy_pad_getrange_default(pad:PGstPad; parent:PGstObject; offset:Tguint64; size:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;external libgstreamer;
{ was #define dname def_expr }
function GST_TYPE_GHOST_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GHOST_PAD_CAST(obj : longint) : PGstGhostPad;

{*
 * GstGhostPad:
 *
 * Opaque #GstGhostPad structure.
  }
type
{< private > }
  PGstGhostPad = ^TGstGhostPad;
  TGstGhostPad = record
      pad : TGstProxyPad;
      priv : PGstGhostPadPrivate;
    end;

{< private > }
  PGstGhostPadClass = ^TGstGhostPadClass;
  TGstGhostPadClass = record
      parent_class : TGstProxyPadClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_ghost_pad_get_type:TGType;cdecl;external libgstreamer;
function gst_ghost_pad_new(name:Pgchar; target:PGstPad):PGstPad;cdecl;external libgstreamer;
function gst_ghost_pad_new_no_target(name:Pgchar; dir:TGstPadDirection):PGstPad;cdecl;external libgstreamer;
function gst_ghost_pad_new_from_template(name:Pgchar; target:PGstPad; templ:PGstPadTemplate):PGstPad;cdecl;external libgstreamer;
function gst_ghost_pad_new_no_target_from_template(name:Pgchar; templ:PGstPadTemplate):PGstPad;cdecl;external libgstreamer;
function gst_ghost_pad_get_target(gpad:PGstGhostPad):PGstPad;cdecl;external libgstreamer;
function gst_ghost_pad_set_target(gpad:PGstGhostPad; newtarget:PGstPad):Tgboolean;cdecl;external libgstreamer;
{ xxxxxxxGST_DEPRECATED }
function gst_ghost_pad_construct(gpad:PGstGhostPad):Tgboolean;cdecl;external libgstreamer;
function gst_ghost_pad_activate_mode_default(pad:PGstPad; parent:PGstObject; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;external libgstreamer;
function gst_ghost_pad_internal_activate_mode_default(pad:PGstPad; parent:PGstObject; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstGhostPad, gst_object_unref) }
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstProxyPad, gst_object_unref) }
{$endif}
{ __GST_GHOST_PAD_H__  }

// === Konventiert am: 11-7-26 11:30:58 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_PROXY_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_PROXY_PAD:=gst_proxy_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_PAD(obj : longint) : longint;
begin
  GST_IS_PROXY_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PROXY_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_PROXY_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PROXY_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_PAD(obj : longint) : longint;
begin
  GST_PROXY_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PROXY_PAD,GstProxyPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_PAD_CLASS(klass : longint) : longint;
begin
  GST_PROXY_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PROXY_PAD,GstProxyPadClass);
end;

{ was #define dname def_expr }
function GST_TYPE_GHOST_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_GHOST_PAD:=gst_ghost_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD(obj : longint) : longint;
begin
  GST_IS_GHOST_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GHOST_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_GHOST_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GHOST_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD(obj : longint) : longint;
begin
  GST_GHOST_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GHOST_PAD,GstGhostPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD_CLASS(klass : longint) : longint;
begin
  GST_GHOST_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GHOST_PAD,GstGhostPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GHOST_PAD_CAST(obj : longint) : PGstGhostPad;
begin
  GST_GHOST_PAD_CAST:=PGstGhostPad(obj);
end;


end.
