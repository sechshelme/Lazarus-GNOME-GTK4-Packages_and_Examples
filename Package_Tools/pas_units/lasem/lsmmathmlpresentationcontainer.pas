unit lsmmathmlpresentationcontainer;

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
{$ifndef LSM_MATHML_PRESENTATION_CONTAINER_H}
{$define LSM_MATHML_PRESENTATION_CONTAINER_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}

type
  PLsmMathmlPresentationContainer = ^TLsmMathmlPresentationContainer;
  TLsmMathmlPresentationContainer = record
      element : TLsmMathmlElement;
    end;

  PLsmMathmlPresentationContainerClass = ^TLsmMathmlPresentationContainerClass;
  TLsmMathmlPresentationContainerClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_presentation_container_get_type:TGType;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:46:12 ===

function LSM_TYPE_MATHML_PRESENTATION_CONTAINER : TGType;
function LSM_MATHML_PRESENTATION_CONTAINER(obj : Pointer) : PLsmMathmlPresentationContainer;
function LSM_MATHML_PRESENTATION_CONTAINER_CLASS(klass : Pointer) : PLsmMathmlPresentationContainerClass;
function LSM_IS_MATHML_PRESENTATION_CONTAINER(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS(obj : Pointer) : PLsmMathmlPresentationContainerClass;

implementation

function LSM_TYPE_MATHML_PRESENTATION_CONTAINER : TGType;
  begin
    LSM_TYPE_MATHML_PRESENTATION_CONTAINER:=lsm_mathml_presentation_container_get_type;
  end;

function LSM_MATHML_PRESENTATION_CONTAINER(obj : Pointer) : PLsmMathmlPresentationContainer;
begin
  Result := PLsmMathmlPresentationContainer(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PRESENTATION_CONTAINER));
end;

function LSM_MATHML_PRESENTATION_CONTAINER_CLASS(klass : Pointer) : PLsmMathmlPresentationContainerClass;
begin
  Result := PLsmMathmlPresentationContainerClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PRESENTATION_CONTAINER));
end;

function LSM_IS_MATHML_PRESENTATION_CONTAINER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_PRESENTATION_CONTAINER);
end;

function LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_PRESENTATION_CONTAINER);
end;

function LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS(obj : Pointer) : PLsmMathmlPresentationContainerClass;
begin
  Result := PLsmMathmlPresentationContainerClass(PGTypeInstance(obj)^.g_class);
end;



end.
