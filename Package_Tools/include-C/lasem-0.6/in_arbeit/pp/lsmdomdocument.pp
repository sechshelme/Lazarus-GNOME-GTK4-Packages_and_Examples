
unit lsmdomdocument;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomdocument.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomdocument.h
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
Pgsize  = ^gsize;
PLsmDomDocument  = ^LsmDomDocument;
PLsmDomDocumentClass  = ^LsmDomDocumentClass;
PLsmDomElement  = ^LsmDomElement;
PLsmDomText  = ^LsmDomText;
PLsmDomView  = ^LsmDomView;
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
{$ifndef LSM_DOM_DOCUMENT_H}
{$define LSM_DOM_DOCUMENT_H}
{$include <lsmtypes.h>}
{$include <lsmdomtypes.h>}
{$include <lsmdomnode.h>}
{$include <lsmdomview.h>}

{ was #define dname def_expr }
function LSM_TYPE_DOM_DOCUMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_DOCUMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_DOCUMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_DOCUMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_DOCUMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_DOCUMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmDomDocument = ^TLsmDomDocument;
  TLsmDomDocument = record
      node : TLsmDomNode;
      url : Pchar;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
  PLsmDomDocumentClass = ^TLsmDomDocumentClass;
  TLsmDomDocumentClass = record
      parent_class : TLsmDomNodeClass;
      get_document_element : function (self:PLsmDomDocument):PLsmDomElement;cdecl;
      create_element : function (self:PLsmDomDocument; tag_name:Pchar):PLsmDomElement;cdecl;
      create_text_node : function (self:PLsmDomDocument; data:Pchar):PLsmDomText;cdecl;
      create_view : function (self:PLsmDomDocument):PLsmDomView;cdecl;
    end;


function lsm_dom_document_get_type:TGType;cdecl;external;
function lsm_dom_document_get_document_element(self:PLsmDomDocument):PLsmDomElement;cdecl;external;
(* Const before type ignored *)
function lsm_dom_document_create_element(self:PLsmDomDocument; tag_name:Pchar):PLsmDomElement;cdecl;external;
(* Const before type ignored *)
function lsm_dom_document_create_text_node(self:PLsmDomDocument; data:Pchar):PLsmDomText;cdecl;external;
function lsm_dom_document_create_view(self:PLsmDomDocument):PLsmDomView;cdecl;external;
(* Const before type ignored *)
function lsm_dom_document_get_url(self:PLsmDomDocument):Pchar;cdecl;external;
(* Const before type ignored *)
procedure lsm_dom_document_set_url(self:PLsmDomDocument; url:Pchar);cdecl;external;
(* Const before type ignored *)
procedure lsm_dom_document_set_path(self:PLsmDomDocument; path:Pchar);cdecl;external;
(* Const before type ignored *)
function lsm_dom_document_get_href_data(self:PLsmDomDocument; href:Pchar; size:Pgsize):pointer;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_DOM_DOCUMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_DOM_DOCUMENT:=lsm_dom_document_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_DOCUMENT(obj : longint) : longint;
begin
  LSM_DOM_DOCUMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_DOM_DOCUMENT,LsmDomDocument);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_DOCUMENT_CLASS(klass : longint) : longint;
begin
  LSM_DOM_DOCUMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_DOM_DOCUMENT,LsmDomDocumentClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_DOCUMENT(obj : longint) : longint;
begin
  LSM_IS_DOM_DOCUMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_DOM_DOCUMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_DOCUMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_DOM_DOCUMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_DOM_DOCUMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_DOCUMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_DOM_DOCUMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_DOM_DOCUMENT,LsmDomDocumentClass);
end;


end.
