
unit gstbin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbin.h
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
PGList  = ^GList;
PGstBin  = ^GstBin;
PGstBinClass  = ^GstBinClass;
PGstBinFlags  = ^GstBinFlags;
PGstBinPrivate  = ^GstBinPrivate;
PGstBus  = ^GstBus;
PGstClock  = ^GstClock;
PGstElement  = ^GstElement;
PGstIterator  = ^GstIterator;
PGstMessage  = ^GstMessage;
PGThreadPool  = ^GThreadPool;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstbin.h: Header for GstBin container object
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
{$ifndef __GST_BIN_H__}
{$define __GST_BIN_H__}
{$include <gst/gstelement.h>}
{$include <gst/gstiterator.h>}
{$include <gst/gstbus.h>}

{ was #define dname def_expr }
function GST_TYPE_BIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BIN_CAST(obj : longint) : PGstBin;

{*
 * GstBinFlags:
 * @GST_BIN_FLAG_LAST: the last enum in the series of flags for bins.
 * Derived classes can use this as first value in a list of flags.
 *
 * GstBinFlags are a set of flags specific to bins. Most are set/used
 * internally. They can be checked using the GST_OBJECT_FLAG_IS_SET() macro,
 * and (un)set using GST_OBJECT_FLAG_SET() and GST_OBJECT_FLAG_UNSET().
  }
{*
   * GST_BIN_FLAG_NO_RESYNC:
   *
   * Don't resync a state change when elements are added or linked in the bin
   *
   * Since: 1.0.5
    }
{*
   * GST_BIN_FLAG_STREAMS_AWARE:
   *
   * Indicates whether the bin can handle elements that add/remove source pads
   * at any point in time without first posting a no-more-pads signal.
   *
   * Since: 1.10
    }
{ padding  }
{*
   * GST_BIN_FLAG_LAST:
   *
   * The last enum in the series of flags for bins. Derived classes can use this
   * as first value in a list of flags.
    }
type
  PGstBinFlags = ^TGstBinFlags;
  TGstBinFlags =  Longint;
  Const
    GST_BIN_FLAG_NO_RESYNC = GST_ELEMENT_FLAG_LAST shl 0;
    GST_BIN_FLAG_STREAMS_AWARE = GST_ELEMENT_FLAG_LAST shl 1;
    GST_BIN_FLAG_LAST = GST_ELEMENT_FLAG_LAST shl 5;
;
{*
 * GST_BIN_IS_NO_RESYNC:
 * @bin: A #GstBin
 *
 * Check if @bin will resync its state change when elements are added and
 * removed.
 *
 * Since: 1.0.5
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BIN_IS_NO_RESYNC(bin : longint) : longint;

type
{*
 * GST_BIN_NUMCHILDREN:
 * @bin: a #GstBin
 *
 * Gets the number of children in a bin.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BIN_NUMCHILDREN(bin : longint) : longint;

{*
 * GST_BIN_CHILDREN:
 * @bin: a #GstBin
 *
 * Gets the list of children in a bin.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_CHILDREN(bin : longint) : longint;

{*
 * GST_BIN_CHILDREN_COOKIE:
 * @bin: a #GstBin
 *
 * Gets the children cookie that watches the children list.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_CHILDREN_COOKIE(bin : longint) : longint;

{*
 * GstBin:
 * @numchildren: the number of children in this bin
 * @children: (element-type Gst.Element): the list of children in this bin
 * @children_cookie: updated whenever @children changes
 * @child_bus: internal bus for handling child messages
 * @messages: (element-type Gst.Message): queued and cached messages
 * @polling: the bin is currently calculating its state
 * @state_dirty: the bin needs to recalculate its state (deprecated)
 * @clock_dirty: the bin needs to select a new clock
 * @provided_clock: the last clock selected
 * @clock_provider: the element that provided @provided_clock
 *
 * The GstBin base class. Subclasses can access these fields provided
 * the LOCK is taken.
  }
{< public > }{ with LOCK  }
{ our children, subclass are supposed to update these
   * fields to reflect their state with _iterate_*()  }
{< private > }
type
  PGstBin = ^TGstBin;
  TGstBin = record
      element : TGstElement;
      numchildren : Tgint;
      children : PGList;
      children_cookie : Tguint32;
      child_bus : PGstBus;
      messages : PGList;
      polling : Tgboolean;
      state_dirty : Tgboolean;
      clock_dirty : Tgboolean;
      provided_clock : PGstClock;
      clock_provider : PGstElement;
      priv : PGstBinPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstBinClass:
 * @parent_class: bin parent class
 *
 * Subclasses can override #GstBinClass::add_element and #GstBinClass::remove_element
 * to update the list of children in the bin.
 *
 * The #GstBinClass::handle_message method can be overridden to implement custom
 * message handling.
 *
 * #GstBinClass::deep_element_added will be called when a new element has been
 * added to any bin inside this bin, so it will also be called if a new child
 * was added to a sub-bin of this bin. #GstBin implementations that override
 * this message should chain up to the parent class implementation so the
 * #GstBin::deep-element-added signal is emitted on all parents.
  }
{< private > }
{ deprecated  }
{ signals  }
{*
   * GstBinClass::element_added:
   * @bin: the #GstBin
   * @child: the element that was added
   *
   * Method called when an element was added to the bin.
    }
{*
   * GstBinClass::element_removed:
   * @bin: the #GstBin
   * @child: the element that was removed
   *
   * Method called when an element was removed from the bin.
    }
{< public > }
{ virtual methods for subclasses  }
{*
   * GstBinClass::add_element:
   * @bin: the #GstBin
   * @element: the element to be added
   *
   * Method to add an element to the bin.
   *
   * Returns: %TRUE if the @element was added
    }
{*
   * GstBinClass::remove_element:
   * @bin: the #GstBin
   * @element: the element to be removed
   *
   * Method to remove an element from the bin.
   *
   * Returns: %TRUE if the @element was removed
    }
{*
   * GstBinClass::handle_message:
   * @bin: the #GstBin
   * @message: (transfer full): the message to be handled
   *
   * Method to handle a message from the children.
    }
{< private > }
{ signal  }
{< public > }
{ signal  }
{*
   * GstBinClass::deep_element_added:
   * @bin: the top level #GstBin
   * @sub_bin: the #GstBin to which the element was added
   * @child: the element that was added
   *
   * Method called when an element was added somewhere in the bin hierarchy.
    }
{*
   * GstBinClass::deep_element_removed:
   * @bin: the top level #GstBin
   * @sub_bin: the #GstBin from which the element was removed
   * @child: the element that was removed
   *
   * Method called when an element was removed somewhere in the bin hierarchy.
    }
{< private > }
  PGstBinClass = ^TGstBinClass;
  TGstBinClass = record
      parent_class : TGstElementClass;
      pool : PGThreadPool;
      element_added : procedure (bin:PGstBin; child:PGstElement);cdecl;
      element_removed : procedure (bin:PGstBin; child:PGstElement);cdecl;
      add_element : function (bin:PGstBin; element:PGstElement):Tgboolean;cdecl;
      remove_element : function (bin:PGstBin; element:PGstElement):Tgboolean;cdecl;
      handle_message : procedure (bin:PGstBin; message:PGstMessage);cdecl;
      do_latency : function (bin:PGstBin):Tgboolean;cdecl;
      deep_element_added : procedure (bin:PGstBin; sub_bin:PGstBin; child:PGstElement);cdecl;
      deep_element_removed : procedure (bin:PGstBin; sub_bin:PGstBin; child:PGstElement);cdecl;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;


function gst_bin_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_bin_new(name:Pgchar):PGstElement;cdecl;external;
{ add and remove elements from the bin  }
function gst_bin_add(bin:PGstBin; element:PGstElement):Tgboolean;cdecl;external;
function gst_bin_remove(bin:PGstBin; element:PGstElement):Tgboolean;cdecl;external;
{ retrieve a single child  }
(* Const before type ignored *)
function gst_bin_get_by_name(bin:PGstBin; name:Pgchar):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_bin_get_by_name_recurse_up(bin:PGstBin; name:Pgchar):PGstElement;cdecl;external;
function gst_bin_get_by_interface(bin:PGstBin; iface:TGType):PGstElement;cdecl;external;
{ retrieve multiple children  }
function gst_bin_iterate_elements(bin:PGstBin):PGstIterator;cdecl;external;
function gst_bin_iterate_sorted(bin:PGstBin):PGstIterator;cdecl;external;
function gst_bin_iterate_recurse(bin:PGstBin):PGstIterator;cdecl;external;
function gst_bin_iterate_sinks(bin:PGstBin):PGstIterator;cdecl;external;
function gst_bin_iterate_sources(bin:PGstBin):PGstIterator;cdecl;external;
function gst_bin_iterate_all_by_interface(bin:PGstBin; iface:TGType):PGstIterator;cdecl;external;
(* Const before type ignored *)
function gst_bin_iterate_all_by_element_factory_name(bin:PGstBin; factory_name:Pgchar):PGstIterator;cdecl;external;
{ latency  }
function gst_bin_recalculate_latency(bin:PGstBin):Tgboolean;cdecl;external;
{ set and get suppressed flags  }
procedure gst_bin_set_suppressed_flags(bin:PGstBin; flags:TGstElementFlags);cdecl;external;
function gst_bin_get_suppressed_flags(bin:PGstBin):TGstElementFlags;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (GstBin, gst_object_unref) }
{$endif}
{ __GST_BIN_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BIN : longint; { return type might be wrong }
  begin
    GST_TYPE_BIN:=gst_bin_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BIN(obj : longint) : longint;
begin
  GST_IS_BIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_BIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BIN_CLASS(klass : longint) : longint;
begin
  GST_IS_BIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_BIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_GET_CLASS(obj : longint) : longint;
begin
  GST_BIN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_BIN,GstBinClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN(obj : longint) : longint;
begin
  GST_BIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_BIN,GstBin);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_CLASS(klass : longint) : longint;
begin
  GST_BIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_BIN,GstBinClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BIN_CAST(obj : longint) : PGstBin;
begin
  GST_BIN_CAST:=PGstBin(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_IS_NO_RESYNC(bin : longint) : longint;
begin
  GST_BIN_IS_NO_RESYNC:=GST_OBJECT_FLAG_IS_SET(bin,GST_BIN_FLAG_NO_RESYNC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_NUMCHILDREN(bin : longint) : longint;
begin
  GST_BIN_NUMCHILDREN:=(GST_BIN_CAST(bin))^.numchildren;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_CHILDREN(bin : longint) : longint;
begin
  GST_BIN_CHILDREN:=(GST_BIN_CAST(bin))^.children;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIN_CHILDREN_COOKIE(bin : longint) : longint;
begin
  GST_BIN_CHILDREN_COOKIE:=(GST_BIN_CAST(bin))^.children_cookie;
end;


end.
