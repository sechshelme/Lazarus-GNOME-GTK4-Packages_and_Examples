
unit lsmdomelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomelement.h
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
Pchar  = ^char;
PLsmDomElement  = ^LsmDomElement;
PLsmDomElementClass  = ^LsmDomElementClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_DOM_ELEMENT_H}
{$define LSM_DOM_ELEMENT_H}
{$include <lsmdom.h>}
{$include <lsmdomnode.h>}

{ was #define dname def_expr }
function LSM_TYPE_DOM_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_ELEMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmDomElement = ^TLsmDomElement;
  TLsmDomElement = record
      node : TLsmDomNode;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PLsmDomElementClass = ^TLsmDomElementClass;
  TLsmDomElementClass = record
      parent_class : TLsmDomNodeClass;
      get_attribute : function (self:PLsmDomElement; name:Pchar):Pchar;cdecl;
      set_attribute : procedure (self:PLsmDomElement; name:Pchar; attribute_value:Pchar);cdecl;
      get_serialized_attributes : function (self:PLsmDomElement):Pchar;cdecl;
    end;


function lsm_dom_element_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_dom_element_get_tag_name(self:PLsmDomElement):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_dom_element_get_attribute(self:PLsmDomElement; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_dom_element_set_attribute(self:PLsmDomElement; name:Pchar; attribute_value:Pchar);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_DOM_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_DOM_ELEMENT:=lsm_dom_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_ELEMENT(obj : longint) : longint;
begin
  LSM_DOM_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_DOM_ELEMENT,LsmDomElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_DOM_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_DOM_ELEMENT,LsmDomElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_DOM_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_DOM_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_DOM_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_DOM_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_DOM_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_DOM_ELEMENT,LsmDomElementClass);
end;


end.
