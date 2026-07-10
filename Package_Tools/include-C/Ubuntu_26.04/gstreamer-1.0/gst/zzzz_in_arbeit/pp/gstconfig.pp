
unit gstconfig;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstconfig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstconfig.h
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
 *               2004,2005 Wim Taymans <wim@fluendo.com>
 *
 * gstconfig.h: GST_DISABLE_* macros for build configuration
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
{*
 * SECTION:gstconfig
 * @short_description: Build configuration options
 *
 * This describes the configuration options for GStreamer. When building
 * GStreamer there are a lot of parts (known internally as "subsystems" ) that
 * can be disabled for various reasons. The most common reasons are speed and
 * size, which is important because GStreamer is designed to run on embedded
 * systems.
 *
 * If a subsystem is disabled, most of this changes are done in an API
 * compatible way, so you don't need to adapt your code in most cases. It is
 * never done in an ABI compatible way though. So if you want to disable a
 * subsystem, you have to rebuild all programs depending on GStreamer, too.
 *
 * If a subsystem is disabled in GStreamer, a value is defined in
 * &lt;gst/gst.h&gt;. You can check this if you do subsystem-specific stuff.
 *
 * ``` C
 * #ifndef GST_DISABLE_GST_DEBUG
 * // do stuff specific to the debugging subsystem
 * #endif // GST_DISABLE_GST_DEBUG
 * ```
  }
{$ifndef __GST_CONFIG_H__}
{$define __GST_CONFIG_H__}
{$include <glib.h>}
{ trick gtk-doc into believing these symbols are defined (yes, it's ugly)  }
{$if 0}

const
  GST_DISABLE_GST_DEBUG = 1;  
  GST_DISABLE_PARSE = 1;  
  GST_DISABLE_REGISTRY = 1;  
  GST_DISABLE_PLUGIN = 1;  
{$endif}
{**** default padding of structures **** }

const
  GST_PADDING = 4;  
{xxxxxxxxx  #define GST_PADDING_INIT	 NULL  }
{**** padding for very extensible base classes **** }
  GST_PADDING_LARGE = 20;  
{**** disabling of subsystems **** }
{*
 * GST_DISABLE_GST_DEBUG:
 *
 * Configures the inclusion of the debugging subsystem
  }
{$undef GST_DISABLE_GST_DEBUG}
{*
 * GST_DISABLE_PARSE:
 *
 * Configures the inclusion of the gst-launch parser
  }
{$undef GST_DISABLE_PARSE}
{*
 * GST_DISABLE_REGISTRY:
 *
 * Configures the use of the plugin registry.
 * If one disables this, required plugins need to be loaded and registered
 * manually
  }
{$undef GST_DISABLE_REGISTRY}
{*
 * GST_DISABLE_CAST_CHECKS:
 *
 * Disable run-time GObject cast checks
  }
  GST_DISABLE_CAST_CHECKS = 0;  
{*
 * GST_DISABLE_GLIB_ASSERTS:
 *
 * Disable GLib assertion
  }
  GST_DISABLE_GLIB_ASSERTS = 0;  
{*
 * GST_DISABLE_GLIB_CHECKS:
 *
 * Disable GLib checks such as API guards
  }
  GST_DISABLE_GLIB_CHECKS = 0;  
{ FIXME: test and document these!  }
{ Configures the use of external plugins  }
{$undef GST_DISABLE_PLUGIN}
{ Whether or not the CPU supports unaligned access
 * The macros used are defined consistently by GCC, Clang, MSVC, Sun, and ICC
 *
 * References:
 * https://sourceforge.net/p/predef/wiki/Architectures/
 * https://msdn.microsoft.com/en-us/library/b0084kay.aspx
 * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
 * https://software.intel.com/en-us/node/583402
  }
{*
 * GST_EXPORT:
 *
 * Export the given variable from the built shared object.
 *
 * On Windows, this exports the variable from the DLL.
 * On other platforms, this gets defined to "extern".
 * Deprecated: 1.22: Applications should define their own export macros.
  }
{$ifdef GST_EXPORTS}
  GST_EXPORT = extern_EXPORT;  
{$else}

const
  GST_EXPORT = extern_IMPORT;  
{$endif}

implementation


end.
