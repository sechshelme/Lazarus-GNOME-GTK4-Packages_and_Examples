
unit gstpluginsbaseversion;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstpluginsbaseversion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstpluginsbaseversion.h
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
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer base plugins libraries version information
 * Copyright (C) 2010 Tim-Philipp Müller <tim centricular net>
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
{$ifndef __GST_PLUGINS_BASE_VERSION_H__}
{$define __GST_PLUGINS_BASE_VERSION_H__}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils-prelude.h>}
{*
 * GST_PLUGINS_BASE_VERSION_MAJOR:
 *
 * The major version of GStreamer's gst-plugins-base libraries at compile time.
  }

const
  GST_PLUGINS_BASE_VERSION_MAJOR = 1;  
{*
 * GST_PLUGINS_BASE_VERSION_MINOR:
 *
 * The minor version of GStreamer's gst-plugins-base libraries at compile time.
  }
  GST_PLUGINS_BASE_VERSION_MINOR = 28;  
{*
 * GST_PLUGINS_BASE_VERSION_MICRO:
 *
 * The micro version of GStreamer's gst-plugins-base libraries at compile time.
  }
  GST_PLUGINS_BASE_VERSION_MICRO = 2;  
{*
 * GST_PLUGINS_BASE_VERSION_NANO:
 *
 * The nano version of GStreamer's gst-plugins-base libraries at compile time.
 * Actual releases have 0, GIT versions have 1, prerelease versions have 2-...
  }
  GST_PLUGINS_BASE_VERSION_NANO = 0;  
{*xxxxxxx
#define	GST_CHECK_PLUGINS_BASE_VERSION(major,minor,micro)	\
    (GST_PLUGINS_BASE_VERSION_MAJOR > (major) || \
     (GST_PLUGINS_BASE_VERSION_MAJOR == (major) && GST_PLUGINS_BASE_VERSION_MINOR > (minor)) || \
     (GST_PLUGINS_BASE_VERSION_MAJOR == (major) && GST_PLUGINS_BASE_VERSION_MINOR == (minor) && \
      GST_PLUGINS_BASE_VERSION_MICRO >= (micro)) || \
     (GST_PLUGINS_BASE_VERSION_MAJOR == (major) && GST_PLUGINS_BASE_VERSION_MINOR == (minor) && \
      GST_PLUGINS_BASE_VERSION_MICRO + 1 == (micro) && GST_PLUGINS_BASE_VERSION_NANO > 0))
  }

procedure gst_plugins_base_version(major:Pguint; minor:Pguint; micro:Pguint; nano:Pguint);cdecl;external;
function gst_plugins_base_version_string:Pgchar;cdecl;external;
{$endif}
{ __GST_PLUGINS_BASE_VERSION_H__  }

implementation


end.
