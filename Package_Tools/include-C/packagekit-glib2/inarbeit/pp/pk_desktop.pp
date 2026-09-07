
unit pk_desktop;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_desktop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_desktop.h
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
PGPtrArray  = ^GPtrArray;
PPkDesktop  = ^PkDesktop;
PPkDesktopClass  = ^PkDesktopClass;
PPkDesktopPrivate  = ^PkDesktopPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2008 Richard Hughes <richard@hughsie.com>
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
{$ifndef __PK_DESKTOP_H}
{$define __PK_DESKTOP_H}
{$include <glib-object.h>}

{ was #define dname def_expr }
function PK_TYPE_DESKTOP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DESKTOP(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DESKTOP_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DESKTOP(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DESKTOP_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DESKTOP_GET_CLASS(o : longint) : longint;

{*
xxxxxxxx
  }
{#define PK_DESKTOP_DEFAULT_DATABASE		LOCALSTATEDIR "/lib/PackageKit/desktop-files.db" }
{*
 * PK_DESKTOP_DEFAULT_APPLICATION_DIR:
 *
 * The default location for the desktop files
  }
{$ifndef __FreeBSD__}

const
  PK_DESKTOP_DEFAULT_APPLICATION_DIR = '/usr/share/applications';  
{$else}

const
  PK_DESKTOP_DEFAULT_APPLICATION_DIR = '/usr/local/share/applications';  
{$endif}
type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkDesktop, g_object_unref) }
{$endif}
type
  PPkDesktop = ^TPkDesktop;
  TPkDesktop = record
      parent : TGObject;
      priv : PPkDesktopPrivate;
    end;

  PPkDesktopClass = ^TPkDesktopClass;
  TPkDesktopClass = record
      parent_class : TGObjectClass;
    end;


function pk_desktop_get_type:TGType;cdecl;external;
function pk_desktop_new:PPkDesktop;cdecl;external;
function pk_desktop_open_database(desktop:PPkDesktop; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_desktop_get_files_for_package(desktop:PPkDesktop; package:Pgchar; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function pk_desktop_get_shown_for_package(desktop:PPkDesktop; package:Pgchar; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function pk_desktop_get_package_for_file(desktop:PPkDesktop; filename:Pgchar; error:PPGError):Pgchar;cdecl;external;
{$endif}
{ __PK_DESKTOP_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_DESKTOP : longint; { return type might be wrong }
  begin
    PK_TYPE_DESKTOP:=pk_desktop_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DESKTOP(o : longint) : longint;
begin
  PK_DESKTOP:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_DESKTOP,PkDesktop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DESKTOP_CLASS(k : longint) : longint;
begin
  PK_DESKTOP_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_DESKTOP,PkDesktopClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DESKTOP(o : longint) : longint;
begin
  PK_IS_DESKTOP:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_DESKTOP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DESKTOP_CLASS(k : longint) : longint;
begin
  PK_IS_DESKTOP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_DESKTOP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DESKTOP_GET_CLASS(o : longint) : longint;
begin
  PK_DESKTOP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_DESKTOP,PkDesktopClass);
end;


end.
