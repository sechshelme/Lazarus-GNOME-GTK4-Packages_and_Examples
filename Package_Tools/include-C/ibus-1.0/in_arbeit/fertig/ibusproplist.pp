
unit ibusproplist;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusproplist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusproplist.h
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
PGArray  = ^GArray;
PIBusProperty  = ^IBusProperty;
PIBusPropList  = ^IBusPropList;
PIBusPropListClass  = ^IBusPropListClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ IBus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2008-2013 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_PROP_LIST_H_}
{$define __IBUS_PROP_LIST_H_}
{*
 * SECTION: ibusproplist
 * @Title: IBusPropList
 * @Short_description: An #IBusProperty container.
 * @Stability: Stable
 *
 * See_also: #IBusProperty, #IBusEngine
 *
  }
{$include "ibusserializable.h"}
{$include "ibusproperty.h"}
{
 * Type macros.
  }
{ define IBusPropList macros  }

{ was #define dname def_expr }
function IBUS_TYPE_PROP_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROP_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROP_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROP_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROP_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROP_LIST_GET_CLASS(obj : longint) : longint;

{ FIXME: https://mail.gnome.org/archives/gtk-doc-list/2015-July/msg00004.html
 * If ibusproperty.h and ibusproplist.h includes each other,
 * gtk-doc build outputs several warnings:
 *
 * # cd html && gtkdoc-mkhtml ibus ../ibus-docs.sgml
 * ../ibus-docs.sgml:4: element refentry: validity error : ID IBusPropList
 * already defined
 * ../ibus-docs.sgml:172: element refsect2: validity error : ID
 * IBusPropListClass already defined
 * Warning: multiple "IDs" for constraint linkend: IBusPropList.
 * Warning: multiple "IDs" for constraint linkend: IBusPropList.
 * Warning: multiple "IDs" for constraint linkend: IBusPropListClass.
  }
{$ifndef __PROPLIST_DEFINED}
{$define __PROPLIST_DEFINED}
type
{$endif}
{*
 * IBusPropList:
 * @properties: GArray that holds IBusProperties.
 *
 * An array of IBusProperties.
  }
{< public > }
type
  PIBusPropList = ^TIBusPropList;
  TIBusPropList = record
      parent : TIBusSerializable;
      properties : PGArray;
    end;

{*
 * IBusPropListClass:
 * @parent: The parent class.
 *
 * Class structure for #IBusPropList.
  }
  PIBusPropListClass = ^TIBusPropListClass;
  TIBusPropListClass = record
      parent : TIBusSerializableClass;
    end;


function ibus_prop_list_get_type:TGType;cdecl;external;
{*
 * ibus_prop_list_new:
 *
 * Create a new #IBusPropList.
 *
 * Returns: A newly allocated #IBusPropList.
  }
function ibus_prop_list_new:PIBusPropList;cdecl;external;
{*
 * ibus_prop_list_append:
 * @prop_list: An IBusPropList.
 * @prop: IBusProperty to be append to @prop_list.
 *
 * Append an IBusProperty to an IBusPropList, and increase reference.
  }
procedure ibus_prop_list_append(prop_list:PIBusPropList; prop:PIBusProperty);cdecl;external;
{*
 * ibus_prop_list_get:
 * @prop_list: An IBusPropList.
 * @index: Index of an IBusPropList.
 *
 * Gets #IBusProperty at given index. Borrowed reference.
 *
 * Returns: (transfer none): #IBusProperty at given index, %NULL if no such
 *     #IBusProperty.
  }
function ibus_prop_list_get(prop_list:PIBusPropList; index:Tguint):PIBusProperty;cdecl;external;
{*
 * ibus_prop_list_update_property:
 * @prop_list: An IBusPropList.
 * @prop: IBusProperty to be update.
 *
 * Update an IBusProperty in IBusPropList.
 *
 * Returns: %TRUE if succeeded, %FALSE otherwise.
  }
function ibus_prop_list_update_property(prop_list:PIBusPropList; prop:PIBusProperty):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_PROP_LIST : longint; { return type might be wrong }
  begin
    IBUS_TYPE_PROP_LIST:=ibus_prop_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROP_LIST(obj : longint) : longint;
begin
  IBUS_PROP_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_PROP_LIST,IBusPropList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROP_LIST_CLASS(klass : longint) : longint;
begin
  IBUS_PROP_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_PROP_LIST,IBusPropListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROP_LIST(obj : longint) : longint;
begin
  IBUS_IS_PROP_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_PROP_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROP_LIST_CLASS(klass : longint) : longint;
begin
  IBUS_IS_PROP_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_PROP_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROP_LIST_GET_CLASS(obj : longint) : longint;
begin
  IBUS_PROP_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_PROP_LIST,IBusPropListClass);
end;


end.
