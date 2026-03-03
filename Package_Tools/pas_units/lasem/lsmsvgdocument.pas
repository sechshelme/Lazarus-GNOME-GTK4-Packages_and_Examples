unit lsmsvgdocument;

interface

uses
  fp_glib2, fp_lasem;

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


function lsm_svg_document_get_type:TGType;cdecl;external liblasem;
function lsm_svg_document_new:PLsmDomDocument;cdecl;external liblasem;
function lsm_svg_document_get_root_element(document:PLsmSvgDocument):PLsmSvgSvgElement;cdecl;external liblasem;
function lsm_svg_document_get_element_by_url(document:PLsmSvgDocument; url:Pchar):PLsmSvgElement;cdecl;external liblasem;
function lsm_svg_document_get_element_by_id(self:PLsmSvgDocument; id:Pchar):PLsmSvgElement;cdecl;external liblasem;
procedure lsm_svg_document_register_element(self:PLsmSvgDocument; element:PLsmSvgElement; id:Pchar; old_id:Pchar);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:58:52 ===

function LSM_TYPE_SVG_DOCUMENT : TGType;
function LSM_SVG_DOCUMENT(obj : Pointer) : PLsmSvgDocument;
function LSM_SVG_DOCUMENT_CLASS(klass : Pointer) : PLsmSvgDocumentClass;
function LSM_IS_SVG_DOCUMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_DOCUMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_DOCUMENT_GET_CLASS(obj : Pointer) : PLsmSvgDocumentClass;

implementation

function LSM_TYPE_SVG_DOCUMENT : TGType;
  begin
    LSM_TYPE_SVG_DOCUMENT:=lsm_svg_document_get_type;
  end;

function LSM_SVG_DOCUMENT(obj : Pointer) : PLsmSvgDocument;
begin
  Result := PLsmSvgDocument(g_type_check_instance_cast(obj, LSM_TYPE_SVG_DOCUMENT));
end;

function LSM_SVG_DOCUMENT_CLASS(klass : Pointer) : PLsmSvgDocumentClass;
begin
  Result := PLsmSvgDocumentClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_DOCUMENT));
end;

function LSM_IS_SVG_DOCUMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_DOCUMENT);
end;

function LSM_IS_SVG_DOCUMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_DOCUMENT);
end;

function LSM_SVG_DOCUMENT_GET_CLASS(obj : Pointer) : PLsmSvgDocumentClass;
begin
  Result := PLsmSvgDocumentClass(PGTypeInstance(obj)^.g_class);
end;



end.
