
unit ges_track_element;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_track_element.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_track_element.h
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
PGESAsset  = ^GESAsset;
PGESTrack  = ^GESTrack;
PGESTrackElement  = ^GESTrackElement;
PGESTrackElementClass  = ^GESTrackElementClass;
PGESTrackElementPrivate  = ^GESTrackElementPrivate;
PGHashTable  = ^GHashTable;
PGParamSpec  = ^GParamSpec;
PGstControlBinding  = ^GstControlBinding;
PGstControlSource  = ^GstControlSource;
PGstElement  = ^GstElement;
Pguint  = ^guint;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
{$include <ges/ges-types.h>}
{$include <ges/ges-clip.h>}
{$include <ges/ges-track.h>}
{$include <gst/controller/gstdirectcontrolbinding.h>}
{$include <gst/controller/gstinterpolationcontrolsource.h>}

{ was #define dname def_expr }
function GES_TYPE_TRACK_ELEMENT : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TrackElement, track_element, TRACK_ELEMENT) }
{*
 * GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE:
 * @klass: A #GESTrackElementClass
 *
 * What the default #GESTrackElement:has-internal-source value should be
 * for new elements from this class.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE(klass : longint) : longint;

{*
 * GESTrackElement:
 *
 * The #GESTrackElement base class.
  }
{< private > }
{ Padding for API extension  }
type
  PGESTrackElement = ^TGESTrackElement;
  TGESTrackElement = record
      parent : TGESTimelineElement;
      active : Tgboolean;
      priv : PGESTrackElementPrivate;
      asset : PGESAsset;
      _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GESTrackElementClass:
  }
{< private > }
{< public > }
{*
   * GESTrackElementClass::nleobject_factorytype:
   *
   * The name of the #GstElementFactory to use to create the underlying
   *   nleobject of a track element
    }
(* Const before type ignored *)
{*
   * GESTrackElementClass::create_gnl_object:
   * @object: The #GESTrackElement
   *
   * Returns: (transfer floating): the #NLEObject to use in the #nlecomposition
    }
{*
   * GESTrackElementClass::create_element:
   * @object: The #GESTrackElement
   *
   * Returns: (transfer floating): the #GstElement that the underlying nleobject
   * controls.
    }
{*
   * GESTrackElementClass::active_changed:
   * @object: A #GESTrackElement
   * @active: Whether the element is active or not inside the #nlecomposition
   *
   * Notify when the #GESTrackElement:active property changes
    }
{< private > }
{ signals (currently unused)  }
{*
   * GESTrackElementClass::changed:
   *
   * Deprecated:
    }
{*
   * GESTrackElementClass::list_children_properties:
   *
   * Listing children properties is handled by
   * ges_timeline_element_list_children_properties() instead.
   *
   * Deprecated: 1.14: Use #GESTimelineElementClass::list_children_properties
   * instead
    }
{*
   * GESTrackElementClass::lookup_child:
   *
   * Deprecated: 1.14: Use #GESTimelineElementClass::lookup_child
   * instead
    }
(* Const before type ignored *)
{< protected > }
  PGESTrackElementClass = ^TGESTrackElementClass;
  TGESTrackElementClass = record
      parent_class : TGESTimelineElementClass;
      nleobject_factorytype : Pgchar;
      create_gnl_object : function (object:PGESTrackElement):PGstElement;cdecl;
      create_element : function (object:PGESTrackElement):PGstElement;cdecl;
      active_changed : procedure (object:PGESTrackElement; active:Tgboolean);cdecl;
      changed : procedure (object:PGESTrackElement);cdecl;
      list_children_properties : function (object:PGESTrackElement; n_properties:Pguint):PPGParamSpec;cdecl;
      lookup_child : function (object:PGESTrackElement; prop_name:Pgchar; element:PPGstElement; pspec:PPGParamSpec):Tgboolean;cdecl;
      ABI : record
          case longint of
            0 : ( _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer );
            1 : ( abi : record
                default_has_internal_source : Tgboolean;
                default_track_type : TGESTrackType;
              end );
          end;
    end;


function ges_track_element_get_track(object:PGESTrackElement):PGESTrack;cdecl;external;
function ges_track_element_get_track_type(object:PGESTrackElement):TGESTrackType;cdecl;external;
procedure ges_track_element_set_track_type(object:PGESTrackElement; _type:TGESTrackType);cdecl;external;
function ges_track_element_get_nleobject(object:PGESTrackElement):PGstElement;cdecl;external;
function ges_track_element_get_element(object:PGESTrackElement):PGstElement;cdecl;external;
function ges_track_element_is_core(object:PGESTrackElement):Tgboolean;cdecl;external;
function ges_track_element_set_active(object:PGESTrackElement; active:Tgboolean):Tgboolean;cdecl;external;
function ges_track_element_is_active(object:PGESTrackElement):Tgboolean;cdecl;external;
function ges_track_element_set_has_internal_source(object:PGESTrackElement; has_internal_source:Tgboolean):Tgboolean;cdecl;external;
function ges_track_element_has_internal_source(object:PGESTrackElement):Tgboolean;cdecl;external;
procedure ges_track_element_get_child_property_by_pspec(object:PGESTrackElement; pspec:PGParamSpec; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_track_element_set_control_source(object:PGESTrackElement; source:PGstControlSource; property_name:Pgchar; binding_type:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure ges_track_element_clamp_control_source(object:PGESTrackElement; property_name:Pgchar);cdecl;external;
procedure ges_track_element_set_auto_clamp_control_sources(object:PGESTrackElement; auto_clamp:Tgboolean);cdecl;external;
function ges_track_element_get_auto_clamp_control_sources(object:PGESTrackElement):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_track_element_get_control_binding(object:PGESTrackElement; property_name:Pgchar):PGstControlBinding;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ges_track_element_add_children_props(self:PGESTrackElement; element:PGstElement; wanted_categories:PPgchar; blacklist:PPgchar; whitelist:PPgchar);cdecl;external;
function ges_track_element_get_all_control_bindings(trackelement:PGESTrackElement):PGHashTable;cdecl;external;
(* Const before type ignored *)
function ges_track_element_remove_control_binding(object:PGESTrackElement; property_name:Pgchar):Tgboolean;cdecl;external;
{$include "ges-track-element-deprecated.h"}

implementation

{ was #define dname def_expr }
function GES_TYPE_TRACK_ELEMENT : longint; { return type might be wrong }
  begin
    GES_TYPE_TRACK_ELEMENT:=ges_track_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE(klass : longint) : longint;
begin
  GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE:=(GES_TRACK_ELEMENT_CLASS(klass))^.(ABI.(abi.default_has_internal_source));
end;


end.
