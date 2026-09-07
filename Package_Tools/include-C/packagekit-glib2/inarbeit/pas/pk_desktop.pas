unit pk_desktop;

interface

uses
  fp_glib2, fp_packagekit;

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


function pk_desktop_get_type:TGType;cdecl;external libpackagekit ;
function pk_desktop_new:PPkDesktop;cdecl;external libpackagekit ;
function pk_desktop_open_database(desktop:PPkDesktop; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_desktop_get_files_for_package(desktop:PPkDesktop; package:Pgchar; error:PPGError):PGPtrArray;cdecl;external libpackagekit ;
function pk_desktop_get_shown_for_package(desktop:PPkDesktop; package:Pgchar; error:PPGError):PGPtrArray;cdecl;external libpackagekit ;
function pk_desktop_get_package_for_file(desktop:PPkDesktop; filename:Pgchar; error:PPGError):Pgchar;cdecl;external libpackagekit ;
{$endif}
{ __PK_DESKTOP_H  }

// === Konventiert am: 7-9-26 15:03:26 ===

function PK_TYPE_DESKTOP : TGType;
function PK_DESKTOP(obj : Pointer) : PPkDesktop;
function PK_DESKTOP_CLASS(klass : Pointer) : PPkDesktopClass;
function PK_IS_DESKTOP(obj : Pointer) : Tgboolean;
function PK_IS_DESKTOP_CLASS(klass : Pointer) : Tgboolean;
function PK_DESKTOP_GET_CLASS(obj : Pointer) : PPkDesktopClass;

implementation

function PK_TYPE_DESKTOP : TGType;
  begin
    PK_TYPE_DESKTOP:=pk_desktop_get_type;
  end;

function PK_DESKTOP(obj : Pointer) : PPkDesktop;
begin
  Result := PPkDesktop(g_type_check_instance_cast(obj, PK_TYPE_DESKTOP));
end;

function PK_DESKTOP_CLASS(klass : Pointer) : PPkDesktopClass;
begin
  Result := PPkDesktopClass(g_type_check_class_cast(klass, PK_TYPE_DESKTOP));
end;

function PK_IS_DESKTOP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_DESKTOP);
end;

function PK_IS_DESKTOP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_DESKTOP);
end;

function PK_DESKTOP_GET_CLASS(obj : Pointer) : PPkDesktopClass;
begin
  Result := PPkDesktopClass(PGTypeInstance(obj)^.g_class);
end;



end.
