
unit ges_timeline_element;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_timeline_element.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_timeline_element.h
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
PGError  = ^GError;
PGESAsset  = ^GESAsset;
PGESTimeline  = ^GESTimeline;
PGESTimelineElement  = ^GESTimelineElement;
PGESTimelineElementClass  = ^GESTimelineElementClass;
PGESTimelineElementPrivate  = ^GESTimelineElementPrivate;
Pgint  = ^gint;
PGList  = ^GList;
PGObject  = ^GObject;
PGParamSpec  = ^GParamSpec;
Pguint  = ^guint;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gst-editing-services
 * Copyright (C) <2013> Thibault Saunier <thibault.saunier@collabora.com>
 *               <2013> Collabora Ltd.
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
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include "ges-enums.h"}
{$include "ges-types.h"}

{ was #define dname def_expr }
function GES_TYPE_TIMELINE_ELEMENT : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TimelineElement, timeline_element, TIMELINE_ELEMENT); }
{*
 * GES_TIMELINE_ELEMENT_START:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:start of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_START(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_END:
 * @obj: A #GESTimelineElement
 *
 * The end position of @obj: #GESTimelineElement:start +
 * #GESTimelineElement:duration.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_END(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_INPOINT:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:in-point of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_INPOINT(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_DURATION:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:duration of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_DURATION(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_MAX_DURATION:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:max-duration of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_MAX_DURATION(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_PRIORITY:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:priority of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_PRIORITY(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_NO_LAYER_PRIORITY:
 *
 * Layer priority when a timeline element is not in any layer.
  }
{ was #define dname def_expr }
function GES_TIMELINE_ELEMENT_NO_LAYER_PRIORITY : Tguint32;  

{*
 * GES_TIMELINE_ELEMENT_LAYER_PRIORITY:
 * @obj: The object to retrieve the layer priority from
 *
 * See #ges_timeline_element_get_layer_priority.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_LAYER_PRIORITY(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_PARENT:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:parent of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_PARENT(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_TIMELINE:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:timeline of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_TIMELINE(obj : longint) : longint;

{*
 * GES_TIMELINE_ELEMENT_NAME:
 * @obj: A #GESTimelineElement
 *
 * The #GESTimelineElement:name of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_NAME(obj : longint) : longint;

{*
 * GESTimelineElement:
 * @parent: The #GESTimelineElement:parent of the element
 * @asset: The #GESAsset from which the object has been extracted
 * @start: The #GESTimelineElement:start of the element
 * @inpoint: The #GESTimelineElement:in-point of the element
 * @duration: The #GESTimelineElement:duration of the element
 * @maxduration: The #GESTimelineElement:max-duration of the element
 * @priority: The #GESTimelineElement:priority of the element
 * @name: The #GESTimelineElement:name of the element
 * @timeline: The #GESTimelineElement:timeline of the element
 *
 * All members can be read freely, but should usually not be written to.
 * Subclasses may write to them, but should make sure to properly call
 * g_object_notify().
  }
{< public >  }
{< read only > }
{< private > }
{ Padding for API extension  }
type
  PGESTimelineElement = ^TGESTimelineElement;
  TGESTimelineElement = record
      parent_instance : TGInitiallyUnowned;
      parent : PGESTimelineElement;
      asset : PGESAsset;
      start : TGstClockTime;
      inpoint : TGstClockTime;
      duration : TGstClockTime;
      maxduration : TGstClockTime;
      priority : Tguint32;
      timeline : PGESTimeline;
      name : Pgchar;
      priv : PGESTimelineElementPrivate;
      _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GESTimelineElementClass:
 * @set_parent: Method called just before the #GESTimelineElement:parent
 * is set.
 * @set_start: Method called just before the #GESTimelineElement:start is
 * set. This method should check whether the #GESTimelineElement:start can
 * be changed to the new value and to otherwise prepare the element in
 * response to what the new value will be. A return of %FALSE means that
 * the property should not be set. A return of %TRUE means that the
 * property should be set to the value given to the setter and a notify
 * emitted. A return of -1 means that the property should not be set but
 * the setter should still return %TRUE (normally because the method
 * already handled setting the value, potentially to a snapped value, and
 * emitted the notify signal).
 * #GESTimelineElement:duration is set. This method should check
 * whether the #GESTimelineElement:duration can be changed to the new
 * value and to otherwise prepare the element in response to what the new
 * value will be. A return of %FALSE means that the property should not be
 * set. A return of %TRUE means that the property should be set to the
 * value given to the setter and a notify emitted. A return of -1 means
 * that the property should not be set but the setter should still return
 * %TRUE (normally because the method already handled setting the value,
 * potentially to a snapped value, and emitted the notify signal).
 * @set_inpoint: Method called just before the
 * #GESTimelineElement:in-point is set to a new value. This method should
 * not set the #GESTimelineElement:in-point itself, but should check
 * whether it can be changed to the new value and to otherwise prepare the
 * element in response to what the new value will be. A return of %FALSE
 * means that the property should not be set.
 * @set_max_duration: Method called just before the
 * #GESTimelineElement:max-duration is set. This method should
 * not set the #GESTimelineElement:max-duration itself, but should check
 * whether it can be changed to the new value and to otherwise prepare the
 * element in response to what the new value will be. A return of %FALSE
 * means that the property should not be set.
 * @set_priority:  Method called just before the
 * #GESTimelineElement:priority is set.
 * @ripple: Set this method to overwrite a redirect to
 * ges_timeline_element_edit() in ges_timeline_element_ripple().
 * @ripple_end: Set this method to overwrite a redirect to
 * ges_timeline_element_edit() in ges_timeline_element_ripple_end().
 * @roll: Set this method to overwrite a redirect to
 * ges_timeline_element_edit() in ges_timeline_element_roll().
 * @roll_end: Set this method to overwrite a redirect to
 * ges_timeline_element_edit() in ges_timeline_element_roll_end().
 * @trim: Set this method to overwrite a redirect to
 * ges_timeline_element_edit() in ges_timeline_element_trim().
 * @deep_copy: Prepare @copy for pasting as a copy of @self. At least by
 * copying the children properties of @self into @copy.
 * @paste: Paste @self, which is the @copy prepared by @deep_copy, into
 * the timeline at the given @paste_position, with @ref_element as a
 * reference, which is the @self that was passed to @deep_copy.
 * @lookup-child: Method to find a child with the child property.
 * @prop_name. The default vmethod will return the first child that
 * matches. Overwrite this with a call to the parent vmethod if you wish
 * to redirect property names. Or overwrite to change which child is
 * returned if multiple children share the same child property name.
 * @get_track_types: Return a the track types for the element.
 * @list_children_properties: List the children properties that have been
 * registered for the element. The default implementation is able to fetch
 * all of these, so should be sufficient. If you overwrite this, you
 * should still call the default implementation to get the full list, and
 * then edit its content.
 * @lookup_child: Find @child, and its registered child property @pspec,
 * corresponding to the child property specified by @prop_name. The
 * default implementation will search for the first child that matches. If
 * you overwrite this, you will likely still want to call the default
 * vmethod, which has access to the registered parameter specifications.
 *
 * The #GESTimelineElement base class. Subclasses should override at least
 * @set_start @set_inpoint @set_duration @ripple @ripple_end @roll_start
 * @roll_end and @trim.
 *
 * Vmethods in subclasses should apply all the operation they need to but
 * the real method implementation is in charge of setting the proper field,
 * and emitting the notify signal.
  }
{< public >  }
{ set_priority is now protected  }
(* Const before type ignored *)
{*
   * GESTimelineElementClass::set_child_property:
   *
   * Method for setting the child property given by
   * @pspec on @child to @value. Default implementation will use
   * g_object_set_property().
   *
   * Since: 1.16
    }
{*
   * GESTimelineElementClass::get_layer_priority:
   *
   * Get the #GESLayer:priority of the layer that this
   * element is part of.
   *
   * Since: 1.16
    }
{*
   * GESTimelineElementClass::get_natural_framerate:
   * @self: A #GESTimelineElement
   * @framerate_n: The framerate numerator to retrieve
   * @framerate_d: The framerate denominator to retrieve
   *
   * Returns: %TRUE if @self has a natural framerate @FALSE otherwise.
   *
   * Since: 1.18
    }
{*
   * GESTimelineElementClass::set_child_property_full:
   *
   * Similar to @set_child_property, except setting can fail, with the @error
   * being optionally set. Default implementation will call @set_child_property
   * and return %TRUE.
   *
   * Since: 1.18
    }
(* Const before type ignored *)
{ Padding for API extension  }
  PGESTimelineElementClass = ^TGESTimelineElementClass;
  TGESTimelineElementClass = record
      parent_class : TGInitiallyUnownedClass;
      set_parent : function (self:PGESTimelineElement; parent:PGESTimelineElement):Tgboolean;cdecl;
      set_start : function (self:PGESTimelineElement; start:TGstClockTime):Tgboolean;cdecl;
      set_inpoint : function (self:PGESTimelineElement; inpoint:TGstClockTime):Tgboolean;cdecl;
      set_duration : function (self:PGESTimelineElement; duration:TGstClockTime):Tgboolean;cdecl;
      set_max_duration : function (self:PGESTimelineElement; maxduration:TGstClockTime):Tgboolean;cdecl;
      set_priority : function (self:PGESTimelineElement; priority:Tguint32):Tgboolean;cdecl;
      ripple : function (self:PGESTimelineElement; start:Tguint64):Tgboolean;cdecl;
      ripple_end : function (self:PGESTimelineElement; end:Tguint64):Tgboolean;cdecl;
      roll_start : function (self:PGESTimelineElement; start:Tguint64):Tgboolean;cdecl;
      roll_end : function (self:PGESTimelineElement; end:Tguint64):Tgboolean;cdecl;
      trim : function (self:PGESTimelineElement; start:Tguint64):Tgboolean;cdecl;
      deep_copy : procedure (self:PGESTimelineElement; copy:PGESTimelineElement);cdecl;
      paste : function (self:PGESTimelineElement; ref_element:PGESTimelineElement; paste_position:TGstClockTime):PGESTimelineElement;cdecl;
      list_children_properties : function (self:PGESTimelineElement; n_properties:Pguint):PPGParamSpec;cdecl;
      lookup_child : function (self:PGESTimelineElement; prop_name:Pgchar; child:PPGObject; pspec:PPGParamSpec):Tgboolean;cdecl;
      get_track_types : function (self:PGESTimelineElement):TGESTrackType;cdecl;
      set_child_property : procedure (self:PGESTimelineElement; child:PGObject; pspec:PGParamSpec; value:PGValue);cdecl;
      get_layer_priority : function (self:PGESTimelineElement):Tguint32;cdecl;
      get_natural_framerate : function (self:PGESTimelineElement; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;
      set_child_property_full : function (self:PGESTimelineElement; child:PGObject; pspec:PGParamSpec; value:PGValue; error:PPGError):Tgboolean;cdecl;
      _ges_reserved : array[0..(GES_PADDING_LARGE-6)-1] of Tgpointer;
    end;


function ges_timeline_element_get_toplevel_parent(self:PGESTimelineElement):PGESTimelineElement;cdecl;external;
function ges_timeline_element_get_parent(self:PGESTimelineElement):PGESTimelineElement;cdecl;external;
function ges_timeline_element_set_parent(self:PGESTimelineElement; parent:PGESTimelineElement):Tgboolean;cdecl;external;
function ges_timeline_element_set_timeline(self:PGESTimelineElement; timeline:PGESTimeline):Tgboolean;cdecl;external;
function ges_timeline_element_set_start(self:PGESTimelineElement; start:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_set_inpoint(self:PGESTimelineElement; inpoint:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_set_duration(self:PGESTimelineElement; duration:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_set_max_duration(self:PGESTimelineElement; maxduration:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_set_priority(self:PGESTimelineElement; priority:Tguint32):Tgboolean;cdecl;external;
function ges_timeline_element_get_start(self:PGESTimelineElement):TGstClockTime;cdecl;external;
function ges_timeline_element_get_inpoint(self:PGESTimelineElement):TGstClockTime;cdecl;external;
function ges_timeline_element_get_duration(self:PGESTimelineElement):TGstClockTime;cdecl;external;
function ges_timeline_element_get_max_duration(self:PGESTimelineElement):TGstClockTime;cdecl;external;
function ges_timeline_element_get_timeline(self:PGESTimelineElement):PGESTimeline;cdecl;external;
function ges_timeline_element_get_priority(self:PGESTimelineElement):Tguint32;cdecl;external;
function ges_timeline_element_ripple(self:PGESTimelineElement; start:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_ripple_end(self:PGESTimelineElement; end:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_roll_start(self:PGESTimelineElement; start:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_roll_end(self:PGESTimelineElement; end:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_trim(self:PGESTimelineElement; start:TGstClockTime):Tgboolean;cdecl;external;
function ges_timeline_element_copy(self:PGESTimelineElement; deep:Tgboolean):PGESTimelineElement;cdecl;external;
function ges_timeline_element_get_name(self:PGESTimelineElement):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_timeline_element_set_name(self:PGESTimelineElement; name:Pgchar):Tgboolean;cdecl;external;
function ges_timeline_element_list_children_properties(self:PGESTimelineElement; n_properties:Pguint):^PGParamSpec;cdecl;external;
(* Const before type ignored *)
function ges_timeline_element_lookup_child(self:PGESTimelineElement; prop_name:Pgchar; child:PPGObject; pspec:PPGParamSpec):Tgboolean;cdecl;external;
procedure ges_timeline_element_get_child_property_by_pspec(self:PGESTimelineElement; pspec:PGParamSpec; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure ges_timeline_element_get_child_property_valist(self:PGESTimelineElement; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure ges_timeline_element_get_child_properties(self:PGESTimelineElement; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure ges_timeline_element_get_child_properties(self:PGESTimelineElement; first_property_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure ges_timeline_element_set_child_property_valist(self:PGESTimelineElement; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure ges_timeline_element_set_child_property_by_pspec(self:PGESTimelineElement; pspec:PGParamSpec; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure ges_timeline_element_set_child_properties(self:PGESTimelineElement; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure ges_timeline_element_set_child_properties(self:PGESTimelineElement; first_property_name:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_timeline_element_set_child_property(self:PGESTimelineElement; property_name:Pgchar; value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_timeline_element_set_child_property_full(self:PGESTimelineElement; property_name:Pgchar; value:PGValue; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_timeline_element_get_child_property(self:PGESTimelineElement; property_name:Pgchar; value:PGValue):Tgboolean;cdecl;external;
function ges_timeline_element_add_child_property(self:PGESTimelineElement; pspec:PGParamSpec; child:PGObject):Tgboolean;cdecl;external;
function ges_timeline_element_remove_child_property(self:PGESTimelineElement; pspec:PGParamSpec):Tgboolean;cdecl;external;
function ges_timeline_element_paste(self:PGESTimelineElement; paste_position:TGstClockTime):PGESTimelineElement;cdecl;external;
function ges_timeline_element_get_track_types(self:PGESTimelineElement):TGESTrackType;cdecl;external;
function ges_timeline_element_get_natural_framerate(self:PGESTimelineElement; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;external;
function ges_timeline_element_get_layer_priority(self:PGESTimelineElement):Tguint32;cdecl;external;
function ges_timeline_element_edit(self:PGESTimelineElement; layers:PGList; new_layer_priority:Tgint64; mode:TGESEditMode; edge:TGESEdge; 
           position:Tguint64):Tgboolean;cdecl;external;
function ges_timeline_element_edit_full(self:PGESTimelineElement; new_layer_priority:Tgint64; mode:TGESEditMode; edge:TGESEdge; position:Tguint64; 
           error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TIMELINE_ELEMENT : longint; { return type might be wrong }
  begin
    GES_TYPE_TIMELINE_ELEMENT:=ges_timeline_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_START(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_START:=(PGESTimelineElement(obj))^.start;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_END(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_END:=((PGESTimelineElement(obj))^.start)+((PGESTimelineElement(obj))^.duration);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_INPOINT(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_INPOINT:=(PGESTimelineElement(obj))^.inpoint;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_DURATION(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_DURATION:=(PGESTimelineElement(obj))^.duration;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_MAX_DURATION(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_MAX_DURATION:=(PGESTimelineElement(obj))^.maxduration;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_PRIORITY(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_PRIORITY:=(PGESTimelineElement(obj))^.priority;
end;

{ was #define dname def_expr }
function GES_TIMELINE_ELEMENT_NO_LAYER_PRIORITY : Tguint32;
  begin
    GES_TIMELINE_ELEMENT_NO_LAYER_PRIORITY:=Tguint32(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_LAYER_PRIORITY(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_LAYER_PRIORITY:=ges_timeline_element_get_layer_priority(PGESTimelineElement(obj));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_PARENT(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_PARENT:=(PGESTimelineElement(obj))^.parent;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_TIMELINE(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_TIMELINE:=(PGESTimelineElement(obj))^.timeline;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_ELEMENT_NAME(obj : longint) : longint;
begin
  GES_TIMELINE_ELEMENT_NAME:=(PGESTimelineElement(obj))^.name;
end;


end.
