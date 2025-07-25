
unit ibusattrlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusattrlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusattrlist.h
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
PIBusAttribute  = ^IBusAttribute;
PIBusAttrList  = ^IBusAttrList;
PIBusAttrListClass  = ^IBusAttrListClass;
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
{$ifndef __IBUS_ATTRIBUTE_LIST_H_}
{$define __IBUS_ATTRIBUTE_LIST_H_}
{*
 * SECTION: ibusattrlist
 * @Title: IBusAttrList
 * @Short_description: AttrList of IBusText.
 * @See_also: #IBusAttribute #IBusText
 * @Stability: Stable
 *
  }
{$include "ibusattribute.h"}
{
 * Type macros.
  }
{ define IBusAttrList macros  }

{ was #define dname def_expr }
function IBUS_TYPE_ATTR_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTR_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTR_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTR_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTR_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTR_LIST_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusAttrList:
 * @attributes: GArray that holds #IBusAttribute.
 *
 * Array of IBusAttribute.
  }
{< public > }
  PIBusAttrList = ^TIBusAttrList;
  TIBusAttrList = record
      parent : TIBusSerializable;
      attributes : PGArray;
    end;

  PIBusAttrListClass = ^TIBusAttrListClass;
  TIBusAttrListClass = record
      parent : TIBusSerializableClass;
    end;

{*
 * ibus_attr_list_get_type:
 *
 * Returns GType of #IBusAttrList.
 *
 * Returns: GType of #IBusAttrList.
  }

function ibus_attr_list_get_type:TGType;cdecl;external;
{*
 * ibus_attr_list_new:
 *
 * Creates an new #IBusAttrList.
 *
 * Returns: A newly allocated #IBusAttrList.
  }
function ibus_attr_list_new:PIBusAttrList;cdecl;external;
{*
 * ibus_attr_list_append:
 * @attr_list: An IBusAttrList instance.
 * @attr: The IBusAttribute instance to be appended.
 *
 * Append an IBusAttribute to IBusAttrList, and increase reference.
  }
procedure ibus_attr_list_append(attr_list:PIBusAttrList; attr:PIBusAttribute);cdecl;external;
{*
 * ibus_attr_list_get:
 * @attr_list: An IBusAttrList instance.
 * @index: Index of the @attr_list.
 *
 * Returns #IBusAttribute at given index. Borrowed reference.
 *
 * Returns: (transfer none): #IBusAttribute at given index, %NULL if no such
 *        #IBusAttribute.
  }
function ibus_attr_list_get(attr_list:PIBusAttrList; index:Tguint):PIBusAttribute;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_ATTR_LIST : longint; { return type might be wrong }
  begin
    IBUS_TYPE_ATTR_LIST:=ibus_attr_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTR_LIST(obj : longint) : longint;
begin
  IBUS_ATTR_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_ATTR_LIST,IBusAttrList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTR_LIST_CLASS(klass : longint) : longint;
begin
  IBUS_ATTR_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_ATTR_LIST,IBusAttrListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTR_LIST(obj : longint) : longint;
begin
  IBUS_IS_ATTR_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_ATTR_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTR_LIST_CLASS(klass : longint) : longint;
begin
  IBUS_IS_ATTR_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_ATTR_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTR_LIST_GET_CLASS(obj : longint) : longint;
begin
  IBUS_ATTR_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_ATTR_LIST,IBusAttrListClass);
end;


end.
