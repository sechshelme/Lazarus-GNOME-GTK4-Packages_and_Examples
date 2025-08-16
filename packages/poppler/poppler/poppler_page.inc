{$IFDEF read_interface}

type
  TPopplerRectangle = record
    x1: Tgdouble;
    y1: Tgdouble;
    x2: Tgdouble;
    y2: Tgdouble;
  end;
  PPopplerRectangle = ^TPopplerRectangle;
  PPPopplerRectangle = ^PPopplerRectangle;

type
  TPopplerColor = record
    red: Tguint16;
    green: Tguint16;
    blue: Tguint16;
  end;
  PPopplerColor = ^TPopplerColor;

type
  TPopplerPageTransition = record
    _type: TPopplerPageTransitionType;
    alignment: TPopplerPageTransitionAlignment;
    direction: TPopplerPageTransitionDirection;
    duration: Tgint;
    angle: Tgint;
    scale: Tgdouble;
    rectangular: Tgboolean;
    duration_real: Tgdouble;
  end;
  PPopplerPageTransition = ^TPopplerPageTransition;

function poppler_page_get_type: TGType; cdecl; external libpoppler_glib;
procedure poppler_page_render(page: PPopplerPage; cairo: Pcairo_t); cdecl; external libpoppler_glib;
procedure poppler_page_render_for_printing(page: PPopplerPage; cairo: Pcairo_t); cdecl; external libpoppler_glib;
procedure poppler_page_render_for_printing_with_options(page: PPopplerPage; cairo: Pcairo_t; options: TPopplerPrintFlags); cdecl; external libpoppler_glib;
function poppler_page_get_thumbnail(page: PPopplerPage): Pcairo_surface_t; cdecl; external libpoppler_glib;
procedure poppler_page_render_selection(page: PPopplerPage; cairo: Pcairo_t; selection: PPopplerRectangle; old_selection: PPopplerRectangle; style: TPopplerSelectionStyle;
  glyph_color: PPopplerColor; background_color: PPopplerColor); cdecl; external libpoppler_glib;
procedure poppler_page_get_size(page: PPopplerPage; width: Pdouble; height: Pdouble); cdecl; external libpoppler_glib;
function poppler_page_get_index(page: PPopplerPage): longint; cdecl; external libpoppler_glib;
function poppler_page_get_label(page: PPopplerPage): Pgchar; cdecl; external libpoppler_glib;
function poppler_page_get_duration(page: PPopplerPage): Tdouble; cdecl; external libpoppler_glib;
function poppler_page_get_transition(page: PPopplerPage): PPopplerPageTransition; cdecl; external libpoppler_glib;
function poppler_page_get_thumbnail_size(page: PPopplerPage; width: Plongint; height: Plongint): Tgboolean; cdecl; external libpoppler_glib;
function poppler_page_find_text_with_options(page: PPopplerPage; text: pchar; options: TPopplerFindFlags): PGList; cdecl; external libpoppler_glib;
function poppler_page_find_text(page: PPopplerPage; text: pchar): PGList; cdecl; external libpoppler_glib;
procedure poppler_page_render_to_ps(page: PPopplerPage; ps_file: PPopplerPSFile); cdecl; external libpoppler_glib;
function poppler_page_get_text(page: PPopplerPage): pchar; cdecl; external libpoppler_glib;
function poppler_page_get_text_for_area(page: PPopplerPage; area: PPopplerRectangle): pchar; cdecl; external libpoppler_glib;
function poppler_page_get_selected_text(page: PPopplerPage; style: TPopplerSelectionStyle; selection: PPopplerRectangle): pchar; cdecl; external libpoppler_glib;
function poppler_page_get_selected_region(page: PPopplerPage; scale: Tgdouble; style: TPopplerSelectionStyle; selection: PPopplerRectangle): Pcairo_region_t; cdecl; external libpoppler_glib;
function poppler_page_get_selection_region(page: PPopplerPage; scale: Tgdouble; style: TPopplerSelectionStyle; selection: PPopplerRectangle): PGList; cdecl; external libpoppler_glib; deprecated 'G_GNUC_DEPRECATED_FOR(poppler_page_get_selected_region)';
procedure poppler_page_selection_region_free(region: PGList); cdecl; external libpoppler_glib; deprecated 'G_GNUC_DEPRECATED_FOR(cairo_region_destroy)';
function poppler_page_get_link_mapping(page: PPopplerPage): PGList; cdecl; external libpoppler_glib;
procedure poppler_page_free_link_mapping(list: PGList); cdecl; external libpoppler_glib;
function poppler_page_get_image_mapping(page: PPopplerPage): PGList; cdecl; external libpoppler_glib;
procedure poppler_page_free_image_mapping(list: PGList); cdecl; external libpoppler_glib;
function poppler_page_get_image(page: PPopplerPage; image_id: Tgint): Pcairo_surface_t; cdecl; external libpoppler_glib;
function poppler_page_get_form_field_mapping(page: PPopplerPage): PGList; cdecl; external libpoppler_glib;
procedure poppler_page_free_form_field_mapping(list: PGList); cdecl; external libpoppler_glib;
function poppler_page_get_annot_mapping(page: PPopplerPage): PGList; cdecl; external libpoppler_glib;
procedure poppler_page_free_annot_mapping(list: PGList); cdecl; external libpoppler_glib;
procedure poppler_page_add_annot(page: PPopplerPage; annot: PPopplerAnnot); cdecl; external libpoppler_glib;
procedure poppler_page_remove_annot(page: PPopplerPage; annot: PPopplerAnnot); cdecl; external libpoppler_glib;
procedure poppler_page_get_crop_box(page: PPopplerPage; rect: PPopplerRectangle); cdecl; external libpoppler_glib;
function poppler_page_get_bounding_box(page: PPopplerPage; rect: PPopplerRectangle): Tgboolean; cdecl; external libpoppler_glib;
function poppler_page_get_text_layout(page: PPopplerPage; rectangles: PPPopplerRectangle; n_rectangles: Pguint): Tgboolean; cdecl; external libpoppler_glib;
function poppler_page_get_text_layout_for_area(page: PPopplerPage; area: PPopplerRectangle; rectangles: PPPopplerRectangle; n_rectangles: Pguint): Tgboolean; cdecl; external libpoppler_glib;
function poppler_page_get_text_attributes(page: PPopplerPage): PGList; cdecl; external libpoppler_glib;
procedure poppler_page_free_text_attributes(list: PGList); cdecl; external libpoppler_glib;
function poppler_page_get_text_attributes_for_area(page: PPopplerPage; area: PPopplerRectangle): PGList; cdecl; external libpoppler_glib;

function POPPLER_TYPE_RECTANGLE: TGType;

function poppler_rectangle_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_rectangle_new: PPopplerRectangle; cdecl; external libpoppler_glib;
function poppler_rectangle_copy(rectangle: PPopplerRectangle): PPopplerRectangle; cdecl; external libpoppler_glib;
procedure poppler_rectangle_free(rectangle: PPopplerRectangle); cdecl; external libpoppler_glib;
function poppler_rectangle_find_get_match_continued(rectangle: PPopplerRectangle): Tgboolean; cdecl; external libpoppler_glib;
function poppler_rectangle_find_get_ignored_hyphen(rectangle: PPopplerRectangle): Tgboolean; cdecl; external libpoppler_glib;

function POPPLER_TYPE_POINT: TGType;

type
  TPopplerPoint = record
    x: Tgdouble;
    y: Tgdouble;
  end;
  PPopplerPoint = ^TPopplerPoint;

function poppler_point_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_point_new: PPopplerPoint; cdecl; external libpoppler_glib;
function poppler_point_copy(point: PPopplerPoint): PPopplerPoint; cdecl; external libpoppler_glib;
procedure poppler_point_free(point: PPopplerPoint); cdecl; external libpoppler_glib;

function POPPLER_TYPE_QUADRILATERAL: TGType;

type
  TPopplerQuadrilateral = record
    p1: TPopplerPoint;
    p2: TPopplerPoint;
    p3: TPopplerPoint;
    p4: TPopplerPoint;
  end;
  PPopplerQuadrilateral = ^TPopplerQuadrilateral;

function poppler_quadrilateral_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_quadrilateral_new: PPopplerQuadrilateral; cdecl; external libpoppler_glib;
function poppler_quadrilateral_copy(quad: PPopplerQuadrilateral): PPopplerQuadrilateral; cdecl; external libpoppler_glib;
procedure poppler_quadrilateral_free(quad: PPopplerQuadrilateral); cdecl; external libpoppler_glib;

function POPPLER_TYPE_COLOR: TGType;

function poppler_color_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_color_new: PPopplerColor; cdecl; external libpoppler_glib;
function poppler_color_copy(color: PPopplerColor): PPopplerColor; cdecl; external libpoppler_glib;
procedure poppler_color_free(color: PPopplerColor); cdecl; external libpoppler_glib;

function POPPLER_TYPE_TEXT_ATTRIBUTES: TGType;

type
  TPopplerTextAttributes = record
    font_name: Pgchar;
    font_size: Tgdouble;
    is_underlined: Tgboolean;
    color: TPopplerColor;
    start_index: Tgint;
    end_index: Tgint;
  end;
  PPopplerTextAttributes = ^TPopplerTextAttributes;

function poppler_text_attributes_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_text_attributes_new: PPopplerTextAttributes; cdecl; external libpoppler_glib;
function poppler_text_attributes_copy(text_attrs: PPopplerTextAttributes): PPopplerTextAttributes; cdecl; external libpoppler_glib;
procedure poppler_text_attributes_free(text_attrs: PPopplerTextAttributes); cdecl; external libpoppler_glib;

function POPPLER_TYPE_LINK_MAPPING: TGType;

type
  TPopplerLinkMapping = record
    area: TPopplerRectangle;
    action: PPopplerAction;
  end;
  PPopplerLinkMapping = ^TPopplerLinkMapping;

function poppler_link_mapping_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_link_mapping_new: PPopplerLinkMapping; cdecl; external libpoppler_glib;
function poppler_link_mapping_copy(mapping: PPopplerLinkMapping): PPopplerLinkMapping; cdecl; external libpoppler_glib;
procedure poppler_link_mapping_free(mapping: PPopplerLinkMapping); cdecl; external libpoppler_glib;

function POPPLER_TYPE_PAGE_TRANSITION: TGType;

function poppler_page_transition_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_page_transition_new: PPopplerPageTransition; cdecl; external libpoppler_glib;
function poppler_page_transition_copy(transition: PPopplerPageTransition): PPopplerPageTransition; cdecl; external libpoppler_glib;
procedure poppler_page_transition_free(transition: PPopplerPageTransition); cdecl; external libpoppler_glib;

function POPPLER_TYPE_IMAGE_MAPPING: TGType;

type
  TPopplerImageMapping = record
    area: TPopplerRectangle;
    image_id: Tgint;
  end;
  PPopplerImageMapping = ^TPopplerImageMapping;

function poppler_image_mapping_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_image_mapping_new: PPopplerImageMapping; cdecl; external libpoppler_glib;
function poppler_image_mapping_copy(mapping: PPopplerImageMapping): PPopplerImageMapping; cdecl; external libpoppler_glib;
procedure poppler_image_mapping_free(mapping: PPopplerImageMapping); cdecl; external libpoppler_glib;

function POPPLER_TYPE_FORM_FIELD_MAPPING: TGType;

type
  TPopplerFormFieldMapping = record
    area: TPopplerRectangle;
    field: PPopplerFormField;
  end;
  PPopplerFormFieldMapping = ^TPopplerFormFieldMapping;

function poppler_form_field_mapping_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_form_field_mapping_new: PPopplerFormFieldMapping; cdecl; external libpoppler_glib;
function poppler_form_field_mapping_copy(mapping: PPopplerFormFieldMapping): PPopplerFormFieldMapping; cdecl; external libpoppler_glib;
procedure poppler_form_field_mapping_free(mapping: PPopplerFormFieldMapping); cdecl; external libpoppler_glib;

function POPPLER_TYPE_ANNOT_MAPPING: TGType;

type
  TPopplerAnnotMapping = record
    area: TPopplerRectangle;
    annot: PPopplerAnnot;
  end;
  PPopplerAnnotMapping = ^TPopplerAnnotMapping;

function poppler_annot_mapping_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_annot_mapping_new: PPopplerAnnotMapping; cdecl; external libpoppler_glib;
function poppler_annot_mapping_copy(mapping: PPopplerAnnotMapping): PPopplerAnnotMapping; cdecl; external libpoppler_glib;
procedure poppler_annot_mapping_free(mapping: PPopplerAnnotMapping); cdecl; external libpoppler_glib;

// === Konventiert am: 15-8-25 16:55:38 ===

function POPPLER_TYPE_PAGE: TGType;
function POPPLER_PAGE(obj: Pointer): PPopplerPage;
function POPPLER_IS_PAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function POPPLER_TYPE_PAGE: TGType;
begin
  POPPLER_TYPE_PAGE := poppler_page_get_type;
end;

function POPPLER_PAGE(obj: Pointer): PPopplerPage;
begin
  Result := PPopplerPage(g_type_check_instance_cast(obj, POPPLER_TYPE_PAGE));
end;

function POPPLER_IS_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_PAGE);
end;

// ====

function POPPLER_TYPE_RECTANGLE: TGType;
begin
  POPPLER_TYPE_RECTANGLE := poppler_rectangle_get_type;
end;

function POPPLER_TYPE_POINT: TGType;
begin
  POPPLER_TYPE_POINT := poppler_point_get_type;
end;

function POPPLER_TYPE_QUADRILATERAL: TGType;
begin
  POPPLER_TYPE_QUADRILATERAL := poppler_quadrilateral_get_type;
end;

function POPPLER_TYPE_COLOR: TGType;
begin
  POPPLER_TYPE_COLOR := poppler_color_get_type;
end;

function POPPLER_TYPE_TEXT_ATTRIBUTES: TGType;
begin
  POPPLER_TYPE_TEXT_ATTRIBUTES := poppler_text_attributes_get_type;
end;

function POPPLER_TYPE_LINK_MAPPING: TGType;
begin
  POPPLER_TYPE_LINK_MAPPING := poppler_link_mapping_get_type;
end;

function POPPLER_TYPE_PAGE_TRANSITION: TGType;
begin
  POPPLER_TYPE_PAGE_TRANSITION := poppler_page_transition_get_type;
end;

function POPPLER_TYPE_IMAGE_MAPPING: TGType;
begin
  POPPLER_TYPE_IMAGE_MAPPING := poppler_image_mapping_get_type;
end;

function POPPLER_TYPE_FORM_FIELD_MAPPING: TGType;
begin
  POPPLER_TYPE_FORM_FIELD_MAPPING := poppler_form_field_mapping_get_type;
end;

function POPPLER_TYPE_ANNOT_MAPPING: TGType;
begin
  POPPLER_TYPE_ANNOT_MAPPING := poppler_annot_mapping_get_type;
end;


{$ENDIF read_implementation}
