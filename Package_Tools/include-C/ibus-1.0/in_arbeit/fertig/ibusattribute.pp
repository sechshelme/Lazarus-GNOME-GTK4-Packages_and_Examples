
unit ibusattribute;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusattribute.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusattribute.h
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
PIBusAttribute  = ^IBusAttribute;
PIBusAttributeClass  = ^IBusAttributeClass;
PIBusAttrType  = ^IBusAttrType;
PIBusAttrUnderline  = ^IBusAttrUnderline;
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
{$ifndef __IBUS_ATTRIBUTE_H_}
{$define __IBUS_ATTRIBUTE_H_}
{*
 * SECTION: ibusattribute
 * @short_description: Attributes of IBusText.
 * @see_also: #IBusText
 * @stability: Stable
 *
 * An IBusAttribute represents an attribute that associate to IBusText.
 * It decorates preedit buffer and auxiliary text with underline, foreground
 * and background colors.
  }
{$include "ibusserializable.h"}
{
 * Type macros.
  }
{ define IBusAttribute macros  }

{ was #define dname def_expr }
function IBUS_TYPE_ATTRIBUTE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTRIBUTE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTRIBUTE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTRIBUTE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTRIBUTE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTRIBUTE_GET_CLASS(obj : longint) : longint;

{*
 * IBusAttrType:
 * @IBUS_ATTR_TYPE_UNDERLINE: Decorate with underline.
 * @IBUS_ATTR_TYPE_FOREGROUND: Foreground color.
 * @IBUS_ATTR_TYPE_BACKGROUND: Background color.
 *
 * Type enumeration of IBusText attribute.
  }
type
  PIBusAttrType = ^TIBusAttrType;
  TIBusAttrType =  Longint;
  Const
    IBUS_ATTR_TYPE_UNDERLINE = 1;
    IBUS_ATTR_TYPE_FOREGROUND = 2;
    IBUS_ATTR_TYPE_BACKGROUND = 3;
;
{*
 * IBusAttrUnderline:
 * @IBUS_ATTR_UNDERLINE_NONE: No underline.
 * @IBUS_ATTR_UNDERLINE_SINGLE: Single underline.
 * @IBUS_ATTR_UNDERLINE_DOUBLE: Double underline.
 * @IBUS_ATTR_UNDERLINE_LOW: Low underline ? FIXME
 * @IBUS_ATTR_UNDERLINE_ERROR: Error underline
 *
 * Type of IBusText attribute.
  }
type
  PIBusAttrUnderline = ^TIBusAttrUnderline;
  TIBusAttrUnderline =  Longint;
  Const
    IBUS_ATTR_UNDERLINE_NONE = 0;
    IBUS_ATTR_UNDERLINE_SINGLE = 1;
    IBUS_ATTR_UNDERLINE_DOUBLE = 2;
    IBUS_ATTR_UNDERLINE_LOW = 3;
    IBUS_ATTR_UNDERLINE_ERROR = 4;
;
type
{*
 * IBusAttribute:
 * @type: IBusAttributeType
 * @value: Value for the type.
 * @start_index: The starting index, inclusive.
 * @end_index: The ending index, exclusive.
 *
 * Signify the type, value and scope of the attribute.
 * The scope starts from @start_index till the @end_index-1.
  }
{< public > }
  PIBusAttribute = ^TIBusAttribute;
  TIBusAttribute = record
      parent : TIBusSerializable;
      _type : Tguint;
      value : Tguint;
      start_index : Tguint;
      end_index : Tguint;
    end;

  PIBusAttributeClass = ^TIBusAttributeClass;
  TIBusAttributeClass = record
      parent : TIBusSerializableClass;
    end;

{*
 * ibus_attribute_get_type:
 * @returns: GType of IBusAttribute.
 *
 * Returns GType of IBusAttribute.
  }

function ibus_attribute_get_type:TGType;cdecl;external;
{*
 * ibus_attribute_new:
 * @type: Type of the attribute.
 * @value: Value of the attribute.
 * @start_index: Where attribute starts.
 * @end_index: Where attribute ends.
 *
 * Creates a new IBusAttribute.
 *
 * Returns: (transfer none): A newly allocated IBusAttribute.
  }
function ibus_attribute_new(_type:Tguint; value:Tguint; start_index:Tguint; end_index:Tguint):PIBusAttribute;cdecl;external;
{*
 * ibus_attribute_get_attr_type:
 * @attr: An #IBusAttribute
 *
 * Gets an enum of #IBusAttrType.
 *
 * Returns: An enum of #IBusAttrType.
  }
function ibus_attribute_get_attr_type(attr:PIBusAttribute):Tguint;cdecl;external;
{*
 * ibus_attribute_get_value:
 * @attr: An #IBusAttribute
 *
 * Gets an unsigned int value relative with #IBusAttrType.
 * If the type is %IBUS_ATTR_TYPE_UNDERLINE, the return value is
 * #IBusAttrUnderline. If the type is %IBUS_ATTR_TYPE_FOREGROUND,
 * the return value is the color RGB.
 *
 * Returns: An unsigned int value relative with #IBusAttrType.
  }
function ibus_attribute_get_value(attr:PIBusAttribute):Tguint;cdecl;external;
{*
 * ibus_attribute_get_start_index:
 * @attr: An #IBusAttribute
 *
 * Gets a start unsigned index
 *
 * Returns: A start unsigned index
  }
function ibus_attribute_get_start_index(attr:PIBusAttribute):Tguint;cdecl;external;
{*
 * ibus_attribute_get_end_index:
 * @attr: An #IBusAttribute
 *
 * Gets an end unsigned index
 *
 * Returns: A end unsigned index
  }
function ibus_attribute_get_end_index(attr:PIBusAttribute):Tguint;cdecl;external;
{*
 * ibus_attr_underline_new:
 * @underline_type: Type of underline.
 * @start_index: Where attribute starts.
 * @end_index: Where attribute ends.
 *
 * Creates a new underline #IBusAttribute.
 *
 * Returns: (transfer none): A newly allocated #IBusAttribute.
  }
function ibus_attr_underline_new(underline_type:Tguint; start_index:Tguint; end_index:Tguint):PIBusAttribute;cdecl;external;
{*
 * ibus_attr_foreground_new:
 * @color: Color in RGB.
 * @start_index: Where attribute starts.
 * @end_index: Where attribute ends.
 *
 * Creates a new foreground #IBusAttribute.
 *
 * Returns: (transfer none): A newly allocated #IBusAttribute.
  }
function ibus_attr_foreground_new(color:Tguint; start_index:Tguint; end_index:Tguint):PIBusAttribute;cdecl;external;
{*
 * ibus_attr_background_new:
 * @color: Color in RGB.
 * @start_index: Where attribute starts.
 * @end_index: Where attribute ends.
 *
 * Creates a new background #IBusAttribute.
 *
 * Returns: (transfer none): A newly allocated #IBusAttribute.
  }
function ibus_attr_background_new(color:Tguint; start_index:Tguint; end_index:Tguint):PIBusAttribute;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_ATTRIBUTE : longint; { return type might be wrong }
  begin
    IBUS_TYPE_ATTRIBUTE:=ibus_attribute_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTRIBUTE(obj : longint) : longint;
begin
  IBUS_ATTRIBUTE:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_ATTRIBUTE,IBusAttribute);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTRIBUTE_CLASS(klass : longint) : longint;
begin
  IBUS_ATTRIBUTE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_ATTRIBUTE,IBusAttributeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTRIBUTE(obj : longint) : longint;
begin
  IBUS_IS_ATTRIBUTE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_ATTRIBUTE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ATTRIBUTE_CLASS(klass : longint) : longint;
begin
  IBUS_IS_ATTRIBUTE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_ATTRIBUTE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ATTRIBUTE_GET_CLASS(obj : longint) : longint;
begin
  IBUS_ATTRIBUTE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_ATTRIBUTE,IBusAttributeClass);
end;


end.
