unit gstchildproxy;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 Stefan Kost <ensonic@users.sf.net>
 *
 * gstchildproxy.h: interface header for multi child elements
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
{$ifndef __GST_CHILD_PROXY_H__}
{$define __GST_CHILD_PROXY_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}

{*
 * GstChildProxy:
 *
 * Opaque #GstChildProxy data structure.
  }
type
{ dummy object  }
{*
 * GstChildProxyInterface:
 * @parent: parent interface type.
 *
 * #GstChildProxy interface.
  }
{ methods  }
{*
   * GstChildProxyInterface.get_child_by_name:
   * @parent: the #GstChildProxy
   * @name: the name of the child to fetch
   *
   * Fetch a child object by name
   *
   * Returns: (transfer full) (nullable): the child object
    }
{*
   * GstChildProxyInterface.get_child_by_index:
   * @parent: the #GstChildProxy
   * @index: the index of the child to fetch
   *
   * Fetch a child object by index
   *
   * Returns: (transfer full) (nullable): the child object
    }
{*
   * GstChildProxyInterface.get_children_count:
   * @parent: the #GstChildProxy
   *
   * Get the number of children in @parent
   *
   * Returns: the number of children
    }
{< private > }
{ signals  }
{*
   * GstChildProxyInterface.child_added:
   * @parent: the #GstChildProxy
   * @child: the child object
   * @name: the name of the child object
   *
   * Called when @child is added to @parent
    }
{*
   * GstChildProxyInterface.child_removed:
   * @parent: the #GstChildProxy
   * @child: the child object
   * @name: the name of the child object
   *
   * Called when @child is removed from @parent
    }
{< private > }
  PGstChildProxyInterface = ^TGstChildProxyInterface;
  TGstChildProxyInterface = record
      parent : TGTypeInterface;
      get_child_by_name : function (parent:PGstChildProxy; name:Pgchar):PGObject;cdecl;
      get_child_by_index : function (parent:PGstChildProxy; index:Tguint):PGObject;cdecl;
      get_children_count : function (parent:PGstChildProxy):Tguint;cdecl;
      child_added : procedure (parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;
      child_removed : procedure (parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_child_proxy_get_type:TGType;cdecl;external libgstreamer;
function gst_child_proxy_get_child_by_name(parent:PGstChildProxy; name:Pgchar):PGObject;cdecl;external libgstreamer;
function gst_child_proxy_get_child_by_name_recurse(child_proxy:PGstChildProxy; name:Pgchar):PGObject;cdecl;external libgstreamer;
function gst_child_proxy_get_children_count(parent:PGstChildProxy):Tguint;cdecl;external libgstreamer;
function gst_child_proxy_get_child_by_index(parent:PGstChildProxy; index:Tguint):PGObject;cdecl;external libgstreamer;
function gst_child_proxy_lookup(object:PGstChildProxy; name:Pgchar; target:PPGObject; pspec:PPGParamSpec):Tgboolean;cdecl;external libgstreamer;
procedure gst_child_proxy_get_property(object:PGstChildProxy; name:Pgchar; value:PGValue);cdecl;external libgstreamer;
procedure gst_child_proxy_get_valist(object:PGstChildProxy; first_property_name:Pgchar; var_args:Tva_list);cdecl;external libgstreamer;
procedure gst_child_proxy_get(object:PGstChildProxy; first_property_name:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_child_proxy_get(object:PGstChildProxy; first_property_name:Pgchar);cdecl;external libgstreamer;
procedure gst_child_proxy_set_property(object:PGstChildProxy; name:Pgchar; value:PGValue);cdecl;external libgstreamer;
procedure gst_child_proxy_set_valist(object:PGstChildProxy; first_property_name:Pgchar; var_args:Tva_list);cdecl;external libgstreamer;
procedure gst_child_proxy_set(object:PGstChildProxy; first_property_name:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_child_proxy_set(object:PGstChildProxy; first_property_name:Pgchar);cdecl;external libgstreamer;
procedure gst_child_proxy_child_added(parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;external libgstreamer;
procedure gst_child_proxy_child_removed(parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;external libgstreamer;
{$endif}
{ __GST_CHILD_PROXY_H__  }

// === Konventiert am: 10-7-26 19:56:47 ===

function GST_TYPE_CHILD_PROXY : TGType;
function GST_CHILD_PROXY(obj : Pointer) : PGstChildProxy;
function GST_IS_CHILD_PROXY(obj : Pointer) : Tgboolean;
function GST_CHILD_PROXY_GET_INTERFACE(obj : Pointer) : PGstChildProxyInterface;

implementation

function GST_TYPE_CHILD_PROXY : TGType;
  begin
    GST_TYPE_CHILD_PROXY:=gst_child_proxy_get_type;
  end;

function GST_CHILD_PROXY(obj : Pointer) : PGstChildProxy;
begin
  Result := PGstChildProxy(g_type_check_instance_cast(obj, GST_TYPE_CHILD_PROXY));
end;

function GST_IS_CHILD_PROXY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_CHILD_PROXY);
end;

function GST_CHILD_PROXY_GET_INTERFACE(obj : Pointer) : PGstChildProxyInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_CHILD_PROXY);
end;



end.
