
unit ibusenginedesc;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusenginedesc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusenginedesc.h
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
PGString  = ^GString;
PIBusEngineDesc  = ^IBusEngineDesc;
PIBusEngineDescClass  = ^IBusEngineDescClass;
PIBusEngineDescPrivate  = ^IBusEngineDescPrivate;
PXMLNode  = ^XMLNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ bus - The Input Bus
 * Copyright (C) 2008-2015 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2011-2018 Takao Fujiwara <takao.fujiwara1@gmail.com>
 * Copyright (C) 2008-2018 Red Hat, Inc.
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
{$ifndef __IBUS_ENGINE_DESC_H_}
{$define __IBUS_ENGINE_DESC_H_}
{*
 * SECTION: ibusenginedesc
 * @short_description:  Input method engine description data.
 * @title: IBusEngineDesc
 * @stability: Stable
 *
 * An IBusEngineDesc stores description data of IBusEngine.
 * The description data can either be passed to ibus_engine_desc_new(),
 * or loaded from an XML node through ibus_engine_desc_new_from_xml_node()
 * to construct IBusEngineDesc.
 *
 * However, the recommended way to load engine description data is
 * using ibus_component_new_from_file() to load a component file,
 * which also includes engine description data.
 *
 * see_also: #IBusComponent, #IBusEngine
 *
  }
{$include "ibusserializable.h"}
{$include "ibusxml.h"}
{
 * Type macros.
  }
{ define GOBJECT macros  }

{ was #define dname def_expr }
function IBUS_TYPE_ENGINE_DESC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_DESC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_DESC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE_DESC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE_DESC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_DESC_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusEngineDesc:
 *
 * Input method engine description data.
 * You can get extended values with g_object_get_properties.
  }
{ instance members  }
{< public > }
{< private > }
  PIBusEngineDesc = ^TIBusEngineDesc;
  TIBusEngineDesc = record
      parent : TIBusSerializable;
      priv : PIBusEngineDescPrivate;
    end;

{ class members  }
  PIBusEngineDescClass = ^TIBusEngineDescClass;
  TIBusEngineDescClass = record
      parent : TIBusSerializableClass;
    end;


function ibus_engine_desc_get_type:TGType;cdecl;external;
{*
 * ibus_engine_desc_new:
 * @name: Name of the engine.
 * @longname: Long name of the input method engine.
 * @description: Input method engine description.
 * @language: Language (e.g. zh, jp) supported by this input method engine.
 * @license: License of the input method engine.
 * @author: Author of the input method engine.
 * @icon: Icon file of this engine.
 * @layout: Keyboard layout
 *
 * Creates a new #IBusEngineDesc.
 * If layout is "default", the engine inherits the current layout and
 * does not change the layout. The layouts "default" and "" are same.
 * E.g. If you switch JP XKB engine and an input method engine (IME),
 * the IME inherits the JP layout.
 *
 * Returns: A newly allocated IBusEngineDesc.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ibus_engine_desc_new(name:Pgchar; longname:Pgchar; description:Pgchar; language:Pgchar; license:Pgchar; 
           author:Pgchar; icon:Pgchar; layout:Pgchar):PIBusEngineDesc;cdecl;external;
{*
 * ibus_engine_desc_new_varargs:
 * @first_property_name: Name of the first property.
 * @...: the NULL-terminated arguments of the properties and values.
 *
 * Creates a new #IBusEngineDesc.
 * ibus_engine_desc_new_varargs() supports the va_list format.
 * name property is required. e.g.
 * ibus_engine_desc_new_varargs("name", "ibus-foo", "language", "us", NULL)
 * If layout is "default", the engine inherits the current layout and
 * does not change the layout. The layouts "default" and "" are same.
 * E.g. If you switch JP XKB engine and an input method engine (IME),
 * the IME inherits the JP layout.
 *
 * Returns: A newly allocated IBusEngineDesc.
  }
(* Const before type ignored *)
function ibus_engine_desc_new_varargs(first_property_name:Pgchar; args:array of const):PIBusEngineDesc;cdecl;external;
function ibus_engine_desc_new_varargs(first_property_name:Pgchar):PIBusEngineDesc;cdecl;external;
{*
 * ibus_engine_desc_new_from_xml_node:
 * @node: An XML node
 *
 * Creates a new IBusEngineDesc from an XML node.
 * <note><para>This function is called by ibus_component_new_from_file(),
 *  so developers normally do not need to call it directly.
 * </para></note>
 *
 * Returns: A newly allocated IBusEngineDesc that contains description from
 * @node.
  }
function ibus_engine_desc_new_from_xml_node(node:PXMLNode):PIBusEngineDesc;cdecl;external;
{*
 * ibus_engine_desc_get_name:
 * @info: An IBusEngineDesc
 *
 * Gets the name property in IBusEngineDesc. It should not be freed.
 *
 * Returns: name property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_name(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_longname:
 * @info: An IBusEngineDesc
 *
 * Gets the longname property in IBusEngineDesc. It should not be freed.
 *
 * Returns: longname property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_longname(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_description:
 * @info: An IBusEngineDesc
 *
 * Gets the description property in IBusEngineDesc. It should not be freed.
 *
 * Returns: description property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_description(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_language:
 * @info: An IBusEngineDesc
 *
 * Gets the language property in IBusEngineDesc. It should not be freed.
 *
 * Returns: language property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_language(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_license:
 * @info: An IBusEngineDesc
 *
 * Gets the license property in IBusEngineDesc. It should not be freed.
 *
 * Returns: license property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_license(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_author:
 * @info: An IBusEngineDesc
 *
 * Gets the author property in IBusEngineDesc. It should not be freed.
 *
 * Returns: author property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_author(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_icon:
 * @info: An IBusEngineDesc
 *
 * Gets the icon property in IBusEngineDesc. It should not be freed.
 *
 * Returns: icon property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_icon(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_layout:
 * @info: An IBusEngineDesc
 *
 * Gets the layout property in IBusEngineDesc. It should not be freed.
 *
 * Returns: layout property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_layout(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_layout_variant:
 * @info: An IBusEngineDesc
 *
 * Gets the keyboard variant property in IBusEngineDesc. It should not be freed.
 *
 * Returns: keyboard variant property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_layout_variant(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_layout_option:
 * @info: An IBusEngineDesc
 *
 * Gets the keyboard option property in IBusEngineDesc. It should not be freed.
 *
 * Returns: keyboard option property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_layout_option(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_rank:
 * @info: An IBusEngineDesc
 *
 * Gets the rank property in IBusEngineDesc.
 *
 * Returns: rank property in IBusEngineDesc
  }
function ibus_engine_desc_get_rank(info:PIBusEngineDesc):Tguint;cdecl;external;
{*
 * ibus_engine_desc_get_hotkeys:
 * @info: An IBusEngineDesc
 *
 * Gets the hotkeys property in IBusEngineDesc. It should not be freed.
 *
 * Returns: hotkeys property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_hotkeys(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_symbol:
 * @info: An IBusEngineDesc
 *
 * Gets the symbol property in IBusEngineDesc. It should not be freed.
 *
 * Returns: symbol property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_symbol(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_setup:
 * @info: An IBusEngineDesc
 *
 * Gets the setup property in IBusEngineDesc. It should not be freed.
 *
 * Returns: setup property in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_setup(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_version:
 * @info: An IBusEngineDesc
 *
 * Gets the version property in IBusEngineDesc. It should not be freed.
 *
 * Returns: version in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_version(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_textdomain:
 * @info: An IBusEngineDesc
 *
 * Gets the textdomain property in IBusEngineDesc. It should not be freed.
 *
 * Returns: textdomain in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_textdomain(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_get_icon_prop_key:
 * @info: An IBusEngineDesc
 *
 * Gets the key of IBusProperty to load the panel icon dynamically
 * in IBusEngineDesc. It should not be freed.
 *
 * Returns: IBusProperty.key for dynamic panel icon in IBusEngineDesc
  }
(* Const before type ignored *)
function ibus_engine_desc_get_icon_prop_key(info:PIBusEngineDesc):Pgchar;cdecl;external;
{*
 * ibus_engine_desc_output:
 * @info: An IBusEngineDesc
 * @output: XML-formatted Input method engine description.
 * @indent: Number of indent (showed as 4 spaces).
 *
 * Output XML-formatted input method engine description.
 * The result will be append to GString specified in @output.
  }
procedure ibus_engine_desc_output(info:PIBusEngineDesc; output:PGString; indent:Tgint);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_ENGINE_DESC : longint; { return type might be wrong }
  begin
    IBUS_TYPE_ENGINE_DESC:=ibus_engine_desc_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_DESC(obj : longint) : longint;
begin
  IBUS_ENGINE_DESC:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_ENGINE_DESC,IBusEngineDesc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_DESC_CLASS(klass : longint) : longint;
begin
  IBUS_ENGINE_DESC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_ENGINE_DESC,IBusEngineDescClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE_DESC(obj : longint) : longint;
begin
  IBUS_IS_ENGINE_DESC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_ENGINE_DESC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE_DESC_CLASS(klass : longint) : longint;
begin
  IBUS_IS_ENGINE_DESC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_ENGINE_DESC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_DESC_GET_CLASS(obj : longint) : longint;
begin
  IBUS_ENGINE_DESC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_ENGINE_DESC,IBusEngineDescClass);
end;


end.
