unit ggettext;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_GETTEXT_H__}
{$define __G_GETTEXT_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}

function g_strip_context(msgid:Pgchar; msgval:Pgchar):Pgchar;cdecl;external libglib2;
{(1); }
function g_dgettext(domain:Pgchar; msgid:Pgchar):Pgchar;cdecl;external libglib2;
{(2); }
function g_dcgettext(domain:Pgchar; msgid:Pgchar; category:Tgint):Pgchar;cdecl;external libglib2;
{(2); }
function g_dngettext(domain:Pgchar; msgid:Pgchar; msgid_plural:Pgchar; n:Tgulong):Pgchar;cdecl;external libglib2;
{(3); }
function g_dpgettext(domain:Pgchar; msgctxtid:Pgchar; msgidoffset:Tgsize):Pgchar;cdecl;external libglib2;
{(2); }
function g_dpgettext2(domain:Pgchar; context:Pgchar; msgid:Pgchar):Pgchar;cdecl;external libglib2;
{(3); }
{$endif}
{ __G_GETTEXT_H__  }

// === Konventiert am: 22-6-26 16:17:28 ===


implementation



end.
