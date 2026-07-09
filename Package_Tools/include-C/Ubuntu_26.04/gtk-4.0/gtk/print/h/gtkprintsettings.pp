
unit gtkprintsettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkprintsettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkprintsettings.h
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
PGError  = ^GError;
PGKeyFile  = ^GKeyFile;
PGtkPageRange  = ^GtkPageRange;
PGtkPaperSize  = ^GtkPaperSize;
PGtkPrintSettings  = ^GtkPrintSettings;
PGVariant  = ^GVariant;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkprintsettings.h: Print Settings
 * Copyright (C) 2006, Red Hat, Inc.
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/print/gtkpapersize.h>}
type

{ was #define dname def_expr }
function GTK_TYPE_PRINT_SETTINGS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_PRINT_SETTINGS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_PRINT_SETTINGS(obj : longint) : longint;

{*
 * GtkPrintSettingsFunc:
 * @key: the setting key
 * @value: the setting value
 * @user_data: (closure): The user data provided with the function
 *
 * Function called by [method@Gtk.PrintSettings.foreach] on every key/value pair
 * inside a [class@Gtk.PrintSettings].
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGtkPrintSettingsFunc = procedure (key:Pchar; value:Pchar; user_data:Tgpointer);cdecl;
{*
 * GtkPageRange:
 * @start: start of page range.
 * @end: end of page range.
 *
 * A range of pages to print.
 *
 * See also [method@Gtk.PrintSettings.set_page_ranges].
  }
  PGtkPageRange = ^TGtkPageRange;
  TGtkPageRange = record
      start : longint;cdecl;
      end : longint;
    end;


function gtk_print_settings_get_type:TGType;cdecl;external;
function gtk_print_settings_new:PGtkPrintSettings;cdecl;external;
function gtk_print_settings_copy(other:PGtkPrintSettings):PGtkPrintSettings;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_new_from_file(file_name:Pchar; error:PPGError):PGtkPrintSettings;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_load_file(settings:PGtkPrintSettings; file_name:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_to_file(settings:PGtkPrintSettings; file_name:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_new_from_key_file(key_file:PGKeyFile; group_name:Pchar; error:PPGError):PGtkPrintSettings;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_load_key_file(settings:PGtkPrintSettings; key_file:PGKeyFile; group_name:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_to_key_file(settings:PGtkPrintSettings; key_file:PGKeyFile; group_name:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_has_key(settings:PGtkPrintSettings; key:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_print_settings_get(settings:PGtkPrintSettings; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_print_settings_set(settings:PGtkPrintSettings; key:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_unset(settings:PGtkPrintSettings; key:Pchar);cdecl;external;
procedure gtk_print_settings_foreach(settings:PGtkPrintSettings; func:TGtkPrintSettingsFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_bool(settings:PGtkPrintSettings; key:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_bool(settings:PGtkPrintSettings; key:Pchar; value:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_double(settings:PGtkPrintSettings; key:Pchar):Tdouble;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_double_with_default(settings:PGtkPrintSettings; key:Pchar; def:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_double(settings:PGtkPrintSettings; key:Pchar; value:Tdouble);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_length(settings:PGtkPrintSettings; key:Pchar; unit:TGtkUnit):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_length(settings:PGtkPrintSettings; key:Pchar; value:Tdouble; unit:TGtkUnit);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_int(settings:PGtkPrintSettings; key:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_int_with_default(settings:PGtkPrintSettings; key:Pchar; def:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_int(settings:PGtkPrintSettings; key:Pchar; value:longint);cdecl;external;
{*
 * GTK_PRINT_SETTINGS_PRINTER:
 *
 * The key used by the “Print to file” printer to store the printer name.
  }
const
  GTK_PRINT_SETTINGS_PRINTER = 'printer';  
{*
 * GTK_PRINT_SETTINGS_ORIENTATION:
 *
 * The key used by the “Print to file” printer to store the orientation.
  }
  GTK_PRINT_SETTINGS_ORIENTATION = 'orientation';  
{*
 * GTK_PRINT_SETTINGS_PAPER_FORMAT:
 *
 * The key used by the “Print to file” printer to store the page format.
  }
  GTK_PRINT_SETTINGS_PAPER_FORMAT = 'paper-format';  
{*
 * GTK_PRINT_SETTINGS_PAPER_WIDTH:
 *
 * The key used by the “Print to file” printer to store the paper width.
  }
  GTK_PRINT_SETTINGS_PAPER_WIDTH = 'paper-width';  
{*
 * GTK_PRINT_SETTINGS_PAPER_HEIGHT:
 *
 * The key used by the “Print to file” printer to store the page height.
  }
  GTK_PRINT_SETTINGS_PAPER_HEIGHT = 'paper-height';  
{*
 * GTK_PRINT_SETTINGS_N_COPIES:
 *
 * The key used by the “Print to file” printer to store the number of copies.
  }
  GTK_PRINT_SETTINGS_N_COPIES = 'n-copies';  
{*
 * GTK_PRINT_SETTINGS_DEFAULT_SOURCE:
 *
 * The key used by the “Print to file” printer to store the default source.
  }
  GTK_PRINT_SETTINGS_DEFAULT_SOURCE = 'default-source';  
{*
 * GTK_PRINT_SETTINGS_QUALITY:
 *
 * The key used by the “Print to file” printer to store the printing quality.
  }
  GTK_PRINT_SETTINGS_QUALITY = 'quality';  
{*
 * GTK_PRINT_SETTINGS_RESOLUTION:
 *
 * The key used by the “Print to file” printer to store the resolution in DPI.
  }
  GTK_PRINT_SETTINGS_RESOLUTION = 'resolution';  
{*
 * GTK_PRINT_SETTINGS_USE_COLOR:
 *
 * The key used by the “Print to file” printer to store whether to print with
 * colors.
  }
  GTK_PRINT_SETTINGS_USE_COLOR = 'use-color';  
{*
 * GTK_PRINT_SETTINGS_DUPLEX:
 *
 * The key used by the “Print to file” printer to store whether to print the
 * output in duplex.
  }
  GTK_PRINT_SETTINGS_DUPLEX = 'duplex';  
{*
 * GTK_PRINT_SETTINGS_COLLATE:
 *
 * The key used by the “Print to file” printer to store whether to collate the
 * printed pages.
  }
  GTK_PRINT_SETTINGS_COLLATE = 'collate';  
{*
 * GTK_PRINT_SETTINGS_REVERSE:
 *
 * The key used by the “Print to file” printer to store whether to reverse the
 * order of the printed pages.
  }
  GTK_PRINT_SETTINGS_REVERSE = 'reverse';  
{*
 * GTK_PRINT_SETTINGS_MEDIA_TYPE:
 *
 * The key used by the “Print to file” printer to store the media type.
 *
 * The set of media types is defined in PWG 5101.1-2002 PWG.
  }
  GTK_PRINT_SETTINGS_MEDIA_TYPE = 'media-type';  
{*
 * GTK_PRINT_SETTINGS_DITHER:
 *
 * The key used by the “Print to file” printer to store the dither used.
  }
  GTK_PRINT_SETTINGS_DITHER = 'dither';  
{*
 * GTK_PRINT_SETTINGS_SCALE:
 *
 * The key used by the “Print to file” printer to store the scale.
  }
  GTK_PRINT_SETTINGS_SCALE = 'scale';  
{*
 * GTK_PRINT_SETTINGS_PRINT_PAGES:
 *
 * The key used by the “Print to file” printer to store which pages to print.
  }
  GTK_PRINT_SETTINGS_PRINT_PAGES = 'print-pages';  
{*
 * GTK_PRINT_SETTINGS_PAGE_RANGES:
 *
 * The key used by the “Print to file” printer to store the array of page ranges
 * to print.
  }
  GTK_PRINT_SETTINGS_PAGE_RANGES = 'page-ranges';  
{*
 * GTK_PRINT_SETTINGS_PAGE_SET:
 *
 * The key used by the “Print to file” printer to store the set of pages to print.
  }
  GTK_PRINT_SETTINGS_PAGE_SET = 'page-set';  
{*
 * GTK_PRINT_SETTINGS_FINISHINGS:
 *
 * The key used by the “Print to file” printer to store the finishings.
  }
  GTK_PRINT_SETTINGS_FINISHINGS = 'finishings';  
{*
 * GTK_PRINT_SETTINGS_NUMBER_UP:
 *
 * The key used by the “Print to file” printer to store the number of pages per
 * sheet.
  }
  GTK_PRINT_SETTINGS_NUMBER_UP = 'number-up';  
{*
 * GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT:
 *
 * The key used by the “Print to file” printer to store the number of pages per
 * sheet in number-up mode.
  }
  GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT = 'number-up-layout';  
{*
 * GTK_PRINT_SETTINGS_OUTPUT_BIN:
 *
 * The key used by the “Print to file” printer to store the output bin.
  }
  GTK_PRINT_SETTINGS_OUTPUT_BIN = 'output-bin';  
{*
 * GTK_PRINT_SETTINGS_RESOLUTION_X:
 *
 * The key used by the “Print to file” printer to store the horizontal
 * resolution in DPI.
  }
  GTK_PRINT_SETTINGS_RESOLUTION_X = 'resolution-x';  
{*
 * GTK_PRINT_SETTINGS_RESOLUTION_Y:
 *
 * The key used by the “Print to file” printer to store the vertical resolution
 * in DPI.
  }
  GTK_PRINT_SETTINGS_RESOLUTION_Y = 'resolution-y';  
{*
 * GTK_PRINT_SETTINGS_PRINTER_LPI:
 *
 * The key used by the “Print to file” printer to store the resolution in lines
 * per inch.
  }
  GTK_PRINT_SETTINGS_PRINTER_LPI = 'printer-lpi';  
{*
 * GTK_PRINT_SETTINGS_OUTPUT_DIR:
 *
 * The key used by the “Print to file” printer to store the
 * directory to which the output should be written.
  }
  GTK_PRINT_SETTINGS_OUTPUT_DIR = 'output-dir';  
{*
 * GTK_PRINT_SETTINGS_OUTPUT_BASENAME:
 *
 * The key used by the “Print to file” printer to store the file
 * name of the output without the path to the directory and the
 * file extension.
  }
  GTK_PRINT_SETTINGS_OUTPUT_BASENAME = 'output-basename';  
{*
 * GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT:
 *
 * The key used by the “Print to file” printer to store the format
 * of the output. The supported values are “PS” and “PDF”.
  }
  GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT = 'output-file-format';  
{*
 * GTK_PRINT_SETTINGS_OUTPUT_URI:
 *
 * The key used by the “Print to file” printer to store the URI
 * to which the output should be written. GTK itself supports
 * only “file://” URIs.
  }
  GTK_PRINT_SETTINGS_OUTPUT_URI = 'output-uri';  
{*
 * GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION:
 *
 * The key used by the “Print to file” printer to store the 32-bit Windows
 * driver version.
  }
  GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION = 'win32-driver-version';  
{*
 * GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA:
 *
 * The key used by the “Print to file” printer to store 32-bit Windows extra
 * driver.
  }
  GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA = 'win32-driver-extra';  
{ Helpers:  }
(* Const before type ignored *)

function gtk_print_settings_get_printer(settings:PGtkPrintSettings):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_printer(settings:PGtkPrintSettings; printer:Pchar);cdecl;external;
function gtk_print_settings_get_orientation(settings:PGtkPrintSettings):TGtkPageOrientation;cdecl;external;
procedure gtk_print_settings_set_orientation(settings:PGtkPrintSettings; orientation:TGtkPageOrientation);cdecl;external;
function gtk_print_settings_get_paper_size(settings:PGtkPrintSettings):PGtkPaperSize;cdecl;external;
procedure gtk_print_settings_set_paper_size(settings:PGtkPrintSettings; paper_size:PGtkPaperSize);cdecl;external;
function gtk_print_settings_get_paper_width(settings:PGtkPrintSettings; unit:TGtkUnit):Tdouble;cdecl;external;
procedure gtk_print_settings_set_paper_width(settings:PGtkPrintSettings; width:Tdouble; unit:TGtkUnit);cdecl;external;
function gtk_print_settings_get_paper_height(settings:PGtkPrintSettings; unit:TGtkUnit):Tdouble;cdecl;external;
procedure gtk_print_settings_set_paper_height(settings:PGtkPrintSettings; height:Tdouble; unit:TGtkUnit);cdecl;external;
function gtk_print_settings_get_use_color(settings:PGtkPrintSettings):Tgboolean;cdecl;external;
procedure gtk_print_settings_set_use_color(settings:PGtkPrintSettings; use_color:Tgboolean);cdecl;external;
function gtk_print_settings_get_collate(settings:PGtkPrintSettings):Tgboolean;cdecl;external;
procedure gtk_print_settings_set_collate(settings:PGtkPrintSettings; collate:Tgboolean);cdecl;external;
function gtk_print_settings_get_reverse(settings:PGtkPrintSettings):Tgboolean;cdecl;external;
procedure gtk_print_settings_set_reverse(settings:PGtkPrintSettings; reverse:Tgboolean);cdecl;external;
function gtk_print_settings_get_duplex(settings:PGtkPrintSettings):TGtkPrintDuplex;cdecl;external;
procedure gtk_print_settings_set_duplex(settings:PGtkPrintSettings; duplex:TGtkPrintDuplex);cdecl;external;
function gtk_print_settings_get_quality(settings:PGtkPrintSettings):TGtkPrintQuality;cdecl;external;
procedure gtk_print_settings_set_quality(settings:PGtkPrintSettings; quality:TGtkPrintQuality);cdecl;external;
function gtk_print_settings_get_n_copies(settings:PGtkPrintSettings):longint;cdecl;external;
procedure gtk_print_settings_set_n_copies(settings:PGtkPrintSettings; num_copies:longint);cdecl;external;
function gtk_print_settings_get_number_up(settings:PGtkPrintSettings):longint;cdecl;external;
procedure gtk_print_settings_set_number_up(settings:PGtkPrintSettings; number_up:longint);cdecl;external;
function gtk_print_settings_get_number_up_layout(settings:PGtkPrintSettings):TGtkNumberUpLayout;cdecl;external;
procedure gtk_print_settings_set_number_up_layout(settings:PGtkPrintSettings; number_up_layout:TGtkNumberUpLayout);cdecl;external;
function gtk_print_settings_get_resolution(settings:PGtkPrintSettings):longint;cdecl;external;
procedure gtk_print_settings_set_resolution(settings:PGtkPrintSettings; resolution:longint);cdecl;external;
function gtk_print_settings_get_resolution_x(settings:PGtkPrintSettings):longint;cdecl;external;
function gtk_print_settings_get_resolution_y(settings:PGtkPrintSettings):longint;cdecl;external;
procedure gtk_print_settings_set_resolution_xy(settings:PGtkPrintSettings; resolution_x:longint; resolution_y:longint);cdecl;external;
function gtk_print_settings_get_printer_lpi(settings:PGtkPrintSettings):Tdouble;cdecl;external;
procedure gtk_print_settings_set_printer_lpi(settings:PGtkPrintSettings; lpi:Tdouble);cdecl;external;
function gtk_print_settings_get_scale(settings:PGtkPrintSettings):Tdouble;cdecl;external;
procedure gtk_print_settings_set_scale(settings:PGtkPrintSettings; scale:Tdouble);cdecl;external;
function gtk_print_settings_get_print_pages(settings:PGtkPrintSettings):TGtkPrintPages;cdecl;external;
procedure gtk_print_settings_set_print_pages(settings:PGtkPrintSettings; pages:TGtkPrintPages);cdecl;external;
function gtk_print_settings_get_page_ranges(settings:PGtkPrintSettings; num_ranges:Plongint):PGtkPageRange;cdecl;external;
procedure gtk_print_settings_set_page_ranges(settings:PGtkPrintSettings; page_ranges:PGtkPageRange; num_ranges:longint);cdecl;external;
function gtk_print_settings_get_page_set(settings:PGtkPrintSettings):TGtkPageSet;cdecl;external;
procedure gtk_print_settings_set_page_set(settings:PGtkPrintSettings; page_set:TGtkPageSet);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_default_source(settings:PGtkPrintSettings):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_default_source(settings:PGtkPrintSettings; default_source:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_media_type(settings:PGtkPrintSettings):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_media_type(settings:PGtkPrintSettings; media_type:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_dither(settings:PGtkPrintSettings):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_dither(settings:PGtkPrintSettings; dither:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_finishings(settings:PGtkPrintSettings):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_finishings(settings:PGtkPrintSettings; finishings:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_print_settings_get_output_bin(settings:PGtkPrintSettings):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_settings_set_output_bin(settings:PGtkPrintSettings; output_bin:Pchar);cdecl;external;
function gtk_print_settings_to_gvariant(settings:PGtkPrintSettings):PGVariant;cdecl;external;
function gtk_print_settings_new_from_gvariant(variant:PGVariant):PGtkPrintSettings;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPrintSettings, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_PRINT_SETTINGS : longint; { return type might be wrong }
  begin
    GTK_TYPE_PRINT_SETTINGS:=gtk_print_settings_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_PRINT_SETTINGS(obj : longint) : longint;
begin
  GTK_PRINT_SETTINGS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_PRINT_SETTINGS,GtkPrintSettings);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_PRINT_SETTINGS(obj : longint) : longint;
begin
  GTK_IS_PRINT_SETTINGS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_PRINT_SETTINGS);
end;


end.
