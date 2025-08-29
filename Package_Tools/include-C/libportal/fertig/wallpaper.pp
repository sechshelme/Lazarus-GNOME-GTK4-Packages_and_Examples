
unit wallpaper;
interface

{
  Automatically converted by H2Pas 1.0.0 from wallpaper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    wallpaper.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
PXdpWallpaperFlags  = ^XdpWallpaperFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019, Matthias Clasen
 *
 * This file is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, version 3.0 of the
 * License.
 *
 * This file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-3.0-only
  }
(** unsupported pragma#pragma once*)
{$include <libportal/types.h>}
{*
 * XdpWallpaperFlags:
 * @XDP_WALLPAPER_FLAG_NONE: No flags
 * @XDP_WALLPAPER_FLAG_BACKGROUND: Set wallpaper on the desktop background
 * @XDP_WALLPAPER_FLAG_LOCKSCREEN: Set wallpaper on the lockscreen
 * @XDP_WALLPAPER_FLAG_PREVIEW: Request the preview to be shown
 *
 * The values of this enumeration determine where the wallpaper is being set.
  }
type
  PXdpWallpaperFlags = ^TXdpWallpaperFlags;
  TXdpWallpaperFlags =  Longint;
  Const
    XDP_WALLPAPER_FLAG_NONE = 0;
    XDP_WALLPAPER_FLAG_BACKGROUND = 1 shl 0;
    XDP_WALLPAPER_FLAG_LOCKSCREEN = 1 shl 1;
    XDP_WALLPAPER_FLAG_PREVIEW = 1 shl 2;
;
  XDP_WALLPAPER_TARGET_BOTH = XDP_WALLPAPER_TARGET_BACKGROUND or XDP_WALLPAPER_TARGET_LOCKSCREEN;  
(* Const before type ignored *)

procedure xdp_portal_set_wallpaper(portal:PXdpPortal; parent:PXdpParent; uri:Pchar; flags:TXdpWallpaperFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_set_wallpaper_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
