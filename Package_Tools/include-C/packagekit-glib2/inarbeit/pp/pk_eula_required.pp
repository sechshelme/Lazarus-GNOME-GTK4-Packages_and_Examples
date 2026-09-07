
unit pk_eula_required;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_eula_required.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_eula_required.h
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
PPkEulaRequired  = ^PkEulaRequired;
PPkEulaRequiredClass  = ^PkEulaRequiredClass;
PPkEulaRequiredPrivate  = ^PkEulaRequiredPrivate;
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
{$ifndef __PK_EULA_REQUIRED_H}
{$define __PK_EULA_REQUIRED_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}

{ was #define dname def_expr }
function PK_TYPE_EULA_REQUIRED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_EULA_REQUIRED(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_EULA_REQUIRED_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_EULA_REQUIRED(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_EULA_REQUIRED_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_EULA_REQUIRED_GET_CLASS(o : longint) : longint;

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkEulaRequired, g_object_unref) }
{$endif}
type
  PPkEulaRequired = ^TPkEulaRequired;
  TPkEulaRequired = record
      parent : TPkSource;
      priv : PPkEulaRequiredPrivate;
    end;

{ padding for future expansion  }
  PPkEulaRequiredClass = ^TPkEulaRequiredClass;
  TPkEulaRequiredClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_eula_required_get_type:TGType;cdecl;external;
function pk_eula_required_new:PPkEulaRequired;cdecl;external;
(* Const before type ignored *)
function pk_eula_required_get_eula_id(eula_required:PPkEulaRequired):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_eula_required_get_package_id(eula_required:PPkEulaRequired):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_eula_required_get_vendor_name(eula_required:PPkEulaRequired):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_eula_required_get_license_agreement(eula_required:PPkEulaRequired):Pgchar;cdecl;external;
{$endif}
{ __PK_EULA_REQUIRED_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_EULA_REQUIRED : longint; { return type might be wrong }
  begin
    PK_TYPE_EULA_REQUIRED:=pk_eula_required_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_EULA_REQUIRED(o : longint) : longint;
begin
  PK_EULA_REQUIRED:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_EULA_REQUIRED,PkEulaRequired);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_EULA_REQUIRED_CLASS(k : longint) : longint;
begin
  PK_EULA_REQUIRED_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_EULA_REQUIRED,PkEulaRequiredClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_EULA_REQUIRED(o : longint) : longint;
begin
  PK_IS_EULA_REQUIRED:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_EULA_REQUIRED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_EULA_REQUIRED_CLASS(k : longint) : longint;
begin
  PK_IS_EULA_REQUIRED_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_EULA_REQUIRED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_EULA_REQUIRED_GET_CLASS(o : longint) : longint;
begin
  PK_EULA_REQUIRED_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_EULA_REQUIRED,PkEulaRequiredClass);
end;


end.
