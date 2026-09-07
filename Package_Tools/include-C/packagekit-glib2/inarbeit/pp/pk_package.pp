
unit pk_package;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_package.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_package
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
Pgchar  = ^gchar;
PGError  = ^GError;
PPkPackage  = ^PkPackage;
PPkPackageClass  = ^PkPackageClass;
PPkPackagePrivate  = ^PkPackagePrivate;
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
function PK_TYPE_PACKAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_GET_CLASS(o : longint) : longint;

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


function pk_package_get_type:TGType;cdecl;external;
function pk_package_new:PPkPackage;cdecl;external;
(* Const before type ignored *)
function pk_package_set_id(package:PPkPackage; package_id:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_package_parse(package:PPkPackage; data:Pgchar; error:PPGError):Tgboolean;cdecl;external;
procedure pk_package_print(package:PPkPackage);cdecl;external;
function pk_package_equal(package1:PPkPackage; package2:PPkPackage):Tgboolean;cdecl;external;
function pk_package_equal_id(package1:PPkPackage; package2:PPkPackage):Tgboolean;cdecl;external;
{ accessors  }
(* Const before type ignored *)
function pk_package_get_id(package:PPkPackage):Pgchar;cdecl;external;
function pk_package_get_info(package:PPkPackage):TPkInfoEnum;cdecl;external;
procedure pk_package_set_info(package:PPkPackage; info:TPkInfoEnum);cdecl;external;
(* Const before type ignored *)
function pk_package_get_summary(package:PPkPackage):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure pk_package_set_summary(package:PPkPackage; summary:Pgchar);cdecl;external;
(* Const before type ignored *)
function pk_package_get_name(package:PPkPackage):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_package_get_version(package:PPkPackage):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_package_get_arch(package:PPkPackage):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_package_get_data(package:PPkPackage):Pgchar;cdecl;external;
function pk_package_get_update_severity(package:PPkPackage):TPkInfoEnum;cdecl;external;
procedure pk_package_set_update_severity(package:PPkPackage; update_severity:TPkInfoEnum);cdecl;external;
{$endif}
{ __PK_PACKAGE_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_PACKAGE : longint; { return type might be wrong }
  begin
    PK_TYPE_PACKAGE:=pk_package_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE(o : longint) : longint;
begin
  PK_PACKAGE:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_PACKAGE,PkPackage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_CLASS(k : longint) : longint;
begin
  PK_PACKAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_PACKAGE,PkPackageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE(o : longint) : longint;
begin
  PK_IS_PACKAGE:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_PACKAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_PACKAGE_CLASS(k : longint) : longint;
begin
  PK_IS_PACKAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_PACKAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_PACKAGE_GET_CLASS(o : longint) : longint;
begin
  PK_PACKAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_PACKAGE,PkPackageClass);
end;

{ was #define dname def_expr }
function PK_PACKAGE_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_PACKAGE_TYPE_ERROR:=pk_package_error_get_type;
  end;


end.
