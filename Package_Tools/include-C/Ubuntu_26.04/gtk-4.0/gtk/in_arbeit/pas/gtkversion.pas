unit gtkversion;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-1999.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$ifndef __GTK_VERSION_H__}
{$define __GTK_VERSION_H__}
{$include <gdk/gdk.h>}
{*
 * GTK_MAJOR_VERSION:
 *
 * Like [func@get_major_version], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
  }

const
  GTK_MAJOR_VERSION = 4;  
{*
 * GTK_MINOR_VERSION:
 *
 * Like [func@get_minor_version], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
  }
  GTK_MINOR_VERSION = 22;  
{*
 * GTK_MICRO_VERSION:
 *
 * Like [func@get_micro_version], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
  }
  GTK_MICRO_VERSION = 4;  
{*
 * GTK_BINARY_AGE:
 *
 * Like [func@get_binary_age], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
  }
  GTK_BINARY_AGE = 2204;  
{*
 * GTK_INTERFACE_AGE:
 *
 * Like [func@get_interface_age], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
  }
  GTK_INTERFACE_AGE = 4;  
{*xxxxxxxxxxxx
#define GTK_CHECK_VERSION(major,minor,micro)                          \
    (GTK_MAJOR_VERSION > (major) ||                                   \
     (GTK_MAJOR_VERSION == (major) && GTK_MINOR_VERSION > (minor)) || \
     (GTK_MAJOR_VERSION == (major) && GTK_MINOR_VERSION == (minor) && \
      GTK_MICRO_VERSION >= (micro)))
  }

function gtk_get_major_version:Tguint;cdecl;external libgtk4;
function gtk_get_minor_version:Tguint;cdecl;external libgtk4;
function gtk_get_micro_version:Tguint;cdecl;external libgtk4;
function gtk_get_binary_age:Tguint;cdecl;external libgtk4;
function gtk_get_interface_age:Tguint;cdecl;external libgtk4;
function gtk_check_version(required_major:Tguint; required_minor:Tguint; required_micro:Tguint):Pchar;cdecl;external libgtk4;
{$endif}
{ __GTK_VERSION_H__  }

// === Konventiert am: 6-7-26 16:33:00 ===


implementation



end.
