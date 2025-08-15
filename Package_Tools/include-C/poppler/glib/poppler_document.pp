
unit poppler_document;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_document.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_document.h
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
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGFile  = ^GFile;
PGInputStream  = ^GInputStream;
PGList  = ^GList;
PGTree  = ^GTree;
Pguint  = ^guint;
Plongint  = ^longint;
PPopplerAction  = ^PopplerAction;
PPopplerDest  = ^PopplerDest;
PPopplerDocument  = ^PopplerDocument;
PPopplerFontInfo  = ^PopplerFontInfo;
PPopplerFontsIter  = ^PopplerFontsIter;
PPopplerFontType  = ^PopplerFontType;
PPopplerFormField  = ^PopplerFormField;
PPopplerIndexIter  = ^PopplerIndexIter;
PPopplerLayer  = ^PopplerLayer;
PPopplerLayersIter  = ^PopplerLayersIter;
PPopplerPage  = ^PopplerPage;
PPopplerPageLayout  = ^PopplerPageLayout;
PPopplerPageMode  = ^PopplerPageMode;
PPopplerPageRange  = ^PopplerPageRange;
PPopplerPDFConformance  = ^PopplerPDFConformance;
PPopplerPDFPart  = ^PopplerPDFPart;
PPopplerPDFSubtype  = ^PopplerPDFSubtype;
PPopplerPermissions  = ^PopplerPermissions;
PPopplerPrintDuplex  = ^PopplerPrintDuplex;
PPopplerPrintScaling  = ^PopplerPrintScaling;
PPopplerPSFile  = ^PopplerPSFile;
PPopplerSigningData  = ^PopplerSigningData;
PPopplerViewerPreferences  = ^PopplerViewerPreferences;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-document.h: glib interface to poppler
 * Copyright (C) 2004, Red Hat, Inc.
 *
 * Copyright (C) 2016 Jakub Alba <jakubalba@gmail.com>
 * Copyright (C) 2018, 2019, 2021, 2022 Marek Kasik <mkasik@redhat.com>
 * Copyright (C) 2019 Masamichi Hosoda <trueroad@trueroad.jp>
 * Copyright (C) 2021 André Guerreiro <aguerreiro1985@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_DOCUMENT_H__}
{$define __POPPLER_DOCUMENT_H__}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_DOCUMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_DOCUMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_DOCUMENT(obj : longint) : longint;

{*
 * PopplerPageLayout:
 * @POPPLER_PAGE_LAYOUT_UNSET: no specific layout set
 * @POPPLER_PAGE_LAYOUT_SINGLE_PAGE: one page at a time
 * @POPPLER_PAGE_LAYOUT_ONE_COLUMN: pages in one column
 * @POPPLER_PAGE_LAYOUT_TWO_COLUMN_LEFT: pages in two columns with odd numbered pages on the left
 * @POPPLER_PAGE_LAYOUT_TWO_COLUMN_RIGHT: pages in two columns with odd numbered pages on the right
 * @POPPLER_PAGE_LAYOUT_TWO_PAGE_LEFT: two pages at a time with odd numbered pages on the left
 * @POPPLER_PAGE_LAYOUT_TWO_PAGE_RIGHT: two pages at a time with odd numbered pages on the right
 *
 * Page layout types
  }
type
  PPopplerPageLayout = ^TPopplerPageLayout;
  TPopplerPageLayout =  Longint;
  Const
    POPPLER_PAGE_LAYOUT_UNSET = 0;
    POPPLER_PAGE_LAYOUT_SINGLE_PAGE = 1;
    POPPLER_PAGE_LAYOUT_ONE_COLUMN = 2;
    POPPLER_PAGE_LAYOUT_TWO_COLUMN_LEFT = 3;
    POPPLER_PAGE_LAYOUT_TWO_COLUMN_RIGHT = 4;
    POPPLER_PAGE_LAYOUT_TWO_PAGE_LEFT = 5;
    POPPLER_PAGE_LAYOUT_TWO_PAGE_RIGHT = 6;
;
{*
 * PopplerPageMode:
 * @POPPLER_PAGE_MODE_UNSET: no specific mode set
 * @POPPLER_PAGE_MODE_NONE: neither document outline nor thumbnails visible
 * @POPPLER_PAGE_MODE_USE_OUTLINES: document outline visible
 * @POPPLER_PAGE_MODE_USE_THUMBS: thumbnails visible
 * @POPPLER_PAGE_MODE_FULL_SCREEN: full-screen mode
 * @POPPLER_PAGE_MODE_USE_OC: layers panel visible
 * @POPPLER_PAGE_MODE_USE_ATTACHMENTS: attachments panel visible
 *
 * Page modes
  }
type
  PPopplerPageMode = ^TPopplerPageMode;
  TPopplerPageMode =  Longint;
  Const
    POPPLER_PAGE_MODE_UNSET = 0;
    POPPLER_PAGE_MODE_NONE = 1;
    POPPLER_PAGE_MODE_USE_OUTLINES = 2;
    POPPLER_PAGE_MODE_USE_THUMBS = 3;
    POPPLER_PAGE_MODE_FULL_SCREEN = 4;
    POPPLER_PAGE_MODE_USE_OC = 5;
    POPPLER_PAGE_MODE_USE_ATTACHMENTS = 6;
;
{*
 * PopplerFontType:
 * @POPPLER_FONT_TYPE_UNKNOWN: unknown font type
 * @POPPLER_FONT_TYPE_TYPE1: Type 1 font type
 * @POPPLER_FONT_TYPE_TYPE1C: Type 1 font type embedded in Compact Font Format (CFF) font program
 * @POPPLER_FONT_TYPE_TYPE1COT: Type 1 font type embedded in OpenType font program
 * @POPPLER_FONT_TYPE_TYPE3: A font type that is defined with PDF graphics operators
 * @POPPLER_FONT_TYPE_TRUETYPE: TrueType font type
 * @POPPLER_FONT_TYPE_TRUETYPEOT: TrueType font type embedded in OpenType font program
 * @POPPLER_FONT_TYPE_CID_TYPE0: CIDFont type based on Type 1 font technology
 * @POPPLER_FONT_TYPE_CID_TYPE0C: CIDFont type based on Type 1 font technology embedded in CFF font program
 * @POPPLER_FONT_TYPE_CID_TYPE0COT: CIDFont type based on Type 1 font technology embedded in OpenType font program
 * @POPPLER_FONT_TYPE_CID_TYPE2: CIDFont type based on TrueType font technology
 * @POPPLER_FONT_TYPE_CID_TYPE2OT: CIDFont type based on TrueType font technology embedded in OpenType font program
 *
 * Font types
  }
type
  PPopplerFontType = ^TPopplerFontType;
  TPopplerFontType =  Longint;
  Const
    POPPLER_FONT_TYPE_UNKNOWN = 0;
    POPPLER_FONT_TYPE_TYPE1 = 1;
    POPPLER_FONT_TYPE_TYPE1C = 2;
    POPPLER_FONT_TYPE_TYPE1COT = 3;
    POPPLER_FONT_TYPE_TYPE3 = 4;
    POPPLER_FONT_TYPE_TRUETYPE = 5;
    POPPLER_FONT_TYPE_TRUETYPEOT = 6;
    POPPLER_FONT_TYPE_CID_TYPE0 = 7;
    POPPLER_FONT_TYPE_CID_TYPE0C = 8;
    POPPLER_FONT_TYPE_CID_TYPE0COT = 9;
    POPPLER_FONT_TYPE_CID_TYPE2 = 10;
    POPPLER_FONT_TYPE_CID_TYPE2OT = 11;
;
{*
 * PopplerViewerPreferences:
 * @POPPLER_VIEWER_PREFERENCES_UNSET: no preferences set
 * @POPPLER_VIEWER_PREFERENCES_HIDE_TOOLBAR: hider toolbars when document is active
 * @POPPLER_VIEWER_PREFERENCES_HIDE_MENUBAR: hide menu bar when document is active
 * @POPPLER_VIEWER_PREFERENCES_HIDE_WINDOWUI: hide UI elements in document's window
 * @POPPLER_VIEWER_PREFERENCES_FIT_WINDOW: resize document's window to fit the size of the first displayed page
 * @POPPLER_VIEWER_PREFERENCES_CENTER_WINDOW: position the document's window in the center of the screen
 * @POPPLER_VIEWER_PREFERENCES_DISPLAY_DOC_TITLE: display document title in window's title bar
 * @POPPLER_VIEWER_PREFERENCES_DIRECTION_RTL: the predominant reading order for text is right to left
 *
 * Viewer preferences
  }
{< flags > }
type
  PPopplerViewerPreferences = ^TPopplerViewerPreferences;
  TPopplerViewerPreferences =  Longint;
  Const
    POPPLER_VIEWER_PREFERENCES_UNSET = 0;
    POPPLER_VIEWER_PREFERENCES_HIDE_TOOLBAR = 1 shl 0;
    POPPLER_VIEWER_PREFERENCES_HIDE_MENUBAR = 1 shl 1;
    POPPLER_VIEWER_PREFERENCES_HIDE_WINDOWUI = 1 shl 2;
    POPPLER_VIEWER_PREFERENCES_FIT_WINDOW = 1 shl 3;
    POPPLER_VIEWER_PREFERENCES_CENTER_WINDOW = 1 shl 4;
    POPPLER_VIEWER_PREFERENCES_DISPLAY_DOC_TITLE = 1 shl 5;
    POPPLER_VIEWER_PREFERENCES_DIRECTION_RTL = 1 shl 6;
;
{*
 * PopplerPrintScaling:
 * @POPPLER_PRINT_SCALING_APP_DEFAULT: application's default page scaling
 * @POPPLER_PRINT_SCALING_NONE: no page scaling
 *
 * PrintScaling viewer preference
 *
 * Since: 0.73
  }
type
  PPopplerPrintScaling = ^TPopplerPrintScaling;
  TPopplerPrintScaling =  Longint;
  Const
    POPPLER_PRINT_SCALING_APP_DEFAULT = 0;
    POPPLER_PRINT_SCALING_NONE = 1;
;
{*
 * PopplerPrintDuplex:
 * @POPPLER_PRINT_DUPLEX_NONE: No preference on duplex printing
 * @POPPLER_PRINT_DUPLEX_SIMPLEX: Print single-sided
 * @POPPLER_PRINT_DUPLEX_DUPLEX_FLIP_SHORT_EDGE: Duplex and flip on the short edge of the sheet
 * @POPPLER_PRINT_DUPLEX_DUPLEX_FLIP_LONG_EDGE: Duplex and flip on the long edge of the sheet
 *
 * Duplex viewer preference
 *
 * Since: 0.80
  }
type
  PPopplerPrintDuplex = ^TPopplerPrintDuplex;
  TPopplerPrintDuplex =  Longint;
  Const
    POPPLER_PRINT_DUPLEX_NONE = 0;
    POPPLER_PRINT_DUPLEX_SIMPLEX = 1;
    POPPLER_PRINT_DUPLEX_DUPLEX_FLIP_SHORT_EDGE = 2;
    POPPLER_PRINT_DUPLEX_DUPLEX_FLIP_LONG_EDGE = 3;
;
{*
 * PopplerPermissions:
 * @POPPLER_PERMISSIONS_OK_TO_PRINT: document can be printer
 * @POPPLER_PERMISSIONS_OK_TO_MODIFY: document contents can be modified
 * @POPPLER_PERMISSIONS_OK_TO_COPY: document can be copied
 * @POPPLER_PERMISSIONS_OK_TO_ADD_NOTES: annotations can added to the document
 * @POPPLER_PERMISSIONS_OK_TO_FILL_FORM: interactive form fields can be filled in
 * @POPPLER_PERMISSIONS_OK_TO_EXTRACT_CONTENTS: extract text and graphics
 * (in support of accessibility to users with disabilities or for other purposes). Since 0.18
 * @POPPLER_PERMISSIONS_OK_TO_ASSEMBLE: assemble the document (insert, rotate, or delete pages and create
 * bookmarks or thumbnail images). Since 0.18
 * @POPPLER_PERMISSIONS_OK_TO_PRINT_HIGH_RESOLUTION: document can be printer at high resolution. Since 0.18
 * @POPPLER_PERMISSIONS_FULL: document permits all operations
 *
 * Permissions
  }
{ clang-format off  }
{< flags > }
type
  PPopplerPermissions = ^TPopplerPermissions;
  TPopplerPermissions =  Longint;
  Const
    POPPLER_PERMISSIONS_OK_TO_PRINT = 1 shl 0;
    POPPLER_PERMISSIONS_OK_TO_MODIFY = 1 shl 1;
    POPPLER_PERMISSIONS_OK_TO_COPY = 1 shl 2;
    POPPLER_PERMISSIONS_OK_TO_ADD_NOTES = 1 shl 3;
    POPPLER_PERMISSIONS_OK_TO_FILL_FORM = 1 shl 4;
    POPPLER_PERMISSIONS_OK_TO_EXTRACT_CONTENTS = 1 shl 5;
    POPPLER_PERMISSIONS_OK_TO_ASSEMBLE = 1 shl 6;
    POPPLER_PERMISSIONS_OK_TO_PRINT_HIGH_RESOLUTION = 1 shl 7;
    POPPLER_PERMISSIONS_FULL = ((((((POPPLER_PERMISSIONS_OK_TO_PRINT or POPPLER_PERMISSIONS_OK_TO_MODIFY) or POPPLER_PERMISSIONS_OK_TO_COPY) or POPPLER_PERMISSIONS_OK_TO_ADD_NOTES) or POPPLER_PERMISSIONS_OK_TO_FILL_FORM) or POPPLER_PERMISSIONS_OK_TO_EXTRACT_CONTENTS) or POPPLER_PERMISSIONS_OK_TO_ASSEMBLE) or POPPLER_PERMISSIONS_OK_TO_PRINT_HIGH_RESOLUTION;
;
{ clang-format on  }
{*
 * PopplerPDFSubtype:
 * @POPPLER_PDF_SUBTYPE_UNSET: Null
 * @POPPLER_PDF_SUBTYPE_PDF_A: ISO 19005 - Document management -- Electronic document file format for long-term preservation (PDF/A)
 * @POPPLER_PDF_SUBTYPE_PDF_E: ISO 24517 - Document management -- Engineering document format using PDF (PDF/E)
 * @POPPLER_PDF_SUBTYPE_PDF_UA: ISO 14289 - Document management applications -- Electronic document file format enhancement for accessibility (PDF/UA)
 * @POPPLER_PDF_SUBTYPE_PDF_VT: ISO 16612 - Graphic technology -- Variable data exchange (PDF/VT)
 * @POPPLER_PDF_SUBTYPE_PDF_X: ISO 15930 - Graphic technology -- Prepress digital data exchange (PDF/X)
 * @POPPLER_PDF_SUBTYPE_NONE: Not compliant with the above standards
 *
 * PDF Subtype
 *
 * Since: 0.70
  }
type
  PPopplerPDFSubtype = ^TPopplerPDFSubtype;
  TPopplerPDFSubtype =  Longint;
  Const
    POPPLER_PDF_SUBTYPE_UNSET = 0;
    POPPLER_PDF_SUBTYPE_PDF_A = 1;
    POPPLER_PDF_SUBTYPE_PDF_E = 2;
    POPPLER_PDF_SUBTYPE_PDF_UA = 3;
    POPPLER_PDF_SUBTYPE_PDF_VT = 4;
    POPPLER_PDF_SUBTYPE_PDF_X = 5;
    POPPLER_PDF_SUBTYPE_NONE = 6;
;
{*
 * PopplerPDFPart:
 * @POPPLER_PDF_SUBTYPE_PART_UNSET: Null
 * @POPPLER_PDF_SUBTYPE_PART_1: 1
 * @POPPLER_PDF_SUBTYPE_PART_2: 2
 * @POPPLER_PDF_SUBTYPE_PART_3: 3
 * @POPPLER_PDF_SUBTYPE_PART_4: 4
 * @POPPLER_PDF_SUBTYPE_PART_5: 5
 * @POPPLER_PDF_SUBTYPE_PART_6: 6
 * @POPPLER_PDF_SUBTYPE_PART_7: 7
 * @POPPLER_PDF_SUBTYPE_PART_8: 8
 * @POPPLER_PDF_SUBTYPE_PART_NONE: No part available
 *
 * PDF Subtype Part
 *
 * Since: 0.70
  }
type
  PPopplerPDFPart = ^TPopplerPDFPart;
  TPopplerPDFPart =  Longint;
  Const
    POPPLER_PDF_SUBTYPE_PART_UNSET = 0;
    POPPLER_PDF_SUBTYPE_PART_1 = 1;
    POPPLER_PDF_SUBTYPE_PART_2 = 2;
    POPPLER_PDF_SUBTYPE_PART_3 = 3;
    POPPLER_PDF_SUBTYPE_PART_4 = 4;
    POPPLER_PDF_SUBTYPE_PART_5 = 5;
    POPPLER_PDF_SUBTYPE_PART_6 = 6;
    POPPLER_PDF_SUBTYPE_PART_7 = 7;
    POPPLER_PDF_SUBTYPE_PART_8 = 8;
    POPPLER_PDF_SUBTYPE_PART_NONE = 9;
;
{*
 * PopplerPDFConformance:
 * @POPPLER_PDF_SUBTYPE_CONF_UNSET: Null
 * @POPPLER_PDF_SUBTYPE_CONF_A: Level A (accessible) conformance (PDF/A)
 * @POPPLER_PDF_SUBTYPE_CONF_B: Level B (basic) conformance (PDF/A)
 * @POPPLER_PDF_SUBTYPE_CONF_G: Level G (external graphical content) (PDF/X)
 * @POPPLER_PDF_SUBTYPE_CONF_N: Level N (external ICC Profile) (PDF/X)
 * @POPPLER_PDF_SUBTYPE_CONF_P: Level P (ICC Profile) (PDF/X)
 * @POPPLER_PDF_SUBTYPE_CONF_PG: Level PG (conjunction of P and G) (PDF/X)
 * @POPPLER_PDF_SUBTYPE_CONF_U: Level U (Unicode) conformance (PDF/A)
 * @POPPLER_PDF_SUBTYPE_CONF_NONE: No conformance level available
 *
 * PDF Subtype Conformance
 *
 * Since: 0.70
  }
type
  PPopplerPDFConformance = ^TPopplerPDFConformance;
  TPopplerPDFConformance =  Longint;
  Const
    POPPLER_PDF_SUBTYPE_CONF_UNSET = 0;
    POPPLER_PDF_SUBTYPE_CONF_A = 1;
    POPPLER_PDF_SUBTYPE_CONF_B = 2;
    POPPLER_PDF_SUBTYPE_CONF_G = 3;
    POPPLER_PDF_SUBTYPE_CONF_N = 4;
    POPPLER_PDF_SUBTYPE_CONF_P = 5;
    POPPLER_PDF_SUBTYPE_CONF_PG = 6;
    POPPLER_PDF_SUBTYPE_CONF_U = 7;
    POPPLER_PDF_SUBTYPE_CONF_NONE = 8;
;

function poppler_document_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_document_new_from_file(uri:Pchar; password:Pchar; error:PPGError):PPopplerDocument;cdecl;external;
(* Const before type ignored *)
function poppler_document_new_from_data(data:Pchar; length:longint; password:Pchar; error:PPGError):PPopplerDocument;cdecl;external;
{G_GNUC_DEPRECATED*_FOR(poppler_document_new_from_bytes); }
(* Const before type ignored *)
function poppler_document_new_from_bytes(bytes:PGBytes; password:Pchar; error:PPGError):PPopplerDocument;cdecl;external;
(* Const before type ignored *)
function poppler_document_new_from_stream(stream:PGInputStream; length:Tgoffset; password:Pchar; cancellable:PGCancellable; error:PPGError):PPopplerDocument;cdecl;external;
(* Const before type ignored *)
function poppler_document_new_from_gfile(file:PGFile; password:Pchar; cancellable:PGCancellable; error:PPGError):PPopplerDocument;cdecl;external;
{$ifndef G_OS_WIN32}
(* Const before type ignored *)

function poppler_document_new_from_fd(fd:longint; password:Pchar; error:PPGError):PPopplerDocument;cdecl;external;
{$endif}
(* Const before type ignored *)

function poppler_document_save(document:PPopplerDocument; uri:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function poppler_document_save_a_copy(document:PPopplerDocument; uri:Pchar; error:PPGError):Tgboolean;cdecl;external;
{$ifndef G_OS_WIN32}

function poppler_document_save_to_fd(document:PPopplerDocument; fd:longint; include_changes:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
{$endif}

function poppler_document_get_id(document:PPopplerDocument; permanent_id:PPgchar; update_id:PPgchar):Tgboolean;cdecl;external;
function poppler_document_get_n_pages(document:PPopplerDocument):longint;cdecl;external;
function poppler_document_get_page(document:PPopplerDocument; index:longint):PPopplerPage;cdecl;external;
(* Const before type ignored *)
function poppler_document_get_page_by_label(document:PPopplerDocument; _label:Pchar):PPopplerPage;cdecl;external;
function poppler_document_get_pdf_version_string(document:PPopplerDocument):Pgchar;cdecl;external;
procedure poppler_document_get_pdf_version(document:PPopplerDocument; major_version:Pguint; minor_version:Pguint);cdecl;external;
function poppler_document_get_title(document:PPopplerDocument):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_document_set_title(document:PPopplerDocument; title:Pgchar);cdecl;external;
function poppler_document_get_author(document:PPopplerDocument):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_document_set_author(document:PPopplerDocument; author:Pgchar);cdecl;external;
function poppler_document_get_subject(document:PPopplerDocument):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_document_set_subject(document:PPopplerDocument; subject:Pgchar);cdecl;external;
function poppler_document_get_keywords(document:PPopplerDocument):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_document_set_keywords(document:PPopplerDocument; keywords:Pgchar);cdecl;external;
function poppler_document_get_creator(document:PPopplerDocument):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_document_set_creator(document:PPopplerDocument; creator:Pgchar);cdecl;external;
function poppler_document_get_producer(document:PPopplerDocument):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_document_set_producer(document:PPopplerDocument; producer:Pgchar);cdecl;external;
function poppler_document_get_creation_date(document:PPopplerDocument):Ttime_t;cdecl;external;
procedure poppler_document_set_creation_date(document:PPopplerDocument; creation_date:Ttime_t);cdecl;external;
function poppler_document_get_creation_date_time(document:PPopplerDocument):PGDateTime;cdecl;external;
procedure poppler_document_set_creation_date_time(document:PPopplerDocument; creation_datetime:PGDateTime);cdecl;external;
function poppler_document_get_modification_date(document:PPopplerDocument):Ttime_t;cdecl;external;
procedure poppler_document_set_modification_date(document:PPopplerDocument; modification_date:Ttime_t);cdecl;external;
function poppler_document_get_modification_date_time(document:PPopplerDocument):PGDateTime;cdecl;external;
procedure poppler_document_set_modification_date_time(document:PPopplerDocument; modification_datetime:PGDateTime);cdecl;external;
function poppler_document_is_linearized(document:PPopplerDocument):Tgboolean;cdecl;external;
function poppler_document_get_page_layout(document:PPopplerDocument):TPopplerPageLayout;cdecl;external;
function poppler_document_get_page_mode(document:PPopplerDocument):TPopplerPageMode;cdecl;external;
function poppler_document_get_permissions(document:PPopplerDocument):TPopplerPermissions;cdecl;external;
function poppler_document_get_pdf_subtype_string(document:PPopplerDocument):Pgchar;cdecl;external;
function poppler_document_get_pdf_subtype(document:PPopplerDocument):TPopplerPDFSubtype;cdecl;external;
function poppler_document_get_pdf_part(document:PPopplerDocument):TPopplerPDFPart;cdecl;external;
function poppler_document_get_pdf_conformance(document:PPopplerDocument):TPopplerPDFConformance;cdecl;external;
function poppler_document_get_metadata(document:PPopplerDocument):Pgchar;cdecl;external;
function poppler_document_get_print_scaling(document:PPopplerDocument):TPopplerPrintScaling;cdecl;external;
function poppler_document_get_print_duplex(document:PPopplerDocument):TPopplerPrintDuplex;cdecl;external;
function poppler_document_get_print_n_copies(document:PPopplerDocument):Tgint;cdecl;external;
function poppler_document_get_print_page_ranges(document:PPopplerDocument; n_ranges:Plongint):PPopplerPageRange;cdecl;external;
{ Attachments  }
function poppler_document_get_n_attachments(document:PPopplerDocument):Tguint;cdecl;external;
function poppler_document_has_attachments(document:PPopplerDocument):Tgboolean;cdecl;external;
function poppler_document_get_attachments(document:PPopplerDocument):PGList;cdecl;external;
{ Links  }
(* Const before type ignored *)
function poppler_document_find_dest(document:PPopplerDocument; link_name:Pgchar):PPopplerDest;cdecl;external;
function poppler_document_create_dests_tree(document:PPopplerDocument):PGTree;cdecl;external;
{ Form  }
function poppler_document_get_form_field(document:PPopplerDocument; id:Tgint):PPopplerFormField;cdecl;external;
procedure poppler_document_reset_form(document:PPopplerDocument; fields:PGList; exclude_fields:Tgboolean);cdecl;external;
{ Javascript  }
function poppler_document_has_javascript(document:PPopplerDocument):Tgboolean;cdecl;external;
{ Signatures  }
function poppler_document_get_signature_fields(document:PPopplerDocument):PGList;cdecl;external;
(* Const before type ignored *)
function poppler_document_get_n_signatures(document:PPopplerDocument):Tgint;cdecl;external;
{ Interface for getting the Index of a poppler_document  }
{ was #define dname def_expr }
function POPPLER_TYPE_INDEX_ITER : longint; { return type might be wrong }

function poppler_index_iter_get_type:TGType;cdecl;external;
function poppler_index_iter_new(document:PPopplerDocument):PPopplerIndexIter;cdecl;external;
function poppler_index_iter_copy(iter:PPopplerIndexIter):PPopplerIndexIter;cdecl;external;
procedure poppler_index_iter_free(iter:PPopplerIndexIter);cdecl;external;
function poppler_index_iter_get_child(parent:PPopplerIndexIter):PPopplerIndexIter;cdecl;external;
function poppler_index_iter_is_open(iter:PPopplerIndexIter):Tgboolean;cdecl;external;
function poppler_index_iter_get_action(iter:PPopplerIndexIter):PPopplerAction;cdecl;external;
function poppler_index_iter_next(iter:PPopplerIndexIter):Tgboolean;cdecl;external;
{ Interface for getting the Fonts of a poppler_document  }
{ was #define dname def_expr }
function POPPLER_TYPE_FONT_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_FONT_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_FONT_INFO(obj : longint) : longint;

function poppler_font_info_get_type:TGType;cdecl;external;
function poppler_font_info_new(document:PPopplerDocument):PPopplerFontInfo;cdecl;external;
function poppler_font_info_scan(font_info:PPopplerFontInfo; n_pages:longint; iter:PPPopplerFontsIter):Tgboolean;cdecl;external;
procedure poppler_font_info_free(font_info:PPopplerFontInfo);cdecl;external;
{ was #define dname def_expr }
function POPPLER_TYPE_FONTS_ITER : longint; { return type might be wrong }

function poppler_fonts_iter_get_type:TGType;cdecl;external;
function poppler_fonts_iter_copy(iter:PPopplerFontsIter):PPopplerFontsIter;cdecl;external;
procedure poppler_fonts_iter_free(iter:PPopplerFontsIter);cdecl;external;
(* Const before type ignored *)
function poppler_fonts_iter_get_name(iter:PPopplerFontsIter):Pchar;cdecl;external;
(* Const before type ignored *)
function poppler_fonts_iter_get_full_name(iter:PPopplerFontsIter):Pchar;cdecl;external;
(* Const before type ignored *)
function poppler_fonts_iter_get_substitute_name(iter:PPopplerFontsIter):Pchar;cdecl;external;
(* Const before type ignored *)
function poppler_fonts_iter_get_file_name(iter:PPopplerFontsIter):Pchar;cdecl;external;
function poppler_fonts_iter_get_font_type(iter:PPopplerFontsIter):TPopplerFontType;cdecl;external;
(* Const before type ignored *)
function poppler_fonts_iter_get_encoding(iter:PPopplerFontsIter):Pchar;cdecl;external;
function poppler_fonts_iter_is_embedded(iter:PPopplerFontsIter):Tgboolean;cdecl;external;
function poppler_fonts_iter_is_subset(iter:PPopplerFontsIter):Tgboolean;cdecl;external;
function poppler_fonts_iter_next(iter:PPopplerFontsIter):Tgboolean;cdecl;external;
{ Interface for getting the Layers of a poppler_document  }
{ was #define dname def_expr }
function POPPLER_TYPE_LAYERS_ITER : longint; { return type might be wrong }

function poppler_layers_iter_get_type:TGType;cdecl;external;
function poppler_layers_iter_new(document:PPopplerDocument):PPopplerLayersIter;cdecl;external;
function poppler_layers_iter_copy(iter:PPopplerLayersIter):PPopplerLayersIter;cdecl;external;
procedure poppler_layers_iter_free(iter:PPopplerLayersIter);cdecl;external;
function poppler_layers_iter_get_child(parent:PPopplerLayersIter):PPopplerLayersIter;cdecl;external;
function poppler_layers_iter_get_title(iter:PPopplerLayersIter):Pgchar;cdecl;external;
function poppler_layers_iter_get_layer(iter:PPopplerLayersIter):PPopplerLayer;cdecl;external;
function poppler_layers_iter_next(iter:PPopplerLayersIter):Tgboolean;cdecl;external;
{ Export to ps  }
{ was #define dname def_expr }
function POPPLER_TYPE_PS_FILE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_PS_FILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_PS_FILE(obj : longint) : longint;

function poppler_ps_file_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function poppler_ps_file_new(document:PPopplerDocument; filename:Pchar; first_page:longint; n_pages:longint):PPopplerPSFile;cdecl;external;
{$ifndef G_OS_WIN32}

function poppler_ps_file_new_fd(document:PPopplerDocument; fd:longint; first_page:longint; n_pages:longint):PPopplerPSFile;cdecl;external;
{$endif}

procedure poppler_ps_file_set_paper_size(ps_file:PPopplerPSFile; width:Tdouble; height:Tdouble);cdecl;external;
procedure poppler_ps_file_set_duplex(ps_file:PPopplerPSFile; duplex:Tgboolean);cdecl;external;
procedure poppler_ps_file_free(ps_file:PPopplerPSFile);cdecl;external;
(* Const before type ignored *)
procedure poppler_document_sign(document:PPopplerDocument; signing_data:PPopplerSigningData; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function poppler_document_sign_finish(document:PPopplerDocument; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{*
 * PopplerPageRange:
 * @start_page: first page in the range of pages
 * @end_page:   last page in the range of pages
 *
 * A #PopplerPageRange is used to specify a range of pages.
 *
 * Since: 0.80
  }
type
  PPopplerPageRange = ^TPopplerPageRange;
  TPopplerPageRange = record
      start_page : Tgint;
      end_page : Tgint;
    end;

{$endif}
{ __POPPLER_DOCUMENT_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_DOCUMENT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_DOCUMENT:=poppler_document_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_DOCUMENT(obj : longint) : longint;
begin
  POPPLER_DOCUMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_DOCUMENT,PopplerDocument);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_DOCUMENT(obj : longint) : longint;
begin
  POPPLER_IS_DOCUMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_DOCUMENT);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_INDEX_ITER : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_INDEX_ITER:=poppler_index_iter_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_FONT_INFO : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_FONT_INFO:=poppler_font_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_FONT_INFO(obj : longint) : longint;
begin
  POPPLER_FONT_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_FONT_INFO,PopplerFontInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_FONT_INFO(obj : longint) : longint;
begin
  POPPLER_IS_FONT_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_FONT_INFO);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_FONTS_ITER : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_FONTS_ITER:=poppler_fonts_iter_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_LAYERS_ITER : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_LAYERS_ITER:=poppler_layers_iter_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_PS_FILE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_PS_FILE:=poppler_ps_file_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_PS_FILE(obj : longint) : longint;
begin
  POPPLER_PS_FILE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_PS_FILE,PopplerPSFile);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_PS_FILE(obj : longint) : longint;
begin
  POPPLER_IS_PS_FILE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_PS_FILE);
end;


end.
