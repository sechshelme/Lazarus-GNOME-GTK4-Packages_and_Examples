
unit gstversion;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstversion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstversion.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstversion.h: Version information for GStreamer
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VERSION_H__}
{$define __GST_VERSION_H__}
{$include <glib.h>}
{*
 * SECTION:gstversion
 * @short_description: GStreamer version macros.
 *
 * Use the GST_VERSION_* macros e.g. when defining own plugins. The GStreamer
 * runtime checks if these plugin and core version match and refuses to use a
 * plugin compiled against a different version of GStreamer.
 * You can also use the macros to keep the GStreamer version information in
 * your application.
 *
 * Use the gst_version() function if you want to know which version of
 * GStreamer you are currently linked against.
 *
 * The version macros get defined by including "gst/gst.h".
  }
{*
 * GST_VERSION_MAJOR:
 *
 * The major version of GStreamer at compile time:
  }

const
  GST_VERSION_MAJOR = 1;  
{*
 * GST_VERSION_MINOR:
 *
 * The minor version of GStreamer at compile time:
  }
  GST_VERSION_MINOR = 28;  
{*
 * GST_VERSION_MICRO:
 *
 * The micro version of GStreamer at compile time:
  }
  GST_VERSION_MICRO = 2;  
{*
 * GST_VERSION_NANO:
 *
 * The nano version of GStreamer at compile time:
 * Actual releases have 0, GIT versions have 1, prerelease versions have 2-...
  }
  GST_VERSION_NANO = 0;  
{*xxxxxxxxxxx
#define	GST_CHECK_VERSION(major,minor,micro)	\
    (GST_VERSION_MAJOR > (major) || \
     (GST_VERSION_MAJOR == (major) && GST_VERSION_MINOR > (minor)) || \
     (GST_VERSION_MAJOR == (major) && GST_VERSION_MINOR == (minor) && \
      GST_VERSION_MICRO >= (micro)))

  }
{$endif}
{ __GST_VERSION_H__  }

implementation


end.
