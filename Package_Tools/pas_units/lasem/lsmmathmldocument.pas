unit lsmmathmldocument;

interface

uses
  fp_glib2, fp_lasem;

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
{$ifndef LSM_MATHML_DOCUMENT_H}
{$define LSM_MATHML_DOCUMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmdomdocument.h>}

type
  PLsmMathmlDocument = ^TLsmMathmlDocument;
  TLsmMathmlDocument = record
      document : TLsmDomDocument;
    end;

  PLsmMathmlDocumentClass = ^TLsmMathmlDocumentClass;
  TLsmMathmlDocumentClass = record
      parent_class : TLsmDomDocumentClass;
    end;


function lsm_mathml_document_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_document_new:PLsmDomDocument;cdecl;external liblasem;
function lsm_mathml_document_get_root_element(document:PLsmMathmlDocument):PLsmMathmlMathElement;cdecl;external liblasem;
function lsm_mathml_document_new_from_itex(itex:Pchar; size:Tgssize; error:PPGError):PLsmMathmlDocument;cdecl;external liblasem;
function lsm_mathml_document_new_from_itex_path(url:Pchar; error:PPGError):PLsmMathmlDocument;cdecl;external liblasem;
function lsm_mathml_document_new_from_itex_url(url:Pchar; error:PPGError):PLsmMathmlDocument;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:39:43 ===

function LSM_TYPE_MATHML_DOCUMENT : TGType;
function LSM_MATHML_DOCUMENT(obj : Pointer) : PLsmMathmlDocument;
function LSM_MATHML_DOCUMENT_CLASS(klass : Pointer) : PLsmMathmlDocumentClass;
function LSM_IS_MATHML_DOCUMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_DOCUMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_DOCUMENT_GET_CLASS(obj : Pointer) : PLsmMathmlDocumentClass;

implementation

function LSM_TYPE_MATHML_DOCUMENT : TGType;
  begin
    LSM_TYPE_MATHML_DOCUMENT:=lsm_mathml_document_get_type;
  end;

function LSM_MATHML_DOCUMENT(obj : Pointer) : PLsmMathmlDocument;
begin
  Result := PLsmMathmlDocument(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_DOCUMENT));
end;

function LSM_MATHML_DOCUMENT_CLASS(klass : Pointer) : PLsmMathmlDocumentClass;
begin
  Result := PLsmMathmlDocumentClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_DOCUMENT));
end;

function LSM_IS_MATHML_DOCUMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_DOCUMENT);
end;

function LSM_IS_MATHML_DOCUMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_DOCUMENT);
end;

function LSM_MATHML_DOCUMENT_GET_CLASS(obj : Pointer) : PLsmMathmlDocumentClass;
begin
  Result := PLsmMathmlDocumentClass(PGTypeInstance(obj)^.g_class);
end;



end.
