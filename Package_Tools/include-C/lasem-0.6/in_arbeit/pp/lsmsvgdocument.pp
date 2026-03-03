
unit lsmsvgdocument;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgdocument.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgdocument.h
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
PGHashTable  = ^GHashTable;
PLsmDomDocument  = ^LsmDomDocument;
PLsmSvgDocument  = ^LsmSvgDocument;
PLsmSvgDocumentClass  = ^LsmSvgDocumentClass;
PLsmSvgElement  = ^LsmSvgElement;
PLsmSvgSvgElement  = ^LsmSvgSvgElement;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009 Emmanuel Pacaud
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
{$ifndef LSM_SVG_DOCUMENT_H}
{$define LSM_SVG_DOCUMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmdomdocument.h>}

{ was #define dname def_expr }
function LSM_TYPE_SVG_DOCUMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_DOCUMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_DOCUMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_DOCUMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_DOCUMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_DOCUMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgDocument = ^TLsmSvgDocument;
  TLsmSvgDocument = record
      document : TLsmDomDocument;
      ids : PGHashTable;
    end;

  PLsmSvgDocumentClass = ^TLsmSvgDocumentClass;
  TLsmSvgDocumentClass = record
      parent_class : TLsmDomDocumentClass;
    end;


function lsm_svg_document_get_type:TGType;cdecl;external;
function lsm_svg_document_new:PLsmDomDocument;cdecl;external;
(* Const before type ignored *)
function lsm_svg_document_get_root_element(document:PLsmSvgDocument):PLsmSvgSvgElement;cdecl;external;
(* Const before type ignored *)
function lsm_svg_document_get_element_by_url(document:PLsmSvgDocument; url:Pchar):PLsmSvgElement;cdecl;external;
(* Const before type ignored *)
function lsm_svg_document_get_element_by_id(self:PLsmSvgDocument; id:Pchar):PLsmSvgElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_document_register_element(self:PLsmSvgDocument; element:PLsmSvgElement; id:Pchar; old_id:Pchar);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_DOCUMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_DOCUMENT:=lsm_svg_document_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_DOCUMENT(obj : longint) : longint;
begin
  LSM_SVG_DOCUMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_DOCUMENT,LsmSvgDocument);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_DOCUMENT_CLASS(klass : longint) : longint;
begin
  LSM_SVG_DOCUMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_DOCUMENT,LsmSvgDocumentClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_DOCUMENT(obj : longint) : longint;
begin
  LSM_IS_SVG_DOCUMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_DOCUMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_DOCUMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_DOCUMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_DOCUMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_DOCUMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_DOCUMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_DOCUMENT,LsmSvgDocumentClass);
end;


end.
