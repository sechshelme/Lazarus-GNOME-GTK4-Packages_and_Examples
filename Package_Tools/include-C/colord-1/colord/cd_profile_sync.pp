
unit cd_profile_sync;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_profile_sync.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_profile_sync.h
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
PCdProfile  = ^CdProfile;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2011 Richard Hughes <richard@hughsie.com>
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
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_PROFILE_SYNC_H}
{$define __CD_PROFILE_SYNC_H}
{$include <glib-object.h>}

function cd_profile_connect_sync(profile:PCdProfile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_profile_set_property_sync(profile:PCdProfile; key:Pgchar; value:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_profile_install_system_wide_sync(profile:PCdProfile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __CD_PROFILE_SYNC_H  }

implementation


end.
