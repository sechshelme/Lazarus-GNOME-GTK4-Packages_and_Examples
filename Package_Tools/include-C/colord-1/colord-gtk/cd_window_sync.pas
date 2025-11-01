unit cd_window_sync;

interface

uses
  fp_glib2, fp_GTK4, fp_colord;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012 Richard Hughes <richard@hughsie.com>
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
{$if !defined (__COLORD_GTK_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord-gtk.h> can be included directly."}
{$endif}
{$ifndef __CD_WINDOW_SYNC_H}
{$define __CD_WINDOW_SYNC_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}

function cd_window_get_profile_sync(window:PCdWindow; widget:PGtkWidget; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external libcolord_gtk;
{$endif}
{ __CD_WINDOW_SYNC_H  }

// === Konventiert am: 1-11-25 14:58:55 ===


implementation



end.
