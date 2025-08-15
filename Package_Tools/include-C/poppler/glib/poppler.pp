
unit poppler;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler.h
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
PPopplerAction  = ^PopplerAction;
PPopplerBackend  = ^PopplerBackend;
PPopplerError  = ^PopplerError;
PPopplerFindFlags  = ^PopplerFindFlags;
PPopplerPageTransitionAlignment  = ^PopplerPageTransitionAlignment;
PPopplerPageTransitionDirection  = ^PopplerPageTransitionDirection;
PPopplerPageTransitionType  = ^PopplerPageTransitionType;
PPopplerPrintFlags  = ^PopplerPrintFlags;
PPopplerSelectionStyle  = ^PopplerSelectionStyle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler.h: glib interface to poppler
 * Copyright (C) 2004, Red Hat, Inc.
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
{$ifndef __POPPLER_GLIB_H__}
{$define __POPPLER_GLIB_H__}
{$include <glib-object.h>}
{$include "poppler-macros.h"}

function poppler_error_quark:TGQuark;cdecl;external;
{ was #define dname def_expr }
function POPPLER_ERROR : longint; { return type might be wrong }

{*
 * PopplerError:
 * @POPPLER_ERROR_INVALID: Generic error when a document operation fails
 * @POPPLER_ERROR_ENCRYPTED: Document is encrypted
 * @POPPLER_ERROR_OPEN_FILE: File could not be opened for writing when saving document
 * @POPPLER_ERROR_BAD_CATALOG: Failed to read the document catalog
 * @POPPLER_ERROR_DAMAGED: Document is damaged
 *
 * Error codes returned by #PopplerDocument
  }
type
  PPopplerError = ^TPopplerError;
  TPopplerError =  Longint;
  Const
    POPPLER_ERROR_INVALID = 0;
    POPPLER_ERROR_ENCRYPTED = 1;
    POPPLER_ERROR_OPEN_FILE = 2;
    POPPLER_ERROR_BAD_CATALOG = 3;
    POPPLER_ERROR_DAMAGED = 4;
    POPPLER_ERROR_SIGNING = 5;
;
{*
 * PopplerPageTransitionType:
 * @POPPLER_PAGE_TRANSITION_REPLACE: the new page replace the old one
 * @POPPLER_PAGE_TRANSITION_SPLIT: two lines sweep across the screen, revealing the new page
 * @POPPLER_PAGE_TRANSITION_BLINDS: multiple lines, evenly spaced across the screen, synchronously
 * sweep in the same direction to reveal the new page
 * @POPPLER_PAGE_TRANSITION_BOX: a rectangular box sweeps inward from the edges of the page or
 * outward from the center revealing the new page
 * @POPPLER_PAGE_TRANSITION_WIPE: a single line sweeps across the screen from one edge to the other
 * revealing the new page
 * @POPPLER_PAGE_TRANSITION_DISSOLVE: the old page dissolves gradually to reveal the new one
 * @POPPLER_PAGE_TRANSITION_GLITTER: similar to #POPPLER_PAGE_TRANSITION_DISSOLVE, except that the effect
 * sweeps across the page in a wide band moving from one side of the screen to the other
 * @POPPLER_PAGE_TRANSITION_FLY: changes are flown out or in to or from a location that is offscreen
 * @POPPLER_PAGE_TRANSITION_PUSH: the old page slides off the screen while the new page slides in
 * @POPPLER_PAGE_TRANSITION_COVER: the new page slides on to the screen covering the old page
 * @POPPLER_PAGE_TRANSITION_UNCOVER: the old page slides off the screen uncovering the new page
 * @POPPLER_PAGE_TRANSITION_FADE: the new page gradually becomes visible through the old one
 *
 * Page transition types
  }
type
  PPopplerPageTransitionType = ^TPopplerPageTransitionType;
  TPopplerPageTransitionType =  Longint;
  Const
    POPPLER_PAGE_TRANSITION_REPLACE = 0;
    POPPLER_PAGE_TRANSITION_SPLIT = 1;
    POPPLER_PAGE_TRANSITION_BLINDS = 2;
    POPPLER_PAGE_TRANSITION_BOX = 3;
    POPPLER_PAGE_TRANSITION_WIPE = 4;
    POPPLER_PAGE_TRANSITION_DISSOLVE = 5;
    POPPLER_PAGE_TRANSITION_GLITTER = 6;
    POPPLER_PAGE_TRANSITION_FLY = 7;
    POPPLER_PAGE_TRANSITION_PUSH = 8;
    POPPLER_PAGE_TRANSITION_COVER = 9;
    POPPLER_PAGE_TRANSITION_UNCOVER = 10;
    POPPLER_PAGE_TRANSITION_FADE = 11;
;
{*
 * PopplerPageTransitionAlignment:
 * @POPPLER_PAGE_TRANSITION_HORIZONTAL: horizontal dimension
 * @POPPLER_PAGE_TRANSITION_VERTICAL: vertical dimension
 *
 * Page transition alignment types for #POPPLER_PAGE_TRANSITION_SPLIT
 * and #POPPLER_PAGE_TRANSITION_BLINDS transition types
  }
type
  PPopplerPageTransitionAlignment = ^TPopplerPageTransitionAlignment;
  TPopplerPageTransitionAlignment =  Longint;
  Const
    POPPLER_PAGE_TRANSITION_HORIZONTAL = 0;
    POPPLER_PAGE_TRANSITION_VERTICAL = 1;
;
{*
 * PopplerPageTransitionDirection:
 * @POPPLER_PAGE_TRANSITION_INWARD: inward from the edges of the page
 * @POPPLER_PAGE_TRANSITION_OUTWARD: outward from the center of the page
 *
 * Page transition direction types for #POPPLER_PAGE_TRANSITION_SPLIT,
 * #POPPLER_PAGE_TRANSITION_BOX and #POPPLER_PAGE_TRANSITION_FLY transition types
  }
type
  PPopplerPageTransitionDirection = ^TPopplerPageTransitionDirection;
  TPopplerPageTransitionDirection =  Longint;
  Const
    POPPLER_PAGE_TRANSITION_INWARD = 0;
    POPPLER_PAGE_TRANSITION_OUTWARD = 1;
;
{*
 * PopplerSelectionStyle:
 * @POPPLER_SELECTION_GLYPH: glyph is the minimum unit for selection
 * @POPPLER_SELECTION_WORD: word is the minimum unit for selection
 * @POPPLER_SELECTION_LINE: line is the minimum unit for selection
 *
 * Selection styles
  }
type
  PPopplerSelectionStyle = ^TPopplerSelectionStyle;
  TPopplerSelectionStyle =  Longint;
  Const
    POPPLER_SELECTION_GLYPH = 0;
    POPPLER_SELECTION_WORD = 1;
    POPPLER_SELECTION_LINE = 2;
;
{*
 * PopplerPrintFlags:
 * @POPPLER_PRINT_DOCUMENT: print main document contents
 * @POPPLER_PRINT_MARKUP_ANNOTS: print document and markup annotations
 * @POPPLER_PRINT_STAMP_ANNOTS_ONLY: print document and only stamp annotations
 * @POPPLER_PRINT_ALL: print main document contents and all markup annotations
 *
 * Printing flags
 *
 * Since: 0.16
  }
{< flags > }
type
  PPopplerPrintFlags = ^TPopplerPrintFlags;
  TPopplerPrintFlags =  Longint;
  Const
    POPPLER_PRINT_DOCUMENT = 0;
    POPPLER_PRINT_MARKUP_ANNOTS = 1 shl 0;
    POPPLER_PRINT_STAMP_ANNOTS_ONLY = 1 shl 1;
    POPPLER_PRINT_ALL = POPPLER_PRINT_MARKUP_ANNOTS;
;
{*
 * PopplerFindFlags:
 * @POPPLER_FIND_DEFAULT: use default search settings
 * @POPPLER_FIND_CASE_SENSITIVE: do case sensitive search
 * @POPPLER_FIND_BACKWARDS: search backwards
 * @POPPLER_FIND_WHOLE_WORDS_ONLY: search only whole words
 * @POPPLER_FIND_IGNORE_DIACRITICS: do diacritics insensitive search,
 * i.e. ignore accents, umlauts, diaeresis,etc. while matching. This
 * option will be ignored if the search term is not pure ascii. Since 0.73.
 * @POPPLER_FIND_MULTILINE: allows to match on text spanning from
 * end of a line to the next line. (Currently it won't match on text spanning
 * more than two lines.) Automatically ignores hyphen at end of line, and
 * allows whitespace in search term to match on newline char. Since: 21.05.0.
 *
 * Flags using while searching text in a page
 *
 * Since: 0.22
  }
{< flags > }
type
  PPopplerFindFlags = ^TPopplerFindFlags;
  TPopplerFindFlags =  Longint;
  Const
    POPPLER_FIND_DEFAULT = 0;
    POPPLER_FIND_CASE_SENSITIVE = 1 shl 0;
    POPPLER_FIND_BACKWARDS = 1 shl 1;
    POPPLER_FIND_WHOLE_WORDS_ONLY = 1 shl 2;
    POPPLER_FIND_IGNORE_DIACRITICS = 1 shl 3;
    POPPLER_FIND_MULTILINE = 1 shl 4;
;
type

  PPopplerAction = ^TPopplerAction;
  TPopplerAction = TPopplerAction;
{*
 * PopplerBackend:
 * @POPPLER_BACKEND_UNKNOWN: Unknown backend
 * @POPPLER_BACKEND_SPLASH: Splash backend
 * @POPPLER_BACKEND_CAIRO: Cairo backend
 *
 * Backend codes returned by poppler_get_backend().
  }

  PPopplerBackend = ^TPopplerBackend;
  TPopplerBackend =  Longint;
  Const
    POPPLER_BACKEND_UNKNOWN = 0;
    POPPLER_BACKEND_SPLASH = 1;
    POPPLER_BACKEND_CAIRO = 2;
;

function poppler_get_backend:TPopplerBackend;cdecl;external;
(* Const before type ignored *)
function poppler_get_version:Pchar;cdecl;external;
{$include "poppler-features.h"}
{$include "poppler-document.h"}
{$include "poppler-page.h"}
{$include "poppler-layer.h"}
{$include "poppler-action.h"}
{$include "poppler-form-field.h"}
{$include "poppler-enums.h"}
{$include "poppler-attachment.h"}
{$include "poppler-annot.h"}
{$include "poppler-date.h"}
{$include "poppler-movie.h"}
{$include "poppler-media.h"}
{$include "poppler-structure-element.h"}
{$endif}
{ __POPPLER_GLIB_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_ERROR : longint; { return type might be wrong }
  begin
    POPPLER_ERROR:=poppler_error_quark;
  end;


end.
