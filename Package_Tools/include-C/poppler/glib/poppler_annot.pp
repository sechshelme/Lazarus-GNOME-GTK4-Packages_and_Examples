
unit poppler_annot;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_annot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_annot.h
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
Pcairo_surface_t  = ^cairo_surface_t;
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGDate  = ^GDate;
PGError  = ^GError;
PPopplerAction  = ^PopplerAction;
PPopplerAnnot  = ^PopplerAnnot;
PPopplerAnnotCalloutLine  = ^PopplerAnnotCalloutLine;
PPopplerAnnotCircle  = ^PopplerAnnotCircle;
PPopplerAnnotExternalDataType  = ^PopplerAnnotExternalDataType;
PPopplerAnnotFileAttachment  = ^PopplerAnnotFileAttachment;
PPopplerAnnotFlag  = ^PopplerAnnotFlag;
PPopplerAnnotFreeText  = ^PopplerAnnotFreeText;
PPopplerAnnotFreeTextQuadding  = ^PopplerAnnotFreeTextQuadding;
PPopplerAnnotLine  = ^PopplerAnnotLine;
PPopplerAnnotMarkup  = ^PopplerAnnotMarkup;
PPopplerAnnotMarkupReplyType  = ^PopplerAnnotMarkupReplyType;
PPopplerAnnotMovie  = ^PopplerAnnotMovie;
PPopplerAnnotScreen  = ^PopplerAnnotScreen;
PPopplerAnnotSquare  = ^PopplerAnnotSquare;
PPopplerAnnotStamp  = ^PopplerAnnotStamp;
PPopplerAnnotStampIcon  = ^PopplerAnnotStampIcon;
PPopplerAnnotText  = ^PopplerAnnotText;
PPopplerAnnotTextMarkup  = ^PopplerAnnotTextMarkup;
PPopplerAnnotTextState  = ^PopplerAnnotTextState;
PPopplerAnnotType  = ^PopplerAnnotType;
PPopplerAttachment  = ^PopplerAttachment;
PPopplerColor  = ^PopplerColor;
PPopplerDocument  = ^PopplerDocument;
PPopplerMovie  = ^PopplerMovie;
PPopplerPoint  = ^PopplerPoint;
PPopplerRectangle  = ^PopplerRectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-annot.h: glib interface to poppler
 *
 * Copyright (C) 2007 Inigo Martinez <inigomartinez@gmail.com>
 * Copyright (C) 2009 Carlos Garcia Campos <carlosgc@gnome.org>
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
{$ifndef __POPPLER_ANNOT_H__}
{$define __POPPLER_ANNOT_H__}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_MARKUP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_MARKUP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_MARKUP(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_TEXT(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_TEXT_MARKUP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_TEXT_MARKUP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_TEXT_MARKUP(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_FREE_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_FREE_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_FREE_TEXT(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_FILE_ATTACHMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_FILE_ATTACHMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_FILE_ATTACHMENT(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_MOVIE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_MOVIE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_MOVIE(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_SCREEN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_SCREEN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_SCREEN(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_LINE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_LINE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_LINE(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_CALLOUT_LINE : longint; { return type might be wrong }

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_CIRCLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_CIRCLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_CIRCLE(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_SQUARE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_SQUARE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_SQUARE(obj : longint) : longint;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_STAMP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_STAMP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_STAMP(obj : longint) : longint;

type
  PPopplerAnnotType = ^TPopplerAnnotType;
  TPopplerAnnotType =  Longint;
  Const
    POPPLER_ANNOT_UNKNOWN = 0;
    POPPLER_ANNOT_TEXT = 1;
    POPPLER_ANNOT_LINK = 2;
    POPPLER_ANNOT_FREE_TEXT = 3;
    POPPLER_ANNOT_LINE = 4;
    POPPLER_ANNOT_SQUARE = 5;
    POPPLER_ANNOT_CIRCLE = 6;
    POPPLER_ANNOT_POLYGON = 7;
    POPPLER_ANNOT_POLY_LINE = 8;
    POPPLER_ANNOT_HIGHLIGHT = 9;
    POPPLER_ANNOT_UNDERLINE = 10;
    POPPLER_ANNOT_SQUIGGLY = 11;
    POPPLER_ANNOT_STRIKE_OUT = 12;
    POPPLER_ANNOT_STAMP = 13;
    POPPLER_ANNOT_CARET = 14;
    POPPLER_ANNOT_INK = 15;
    POPPLER_ANNOT_POPUP = 16;
    POPPLER_ANNOT_FILE_ATTACHMENT = 17;
    POPPLER_ANNOT_SOUND = 18;
    POPPLER_ANNOT_MOVIE = 19;
    POPPLER_ANNOT_WIDGET = 20;
    POPPLER_ANNOT_SCREEN = 21;
    POPPLER_ANNOT_PRINTER_MARK = 22;
    POPPLER_ANNOT_TRAP_NET = 23;
    POPPLER_ANNOT_WATERMARK = 24;
    POPPLER_ANNOT_3D = 25;
;
{< flags > }
type
  PPopplerAnnotFlag = ^TPopplerAnnotFlag;
  TPopplerAnnotFlag =  Longint;
  Const
    POPPLER_ANNOT_FLAG_UNKNOWN = 0;
    POPPLER_ANNOT_FLAG_INVISIBLE = 1 shl 0;
    POPPLER_ANNOT_FLAG_HIDDEN = 1 shl 1;
    POPPLER_ANNOT_FLAG_PRINT = 1 shl 2;
    POPPLER_ANNOT_FLAG_NO_ZOOM = 1 shl 3;
    POPPLER_ANNOT_FLAG_NO_ROTATE = 1 shl 4;
    POPPLER_ANNOT_FLAG_NO_VIEW = 1 shl 5;
    POPPLER_ANNOT_FLAG_READ_ONLY = 1 shl 6;
    POPPLER_ANNOT_FLAG_LOCKED = 1 shl 7;
    POPPLER_ANNOT_FLAG_TOGGLE_NO_VIEW = 1 shl 8;
    POPPLER_ANNOT_FLAG_LOCKED_CONTENTS = 1 shl 9;
;
type
  PPopplerAnnotMarkupReplyType = ^TPopplerAnnotMarkupReplyType;
  TPopplerAnnotMarkupReplyType =  Longint;
  Const
    POPPLER_ANNOT_MARKUP_REPLY_TYPE_R = 0;
    POPPLER_ANNOT_MARKUP_REPLY_TYPE_GROUP = 1;
;
type
  PPopplerAnnotExternalDataType = ^TPopplerAnnotExternalDataType;
  TPopplerAnnotExternalDataType =  Longint;
  Const
    POPPLER_ANNOT_EXTERNAL_DATA_MARKUP_3D = 0;
    POPPLER_ANNOT_EXTERNAL_DATA_MARKUP_UNKNOWN = 1;
;
  POPPLER_ANNOT_TEXT_ICON_NOTE = 'Note';  
  POPPLER_ANNOT_TEXT_ICON_COMMENT = 'Comment';  
  POPPLER_ANNOT_TEXT_ICON_KEY = 'Key';  
  POPPLER_ANNOT_TEXT_ICON_HELP = 'Help';  
  POPPLER_ANNOT_TEXT_ICON_NEW_PARAGRAPH = 'NewParagraph';  
  POPPLER_ANNOT_TEXT_ICON_PARAGRAPH = 'Paragraph';  
  POPPLER_ANNOT_TEXT_ICON_INSERT = 'Insert';  
  POPPLER_ANNOT_TEXT_ICON_CROSS = 'Cross';  
  POPPLER_ANNOT_TEXT_ICON_CIRCLE = 'Circle';  
type
  PPopplerAnnotTextState = ^TPopplerAnnotTextState;
  TPopplerAnnotTextState =  Longint;
  Const
    POPPLER_ANNOT_TEXT_STATE_MARKED = 0;
    POPPLER_ANNOT_TEXT_STATE_UNMARKED = 1;
    POPPLER_ANNOT_TEXT_STATE_ACCEPTED = 2;
    POPPLER_ANNOT_TEXT_STATE_REJECTED = 3;
    POPPLER_ANNOT_TEXT_STATE_CANCELLED = 4;
    POPPLER_ANNOT_TEXT_STATE_COMPLETED = 5;
    POPPLER_ANNOT_TEXT_STATE_NONE = 6;
    POPPLER_ANNOT_TEXT_STATE_UNKNOWN = 7;
;
type
  PPopplerAnnotFreeTextQuadding = ^TPopplerAnnotFreeTextQuadding;
  TPopplerAnnotFreeTextQuadding =  Longint;
  Const
    POPPLER_ANNOT_FREE_TEXT_QUADDING_LEFT_JUSTIFIED = 0;
    POPPLER_ANNOT_FREE_TEXT_QUADDING_CENTERED = 1;
    POPPLER_ANNOT_FREE_TEXT_QUADDING_RIGHT_JUSTIFIED = 2;
;
type
  PPopplerAnnotCalloutLine = ^TPopplerAnnotCalloutLine;
  TPopplerAnnotCalloutLine = record
      multiline : Tgboolean;
      x1 : Tgdouble;
      y1 : Tgdouble;
      x2 : Tgdouble;
      y2 : Tgdouble;
      x3 : Tgdouble;
      y3 : Tgdouble;
    end;


  PPopplerAnnotStampIcon = ^TPopplerAnnotStampIcon;
  TPopplerAnnotStampIcon =  Longint;
  Const
    POPPLER_ANNOT_STAMP_ICON_UNKNOWN = 0;
    POPPLER_ANNOT_STAMP_ICON_APPROVED = 1;
    POPPLER_ANNOT_STAMP_ICON_AS_IS = 2;
    POPPLER_ANNOT_STAMP_ICON_CONFIDENTIAL = 3;
    POPPLER_ANNOT_STAMP_ICON_FINAL = 4;
    POPPLER_ANNOT_STAMP_ICON_EXPERIMENTAL = 5;
    POPPLER_ANNOT_STAMP_ICON_EXPIRED = 6;
    POPPLER_ANNOT_STAMP_ICON_NOT_APPROVED = 7;
    POPPLER_ANNOT_STAMP_ICON_NOT_FOR_PUBLIC_RELEASE = 8;
    POPPLER_ANNOT_STAMP_ICON_SOLD = 9;
    POPPLER_ANNOT_STAMP_ICON_DEPARTMENTAL = 10;
    POPPLER_ANNOT_STAMP_ICON_FOR_COMMENT = 11;
    POPPLER_ANNOT_STAMP_ICON_FOR_PUBLIC_RELEASE = 12;
    POPPLER_ANNOT_STAMP_ICON_TOP_SECRET = 13;
    POPPLER_ANNOT_STAMP_ICON_NONE = 14;
;

function poppler_annot_get_type:TGType;cdecl;external;
function poppler_annot_get_annot_type(poppler_annot:PPopplerAnnot):TPopplerAnnotType;cdecl;external;
function poppler_annot_get_contents(poppler_annot:PPopplerAnnot):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_annot_set_contents(poppler_annot:PPopplerAnnot; contents:Pgchar);cdecl;external;
function poppler_annot_get_name(poppler_annot:PPopplerAnnot):Pgchar;cdecl;external;
function poppler_annot_get_modified(poppler_annot:PPopplerAnnot):Pgchar;cdecl;external;
function poppler_annot_get_flags(poppler_annot:PPopplerAnnot):TPopplerAnnotFlag;cdecl;external;
procedure poppler_annot_set_flags(poppler_annot:PPopplerAnnot; flags:TPopplerAnnotFlag);cdecl;external;
function poppler_annot_get_color(poppler_annot:PPopplerAnnot):PPopplerColor;cdecl;external;
procedure poppler_annot_set_color(poppler_annot:PPopplerAnnot; poppler_color:PPopplerColor);cdecl;external;
function poppler_annot_get_page_index(poppler_annot:PPopplerAnnot):Tgint;cdecl;external;
procedure poppler_annot_get_rectangle(poppler_annot:PPopplerAnnot; poppler_rect:PPopplerRectangle);cdecl;external;
procedure poppler_annot_set_rectangle(poppler_annot:PPopplerAnnot; poppler_rect:PPopplerRectangle);cdecl;external;
{ PopplerAnnotMarkup  }
function poppler_annot_markup_get_type:TGType;cdecl;external;
function poppler_annot_markup_get_label(poppler_annot:PPopplerAnnotMarkup):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_annot_markup_set_label(poppler_annot:PPopplerAnnotMarkup; _label:Pgchar);cdecl;external;
function poppler_annot_markup_has_popup(poppler_annot:PPopplerAnnotMarkup):Tgboolean;cdecl;external;
procedure poppler_annot_markup_set_popup(poppler_annot:PPopplerAnnotMarkup; popup_rect:PPopplerRectangle);cdecl;external;
function poppler_annot_markup_get_popup_is_open(poppler_annot:PPopplerAnnotMarkup):Tgboolean;cdecl;external;
procedure poppler_annot_markup_set_popup_is_open(poppler_annot:PPopplerAnnotMarkup; is_open:Tgboolean);cdecl;external;
function poppler_annot_markup_get_popup_rectangle(poppler_annot:PPopplerAnnotMarkup; poppler_rect:PPopplerRectangle):Tgboolean;cdecl;external;
procedure poppler_annot_markup_set_popup_rectangle(poppler_annot:PPopplerAnnotMarkup; poppler_rect:PPopplerRectangle);cdecl;external;
function poppler_annot_markup_get_opacity(poppler_annot:PPopplerAnnotMarkup):Tgdouble;cdecl;external;
procedure poppler_annot_markup_set_opacity(poppler_annot:PPopplerAnnotMarkup; opacity:Tgdouble);cdecl;external;
function poppler_annot_markup_get_date(poppler_annot:PPopplerAnnotMarkup):PGDate;cdecl;external;
function poppler_annot_markup_get_subject(poppler_annot:PPopplerAnnotMarkup):Pgchar;cdecl;external;
function poppler_annot_markup_get_reply_to(poppler_annot:PPopplerAnnotMarkup):TPopplerAnnotMarkupReplyType;cdecl;external;
function poppler_annot_markup_get_external_data(poppler_annot:PPopplerAnnotMarkup):TPopplerAnnotExternalDataType;cdecl;external;
{ PopplerAnnotText  }
function poppler_annot_text_get_type:TGType;cdecl;external;
function poppler_annot_text_new(doc:PPopplerDocument; rect:PPopplerRectangle):PPopplerAnnot;cdecl;external;
function poppler_annot_text_get_is_open(poppler_annot:PPopplerAnnotText):Tgboolean;cdecl;external;
procedure poppler_annot_text_set_is_open(poppler_annot:PPopplerAnnotText; is_open:Tgboolean);cdecl;external;
function poppler_annot_text_get_icon(poppler_annot:PPopplerAnnotText):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_annot_text_set_icon(poppler_annot:PPopplerAnnotText; icon:Pgchar);cdecl;external;
function poppler_annot_text_get_state(poppler_annot:PPopplerAnnotText):TPopplerAnnotTextState;cdecl;external;
{ PopplerAnnotTextMarkup  }
function poppler_annot_text_markup_get_type:TGType;cdecl;external;
function poppler_annot_text_markup_new_highlight(doc:PPopplerDocument; rect:PPopplerRectangle; quadrilaterals:PGArray):PPopplerAnnot;cdecl;external;
function poppler_annot_text_markup_new_squiggly(doc:PPopplerDocument; rect:PPopplerRectangle; quadrilaterals:PGArray):PPopplerAnnot;cdecl;external;
function poppler_annot_text_markup_new_strikeout(doc:PPopplerDocument; rect:PPopplerRectangle; quadrilaterals:PGArray):PPopplerAnnot;cdecl;external;
function poppler_annot_text_markup_new_underline(doc:PPopplerDocument; rect:PPopplerRectangle; quadrilaterals:PGArray):PPopplerAnnot;cdecl;external;
procedure poppler_annot_text_markup_set_quadrilaterals(poppler_annot:PPopplerAnnotTextMarkup; quadrilaterals:PGArray);cdecl;external;
function poppler_annot_text_markup_get_quadrilaterals(poppler_annot:PPopplerAnnotTextMarkup):PGArray;cdecl;external;
{ PopplerAnnotFreeText  }
function poppler_annot_free_text_get_type:TGType;cdecl;external;
function poppler_annot_free_text_get_quadding(poppler_annot:PPopplerAnnotFreeText):TPopplerAnnotFreeTextQuadding;cdecl;external;
function poppler_annot_free_text_get_callout_line(poppler_annot:PPopplerAnnotFreeText):PPopplerAnnotCalloutLine;cdecl;external;
{ PopplerAnnotFileAttachment  }
function poppler_annot_file_attachment_get_type:TGType;cdecl;external;
function poppler_annot_file_attachment_get_attachment(poppler_annot:PPopplerAnnotFileAttachment):PPopplerAttachment;cdecl;external;
function poppler_annot_file_attachment_get_name(poppler_annot:PPopplerAnnotFileAttachment):Pgchar;cdecl;external;
{ PopplerAnnotMovie  }
function poppler_annot_movie_get_type:TGType;cdecl;external;
function poppler_annot_movie_get_title(poppler_annot:PPopplerAnnotMovie):Pgchar;cdecl;external;
function poppler_annot_movie_get_movie(poppler_annot:PPopplerAnnotMovie):PPopplerMovie;cdecl;external;
{ PopplerAnnotScreen  }
function poppler_annot_screen_get_type:TGType;cdecl;external;
function poppler_annot_screen_get_action(poppler_annot:PPopplerAnnotScreen):PPopplerAction;cdecl;external;
{ PopplerAnnotLine  }
function poppler_annot_line_get_type:TGType;cdecl;external;
function poppler_annot_line_new(doc:PPopplerDocument; rect:PPopplerRectangle; start:PPopplerPoint; end:PPopplerPoint):PPopplerAnnot;cdecl;external;
procedure poppler_annot_line_set_vertices(poppler_annot:PPopplerAnnotLine; start:PPopplerPoint; end:PPopplerPoint);cdecl;external;
{ PopplerAnnotCalloutLine  }
function poppler_annot_callout_line_get_type:TGType;cdecl;external;
function poppler_annot_callout_line_new:PPopplerAnnotCalloutLine;cdecl;external;
function poppler_annot_callout_line_copy(callout:PPopplerAnnotCalloutLine):PPopplerAnnotCalloutLine;cdecl;external;
procedure poppler_annot_callout_line_free(callout:PPopplerAnnotCalloutLine);cdecl;external;
{ PopplerAnnotCircle  }
function poppler_annot_circle_get_type:TGType;cdecl;external;
function poppler_annot_circle_new(doc:PPopplerDocument; rect:PPopplerRectangle):PPopplerAnnot;cdecl;external;
procedure poppler_annot_circle_set_interior_color(poppler_annot:PPopplerAnnotCircle; poppler_color:PPopplerColor);cdecl;external;
function poppler_annot_circle_get_interior_color(poppler_annot:PPopplerAnnotCircle):PPopplerColor;cdecl;external;
{ PopplerAnnotGeometry  }
function poppler_annot_square_get_type:TGType;cdecl;external;
function poppler_annot_square_new(doc:PPopplerDocument; rect:PPopplerRectangle):PPopplerAnnot;cdecl;external;
procedure poppler_annot_square_set_interior_color(poppler_annot:PPopplerAnnotSquare; poppler_color:PPopplerColor);cdecl;external;
function poppler_annot_square_get_interior_color(poppler_annot:PPopplerAnnotSquare):PPopplerColor;cdecl;external;
{ PopplerAnnotStamp  }
function poppler_annot_stamp_get_type:TGType;cdecl;external;
function poppler_annot_stamp_new(doc:PPopplerDocument; rect:PPopplerRectangle):PPopplerAnnot;cdecl;external;
function poppler_annot_stamp_get_icon(poppler_annot:PPopplerAnnotStamp):TPopplerAnnotStampIcon;cdecl;external;
procedure poppler_annot_stamp_set_icon(poppler_annot:PPopplerAnnotStamp; icon:TPopplerAnnotStampIcon);cdecl;external;
function poppler_annot_stamp_set_custom_image(poppler_annot:PPopplerAnnotStamp; image:Pcairo_surface_t; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __POPPLER_ANNOT_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT:=poppler_annot_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT(obj : longint) : longint;
begin
  POPPLER_ANNOT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT,PopplerAnnot);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_MARKUP : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_MARKUP:=poppler_annot_markup_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_MARKUP(obj : longint) : longint;
begin
  POPPLER_ANNOT_MARKUP:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_MARKUP,PopplerAnnotMarkup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_MARKUP(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_MARKUP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_MARKUP);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_TEXT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_TEXT:=poppler_annot_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_TEXT(obj : longint) : longint;
begin
  POPPLER_ANNOT_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_TEXT,PopplerAnnotText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_TEXT(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_TEXT);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_TEXT_MARKUP : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_TEXT_MARKUP:=poppler_annot_text_markup_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_TEXT_MARKUP(obj : longint) : longint;
begin
  POPPLER_ANNOT_TEXT_MARKUP:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_TEXT_MARKUP,PopplerAnnotTextMarkup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_TEXT_MARKUP(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_TEXT_MARKUP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_TEXT_MARKUP);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_FREE_TEXT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_FREE_TEXT:=poppler_annot_free_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_FREE_TEXT(obj : longint) : longint;
begin
  POPPLER_ANNOT_FREE_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_FREE_TEXT,PopplerAnnotFreeText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_FREE_TEXT(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_FREE_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_FREE_TEXT);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_FILE_ATTACHMENT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_FILE_ATTACHMENT:=poppler_annot_file_attachment_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_FILE_ATTACHMENT(obj : longint) : longint;
begin
  POPPLER_ANNOT_FILE_ATTACHMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_MARKUP,PopplerAnnotFileAttachment);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_FILE_ATTACHMENT(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_FILE_ATTACHMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_FILE_ATTACHMENT);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_MOVIE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_MOVIE:=poppler_annot_movie_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_MOVIE(obj : longint) : longint;
begin
  POPPLER_ANNOT_MOVIE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_MOVIE,PopplerAnnotMovie);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_MOVIE(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_MOVIE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_MOVIE);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_SCREEN : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_SCREEN:=poppler_annot_screen_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_SCREEN(obj : longint) : longint;
begin
  POPPLER_ANNOT_SCREEN:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_SCREEN,PopplerAnnotScreen);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_SCREEN(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_SCREEN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_SCREEN);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_LINE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_LINE:=poppler_annot_line_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_LINE(obj : longint) : longint;
begin
  POPPLER_ANNOT_LINE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_LINE,PopplerAnnotLine);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_LINE(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_LINE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_LINE);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_CALLOUT_LINE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_CALLOUT_LINE:=poppler_annot_callout_line_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_CIRCLE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_CIRCLE:=poppler_annot_circle_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_CIRCLE(obj : longint) : longint;
begin
  POPPLER_ANNOT_CIRCLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_CIRCLE,PopplerAnnotCircle);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_CIRCLE(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_CIRCLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_CIRCLE);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_SQUARE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_SQUARE:=poppler_annot_square_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_SQUARE(obj : longint) : longint;
begin
  POPPLER_ANNOT_SQUARE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_SQUARE,PopplerAnnotSquare);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_SQUARE(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_SQUARE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_SQUARE);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_STAMP : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_STAMP:=poppler_annot_stamp_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ANNOT_STAMP(obj : longint) : longint;
begin
  POPPLER_ANNOT_STAMP:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ANNOT_STAMP,PopplerAnnotStamp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ANNOT_STAMP(obj : longint) : longint;
begin
  POPPLER_IS_ANNOT_STAMP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ANNOT_STAMP);
end;


end.
