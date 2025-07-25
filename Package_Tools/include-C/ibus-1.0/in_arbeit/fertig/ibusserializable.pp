
unit ibusserializable;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusserializable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusserializable.h
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
PGVariant  = ^GVariant;
PGVariantBuilder  = ^GVariantBuilder;
PIBusSerializable  = ^IBusSerializable;
PIBusSerializableClass  = ^IBusSerializableClass;
PIBusSerializablePrivate  = ^IBusSerializablePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2018 Takao Fujiwara <takao.fujiwara1@gmail.com>
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
{$ifndef __IBUS_SERIALIZABLE_H_}
{$define __IBUS_SERIALIZABLE_H_}
{*
 * SECTION: ibusserializable
 * @short_description: A serializable object.
 * @stability: Stable
 *
 * An #IBusSerializable is an IBus object which can be serialized, that is,
 * to be to and from a #GVariant.
 *
 * This class is to be extended by other class that requires serialization.
 * An extended class should overrides following methods:
 * <itemizedlist>
 *    <listitem>
 *       <para><function>serialize(object,iter)</function>: for serialize.</para>
 *    </listitem>
 *    <listitem>
 *       <para><function>deserialize(object,iter)</function>: for deserialize.</para>
 *    </listitem>
 *    <listitem>
 *       <para><function>copy(desc,src)</function>: for copy between IBusSerializable.</para>
 *    </listitem>
 * </itemizedlist>
 * See IBusSerializableSerializeFunc(), IBusSerializableDeserializeFunc(), IBusSerializableCopyFunc()
 * for function prototype.
  }
{$include "ibusobject.h"}
{
 * Type macros.
  }
{ define IBusSerializable macros  }

{ was #define dname def_expr }
function IBUS_TYPE_SERIALIZABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERIALIZABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERIALIZABLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERIALIZABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERIALIZABLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERIALIZABLE_GET_CLASS(obj : longint) : longint;

{*
 * ibus_serializable_set_attachment:
 * @o: An IBusSerializable.
 * @k: String formatted key for indexing value.
 * @v: Value to be attached. Should be also serializable.
 *
 * Attach a value to an IBusSerializable.
 * This macro is an convenient wrapper of ibus_serializable_set_qattachment().
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ibus_serializable_set_attachment(o,k,v : longint) : longint;

{*
 * ibus_serializable_get_attachment:
 * @o: An #IBusSerializable.
 * @k: String formatted key for indexing value.
 *
 * Get a value from attachment of an #IBusSerializable.
 * This macro is an convenient wrapper of ibus_serializable_get_qattachment().
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ibus_serializable_get_attachment(o,k : longint) : longint;

{*
 * ibus_serializable_remove_attachment:
 * @o: An #IBusSerializable.
 * @k: String formatted key for indexing value.
 *
 * Remove a value from attachment of an #IBusSerializable.
 * This macro is an convenient wrapper of ibus_serializable_remove_qattachment().
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ibus_serializable_remove_attachment(o,k : longint) : longint;

type
{*
 * IBusSerializable:
 *
 * All the fields in the <structname>IBusSerializable</structname> structure are
 * private to the #IBusSerializable and should never be accessed directly.
  }
{< private > }
{ instance members  }
  PIBusSerializable = ^TIBusSerializable;
  TIBusSerializable = record
      parent : TIBusObject;
      priv : PIBusSerializablePrivate;
    end;

{*
 * IBusSerializableSerializeFunc:
 * @serializable: An #IBusSerializable.
 * @builder: A #GVariantBuilder.
 *
 * Prototype of serialize function.
 * Serialize function convert an #IBusSerializable to #GVariantBuilder.
 * Returns a gboolean value which indicates whether the conversion is success.
 * Return %TRUE if succeed.
 *
 * Returns: %TRUE if succeed; %FALSE otherwise.
  }

  TIBusSerializableSerializeFunc = function (serializable:PIBusSerializable; builder:PGVariantBuilder):Tgboolean;cdecl;
{*
 * IBusSerializableDeserializeFunc:
 * @serializable: An #IBusSerializable.
 * @variant: A #GVariant contains a tuple.
 *
 * Prototype of deserialize function.
 * Deserialize function convert a #GVariant to #IBusSerializable.
 * Returns an integer value which indicates how many values in
 * the variant(tuple) are consumed.
 *
 * Returns: The number of values in the variant(tuple) are consumed.
  }

  TIBusSerializableDeserializeFunc = function (serializable:PIBusSerializable; variant:PGVariant):Tgint;cdecl;
{*
 * IBusSerializableCopyFunc:
 * @dest: The destination #IBusSerializable.
 * @src: A source #IBusSerializable.
 *
 * Prototype of copy function.
 * Copy function copy from source #IBusSerializable to the destination one.
 * Returns a gboolean value which indicates whether the copying is success.
 *
 * Returns: %TRUE if succeed; %FALSE otherwise.
  }
(* Const before type ignored *)

  TIBusSerializableCopyFunc = function (dest:PIBusSerializable; src:PIBusSerializable):Tgboolean;cdecl;
{< private > }
{ virtual table  }
(* Const before type ignored *)
{< private > }
{ padding  }
  PIBusSerializableClass = ^TIBusSerializableClass;
  TIBusSerializableClass = record
      parent : TIBusObjectClass;cdecl;
      serialize : function (object:PIBusSerializable; builder:PGVariantBuilder):Tgboolean;cdecl;
      deserialize : function (object:PIBusSerializable; variant:PGVariant):Tgint;cdecl;
      copy : function (dest:PIBusSerializable; src:PIBusSerializable):Tgboolean;cdecl;
      pdummy : array[0..4] of Tgpointer;
    end;


function ibus_serializable_get_type:TGType;cdecl;external;
{*
 * ibus_serializable_new:
 *
 * Creates a new instance of an #IBusSerializable.
 *
 * Returns: a new instance of #IBusSerializable.
  }
function ibus_serializable_new:PIBusSerializable;cdecl;external;
{*
 * ibus_serializable_set_qattachment:
 * @serializable: An #IBusSerializable.
 * @key: String formatted key for indexing value.
 * @value: Value to be attached or %NULL to remove any prevoius value.
 *
 * Attach a value to an #IBusSerializable. If the value is floating,
 * the serializable will take the ownership.
 *
 * See also: ibus_serializable_set_attachment().
  }
procedure ibus_serializable_set_qattachment(serializable:PIBusSerializable; key:TGQuark; value:PGVariant);cdecl;external;
{*
 * ibus_serializable_get_qattachment:
 * @serializable: An #IBusSerializable.
 * @key: String formatted key for indexing value.
 *
 * Gets a value from attachment of an #IBusSerializable.
 *
 * Returns: The attached value; or %NULL if fail to retrieve the value.
 *
 * See also: ibus_serializable_set_attachment().
  }
function ibus_serializable_get_qattachment(serializable:PIBusSerializable; key:TGQuark):PGVariant;cdecl;external;
{*
 * ibus_serializable_remove_qattachment:
 * @serializable: An #IBusSerializable.
 * @key: String formatted key for indexing value.
 *
 * Remove a value from attachment of an #IBusSerializable.
 * See also: ibus_serializable_remove_attachment().
  }
procedure ibus_serializable_remove_qattachment(serializable:PIBusSerializable; key:TGQuark);cdecl;external;
{*
 * ibus_serializable_copy:
 * @serializable: An #IBusSerializable.
 *
 * Clone an #IBusSerializable.
 * The copy method should be implemented in extended class.
 *
 * Returns: (transfer none): A newly allocated clone object; or %NULL
 *     if @object is not serializable.
 *
 * See also: IBusSerializableCopyFunc().
  }
function ibus_serializable_copy(serializable:PIBusSerializable):PIBusSerializable;cdecl;external;
{*
 * ibus_serializable_serialize_object:
 * @serializable: An #IBusSerializable.
 *
 * Serialize an #IBusSerializable to a #GVariant.
 * The serialize method should be implemented in extended class.
 *
 * Returns: A #GVariant.
 *
 * See also: IBusSerializableCopyFunc().
  }
function ibus_serializable_serialize_object(serializable:PIBusSerializable):PGVariant;cdecl;external;
{*
 * ibus_serializable_deserialize_object:
 * @variant: A #GVariant.
 *
 * Deserialize a #GVariant to an #IBusSerializable/
 * The deserialize method should be implemented in extended class.
 *
 * Returns: (transfer none): The deserialized #IBusSerializable.
 *
 * See also: IBusSerializableCopyFunc().
  }
function ibus_serializable_deserialize_object(variant:PGVariant):PIBusSerializable;cdecl;external;
const
  ibus_serializable_serialize = ibus_serializable_serialize_object;  
  ibus_serializable_deserialize = ibus_serializable_deserialize_object;  
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_SERIALIZABLE : longint; { return type might be wrong }
  begin
    IBUS_TYPE_SERIALIZABLE:=ibus_serializable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERIALIZABLE(obj : longint) : longint;
begin
  IBUS_SERIALIZABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_SERIALIZABLE,IBusSerializable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERIALIZABLE_CLASS(klass : longint) : longint;
begin
  IBUS_SERIALIZABLE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_SERIALIZABLE,IBusSerializableClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERIALIZABLE(obj : longint) : longint;
begin
  IBUS_IS_SERIALIZABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_SERIALIZABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERIALIZABLE_CLASS(klass : longint) : longint;
begin
  IBUS_IS_SERIALIZABLE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_SERIALIZABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERIALIZABLE_GET_CLASS(obj : longint) : longint;
begin
  IBUS_SERIALIZABLE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_SERIALIZABLE,IBusSerializableClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ibus_serializable_set_attachment(o,k,v : longint) : longint;
begin
  ibus_serializable_set_attachment:=ibus_serializable_set_qattachment(o,g_quark_from_string(k),v);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ibus_serializable_get_attachment(o,k : longint) : longint;
begin
  ibus_serializable_get_attachment:=ibus_serializable_get_qattachment(o,g_quark_from_string(k));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ibus_serializable_remove_attachment(o,k : longint) : longint;
begin
  ibus_serializable_remove_attachment:=ibus_serializable_remove_qattachment(o,g_quark_from_string(k));
end;


end.
