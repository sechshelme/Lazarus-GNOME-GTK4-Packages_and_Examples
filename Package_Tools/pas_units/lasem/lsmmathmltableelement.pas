unit lsmmathmltableelement;

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
{$ifndef LSM_MATHML_TABLE_ELEMENT_H}
{$define LSM_MATHML_TABLE_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}

type
{ View data  }
  PLsmMathmlTableElement = ^TLsmMathmlTableElement;
  TLsmMathmlTableElement = record
      element : TLsmMathmlElement;
      row_align : TLsmMathmlEnumListAttribute;
      column_align : TLsmMathmlEnumListAttribute;
      row_spacing : TLsmMathmlSpaceListAttribute;
      column_spacing : TLsmMathmlSpaceListAttribute;
      row_lines : TLsmMathmlEnumListAttribute;
      column_lines : TLsmMathmlEnumListAttribute;
      frame : TLsmMathmlEnumAttribute;
      frame_spacing : TLsmMathmlSpaceListAttribute;
      label_spacing : TLsmMathmlLengthAttribute;
      equal_rows : TLsmMathmlBooleanAttribute;
      equal_columns : TLsmMathmlBooleanAttribute;
      display_style : TLsmMathmlBooleanAttribute;
      n_columns : dword;
      n_rows : dword;
      widths : Pdouble;
      heights : Pdouble;
      depths : Pdouble;
      line_width : Tdouble;
    end;

  PLsmMathmlTableElementClass = ^TLsmMathmlTableElementClass;
  TLsmMathmlTableElementClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_table_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_table_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:49:51 ===

function LSM_TYPE_MATHML_TABLE_ELEMENT : TGType;
function LSM_MATHML_TABLE_ELEMENT(obj : Pointer) : PLsmMathmlTableElement;
function LSM_MATHML_TABLE_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlTableElementClass;
function LSM_IS_MATHML_TABLE_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_TABLE_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_TABLE_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlTableElementClass;

implementation

function LSM_TYPE_MATHML_TABLE_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_TABLE_ELEMENT:=lsm_mathml_table_element_get_type;
  end;

function LSM_MATHML_TABLE_ELEMENT(obj : Pointer) : PLsmMathmlTableElement;
begin
  Result := PLsmMathmlTableElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_TABLE_ELEMENT));
end;

function LSM_MATHML_TABLE_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlTableElementClass;
begin
  Result := PLsmMathmlTableElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_TABLE_ELEMENT));
end;

function LSM_IS_MATHML_TABLE_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_TABLE_ELEMENT);
end;

function LSM_IS_MATHML_TABLE_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_TABLE_ELEMENT);
end;

function LSM_MATHML_TABLE_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlTableElementClass;
begin
  Result := PLsmMathmlTableElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
