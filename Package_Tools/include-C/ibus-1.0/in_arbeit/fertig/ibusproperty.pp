
unit ibusproperty;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusproperty.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusproperty.h
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
PIBusProperty  = ^IBusProperty;
PIBusPropertyClass  = ^IBusPropertyClass;
PIBusPropertyPrivate  = ^IBusPropertyPrivate;
PIBusPropList  = ^IBusPropList;
PIBusPropState  = ^IBusPropState;
PIBusPropType  = ^IBusPropType;
PIBusText  = ^IBusText;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ IBus - The Input Bus
 * Copyright (C) 2008-2010 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2008-2010 Red Hat, Inc.
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
{$ifndef __IBUS_PROPERTY_H_}
{$define __IBUS_PROPERTY_H_}
{$include "ibusserializable.h"}
{$include "ibustext.h"}
{*
 * SECTION: ibusproperty
 * @short_description: UI component for input method engine property.
 * @title: IBusProperty
 * @stability: Stable
 *
 * An IBusProperty is an UI component like a button or a menu item
 * which shows the status of corresponding input method engine property.
 * End user can operate and see the current status of IME through these components.
 * For example, ibus-chewing users change the English/Chinese input mode by
 * pressing ctrl-space or click on the Eng/Chi switch button.
 * And the IBusProperty shows the change correspondingly.
 *
 * see_also: #IBusPropList, #IBusEngine
  }
{
 * Type macros.
  }
{ define IBusProperty macros  }

{ was #define dname def_expr }
function IBUS_TYPE_PROPERTY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROPERTY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROPERTY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROPERTY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROPERTY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROPERTY_GET_CLASS(obj : longint) : longint;

{*
 * IBusPropType:
 * @PROP_TYPE_NORMAL: Property is shown as normal text.
 * @PROP_TYPE_TOGGLE: Property is shown as a toggle button.
 * @PROP_TYPE_RADIO: Property is shown as a radio selection option.
 * @PROP_TYPE_MENU: Property is shown as a menu, usually imply it has sub menu
 * items.
 * @PROP_TYPE_SEPARATOR: A separator for menu.
 *
 * Type enumeration of IBusProperty.
  }
type
  PIBusPropType = ^TIBusPropType;
  TIBusPropType =  Longint;
  Const
    PROP_TYPE_NORMAL = 0;
    PROP_TYPE_TOGGLE = 1;
    PROP_TYPE_RADIO = 2;
    PROP_TYPE_MENU = 3;
    PROP_TYPE_SEPARATOR = 4;
;
{*
 * IBusPropState:
 * @PROP_STATE_UNCHECKED: Property option is unchecked.
 * @PROP_STATE_CHECKED: Property option is checked.
 * @PROP_STATE_INCONSISTENT: The state is inconsistent with the associated IME
 * property.
 *
 * State of #IBusProperty. The actual effect depends on #IBusPropType of the
 * IBusProperty.
 *
 * <variablelist>
 *     <varlistentry>
 *         <term>PROP_TYPE_TOGGLE</term>
 *         <listitem><para>Emphasized if PROP_STATE_CHECKED, normal otherwise.</para></listitem>
 *     </varlistentry>
 *     <varlistentry>
 *         <term>PROP_TYPE_RADIO</term>
 *         <listitem><para>Option checked if PROP_STATE_CHECKED, unchecked otherwise.</para></listitem>
 *     </varlistentry>
 * </variablelist>
 * No effect on other types.
  }
type
  PIBusPropState = ^TIBusPropState;
  TIBusPropState =  Longint;
  Const
    PROP_STATE_UNCHECKED = 0;
    PROP_STATE_CHECKED = 1;
    PROP_STATE_INCONSISTENT = 2;
;
type
{$ifndef __PROPLIST_DEFINED}
{$define __PROPLIST_DEFINED}
type
{$endif}
{*
 * IBusProperty:
 * UI component for input method engine property.
  }
{< private > }
type
  PIBusProperty = ^TIBusProperty;
  TIBusProperty = record
      parent : TIBusSerializable;
      priv : PIBusPropertyPrivate;
      pdummy : array[0..6] of Tgpointer;
    end;

  PIBusPropertyClass = ^TIBusPropertyClass;
  TIBusPropertyClass = record
      parent : TIBusSerializableClass;
    end;


function ibus_property_get_type:TGType;cdecl;external;
{*
 * ibus_property_new:
 * @key: Unique Identity for the #IBusProperty.
 * @type: #IBusPropType of #IBusProperty.
 * @label: Text shown in UI.
 * @icon: (allow-none): Icon file for the #IBusProperty.
 * @tooltip: Message shown if mouse hovered the  #IBusProperty.
 * @sensitive: Whether the #IBusProperty is sensitive to keyboard and mouse event.
 * @visible: Whether the #IBusProperty is visible.
 * @state: IBusPropState of #IBusProperty.
 * @prop_list: (allow-none): #IBusPropList that contains sub IBusProperties.
 *
 * Creates a new #IBusProperty.
 *
 * Returns: A newly allocated #IBusProperty.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ibus_property_new(key:Pgchar; _type:TIBusPropType; _label:PIBusText; icon:Pgchar; tooltip:PIBusText; 
           sensitive:Tgboolean; visible:Tgboolean; state:TIBusPropState; prop_list:PIBusPropList):PIBusProperty;cdecl;external;
{*
 * ibus_property_new_varargs:
 * @first_property_name: Name of the first property.
 * @...: the NULL-terminated arguments of the properties and values.
 *
 * Creates a new #IBusProperty.
 * ibus_property_new_varargs() supports the va_list format.
 * name property is required. e.g.
 * ibus_property_new_varargs("key", "TypingMode", "type", PROP_TYPE_MENU, NULL)
 *
 * Returns: A newly allocated #IBusProperty.
  }
(* Const before type ignored *)
function ibus_property_new_varargs(first_property_name:Pgchar; args:array of const):PIBusProperty;cdecl;external;
function ibus_property_new_varargs(first_property_name:Pgchar):PIBusProperty;cdecl;external;
{*
 * ibus_property_get_key:
 * @prop: An #IBusProperty.
 *
 * Get the key of #IBusProperty.
 *
 * Returns: the key of #IBusProperty. Should not be freed.
  }
(* Const before type ignored *)
function ibus_property_get_key(prop:PIBusProperty):Pgchar;cdecl;external;
{*
 * ibus_property_get_label:
 * @prop: An #IBusProperty.
 *
 * Get the label of #IBusProperty.
 *
 * Returns: (transfer none): the label of #IBusProperty. Should not be freed.
  }
function ibus_property_get_label(prop:PIBusProperty):PIBusText;cdecl;external;
{*
 * ibus_property_set_label:
 * @prop: An #IBusProperty.
 * @label: Text shown in UI.
 *
 * Set the label of #IBusProperty.
  }
procedure ibus_property_set_label(prop:PIBusProperty; _label:PIBusText);cdecl;external;
{*
 * ibus_property_get_symbol:
 * @prop: An #IBusProperty.
 *
 * Get the symbol of #IBusProperty.
 *
 * Returns: (transfer none): the symbol of #IBusProperty. Should not be freed.
  }
function ibus_property_get_symbol(prop:PIBusProperty):PIBusText;cdecl;external;
{*
 * ibus_property_set_symbol:
 * @prop: An #IBusProperty.
 * @symbol: Text shown in UI.
 *
 * Set the symbol of #IBusProperty.
  }
procedure ibus_property_set_symbol(prop:PIBusProperty; symbol:PIBusText);cdecl;external;
{*
 * ibus_property_get_icon:
 * @prop: An #IBusProperty.
 *
 * Get the icon of #IBusProperty.
 *
 * Returns: the icon of #IBusProperty. Should not be freed.
  }
(* Const before type ignored *)
function ibus_property_get_icon(prop:PIBusProperty):Pgchar;cdecl;external;
{*
 * ibus_property_set_icon:
 * @prop: An #IBusProperty.
 * @icon: Icon shown in UI. It could be a full path of an icon file or an icon name.
 *
 * Set the icon of #IBusProperty.
  }
(* Const before type ignored *)
procedure ibus_property_set_icon(prop:PIBusProperty; icon:Pgchar);cdecl;external;
{*
 * ibus_property_get_tooltip:
 * @prop: An #IBusProperty.
 *
 * Get the tooltip of #IBusProperty.
 *
 * Returns: (transfer none): the tooltip of #IBusProperty. Should not be freed.
  }
function ibus_property_get_tooltip(prop:PIBusProperty):PIBusText;cdecl;external;
{*
 * ibus_property_set_tooltip:
 * @prop: An #IBusProperty.
 * @tooltip: Text of the tooltip.
 *
 * Set the tooltip of #IBusProperty.
  }
procedure ibus_property_set_tooltip(prop:PIBusProperty; tooltip:PIBusText);cdecl;external;
{*
 * ibus_property_get_sensitive:
 * @prop: An #IBusProperty.
 *
 * Get the sensitive of #IBusProperty.
 *
 * Returns: the sensitive of #IBusProperty.
  }
function ibus_property_get_sensitive(prop:PIBusProperty):Tgboolean;cdecl;external;
{*
 * ibus_property_set_sensitive:
 * @prop: An #IBusProperty.
 * @sensitive: Whether the #IBusProperty is sensitive.
 *
 * Set whether the #IBusProperty is sensitive.
  }
procedure ibus_property_set_sensitive(prop:PIBusProperty; sensitive:Tgboolean);cdecl;external;
{*
 * ibus_property_get_visible:
 * @prop: An #IBusProperty.
 *
 * Get the visible of #IBusProperty.
 *
 * Returns: the visible of #IBusProperty.
  }
function ibus_property_get_visible(prop:PIBusProperty):Tgboolean;cdecl;external;
{*
 * ibus_property_set_visible:
 * @prop: An #IBusProperty.
 * @visible: Whether the #IBusProperty is visible.
 *
 * Set whether the #IBusProperty is visible.
  }
procedure ibus_property_set_visible(prop:PIBusProperty; visible:Tgboolean);cdecl;external;
{*
 * ibus_property_get_property_type:
 * @prop: An #IBusProperty.
 *
 * Get the type of #IBusProperty.
 *
 * Returns: the type of #IBusProperty.
  }
function ibus_property_get_prop_type(prop:PIBusProperty):TIBusPropType;cdecl;external;
{*
 * ibus_property_get_state:
 * @prop: An #IBusProperty.
 *
 * Get the state of #IBusProperty.
 *
 * Returns: the state of #IBusProperty.
  }
function ibus_property_get_state(prop:PIBusProperty):TIBusPropState;cdecl;external;
{*
 * ibus_property_set_state:
 * @prop: An #IBusProperty.
 * @state: The state of the #IBusProperty.
 *
 * Set the state of the #IBusProperty.
  }
procedure ibus_property_set_state(prop:PIBusProperty; state:TIBusPropState);cdecl;external;
{*
 * ibus_property_get_sub_props:
 * @prop: An #IBusProperty.
 *
 * Get the IBusPropList of #IBusProperty.
 *
 * Returns: (transfer none): the IBusPropList of #IBusProperty.
 *     Should not be freed.
  }
function ibus_property_get_sub_props(prop:PIBusProperty):PIBusPropList;cdecl;external;
{*
 * ibus_property_set_sub_props:
 * @prop: An #IBusProperty.
 * @prop_list: #IBusPropList that contains sub IBusProperties.
 *
 * Set the sub IBusProperties.
  }
procedure ibus_property_set_sub_props(prop:PIBusProperty; prop_list:PIBusPropList);cdecl;external;
{*
 * ibus_property_update:
 * @prop: An #IBusProperty.
 * @prop_update: #IBusPropList that contains sub IBusProperties.
 *
 * Update the content of an #IBusProperty.
 * #IBusProperty @prop_update can either be sub-property of @prop,
 * or holds new values for @prop.
 *
 * Returns: TRUE if update succeeded; FALSE otherwise.
  }
function ibus_property_update(prop:PIBusProperty; prop_update:PIBusProperty):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_PROPERTY : longint; { return type might be wrong }
  begin
    IBUS_TYPE_PROPERTY:=ibus_property_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROPERTY(obj : longint) : longint;
begin
  IBUS_PROPERTY:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_PROPERTY,IBusProperty);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROPERTY_CLASS(klass : longint) : longint;
begin
  IBUS_PROPERTY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_PROPERTY,IBusPropertyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROPERTY(obj : longint) : longint;
begin
  IBUS_IS_PROPERTY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_PROPERTY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROPERTY_CLASS(klass : longint) : longint;
begin
  IBUS_IS_PROPERTY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_PROPERTY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROPERTY_GET_CLASS(obj : longint) : longint;
begin
  IBUS_PROPERTY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_PROPERTY,IBusPropertyClass);
end;


end.
