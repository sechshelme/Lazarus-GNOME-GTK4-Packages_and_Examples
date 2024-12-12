
unit ges_container;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_container.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_container.h
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
PGESChildrenControlMode  = ^GESChildrenControlMode;
PGESContainer  = ^GESContainer;
PGESContainerClass  = ^GESContainerClass;
PGESContainerPrivate  = ^GESContainerPrivate;
PGESTimelineElement  = ^GESTimelineElement;
PGList  = ^GList;
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
{$include <ges/ges-timeline-element.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-track.h>}

{ was #define dname def_expr }
function GES_TYPE_CONTAINER : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Container, container, CONTAINER); }
{*
 * GESChildrenControlMode:
 *
 * To be used by subclasses only. This indicate how to handle a change in
 * a child.
  }
type
  PGESChildrenControlMode = ^TGESChildrenControlMode;
  TGESChildrenControlMode =  Longint;
  Const
    GES_CHILDREN_UPDATE = 0;
    GES_CHILDREN_IGNORE_NOTIFIES = 1;
    GES_CHILDREN_UPDATE_OFFSETS = 2;
    GES_CHILDREN_UPDATE_ALL_VALUES = 3;
    GES_CHILDREN_LAST = 4;
;
{*
 * GES_CONTAINER_HEIGHT:
 * @obj: a #GESContainer
 *
 * The #GESContainer:height of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GES_CONTAINER_HEIGHT(obj : longint) : longint;

{*
 * GES_CONTAINER_CHILDREN:
 * @obj: a #GESContainer
 *
 * The #GList containing the children of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CONTAINER_CHILDREN(obj : longint) : longint;

{*
 * GESContainer:
 * @children: (element-type GES.TimelineElement): The list of
 * #GESTimelineElement-s controlled by this Container
 * @height: The #GESContainer:height of @obj
 *
 * Note, you may read, but should not modify these properties.
  }
{< public >  }
{< readonly > }
{ We don't add those properties to the priv struct for optimization and code
   * readability purposes  }
{ the span of priorities this object needs  }
{ <protected>  }
{< readonly > }
{< private > }
{ Padding for API extension  }
type
  PGESContainer = ^TGESContainer;
  TGESContainer = record
      parent : TGESTimelineElement;
      children : PGList;
      height : Tguint32;
      children_control_mode : TGESChildrenControlMode;
      initiated_move : PGESTimelineElement;
      priv : PGESContainerPrivate;
      _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GESContainerClass:
 * @child_added: Virtual method that is called right after a #GESTimelineElement is added
 * @child_removed: Virtual method that is called right after a #GESTimelineElement is removed
 * @remove_child: Virtual method to remove a child
 * @add_child: Virtual method to add a child
 * @ungroup: Virtual method to ungroup a container into a list of
 * containers
 * @group: Virtual method to group a list of containers together under a
 * single container
 * @edit: Deprecated
  }
{< private >  }
{< public >  }
{ signals  }
{ Deprecated and not used anymore  }
{< private > }
{ Padding for API extension  }
  PGESContainerClass = ^TGESContainerClass;
  TGESContainerClass = record
      parent_class : TGESTimelineElementClass;
      child_added : procedure (container:PGESContainer; element:PGESTimelineElement);cdecl;
      child_removed : procedure (container:PGESContainer; element:PGESTimelineElement);cdecl;
      add_child : function (container:PGESContainer; element:PGESTimelineElement):Tgboolean;cdecl;
      remove_child : function (container:PGESContainer; element:PGESTimelineElement):Tgboolean;cdecl;
      ungroup : function (container:PGESContainer; recursive:Tgboolean):PGList;cdecl;
      group : function (containers:PGList):PGESContainer;cdecl;
      edit : function (container:PGESContainer; layers:PGList; new_layer_priority:Tgint; mode:TGESEditMode; edge:TGESEdge; 
                   position:Tguint64):Tgboolean;cdecl;
      grouping_priority : Tguint;
      _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;

{ Children handling  }

function ges_container_get_children(container:PGESContainer; recursive:Tgboolean):PGList;cdecl;external;
function ges_container_add(container:PGESContainer; child:PGESTimelineElement):Tgboolean;cdecl;external;
function ges_container_remove(container:PGESContainer; child:PGESTimelineElement):Tgboolean;cdecl;external;
function ges_container_ungroup(container:PGESContainer; recursive:Tgboolean):PGList;cdecl;external;
function ges_container_group(containers:PGList):PGESContainer;cdecl;external;
function ges_container_edit(container:PGESContainer; layers:PGList; new_layer_priority:Tgint; mode:TGESEditMode; edge:TGESEdge; 
           position:Tguint64):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_CONTAINER : longint; { return type might be wrong }
  begin
    GES_TYPE_CONTAINER:=ges_container_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CONTAINER_HEIGHT(obj : longint) : longint;
begin
  GES_CONTAINER_HEIGHT:=(PGESContainer(obj))^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CONTAINER_CHILDREN(obj : longint) : longint;
begin
  GES_CONTAINER_CHILDREN:=(PGESContainer(obj))^.children;
end;


end.
