
unit poppler_page;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_page.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_page.h
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
Pcairo_region_t  = ^cairo_region_t;
Pcairo_surface_t  = ^cairo_surface_t;
Pcairo_t  = ^cairo_t;
Pchar  = ^char;
Pdouble  = ^double;
Pgchar  = ^gchar;
PGList  = ^GList;
Pguint  = ^guint;
Plongint  = ^longint;
PPopplerAction  = ^PopplerAction;
PPopplerAnnot  = ^PopplerAnnot;
PPopplerAnnotMapping  = ^PopplerAnnotMapping;
PPopplerColor  = ^PopplerColor;
PPopplerFormField  = ^PopplerFormField;
PPopplerFormFieldMapping  = ^PopplerFormFieldMapping;
PPopplerImageMapping  = ^PopplerImageMapping;
PPopplerLinkMapping  = ^PopplerLinkMapping;
PPopplerPage  = ^PopplerPage;
PPopplerPageTransition  = ^PopplerPageTransition;
PPopplerPoint  = ^PopplerPoint;
PPopplerPSFile  = ^PopplerPSFile;
PPopplerQuadrilateral  = ^PopplerQuadrilateral;
PPopplerRectangle  = ^PopplerRectangle;
PPopplerTextAttributes  = ^PopplerTextAttributes;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-page.h: glib interface to poppler
 * Copyright (C) 2004, Red Hat, Inc.
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
{$ifndef __POPPLER_PAGE_H__}
{$define __POPPLER_PAGE_H__}
{$include <glib-object.h>}
{$include "poppler.h"}
{$include <cairo.h>}

{ was #define dname def_expr }
function POPPLER_TYPE_PAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_PAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_PAGE(obj : longint) : longint;

function poppler_page_get_type:TGType;cdecl;external;
procedure poppler_page_render(page:PPopplerPage; cairo:Pcairo_t);cdecl;external;
procedure poppler_page_render_for_printing(page:PPopplerPage; cairo:Pcairo_t);cdecl;external;
procedure poppler_page_render_for_printing_with_options(page:PPopplerPage; cairo:Pcairo_t; options:TPopplerPrintFlags);cdecl;external;
function poppler_page_get_thumbnail(page:PPopplerPage):Pcairo_surface_t;cdecl;external;
procedure poppler_page_render_selection(page:PPopplerPage; cairo:Pcairo_t; selection:PPopplerRectangle; old_selection:PPopplerRectangle; style:TPopplerSelectionStyle; 
            glyph_color:PPopplerColor; background_color:PPopplerColor);cdecl;external;
procedure poppler_page_get_size(page:PPopplerPage; width:Pdouble; height:Pdouble);cdecl;external;
function poppler_page_get_index(page:PPopplerPage):longint;cdecl;external;
function poppler_page_get_label(page:PPopplerPage):Pgchar;cdecl;external;
function poppler_page_get_duration(page:PPopplerPage):Tdouble;cdecl;external;
function poppler_page_get_transition(page:PPopplerPage):PPopplerPageTransition;cdecl;external;
function poppler_page_get_thumbnail_size(page:PPopplerPage; width:Plongint; height:Plongint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function poppler_page_find_text_with_options(page:PPopplerPage; text:Pchar; options:TPopplerFindFlags):PGList;cdecl;external;
(* Const before type ignored *)
function poppler_page_find_text(page:PPopplerPage; text:Pchar):PGList;cdecl;external;
procedure poppler_page_render_to_ps(page:PPopplerPage; ps_file:PPopplerPSFile);cdecl;external;
function poppler_page_get_text(page:PPopplerPage):Pchar;cdecl;external;
function poppler_page_get_text_for_area(page:PPopplerPage; area:PPopplerRectangle):Pchar;cdecl;external;
function poppler_page_get_selected_text(page:PPopplerPage; style:TPopplerSelectionStyle; selection:PPopplerRectangle):Pchar;cdecl;external;
function poppler_page_get_selected_region(page:PPopplerPage; scale:Tgdouble; style:TPopplerSelectionStyle; selection:PPopplerRectangle):Pcairo_region_t;cdecl;external;
function poppler_page_get_selection_region(page:PPopplerPage; scale:Tgdouble; style:TPopplerSelectionStyle; selection:PPopplerRectangle):PGList;cdecl;external;
{G_GNUC_DEPRECATED_FOR(poppler_page_get_selected_region); }
procedure poppler_page_selection_region_free(region:PGList);cdecl;external;
{G_GNUC_DEPRECATED_FOR(cairo_region_destroy); }
function poppler_page_get_link_mapping(page:PPopplerPage):PGList;cdecl;external;
procedure poppler_page_free_link_mapping(list:PGList);cdecl;external;
function poppler_page_get_image_mapping(page:PPopplerPage):PGList;cdecl;external;
procedure poppler_page_free_image_mapping(list:PGList);cdecl;external;
function poppler_page_get_image(page:PPopplerPage; image_id:Tgint):Pcairo_surface_t;cdecl;external;
function poppler_page_get_form_field_mapping(page:PPopplerPage):PGList;cdecl;external;
procedure poppler_page_free_form_field_mapping(list:PGList);cdecl;external;
function poppler_page_get_annot_mapping(page:PPopplerPage):PGList;cdecl;external;
procedure poppler_page_free_annot_mapping(list:PGList);cdecl;external;
procedure poppler_page_add_annot(page:PPopplerPage; annot:PPopplerAnnot);cdecl;external;
procedure poppler_page_remove_annot(page:PPopplerPage; annot:PPopplerAnnot);cdecl;external;
procedure poppler_page_get_crop_box(page:PPopplerPage; rect:PPopplerRectangle);cdecl;external;
function poppler_page_get_bounding_box(page:PPopplerPage; rect:PPopplerRectangle):Tgboolean;cdecl;external;
function poppler_page_get_text_layout(page:PPopplerPage; rectangles:PPPopplerRectangle; n_rectangles:Pguint):Tgboolean;cdecl;external;
function poppler_page_get_text_layout_for_area(page:PPopplerPage; area:PPopplerRectangle; rectangles:PPPopplerRectangle; n_rectangles:Pguint):Tgboolean;cdecl;external;
function poppler_page_get_text_attributes(page:PPopplerPage):PGList;cdecl;external;
procedure poppler_page_free_text_attributes(list:PGList);cdecl;external;
function poppler_page_get_text_attributes_for_area(page:PPopplerPage; area:PPopplerRectangle):PGList;cdecl;external;
{ A rectangle on a page, with coordinates in PDF points.  }
{ was #define dname def_expr }
function POPPLER_TYPE_RECTANGLE : longint; { return type might be wrong }

{*
 * PopplerRectangle:
 * @x1: x coordinate of lower left corner
 * @y1: y coordinate of lower left corner
 * @x2: x coordinate of upper right corner
 * @y2: y coordinate of upper right corner
 *
 * A #PopplerRectangle is used to describe
 * locations on a page and bounding boxes
  }
type
  PPopplerRectangle = ^TPopplerRectangle;
  TPopplerRectangle = record
      x1 : Tgdouble;
      y1 : Tgdouble;
      x2 : Tgdouble;
      y2 : Tgdouble;
    end;


function poppler_rectangle_get_type:TGType;cdecl;external;
function poppler_rectangle_new:PPopplerRectangle;cdecl;external;
function poppler_rectangle_copy(rectangle:PPopplerRectangle):PPopplerRectangle;cdecl;external;
procedure poppler_rectangle_free(rectangle:PPopplerRectangle);cdecl;external;
(* Const before type ignored *)
function poppler_rectangle_find_get_match_continued(rectangle:PPopplerRectangle):Tgboolean;cdecl;external;
(* Const before type ignored *)
function poppler_rectangle_find_get_ignored_hyphen(rectangle:PPopplerRectangle):Tgboolean;cdecl;external;
{ A point on a page, with coordinates in PDF points.  }
{ was #define dname def_expr }
function POPPLER_TYPE_POINT : longint; { return type might be wrong }

{*
 * PopplerPoint:
 * @x: x coordinate
 * @y: y coordinate
 *
 * A #PopplerPoint is used to describe a location point on a page
  }
type
  PPopplerPoint = ^TPopplerPoint;
  TPopplerPoint = record
      x : Tgdouble;
      y : Tgdouble;
    end;


function poppler_point_get_type:TGType;cdecl;external;
function poppler_point_new:PPopplerPoint;cdecl;external;
function poppler_point_copy(point:PPopplerPoint):PPopplerPoint;cdecl;external;
procedure poppler_point_free(point:PPopplerPoint);cdecl;external;
{ PopplerQuadrilateral  }
{ A quadrilateral encompasses a word or group of contiguous words in the
 * text underlying the annotation. The coordinates for each quadrilateral are
 * given in the order x1 y1 x2 y2 x3 y3 x4 y4 specifying the quadrilateral’s four
 *  vertices in counterclockwise order  }
{ was #define dname def_expr }
function POPPLER_TYPE_QUADRILATERAL : longint; { return type might be wrong }

{*
 *  PopplerQuadrilateral:
 *  @p1: a #PopplerPoint with the first vertex coordinates
 *  @p2: a #PopplerPoint with the second vertex coordinates
 *  @p3: a #PopplerPoint with the third vertex coordinates
 *  @p4: a #PopplerPoint with the fourth vertex coordinates
 *
 *  A #PopplerQuadrilateral is used to describe rectangle-like polygon
 *  with arbitrary inclination on a page.
 *
 *  Since: 0.26
 * }
type
  PPopplerQuadrilateral = ^TPopplerQuadrilateral;
  TPopplerQuadrilateral = record
      p1 : TPopplerPoint;
      p2 : TPopplerPoint;
      p3 : TPopplerPoint;
      p4 : TPopplerPoint;
    end;


function poppler_quadrilateral_get_type:TGType;cdecl;external;
function poppler_quadrilateral_new:PPopplerQuadrilateral;cdecl;external;
function poppler_quadrilateral_copy(quad:PPopplerQuadrilateral):PPopplerQuadrilateral;cdecl;external;
procedure poppler_quadrilateral_free(quad:PPopplerQuadrilateral);cdecl;external;
{ A color in RGB  }
{ was #define dname def_expr }
function POPPLER_TYPE_COLOR : longint; { return type might be wrong }

{*
 * PopplerColor:
 * @red: the red component of color
 * @green: the green component of color
 * @blue: the blue component of color
 *
 * A #PopplerColor describes a RGB color. Color components
 * are values between 0 and 65535
  }
type
  PPopplerColor = ^TPopplerColor;
  TPopplerColor = record
      red : Tguint16;
      green : Tguint16;
      blue : Tguint16;
    end;


function poppler_color_get_type:TGType;cdecl;external;
function poppler_color_new:PPopplerColor;cdecl;external;
function poppler_color_copy(color:PPopplerColor):PPopplerColor;cdecl;external;
procedure poppler_color_free(color:PPopplerColor);cdecl;external;
{ Text attributes.  }
{ was #define dname def_expr }
function POPPLER_TYPE_TEXT_ATTRIBUTES : longint; { return type might be wrong }

{*
 * PopplerTextAttributes:
 * @font_name: font name
 * @font_size: font size
 * @is_underlined: if text is underlined
 * @color: a #PopplerColor, the foreground color
 * @start_index: start position this text attributes apply
 * @end_index: end position this text attributes apply
 *
 * A #PopplerTextAttributes is used to describe text attributes of a range of text
 *
 * Since: 0.18
  }
type
  PPopplerTextAttributes = ^TPopplerTextAttributes;
  TPopplerTextAttributes = record
      font_name : Pgchar;
      font_size : Tgdouble;
      is_underlined : Tgboolean;
      color : TPopplerColor;
      start_index : Tgint;
      end_index : Tgint;
    end;


function poppler_text_attributes_get_type:TGType;cdecl;external;
function poppler_text_attributes_new:PPopplerTextAttributes;cdecl;external;
function poppler_text_attributes_copy(text_attrs:PPopplerTextAttributes):PPopplerTextAttributes;cdecl;external;
procedure poppler_text_attributes_free(text_attrs:PPopplerTextAttributes);cdecl;external;
{ Mapping between areas on the current page and PopplerActions  }
{ was #define dname def_expr }
function POPPLER_TYPE_LINK_MAPPING : longint; { return type might be wrong }

{*
 * PopplerLinkMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @action: a #PopplerAction
 *
 * A #PopplerLinkMapping structure represents the location
 * of @action on the page
  }
type
  PPopplerLinkMapping = ^TPopplerLinkMapping;
  TPopplerLinkMapping = record
      area : TPopplerRectangle;
      action : PPopplerAction;
    end;


function poppler_link_mapping_get_type:TGType;cdecl;external;
function poppler_link_mapping_new:PPopplerLinkMapping;cdecl;external;
function poppler_link_mapping_copy(mapping:PPopplerLinkMapping):PPopplerLinkMapping;cdecl;external;
procedure poppler_link_mapping_free(mapping:PPopplerLinkMapping);cdecl;external;
{ Page Transition  }
{ was #define dname def_expr }
function POPPLER_TYPE_PAGE_TRANSITION : longint; { return type might be wrong }

{*
 * PopplerPageTransition:
 * @type: the type of transtition
 * @alignment: the dimension in which the transition effect shall occur.
 * Only for #POPPLER_PAGE_TRANSITION_SPLIT and #POPPLER_PAGE_TRANSITION_BLINDS transition types
 * @direction: the direction of motion for the transition effect.
 * Only for #POPPLER_PAGE_TRANSITION_SPLIT, #POPPLER_PAGE_TRANSITION_BOX and #POPPLER_PAGE_TRANSITION_FLY
 * transition types
 * @duration: the duration of the transition effect
 * @angle: the direction in which the specified transition effect shall moves,
 * expressed in degrees counterclockwise starting from a left-to-right direction.
 * Only for #POPPLER_PAGE_TRANSITION_WIPE, #POPPLER_PAGE_TRANSITION_GLITTER, #POPPLER_PAGE_TRANSITION_FLY,
 * #POPPLER_PAGE_TRANSITION_COVER, #POPPLER_PAGE_TRANSITION_UNCOVER and #POPPLER_PAGE_TRANSITION_PUSH
 * transition types
 * @scale: the starting or ending scale at which the changes shall be drawn.
 * Only for #POPPLER_PAGE_TRANSITION_FLY transition type
 * @rectangular: whether the area that will be flown is rectangular and opaque.
 * Only for #POPPLER_PAGE_TRANSITION_FLY transition type
 *
 * A #PopplerPageTransition structures describes a visual transition
 * to use when moving between pages during a presentation
  }
type
  PPopplerPageTransition = ^TPopplerPageTransition;
  TPopplerPageTransition = record
      _type : TPopplerPageTransitionType;
      alignment : TPopplerPageTransitionAlignment;
      direction : TPopplerPageTransitionDirection;
      duration : Tgint;
      angle : Tgint;
      scale : Tgdouble;
      rectangular : Tgboolean;
      duration_real : Tgdouble;
    end;


function poppler_page_transition_get_type:TGType;cdecl;external;
function poppler_page_transition_new:PPopplerPageTransition;cdecl;external;
function poppler_page_transition_copy(transition:PPopplerPageTransition):PPopplerPageTransition;cdecl;external;
procedure poppler_page_transition_free(transition:PPopplerPageTransition);cdecl;external;
{ Mapping between areas on the current page and images  }
{ was #define dname def_expr }
function POPPLER_TYPE_IMAGE_MAPPING : longint; { return type might be wrong }

{*
 * PopplerImageMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @image_id: an image identifier
 *
 * A #PopplerImageMapping structure represents the location
 * of an image on the page
  }
type
  PPopplerImageMapping = ^TPopplerImageMapping;
  TPopplerImageMapping = record
      area : TPopplerRectangle;
      image_id : Tgint;
    end;


function poppler_image_mapping_get_type:TGType;cdecl;external;
function poppler_image_mapping_new:PPopplerImageMapping;cdecl;external;
function poppler_image_mapping_copy(mapping:PPopplerImageMapping):PPopplerImageMapping;cdecl;external;
procedure poppler_image_mapping_free(mapping:PPopplerImageMapping);cdecl;external;
{ Mapping between areas on the current page and form fields  }
{ was #define dname def_expr }
function POPPLER_TYPE_FORM_FIELD_MAPPING : longint; { return type might be wrong }

{*
 * PopplerFormFieldMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @field: a #PopplerFormField
 *
 * A #PopplerFormFieldMapping structure represents the location
 * of @field on the page
  }
type
  PPopplerFormFieldMapping = ^TPopplerFormFieldMapping;
  TPopplerFormFieldMapping = record
      area : TPopplerRectangle;
      field : PPopplerFormField;
    end;


function poppler_form_field_mapping_get_type:TGType;cdecl;external;
function poppler_form_field_mapping_new:PPopplerFormFieldMapping;cdecl;external;
function poppler_form_field_mapping_copy(mapping:PPopplerFormFieldMapping):PPopplerFormFieldMapping;cdecl;external;
procedure poppler_form_field_mapping_free(mapping:PPopplerFormFieldMapping);cdecl;external;
{ Mapping between areas on the current page and annots  }
{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_MAPPING : longint; { return type might be wrong }

{*
 * PopplerAnnotMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @annot: a #PopplerAnnot
 *
 * A #PopplerAnnotMapping structure represents the location
 * of @annot on the page
  }
type
  PPopplerAnnotMapping = ^TPopplerAnnotMapping;
  TPopplerAnnotMapping = record
      area : TPopplerRectangle;
      annot : PPopplerAnnot;
    end;


function poppler_annot_mapping_get_type:TGType;cdecl;external;
function poppler_annot_mapping_new:PPopplerAnnotMapping;cdecl;external;
function poppler_annot_mapping_copy(mapping:PPopplerAnnotMapping):PPopplerAnnotMapping;cdecl;external;
procedure poppler_annot_mapping_free(mapping:PPopplerAnnotMapping);cdecl;external;
{$endif}
{ __POPPLER_PAGE_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_PAGE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_PAGE:=poppler_page_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_PAGE(obj : longint) : longint;
begin
  POPPLER_PAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_PAGE,PopplerPage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_PAGE(obj : longint) : longint;
begin
  POPPLER_IS_PAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_PAGE);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_RECTANGLE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_RECTANGLE:=poppler_rectangle_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_POINT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_POINT:=poppler_point_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_QUADRILATERAL : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_QUADRILATERAL:=poppler_quadrilateral_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_COLOR : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_COLOR:=poppler_color_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_TEXT_ATTRIBUTES : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_TEXT_ATTRIBUTES:=poppler_text_attributes_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_LINK_MAPPING : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_LINK_MAPPING:=poppler_link_mapping_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_PAGE_TRANSITION : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_PAGE_TRANSITION:=poppler_page_transition_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_IMAGE_MAPPING : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_IMAGE_MAPPING:=poppler_image_mapping_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_FORM_FIELD_MAPPING : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_FORM_FIELD_MAPPING:=poppler_form_field_mapping_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_ANNOT_MAPPING : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ANNOT_MAPPING:=poppler_annot_mapping_get_type;
  end;


end.
