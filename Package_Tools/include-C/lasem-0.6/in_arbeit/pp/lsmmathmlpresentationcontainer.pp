
unit lsmmathmlpresentationcontainer;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlpresentationcontainer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlpresentationcontainer.h
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
PLsmMathmlPresentationContainer  = ^LsmMathmlPresentationContainer;
PLsmMathmlPresentationContainerClass  = ^LsmMathmlPresentationContainerClass;
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

{ was #define dname def_expr }
function LSM_TYPE_MATHML_PRESENTATION_CONTAINER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_CONTAINER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_CONTAINER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_CONTAINER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS(obj : longint) : longint;

type
  PLsmMathmlPresentationContainer = ^TLsmMathmlPresentationContainer;
  TLsmMathmlPresentationContainer = record
      element : TLsmMathmlElement;
    end;

  PLsmMathmlPresentationContainerClass = ^TLsmMathmlPresentationContainerClass;
  TLsmMathmlPresentationContainerClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_presentation_container_get_type:TGType;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_MATHML_PRESENTATION_CONTAINER : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_PRESENTATION_CONTAINER:=lsm_mathml_presentation_container_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_CONTAINER(obj : longint) : longint;
begin
  LSM_MATHML_PRESENTATION_CONTAINER:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_MATHML_PRESENTATION_CONTAINER,LsmMathmlPresentationContainer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_CONTAINER_CLASS(klass : longint) : longint;
begin
  LSM_MATHML_PRESENTATION_CONTAINER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_MATHML_PRESENTATION_CONTAINER,LsmMathmlPresentationContainerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_CONTAINER(obj : longint) : longint;
begin
  LSM_IS_MATHML_PRESENTATION_CONTAINER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_MATHML_PRESENTATION_CONTAINER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS(klass : longint) : longint;
begin
  LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_MATHML_PRESENTATION_CONTAINER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS(obj : longint) : longint;
begin
  LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_MATHML_PRESENTATION_CONTAINER,LsmMathmlPresentationContainerClass);
end;


end.
