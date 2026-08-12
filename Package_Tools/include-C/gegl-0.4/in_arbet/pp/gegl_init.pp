
unit gegl_init;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_init.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_init.h
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
PGeglConfig  = ^GeglConfig;
PGeglStats  = ^GeglStats;
Pgint  = ^gint;
PGOptionGroup  = ^GOptionGroup;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2003 Calvin Williamson, Øyvind Kolås
 *           2013 Daniel Sabo
  }
{$ifndef __GEGL_INIT_H__}
{$define __GEGL_INIT_H__}
{**
 * Initialization:
 *
 * Before GEGL can be used the engine should be initialized by either calling
 * #gegl_init or through the use of #gegl_get_option_group. To shut down the
 * GEGL engine call #gegl_exit.
 *
 * ---Code sample:
 * #include <gegl.h>
 *
 * int main(int argc, char **argv)
 * 
 *   gegl_init (&argc, &argv);
 *       # other GEGL code
 *   gegl_exit ();
 * 
  }
{*
 * gegl_init:
 * @argc: (inout) (optional): a pointer to the number of command line arguments.
 * @argv: (inout) (array length=argc) (allow-none): a pointer to the array of command line arguments.
 *
 * Call this function before using any other GEGL functions. It will
 * initialize everything needed to operate GEGL and parses some
 * standard command line options.  @argc and @argv are adjusted
 * accordingly so your own code will never see those standard
 * arguments.
 *
 * Note that there is an alternative way to initialize GEGL: if you
 * are calling g_option_context_parse() with the option group returned
 * by #gegl_get_option_group(), you don't have to call #gegl_init().
 * }

procedure gegl_init(argc:Pgint; argv:PPPgchar);cdecl;external;
{*
 * gegl_get_option_group: (skip)
 *
 * Returns a GOptionGroup for the commandline arguments recognized
 * by GEGL. You should add this group to your GOptionContext
 * with g_option_context_add_group() if you are using
 * g_option_context_parse() to parse your commandline arguments.
  }
function gegl_get_option_group:PGOptionGroup;cdecl;external;
{*
 * gegl_exit:
 *
 * Call this function when you're done using GEGL. It will clean up
 * caches and write/dump debug information if the correct debug flags
 * are set.
  }
procedure gegl_exit;cdecl;external;
{*
 * gegl_load_module_directory:
 * @path: the directory to load modules from
 *
 * Load all gegl modules found in the given directory.
  }
(* Const before type ignored *)
procedure gegl_load_module_directory(path:Pgchar);cdecl;external;
{*
 * gegl_config:
 *
 * Returns a GeglConfig object with properties that can be manipulated to control
 * GEGLs behavior.
 *
 * Return value: (transfer none): a #GeglConfig
  }
function gegl_config:PGeglConfig;cdecl;external;
{*
 * gegl_stats:
 *
 * Returns a GeglStats object with properties that can be read to monitor
 * GEGL statistics.
 *
 * Return value: (transfer none): a #GeglStats
  }
function gegl_stats:PGeglStats;cdecl;external;
{*
 * gegl_reset_stats:
 *
 * Resets the cumulative data gathered by the #GeglStats object returned
 * by #gegl_stats().
  }
procedure gegl_reset_stats;cdecl;external;
function gegl_is_main_thread:Tgboolean;cdecl;external;
{$endif}
{ __GEGL_INIT_H__  }

implementation


end.
