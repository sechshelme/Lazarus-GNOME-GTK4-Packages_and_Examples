unit pk_category;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_CATEGORY_H}
{$define __PK_CATEGORY_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkCategory, g_object_unref) }
{$endif}
type
  PPkCategory = ^TPkCategory;
  TPkCategory = record
      parent : TPkSource;
      priv : PPkCategoryPrivate;
    end;

{ padding for future expansion  }
  PPkCategoryClass = ^TPkCategoryClass;
  TPkCategoryClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_category_get_type:TGType;cdecl;external libpackagekit ;
function pk_category_new:PPkCategory;cdecl;external libpackagekit ;
{ accessors  }
function pk_category_get_parent_id(category:PPkCategory):Pgchar;cdecl;external libpackagekit ;
procedure pk_category_set_parent_id(category:PPkCategory; parent_id:Pgchar);cdecl;external libpackagekit ;
function pk_category_get_id(category:PPkCategory):Pgchar;cdecl;external libpackagekit ;
procedure pk_category_set_id(category:PPkCategory; cat_id:Pgchar);cdecl;external libpackagekit ;
function pk_category_get_name(category:PPkCategory):Pgchar;cdecl;external libpackagekit ;
procedure pk_category_set_name(category:PPkCategory; name:Pgchar);cdecl;external libpackagekit ;
function pk_category_get_summary(category:PPkCategory):Pgchar;cdecl;external libpackagekit ;
procedure pk_category_set_summary(category:PPkCategory; summary:Pgchar);cdecl;external libpackagekit ;
function pk_category_get_icon(category:PPkCategory):Pgchar;cdecl;external libpackagekit ;
procedure pk_category_set_icon(category:PPkCategory; icon:Pgchar);cdecl;external libpackagekit ;
{$endif}
{ __PK_CATEGORY_H  }

// === Konventiert am: 7-9-26 15:04:24 ===

function PK_TYPE_CATEGORY : TGType;
function PK_CATEGORY(obj : Pointer) : PPkCategory;
function PK_CATEGORY_CLASS(klass : Pointer) : PPkCategoryClass;
function PK_IS_CATEGORY(obj : Pointer) : Tgboolean;
function PK_IS_CATEGORY_CLASS(klass : Pointer) : Tgboolean;
function PK_CATEGORY_GET_CLASS(obj : Pointer) : PPkCategoryClass;

implementation

function PK_TYPE_CATEGORY : TGType;
  begin
    PK_TYPE_CATEGORY:=pk_category_get_type;
  end;

function PK_CATEGORY(obj : Pointer) : PPkCategory;
begin
  Result := PPkCategory(g_type_check_instance_cast(obj, PK_TYPE_CATEGORY));
end;

function PK_CATEGORY_CLASS(klass : Pointer) : PPkCategoryClass;
begin
  Result := PPkCategoryClass(g_type_check_class_cast(klass, PK_TYPE_CATEGORY));
end;

function PK_IS_CATEGORY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_CATEGORY);
end;

function PK_IS_CATEGORY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_CATEGORY);
end;

function PK_CATEGORY_GET_CLASS(obj : Pointer) : PPkCategoryClass;
begin
  Result := PPkCategoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
