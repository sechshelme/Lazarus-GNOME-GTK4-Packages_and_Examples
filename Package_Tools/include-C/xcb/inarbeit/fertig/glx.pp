
unit glx;
interface

{
  Automatically converted by H2Pas 1.0.0 from glx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glx.h
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
Pint32_t  = ^int32_t;
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_glx_are_textures_resident_cookie_t  = ^xcb_glx_are_textures_resident_cookie_t;
Pxcb_glx_are_textures_resident_reply_t  = ^xcb_glx_are_textures_resident_reply_t;
Pxcb_glx_are_textures_resident_request_t  = ^xcb_glx_are_textures_resident_request_t;
Pxcb_glx_bad_context_error_t  = ^xcb_glx_bad_context_error_t;
Pxcb_glx_bad_context_state_error_t  = ^xcb_glx_bad_context_state_error_t;
Pxcb_glx_bad_context_tag_error_t  = ^xcb_glx_bad_context_tag_error_t;
Pxcb_glx_bad_current_drawable_error_t  = ^xcb_glx_bad_current_drawable_error_t;
Pxcb_glx_bad_current_window_error_t  = ^xcb_glx_bad_current_window_error_t;
Pxcb_glx_bad_drawable_error_t  = ^xcb_glx_bad_drawable_error_t;
Pxcb_glx_bad_fb_config_error_t  = ^xcb_glx_bad_fb_config_error_t;
Pxcb_glx_bad_large_request_error_t  = ^xcb_glx_bad_large_request_error_t;
Pxcb_glx_bad_pbuffer_error_t  = ^xcb_glx_bad_pbuffer_error_t;
Pxcb_glx_bad_pixmap_error_t  = ^xcb_glx_bad_pixmap_error_t;
Pxcb_glx_bad_render_request_error_t  = ^xcb_glx_bad_render_request_error_t;
Pxcb_glx_bad_window_error_t  = ^xcb_glx_bad_window_error_t;
Pxcb_glx_bool32_iterator_t  = ^xcb_glx_bool32_iterator_t;
Pxcb_glx_bool32_t  = ^xcb_glx_bool32_t;
Pxcb_glx_buffer_swap_complete_event_t  = ^xcb_glx_buffer_swap_complete_event_t;
Pxcb_glx_change_drawable_attributes_request_t  = ^xcb_glx_change_drawable_attributes_request_t;
Pxcb_glx_client_info_request_t  = ^xcb_glx_client_info_request_t;
Pxcb_glx_context_iterator_t  = ^xcb_glx_context_iterator_t;
Pxcb_glx_context_t  = ^xcb_glx_context_t;
Pxcb_glx_context_tag_iterator_t  = ^xcb_glx_context_tag_iterator_t;
Pxcb_glx_context_tag_t  = ^xcb_glx_context_tag_t;
Pxcb_glx_copy_context_request_t  = ^xcb_glx_copy_context_request_t;
Pxcb_glx_create_context_attribs_arb_request_t  = ^xcb_glx_create_context_attribs_arb_request_t;
Pxcb_glx_create_context_request_t  = ^xcb_glx_create_context_request_t;
Pxcb_glx_create_glx_pixmap_request_t  = ^xcb_glx_create_glx_pixmap_request_t;
Pxcb_glx_create_new_context_request_t  = ^xcb_glx_create_new_context_request_t;
Pxcb_glx_create_pbuffer_request_t  = ^xcb_glx_create_pbuffer_request_t;
Pxcb_glx_create_pixmap_request_t  = ^xcb_glx_create_pixmap_request_t;
Pxcb_glx_create_window_request_t  = ^xcb_glx_create_window_request_t;
Pxcb_glx_delete_lists_request_t  = ^xcb_glx_delete_lists_request_t;
Pxcb_glx_delete_queries_arb_request_t  = ^xcb_glx_delete_queries_arb_request_t;
Pxcb_glx_delete_textures_request_t  = ^xcb_glx_delete_textures_request_t;
Pxcb_glx_delete_window_request_t  = ^xcb_glx_delete_window_request_t;
Pxcb_glx_destroy_context_request_t  = ^xcb_glx_destroy_context_request_t;
Pxcb_glx_destroy_glx_pixmap_request_t  = ^xcb_glx_destroy_glx_pixmap_request_t;
Pxcb_glx_destroy_pbuffer_request_t  = ^xcb_glx_destroy_pbuffer_request_t;
Pxcb_glx_destroy_pixmap_request_t  = ^xcb_glx_destroy_pixmap_request_t;
Pxcb_glx_drawable_iterator_t  = ^xcb_glx_drawable_iterator_t;
Pxcb_glx_drawable_t  = ^xcb_glx_drawable_t;
Pxcb_glx_end_list_request_t  = ^xcb_glx_end_list_request_t;
Pxcb_glx_fbconfig_iterator_t  = ^xcb_glx_fbconfig_iterator_t;
Pxcb_glx_fbconfig_t  = ^xcb_glx_fbconfig_t;
Pxcb_glx_feedback_buffer_request_t  = ^xcb_glx_feedback_buffer_request_t;
Pxcb_glx_finish_cookie_t  = ^xcb_glx_finish_cookie_t;
Pxcb_glx_finish_reply_t  = ^xcb_glx_finish_reply_t;
Pxcb_glx_finish_request_t  = ^xcb_glx_finish_request_t;
Pxcb_glx_float32_iterator_t  = ^xcb_glx_float32_iterator_t;
Pxcb_glx_float32_t  = ^xcb_glx_float32_t;
Pxcb_glx_float64_iterator_t  = ^xcb_glx_float64_iterator_t;
Pxcb_glx_float64_t  = ^xcb_glx_float64_t;
Pxcb_glx_flush_request_t  = ^xcb_glx_flush_request_t;
Pxcb_glx_gc_t  = ^xcb_glx_gc_t;
Pxcb_glx_gen_lists_cookie_t  = ^xcb_glx_gen_lists_cookie_t;
Pxcb_glx_gen_lists_reply_t  = ^xcb_glx_gen_lists_reply_t;
Pxcb_glx_gen_lists_request_t  = ^xcb_glx_gen_lists_request_t;
Pxcb_glx_gen_queries_arb_cookie_t  = ^xcb_glx_gen_queries_arb_cookie_t;
Pxcb_glx_gen_queries_arb_reply_t  = ^xcb_glx_gen_queries_arb_reply_t;
Pxcb_glx_gen_queries_arb_request_t  = ^xcb_glx_gen_queries_arb_request_t;
Pxcb_glx_gen_textures_cookie_t  = ^xcb_glx_gen_textures_cookie_t;
Pxcb_glx_gen_textures_reply_t  = ^xcb_glx_gen_textures_reply_t;
Pxcb_glx_gen_textures_request_t  = ^xcb_glx_gen_textures_request_t;
Pxcb_glx_generic_error_t  = ^xcb_glx_generic_error_t;
Pxcb_glx_get_booleanv_cookie_t  = ^xcb_glx_get_booleanv_cookie_t;
Pxcb_glx_get_booleanv_reply_t  = ^xcb_glx_get_booleanv_reply_t;
Pxcb_glx_get_booleanv_request_t  = ^xcb_glx_get_booleanv_request_t;
Pxcb_glx_get_clip_plane_cookie_t  = ^xcb_glx_get_clip_plane_cookie_t;
Pxcb_glx_get_clip_plane_reply_t  = ^xcb_glx_get_clip_plane_reply_t;
Pxcb_glx_get_clip_plane_request_t  = ^xcb_glx_get_clip_plane_request_t;
Pxcb_glx_get_color_table_cookie_t  = ^xcb_glx_get_color_table_cookie_t;
Pxcb_glx_get_color_table_parameterfv_cookie_t  = ^xcb_glx_get_color_table_parameterfv_cookie_t;
Pxcb_glx_get_color_table_parameterfv_reply_t  = ^xcb_glx_get_color_table_parameterfv_reply_t;
Pxcb_glx_get_color_table_parameterfv_request_t  = ^xcb_glx_get_color_table_parameterfv_request_t;
Pxcb_glx_get_color_table_parameteriv_cookie_t  = ^xcb_glx_get_color_table_parameteriv_cookie_t;
Pxcb_glx_get_color_table_parameteriv_reply_t  = ^xcb_glx_get_color_table_parameteriv_reply_t;
Pxcb_glx_get_color_table_parameteriv_request_t  = ^xcb_glx_get_color_table_parameteriv_request_t;
Pxcb_glx_get_color_table_reply_t  = ^xcb_glx_get_color_table_reply_t;
Pxcb_glx_get_color_table_request_t  = ^xcb_glx_get_color_table_request_t;
Pxcb_glx_get_compressed_tex_image_arb_cookie_t  = ^xcb_glx_get_compressed_tex_image_arb_cookie_t;
Pxcb_glx_get_compressed_tex_image_arb_reply_t  = ^xcb_glx_get_compressed_tex_image_arb_reply_t;
Pxcb_glx_get_compressed_tex_image_arb_request_t  = ^xcb_glx_get_compressed_tex_image_arb_request_t;
Pxcb_glx_get_convolution_filter_cookie_t  = ^xcb_glx_get_convolution_filter_cookie_t;
Pxcb_glx_get_convolution_filter_reply_t  = ^xcb_glx_get_convolution_filter_reply_t;
Pxcb_glx_get_convolution_filter_request_t  = ^xcb_glx_get_convolution_filter_request_t;
Pxcb_glx_get_convolution_parameterfv_cookie_t  = ^xcb_glx_get_convolution_parameterfv_cookie_t;
Pxcb_glx_get_convolution_parameterfv_reply_t  = ^xcb_glx_get_convolution_parameterfv_reply_t;
Pxcb_glx_get_convolution_parameterfv_request_t  = ^xcb_glx_get_convolution_parameterfv_request_t;
Pxcb_glx_get_convolution_parameteriv_cookie_t  = ^xcb_glx_get_convolution_parameteriv_cookie_t;
Pxcb_glx_get_convolution_parameteriv_reply_t  = ^xcb_glx_get_convolution_parameteriv_reply_t;
Pxcb_glx_get_convolution_parameteriv_request_t  = ^xcb_glx_get_convolution_parameteriv_request_t;
Pxcb_glx_get_doublev_cookie_t  = ^xcb_glx_get_doublev_cookie_t;
Pxcb_glx_get_doublev_reply_t  = ^xcb_glx_get_doublev_reply_t;
Pxcb_glx_get_doublev_request_t  = ^xcb_glx_get_doublev_request_t;
Pxcb_glx_get_drawable_attributes_cookie_t  = ^xcb_glx_get_drawable_attributes_cookie_t;
Pxcb_glx_get_drawable_attributes_reply_t  = ^xcb_glx_get_drawable_attributes_reply_t;
Pxcb_glx_get_drawable_attributes_request_t  = ^xcb_glx_get_drawable_attributes_request_t;
Pxcb_glx_get_error_cookie_t  = ^xcb_glx_get_error_cookie_t;
Pxcb_glx_get_error_reply_t  = ^xcb_glx_get_error_reply_t;
Pxcb_glx_get_error_request_t  = ^xcb_glx_get_error_request_t;
Pxcb_glx_get_fb_configs_cookie_t  = ^xcb_glx_get_fb_configs_cookie_t;
Pxcb_glx_get_fb_configs_reply_t  = ^xcb_glx_get_fb_configs_reply_t;
Pxcb_glx_get_fb_configs_request_t  = ^xcb_glx_get_fb_configs_request_t;
Pxcb_glx_get_floatv_cookie_t  = ^xcb_glx_get_floatv_cookie_t;
Pxcb_glx_get_floatv_reply_t  = ^xcb_glx_get_floatv_reply_t;
Pxcb_glx_get_floatv_request_t  = ^xcb_glx_get_floatv_request_t;
Pxcb_glx_get_histogram_cookie_t  = ^xcb_glx_get_histogram_cookie_t;
Pxcb_glx_get_histogram_parameterfv_cookie_t  = ^xcb_glx_get_histogram_parameterfv_cookie_t;
Pxcb_glx_get_histogram_parameterfv_reply_t  = ^xcb_glx_get_histogram_parameterfv_reply_t;
Pxcb_glx_get_histogram_parameterfv_request_t  = ^xcb_glx_get_histogram_parameterfv_request_t;
Pxcb_glx_get_histogram_parameteriv_cookie_t  = ^xcb_glx_get_histogram_parameteriv_cookie_t;
Pxcb_glx_get_histogram_parameteriv_reply_t  = ^xcb_glx_get_histogram_parameteriv_reply_t;
Pxcb_glx_get_histogram_parameteriv_request_t  = ^xcb_glx_get_histogram_parameteriv_request_t;
Pxcb_glx_get_histogram_reply_t  = ^xcb_glx_get_histogram_reply_t;
Pxcb_glx_get_histogram_request_t  = ^xcb_glx_get_histogram_request_t;
Pxcb_glx_get_integerv_cookie_t  = ^xcb_glx_get_integerv_cookie_t;
Pxcb_glx_get_integerv_reply_t  = ^xcb_glx_get_integerv_reply_t;
Pxcb_glx_get_integerv_request_t  = ^xcb_glx_get_integerv_request_t;
Pxcb_glx_get_lightfv_cookie_t  = ^xcb_glx_get_lightfv_cookie_t;
Pxcb_glx_get_lightfv_reply_t  = ^xcb_glx_get_lightfv_reply_t;
Pxcb_glx_get_lightfv_request_t  = ^xcb_glx_get_lightfv_request_t;
Pxcb_glx_get_lightiv_cookie_t  = ^xcb_glx_get_lightiv_cookie_t;
Pxcb_glx_get_lightiv_reply_t  = ^xcb_glx_get_lightiv_reply_t;
Pxcb_glx_get_lightiv_request_t  = ^xcb_glx_get_lightiv_request_t;
Pxcb_glx_get_mapdv_cookie_t  = ^xcb_glx_get_mapdv_cookie_t;
Pxcb_glx_get_mapdv_reply_t  = ^xcb_glx_get_mapdv_reply_t;
Pxcb_glx_get_mapdv_request_t  = ^xcb_glx_get_mapdv_request_t;
Pxcb_glx_get_mapfv_cookie_t  = ^xcb_glx_get_mapfv_cookie_t;
Pxcb_glx_get_mapfv_reply_t  = ^xcb_glx_get_mapfv_reply_t;
Pxcb_glx_get_mapfv_request_t  = ^xcb_glx_get_mapfv_request_t;
Pxcb_glx_get_mapiv_cookie_t  = ^xcb_glx_get_mapiv_cookie_t;
Pxcb_glx_get_mapiv_reply_t  = ^xcb_glx_get_mapiv_reply_t;
Pxcb_glx_get_mapiv_request_t  = ^xcb_glx_get_mapiv_request_t;
Pxcb_glx_get_materialfv_cookie_t  = ^xcb_glx_get_materialfv_cookie_t;
Pxcb_glx_get_materialfv_reply_t  = ^xcb_glx_get_materialfv_reply_t;
Pxcb_glx_get_materialfv_request_t  = ^xcb_glx_get_materialfv_request_t;
Pxcb_glx_get_materialiv_cookie_t  = ^xcb_glx_get_materialiv_cookie_t;
Pxcb_glx_get_materialiv_reply_t  = ^xcb_glx_get_materialiv_reply_t;
Pxcb_glx_get_materialiv_request_t  = ^xcb_glx_get_materialiv_request_t;
Pxcb_glx_get_minmax_cookie_t  = ^xcb_glx_get_minmax_cookie_t;
Pxcb_glx_get_minmax_parameterfv_cookie_t  = ^xcb_glx_get_minmax_parameterfv_cookie_t;
Pxcb_glx_get_minmax_parameterfv_reply_t  = ^xcb_glx_get_minmax_parameterfv_reply_t;
Pxcb_glx_get_minmax_parameterfv_request_t  = ^xcb_glx_get_minmax_parameterfv_request_t;
Pxcb_glx_get_minmax_parameteriv_cookie_t  = ^xcb_glx_get_minmax_parameteriv_cookie_t;
Pxcb_glx_get_minmax_parameteriv_reply_t  = ^xcb_glx_get_minmax_parameteriv_reply_t;
Pxcb_glx_get_minmax_parameteriv_request_t  = ^xcb_glx_get_minmax_parameteriv_request_t;
Pxcb_glx_get_minmax_reply_t  = ^xcb_glx_get_minmax_reply_t;
Pxcb_glx_get_minmax_request_t  = ^xcb_glx_get_minmax_request_t;
Pxcb_glx_get_pixel_mapfv_cookie_t  = ^xcb_glx_get_pixel_mapfv_cookie_t;
Pxcb_glx_get_pixel_mapfv_reply_t  = ^xcb_glx_get_pixel_mapfv_reply_t;
Pxcb_glx_get_pixel_mapfv_request_t  = ^xcb_glx_get_pixel_mapfv_request_t;
Pxcb_glx_get_pixel_mapuiv_cookie_t  = ^xcb_glx_get_pixel_mapuiv_cookie_t;
Pxcb_glx_get_pixel_mapuiv_reply_t  = ^xcb_glx_get_pixel_mapuiv_reply_t;
Pxcb_glx_get_pixel_mapuiv_request_t  = ^xcb_glx_get_pixel_mapuiv_request_t;
Pxcb_glx_get_pixel_mapusv_cookie_t  = ^xcb_glx_get_pixel_mapusv_cookie_t;
Pxcb_glx_get_pixel_mapusv_reply_t  = ^xcb_glx_get_pixel_mapusv_reply_t;
Pxcb_glx_get_pixel_mapusv_request_t  = ^xcb_glx_get_pixel_mapusv_request_t;
Pxcb_glx_get_polygon_stipple_cookie_t  = ^xcb_glx_get_polygon_stipple_cookie_t;
Pxcb_glx_get_polygon_stipple_reply_t  = ^xcb_glx_get_polygon_stipple_reply_t;
Pxcb_glx_get_polygon_stipple_request_t  = ^xcb_glx_get_polygon_stipple_request_t;
Pxcb_glx_get_query_objectiv_arb_cookie_t  = ^xcb_glx_get_query_objectiv_arb_cookie_t;
Pxcb_glx_get_query_objectiv_arb_reply_t  = ^xcb_glx_get_query_objectiv_arb_reply_t;
Pxcb_glx_get_query_objectiv_arb_request_t  = ^xcb_glx_get_query_objectiv_arb_request_t;
Pxcb_glx_get_query_objectuiv_arb_cookie_t  = ^xcb_glx_get_query_objectuiv_arb_cookie_t;
Pxcb_glx_get_query_objectuiv_arb_reply_t  = ^xcb_glx_get_query_objectuiv_arb_reply_t;
Pxcb_glx_get_query_objectuiv_arb_request_t  = ^xcb_glx_get_query_objectuiv_arb_request_t;
Pxcb_glx_get_queryiv_arb_cookie_t  = ^xcb_glx_get_queryiv_arb_cookie_t;
Pxcb_glx_get_queryiv_arb_reply_t  = ^xcb_glx_get_queryiv_arb_reply_t;
Pxcb_glx_get_queryiv_arb_request_t  = ^xcb_glx_get_queryiv_arb_request_t;
Pxcb_glx_get_separable_filter_cookie_t  = ^xcb_glx_get_separable_filter_cookie_t;
Pxcb_glx_get_separable_filter_reply_t  = ^xcb_glx_get_separable_filter_reply_t;
Pxcb_glx_get_separable_filter_request_t  = ^xcb_glx_get_separable_filter_request_t;
Pxcb_glx_get_string_cookie_t  = ^xcb_glx_get_string_cookie_t;
Pxcb_glx_get_string_reply_t  = ^xcb_glx_get_string_reply_t;
Pxcb_glx_get_string_request_t  = ^xcb_glx_get_string_request_t;
Pxcb_glx_get_tex_envfv_cookie_t  = ^xcb_glx_get_tex_envfv_cookie_t;
Pxcb_glx_get_tex_envfv_reply_t  = ^xcb_glx_get_tex_envfv_reply_t;
Pxcb_glx_get_tex_envfv_request_t  = ^xcb_glx_get_tex_envfv_request_t;
Pxcb_glx_get_tex_enviv_cookie_t  = ^xcb_glx_get_tex_enviv_cookie_t;
Pxcb_glx_get_tex_enviv_reply_t  = ^xcb_glx_get_tex_enviv_reply_t;
Pxcb_glx_get_tex_enviv_request_t  = ^xcb_glx_get_tex_enviv_request_t;
Pxcb_glx_get_tex_gendv_cookie_t  = ^xcb_glx_get_tex_gendv_cookie_t;
Pxcb_glx_get_tex_gendv_reply_t  = ^xcb_glx_get_tex_gendv_reply_t;
Pxcb_glx_get_tex_gendv_request_t  = ^xcb_glx_get_tex_gendv_request_t;
Pxcb_glx_get_tex_genfv_cookie_t  = ^xcb_glx_get_tex_genfv_cookie_t;
Pxcb_glx_get_tex_genfv_reply_t  = ^xcb_glx_get_tex_genfv_reply_t;
Pxcb_glx_get_tex_genfv_request_t  = ^xcb_glx_get_tex_genfv_request_t;
Pxcb_glx_get_tex_geniv_cookie_t  = ^xcb_glx_get_tex_geniv_cookie_t;
Pxcb_glx_get_tex_geniv_reply_t  = ^xcb_glx_get_tex_geniv_reply_t;
Pxcb_glx_get_tex_geniv_request_t  = ^xcb_glx_get_tex_geniv_request_t;
Pxcb_glx_get_tex_image_cookie_t  = ^xcb_glx_get_tex_image_cookie_t;
Pxcb_glx_get_tex_image_reply_t  = ^xcb_glx_get_tex_image_reply_t;
Pxcb_glx_get_tex_image_request_t  = ^xcb_glx_get_tex_image_request_t;
Pxcb_glx_get_tex_level_parameterfv_cookie_t  = ^xcb_glx_get_tex_level_parameterfv_cookie_t;
Pxcb_glx_get_tex_level_parameterfv_reply_t  = ^xcb_glx_get_tex_level_parameterfv_reply_t;
Pxcb_glx_get_tex_level_parameterfv_request_t  = ^xcb_glx_get_tex_level_parameterfv_request_t;
Pxcb_glx_get_tex_level_parameteriv_cookie_t  = ^xcb_glx_get_tex_level_parameteriv_cookie_t;
Pxcb_glx_get_tex_level_parameteriv_reply_t  = ^xcb_glx_get_tex_level_parameteriv_reply_t;
Pxcb_glx_get_tex_level_parameteriv_request_t  = ^xcb_glx_get_tex_level_parameteriv_request_t;
Pxcb_glx_get_tex_parameterfv_cookie_t  = ^xcb_glx_get_tex_parameterfv_cookie_t;
Pxcb_glx_get_tex_parameterfv_reply_t  = ^xcb_glx_get_tex_parameterfv_reply_t;
Pxcb_glx_get_tex_parameterfv_request_t  = ^xcb_glx_get_tex_parameterfv_request_t;
Pxcb_glx_get_tex_parameteriv_cookie_t  = ^xcb_glx_get_tex_parameteriv_cookie_t;
Pxcb_glx_get_tex_parameteriv_reply_t  = ^xcb_glx_get_tex_parameteriv_reply_t;
Pxcb_glx_get_tex_parameteriv_request_t  = ^xcb_glx_get_tex_parameteriv_request_t;
Pxcb_glx_get_visual_configs_cookie_t  = ^xcb_glx_get_visual_configs_cookie_t;
Pxcb_glx_get_visual_configs_reply_t  = ^xcb_glx_get_visual_configs_reply_t;
Pxcb_glx_get_visual_configs_request_t  = ^xcb_glx_get_visual_configs_request_t;
Pxcb_glx_glx_bad_profile_arb_error_t  = ^xcb_glx_glx_bad_profile_arb_error_t;
Pxcb_glx_is_direct_cookie_t  = ^xcb_glx_is_direct_cookie_t;
Pxcb_glx_is_direct_reply_t  = ^xcb_glx_is_direct_reply_t;
Pxcb_glx_is_direct_request_t  = ^xcb_glx_is_direct_request_t;
Pxcb_glx_is_enabled_cookie_t  = ^xcb_glx_is_enabled_cookie_t;
Pxcb_glx_is_enabled_reply_t  = ^xcb_glx_is_enabled_reply_t;
Pxcb_glx_is_enabled_request_t  = ^xcb_glx_is_enabled_request_t;
Pxcb_glx_is_list_cookie_t  = ^xcb_glx_is_list_cookie_t;
Pxcb_glx_is_list_reply_t  = ^xcb_glx_is_list_reply_t;
Pxcb_glx_is_list_request_t  = ^xcb_glx_is_list_request_t;
Pxcb_glx_is_query_arb_cookie_t  = ^xcb_glx_is_query_arb_cookie_t;
Pxcb_glx_is_query_arb_reply_t  = ^xcb_glx_is_query_arb_reply_t;
Pxcb_glx_is_query_arb_request_t  = ^xcb_glx_is_query_arb_request_t;
Pxcb_glx_is_texture_cookie_t  = ^xcb_glx_is_texture_cookie_t;
Pxcb_glx_is_texture_reply_t  = ^xcb_glx_is_texture_reply_t;
Pxcb_glx_is_texture_request_t  = ^xcb_glx_is_texture_request_t;
Pxcb_glx_make_context_current_cookie_t  = ^xcb_glx_make_context_current_cookie_t;
Pxcb_glx_make_context_current_reply_t  = ^xcb_glx_make_context_current_reply_t;
Pxcb_glx_make_context_current_request_t  = ^xcb_glx_make_context_current_request_t;
Pxcb_glx_make_current_cookie_t  = ^xcb_glx_make_current_cookie_t;
Pxcb_glx_make_current_reply_t  = ^xcb_glx_make_current_reply_t;
Pxcb_glx_make_current_request_t  = ^xcb_glx_make_current_request_t;
Pxcb_glx_new_list_request_t  = ^xcb_glx_new_list_request_t;
Pxcb_glx_pbcdt_t  = ^xcb_glx_pbcdt_t;
Pxcb_glx_pbcet_t  = ^xcb_glx_pbcet_t;
Pxcb_glx_pbuffer_clobber_event_t  = ^xcb_glx_pbuffer_clobber_event_t;
Pxcb_glx_pbuffer_iterator_t  = ^xcb_glx_pbuffer_iterator_t;
Pxcb_glx_pbuffer_t  = ^xcb_glx_pbuffer_t;
Pxcb_glx_pixel_storef_request_t  = ^xcb_glx_pixel_storef_request_t;
Pxcb_glx_pixel_storei_request_t  = ^xcb_glx_pixel_storei_request_t;
Pxcb_glx_pixmap_iterator_t  = ^xcb_glx_pixmap_iterator_t;
Pxcb_glx_pixmap_t  = ^xcb_glx_pixmap_t;
Pxcb_glx_query_context_cookie_t  = ^xcb_glx_query_context_cookie_t;
Pxcb_glx_query_context_reply_t  = ^xcb_glx_query_context_reply_t;
Pxcb_glx_query_context_request_t  = ^xcb_glx_query_context_request_t;
Pxcb_glx_query_extensions_string_cookie_t  = ^xcb_glx_query_extensions_string_cookie_t;
Pxcb_glx_query_extensions_string_reply_t  = ^xcb_glx_query_extensions_string_reply_t;
Pxcb_glx_query_extensions_string_request_t  = ^xcb_glx_query_extensions_string_request_t;
Pxcb_glx_query_server_string_cookie_t  = ^xcb_glx_query_server_string_cookie_t;
Pxcb_glx_query_server_string_reply_t  = ^xcb_glx_query_server_string_reply_t;
Pxcb_glx_query_server_string_request_t  = ^xcb_glx_query_server_string_request_t;
Pxcb_glx_query_version_cookie_t  = ^xcb_glx_query_version_cookie_t;
Pxcb_glx_query_version_reply_t  = ^xcb_glx_query_version_reply_t;
Pxcb_glx_query_version_request_t  = ^xcb_glx_query_version_request_t;
Pxcb_glx_read_pixels_cookie_t  = ^xcb_glx_read_pixels_cookie_t;
Pxcb_glx_read_pixels_reply_t  = ^xcb_glx_read_pixels_reply_t;
Pxcb_glx_read_pixels_request_t  = ^xcb_glx_read_pixels_request_t;
Pxcb_glx_render_large_request_t  = ^xcb_glx_render_large_request_t;
Pxcb_glx_render_mode_cookie_t  = ^xcb_glx_render_mode_cookie_t;
Pxcb_glx_render_mode_reply_t  = ^xcb_glx_render_mode_reply_t;
Pxcb_glx_render_mode_request_t  = ^xcb_glx_render_mode_request_t;
Pxcb_glx_render_request_t  = ^xcb_glx_render_request_t;
Pxcb_glx_rm_t  = ^xcb_glx_rm_t;
Pxcb_glx_select_buffer_request_t  = ^xcb_glx_select_buffer_request_t;
Pxcb_glx_set_client_info_2arb_request_t  = ^xcb_glx_set_client_info_2arb_request_t;
Pxcb_glx_set_client_info_arb_request_t  = ^xcb_glx_set_client_info_arb_request_t;
Pxcb_glx_swap_buffers_request_t  = ^xcb_glx_swap_buffers_request_t;
Pxcb_glx_unsupported_private_request_error_t  = ^xcb_glx_unsupported_private_request_error_t;
Pxcb_glx_use_x_font_request_t  = ^xcb_glx_use_x_font_request_t;
Pxcb_glx_vendor_private_request_t  = ^xcb_glx_vendor_private_request_t;
Pxcb_glx_vendor_private_with_reply_cookie_t  = ^xcb_glx_vendor_private_with_reply_cookie_t;
Pxcb_glx_vendor_private_with_reply_reply_t  = ^xcb_glx_vendor_private_with_reply_reply_t;
Pxcb_glx_vendor_private_with_reply_request_t  = ^xcb_glx_vendor_private_with_reply_request_t;
Pxcb_glx_wait_gl_request_t  = ^xcb_glx_wait_gl_request_t;
Pxcb_glx_wait_x_request_t  = ^xcb_glx_wait_x_request_t;
Pxcb_glx_window_iterator_t  = ^xcb_glx_window_iterator_t;
Pxcb_glx_window_t  = ^xcb_glx_window_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from glx.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Glx_API XCB Glx API
 * @brief Glx XCB Protocol Implementation.
 * @
 * }
{$ifndef __GLX_H}
{$define __GLX_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_GLX_MAJOR_VERSION = 1;  
  XCB_GLX_MINOR_VERSION = 4;  
  var
    xcb_glx_id : Txcb_extension_t;cvar;external;
type
  Pxcb_glx_pixmap_t = ^Txcb_glx_pixmap_t;
  Txcb_glx_pixmap_t = Tuint32_t;
{*
 * @brief xcb_glx_pixmap_iterator_t
 * }

  Pxcb_glx_pixmap_iterator_t = ^Txcb_glx_pixmap_iterator_t;
  Txcb_glx_pixmap_iterator_t = record
      data : Pxcb_glx_pixmap_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_context_t = ^Txcb_glx_context_t;
  Txcb_glx_context_t = Tuint32_t;
{*
 * @brief xcb_glx_context_iterator_t
 * }

  Pxcb_glx_context_iterator_t = ^Txcb_glx_context_iterator_t;
  Txcb_glx_context_iterator_t = record
      data : Pxcb_glx_context_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_pbuffer_t = ^Txcb_glx_pbuffer_t;
  Txcb_glx_pbuffer_t = Tuint32_t;
{*
 * @brief xcb_glx_pbuffer_iterator_t
 * }

  Pxcb_glx_pbuffer_iterator_t = ^Txcb_glx_pbuffer_iterator_t;
  Txcb_glx_pbuffer_iterator_t = record
      data : Pxcb_glx_pbuffer_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_window_t = ^Txcb_glx_window_t;
  Txcb_glx_window_t = Tuint32_t;
{*
 * @brief xcb_glx_window_iterator_t
 * }

  Pxcb_glx_window_iterator_t = ^Txcb_glx_window_iterator_t;
  Txcb_glx_window_iterator_t = record
      data : Pxcb_glx_window_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_fbconfig_t = ^Txcb_glx_fbconfig_t;
  Txcb_glx_fbconfig_t = Tuint32_t;
{*
 * @brief xcb_glx_fbconfig_iterator_t
 * }

  Pxcb_glx_fbconfig_iterator_t = ^Txcb_glx_fbconfig_iterator_t;
  Txcb_glx_fbconfig_iterator_t = record
      data : Pxcb_glx_fbconfig_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_drawable_t = ^Txcb_glx_drawable_t;
  Txcb_glx_drawable_t = Tuint32_t;
{*
 * @brief xcb_glx_drawable_iterator_t
 * }

  Pxcb_glx_drawable_iterator_t = ^Txcb_glx_drawable_iterator_t;
  Txcb_glx_drawable_iterator_t = record
      data : Pxcb_glx_drawable_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_float32_t = ^Txcb_glx_float32_t;
  Txcb_glx_float32_t = single;
{*
 * @brief xcb_glx_float32_iterator_t
 * }

  Pxcb_glx_float32_iterator_t = ^Txcb_glx_float32_iterator_t;
  Txcb_glx_float32_iterator_t = record
      data : Pxcb_glx_float32_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_float64_t = ^Txcb_glx_float64_t;
  Txcb_glx_float64_t = Tdouble;
{*
 * @brief xcb_glx_float64_iterator_t
 * }

  Pxcb_glx_float64_iterator_t = ^Txcb_glx_float64_iterator_t;
  Txcb_glx_float64_iterator_t = record
      data : Pxcb_glx_float64_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_bool32_t = ^Txcb_glx_bool32_t;
  Txcb_glx_bool32_t = Tuint32_t;
{*
 * @brief xcb_glx_bool32_iterator_t
 * }

  Pxcb_glx_bool32_iterator_t = ^Txcb_glx_bool32_iterator_t;
  Txcb_glx_bool32_iterator_t = record
      data : Pxcb_glx_bool32_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_glx_context_tag_t = ^Txcb_glx_context_tag_t;
  Txcb_glx_context_tag_t = Tuint32_t;
{*
 * @brief xcb_glx_context_tag_iterator_t
 * }

  Pxcb_glx_context_tag_iterator_t = ^Txcb_glx_context_tag_iterator_t;
  Txcb_glx_context_tag_iterator_t = record
      data : Pxcb_glx_context_tag_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_glx_generic.  }

const
  XCB_GLX_GENERIC = -(1);  
{*
 * @brief xcb_glx_generic_error_t
 * }
type
  Pxcb_glx_generic_error_t = ^Txcb_glx_generic_error_t;
  Txcb_glx_generic_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
      pad0 : array[0..20] of Tuint8_t;
    end;
{* Opcode for xcb_glx_bad_context.  }

const
  XCB_GLX_BAD_CONTEXT = 0;  
type
  Pxcb_glx_bad_context_error_t = ^Txcb_glx_bad_context_error_t;
  Txcb_glx_bad_context_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_context_state.  }

const
  XCB_GLX_BAD_CONTEXT_STATE = 1;  
type
  Pxcb_glx_bad_context_state_error_t = ^Txcb_glx_bad_context_state_error_t;
  Txcb_glx_bad_context_state_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_drawable.  }

const
  XCB_GLX_BAD_DRAWABLE = 2;  
type
  Pxcb_glx_bad_drawable_error_t = ^Txcb_glx_bad_drawable_error_t;
  Txcb_glx_bad_drawable_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_pixmap.  }

const
  XCB_GLX_BAD_PIXMAP = 3;  
type
  Pxcb_glx_bad_pixmap_error_t = ^Txcb_glx_bad_pixmap_error_t;
  Txcb_glx_bad_pixmap_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_context_tag.  }

const
  XCB_GLX_BAD_CONTEXT_TAG = 4;  
type
  Pxcb_glx_bad_context_tag_error_t = ^Txcb_glx_bad_context_tag_error_t;
  Txcb_glx_bad_context_tag_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_current_window.  }

const
  XCB_GLX_BAD_CURRENT_WINDOW = 5;  
type
  Pxcb_glx_bad_current_window_error_t = ^Txcb_glx_bad_current_window_error_t;
  Txcb_glx_bad_current_window_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_render_request.  }

const
  XCB_GLX_BAD_RENDER_REQUEST = 6;  
type
  Pxcb_glx_bad_render_request_error_t = ^Txcb_glx_bad_render_request_error_t;
  Txcb_glx_bad_render_request_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_large_request.  }

const
  XCB_GLX_BAD_LARGE_REQUEST = 7;  
type
  Pxcb_glx_bad_large_request_error_t = ^Txcb_glx_bad_large_request_error_t;
  Txcb_glx_bad_large_request_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_unsupported_private_request.  }

const
  XCB_GLX_UNSUPPORTED_PRIVATE_REQUEST = 8;  
type
  Pxcb_glx_unsupported_private_request_error_t = ^Txcb_glx_unsupported_private_request_error_t;
  Txcb_glx_unsupported_private_request_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_fb_config.  }

const
  XCB_GLX_BAD_FB_CONFIG = 9;  
type
  Pxcb_glx_bad_fb_config_error_t = ^Txcb_glx_bad_fb_config_error_t;
  Txcb_glx_bad_fb_config_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_pbuffer.  }

const
  XCB_GLX_BAD_PBUFFER = 10;  
type
  Pxcb_glx_bad_pbuffer_error_t = ^Txcb_glx_bad_pbuffer_error_t;
  Txcb_glx_bad_pbuffer_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_current_drawable.  }

const
  XCB_GLX_BAD_CURRENT_DRAWABLE = 11;  
type
  Pxcb_glx_bad_current_drawable_error_t = ^Txcb_glx_bad_current_drawable_error_t;
  Txcb_glx_bad_current_drawable_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_bad_window.  }

const
  XCB_GLX_BAD_WINDOW = 12;  
type
  Pxcb_glx_bad_window_error_t = ^Txcb_glx_bad_window_error_t;
  Txcb_glx_bad_window_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_glx_bad_profile_arb.  }

const
  XCB_GLX_GLX_BAD_PROFILE_ARB = 13;  
type
  Pxcb_glx_glx_bad_profile_arb_error_t = ^Txcb_glx_glx_bad_profile_arb_error_t;
  Txcb_glx_glx_bad_profile_arb_error_t = Txcb_glx_generic_error_t;
{* Opcode for xcb_glx_pbuffer_clobber.  }

const
  XCB_GLX_PBUFFER_CLOBBER = 0;  
{*
 * @brief xcb_glx_pbuffer_clobber_event_t
 * }
type
  Pxcb_glx_pbuffer_clobber_event_t = ^Txcb_glx_pbuffer_clobber_event_t;
  Txcb_glx_pbuffer_clobber_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event_type : Tuint16_t;
      draw_type : Tuint16_t;
      drawable : Txcb_glx_drawable_t;
      b_mask : Tuint32_t;
      aux_buffer : Tuint16_t;
      x : Tuint16_t;
      y : Tuint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      count : Tuint16_t;
      pad1 : array[0..3] of Tuint8_t;
    end;
{* Opcode for xcb_glx_buffer_swap_complete.  }

const
  XCB_GLX_BUFFER_SWAP_COMPLETE = 1;  
{*
 * @brief xcb_glx_buffer_swap_complete_event_t
 * }
type
  Pxcb_glx_buffer_swap_complete_event_t = ^Txcb_glx_buffer_swap_complete_event_t;
  Txcb_glx_buffer_swap_complete_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event_type : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
      drawable : Txcb_glx_drawable_t;
      ust_hi : Tuint32_t;
      ust_lo : Tuint32_t;
      msc_hi : Tuint32_t;
      msc_lo : Tuint32_t;
      sbc : Tuint32_t;
    end;

  Pxcb_glx_pbcet_t = ^Txcb_glx_pbcet_t;
  Txcb_glx_pbcet_t =  Longint;
  Const
    XCB_GLX_PBCET_DAMAGED = 32791;
    XCB_GLX_PBCET_SAVED = 32792;
;
type
  Pxcb_glx_pbcdt_t = ^Txcb_glx_pbcdt_t;
  Txcb_glx_pbcdt_t =  Longint;
  Const
    XCB_GLX_PBCDT_WINDOW = 32793;
    XCB_GLX_PBCDT_PBUFFER = 32794;
;
{* Opcode for xcb_glx_render.  }
  XCB_GLX_RENDER = 1;  
{*
 * @brief xcb_glx_render_request_t
 * }
type
  Pxcb_glx_render_request_t = ^Txcb_glx_render_request_t;
  Txcb_glx_render_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{* Opcode for xcb_glx_render_large.  }

const
  XCB_GLX_RENDER_LARGE = 2;  
{*
 * @brief xcb_glx_render_large_request_t
 * }
type
  Pxcb_glx_render_large_request_t = ^Txcb_glx_render_large_request_t;
  Txcb_glx_render_large_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      request_num : Tuint16_t;
      request_total : Tuint16_t;
      data_len : Tuint32_t;
    end;
{* Opcode for xcb_glx_create_context.  }

const
  XCB_GLX_CREATE_CONTEXT = 3;  
{*
 * @brief xcb_glx_create_context_request_t
 * }
type
  Pxcb_glx_create_context_request_t = ^Txcb_glx_create_context_request_t;
  Txcb_glx_create_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_glx_context_t;
      visual : Txcb_visualid_t;
      screen : Tuint32_t;
      share_list : Txcb_glx_context_t;
      is_direct : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_glx_destroy_context.  }

const
  XCB_GLX_DESTROY_CONTEXT = 4;  
{*
 * @brief xcb_glx_destroy_context_request_t
 * }
type
  Pxcb_glx_destroy_context_request_t = ^Txcb_glx_destroy_context_request_t;
  Txcb_glx_destroy_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_glx_context_t;
    end;
{*
 * @brief xcb_glx_make_current_cookie_t
 * }

  Pxcb_glx_make_current_cookie_t = ^Txcb_glx_make_current_cookie_t;
  Txcb_glx_make_current_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_make_current.  }

const
  XCB_GLX_MAKE_CURRENT = 5;  
{*
 * @brief xcb_glx_make_current_request_t
 * }
type
  Pxcb_glx_make_current_request_t = ^Txcb_glx_make_current_request_t;
  Txcb_glx_make_current_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_glx_drawable_t;
      context : Txcb_glx_context_t;
      old_context_tag : Txcb_glx_context_tag_t;
    end;
{*
 * @brief xcb_glx_make_current_reply_t
 * }

  Pxcb_glx_make_current_reply_t = ^Txcb_glx_make_current_reply_t;
  Txcb_glx_make_current_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      context_tag : Txcb_glx_context_tag_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_is_direct_cookie_t
 * }

  Pxcb_glx_is_direct_cookie_t = ^Txcb_glx_is_direct_cookie_t;
  Txcb_glx_is_direct_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_is_direct.  }

const
  XCB_GLX_IS_DIRECT = 6;  
{*
 * @brief xcb_glx_is_direct_request_t
 * }
type
  Pxcb_glx_is_direct_request_t = ^Txcb_glx_is_direct_request_t;
  Txcb_glx_is_direct_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_glx_context_t;
    end;
{*
 * @brief xcb_glx_is_direct_reply_t
 * }

  Pxcb_glx_is_direct_reply_t = ^Txcb_glx_is_direct_reply_t;
  Txcb_glx_is_direct_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      is_direct : Tuint8_t;
      pad1 : array[0..22] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_query_version_cookie_t
 * }

  Pxcb_glx_query_version_cookie_t = ^Txcb_glx_query_version_cookie_t;
  Txcb_glx_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_query_version.  }

const
  XCB_GLX_QUERY_VERSION = 7;  
{*
 * @brief xcb_glx_query_version_request_t
 * }
type
  Pxcb_glx_query_version_request_t = ^Txcb_glx_query_version_request_t;
  Txcb_glx_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_glx_query_version_reply_t
 * }

  Pxcb_glx_query_version_reply_t = ^Txcb_glx_query_version_reply_t;
  Txcb_glx_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_glx_wait_gl.  }

const
  XCB_GLX_WAIT_GL = 8;  
{*
 * @brief xcb_glx_wait_gl_request_t
 * }
type
  Pxcb_glx_wait_gl_request_t = ^Txcb_glx_wait_gl_request_t;
  Txcb_glx_wait_gl_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{* Opcode for xcb_glx_wait_x.  }

const
  XCB_GLX_WAIT_X = 9;  
{*
 * @brief xcb_glx_wait_x_request_t
 * }
type
  Pxcb_glx_wait_x_request_t = ^Txcb_glx_wait_x_request_t;
  Txcb_glx_wait_x_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{* Opcode for xcb_glx_copy_context.  }

const
  XCB_GLX_COPY_CONTEXT = 10;  
{*
 * @brief xcb_glx_copy_context_request_t
 * }
type
  Pxcb_glx_copy_context_request_t = ^Txcb_glx_copy_context_request_t;
  Txcb_glx_copy_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      src : Txcb_glx_context_t;
      dest : Txcb_glx_context_t;
      mask : Tuint32_t;
      src_context_tag : Txcb_glx_context_tag_t;
    end;

  Pxcb_glx_gc_t = ^Txcb_glx_gc_t;
  Txcb_glx_gc_t =  Longint;
  Const
    XCB_GLX_GC_GL_CURRENT_BIT = 1;
    XCB_GLX_GC_GL_POINT_BIT = 2;
    XCB_GLX_GC_GL_LINE_BIT = 4;
    XCB_GLX_GC_GL_POLYGON_BIT = 8;
    XCB_GLX_GC_GL_POLYGON_STIPPLE_BIT = 16;
    XCB_GLX_GC_GL_PIXEL_MODE_BIT = 32;
    XCB_GLX_GC_GL_LIGHTING_BIT = 64;
    XCB_GLX_GC_GL_FOG_BIT = 128;
    XCB_GLX_GC_GL_DEPTH_BUFFER_BIT = 256;
    XCB_GLX_GC_GL_ACCUM_BUFFER_BIT = 512;
    XCB_GLX_GC_GL_STENCIL_BUFFER_BIT = 1024;
    XCB_GLX_GC_GL_VIEWPORT_BIT = 2048;
    XCB_GLX_GC_GL_TRANSFORM_BIT = 4096;
    XCB_GLX_GC_GL_ENABLE_BIT = 8192;
    XCB_GLX_GC_GL_COLOR_BUFFER_BIT = 16384;
    XCB_GLX_GC_GL_HINT_BIT = 32768;
    XCB_GLX_GC_GL_EVAL_BIT = 65536;
    XCB_GLX_GC_GL_LIST_BIT = 131072;
    XCB_GLX_GC_GL_TEXTURE_BIT = 262144;
    XCB_GLX_GC_GL_SCISSOR_BIT = 524288;
    XCB_GLX_GC_GL_ALL_ATTRIB_BITS = 16777215;
;
{* Opcode for xcb_glx_swap_buffers.  }
  XCB_GLX_SWAP_BUFFERS = 11;  
{*
 * @brief xcb_glx_swap_buffers_request_t
 * }
type
  Pxcb_glx_swap_buffers_request_t = ^Txcb_glx_swap_buffers_request_t;
  Txcb_glx_swap_buffers_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      drawable : Txcb_glx_drawable_t;
    end;
{* Opcode for xcb_glx_use_x_font.  }

const
  XCB_GLX_USE_X_FONT = 12;  
{*
 * @brief xcb_glx_use_x_font_request_t
 * }
type
  Pxcb_glx_use_x_font_request_t = ^Txcb_glx_use_x_font_request_t;
  Txcb_glx_use_x_font_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      font : Txcb_font_t;
      first : Tuint32_t;
      count : Tuint32_t;
      list_base : Tuint32_t;
    end;
{* Opcode for xcb_glx_create_glx_pixmap.  }

const
  XCB_GLX_CREATE_GLX_PIXMAP = 13;  
{*
 * @brief xcb_glx_create_glx_pixmap_request_t
 * }
type
  Pxcb_glx_create_glx_pixmap_request_t = ^Txcb_glx_create_glx_pixmap_request_t;
  Txcb_glx_create_glx_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      visual : Txcb_visualid_t;
      pixmap : Txcb_pixmap_t;
      glx_pixmap : Txcb_glx_pixmap_t;
    end;
{*
 * @brief xcb_glx_get_visual_configs_cookie_t
 * }

  Pxcb_glx_get_visual_configs_cookie_t = ^Txcb_glx_get_visual_configs_cookie_t;
  Txcb_glx_get_visual_configs_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_visual_configs.  }

const
  XCB_GLX_GET_VISUAL_CONFIGS = 14;  
{*
 * @brief xcb_glx_get_visual_configs_request_t
 * }
type
  Pxcb_glx_get_visual_configs_request_t = ^Txcb_glx_get_visual_configs_request_t;
  Txcb_glx_get_visual_configs_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_visual_configs_reply_t
 * }

  Pxcb_glx_get_visual_configs_reply_t = ^Txcb_glx_get_visual_configs_reply_t;
  Txcb_glx_get_visual_configs_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_visuals : Tuint32_t;
      num_properties : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_glx_destroy_glx_pixmap.  }

const
  XCB_GLX_DESTROY_GLX_PIXMAP = 15;  
{*
 * @brief xcb_glx_destroy_glx_pixmap_request_t
 * }
type
  Pxcb_glx_destroy_glx_pixmap_request_t = ^Txcb_glx_destroy_glx_pixmap_request_t;
  Txcb_glx_destroy_glx_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      glx_pixmap : Txcb_glx_pixmap_t;
    end;
{* Opcode for xcb_glx_vendor_private.  }

const
  XCB_GLX_VENDOR_PRIVATE = 16;  
{*
 * @brief xcb_glx_vendor_private_request_t
 * }
type
  Pxcb_glx_vendor_private_request_t = ^Txcb_glx_vendor_private_request_t;
  Txcb_glx_vendor_private_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      vendor_code : Tuint32_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{*
 * @brief xcb_glx_vendor_private_with_reply_cookie_t
 * }

  Pxcb_glx_vendor_private_with_reply_cookie_t = ^Txcb_glx_vendor_private_with_reply_cookie_t;
  Txcb_glx_vendor_private_with_reply_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_vendor_private_with_reply.  }

const
  XCB_GLX_VENDOR_PRIVATE_WITH_REPLY = 17;  
{*
 * @brief xcb_glx_vendor_private_with_reply_request_t
 * }
type
  Pxcb_glx_vendor_private_with_reply_request_t = ^Txcb_glx_vendor_private_with_reply_request_t;
  Txcb_glx_vendor_private_with_reply_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      vendor_code : Tuint32_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{*
 * @brief xcb_glx_vendor_private_with_reply_reply_t
 * }

  Pxcb_glx_vendor_private_with_reply_reply_t = ^Txcb_glx_vendor_private_with_reply_reply_t;
  Txcb_glx_vendor_private_with_reply_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      retval : Tuint32_t;
      data1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_query_extensions_string_cookie_t
 * }

  Pxcb_glx_query_extensions_string_cookie_t = ^Txcb_glx_query_extensions_string_cookie_t;
  Txcb_glx_query_extensions_string_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_query_extensions_string.  }

const
  XCB_GLX_QUERY_EXTENSIONS_STRING = 18;  
{*
 * @brief xcb_glx_query_extensions_string_request_t
 * }
type
  Pxcb_glx_query_extensions_string_request_t = ^Txcb_glx_query_extensions_string_request_t;
  Txcb_glx_query_extensions_string_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_glx_query_extensions_string_reply_t
 * }

  Pxcb_glx_query_extensions_string_reply_t = ^Txcb_glx_query_extensions_string_reply_t;
  Txcb_glx_query_extensions_string_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      pad2 : array[0..15] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_query_server_string_cookie_t
 * }

  Pxcb_glx_query_server_string_cookie_t = ^Txcb_glx_query_server_string_cookie_t;
  Txcb_glx_query_server_string_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_query_server_string.  }

const
  XCB_GLX_QUERY_SERVER_STRING = 19;  
{*
 * @brief xcb_glx_query_server_string_request_t
 * }
type
  Pxcb_glx_query_server_string_request_t = ^Txcb_glx_query_server_string_request_t;
  Txcb_glx_query_server_string_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      name : Tuint32_t;
    end;
{*
 * @brief xcb_glx_query_server_string_reply_t
 * }

  Pxcb_glx_query_server_string_reply_t = ^Txcb_glx_query_server_string_reply_t;
  Txcb_glx_query_server_string_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      str_len : Tuint32_t;
      pad2 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_glx_client_info.  }

const
  XCB_GLX_CLIENT_INFO = 20;  
{*
 * @brief xcb_glx_client_info_request_t
 * }
type
  Pxcb_glx_client_info_request_t = ^Txcb_glx_client_info_request_t;
  Txcb_glx_client_info_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      str_len : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_fb_configs_cookie_t
 * }

  Pxcb_glx_get_fb_configs_cookie_t = ^Txcb_glx_get_fb_configs_cookie_t;
  Txcb_glx_get_fb_configs_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_fb_configs.  }

const
  XCB_GLX_GET_FB_CONFIGS = 21;  
{*
 * @brief xcb_glx_get_fb_configs_request_t
 * }
type
  Pxcb_glx_get_fb_configs_request_t = ^Txcb_glx_get_fb_configs_request_t;
  Txcb_glx_get_fb_configs_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_fb_configs_reply_t
 * }

  Pxcb_glx_get_fb_configs_reply_t = ^Txcb_glx_get_fb_configs_reply_t;
  Txcb_glx_get_fb_configs_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_FB_configs : Tuint32_t;
      num_properties : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_glx_create_pixmap.  }

const
  XCB_GLX_CREATE_PIXMAP = 22;  
{*
 * @brief xcb_glx_create_pixmap_request_t
 * }
type
  Pxcb_glx_create_pixmap_request_t = ^Txcb_glx_create_pixmap_request_t;
  Txcb_glx_create_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      fbconfig : Txcb_glx_fbconfig_t;
      pixmap : Txcb_pixmap_t;
      glx_pixmap : Txcb_glx_pixmap_t;
      num_attribs : Tuint32_t;
    end;
{* Opcode for xcb_glx_destroy_pixmap.  }

const
  XCB_GLX_DESTROY_PIXMAP = 23;  
{*
 * @brief xcb_glx_destroy_pixmap_request_t
 * }
type
  Pxcb_glx_destroy_pixmap_request_t = ^Txcb_glx_destroy_pixmap_request_t;
  Txcb_glx_destroy_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      glx_pixmap : Txcb_glx_pixmap_t;
    end;
{* Opcode for xcb_glx_create_new_context.  }

const
  XCB_GLX_CREATE_NEW_CONTEXT = 24;  
{*
 * @brief xcb_glx_create_new_context_request_t
 * }
type
  Pxcb_glx_create_new_context_request_t = ^Txcb_glx_create_new_context_request_t;
  Txcb_glx_create_new_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_glx_context_t;
      fbconfig : Txcb_glx_fbconfig_t;
      screen : Tuint32_t;
      render_type : Tuint32_t;
      share_list : Txcb_glx_context_t;
      is_direct : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_query_context_cookie_t
 * }

  Pxcb_glx_query_context_cookie_t = ^Txcb_glx_query_context_cookie_t;
  Txcb_glx_query_context_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_query_context.  }

const
  XCB_GLX_QUERY_CONTEXT = 25;  
{*
 * @brief xcb_glx_query_context_request_t
 * }
type
  Pxcb_glx_query_context_request_t = ^Txcb_glx_query_context_request_t;
  Txcb_glx_query_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_glx_context_t;
    end;
{*
 * @brief xcb_glx_query_context_reply_t
 * }

  Pxcb_glx_query_context_reply_t = ^Txcb_glx_query_context_reply_t;
  Txcb_glx_query_context_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_attribs : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_make_context_current_cookie_t
 * }

  Pxcb_glx_make_context_current_cookie_t = ^Txcb_glx_make_context_current_cookie_t;
  Txcb_glx_make_context_current_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_make_context_current.  }

const
  XCB_GLX_MAKE_CONTEXT_CURRENT = 26;  
{*
 * @brief xcb_glx_make_context_current_request_t
 * }
type
  Pxcb_glx_make_context_current_request_t = ^Txcb_glx_make_context_current_request_t;
  Txcb_glx_make_context_current_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      old_context_tag : Txcb_glx_context_tag_t;
      drawable : Txcb_glx_drawable_t;
      read_drawable : Txcb_glx_drawable_t;
      context : Txcb_glx_context_t;
    end;
{*
 * @brief xcb_glx_make_context_current_reply_t
 * }

  Pxcb_glx_make_context_current_reply_t = ^Txcb_glx_make_context_current_reply_t;
  Txcb_glx_make_context_current_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      context_tag : Txcb_glx_context_tag_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_glx_create_pbuffer.  }

const
  XCB_GLX_CREATE_PBUFFER = 27;  
{*
 * @brief xcb_glx_create_pbuffer_request_t
 * }
type
  Pxcb_glx_create_pbuffer_request_t = ^Txcb_glx_create_pbuffer_request_t;
  Txcb_glx_create_pbuffer_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      fbconfig : Txcb_glx_fbconfig_t;
      pbuffer : Txcb_glx_pbuffer_t;
      num_attribs : Tuint32_t;
    end;
{* Opcode for xcb_glx_destroy_pbuffer.  }

const
  XCB_GLX_DESTROY_PBUFFER = 28;  
{*
 * @brief xcb_glx_destroy_pbuffer_request_t
 * }
type
  Pxcb_glx_destroy_pbuffer_request_t = ^Txcb_glx_destroy_pbuffer_request_t;
  Txcb_glx_destroy_pbuffer_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pbuffer : Txcb_glx_pbuffer_t;
    end;
{*
 * @brief xcb_glx_get_drawable_attributes_cookie_t
 * }

  Pxcb_glx_get_drawable_attributes_cookie_t = ^Txcb_glx_get_drawable_attributes_cookie_t;
  Txcb_glx_get_drawable_attributes_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_drawable_attributes.  }

const
  XCB_GLX_GET_DRAWABLE_ATTRIBUTES = 29;  
{*
 * @brief xcb_glx_get_drawable_attributes_request_t
 * }
type
  Pxcb_glx_get_drawable_attributes_request_t = ^Txcb_glx_get_drawable_attributes_request_t;
  Txcb_glx_get_drawable_attributes_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_glx_drawable_t;
    end;
{*
 * @brief xcb_glx_get_drawable_attributes_reply_t
 * }

  Pxcb_glx_get_drawable_attributes_reply_t = ^Txcb_glx_get_drawable_attributes_reply_t;
  Txcb_glx_get_drawable_attributes_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_attribs : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_glx_change_drawable_attributes.  }

const
  XCB_GLX_CHANGE_DRAWABLE_ATTRIBUTES = 30;  
{*
 * @brief xcb_glx_change_drawable_attributes_request_t
 * }
type
  Pxcb_glx_change_drawable_attributes_request_t = ^Txcb_glx_change_drawable_attributes_request_t;
  Txcb_glx_change_drawable_attributes_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_glx_drawable_t;
      num_attribs : Tuint32_t;
    end;
{* Opcode for xcb_glx_create_window.  }

const
  XCB_GLX_CREATE_WINDOW = 31;  
{*
 * @brief xcb_glx_create_window_request_t
 * }
type
  Pxcb_glx_create_window_request_t = ^Txcb_glx_create_window_request_t;
  Txcb_glx_create_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      fbconfig : Txcb_glx_fbconfig_t;
      window : Txcb_window_t;
      glx_window : Txcb_glx_window_t;
      num_attribs : Tuint32_t;
    end;
{* Opcode for xcb_glx_delete_window.  }

const
  XCB_GLX_DELETE_WINDOW = 32;  
{*
 * @brief xcb_glx_delete_window_request_t
 * }
type
  Pxcb_glx_delete_window_request_t = ^Txcb_glx_delete_window_request_t;
  Txcb_glx_delete_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      glxwindow : Txcb_glx_window_t;
    end;
{* Opcode for xcb_glx_set_client_info_arb.  }

const
  XCB_GLX_SET_CLIENT_INFO_ARB = 33;  
{*
 * @brief xcb_glx_set_client_info_arb_request_t
 * }
type
  Pxcb_glx_set_client_info_arb_request_t = ^Txcb_glx_set_client_info_arb_request_t;
  Txcb_glx_set_client_info_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      num_versions : Tuint32_t;
      gl_str_len : Tuint32_t;
      glx_str_len : Tuint32_t;
    end;
{* Opcode for xcb_glx_create_context_attribs_arb.  }

const
  XCB_GLX_CREATE_CONTEXT_ATTRIBS_ARB = 34;  
{*
 * @brief xcb_glx_create_context_attribs_arb_request_t
 * }
type
  Pxcb_glx_create_context_attribs_arb_request_t = ^Txcb_glx_create_context_attribs_arb_request_t;
  Txcb_glx_create_context_attribs_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_glx_context_t;
      fbconfig : Txcb_glx_fbconfig_t;
      screen : Tuint32_t;
      share_list : Txcb_glx_context_t;
      is_direct : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      num_attribs : Tuint32_t;
    end;
{* Opcode for xcb_glx_set_client_info_2arb.  }

const
  XCB_GLX_SET_CLIENT_INFO_2ARB = 35;  
{*
 * @brief xcb_glx_set_client_info_2arb_request_t
 * }
type
  Pxcb_glx_set_client_info_2arb_request_t = ^Txcb_glx_set_client_info_2arb_request_t;
  Txcb_glx_set_client_info_2arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      num_versions : Tuint32_t;
      gl_str_len : Tuint32_t;
      glx_str_len : Tuint32_t;
    end;
{* Opcode for xcb_glx_new_list.  }

const
  XCB_GLX_NEW_LIST = 101;  
{*
 * @brief xcb_glx_new_list_request_t
 * }
type
  Pxcb_glx_new_list_request_t = ^Txcb_glx_new_list_request_t;
  Txcb_glx_new_list_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      list : Tuint32_t;
      mode : Tuint32_t;
    end;
{* Opcode for xcb_glx_end_list.  }

const
  XCB_GLX_END_LIST = 102;  
{*
 * @brief xcb_glx_end_list_request_t
 * }
type
  Pxcb_glx_end_list_request_t = ^Txcb_glx_end_list_request_t;
  Txcb_glx_end_list_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{* Opcode for xcb_glx_delete_lists.  }

const
  XCB_GLX_DELETE_LISTS = 103;  
{*
 * @brief xcb_glx_delete_lists_request_t
 * }
type
  Pxcb_glx_delete_lists_request_t = ^Txcb_glx_delete_lists_request_t;
  Txcb_glx_delete_lists_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      list : Tuint32_t;
      range : Tint32_t;
    end;
{*
 * @brief xcb_glx_gen_lists_cookie_t
 * }

  Pxcb_glx_gen_lists_cookie_t = ^Txcb_glx_gen_lists_cookie_t;
  Txcb_glx_gen_lists_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_gen_lists.  }

const
  XCB_GLX_GEN_LISTS = 104;  
{*
 * @brief xcb_glx_gen_lists_request_t
 * }
type
  Pxcb_glx_gen_lists_request_t = ^Txcb_glx_gen_lists_request_t;
  Txcb_glx_gen_lists_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      range : Tint32_t;
    end;
{*
 * @brief xcb_glx_gen_lists_reply_t
 * }

  Pxcb_glx_gen_lists_reply_t = ^Txcb_glx_gen_lists_reply_t;
  Txcb_glx_gen_lists_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Tuint32_t;
    end;
{* Opcode for xcb_glx_feedback_buffer.  }

const
  XCB_GLX_FEEDBACK_BUFFER = 105;  
{*
 * @brief xcb_glx_feedback_buffer_request_t
 * }
type
  Pxcb_glx_feedback_buffer_request_t = ^Txcb_glx_feedback_buffer_request_t;
  Txcb_glx_feedback_buffer_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      size : Tint32_t;
      _type : Tint32_t;
    end;
{* Opcode for xcb_glx_select_buffer.  }

const
  XCB_GLX_SELECT_BUFFER = 106;  
{*
 * @brief xcb_glx_select_buffer_request_t
 * }
type
  Pxcb_glx_select_buffer_request_t = ^Txcb_glx_select_buffer_request_t;
  Txcb_glx_select_buffer_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      size : Tint32_t;
    end;
{*
 * @brief xcb_glx_render_mode_cookie_t
 * }

  Pxcb_glx_render_mode_cookie_t = ^Txcb_glx_render_mode_cookie_t;
  Txcb_glx_render_mode_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_render_mode.  }

const
  XCB_GLX_RENDER_MODE = 107;  
{*
 * @brief xcb_glx_render_mode_request_t
 * }
type
  Pxcb_glx_render_mode_request_t = ^Txcb_glx_render_mode_request_t;
  Txcb_glx_render_mode_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      mode : Tuint32_t;
    end;
{*
 * @brief xcb_glx_render_mode_reply_t
 * }

  Pxcb_glx_render_mode_reply_t = ^Txcb_glx_render_mode_reply_t;
  Txcb_glx_render_mode_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Tuint32_t;
      n : Tuint32_t;
      new_mode : Tuint32_t;
      pad1 : array[0..11] of Tuint8_t;
    end;

  Pxcb_glx_rm_t = ^Txcb_glx_rm_t;
  Txcb_glx_rm_t =  Longint;
  Const
    XCB_GLX_RM_GL_RENDER = 7168;
    XCB_GLX_RM_GL_FEEDBACK = 7169;
    XCB_GLX_RM_GL_SELECT = 7170;
;
{*
 * @brief xcb_glx_finish_cookie_t
 * }
type
  Pxcb_glx_finish_cookie_t = ^Txcb_glx_finish_cookie_t;
  Txcb_glx_finish_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_finish.  }

const
  XCB_GLX_FINISH = 108;  
{*
 * @brief xcb_glx_finish_request_t
 * }
type
  Pxcb_glx_finish_request_t = ^Txcb_glx_finish_request_t;
  Txcb_glx_finish_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{*
 * @brief xcb_glx_finish_reply_t
 * }

  Pxcb_glx_finish_reply_t = ^Txcb_glx_finish_reply_t;
  Txcb_glx_finish_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{* Opcode for xcb_glx_pixel_storef.  }

const
  XCB_GLX_PIXEL_STOREF = 109;  
{*
 * @brief xcb_glx_pixel_storef_request_t
 * }
type
  Pxcb_glx_pixel_storef_request_t = ^Txcb_glx_pixel_storef_request_t;
  Txcb_glx_pixel_storef_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      pname : Tuint32_t;
      datum : Txcb_glx_float32_t;
    end;
{* Opcode for xcb_glx_pixel_storei.  }

const
  XCB_GLX_PIXEL_STOREI = 110;  
{*
 * @brief xcb_glx_pixel_storei_request_t
 * }
type
  Pxcb_glx_pixel_storei_request_t = ^Txcb_glx_pixel_storei_request_t;
  Txcb_glx_pixel_storei_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      pname : Tuint32_t;
      datum : Tint32_t;
    end;
{*
 * @brief xcb_glx_read_pixels_cookie_t
 * }

  Pxcb_glx_read_pixels_cookie_t = ^Txcb_glx_read_pixels_cookie_t;
  Txcb_glx_read_pixels_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_read_pixels.  }

const
  XCB_GLX_READ_PIXELS = 111;  
{*
 * @brief xcb_glx_read_pixels_request_t
 * }
type
  Pxcb_glx_read_pixels_request_t = ^Txcb_glx_read_pixels_request_t;
  Txcb_glx_read_pixels_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      x : Tint32_t;
      y : Tint32_t;
      width : Tint32_t;
      height : Tint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
      lsb_first : Tuint8_t;
    end;
{*
 * @brief xcb_glx_read_pixels_reply_t
 * }

  Pxcb_glx_read_pixels_reply_t = ^Txcb_glx_read_pixels_reply_t;
  Txcb_glx_read_pixels_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_booleanv_cookie_t
 * }

  Pxcb_glx_get_booleanv_cookie_t = ^Txcb_glx_get_booleanv_cookie_t;
  Txcb_glx_get_booleanv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_booleanv.  }

const
  XCB_GLX_GET_BOOLEANV = 112;  
{*
 * @brief xcb_glx_get_booleanv_request_t
 * }
type
  Pxcb_glx_get_booleanv_request_t = ^Txcb_glx_get_booleanv_request_t;
  Txcb_glx_get_booleanv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      pname : Tint32_t;
    end;
{*
 * @brief xcb_glx_get_booleanv_reply_t
 * }

  Pxcb_glx_get_booleanv_reply_t = ^Txcb_glx_get_booleanv_reply_t;
  Txcb_glx_get_booleanv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tuint8_t;
      pad2 : array[0..14] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_clip_plane_cookie_t
 * }

  Pxcb_glx_get_clip_plane_cookie_t = ^Txcb_glx_get_clip_plane_cookie_t;
  Txcb_glx_get_clip_plane_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_clip_plane.  }

const
  XCB_GLX_GET_CLIP_PLANE = 113;  
{*
 * @brief xcb_glx_get_clip_plane_request_t
 * }
type
  Pxcb_glx_get_clip_plane_request_t = ^Txcb_glx_get_clip_plane_request_t;
  Txcb_glx_get_clip_plane_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      plane : Tint32_t;
    end;
{*
 * @brief xcb_glx_get_clip_plane_reply_t
 * }

  Pxcb_glx_get_clip_plane_reply_t = ^Txcb_glx_get_clip_plane_reply_t;
  Txcb_glx_get_clip_plane_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_doublev_cookie_t
 * }

  Pxcb_glx_get_doublev_cookie_t = ^Txcb_glx_get_doublev_cookie_t;
  Txcb_glx_get_doublev_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_doublev.  }

const
  XCB_GLX_GET_DOUBLEV = 114;  
{*
 * @brief xcb_glx_get_doublev_request_t
 * }
type
  Pxcb_glx_get_doublev_request_t = ^Txcb_glx_get_doublev_request_t;
  Txcb_glx_get_doublev_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_doublev_reply_t
 * }

  Pxcb_glx_get_doublev_reply_t = ^Txcb_glx_get_doublev_reply_t;
  Txcb_glx_get_doublev_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float64_t;
      pad2 : array[0..7] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_error_cookie_t
 * }

  Pxcb_glx_get_error_cookie_t = ^Txcb_glx_get_error_cookie_t;
  Txcb_glx_get_error_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_error.  }

const
  XCB_GLX_GET_ERROR = 115;  
{*
 * @brief xcb_glx_get_error_request_t
 * }
type
  Pxcb_glx_get_error_request_t = ^Txcb_glx_get_error_request_t;
  Txcb_glx_get_error_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{*
 * @brief xcb_glx_get_error_reply_t
 * }

  Pxcb_glx_get_error_reply_t = ^Txcb_glx_get_error_reply_t;
  Txcb_glx_get_error_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      error : Tint32_t;
    end;
{*
 * @brief xcb_glx_get_floatv_cookie_t
 * }

  Pxcb_glx_get_floatv_cookie_t = ^Txcb_glx_get_floatv_cookie_t;
  Txcb_glx_get_floatv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_floatv.  }

const
  XCB_GLX_GET_FLOATV = 116;  
{*
 * @brief xcb_glx_get_floatv_request_t
 * }
type
  Pxcb_glx_get_floatv_request_t = ^Txcb_glx_get_floatv_request_t;
  Txcb_glx_get_floatv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_floatv_reply_t
 * }

  Pxcb_glx_get_floatv_reply_t = ^Txcb_glx_get_floatv_reply_t;
  Txcb_glx_get_floatv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_integerv_cookie_t
 * }

  Pxcb_glx_get_integerv_cookie_t = ^Txcb_glx_get_integerv_cookie_t;
  Txcb_glx_get_integerv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_integerv.  }

const
  XCB_GLX_GET_INTEGERV = 117;  
{*
 * @brief xcb_glx_get_integerv_request_t
 * }
type
  Pxcb_glx_get_integerv_request_t = ^Txcb_glx_get_integerv_request_t;
  Txcb_glx_get_integerv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_integerv_reply_t
 * }

  Pxcb_glx_get_integerv_reply_t = ^Txcb_glx_get_integerv_reply_t;
  Txcb_glx_get_integerv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_lightfv_cookie_t
 * }

  Pxcb_glx_get_lightfv_cookie_t = ^Txcb_glx_get_lightfv_cookie_t;
  Txcb_glx_get_lightfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_lightfv.  }

const
  XCB_GLX_GET_LIGHTFV = 118;  
{*
 * @brief xcb_glx_get_lightfv_request_t
 * }
type
  Pxcb_glx_get_lightfv_request_t = ^Txcb_glx_get_lightfv_request_t;
  Txcb_glx_get_lightfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      light : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_lightfv_reply_t
 * }

  Pxcb_glx_get_lightfv_reply_t = ^Txcb_glx_get_lightfv_reply_t;
  Txcb_glx_get_lightfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_lightiv_cookie_t
 * }

  Pxcb_glx_get_lightiv_cookie_t = ^Txcb_glx_get_lightiv_cookie_t;
  Txcb_glx_get_lightiv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_lightiv.  }

const
  XCB_GLX_GET_LIGHTIV = 119;  
{*
 * @brief xcb_glx_get_lightiv_request_t
 * }
type
  Pxcb_glx_get_lightiv_request_t = ^Txcb_glx_get_lightiv_request_t;
  Txcb_glx_get_lightiv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      light : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_lightiv_reply_t
 * }

  Pxcb_glx_get_lightiv_reply_t = ^Txcb_glx_get_lightiv_reply_t;
  Txcb_glx_get_lightiv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_mapdv_cookie_t
 * }

  Pxcb_glx_get_mapdv_cookie_t = ^Txcb_glx_get_mapdv_cookie_t;
  Txcb_glx_get_mapdv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_mapdv.  }

const
  XCB_GLX_GET_MAPDV = 120;  
{*
 * @brief xcb_glx_get_mapdv_request_t
 * }
type
  Pxcb_glx_get_mapdv_request_t = ^Txcb_glx_get_mapdv_request_t;
  Txcb_glx_get_mapdv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      query : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_mapdv_reply_t
 * }

  Pxcb_glx_get_mapdv_reply_t = ^Txcb_glx_get_mapdv_reply_t;
  Txcb_glx_get_mapdv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float64_t;
      pad2 : array[0..7] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_mapfv_cookie_t
 * }

  Pxcb_glx_get_mapfv_cookie_t = ^Txcb_glx_get_mapfv_cookie_t;
  Txcb_glx_get_mapfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_mapfv.  }

const
  XCB_GLX_GET_MAPFV = 121;  
{*
 * @brief xcb_glx_get_mapfv_request_t
 * }
type
  Pxcb_glx_get_mapfv_request_t = ^Txcb_glx_get_mapfv_request_t;
  Txcb_glx_get_mapfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      query : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_mapfv_reply_t
 * }

  Pxcb_glx_get_mapfv_reply_t = ^Txcb_glx_get_mapfv_reply_t;
  Txcb_glx_get_mapfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_mapiv_cookie_t
 * }

  Pxcb_glx_get_mapiv_cookie_t = ^Txcb_glx_get_mapiv_cookie_t;
  Txcb_glx_get_mapiv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_mapiv.  }

const
  XCB_GLX_GET_MAPIV = 122;  
{*
 * @brief xcb_glx_get_mapiv_request_t
 * }
type
  Pxcb_glx_get_mapiv_request_t = ^Txcb_glx_get_mapiv_request_t;
  Txcb_glx_get_mapiv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      query : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_mapiv_reply_t
 * }

  Pxcb_glx_get_mapiv_reply_t = ^Txcb_glx_get_mapiv_reply_t;
  Txcb_glx_get_mapiv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_materialfv_cookie_t
 * }

  Pxcb_glx_get_materialfv_cookie_t = ^Txcb_glx_get_materialfv_cookie_t;
  Txcb_glx_get_materialfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_materialfv.  }

const
  XCB_GLX_GET_MATERIALFV = 123;  
{*
 * @brief xcb_glx_get_materialfv_request_t
 * }
type
  Pxcb_glx_get_materialfv_request_t = ^Txcb_glx_get_materialfv_request_t;
  Txcb_glx_get_materialfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      face : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_materialfv_reply_t
 * }

  Pxcb_glx_get_materialfv_reply_t = ^Txcb_glx_get_materialfv_reply_t;
  Txcb_glx_get_materialfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_materialiv_cookie_t
 * }

  Pxcb_glx_get_materialiv_cookie_t = ^Txcb_glx_get_materialiv_cookie_t;
  Txcb_glx_get_materialiv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_materialiv.  }

const
  XCB_GLX_GET_MATERIALIV = 124;  
{*
 * @brief xcb_glx_get_materialiv_request_t
 * }
type
  Pxcb_glx_get_materialiv_request_t = ^Txcb_glx_get_materialiv_request_t;
  Txcb_glx_get_materialiv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      face : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_materialiv_reply_t
 * }

  Pxcb_glx_get_materialiv_reply_t = ^Txcb_glx_get_materialiv_reply_t;
  Txcb_glx_get_materialiv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_pixel_mapfv_cookie_t
 * }

  Pxcb_glx_get_pixel_mapfv_cookie_t = ^Txcb_glx_get_pixel_mapfv_cookie_t;
  Txcb_glx_get_pixel_mapfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_pixel_mapfv.  }

const
  XCB_GLX_GET_PIXEL_MAPFV = 125;  
{*
 * @brief xcb_glx_get_pixel_mapfv_request_t
 * }
type
  Pxcb_glx_get_pixel_mapfv_request_t = ^Txcb_glx_get_pixel_mapfv_request_t;
  Txcb_glx_get_pixel_mapfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      map : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_pixel_mapfv_reply_t
 * }

  Pxcb_glx_get_pixel_mapfv_reply_t = ^Txcb_glx_get_pixel_mapfv_reply_t;
  Txcb_glx_get_pixel_mapfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_pixel_mapuiv_cookie_t
 * }

  Pxcb_glx_get_pixel_mapuiv_cookie_t = ^Txcb_glx_get_pixel_mapuiv_cookie_t;
  Txcb_glx_get_pixel_mapuiv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_pixel_mapuiv.  }

const
  XCB_GLX_GET_PIXEL_MAPUIV = 126;  
{*
 * @brief xcb_glx_get_pixel_mapuiv_request_t
 * }
type
  Pxcb_glx_get_pixel_mapuiv_request_t = ^Txcb_glx_get_pixel_mapuiv_request_t;
  Txcb_glx_get_pixel_mapuiv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      map : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_pixel_mapuiv_reply_t
 * }

  Pxcb_glx_get_pixel_mapuiv_reply_t = ^Txcb_glx_get_pixel_mapuiv_reply_t;
  Txcb_glx_get_pixel_mapuiv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tuint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_pixel_mapusv_cookie_t
 * }

  Pxcb_glx_get_pixel_mapusv_cookie_t = ^Txcb_glx_get_pixel_mapusv_cookie_t;
  Txcb_glx_get_pixel_mapusv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_pixel_mapusv.  }

const
  XCB_GLX_GET_PIXEL_MAPUSV = 127;  
{*
 * @brief xcb_glx_get_pixel_mapusv_request_t
 * }
type
  Pxcb_glx_get_pixel_mapusv_request_t = ^Txcb_glx_get_pixel_mapusv_request_t;
  Txcb_glx_get_pixel_mapusv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      map : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_pixel_mapusv_reply_t
 * }

  Pxcb_glx_get_pixel_mapusv_reply_t = ^Txcb_glx_get_pixel_mapusv_reply_t;
  Txcb_glx_get_pixel_mapusv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tuint16_t;
      pad2 : array[0..15] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_polygon_stipple_cookie_t
 * }

  Pxcb_glx_get_polygon_stipple_cookie_t = ^Txcb_glx_get_polygon_stipple_cookie_t;
  Txcb_glx_get_polygon_stipple_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_polygon_stipple.  }

const
  XCB_GLX_GET_POLYGON_STIPPLE = 128;  
{*
 * @brief xcb_glx_get_polygon_stipple_request_t
 * }
type
  Pxcb_glx_get_polygon_stipple_request_t = ^Txcb_glx_get_polygon_stipple_request_t;
  Txcb_glx_get_polygon_stipple_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      lsb_first : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_polygon_stipple_reply_t
 * }

  Pxcb_glx_get_polygon_stipple_reply_t = ^Txcb_glx_get_polygon_stipple_reply_t;
  Txcb_glx_get_polygon_stipple_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_string_cookie_t
 * }

  Pxcb_glx_get_string_cookie_t = ^Txcb_glx_get_string_cookie_t;
  Txcb_glx_get_string_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_string.  }

const
  XCB_GLX_GET_STRING = 129;  
{*
 * @brief xcb_glx_get_string_request_t
 * }
type
  Pxcb_glx_get_string_request_t = ^Txcb_glx_get_string_request_t;
  Txcb_glx_get_string_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      name : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_string_reply_t
 * }

  Pxcb_glx_get_string_reply_t = ^Txcb_glx_get_string_reply_t;
  Txcb_glx_get_string_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      pad2 : array[0..15] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_envfv_cookie_t
 * }

  Pxcb_glx_get_tex_envfv_cookie_t = ^Txcb_glx_get_tex_envfv_cookie_t;
  Txcb_glx_get_tex_envfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_envfv.  }

const
  XCB_GLX_GET_TEX_ENVFV = 130;  
{*
 * @brief xcb_glx_get_tex_envfv_request_t
 * }
type
  Pxcb_glx_get_tex_envfv_request_t = ^Txcb_glx_get_tex_envfv_request_t;
  Txcb_glx_get_tex_envfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_envfv_reply_t
 * }

  Pxcb_glx_get_tex_envfv_reply_t = ^Txcb_glx_get_tex_envfv_reply_t;
  Txcb_glx_get_tex_envfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_enviv_cookie_t
 * }

  Pxcb_glx_get_tex_enviv_cookie_t = ^Txcb_glx_get_tex_enviv_cookie_t;
  Txcb_glx_get_tex_enviv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_enviv.  }

const
  XCB_GLX_GET_TEX_ENVIV = 131;  
{*
 * @brief xcb_glx_get_tex_enviv_request_t
 * }
type
  Pxcb_glx_get_tex_enviv_request_t = ^Txcb_glx_get_tex_enviv_request_t;
  Txcb_glx_get_tex_enviv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_enviv_reply_t
 * }

  Pxcb_glx_get_tex_enviv_reply_t = ^Txcb_glx_get_tex_enviv_reply_t;
  Txcb_glx_get_tex_enviv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_gendv_cookie_t
 * }

  Pxcb_glx_get_tex_gendv_cookie_t = ^Txcb_glx_get_tex_gendv_cookie_t;
  Txcb_glx_get_tex_gendv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_gendv.  }

const
  XCB_GLX_GET_TEX_GENDV = 132;  
{*
 * @brief xcb_glx_get_tex_gendv_request_t
 * }
type
  Pxcb_glx_get_tex_gendv_request_t = ^Txcb_glx_get_tex_gendv_request_t;
  Txcb_glx_get_tex_gendv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      coord : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_gendv_reply_t
 * }

  Pxcb_glx_get_tex_gendv_reply_t = ^Txcb_glx_get_tex_gendv_reply_t;
  Txcb_glx_get_tex_gendv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float64_t;
      pad2 : array[0..7] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_genfv_cookie_t
 * }

  Pxcb_glx_get_tex_genfv_cookie_t = ^Txcb_glx_get_tex_genfv_cookie_t;
  Txcb_glx_get_tex_genfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_genfv.  }

const
  XCB_GLX_GET_TEX_GENFV = 133;  
{*
 * @brief xcb_glx_get_tex_genfv_request_t
 * }
type
  Pxcb_glx_get_tex_genfv_request_t = ^Txcb_glx_get_tex_genfv_request_t;
  Txcb_glx_get_tex_genfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      coord : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_genfv_reply_t
 * }

  Pxcb_glx_get_tex_genfv_reply_t = ^Txcb_glx_get_tex_genfv_reply_t;
  Txcb_glx_get_tex_genfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_geniv_cookie_t
 * }

  Pxcb_glx_get_tex_geniv_cookie_t = ^Txcb_glx_get_tex_geniv_cookie_t;
  Txcb_glx_get_tex_geniv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_geniv.  }

const
  XCB_GLX_GET_TEX_GENIV = 134;  
{*
 * @brief xcb_glx_get_tex_geniv_request_t
 * }
type
  Pxcb_glx_get_tex_geniv_request_t = ^Txcb_glx_get_tex_geniv_request_t;
  Txcb_glx_get_tex_geniv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      coord : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_geniv_reply_t
 * }

  Pxcb_glx_get_tex_geniv_reply_t = ^Txcb_glx_get_tex_geniv_reply_t;
  Txcb_glx_get_tex_geniv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_image_cookie_t
 * }

  Pxcb_glx_get_tex_image_cookie_t = ^Txcb_glx_get_tex_image_cookie_t;
  Txcb_glx_get_tex_image_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_image.  }

const
  XCB_GLX_GET_TEX_IMAGE = 135;  
{*
 * @brief xcb_glx_get_tex_image_request_t
 * }
type
  Pxcb_glx_get_tex_image_request_t = ^Txcb_glx_get_tex_image_request_t;
  Txcb_glx_get_tex_image_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      level : Tint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_image_reply_t
 * }

  Pxcb_glx_get_tex_image_reply_t = ^Txcb_glx_get_tex_image_reply_t;
  Txcb_glx_get_tex_image_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
      width : Tint32_t;
      height : Tint32_t;
      depth : Tint32_t;
      pad2 : array[0..3] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_parameterfv_cookie_t
 * }

  Pxcb_glx_get_tex_parameterfv_cookie_t = ^Txcb_glx_get_tex_parameterfv_cookie_t;
  Txcb_glx_get_tex_parameterfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_parameterfv.  }

const
  XCB_GLX_GET_TEX_PARAMETERFV = 136;  
{*
 * @brief xcb_glx_get_tex_parameterfv_request_t
 * }
type
  Pxcb_glx_get_tex_parameterfv_request_t = ^Txcb_glx_get_tex_parameterfv_request_t;
  Txcb_glx_get_tex_parameterfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_parameterfv_reply_t
 * }

  Pxcb_glx_get_tex_parameterfv_reply_t = ^Txcb_glx_get_tex_parameterfv_reply_t;
  Txcb_glx_get_tex_parameterfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_parameteriv_cookie_t
 * }

  Pxcb_glx_get_tex_parameteriv_cookie_t = ^Txcb_glx_get_tex_parameteriv_cookie_t;
  Txcb_glx_get_tex_parameteriv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_parameteriv.  }

const
  XCB_GLX_GET_TEX_PARAMETERIV = 137;  
{*
 * @brief xcb_glx_get_tex_parameteriv_request_t
 * }
type
  Pxcb_glx_get_tex_parameteriv_request_t = ^Txcb_glx_get_tex_parameteriv_request_t;
  Txcb_glx_get_tex_parameteriv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_parameteriv_reply_t
 * }

  Pxcb_glx_get_tex_parameteriv_reply_t = ^Txcb_glx_get_tex_parameteriv_reply_t;
  Txcb_glx_get_tex_parameteriv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_level_parameterfv_cookie_t
 * }

  Pxcb_glx_get_tex_level_parameterfv_cookie_t = ^Txcb_glx_get_tex_level_parameterfv_cookie_t;
  Txcb_glx_get_tex_level_parameterfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_level_parameterfv.  }

const
  XCB_GLX_GET_TEX_LEVEL_PARAMETERFV = 138;  
{*
 * @brief xcb_glx_get_tex_level_parameterfv_request_t
 * }
type
  Pxcb_glx_get_tex_level_parameterfv_request_t = ^Txcb_glx_get_tex_level_parameterfv_request_t;
  Txcb_glx_get_tex_level_parameterfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      level : Tint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_level_parameterfv_reply_t
 * }

  Pxcb_glx_get_tex_level_parameterfv_reply_t = ^Txcb_glx_get_tex_level_parameterfv_reply_t;
  Txcb_glx_get_tex_level_parameterfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_tex_level_parameteriv_cookie_t
 * }

  Pxcb_glx_get_tex_level_parameteriv_cookie_t = ^Txcb_glx_get_tex_level_parameteriv_cookie_t;
  Txcb_glx_get_tex_level_parameteriv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_tex_level_parameteriv.  }

const
  XCB_GLX_GET_TEX_LEVEL_PARAMETERIV = 139;  
{*
 * @brief xcb_glx_get_tex_level_parameteriv_request_t
 * }
type
  Pxcb_glx_get_tex_level_parameteriv_request_t = ^Txcb_glx_get_tex_level_parameteriv_request_t;
  Txcb_glx_get_tex_level_parameteriv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      level : Tint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_tex_level_parameteriv_reply_t
 * }

  Pxcb_glx_get_tex_level_parameteriv_reply_t = ^Txcb_glx_get_tex_level_parameteriv_reply_t;
  Txcb_glx_get_tex_level_parameteriv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_is_enabled_cookie_t
 * }

  Pxcb_glx_is_enabled_cookie_t = ^Txcb_glx_is_enabled_cookie_t;
  Txcb_glx_is_enabled_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_is_enabled.  }

const
  XCB_GLX_IS_ENABLED = 140;  
{*
 * @brief xcb_glx_is_enabled_request_t
 * }
type
  Pxcb_glx_is_enabled_request_t = ^Txcb_glx_is_enabled_request_t;
  Txcb_glx_is_enabled_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      capability : Tuint32_t;
    end;
{*
 * @brief xcb_glx_is_enabled_reply_t
 * }

  Pxcb_glx_is_enabled_reply_t = ^Txcb_glx_is_enabled_reply_t;
  Txcb_glx_is_enabled_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Txcb_glx_bool32_t;
    end;
{*
 * @brief xcb_glx_is_list_cookie_t
 * }

  Pxcb_glx_is_list_cookie_t = ^Txcb_glx_is_list_cookie_t;
  Txcb_glx_is_list_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_is_list.  }

const
  XCB_GLX_IS_LIST = 141;  
{*
 * @brief xcb_glx_is_list_request_t
 * }
type
  Pxcb_glx_is_list_request_t = ^Txcb_glx_is_list_request_t;
  Txcb_glx_is_list_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      list : Tuint32_t;
    end;
{*
 * @brief xcb_glx_is_list_reply_t
 * }

  Pxcb_glx_is_list_reply_t = ^Txcb_glx_is_list_reply_t;
  Txcb_glx_is_list_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Txcb_glx_bool32_t;
    end;
{* Opcode for xcb_glx_flush.  }

const
  XCB_GLX_FLUSH = 142;  
{*
 * @brief xcb_glx_flush_request_t
 * }
type
  Pxcb_glx_flush_request_t = ^Txcb_glx_flush_request_t;
  Txcb_glx_flush_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
    end;
{*
 * @brief xcb_glx_are_textures_resident_cookie_t
 * }

  Pxcb_glx_are_textures_resident_cookie_t = ^Txcb_glx_are_textures_resident_cookie_t;
  Txcb_glx_are_textures_resident_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_are_textures_resident.  }

const
  XCB_GLX_ARE_TEXTURES_RESIDENT = 143;  
{*
 * @brief xcb_glx_are_textures_resident_request_t
 * }
type
  Pxcb_glx_are_textures_resident_request_t = ^Txcb_glx_are_textures_resident_request_t;
  Txcb_glx_are_textures_resident_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      n : Tint32_t;
    end;
{*
 * @brief xcb_glx_are_textures_resident_reply_t
 * }

  Pxcb_glx_are_textures_resident_reply_t = ^Txcb_glx_are_textures_resident_reply_t;
  Txcb_glx_are_textures_resident_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Txcb_glx_bool32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_glx_delete_textures.  }

const
  XCB_GLX_DELETE_TEXTURES = 144;  
{*
 * @brief xcb_glx_delete_textures_request_t
 * }
type
  Pxcb_glx_delete_textures_request_t = ^Txcb_glx_delete_textures_request_t;
  Txcb_glx_delete_textures_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      n : Tint32_t;
    end;
{*
 * @brief xcb_glx_gen_textures_cookie_t
 * }

  Pxcb_glx_gen_textures_cookie_t = ^Txcb_glx_gen_textures_cookie_t;
  Txcb_glx_gen_textures_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_gen_textures.  }

const
  XCB_GLX_GEN_TEXTURES = 145;  
{*
 * @brief xcb_glx_gen_textures_request_t
 * }
type
  Pxcb_glx_gen_textures_request_t = ^Txcb_glx_gen_textures_request_t;
  Txcb_glx_gen_textures_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      n : Tint32_t;
    end;
{*
 * @brief xcb_glx_gen_textures_reply_t
 * }

  Pxcb_glx_gen_textures_reply_t = ^Txcb_glx_gen_textures_reply_t;
  Txcb_glx_gen_textures_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_is_texture_cookie_t
 * }

  Pxcb_glx_is_texture_cookie_t = ^Txcb_glx_is_texture_cookie_t;
  Txcb_glx_is_texture_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_is_texture.  }

const
  XCB_GLX_IS_TEXTURE = 146;  
{*
 * @brief xcb_glx_is_texture_request_t
 * }
type
  Pxcb_glx_is_texture_request_t = ^Txcb_glx_is_texture_request_t;
  Txcb_glx_is_texture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      texture : Tuint32_t;
    end;
{*
 * @brief xcb_glx_is_texture_reply_t
 * }

  Pxcb_glx_is_texture_reply_t = ^Txcb_glx_is_texture_reply_t;
  Txcb_glx_is_texture_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Txcb_glx_bool32_t;
    end;
{*
 * @brief xcb_glx_get_color_table_cookie_t
 * }

  Pxcb_glx_get_color_table_cookie_t = ^Txcb_glx_get_color_table_cookie_t;
  Txcb_glx_get_color_table_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_color_table.  }

const
  XCB_GLX_GET_COLOR_TABLE = 147;  
{*
 * @brief xcb_glx_get_color_table_request_t
 * }
type
  Pxcb_glx_get_color_table_request_t = ^Txcb_glx_get_color_table_request_t;
  Txcb_glx_get_color_table_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_color_table_reply_t
 * }

  Pxcb_glx_get_color_table_reply_t = ^Txcb_glx_get_color_table_reply_t;
  Txcb_glx_get_color_table_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
      width : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_color_table_parameterfv_cookie_t
 * }

  Pxcb_glx_get_color_table_parameterfv_cookie_t = ^Txcb_glx_get_color_table_parameterfv_cookie_t;
  Txcb_glx_get_color_table_parameterfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_color_table_parameterfv.  }

const
  XCB_GLX_GET_COLOR_TABLE_PARAMETERFV = 148;  
{*
 * @brief xcb_glx_get_color_table_parameterfv_request_t
 * }
type
  Pxcb_glx_get_color_table_parameterfv_request_t = ^Txcb_glx_get_color_table_parameterfv_request_t;
  Txcb_glx_get_color_table_parameterfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_color_table_parameterfv_reply_t
 * }

  Pxcb_glx_get_color_table_parameterfv_reply_t = ^Txcb_glx_get_color_table_parameterfv_reply_t;
  Txcb_glx_get_color_table_parameterfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_color_table_parameteriv_cookie_t
 * }

  Pxcb_glx_get_color_table_parameteriv_cookie_t = ^Txcb_glx_get_color_table_parameteriv_cookie_t;
  Txcb_glx_get_color_table_parameteriv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_color_table_parameteriv.  }

const
  XCB_GLX_GET_COLOR_TABLE_PARAMETERIV = 149;  
{*
 * @brief xcb_glx_get_color_table_parameteriv_request_t
 * }
type
  Pxcb_glx_get_color_table_parameteriv_request_t = ^Txcb_glx_get_color_table_parameteriv_request_t;
  Txcb_glx_get_color_table_parameteriv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_color_table_parameteriv_reply_t
 * }

  Pxcb_glx_get_color_table_parameteriv_reply_t = ^Txcb_glx_get_color_table_parameteriv_reply_t;
  Txcb_glx_get_color_table_parameteriv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_convolution_filter_cookie_t
 * }

  Pxcb_glx_get_convolution_filter_cookie_t = ^Txcb_glx_get_convolution_filter_cookie_t;
  Txcb_glx_get_convolution_filter_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_convolution_filter.  }

const
  XCB_GLX_GET_CONVOLUTION_FILTER = 150;  
{*
 * @brief xcb_glx_get_convolution_filter_request_t
 * }
type
  Pxcb_glx_get_convolution_filter_request_t = ^Txcb_glx_get_convolution_filter_request_t;
  Txcb_glx_get_convolution_filter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_convolution_filter_reply_t
 * }

  Pxcb_glx_get_convolution_filter_reply_t = ^Txcb_glx_get_convolution_filter_reply_t;
  Txcb_glx_get_convolution_filter_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
      width : Tint32_t;
      height : Tint32_t;
      pad2 : array[0..7] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_convolution_parameterfv_cookie_t
 * }

  Pxcb_glx_get_convolution_parameterfv_cookie_t = ^Txcb_glx_get_convolution_parameterfv_cookie_t;
  Txcb_glx_get_convolution_parameterfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_convolution_parameterfv.  }

const
  XCB_GLX_GET_CONVOLUTION_PARAMETERFV = 151;  
{*
 * @brief xcb_glx_get_convolution_parameterfv_request_t
 * }
type
  Pxcb_glx_get_convolution_parameterfv_request_t = ^Txcb_glx_get_convolution_parameterfv_request_t;
  Txcb_glx_get_convolution_parameterfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_convolution_parameterfv_reply_t
 * }

  Pxcb_glx_get_convolution_parameterfv_reply_t = ^Txcb_glx_get_convolution_parameterfv_reply_t;
  Txcb_glx_get_convolution_parameterfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_convolution_parameteriv_cookie_t
 * }

  Pxcb_glx_get_convolution_parameteriv_cookie_t = ^Txcb_glx_get_convolution_parameteriv_cookie_t;
  Txcb_glx_get_convolution_parameteriv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_convolution_parameteriv.  }

const
  XCB_GLX_GET_CONVOLUTION_PARAMETERIV = 152;  
{*
 * @brief xcb_glx_get_convolution_parameteriv_request_t
 * }
type
  Pxcb_glx_get_convolution_parameteriv_request_t = ^Txcb_glx_get_convolution_parameteriv_request_t;
  Txcb_glx_get_convolution_parameteriv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_convolution_parameteriv_reply_t
 * }

  Pxcb_glx_get_convolution_parameteriv_reply_t = ^Txcb_glx_get_convolution_parameteriv_reply_t;
  Txcb_glx_get_convolution_parameteriv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_separable_filter_cookie_t
 * }

  Pxcb_glx_get_separable_filter_cookie_t = ^Txcb_glx_get_separable_filter_cookie_t;
  Txcb_glx_get_separable_filter_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_separable_filter.  }

const
  XCB_GLX_GET_SEPARABLE_FILTER = 153;  
{*
 * @brief xcb_glx_get_separable_filter_request_t
 * }
type
  Pxcb_glx_get_separable_filter_request_t = ^Txcb_glx_get_separable_filter_request_t;
  Txcb_glx_get_separable_filter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_separable_filter_reply_t
 * }

  Pxcb_glx_get_separable_filter_reply_t = ^Txcb_glx_get_separable_filter_reply_t;
  Txcb_glx_get_separable_filter_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
      row_w : Tint32_t;
      col_h : Tint32_t;
      pad2 : array[0..7] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_histogram_cookie_t
 * }

  Pxcb_glx_get_histogram_cookie_t = ^Txcb_glx_get_histogram_cookie_t;
  Txcb_glx_get_histogram_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_histogram.  }

const
  XCB_GLX_GET_HISTOGRAM = 154;  
{*
 * @brief xcb_glx_get_histogram_request_t
 * }
type
  Pxcb_glx_get_histogram_request_t = ^Txcb_glx_get_histogram_request_t;
  Txcb_glx_get_histogram_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
      reset : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_histogram_reply_t
 * }

  Pxcb_glx_get_histogram_reply_t = ^Txcb_glx_get_histogram_reply_t;
  Txcb_glx_get_histogram_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
      width : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_histogram_parameterfv_cookie_t
 * }

  Pxcb_glx_get_histogram_parameterfv_cookie_t = ^Txcb_glx_get_histogram_parameterfv_cookie_t;
  Txcb_glx_get_histogram_parameterfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_histogram_parameterfv.  }

const
  XCB_GLX_GET_HISTOGRAM_PARAMETERFV = 155;  
{*
 * @brief xcb_glx_get_histogram_parameterfv_request_t
 * }
type
  Pxcb_glx_get_histogram_parameterfv_request_t = ^Txcb_glx_get_histogram_parameterfv_request_t;
  Txcb_glx_get_histogram_parameterfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_histogram_parameterfv_reply_t
 * }

  Pxcb_glx_get_histogram_parameterfv_reply_t = ^Txcb_glx_get_histogram_parameterfv_reply_t;
  Txcb_glx_get_histogram_parameterfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_histogram_parameteriv_cookie_t
 * }

  Pxcb_glx_get_histogram_parameteriv_cookie_t = ^Txcb_glx_get_histogram_parameteriv_cookie_t;
  Txcb_glx_get_histogram_parameteriv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_histogram_parameteriv.  }

const
  XCB_GLX_GET_HISTOGRAM_PARAMETERIV = 156;  
{*
 * @brief xcb_glx_get_histogram_parameteriv_request_t
 * }
type
  Pxcb_glx_get_histogram_parameteriv_request_t = ^Txcb_glx_get_histogram_parameteriv_request_t;
  Txcb_glx_get_histogram_parameteriv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_histogram_parameteriv_reply_t
 * }

  Pxcb_glx_get_histogram_parameteriv_reply_t = ^Txcb_glx_get_histogram_parameteriv_reply_t;
  Txcb_glx_get_histogram_parameteriv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_minmax_cookie_t
 * }

  Pxcb_glx_get_minmax_cookie_t = ^Txcb_glx_get_minmax_cookie_t;
  Txcb_glx_get_minmax_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_minmax.  }

const
  XCB_GLX_GET_MINMAX = 157;  
{*
 * @brief xcb_glx_get_minmax_request_t
 * }
type
  Pxcb_glx_get_minmax_request_t = ^Txcb_glx_get_minmax_request_t;
  Txcb_glx_get_minmax_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      format : Tuint32_t;
      _type : Tuint32_t;
      swap_bytes : Tuint8_t;
      reset : Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_minmax_reply_t
 * }

  Pxcb_glx_get_minmax_reply_t = ^Txcb_glx_get_minmax_reply_t;
  Txcb_glx_get_minmax_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_minmax_parameterfv_cookie_t
 * }

  Pxcb_glx_get_minmax_parameterfv_cookie_t = ^Txcb_glx_get_minmax_parameterfv_cookie_t;
  Txcb_glx_get_minmax_parameterfv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_minmax_parameterfv.  }

const
  XCB_GLX_GET_MINMAX_PARAMETERFV = 158;  
{*
 * @brief xcb_glx_get_minmax_parameterfv_request_t
 * }
type
  Pxcb_glx_get_minmax_parameterfv_request_t = ^Txcb_glx_get_minmax_parameterfv_request_t;
  Txcb_glx_get_minmax_parameterfv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_minmax_parameterfv_reply_t
 * }

  Pxcb_glx_get_minmax_parameterfv_reply_t = ^Txcb_glx_get_minmax_parameterfv_reply_t;
  Txcb_glx_get_minmax_parameterfv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Txcb_glx_float32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_minmax_parameteriv_cookie_t
 * }

  Pxcb_glx_get_minmax_parameteriv_cookie_t = ^Txcb_glx_get_minmax_parameteriv_cookie_t;
  Txcb_glx_get_minmax_parameteriv_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_minmax_parameteriv.  }

const
  XCB_GLX_GET_MINMAX_PARAMETERIV = 159;  
{*
 * @brief xcb_glx_get_minmax_parameteriv_request_t
 * }
type
  Pxcb_glx_get_minmax_parameteriv_request_t = ^Txcb_glx_get_minmax_parameteriv_request_t;
  Txcb_glx_get_minmax_parameteriv_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_minmax_parameteriv_reply_t
 * }

  Pxcb_glx_get_minmax_parameteriv_reply_t = ^Txcb_glx_get_minmax_parameteriv_reply_t;
  Txcb_glx_get_minmax_parameteriv_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_compressed_tex_image_arb_cookie_t
 * }

  Pxcb_glx_get_compressed_tex_image_arb_cookie_t = ^Txcb_glx_get_compressed_tex_image_arb_cookie_t;
  Txcb_glx_get_compressed_tex_image_arb_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_compressed_tex_image_arb.  }

const
  XCB_GLX_GET_COMPRESSED_TEX_IMAGE_ARB = 160;  
{*
 * @brief xcb_glx_get_compressed_tex_image_arb_request_t
 * }
type
  Pxcb_glx_get_compressed_tex_image_arb_request_t = ^Txcb_glx_get_compressed_tex_image_arb_request_t;
  Txcb_glx_get_compressed_tex_image_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      level : Tint32_t;
    end;
{*
 * @brief xcb_glx_get_compressed_tex_image_arb_reply_t
 * }

  Pxcb_glx_get_compressed_tex_image_arb_reply_t = ^Txcb_glx_get_compressed_tex_image_arb_reply_t;
  Txcb_glx_get_compressed_tex_image_arb_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
      size : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{* Opcode for xcb_glx_delete_queries_arb.  }

const
  XCB_GLX_DELETE_QUERIES_ARB = 161;  
{*
 * @brief xcb_glx_delete_queries_arb_request_t
 * }
type
  Pxcb_glx_delete_queries_arb_request_t = ^Txcb_glx_delete_queries_arb_request_t;
  Txcb_glx_delete_queries_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      n : Tint32_t;
    end;
{*
 * @brief xcb_glx_gen_queries_arb_cookie_t
 * }

  Pxcb_glx_gen_queries_arb_cookie_t = ^Txcb_glx_gen_queries_arb_cookie_t;
  Txcb_glx_gen_queries_arb_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_gen_queries_arb.  }

const
  XCB_GLX_GEN_QUERIES_ARB = 162;  
{*
 * @brief xcb_glx_gen_queries_arb_request_t
 * }
type
  Pxcb_glx_gen_queries_arb_request_t = ^Txcb_glx_gen_queries_arb_request_t;
  Txcb_glx_gen_queries_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      n : Tint32_t;
    end;
{*
 * @brief xcb_glx_gen_queries_arb_reply_t
 * }

  Pxcb_glx_gen_queries_arb_reply_t = ^Txcb_glx_gen_queries_arb_reply_t;
  Txcb_glx_gen_queries_arb_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_is_query_arb_cookie_t
 * }

  Pxcb_glx_is_query_arb_cookie_t = ^Txcb_glx_is_query_arb_cookie_t;
  Txcb_glx_is_query_arb_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_is_query_arb.  }

const
  XCB_GLX_IS_QUERY_ARB = 163;  
{*
 * @brief xcb_glx_is_query_arb_request_t
 * }
type
  Pxcb_glx_is_query_arb_request_t = ^Txcb_glx_is_query_arb_request_t;
  Txcb_glx_is_query_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      id : Tuint32_t;
    end;
{*
 * @brief xcb_glx_is_query_arb_reply_t
 * }

  Pxcb_glx_is_query_arb_reply_t = ^Txcb_glx_is_query_arb_reply_t;
  Txcb_glx_is_query_arb_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ret_val : Txcb_glx_bool32_t;
    end;
{*
 * @brief xcb_glx_get_queryiv_arb_cookie_t
 * }

  Pxcb_glx_get_queryiv_arb_cookie_t = ^Txcb_glx_get_queryiv_arb_cookie_t;
  Txcb_glx_get_queryiv_arb_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_queryiv_arb.  }

const
  XCB_GLX_GET_QUERYIV_ARB = 164;  
{*
 * @brief xcb_glx_get_queryiv_arb_request_t
 * }
type
  Pxcb_glx_get_queryiv_arb_request_t = ^Txcb_glx_get_queryiv_arb_request_t;
  Txcb_glx_get_queryiv_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      target : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_queryiv_arb_reply_t
 * }

  Pxcb_glx_get_queryiv_arb_reply_t = ^Txcb_glx_get_queryiv_arb_reply_t;
  Txcb_glx_get_queryiv_arb_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_query_objectiv_arb_cookie_t
 * }

  Pxcb_glx_get_query_objectiv_arb_cookie_t = ^Txcb_glx_get_query_objectiv_arb_cookie_t;
  Txcb_glx_get_query_objectiv_arb_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_query_objectiv_arb.  }

const
  XCB_GLX_GET_QUERY_OBJECTIV_ARB = 165;  
{*
 * @brief xcb_glx_get_query_objectiv_arb_request_t
 * }
type
  Pxcb_glx_get_query_objectiv_arb_request_t = ^Txcb_glx_get_query_objectiv_arb_request_t;
  Txcb_glx_get_query_objectiv_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      id : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_query_objectiv_arb_reply_t
 * }

  Pxcb_glx_get_query_objectiv_arb_reply_t = ^Txcb_glx_get_query_objectiv_arb_reply_t;
  Txcb_glx_get_query_objectiv_arb_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_glx_get_query_objectuiv_arb_cookie_t
 * }

  Pxcb_glx_get_query_objectuiv_arb_cookie_t = ^Txcb_glx_get_query_objectuiv_arb_cookie_t;
  Txcb_glx_get_query_objectuiv_arb_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_glx_get_query_objectuiv_arb.  }

const
  XCB_GLX_GET_QUERY_OBJECTUIV_ARB = 166;  
{*
 * @brief xcb_glx_get_query_objectuiv_arb_request_t
 * }
type
  Pxcb_glx_get_query_objectuiv_arb_request_t = ^Txcb_glx_get_query_objectuiv_arb_request_t;
  Txcb_glx_get_query_objectuiv_arb_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_tag : Txcb_glx_context_tag_t;
      id : Tuint32_t;
      pname : Tuint32_t;
    end;
{*
 * @brief xcb_glx_get_query_objectuiv_arb_reply_t
 * }

  Pxcb_glx_get_query_objectuiv_arb_reply_t = ^Txcb_glx_get_query_objectuiv_arb_reply_t;
  Txcb_glx_get_query_objectuiv_arb_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      n : Tuint32_t;
      datum : Tuint32_t;
      pad2 : array[0..11] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_pixmap_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_pixmap_t)
  }

procedure xcb_glx_pixmap_next(i:Pxcb_glx_pixmap_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_pixmap_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_pixmap_end(i:Txcb_glx_pixmap_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_context_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_context_t)
  }
procedure xcb_glx_context_next(i:Pxcb_glx_context_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_context_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_context_end(i:Txcb_glx_context_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_pbuffer_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_pbuffer_t)
  }
procedure xcb_glx_pbuffer_next(i:Pxcb_glx_pbuffer_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_pbuffer_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_pbuffer_end(i:Txcb_glx_pbuffer_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_window_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_window_t)
  }
procedure xcb_glx_window_next(i:Pxcb_glx_window_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_window_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_window_end(i:Txcb_glx_window_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_fbconfig_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_fbconfig_t)
  }
procedure xcb_glx_fbconfig_next(i:Pxcb_glx_fbconfig_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_fbconfig_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_fbconfig_end(i:Txcb_glx_fbconfig_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_drawable_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_drawable_t)
  }
procedure xcb_glx_drawable_next(i:Pxcb_glx_drawable_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_drawable_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_drawable_end(i:Txcb_glx_drawable_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_float32_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_float32_t)
  }
procedure xcb_glx_float32_next(i:Pxcb_glx_float32_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_float32_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_float32_end(i:Txcb_glx_float32_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_float64_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_float64_t)
  }
procedure xcb_glx_float64_next(i:Pxcb_glx_float64_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_float64_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_float64_end(i:Txcb_glx_float64_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_bool32_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_bool32_t)
  }
procedure xcb_glx_bool32_next(i:Pxcb_glx_bool32_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_bool32_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_bool32_end(i:Txcb_glx_bool32_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_glx_context_tag_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_glx_context_tag_t)
  }
procedure xcb_glx_context_tag_next(i:Pxcb_glx_context_tag_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_glx_context_tag_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_glx_context_tag_end(i:Txcb_glx_context_tag_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_sizeof(_buffer:pointer; data_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_render_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_render(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_data(R:Pxcb_glx_render_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_data_length(R:Pxcb_glx_render_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_data_end(R:Pxcb_glx_render_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_large_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_render_large_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; request_num:Tuint16_t; request_total:Tuint16_t; data_len:Tuint32_t; 
           data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_render_large(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; request_num:Tuint16_t; request_total:Tuint16_t; data_len:Tuint32_t; 
           data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_large_data(R:Pxcb_glx_render_large_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_large_data_length(R:Pxcb_glx_render_large_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_large_data_end(R:Pxcb_glx_render_large_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_create_context_checked(c:Pxcb_connection_t; context:Txcb_glx_context_t; visual:Txcb_visualid_t; screen:Tuint32_t; share_list:Txcb_glx_context_t; 
           is_direct:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_create_context(c:Pxcb_connection_t; context:Txcb_glx_context_t; visual:Txcb_visualid_t; screen:Tuint32_t; share_list:Txcb_glx_context_t; 
           is_direct:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_destroy_context_checked(c:Pxcb_connection_t; context:Txcb_glx_context_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_destroy_context(c:Pxcb_connection_t; context:Txcb_glx_context_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_make_current(c:Pxcb_connection_t; drawable:Txcb_glx_drawable_t; context:Txcb_glx_context_t; old_context_tag:Txcb_glx_context_tag_t):Txcb_glx_make_current_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_make_current_unchecked(c:Pxcb_connection_t; drawable:Txcb_glx_drawable_t; context:Txcb_glx_context_t; old_context_tag:Txcb_glx_context_tag_t):Txcb_glx_make_current_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_make_current_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_make_current_reply(c:Pxcb_connection_t; cookie:Txcb_glx_make_current_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_make_current_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_is_direct(c:Pxcb_connection_t; context:Txcb_glx_context_t):Txcb_glx_is_direct_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_is_direct_unchecked(c:Pxcb_connection_t; context:Txcb_glx_context_t):Txcb_glx_is_direct_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_is_direct_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_is_direct_reply(c:Pxcb_connection_t; cookie:Txcb_glx_is_direct_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_is_direct_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_query_version(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_glx_query_version_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_query_version_unchecked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_glx_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_glx_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_query_version_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_wait_gl_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_wait_gl(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_wait_x_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_wait_x(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_copy_context_checked(c:Pxcb_connection_t; src:Txcb_glx_context_t; dest:Txcb_glx_context_t; mask:Tuint32_t; src_context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_copy_context(c:Pxcb_connection_t; src:Txcb_glx_context_t; dest:Txcb_glx_context_t; mask:Tuint32_t; src_context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_swap_buffers_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; drawable:Txcb_glx_drawable_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_swap_buffers(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; drawable:Txcb_glx_drawable_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_use_x_font_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; font:Txcb_font_t; first:Tuint32_t; count:Tuint32_t; 
           list_base:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_use_x_font(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; font:Txcb_font_t; first:Tuint32_t; count:Tuint32_t; 
           list_base:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_create_glx_pixmap_checked(c:Pxcb_connection_t; screen:Tuint32_t; visual:Txcb_visualid_t; pixmap:Txcb_pixmap_t; glx_pixmap:Txcb_glx_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_create_glx_pixmap(c:Pxcb_connection_t; screen:Tuint32_t; visual:Txcb_visualid_t; pixmap:Txcb_pixmap_t; glx_pixmap:Txcb_glx_pixmap_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_visual_configs_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_visual_configs(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_glx_get_visual_configs_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_visual_configs_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_glx_get_visual_configs_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_visual_configs_property_list(R:Pxcb_glx_get_visual_configs_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_visual_configs_property_list_length(R:Pxcb_glx_get_visual_configs_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_visual_configs_property_list_end(R:Pxcb_glx_get_visual_configs_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_visual_configs_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_visual_configs_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_visual_configs_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_visual_configs_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_destroy_glx_pixmap_checked(c:Pxcb_connection_t; glx_pixmap:Txcb_glx_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_destroy_glx_pixmap(c:Pxcb_connection_t; glx_pixmap:Txcb_glx_pixmap_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_sizeof(_buffer:pointer; data_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_vendor_private_checked(c:Pxcb_connection_t; vendor_code:Tuint32_t; context_tag:Txcb_glx_context_tag_t; data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_vendor_private(c:Pxcb_connection_t; vendor_code:Tuint32_t; context_tag:Txcb_glx_context_tag_t; data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_data(R:Pxcb_glx_vendor_private_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_data_length(R:Pxcb_glx_vendor_private_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_data_end(R:Pxcb_glx_vendor_private_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_with_reply_sizeof(_buffer:pointer; data_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_vendor_private_with_reply(c:Pxcb_connection_t; vendor_code:Tuint32_t; context_tag:Txcb_glx_context_tag_t; data_len:Tuint32_t; data:Puint8_t):Txcb_glx_vendor_private_with_reply_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_glx_vendor_private_with_reply_unchecked(c:Pxcb_connection_t; vendor_code:Tuint32_t; context_tag:Txcb_glx_context_tag_t; data_len:Tuint32_t; data:Puint8_t):Txcb_glx_vendor_private_with_reply_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_with_reply_data_2(R:Pxcb_glx_vendor_private_with_reply_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_with_reply_data_2_length(R:Pxcb_glx_vendor_private_with_reply_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_vendor_private_with_reply_data_2_end(R:Pxcb_glx_vendor_private_with_reply_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_vendor_private_with_reply_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_vendor_private_with_reply_reply(c:Pxcb_connection_t; cookie:Txcb_glx_vendor_private_with_reply_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_vendor_private_with_reply_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_query_extensions_string(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_glx_query_extensions_string_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_query_extensions_string_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_glx_query_extensions_string_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_query_extensions_string_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_query_extensions_string_reply(c:Pxcb_connection_t; cookie:Txcb_glx_query_extensions_string_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_query_extensions_string_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_server_string_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_query_server_string(c:Pxcb_connection_t; screen:Tuint32_t; name:Tuint32_t):Txcb_glx_query_server_string_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_query_server_string_unchecked(c:Pxcb_connection_t; screen:Tuint32_t; name:Tuint32_t):Txcb_glx_query_server_string_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_server_string_string(R:Pxcb_glx_query_server_string_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_server_string_string_length(R:Pxcb_glx_query_server_string_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_server_string_string_end(R:Pxcb_glx_query_server_string_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_query_server_string_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_query_server_string_reply(c:Pxcb_connection_t; cookie:Txcb_glx_query_server_string_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_query_server_string_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_client_info_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_client_info_checked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t; str_len:Tuint32_t; _string:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_client_info(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t; str_len:Tuint32_t; _string:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_client_info_string(R:Pxcb_glx_client_info_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_client_info_string_length(R:Pxcb_glx_client_info_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_client_info_string_end(R:Pxcb_glx_client_info_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_fb_configs_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_fb_configs(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_glx_get_fb_configs_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_fb_configs_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_glx_get_fb_configs_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_fb_configs_property_list(R:Pxcb_glx_get_fb_configs_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_fb_configs_property_list_length(R:Pxcb_glx_get_fb_configs_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_fb_configs_property_list_end(R:Pxcb_glx_get_fb_configs_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_fb_configs_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_fb_configs_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_fb_configs_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_fb_configs_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pixmap_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_create_pixmap_checked(c:Pxcb_connection_t; screen:Tuint32_t; fbconfig:Txcb_glx_fbconfig_t; pixmap:Txcb_pixmap_t; glx_pixmap:Txcb_glx_pixmap_t; 
           num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_create_pixmap(c:Pxcb_connection_t; screen:Tuint32_t; fbconfig:Txcb_glx_fbconfig_t; pixmap:Txcb_pixmap_t; glx_pixmap:Txcb_glx_pixmap_t; 
           num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pixmap_attribs(R:Pxcb_glx_create_pixmap_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pixmap_attribs_length(R:Pxcb_glx_create_pixmap_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pixmap_attribs_end(R:Pxcb_glx_create_pixmap_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_destroy_pixmap_checked(c:Pxcb_connection_t; glx_pixmap:Txcb_glx_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_destroy_pixmap(c:Pxcb_connection_t; glx_pixmap:Txcb_glx_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_create_new_context_checked(c:Pxcb_connection_t; context:Txcb_glx_context_t; fbconfig:Txcb_glx_fbconfig_t; screen:Tuint32_t; render_type:Tuint32_t; 
           share_list:Txcb_glx_context_t; is_direct:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_create_new_context(c:Pxcb_connection_t; context:Txcb_glx_context_t; fbconfig:Txcb_glx_fbconfig_t; screen:Tuint32_t; render_type:Tuint32_t; 
           share_list:Txcb_glx_context_t; is_direct:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_context_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_query_context(c:Pxcb_connection_t; context:Txcb_glx_context_t):Txcb_glx_query_context_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_query_context_unchecked(c:Pxcb_connection_t; context:Txcb_glx_context_t):Txcb_glx_query_context_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_context_attribs(R:Pxcb_glx_query_context_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_context_attribs_length(R:Pxcb_glx_query_context_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_query_context_attribs_end(R:Pxcb_glx_query_context_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_query_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_query_context_reply(c:Pxcb_connection_t; cookie:Txcb_glx_query_context_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_query_context_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_make_context_current(c:Pxcb_connection_t; old_context_tag:Txcb_glx_context_tag_t; drawable:Txcb_glx_drawable_t; read_drawable:Txcb_glx_drawable_t; context:Txcb_glx_context_t):Txcb_glx_make_context_current_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_make_context_current_unchecked(c:Pxcb_connection_t; old_context_tag:Txcb_glx_context_tag_t; drawable:Txcb_glx_drawable_t; read_drawable:Txcb_glx_drawable_t; context:Txcb_glx_context_t):Txcb_glx_make_context_current_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_make_context_current_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_make_context_current_reply(c:Pxcb_connection_t; cookie:Txcb_glx_make_context_current_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_make_context_current_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pbuffer_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_create_pbuffer_checked(c:Pxcb_connection_t; screen:Tuint32_t; fbconfig:Txcb_glx_fbconfig_t; pbuffer:Txcb_glx_pbuffer_t; num_attribs:Tuint32_t; 
           attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_create_pbuffer(c:Pxcb_connection_t; screen:Tuint32_t; fbconfig:Txcb_glx_fbconfig_t; pbuffer:Txcb_glx_pbuffer_t; num_attribs:Tuint32_t; 
           attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pbuffer_attribs(R:Pxcb_glx_create_pbuffer_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pbuffer_attribs_length(R:Pxcb_glx_create_pbuffer_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_pbuffer_attribs_end(R:Pxcb_glx_create_pbuffer_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_destroy_pbuffer_checked(c:Pxcb_connection_t; pbuffer:Txcb_glx_pbuffer_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_destroy_pbuffer(c:Pxcb_connection_t; pbuffer:Txcb_glx_pbuffer_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_drawable_attributes_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_drawable_attributes(c:Pxcb_connection_t; drawable:Txcb_glx_drawable_t):Txcb_glx_get_drawable_attributes_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_drawable_attributes_unchecked(c:Pxcb_connection_t; drawable:Txcb_glx_drawable_t):Txcb_glx_get_drawable_attributes_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_drawable_attributes_attribs(R:Pxcb_glx_get_drawable_attributes_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_drawable_attributes_attribs_length(R:Pxcb_glx_get_drawable_attributes_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_drawable_attributes_attribs_end(R:Pxcb_glx_get_drawable_attributes_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_drawable_attributes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_drawable_attributes_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_drawable_attributes_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_drawable_attributes_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_change_drawable_attributes_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_change_drawable_attributes_checked(c:Pxcb_connection_t; drawable:Txcb_glx_drawable_t; num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_change_drawable_attributes(c:Pxcb_connection_t; drawable:Txcb_glx_drawable_t; num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_change_drawable_attributes_attribs(R:Pxcb_glx_change_drawable_attributes_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_change_drawable_attributes_attribs_length(R:Pxcb_glx_change_drawable_attributes_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_change_drawable_attributes_attribs_end(R:Pxcb_glx_change_drawable_attributes_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_window_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_create_window_checked(c:Pxcb_connection_t; screen:Tuint32_t; fbconfig:Txcb_glx_fbconfig_t; window:Txcb_window_t; glx_window:Txcb_glx_window_t; 
           num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_create_window(c:Pxcb_connection_t; screen:Tuint32_t; fbconfig:Txcb_glx_fbconfig_t; window:Txcb_window_t; glx_window:Txcb_glx_window_t; 
           num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_window_attribs(R:Pxcb_glx_create_window_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_window_attribs_length(R:Pxcb_glx_create_window_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_window_attribs_end(R:Pxcb_glx_create_window_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_delete_window_checked(c:Pxcb_connection_t; glxwindow:Txcb_glx_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_delete_window(c:Pxcb_connection_t; glxwindow:Txcb_glx_window_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_checked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t; num_versions:Tuint32_t; gl_str_len:Tuint32_t; 
           glx_str_len:Tuint32_t; gl_versions:Puint32_t; gl_extension_string:Pchar; glx_extension_string:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_glx_set_client_info_arb(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t; num_versions:Tuint32_t; gl_str_len:Tuint32_t; 
           glx_str_len:Tuint32_t; gl_versions:Puint32_t; gl_extension_string:Pchar; glx_extension_string:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_gl_versions(R:Pxcb_glx_set_client_info_arb_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_gl_versions_length(R:Pxcb_glx_set_client_info_arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_gl_versions_end(R:Pxcb_glx_set_client_info_arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_gl_extension_string(R:Pxcb_glx_set_client_info_arb_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_gl_extension_string_length(R:Pxcb_glx_set_client_info_arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_gl_extension_string_end(R:Pxcb_glx_set_client_info_arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_glx_extension_string(R:Pxcb_glx_set_client_info_arb_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_glx_extension_string_length(R:Pxcb_glx_set_client_info_arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_arb_glx_extension_string_end(R:Pxcb_glx_set_client_info_arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_context_attribs_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_create_context_attribs_arb_checked(c:Pxcb_connection_t; context:Txcb_glx_context_t; fbconfig:Txcb_glx_fbconfig_t; screen:Tuint32_t; share_list:Txcb_glx_context_t; 
           is_direct:Tuint8_t; num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_create_context_attribs_arb(c:Pxcb_connection_t; context:Txcb_glx_context_t; fbconfig:Txcb_glx_fbconfig_t; screen:Tuint32_t; share_list:Txcb_glx_context_t; 
           is_direct:Tuint8_t; num_attribs:Tuint32_t; attribs:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_context_attribs_arb_attribs(R:Pxcb_glx_create_context_attribs_arb_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_context_attribs_arb_attribs_length(R:Pxcb_glx_create_context_attribs_arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_create_context_attribs_arb_attribs_end(R:Pxcb_glx_create_context_attribs_arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_checked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t; num_versions:Tuint32_t; gl_str_len:Tuint32_t; 
           glx_str_len:Tuint32_t; gl_versions:Puint32_t; gl_extension_string:Pchar; glx_extension_string:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t; num_versions:Tuint32_t; gl_str_len:Tuint32_t; 
           glx_str_len:Tuint32_t; gl_versions:Puint32_t; gl_extension_string:Pchar; glx_extension_string:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_gl_versions(R:Pxcb_glx_set_client_info_2arb_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_gl_versions_length(R:Pxcb_glx_set_client_info_2arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_gl_versions_end(R:Pxcb_glx_set_client_info_2arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_gl_extension_string(R:Pxcb_glx_set_client_info_2arb_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_gl_extension_string_length(R:Pxcb_glx_set_client_info_2arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_gl_extension_string_end(R:Pxcb_glx_set_client_info_2arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_glx_extension_string(R:Pxcb_glx_set_client_info_2arb_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_glx_extension_string_length(R:Pxcb_glx_set_client_info_2arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_set_client_info_2arb_glx_extension_string_end(R:Pxcb_glx_set_client_info_2arb_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_new_list_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; list:Tuint32_t; mode:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_new_list(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; list:Tuint32_t; mode:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_end_list_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_end_list(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_delete_lists_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; list:Tuint32_t; range:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_delete_lists(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; list:Tuint32_t; range:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_gen_lists(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; range:Tint32_t):Txcb_glx_gen_lists_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_gen_lists_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; range:Tint32_t):Txcb_glx_gen_lists_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_gen_lists_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_gen_lists_reply(c:Pxcb_connection_t; cookie:Txcb_glx_gen_lists_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_gen_lists_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_feedback_buffer_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; size:Tint32_t; _type:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_feedback_buffer(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; size:Tint32_t; _type:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_select_buffer_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; size:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_select_buffer(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; size:Tint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_mode_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_render_mode(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; mode:Tuint32_t):Txcb_glx_render_mode_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_render_mode_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; mode:Tuint32_t):Txcb_glx_render_mode_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_mode_data(R:Pxcb_glx_render_mode_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_mode_data_length(R:Pxcb_glx_render_mode_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_render_mode_data_end(R:Pxcb_glx_render_mode_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_render_mode_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_render_mode_reply(c:Pxcb_connection_t; cookie:Txcb_glx_render_mode_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_render_mode_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_finish(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_glx_finish_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_finish_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_glx_finish_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_finish_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_finish_reply(c:Pxcb_connection_t; cookie:Txcb_glx_finish_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_finish_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_pixel_storef_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t; datum:Txcb_glx_float32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_pixel_storef(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t; datum:Txcb_glx_float32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_pixel_storei_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t; datum:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_pixel_storei(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t; datum:Tint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_read_pixels_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_read_pixels(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; x:Tint32_t; y:Tint32_t; width:Tint32_t; 
           height:Tint32_t; format:Tuint32_t; _type:Tuint32_t; swap_bytes:Tuint8_t; lsb_first:Tuint8_t):Txcb_glx_read_pixels_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_read_pixels_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; x:Tint32_t; y:Tint32_t; width:Tint32_t; 
           height:Tint32_t; format:Tuint32_t; _type:Tuint32_t; swap_bytes:Tuint8_t; lsb_first:Tuint8_t):Txcb_glx_read_pixels_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_read_pixels_data(R:Pxcb_glx_read_pixels_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_read_pixels_data_length(R:Pxcb_glx_read_pixels_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_read_pixels_data_end(R:Pxcb_glx_read_pixels_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_read_pixels_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_read_pixels_reply(c:Pxcb_connection_t; cookie:Txcb_glx_read_pixels_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_read_pixels_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_booleanv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_booleanv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tint32_t):Txcb_glx_get_booleanv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_booleanv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tint32_t):Txcb_glx_get_booleanv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_booleanv_data(R:Pxcb_glx_get_booleanv_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_booleanv_data_length(R:Pxcb_glx_get_booleanv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_booleanv_data_end(R:Pxcb_glx_get_booleanv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_booleanv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_booleanv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_booleanv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_booleanv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_clip_plane_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_clip_plane(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; plane:Tint32_t):Txcb_glx_get_clip_plane_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_clip_plane_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; plane:Tint32_t):Txcb_glx_get_clip_plane_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_clip_plane_data(R:Pxcb_glx_get_clip_plane_reply_t):Pxcb_glx_float64_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_clip_plane_data_length(R:Pxcb_glx_get_clip_plane_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_clip_plane_data_end(R:Pxcb_glx_get_clip_plane_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_clip_plane_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_clip_plane_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_clip_plane_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_clip_plane_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_doublev_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_doublev(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t):Txcb_glx_get_doublev_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_doublev_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t):Txcb_glx_get_doublev_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_doublev_data(R:Pxcb_glx_get_doublev_reply_t):Pxcb_glx_float64_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_doublev_data_length(R:Pxcb_glx_get_doublev_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_doublev_data_end(R:Pxcb_glx_get_doublev_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_doublev_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_doublev_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_doublev_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_doublev_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_error(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_glx_get_error_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_error_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_glx_get_error_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_error_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_error_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_error_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_error_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_floatv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_floatv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t):Txcb_glx_get_floatv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_floatv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t):Txcb_glx_get_floatv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_floatv_data(R:Pxcb_glx_get_floatv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_floatv_data_length(R:Pxcb_glx_get_floatv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_floatv_data_end(R:Pxcb_glx_get_floatv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_floatv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_floatv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_floatv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_floatv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_integerv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_integerv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t):Txcb_glx_get_integerv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_integerv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; pname:Tuint32_t):Txcb_glx_get_integerv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_integerv_data(R:Pxcb_glx_get_integerv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_integerv_data_length(R:Pxcb_glx_get_integerv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_integerv_data_end(R:Pxcb_glx_get_integerv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_integerv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_integerv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_integerv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_integerv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_lightfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; light:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_lightfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_lightfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; light:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_lightfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightfv_data(R:Pxcb_glx_get_lightfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightfv_data_length(R:Pxcb_glx_get_lightfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightfv_data_end(R:Pxcb_glx_get_lightfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_lightfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_lightfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_lightfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_lightfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightiv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_lightiv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; light:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_lightiv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_lightiv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; light:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_lightiv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightiv_data(R:Pxcb_glx_get_lightiv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightiv_data_length(R:Pxcb_glx_get_lightiv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_lightiv_data_end(R:Pxcb_glx_get_lightiv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_lightiv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_lightiv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_lightiv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_lightiv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapdv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_mapdv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; query:Tuint32_t):Txcb_glx_get_mapdv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_mapdv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; query:Tuint32_t):Txcb_glx_get_mapdv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapdv_data(R:Pxcb_glx_get_mapdv_reply_t):Pxcb_glx_float64_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapdv_data_length(R:Pxcb_glx_get_mapdv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapdv_data_end(R:Pxcb_glx_get_mapdv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_mapdv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_mapdv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_mapdv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_mapdv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_mapfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; query:Tuint32_t):Txcb_glx_get_mapfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_mapfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; query:Tuint32_t):Txcb_glx_get_mapfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapfv_data(R:Pxcb_glx_get_mapfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapfv_data_length(R:Pxcb_glx_get_mapfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapfv_data_end(R:Pxcb_glx_get_mapfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_mapfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_mapfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_mapfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_mapfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapiv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_mapiv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; query:Tuint32_t):Txcb_glx_get_mapiv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_mapiv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; query:Tuint32_t):Txcb_glx_get_mapiv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapiv_data(R:Pxcb_glx_get_mapiv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapiv_data_length(R:Pxcb_glx_get_mapiv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_mapiv_data_end(R:Pxcb_glx_get_mapiv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_mapiv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_mapiv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_mapiv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_mapiv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_materialfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; face:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_materialfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_materialfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; face:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_materialfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialfv_data(R:Pxcb_glx_get_materialfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialfv_data_length(R:Pxcb_glx_get_materialfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialfv_data_end(R:Pxcb_glx_get_materialfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_materialfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_materialfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_materialfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_materialfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialiv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_materialiv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; face:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_materialiv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_materialiv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; face:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_materialiv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialiv_data(R:Pxcb_glx_get_materialiv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialiv_data_length(R:Pxcb_glx_get_materialiv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_materialiv_data_end(R:Pxcb_glx_get_materialiv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_materialiv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_materialiv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_materialiv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_materialiv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_pixel_mapfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; map:Tuint32_t):Txcb_glx_get_pixel_mapfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_pixel_mapfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; map:Tuint32_t):Txcb_glx_get_pixel_mapfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapfv_data(R:Pxcb_glx_get_pixel_mapfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapfv_data_length(R:Pxcb_glx_get_pixel_mapfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapfv_data_end(R:Pxcb_glx_get_pixel_mapfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_pixel_mapfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_pixel_mapfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_pixel_mapfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_pixel_mapfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapuiv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_pixel_mapuiv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; map:Tuint32_t):Txcb_glx_get_pixel_mapuiv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_pixel_mapuiv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; map:Tuint32_t):Txcb_glx_get_pixel_mapuiv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapuiv_data(R:Pxcb_glx_get_pixel_mapuiv_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapuiv_data_length(R:Pxcb_glx_get_pixel_mapuiv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapuiv_data_end(R:Pxcb_glx_get_pixel_mapuiv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_pixel_mapuiv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_pixel_mapuiv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_pixel_mapuiv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_pixel_mapuiv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapusv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_pixel_mapusv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; map:Tuint32_t):Txcb_glx_get_pixel_mapusv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_pixel_mapusv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; map:Tuint32_t):Txcb_glx_get_pixel_mapusv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapusv_data(R:Pxcb_glx_get_pixel_mapusv_reply_t):Puint16_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapusv_data_length(R:Pxcb_glx_get_pixel_mapusv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_pixel_mapusv_data_end(R:Pxcb_glx_get_pixel_mapusv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_pixel_mapusv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_pixel_mapusv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_pixel_mapusv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_pixel_mapusv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_polygon_stipple_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_polygon_stipple(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; lsb_first:Tuint8_t):Txcb_glx_get_polygon_stipple_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_polygon_stipple_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; lsb_first:Tuint8_t):Txcb_glx_get_polygon_stipple_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_polygon_stipple_data(R:Pxcb_glx_get_polygon_stipple_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_polygon_stipple_data_length(R:Pxcb_glx_get_polygon_stipple_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_polygon_stipple_data_end(R:Pxcb_glx_get_polygon_stipple_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_polygon_stipple_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_polygon_stipple_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_polygon_stipple_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_polygon_stipple_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_string_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_string(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; name:Tuint32_t):Txcb_glx_get_string_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_string_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; name:Tuint32_t):Txcb_glx_get_string_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_string_string(R:Pxcb_glx_get_string_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_string_string_length(R:Pxcb_glx_get_string_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_string_string_end(R:Pxcb_glx_get_string_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_string_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_string_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_string_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_string_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_envfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_envfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_envfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_envfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_envfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_envfv_data(R:Pxcb_glx_get_tex_envfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_envfv_data_length(R:Pxcb_glx_get_tex_envfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_envfv_data_end(R:Pxcb_glx_get_tex_envfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_envfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_envfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_envfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_envfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_enviv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_enviv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_enviv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_enviv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_enviv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_enviv_data(R:Pxcb_glx_get_tex_enviv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_enviv_data_length(R:Pxcb_glx_get_tex_enviv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_enviv_data_end(R:Pxcb_glx_get_tex_enviv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_enviv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_enviv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_enviv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_enviv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_gendv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_gendv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; coord:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_gendv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_gendv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; coord:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_gendv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_gendv_data(R:Pxcb_glx_get_tex_gendv_reply_t):Pxcb_glx_float64_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_gendv_data_length(R:Pxcb_glx_get_tex_gendv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_gendv_data_end(R:Pxcb_glx_get_tex_gendv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_gendv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_gendv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_gendv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_gendv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_genfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_genfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; coord:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_genfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_genfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; coord:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_genfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_genfv_data(R:Pxcb_glx_get_tex_genfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_genfv_data_length(R:Pxcb_glx_get_tex_genfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_genfv_data_end(R:Pxcb_glx_get_tex_genfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_genfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_genfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_genfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_genfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_geniv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_geniv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; coord:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_geniv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_geniv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; coord:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_geniv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_geniv_data(R:Pxcb_glx_get_tex_geniv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_geniv_data_length(R:Pxcb_glx_get_tex_geniv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_geniv_data_end(R:Pxcb_glx_get_tex_geniv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_geniv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_geniv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_geniv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_geniv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_image_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_image(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t; format:Tuint32_t; 
           _type:Tuint32_t; swap_bytes:Tuint8_t):Txcb_glx_get_tex_image_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_image_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t; format:Tuint32_t; 
           _type:Tuint32_t; swap_bytes:Tuint8_t):Txcb_glx_get_tex_image_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_image_data(R:Pxcb_glx_get_tex_image_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_image_data_length(R:Pxcb_glx_get_tex_image_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_image_data_end(R:Pxcb_glx_get_tex_image_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_image_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_image_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_image_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_image_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameterfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_parameterfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_parameterfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_parameterfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_parameterfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameterfv_data(R:Pxcb_glx_get_tex_parameterfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameterfv_data_length(R:Pxcb_glx_get_tex_parameterfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameterfv_data_end(R:Pxcb_glx_get_tex_parameterfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_parameterfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_parameterfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_parameterfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_parameterfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameteriv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_parameteriv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_parameteriv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_parameteriv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_tex_parameteriv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameteriv_data(R:Pxcb_glx_get_tex_parameteriv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameteriv_data_length(R:Pxcb_glx_get_tex_parameteriv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_parameteriv_data_end(R:Pxcb_glx_get_tex_parameteriv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_parameteriv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_parameteriv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_parameteriv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_parameteriv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameterfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_level_parameterfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t; pname:Tuint32_t):Txcb_glx_get_tex_level_parameterfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_level_parameterfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t; pname:Tuint32_t):Txcb_glx_get_tex_level_parameterfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameterfv_data(R:Pxcb_glx_get_tex_level_parameterfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameterfv_data_length(R:Pxcb_glx_get_tex_level_parameterfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameterfv_data_end(R:Pxcb_glx_get_tex_level_parameterfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_level_parameterfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_level_parameterfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_level_parameterfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_level_parameterfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameteriv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_tex_level_parameteriv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t; pname:Tuint32_t):Txcb_glx_get_tex_level_parameteriv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_tex_level_parameteriv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t; pname:Tuint32_t):Txcb_glx_get_tex_level_parameteriv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameteriv_data(R:Pxcb_glx_get_tex_level_parameteriv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameteriv_data_length(R:Pxcb_glx_get_tex_level_parameteriv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_tex_level_parameteriv_data_end(R:Pxcb_glx_get_tex_level_parameteriv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_tex_level_parameteriv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_tex_level_parameteriv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_tex_level_parameteriv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_tex_level_parameteriv_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_is_enabled(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; capability:Tuint32_t):Txcb_glx_is_enabled_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_is_enabled_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; capability:Tuint32_t):Txcb_glx_is_enabled_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_is_enabled_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_is_enabled_reply(c:Pxcb_connection_t; cookie:Txcb_glx_is_enabled_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_is_enabled_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_is_list(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; list:Tuint32_t):Txcb_glx_is_list_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_is_list_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; list:Tuint32_t):Txcb_glx_is_list_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_is_list_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_is_list_reply(c:Pxcb_connection_t; cookie:Txcb_glx_is_list_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_is_list_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_glx_flush_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_flush(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_are_textures_resident_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_are_textures_resident(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t; textures:Puint32_t):Txcb_glx_are_textures_resident_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_glx_are_textures_resident_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t; textures:Puint32_t):Txcb_glx_are_textures_resident_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_are_textures_resident_data(R:Pxcb_glx_are_textures_resident_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_are_textures_resident_data_length(R:Pxcb_glx_are_textures_resident_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_are_textures_resident_data_end(R:Pxcb_glx_are_textures_resident_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_are_textures_resident_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_are_textures_resident_reply(c:Pxcb_connection_t; cookie:Txcb_glx_are_textures_resident_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_are_textures_resident_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_textures_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_delete_textures_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t; textures:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_delete_textures(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t; textures:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_textures_textures(R:Pxcb_glx_delete_textures_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_textures_textures_length(R:Pxcb_glx_delete_textures_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_textures_textures_end(R:Pxcb_glx_delete_textures_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_textures_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_gen_textures(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t):Txcb_glx_gen_textures_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_gen_textures_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t):Txcb_glx_gen_textures_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_textures_data(R:Pxcb_glx_gen_textures_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_textures_data_length(R:Pxcb_glx_gen_textures_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_textures_data_end(R:Pxcb_glx_gen_textures_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_gen_textures_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_gen_textures_reply(c:Pxcb_connection_t; cookie:Txcb_glx_gen_textures_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_gen_textures_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_is_texture(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; texture:Tuint32_t):Txcb_glx_is_texture_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_is_texture_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; texture:Tuint32_t):Txcb_glx_is_texture_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_is_texture_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_is_texture_reply(c:Pxcb_connection_t; cookie:Txcb_glx_is_texture_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_is_texture_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_color_table(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t):Txcb_glx_get_color_table_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_color_table_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t):Txcb_glx_get_color_table_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_data(R:Pxcb_glx_get_color_table_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_data_length(R:Pxcb_glx_get_color_table_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_data_end(R:Pxcb_glx_get_color_table_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_color_table_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_color_table_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_color_table_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_color_table_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameterfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_color_table_parameterfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_color_table_parameterfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_color_table_parameterfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_color_table_parameterfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameterfv_data(R:Pxcb_glx_get_color_table_parameterfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameterfv_data_length(R:Pxcb_glx_get_color_table_parameterfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameterfv_data_end(R:Pxcb_glx_get_color_table_parameterfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_color_table_parameterfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_color_table_parameterfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_color_table_parameterfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_color_table_parameterfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameteriv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_color_table_parameteriv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_color_table_parameteriv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_color_table_parameteriv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_color_table_parameteriv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameteriv_data(R:Pxcb_glx_get_color_table_parameteriv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameteriv_data_length(R:Pxcb_glx_get_color_table_parameteriv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_color_table_parameteriv_data_end(R:Pxcb_glx_get_color_table_parameteriv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_color_table_parameteriv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_color_table_parameteriv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_color_table_parameteriv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_color_table_parameteriv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_filter_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_convolution_filter(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t):Txcb_glx_get_convolution_filter_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_convolution_filter_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t):Txcb_glx_get_convolution_filter_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_filter_data(R:Pxcb_glx_get_convolution_filter_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_filter_data_length(R:Pxcb_glx_get_convolution_filter_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_filter_data_end(R:Pxcb_glx_get_convolution_filter_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_convolution_filter_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_convolution_filter_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_convolution_filter_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_convolution_filter_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameterfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_convolution_parameterfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_convolution_parameterfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_convolution_parameterfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_convolution_parameterfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameterfv_data(R:Pxcb_glx_get_convolution_parameterfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameterfv_data_length(R:Pxcb_glx_get_convolution_parameterfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameterfv_data_end(R:Pxcb_glx_get_convolution_parameterfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_convolution_parameterfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_convolution_parameterfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_convolution_parameterfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_convolution_parameterfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameteriv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_convolution_parameteriv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_convolution_parameteriv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_convolution_parameteriv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_convolution_parameteriv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameteriv_data(R:Pxcb_glx_get_convolution_parameteriv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameteriv_data_length(R:Pxcb_glx_get_convolution_parameteriv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_convolution_parameteriv_data_end(R:Pxcb_glx_get_convolution_parameteriv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_convolution_parameteriv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_convolution_parameteriv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_convolution_parameteriv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_convolution_parameteriv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_separable_filter_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_separable_filter(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t):Txcb_glx_get_separable_filter_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_separable_filter_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t):Txcb_glx_get_separable_filter_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_separable_filter_rows_and_cols(R:Pxcb_glx_get_separable_filter_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_separable_filter_rows_and_cols_length(R:Pxcb_glx_get_separable_filter_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_separable_filter_rows_and_cols_end(R:Pxcb_glx_get_separable_filter_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_separable_filter_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_separable_filter_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_separable_filter_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_separable_filter_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_histogram(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t; reset:Tuint8_t):Txcb_glx_get_histogram_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_histogram_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t; reset:Tuint8_t):Txcb_glx_get_histogram_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_data(R:Pxcb_glx_get_histogram_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_data_length(R:Pxcb_glx_get_histogram_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_data_end(R:Pxcb_glx_get_histogram_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_histogram_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_histogram_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_histogram_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_histogram_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameterfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_histogram_parameterfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_histogram_parameterfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_histogram_parameterfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_histogram_parameterfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameterfv_data(R:Pxcb_glx_get_histogram_parameterfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameterfv_data_length(R:Pxcb_glx_get_histogram_parameterfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameterfv_data_end(R:Pxcb_glx_get_histogram_parameterfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_histogram_parameterfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_histogram_parameterfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_histogram_parameterfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_histogram_parameterfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameteriv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_histogram_parameteriv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_histogram_parameteriv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_histogram_parameteriv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_histogram_parameteriv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameteriv_data(R:Pxcb_glx_get_histogram_parameteriv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameteriv_data_length(R:Pxcb_glx_get_histogram_parameteriv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_histogram_parameteriv_data_end(R:Pxcb_glx_get_histogram_parameteriv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_histogram_parameteriv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_histogram_parameteriv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_histogram_parameteriv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_histogram_parameteriv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_minmax(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t; reset:Tuint8_t):Txcb_glx_get_minmax_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_minmax_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; format:Tuint32_t; _type:Tuint32_t; 
           swap_bytes:Tuint8_t; reset:Tuint8_t):Txcb_glx_get_minmax_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_data(R:Pxcb_glx_get_minmax_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_data_length(R:Pxcb_glx_get_minmax_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_data_end(R:Pxcb_glx_get_minmax_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_minmax_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_minmax_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_minmax_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_minmax_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameterfv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_minmax_parameterfv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_minmax_parameterfv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_minmax_parameterfv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_minmax_parameterfv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameterfv_data(R:Pxcb_glx_get_minmax_parameterfv_reply_t):Pxcb_glx_float32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameterfv_data_length(R:Pxcb_glx_get_minmax_parameterfv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameterfv_data_end(R:Pxcb_glx_get_minmax_parameterfv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_minmax_parameterfv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_minmax_parameterfv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_minmax_parameterfv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_minmax_parameterfv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameteriv_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_minmax_parameteriv(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_minmax_parameteriv_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_minmax_parameteriv_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_minmax_parameteriv_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameteriv_data(R:Pxcb_glx_get_minmax_parameteriv_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameteriv_data_length(R:Pxcb_glx_get_minmax_parameteriv_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_minmax_parameteriv_data_end(R:Pxcb_glx_get_minmax_parameteriv_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_minmax_parameteriv_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_minmax_parameteriv_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_minmax_parameteriv_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_minmax_parameteriv_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_compressed_tex_image_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_compressed_tex_image_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t):Txcb_glx_get_compressed_tex_image_arb_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_compressed_tex_image_arb_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; level:Tint32_t):Txcb_glx_get_compressed_tex_image_arb_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_compressed_tex_image_arb_data(R:Pxcb_glx_get_compressed_tex_image_arb_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_compressed_tex_image_arb_data_length(R:Pxcb_glx_get_compressed_tex_image_arb_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_compressed_tex_image_arb_data_end(R:Pxcb_glx_get_compressed_tex_image_arb_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_compressed_tex_image_arb_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_compressed_tex_image_arb_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_compressed_tex_image_arb_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_compressed_tex_image_arb_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_queries_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_glx_delete_queries_arb_checked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t; ids:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_glx_delete_queries_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t; ids:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_queries_arb_ids(R:Pxcb_glx_delete_queries_arb_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_queries_arb_ids_length(R:Pxcb_glx_delete_queries_arb_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_delete_queries_arb_ids_end(R:Pxcb_glx_delete_queries_arb_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_queries_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_gen_queries_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t):Txcb_glx_gen_queries_arb_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_gen_queries_arb_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; n:Tint32_t):Txcb_glx_gen_queries_arb_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_queries_arb_data(R:Pxcb_glx_gen_queries_arb_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_queries_arb_data_length(R:Pxcb_glx_gen_queries_arb_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_gen_queries_arb_data_end(R:Pxcb_glx_gen_queries_arb_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_gen_queries_arb_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_gen_queries_arb_reply(c:Pxcb_connection_t; cookie:Txcb_glx_gen_queries_arb_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_gen_queries_arb_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_is_query_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; id:Tuint32_t):Txcb_glx_is_query_arb_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_is_query_arb_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; id:Tuint32_t):Txcb_glx_is_query_arb_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_is_query_arb_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_is_query_arb_reply(c:Pxcb_connection_t; cookie:Txcb_glx_is_query_arb_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_is_query_arb_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_queryiv_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_queryiv_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_queryiv_arb_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_queryiv_arb_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; target:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_queryiv_arb_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_queryiv_arb_data(R:Pxcb_glx_get_queryiv_arb_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_queryiv_arb_data_length(R:Pxcb_glx_get_queryiv_arb_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_queryiv_arb_data_end(R:Pxcb_glx_get_queryiv_arb_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_queryiv_arb_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_queryiv_arb_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_queryiv_arb_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_queryiv_arb_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectiv_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_query_objectiv_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; id:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_query_objectiv_arb_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_query_objectiv_arb_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; id:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_query_objectiv_arb_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectiv_arb_data(R:Pxcb_glx_get_query_objectiv_arb_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectiv_arb_data_length(R:Pxcb_glx_get_query_objectiv_arb_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectiv_arb_data_end(R:Pxcb_glx_get_query_objectiv_arb_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_query_objectiv_arb_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_query_objectiv_arb_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_query_objectiv_arb_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_query_objectiv_arb_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectuiv_arb_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_glx_get_query_objectuiv_arb(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; id:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_query_objectuiv_arb_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_glx_get_query_objectuiv_arb_unchecked(c:Pxcb_connection_t; context_tag:Txcb_glx_context_tag_t; id:Tuint32_t; pname:Tuint32_t):Txcb_glx_get_query_objectuiv_arb_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectuiv_arb_data(R:Pxcb_glx_get_query_objectuiv_arb_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectuiv_arb_data_length(R:Pxcb_glx_get_query_objectuiv_arb_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_glx_get_query_objectuiv_arb_data_end(R:Pxcb_glx_get_query_objectuiv_arb_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_glx_get_query_objectuiv_arb_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_glx_get_query_objectuiv_arb_reply(c:Pxcb_connection_t; cookie:Txcb_glx_get_query_objectuiv_arb_cookie_t; e:PPxcb_generic_error_t):Pxcb_glx_get_query_objectuiv_arb_reply_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
