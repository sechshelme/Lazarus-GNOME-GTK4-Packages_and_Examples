
unit pk_distro_upgrade;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_distro_upgrade.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_distro_upgrade.h
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
PPkDistroUpgrade  = ^PkDistroUpgrade;
PPkDistroUpgradeClass  = ^PkDistroUpgradeClass;
PPkDistroUpgradePrivate  = ^PkDistroUpgradePrivate;
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
{$ifndef __PK_DISTRO_UPGRADE_H}
{$define __PK_DISTRO_UPGRADE_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

{ was #define dname def_expr }
function PK_TYPE_DISTRO_UPGRADE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DISTRO_UPGRADE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DISTRO_UPGRADE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DISTRO_UPGRADE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DISTRO_UPGRADE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DISTRO_UPGRADE_GET_CLASS(o : longint) : longint;

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkDistroUpgrade, g_object_unref) }
{$endif}
type
  PPkDistroUpgrade = ^TPkDistroUpgrade;
  TPkDistroUpgrade = record
      parent : TPkSource;
      priv : PPkDistroUpgradePrivate;
    end;

{ padding for future expansion  }
  PPkDistroUpgradeClass = ^TPkDistroUpgradeClass;
  TPkDistroUpgradeClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_distro_upgrade_get_type:TGType;cdecl;external;
function pk_distro_upgrade_new:PPkDistroUpgrade;cdecl;external;
{ accessors  }
(* Const before type ignored *)
function pk_distro_upgrade_get_id(distro_upgrade:PPkDistroUpgrade):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_distro_upgrade_get_summary(distro_upgrade:PPkDistroUpgrade):Pgchar;cdecl;external;
function pk_distro_upgrade_get_state(distro_upgrade:PPkDistroUpgrade):TPkDistroUpgradeEnum;cdecl;external;
{$endif}
{ __PK_DISTRO_UPGRADE_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_DISTRO_UPGRADE : longint; { return type might be wrong }
  begin
    PK_TYPE_DISTRO_UPGRADE:=pk_distro_upgrade_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DISTRO_UPGRADE(o : longint) : longint;
begin
  PK_DISTRO_UPGRADE:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_DISTRO_UPGRADE,PkDistroUpgrade);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DISTRO_UPGRADE_CLASS(k : longint) : longint;
begin
  PK_DISTRO_UPGRADE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_DISTRO_UPGRADE,PkDistroUpgradeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DISTRO_UPGRADE(o : longint) : longint;
begin
  PK_IS_DISTRO_UPGRADE:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_DISTRO_UPGRADE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_DISTRO_UPGRADE_CLASS(k : longint) : longint;
begin
  PK_IS_DISTRO_UPGRADE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_DISTRO_UPGRADE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_DISTRO_UPGRADE_GET_CLASS(o : longint) : longint;
begin
  PK_DISTRO_UPGRADE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_DISTRO_UPGRADE,PkDistroUpgradeClass);
end;


end.
