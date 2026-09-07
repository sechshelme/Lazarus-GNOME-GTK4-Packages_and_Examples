unit pk_package;

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
{$ifndef __PK_PACKAGE_H}
{$define __PK_PACKAGE_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-enum.h>}
{$include <packagekit-glib2/pk-source.h>}

{ was #define dname def_expr }
function PK_PACKAGE_TYPE_ERROR : longint; { return type might be wrong }

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkPackage, g_object_unref) }
{$endif}
type
  PPkPackage = ^TPkPackage;
  TPkPackage = record
      parent : TPkSource;
      priv : PPkPackagePrivate;
    end;

{ signals  }
{ padding for future expansion  }
  PPkPackageClass = ^TPkPackageClass;
  TPkPackageClass = record
      parent_class : TPkSourceClass;
      changed : procedure (package:PPkPackage);cdecl;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_package_get_type:TGType;cdecl;external libpackagekit ;
function pk_package_new:PPkPackage;cdecl;external libpackagekit ;
function pk_package_set_id(package:PPkPackage; package_id:Pgchar; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_package_parse(package:PPkPackage; data:Pgchar; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
procedure pk_package_print(package:PPkPackage);cdecl;external libpackagekit ;
function pk_package_equal(package1:PPkPackage; package2:PPkPackage):Tgboolean;cdecl;external libpackagekit ;
function pk_package_equal_id(package1:PPkPackage; package2:PPkPackage):Tgboolean;cdecl;external libpackagekit ;
{ accessors  }
function pk_package_get_id(package:PPkPackage):Pgchar;cdecl;external libpackagekit ;
function pk_package_get_info(package:PPkPackage):TPkInfoEnum;cdecl;external libpackagekit ;
procedure pk_package_set_info(package:PPkPackage; info:TPkInfoEnum);cdecl;external libpackagekit ;
function pk_package_get_summary(package:PPkPackage):Pgchar;cdecl;external libpackagekit ;
procedure pk_package_set_summary(package:PPkPackage; summary:Pgchar);cdecl;external libpackagekit ;
function pk_package_get_name(package:PPkPackage):Pgchar;cdecl;external libpackagekit ;
function pk_package_get_version(package:PPkPackage):Pgchar;cdecl;external libpackagekit ;
function pk_package_get_arch(package:PPkPackage):Pgchar;cdecl;external libpackagekit ;
function pk_package_get_data(package:PPkPackage):Pgchar;cdecl;external libpackagekit ;
function pk_package_get_update_severity(package:PPkPackage):TPkInfoEnum;cdecl;external libpackagekit ;
procedure pk_package_set_update_severity(package:PPkPackage; update_severity:TPkInfoEnum);cdecl;external libpackagekit ;
{$endif}
{ __PK_PACKAGE_H  }

// === Konventiert am: 7-9-26 15:11:15 ===

function PK_TYPE_PACKAGE : TGType;
function PK_PACKAGE(obj : Pointer) : PPkPackage;
function PK_PACKAGE_CLASS(klass : Pointer) : PPkPackageClass;
function PK_IS_PACKAGE(obj : Pointer) : Tgboolean;
function PK_IS_PACKAGE_CLASS(klass : Pointer) : Tgboolean;
function PK_PACKAGE_GET_CLASS(obj : Pointer) : PPkPackageClass;

implementation

function PK_TYPE_PACKAGE : TGType;
  begin
    PK_TYPE_PACKAGE:=pk_package_get_type;
  end;

function PK_PACKAGE(obj : Pointer) : PPkPackage;
begin
  Result := PPkPackage(g_type_check_instance_cast(obj, PK_TYPE_PACKAGE));
end;

function PK_PACKAGE_CLASS(klass : Pointer) : PPkPackageClass;
begin
  Result := PPkPackageClass(g_type_check_class_cast(klass, PK_TYPE_PACKAGE));
end;

function PK_IS_PACKAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_PACKAGE);
end;

function PK_IS_PACKAGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_PACKAGE);
end;

function PK_PACKAGE_GET_CLASS(obj : Pointer) : PPkPackageClass;
begin
  Result := PPkPackageClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function PK_PACKAGE_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_PACKAGE_TYPE_ERROR:=pk_package_error_get_type;
  end;


end.
