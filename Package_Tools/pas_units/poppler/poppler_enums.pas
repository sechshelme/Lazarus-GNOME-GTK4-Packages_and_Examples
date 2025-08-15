unit poppler_enums;

interface

uses
  fp_glib2, fp_cairo, fp_poppler_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function poppler_action_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ACTION_TYPE: TGType;

function poppler_dest_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_DEST_TYPE: TGType;

function poppler_action_movie_operation_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ACTION_MOVIE_OPERATION: TGType;

function poppler_action_layer_action_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ACTION_LAYER_ACTION: TGType;

function poppler_annot_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_TYPE: TGType;

function poppler_annot_flag_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_FLAG: TGType;

function poppler_annot_markup_reply_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_MARKUP_REPLY_TYPE: TGType;

function poppler_annot_external_data_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_EXTERNAL_DATA_TYPE: TGType;

function poppler_annot_text_state_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_TEXT_STATE: TGType;

function poppler_annot_free_text_quadding_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_FREE_TEXT_QUADDING: TGType;

function poppler_annot_stamp_icon_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ANNOT_STAMP_ICON: TGType;

function poppler_page_layout_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PAGE_LAYOUT: TGType;

function poppler_page_mode_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PAGE_MODE: TGType;

function poppler_font_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_FONT_TYPE: TGType;

function poppler_viewer_preferences_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_VIEWER_PREFERENCES: TGType;

function poppler_print_scaling_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PRINT_SCALING: TGType;

function poppler_print_duplex_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PRINT_DUPLEX: TGType;

function poppler_permissions_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PERMISSIONS: TGType;

function poppler_pdf_subtype_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PDF_SUBTYPE: TGType;

function poppler_pdf_part_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PDF_PART: TGType;

function poppler_pdf_conformance_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PDF_CONFORMANCE: TGType;

function poppler_signature_status_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_SIGNATURE_STATUS: TGType;

function poppler_certificate_status_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_CERTIFICATE_STATUS: TGType;

function poppler_signature_validation_flags_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_SIGNATURE_VALIDATION_FLAGS: TGType;

function poppler_form_field_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_FORM_FIELD_TYPE: TGType;

function poppler_form_button_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_FORM_BUTTON_TYPE: TGType;

function poppler_form_text_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_FORM_TEXT_TYPE: TGType;

function poppler_form_choice_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_FORM_CHOICE_TYPE: TGType;

function poppler_additional_action_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ADDITIONAL_ACTION_TYPE: TGType;

function poppler_movie_play_mode_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_MOVIE_PLAY_MODE: TGType;

function poppler_structure_element_kind_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_ELEMENT_KIND: TGType;

function poppler_structure_get_text_flags_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_GET_TEXT_FLAGS: TGType;

function poppler_structure_placement_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_PLACEMENT: TGType;

function poppler_structure_writing_mode_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_WRITING_MODE: TGType;

function poppler_structure_border_style_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_BORDER_STYLE: TGType;

function poppler_structure_text_align_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_TEXT_ALIGN: TGType;

function poppler_structure_block_align_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_BLOCK_ALIGN: TGType;

function poppler_structure_inline_align_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_INLINE_ALIGN: TGType;

function poppler_structure_text_decoration_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_TEXT_DECORATION: TGType;

function poppler_structure_ruby_align_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_RUBY_ALIGN: TGType;

function poppler_structure_ruby_position_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_RUBY_POSITION: TGType;

function poppler_structure_glyph_orientation_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_GLYPH_ORIENTATION: TGType;

function poppler_structure_list_numbering_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_LIST_NUMBERING: TGType;

function poppler_structure_form_role_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_FORM_ROLE: TGType;

function poppler_structure_form_state_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_FORM_STATE: TGType;

function poppler_structure_table_scope_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_STRUCTURE_TABLE_SCOPE: TGType;

function poppler_error_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_ERROR: TGType;

function poppler_page_transition_type_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PAGE_TRANSITION_TYPE: TGType;

function poppler_page_transition_alignment_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PAGE_TRANSITION_ALIGNMENT: TGType;

function poppler_page_transition_direction_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PAGE_TRANSITION_DIRECTION: TGType;

function poppler_selection_style_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_SELECTION_STYLE: TGType;

function poppler_print_flags_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_PRINT_FLAGS: TGType;

function poppler_find_flags_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_FIND_FLAGS: TGType;

function poppler_backend_get_type: TGType; cdecl; external poppler_glib;
function POPPLER_TYPE_BACKEND: TGType;


// === Konventiert am: 15-8-25 16:54:34 ===


implementation


function POPPLER_TYPE_ACTION_TYPE: TGType;
begin
  POPPLER_TYPE_ACTION_TYPE := poppler_action_type_get_type;
end;

function POPPLER_TYPE_DEST_TYPE: TGType;
begin
  POPPLER_TYPE_DEST_TYPE := poppler_dest_type_get_type;
end;

function POPPLER_TYPE_ACTION_MOVIE_OPERATION: TGType;
begin
  POPPLER_TYPE_ACTION_MOVIE_OPERATION := poppler_action_movie_operation_get_type;
end;

function POPPLER_TYPE_ACTION_LAYER_ACTION: TGType;
begin
  POPPLER_TYPE_ACTION_LAYER_ACTION := poppler_action_layer_action_get_type;
end;

function POPPLER_TYPE_ANNOT_TYPE: TGType;
begin
  POPPLER_TYPE_ANNOT_TYPE := poppler_annot_type_get_type;
end;

function POPPLER_TYPE_ANNOT_FLAG: TGType;
begin
  POPPLER_TYPE_ANNOT_FLAG := poppler_annot_flag_get_type;
end;

function POPPLER_TYPE_ANNOT_MARKUP_REPLY_TYPE: TGType;
begin
  POPPLER_TYPE_ANNOT_MARKUP_REPLY_TYPE := poppler_annot_markup_reply_type_get_type;
end;

function POPPLER_TYPE_ANNOT_EXTERNAL_DATA_TYPE: TGType;
begin
  POPPLER_TYPE_ANNOT_EXTERNAL_DATA_TYPE := poppler_annot_external_data_type_get_type;
end;

function POPPLER_TYPE_ANNOT_TEXT_STATE: TGType;
begin
  POPPLER_TYPE_ANNOT_TEXT_STATE := poppler_annot_text_state_get_type;
end;

function POPPLER_TYPE_ANNOT_FREE_TEXT_QUADDING: TGType;
begin
  POPPLER_TYPE_ANNOT_FREE_TEXT_QUADDING := poppler_annot_free_text_quadding_get_type;
end;

function POPPLER_TYPE_ANNOT_STAMP_ICON: TGType;
begin
  POPPLER_TYPE_ANNOT_STAMP_ICON := poppler_annot_stamp_icon_get_type;
end;

function POPPLER_TYPE_PAGE_LAYOUT: TGType;
begin
  POPPLER_TYPE_PAGE_LAYOUT := poppler_page_layout_get_type;
end;

function POPPLER_TYPE_PAGE_MODE: TGType;
begin
  POPPLER_TYPE_PAGE_MODE := poppler_page_mode_get_type;
end;

function POPPLER_TYPE_FONT_TYPE: TGType;
begin
  POPPLER_TYPE_FONT_TYPE := poppler_font_type_get_type;
end;

function POPPLER_TYPE_VIEWER_PREFERENCES: TGType;
begin
  POPPLER_TYPE_VIEWER_PREFERENCES := poppler_viewer_preferences_get_type;
end;

function POPPLER_TYPE_PRINT_SCALING: TGType;
begin
  POPPLER_TYPE_PRINT_SCALING := poppler_print_scaling_get_type;
end;

function POPPLER_TYPE_PRINT_DUPLEX: TGType;
begin
  POPPLER_TYPE_PRINT_DUPLEX := poppler_print_duplex_get_type;
end;

function POPPLER_TYPE_PERMISSIONS: TGType;
begin
  POPPLER_TYPE_PERMISSIONS := poppler_permissions_get_type;
end;

function POPPLER_TYPE_PDF_SUBTYPE: TGType;
begin
  POPPLER_TYPE_PDF_SUBTYPE := poppler_pdf_subtype_get_type;
end;

function POPPLER_TYPE_PDF_PART: TGType;
begin
  POPPLER_TYPE_PDF_PART := poppler_pdf_part_get_type;
end;

function POPPLER_TYPE_PDF_CONFORMANCE: TGType;
begin
  POPPLER_TYPE_PDF_CONFORMANCE := poppler_pdf_conformance_get_type;
end;

function POPPLER_TYPE_SIGNATURE_STATUS: TGType;
begin
  POPPLER_TYPE_SIGNATURE_STATUS := poppler_signature_status_get_type;
end;

function POPPLER_TYPE_CERTIFICATE_STATUS: TGType;
begin
  POPPLER_TYPE_CERTIFICATE_STATUS := poppler_certificate_status_get_type;
end;

function POPPLER_TYPE_SIGNATURE_VALIDATION_FLAGS: TGType;
begin
  POPPLER_TYPE_SIGNATURE_VALIDATION_FLAGS := poppler_signature_validation_flags_get_type;
end;

function POPPLER_TYPE_FORM_FIELD_TYPE: TGType;
begin
  POPPLER_TYPE_FORM_FIELD_TYPE := poppler_form_field_type_get_type;
end;

function POPPLER_TYPE_FORM_BUTTON_TYPE: TGType;
begin
  POPPLER_TYPE_FORM_BUTTON_TYPE := poppler_form_button_type_get_type;
end;

function POPPLER_TYPE_FORM_TEXT_TYPE: TGType;
begin
  POPPLER_TYPE_FORM_TEXT_TYPE := poppler_form_text_type_get_type;
end;

function POPPLER_TYPE_FORM_CHOICE_TYPE: TGType;
begin
  POPPLER_TYPE_FORM_CHOICE_TYPE := poppler_form_choice_type_get_type;
end;

function POPPLER_TYPE_ADDITIONAL_ACTION_TYPE: TGType;
begin
  POPPLER_TYPE_ADDITIONAL_ACTION_TYPE := poppler_additional_action_type_get_type;
end;

function POPPLER_TYPE_MOVIE_PLAY_MODE: TGType;
begin
  POPPLER_TYPE_MOVIE_PLAY_MODE := poppler_movie_play_mode_get_type;
end;

function POPPLER_TYPE_STRUCTURE_ELEMENT_KIND: TGType;
begin
  POPPLER_TYPE_STRUCTURE_ELEMENT_KIND := poppler_structure_element_kind_get_type;
end;

function POPPLER_TYPE_STRUCTURE_GET_TEXT_FLAGS: TGType;
begin
  POPPLER_TYPE_STRUCTURE_GET_TEXT_FLAGS := poppler_structure_get_text_flags_get_type;
end;

function POPPLER_TYPE_STRUCTURE_PLACEMENT: TGType;
begin
  POPPLER_TYPE_STRUCTURE_PLACEMENT := poppler_structure_placement_get_type;
end;

function POPPLER_TYPE_STRUCTURE_WRITING_MODE: TGType;
begin
  POPPLER_TYPE_STRUCTURE_WRITING_MODE := poppler_structure_writing_mode_get_type;
end;

function POPPLER_TYPE_STRUCTURE_BORDER_STYLE: TGType;
begin
  POPPLER_TYPE_STRUCTURE_BORDER_STYLE := poppler_structure_border_style_get_type;
end;

function POPPLER_TYPE_STRUCTURE_TEXT_ALIGN: TGType;
begin
  POPPLER_TYPE_STRUCTURE_TEXT_ALIGN := poppler_structure_text_align_get_type;
end;

function POPPLER_TYPE_STRUCTURE_BLOCK_ALIGN: TGType;
begin
  POPPLER_TYPE_STRUCTURE_BLOCK_ALIGN := poppler_structure_block_align_get_type;
end;

function POPPLER_TYPE_STRUCTURE_INLINE_ALIGN: TGType;
begin
  POPPLER_TYPE_STRUCTURE_INLINE_ALIGN := poppler_structure_inline_align_get_type;
end;

function POPPLER_TYPE_STRUCTURE_TEXT_DECORATION: TGType;
begin
  POPPLER_TYPE_STRUCTURE_TEXT_DECORATION := poppler_structure_text_decoration_get_type;
end;

function POPPLER_TYPE_STRUCTURE_RUBY_ALIGN: TGType;
begin
  POPPLER_TYPE_STRUCTURE_RUBY_ALIGN := poppler_structure_ruby_align_get_type;
end;

function POPPLER_TYPE_STRUCTURE_RUBY_POSITION: TGType;
begin
  POPPLER_TYPE_STRUCTURE_RUBY_POSITION := poppler_structure_ruby_position_get_type;
end;

function POPPLER_TYPE_STRUCTURE_GLYPH_ORIENTATION: TGType;
begin
  POPPLER_TYPE_STRUCTURE_GLYPH_ORIENTATION := poppler_structure_glyph_orientation_get_type;
end;

function POPPLER_TYPE_STRUCTURE_LIST_NUMBERING: TGType;
begin
  POPPLER_TYPE_STRUCTURE_LIST_NUMBERING := poppler_structure_list_numbering_get_type;
end;

function POPPLER_TYPE_STRUCTURE_FORM_ROLE: TGType;
begin
  POPPLER_TYPE_STRUCTURE_FORM_ROLE := poppler_structure_form_role_get_type;
end;

function POPPLER_TYPE_STRUCTURE_FORM_STATE: TGType;
begin
  POPPLER_TYPE_STRUCTURE_FORM_STATE := poppler_structure_form_state_get_type;
end;

function POPPLER_TYPE_STRUCTURE_TABLE_SCOPE: TGType;
begin
  POPPLER_TYPE_STRUCTURE_TABLE_SCOPE := poppler_structure_table_scope_get_type;
end;

function POPPLER_TYPE_ERROR: TGType;
begin
  POPPLER_TYPE_ERROR := poppler_error_get_type;
end;

function POPPLER_TYPE_PAGE_TRANSITION_TYPE: TGType;
begin
  POPPLER_TYPE_PAGE_TRANSITION_TYPE := poppler_page_transition_type_get_type;
end;

function POPPLER_TYPE_PAGE_TRANSITION_ALIGNMENT: TGType;
begin
  POPPLER_TYPE_PAGE_TRANSITION_ALIGNMENT := poppler_page_transition_alignment_get_type;
end;

function POPPLER_TYPE_PAGE_TRANSITION_DIRECTION: TGType;
begin
  POPPLER_TYPE_PAGE_TRANSITION_DIRECTION := poppler_page_transition_direction_get_type;
end;

function POPPLER_TYPE_SELECTION_STYLE: TGType;
begin
  POPPLER_TYPE_SELECTION_STYLE := poppler_selection_style_get_type;
end;

function POPPLER_TYPE_PRINT_FLAGS: TGType;
begin
  POPPLER_TYPE_PRINT_FLAGS := poppler_print_flags_get_type;
end;

function POPPLER_TYPE_FIND_FLAGS: TGType;
begin
  POPPLER_TYPE_FIND_FLAGS := poppler_find_flags_get_type;
end;

function POPPLER_TYPE_BACKEND: TGType;
begin
  POPPLER_TYPE_BACKEND := poppler_backend_get_type;
end;


end.
