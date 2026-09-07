unit pk_distro_upgrade;

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
{$ifndef __PK_DISTRO_UPGRADE_H}
{$define __PK_DISTRO_UPGRADE_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

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


function pk_distro_upgrade_get_type:TGType;cdecl;external libpackagekit ;
function pk_distro_upgrade_new:PPkDistroUpgrade;cdecl;external libpackagekit ;
{ accessors  }
function pk_distro_upgrade_get_id(distro_upgrade:PPkDistroUpgrade):Pgchar;cdecl;external libpackagekit ;
function pk_distro_upgrade_get_summary(distro_upgrade:PPkDistroUpgrade):Pgchar;cdecl;external libpackagekit ;
function pk_distro_upgrade_get_state(distro_upgrade:PPkDistroUpgrade):TPkDistroUpgradeEnum;cdecl;external libpackagekit ;
{$endif}
{ __PK_DISTRO_UPGRADE_H  }

// === Konventiert am: 7-9-26 15:09:08 ===

function PK_TYPE_DISTRO_UPGRADE : TGType;
function PK_DISTRO_UPGRADE(obj : Pointer) : PPkDistroUpgrade;
function PK_DISTRO_UPGRADE_CLASS(klass : Pointer) : PPkDistroUpgradeClass;
function PK_IS_DISTRO_UPGRADE(obj : Pointer) : Tgboolean;
function PK_IS_DISTRO_UPGRADE_CLASS(klass : Pointer) : Tgboolean;
function PK_DISTRO_UPGRADE_GET_CLASS(obj : Pointer) : PPkDistroUpgradeClass;

implementation

function PK_TYPE_DISTRO_UPGRADE : TGType;
  begin
    PK_TYPE_DISTRO_UPGRADE:=pk_distro_upgrade_get_type;
  end;

function PK_DISTRO_UPGRADE(obj : Pointer) : PPkDistroUpgrade;
begin
  Result := PPkDistroUpgrade(g_type_check_instance_cast(obj, PK_TYPE_DISTRO_UPGRADE));
end;

function PK_DISTRO_UPGRADE_CLASS(klass : Pointer) : PPkDistroUpgradeClass;
begin
  Result := PPkDistroUpgradeClass(g_type_check_class_cast(klass, PK_TYPE_DISTRO_UPGRADE));
end;

function PK_IS_DISTRO_UPGRADE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_DISTRO_UPGRADE);
end;

function PK_IS_DISTRO_UPGRADE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_DISTRO_UPGRADE);
end;

function PK_DISTRO_UPGRADE_GET_CLASS(obj : Pointer) : PPkDistroUpgradeClass;
begin
  Result := PPkDistroUpgradeClass(PGTypeInstance(obj)^.g_class);
end;



end.
