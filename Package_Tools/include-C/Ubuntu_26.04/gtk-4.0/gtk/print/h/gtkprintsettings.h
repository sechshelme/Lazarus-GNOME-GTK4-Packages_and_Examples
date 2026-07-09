/* GTK - The GIMP Toolkit
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
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/print/gtkpapersize.h>



typedef struct _GtkPrintSettings GtkPrintSettings;

#define GTK_TYPE_PRINT_SETTINGS    (gtk_print_settings_get_type ())
#define GTK_PRINT_SETTINGS(obj)    (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_PRINT_SETTINGS, GtkPrintSettings))
#define GTK_IS_PRINT_SETTINGS(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_PRINT_SETTINGS))

/**
 * GtkPrintSettingsFunc:
 * @key: the setting key
 * @value: the setting value
 * @user_data: (closure): The user data provided with the function
 *
 * Function called by [method@Gtk.PrintSettings.foreach] on every key/value pair
 * inside a [class@Gtk.PrintSettings].
 */
typedef void  (*GtkPrintSettingsFunc)  (const char *key,
					const char *value,
					gpointer     user_data);

typedef struct _GtkPageRange GtkPageRange;

/**
 * GtkPageRange:
 * @start: start of page range.
 * @end: end of page range.
 *
 * A range of pages to print.
 *
 * See also [method@Gtk.PrintSettings.set_page_ranges].
 */
struct _GtkPageRange
{
  int start;
  int end;
};

extern
GType             gtk_print_settings_get_type                (void) ;
extern
GtkPrintSettings *gtk_print_settings_new                     (void);

extern
GtkPrintSettings *gtk_print_settings_copy                    (GtkPrintSettings     *other);

extern
GtkPrintSettings *gtk_print_settings_new_from_file           (const char           *file_name,
							      GError              **error);
extern
gboolean          gtk_print_settings_load_file               (GtkPrintSettings     *settings,
							      const char           *file_name,
							      GError              **error);
extern
gboolean          gtk_print_settings_to_file                 (GtkPrintSettings     *settings,
							      const char           *file_name,
							      GError              **error);
extern
GtkPrintSettings *gtk_print_settings_new_from_key_file       (GKeyFile             *key_file,
							      const char           *group_name,
							      GError              **error);
extern
gboolean          gtk_print_settings_load_key_file           (GtkPrintSettings     *settings,
							      GKeyFile             *key_file,
							      const char           *group_name,
							      GError              **error);
extern
void              gtk_print_settings_to_key_file             (GtkPrintSettings     *settings,
							      GKeyFile             *key_file,
							      const char           *group_name);
extern
gboolean          gtk_print_settings_has_key                 (GtkPrintSettings     *settings,
							      const char           *key);
extern
const char *     gtk_print_settings_get                     (GtkPrintSettings     *settings,
							      const char           *key);
extern
void              gtk_print_settings_set                     (GtkPrintSettings     *settings,
							      const char           *key,
							      const char           *value);
extern
void              gtk_print_settings_unset                   (GtkPrintSettings     *settings,
							      const char           *key);
extern
void              gtk_print_settings_foreach                 (GtkPrintSettings     *settings,
							      GtkPrintSettingsFunc  func,
							      gpointer              user_data);
extern
gboolean          gtk_print_settings_get_bool                (GtkPrintSettings     *settings,
							      const char           *key);
extern
void              gtk_print_settings_set_bool                (GtkPrintSettings     *settings,
							      const char           *key,
							      gboolean              value);
extern
double            gtk_print_settings_get_double              (GtkPrintSettings     *settings,
							      const char           *key);
extern
double            gtk_print_settings_get_double_with_default (GtkPrintSettings     *settings,
							      const char           *key,
							      double                def);
extern
void              gtk_print_settings_set_double              (GtkPrintSettings     *settings,
							      const char           *key,
							      double                value);
extern
double            gtk_print_settings_get_length              (GtkPrintSettings     *settings,
							      const char           *key,
							      GtkUnit               unit);
extern
void              gtk_print_settings_set_length              (GtkPrintSettings     *settings,
							      const char           *key,
							      double                value,
							      GtkUnit               unit);
extern
int               gtk_print_settings_get_int                 (GtkPrintSettings     *settings,
							      const char           *key);
extern
int               gtk_print_settings_get_int_with_default    (GtkPrintSettings     *settings,
							      const char           *key,
							      int                   def);
extern
void              gtk_print_settings_set_int                 (GtkPrintSettings     *settings,
							      const char           *key,
							      int                   value);

/**
 * GTK_PRINT_SETTINGS_PRINTER:
 *
 * The key used by the “Print to file” printer to store the printer name.
 */
#define GTK_PRINT_SETTINGS_PRINTER          "printer"

/**
 * GTK_PRINT_SETTINGS_ORIENTATION:
 *
 * The key used by the “Print to file” printer to store the orientation.
 */
#define GTK_PRINT_SETTINGS_ORIENTATION      "orientation"

/**
 * GTK_PRINT_SETTINGS_PAPER_FORMAT:
 *
 * The key used by the “Print to file” printer to store the page format.
 */
#define GTK_PRINT_SETTINGS_PAPER_FORMAT     "paper-format"

/**
 * GTK_PRINT_SETTINGS_PAPER_WIDTH:
 *
 * The key used by the “Print to file” printer to store the paper width.
 */
#define GTK_PRINT_SETTINGS_PAPER_WIDTH      "paper-width"

/**
 * GTK_PRINT_SETTINGS_PAPER_HEIGHT:
 *
 * The key used by the “Print to file” printer to store the page height.
 */
#define GTK_PRINT_SETTINGS_PAPER_HEIGHT     "paper-height"

/**
 * GTK_PRINT_SETTINGS_N_COPIES:
 *
 * The key used by the “Print to file” printer to store the number of copies.
 */
#define GTK_PRINT_SETTINGS_N_COPIES         "n-copies"

/**
 * GTK_PRINT_SETTINGS_DEFAULT_SOURCE:
 *
 * The key used by the “Print to file” printer to store the default source.
 */
#define GTK_PRINT_SETTINGS_DEFAULT_SOURCE   "default-source"

/**
 * GTK_PRINT_SETTINGS_QUALITY:
 *
 * The key used by the “Print to file” printer to store the printing quality.
 */
#define GTK_PRINT_SETTINGS_QUALITY          "quality"

/**
 * GTK_PRINT_SETTINGS_RESOLUTION:
 *
 * The key used by the “Print to file” printer to store the resolution in DPI.
 */
#define GTK_PRINT_SETTINGS_RESOLUTION       "resolution"

/**
 * GTK_PRINT_SETTINGS_USE_COLOR:
 *
 * The key used by the “Print to file” printer to store whether to print with
 * colors.
 */
#define GTK_PRINT_SETTINGS_USE_COLOR        "use-color"

/**
 * GTK_PRINT_SETTINGS_DUPLEX:
 *
 * The key used by the “Print to file” printer to store whether to print the
 * output in duplex.
 */
#define GTK_PRINT_SETTINGS_DUPLEX           "duplex"

/**
 * GTK_PRINT_SETTINGS_COLLATE:
 *
 * The key used by the “Print to file” printer to store whether to collate the
 * printed pages.
 */
#define GTK_PRINT_SETTINGS_COLLATE          "collate"

/**
 * GTK_PRINT_SETTINGS_REVERSE:
 *
 * The key used by the “Print to file” printer to store whether to reverse the
 * order of the printed pages.
 */
#define GTK_PRINT_SETTINGS_REVERSE          "reverse"

/**
 * GTK_PRINT_SETTINGS_MEDIA_TYPE:
 *
 * The key used by the “Print to file” printer to store the media type.
 *
 * The set of media types is defined in PWG 5101.1-2002 PWG.
 */
#define GTK_PRINT_SETTINGS_MEDIA_TYPE       "media-type"

/**
 * GTK_PRINT_SETTINGS_DITHER:
 *
 * The key used by the “Print to file” printer to store the dither used.
 */
#define GTK_PRINT_SETTINGS_DITHER           "dither"

/**
 * GTK_PRINT_SETTINGS_SCALE:
 *
 * The key used by the “Print to file” printer to store the scale.
 */
#define GTK_PRINT_SETTINGS_SCALE            "scale"

/**
 * GTK_PRINT_SETTINGS_PRINT_PAGES:
 *
 * The key used by the “Print to file” printer to store which pages to print.
 */
#define GTK_PRINT_SETTINGS_PRINT_PAGES      "print-pages"

/**
 * GTK_PRINT_SETTINGS_PAGE_RANGES:
 *
 * The key used by the “Print to file” printer to store the array of page ranges
 * to print.
 */
#define GTK_PRINT_SETTINGS_PAGE_RANGES      "page-ranges"

/**
 * GTK_PRINT_SETTINGS_PAGE_SET:
 *
 * The key used by the “Print to file” printer to store the set of pages to print.
 */
#define GTK_PRINT_SETTINGS_PAGE_SET         "page-set"

/**
 * GTK_PRINT_SETTINGS_FINISHINGS:
 *
 * The key used by the “Print to file” printer to store the finishings.
 */
#define GTK_PRINT_SETTINGS_FINISHINGS       "finishings"

/**
 * GTK_PRINT_SETTINGS_NUMBER_UP:
 *
 * The key used by the “Print to file” printer to store the number of pages per
 * sheet.
 */
#define GTK_PRINT_SETTINGS_NUMBER_UP        "number-up"

/**
 * GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT:
 *
 * The key used by the “Print to file” printer to store the number of pages per
 * sheet in number-up mode.
 */
#define GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT "number-up-layout"

/**
 * GTK_PRINT_SETTINGS_OUTPUT_BIN:
 *
 * The key used by the “Print to file” printer to store the output bin.
 */
#define GTK_PRINT_SETTINGS_OUTPUT_BIN       "output-bin"

/**
 * GTK_PRINT_SETTINGS_RESOLUTION_X:
 *
 * The key used by the “Print to file” printer to store the horizontal
 * resolution in DPI.
 */
#define GTK_PRINT_SETTINGS_RESOLUTION_X     "resolution-x"

/**
 * GTK_PRINT_SETTINGS_RESOLUTION_Y:
 *
 * The key used by the “Print to file” printer to store the vertical resolution
 * in DPI.
 */
#define GTK_PRINT_SETTINGS_RESOLUTION_Y     "resolution-y"

/**
 * GTK_PRINT_SETTINGS_PRINTER_LPI:
 *
 * The key used by the “Print to file” printer to store the resolution in lines
 * per inch.
 */
#define GTK_PRINT_SETTINGS_PRINTER_LPI      "printer-lpi"

/**
 * GTK_PRINT_SETTINGS_OUTPUT_DIR:
 *
 * The key used by the “Print to file” printer to store the
 * directory to which the output should be written.
 */
#define GTK_PRINT_SETTINGS_OUTPUT_DIR       "output-dir"

/**
 * GTK_PRINT_SETTINGS_OUTPUT_BASENAME:
 *
 * The key used by the “Print to file” printer to store the file
 * name of the output without the path to the directory and the
 * file extension.
 */
#define GTK_PRINT_SETTINGS_OUTPUT_BASENAME  "output-basename"

/**
 * GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT:
 *
 * The key used by the “Print to file” printer to store the format
 * of the output. The supported values are “PS” and “PDF”.
 */
#define GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT  "output-file-format"

/**
 * GTK_PRINT_SETTINGS_OUTPUT_URI:
 *
 * The key used by the “Print to file” printer to store the URI
 * to which the output should be written. GTK itself supports
 * only “file://” URIs.
 */
#define GTK_PRINT_SETTINGS_OUTPUT_URI          "output-uri"

/**
 * GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION:
 *
 * The key used by the “Print to file” printer to store the 32-bit Windows
 * driver version.
 */
#define GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION "win32-driver-version"

/**
 * GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA:
 *
 * The key used by the “Print to file” printer to store 32-bit Windows extra
 * driver.
 */
#define GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA   "win32-driver-extra"

/* Helpers: */

extern
const char *         gtk_print_settings_get_printer           (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_printer           (GtkPrintSettings   *settings,
								const char         *printer);
extern
GtkPageOrientation    gtk_print_settings_get_orientation       (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_orientation       (GtkPrintSettings   *settings,
								GtkPageOrientation  orientation);
extern
GtkPaperSize *        gtk_print_settings_get_paper_size        (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_paper_size        (GtkPrintSettings   *settings,
								GtkPaperSize       *paper_size);
extern
double                gtk_print_settings_get_paper_width       (GtkPrintSettings   *settings,
								GtkUnit             unit);
extern
void                  gtk_print_settings_set_paper_width       (GtkPrintSettings   *settings,
								double              width,
								GtkUnit             unit);
extern
double                gtk_print_settings_get_paper_height      (GtkPrintSettings   *settings,
								GtkUnit             unit);
extern
void                  gtk_print_settings_set_paper_height      (GtkPrintSettings   *settings,
								double              height,
								GtkUnit             unit);
extern
gboolean              gtk_print_settings_get_use_color         (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_use_color         (GtkPrintSettings   *settings,
								gboolean            use_color);
extern
gboolean              gtk_print_settings_get_collate           (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_collate           (GtkPrintSettings   *settings,
								gboolean            collate);
extern
gboolean              gtk_print_settings_get_reverse           (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_reverse           (GtkPrintSettings   *settings,
								gboolean            reverse);
extern
GtkPrintDuplex        gtk_print_settings_get_duplex            (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_duplex            (GtkPrintSettings   *settings,
								GtkPrintDuplex      duplex);
extern
GtkPrintQuality       gtk_print_settings_get_quality           (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_quality           (GtkPrintSettings   *settings,
								GtkPrintQuality     quality);
extern
int                   gtk_print_settings_get_n_copies          (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_n_copies          (GtkPrintSettings   *settings,
								int                 num_copies);
extern
int                   gtk_print_settings_get_number_up         (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_number_up         (GtkPrintSettings   *settings,
								int                 number_up);
extern
GtkNumberUpLayout     gtk_print_settings_get_number_up_layout  (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_number_up_layout  (GtkPrintSettings   *settings,
								GtkNumberUpLayout   number_up_layout);
extern
int                   gtk_print_settings_get_resolution        (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_resolution        (GtkPrintSettings   *settings,
								int                 resolution);
extern
int                   gtk_print_settings_get_resolution_x      (GtkPrintSettings   *settings);
extern
int                   gtk_print_settings_get_resolution_y      (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_resolution_xy     (GtkPrintSettings   *settings,
								int                 resolution_x,
								int                 resolution_y);
extern
double                gtk_print_settings_get_printer_lpi       (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_printer_lpi       (GtkPrintSettings   *settings,
								double              lpi);
extern
double                gtk_print_settings_get_scale             (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_scale             (GtkPrintSettings   *settings,
								double              scale);
extern
GtkPrintPages         gtk_print_settings_get_print_pages       (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_print_pages       (GtkPrintSettings   *settings,
								GtkPrintPages       pages);
extern
GtkPageRange *        gtk_print_settings_get_page_ranges       (GtkPrintSettings   *settings,
								int                *num_ranges);
extern
void                  gtk_print_settings_set_page_ranges       (GtkPrintSettings   *settings,
								GtkPageRange       *page_ranges,
								int                 num_ranges);
extern
GtkPageSet            gtk_print_settings_get_page_set          (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_page_set          (GtkPrintSettings   *settings,
								GtkPageSet          page_set);
extern
const char *         gtk_print_settings_get_default_source    (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_default_source    (GtkPrintSettings   *settings,
								const char         *default_source);
extern
const char *         gtk_print_settings_get_media_type        (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_media_type        (GtkPrintSettings   *settings,
								const char         *media_type);
extern
const char *         gtk_print_settings_get_dither            (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_dither            (GtkPrintSettings   *settings,
								const char         *dither);
extern
const char *         gtk_print_settings_get_finishings        (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_finishings        (GtkPrintSettings   *settings,
								const char         *finishings);
extern
const char *         gtk_print_settings_get_output_bin        (GtkPrintSettings   *settings);
extern
void                  gtk_print_settings_set_output_bin        (GtkPrintSettings   *settings,
								const char         *output_bin);

extern
GVariant             *gtk_print_settings_to_gvariant           (GtkPrintSettings   *settings);
extern
GtkPrintSettings     *gtk_print_settings_new_from_gvariant     (GVariant           *variant);

//////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPrintSettings, g_object_unref)



