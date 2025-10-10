
unit render;
interface

{
  Automatically converted by H2Pas 1.0.0 from render.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    render.h
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
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_rectangle_t  = ^xcb_rectangle_t;
Pxcb_render_add_glyphs_request_t  = ^xcb_render_add_glyphs_request_t;
Pxcb_render_add_traps_request_t  = ^xcb_render_add_traps_request_t;
Pxcb_render_animcursorelt_iterator_t  = ^xcb_render_animcursorelt_iterator_t;
Pxcb_render_animcursorelt_t  = ^xcb_render_animcursorelt_t;
Pxcb_render_change_picture_request_t  = ^xcb_render_change_picture_request_t;
Pxcb_render_change_picture_value_list_t  = ^xcb_render_change_picture_value_list_t;
Pxcb_render_color_iterator_t  = ^xcb_render_color_iterator_t;
Pxcb_render_color_t  = ^xcb_render_color_t;
Pxcb_render_composite_glyphs_16_request_t  = ^xcb_render_composite_glyphs_16_request_t;
Pxcb_render_composite_glyphs_32_request_t  = ^xcb_render_composite_glyphs_32_request_t;
Pxcb_render_composite_glyphs_8_request_t  = ^xcb_render_composite_glyphs_8_request_t;
Pxcb_render_composite_request_t  = ^xcb_render_composite_request_t;
Pxcb_render_cp_t  = ^xcb_render_cp_t;
Pxcb_render_create_anim_cursor_request_t  = ^xcb_render_create_anim_cursor_request_t;
Pxcb_render_create_conical_gradient_request_t  = ^xcb_render_create_conical_gradient_request_t;
Pxcb_render_create_cursor_request_t  = ^xcb_render_create_cursor_request_t;
Pxcb_render_create_glyph_set_request_t  = ^xcb_render_create_glyph_set_request_t;
Pxcb_render_create_linear_gradient_request_t  = ^xcb_render_create_linear_gradient_request_t;
Pxcb_render_create_picture_request_t  = ^xcb_render_create_picture_request_t;
Pxcb_render_create_picture_value_list_t  = ^xcb_render_create_picture_value_list_t;
Pxcb_render_create_radial_gradient_request_t  = ^xcb_render_create_radial_gradient_request_t;
Pxcb_render_create_solid_fill_request_t  = ^xcb_render_create_solid_fill_request_t;
Pxcb_render_directformat_iterator_t  = ^xcb_render_directformat_iterator_t;
Pxcb_render_directformat_t  = ^xcb_render_directformat_t;
Pxcb_render_fill_rectangles_request_t  = ^xcb_render_fill_rectangles_request_t;
Pxcb_render_fixed_iterator_t  = ^xcb_render_fixed_iterator_t;
Pxcb_render_fixed_t  = ^xcb_render_fixed_t;
Pxcb_render_free_glyph_set_request_t  = ^xcb_render_free_glyph_set_request_t;
Pxcb_render_free_glyphs_request_t  = ^xcb_render_free_glyphs_request_t;
Pxcb_render_free_picture_request_t  = ^xcb_render_free_picture_request_t;
Pxcb_render_glyph_error_t  = ^xcb_render_glyph_error_t;
Pxcb_render_glyph_iterator_t  = ^xcb_render_glyph_iterator_t;
Pxcb_render_glyph_set_error_t  = ^xcb_render_glyph_set_error_t;
Pxcb_render_glyph_t  = ^xcb_render_glyph_t;
Pxcb_render_glyphinfo_iterator_t  = ^xcb_render_glyphinfo_iterator_t;
Pxcb_render_glyphinfo_t  = ^xcb_render_glyphinfo_t;
Pxcb_render_glyphset_iterator_t  = ^xcb_render_glyphset_iterator_t;
Pxcb_render_glyphset_t  = ^xcb_render_glyphset_t;
Pxcb_render_indexvalue_iterator_t  = ^xcb_render_indexvalue_iterator_t;
Pxcb_render_indexvalue_t  = ^xcb_render_indexvalue_t;
Pxcb_render_linefix_iterator_t  = ^xcb_render_linefix_iterator_t;
Pxcb_render_linefix_t  = ^xcb_render_linefix_t;
Pxcb_render_pict_format_error_t  = ^xcb_render_pict_format_error_t;
Pxcb_render_pict_op_error_t  = ^xcb_render_pict_op_error_t;
Pxcb_render_pict_op_t  = ^xcb_render_pict_op_t;
Pxcb_render_pict_type_t  = ^xcb_render_pict_type_t;
Pxcb_render_pictdepth_iterator_t  = ^xcb_render_pictdepth_iterator_t;
Pxcb_render_pictdepth_t  = ^xcb_render_pictdepth_t;
Pxcb_render_pictformat_iterator_t  = ^xcb_render_pictformat_iterator_t;
Pxcb_render_pictformat_t  = ^xcb_render_pictformat_t;
Pxcb_render_pictforminfo_iterator_t  = ^xcb_render_pictforminfo_iterator_t;
Pxcb_render_pictforminfo_t  = ^xcb_render_pictforminfo_t;
Pxcb_render_pictscreen_iterator_t  = ^xcb_render_pictscreen_iterator_t;
Pxcb_render_pictscreen_t  = ^xcb_render_pictscreen_t;
Pxcb_render_picture_enum_t  = ^xcb_render_picture_enum_t;
Pxcb_render_picture_error_t  = ^xcb_render_picture_error_t;
Pxcb_render_picture_iterator_t  = ^xcb_render_picture_iterator_t;
Pxcb_render_picture_t  = ^xcb_render_picture_t;
Pxcb_render_pictvisual_iterator_t  = ^xcb_render_pictvisual_iterator_t;
Pxcb_render_pictvisual_t  = ^xcb_render_pictvisual_t;
Pxcb_render_pointfix_iterator_t  = ^xcb_render_pointfix_iterator_t;
Pxcb_render_pointfix_t  = ^xcb_render_pointfix_t;
Pxcb_render_poly_edge_t  = ^xcb_render_poly_edge_t;
Pxcb_render_poly_mode_t  = ^xcb_render_poly_mode_t;
Pxcb_render_query_filters_cookie_t  = ^xcb_render_query_filters_cookie_t;
Pxcb_render_query_filters_reply_t  = ^xcb_render_query_filters_reply_t;
Pxcb_render_query_filters_request_t  = ^xcb_render_query_filters_request_t;
Pxcb_render_query_pict_formats_cookie_t  = ^xcb_render_query_pict_formats_cookie_t;
Pxcb_render_query_pict_formats_reply_t  = ^xcb_render_query_pict_formats_reply_t;
Pxcb_render_query_pict_formats_request_t  = ^xcb_render_query_pict_formats_request_t;
Pxcb_render_query_pict_index_values_cookie_t  = ^xcb_render_query_pict_index_values_cookie_t;
Pxcb_render_query_pict_index_values_reply_t  = ^xcb_render_query_pict_index_values_reply_t;
Pxcb_render_query_pict_index_values_request_t  = ^xcb_render_query_pict_index_values_request_t;
Pxcb_render_query_version_cookie_t  = ^xcb_render_query_version_cookie_t;
Pxcb_render_query_version_reply_t  = ^xcb_render_query_version_reply_t;
Pxcb_render_query_version_request_t  = ^xcb_render_query_version_request_t;
Pxcb_render_reference_glyph_set_request_t  = ^xcb_render_reference_glyph_set_request_t;
Pxcb_render_repeat_t  = ^xcb_render_repeat_t;
Pxcb_render_set_picture_clip_rectangles_request_t  = ^xcb_render_set_picture_clip_rectangles_request_t;
Pxcb_render_set_picture_filter_request_t  = ^xcb_render_set_picture_filter_request_t;
Pxcb_render_set_picture_transform_request_t  = ^xcb_render_set_picture_transform_request_t;
Pxcb_render_spanfix_iterator_t  = ^xcb_render_spanfix_iterator_t;
Pxcb_render_spanfix_t  = ^xcb_render_spanfix_t;
Pxcb_render_sub_pixel_t  = ^xcb_render_sub_pixel_t;
Pxcb_render_transform_iterator_t  = ^xcb_render_transform_iterator_t;
Pxcb_render_transform_t  = ^xcb_render_transform_t;
Pxcb_render_trap_iterator_t  = ^xcb_render_trap_iterator_t;
Pxcb_render_trap_t  = ^xcb_render_trap_t;
Pxcb_render_trapezoid_iterator_t  = ^xcb_render_trapezoid_iterator_t;
Pxcb_render_trapezoid_t  = ^xcb_render_trapezoid_t;
Pxcb_render_trapezoids_request_t  = ^xcb_render_trapezoids_request_t;
Pxcb_render_tri_fan_request_t  = ^xcb_render_tri_fan_request_t;
Pxcb_render_tri_strip_request_t  = ^xcb_render_tri_strip_request_t;
Pxcb_render_triangle_iterator_t  = ^xcb_render_triangle_iterator_t;
Pxcb_render_triangle_t  = ^xcb_render_triangle_t;
Pxcb_render_triangles_request_t  = ^xcb_render_triangles_request_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from render.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Render_API XCB Render API
 * @brief Render XCB Protocol Implementation.
 * @
 * }
{$ifndef __RENDER_H}
{$define __RENDER_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_RENDER_MAJOR_VERSION = 0;  
  XCB_RENDER_MINOR_VERSION = 11;  
  var
    xcb_render_id : Txcb_extension_t;cvar;external;
type
  Pxcb_render_pict_type_t = ^Txcb_render_pict_type_t;
  Txcb_render_pict_type_t =  Longint;
  Const
    XCB_RENDER_PICT_TYPE_INDEXED = 0;
    XCB_RENDER_PICT_TYPE_DIRECT = 1;
;
type
  Pxcb_render_picture_enum_t = ^Txcb_render_picture_enum_t;
  Txcb_render_picture_enum_t =  Longint;
  Const
    XCB_RENDER_PICTURE_NONE = 0;
;
type
  Pxcb_render_pict_op_t = ^Txcb_render_pict_op_t;
  Txcb_render_pict_op_t =  Longint;
  Const
    XCB_RENDER_PICT_OP_CLEAR = 0;
    XCB_RENDER_PICT_OP_SRC = 1;
    XCB_RENDER_PICT_OP_DST = 2;
    XCB_RENDER_PICT_OP_OVER = 3;
    XCB_RENDER_PICT_OP_OVER_REVERSE = 4;
    XCB_RENDER_PICT_OP_IN = 5;
    XCB_RENDER_PICT_OP_IN_REVERSE = 6;
    XCB_RENDER_PICT_OP_OUT = 7;
    XCB_RENDER_PICT_OP_OUT_REVERSE = 8;
    XCB_RENDER_PICT_OP_ATOP = 9;
    XCB_RENDER_PICT_OP_ATOP_REVERSE = 10;
    XCB_RENDER_PICT_OP_XOR = 11;
    XCB_RENDER_PICT_OP_ADD = 12;
    XCB_RENDER_PICT_OP_SATURATE = 13;
    XCB_RENDER_PICT_OP_DISJOINT_CLEAR = 16;
    XCB_RENDER_PICT_OP_DISJOINT_SRC = 17;
    XCB_RENDER_PICT_OP_DISJOINT_DST = 18;
    XCB_RENDER_PICT_OP_DISJOINT_OVER = 19;
    XCB_RENDER_PICT_OP_DISJOINT_OVER_REVERSE = 20;
    XCB_RENDER_PICT_OP_DISJOINT_IN = 21;
    XCB_RENDER_PICT_OP_DISJOINT_IN_REVERSE = 22;
    XCB_RENDER_PICT_OP_DISJOINT_OUT = 23;
    XCB_RENDER_PICT_OP_DISJOINT_OUT_REVERSE = 24;
    XCB_RENDER_PICT_OP_DISJOINT_ATOP = 25;
    XCB_RENDER_PICT_OP_DISJOINT_ATOP_REVERSE = 26;
    XCB_RENDER_PICT_OP_DISJOINT_XOR = 27;
    XCB_RENDER_PICT_OP_CONJOINT_CLEAR = 32;
    XCB_RENDER_PICT_OP_CONJOINT_SRC = 33;
    XCB_RENDER_PICT_OP_CONJOINT_DST = 34;
    XCB_RENDER_PICT_OP_CONJOINT_OVER = 35;
    XCB_RENDER_PICT_OP_CONJOINT_OVER_REVERSE = 36;
    XCB_RENDER_PICT_OP_CONJOINT_IN = 37;
    XCB_RENDER_PICT_OP_CONJOINT_IN_REVERSE = 38;
    XCB_RENDER_PICT_OP_CONJOINT_OUT = 39;
    XCB_RENDER_PICT_OP_CONJOINT_OUT_REVERSE = 40;
    XCB_RENDER_PICT_OP_CONJOINT_ATOP = 41;
    XCB_RENDER_PICT_OP_CONJOINT_ATOP_REVERSE = 42;
    XCB_RENDER_PICT_OP_CONJOINT_XOR = 43;
    XCB_RENDER_PICT_OP_MULTIPLY = 48;
    XCB_RENDER_PICT_OP_SCREEN = 49;
    XCB_RENDER_PICT_OP_OVERLAY = 50;
    XCB_RENDER_PICT_OP_DARKEN = 51;
    XCB_RENDER_PICT_OP_LIGHTEN = 52;
    XCB_RENDER_PICT_OP_COLOR_DODGE = 53;
    XCB_RENDER_PICT_OP_COLOR_BURN = 54;
    XCB_RENDER_PICT_OP_HARD_LIGHT = 55;
    XCB_RENDER_PICT_OP_SOFT_LIGHT = 56;
    XCB_RENDER_PICT_OP_DIFFERENCE = 57;
    XCB_RENDER_PICT_OP_EXCLUSION = 58;
    XCB_RENDER_PICT_OP_HSL_HUE = 59;
    XCB_RENDER_PICT_OP_HSL_SATURATION = 60;
    XCB_RENDER_PICT_OP_HSL_COLOR = 61;
    XCB_RENDER_PICT_OP_HSL_LUMINOSITY = 62;
;
type
  Pxcb_render_poly_edge_t = ^Txcb_render_poly_edge_t;
  Txcb_render_poly_edge_t =  Longint;
  Const
    XCB_RENDER_POLY_EDGE_SHARP = 0;
    XCB_RENDER_POLY_EDGE_SMOOTH = 1;
;
type
  Pxcb_render_poly_mode_t = ^Txcb_render_poly_mode_t;
  Txcb_render_poly_mode_t =  Longint;
  Const
    XCB_RENDER_POLY_MODE_PRECISE = 0;
    XCB_RENDER_POLY_MODE_IMPRECISE = 1;
;
type
  Pxcb_render_cp_t = ^Txcb_render_cp_t;
  Txcb_render_cp_t =  Longint;
  Const
    XCB_RENDER_CP_REPEAT = 1;
    XCB_RENDER_CP_ALPHA_MAP = 2;
    XCB_RENDER_CP_ALPHA_X_ORIGIN = 4;
    XCB_RENDER_CP_ALPHA_Y_ORIGIN = 8;
    XCB_RENDER_CP_CLIP_X_ORIGIN = 16;
    XCB_RENDER_CP_CLIP_Y_ORIGIN = 32;
    XCB_RENDER_CP_CLIP_MASK = 64;
    XCB_RENDER_CP_GRAPHICS_EXPOSURE = 128;
    XCB_RENDER_CP_SUBWINDOW_MODE = 256;
    XCB_RENDER_CP_POLY_EDGE = 512;
    XCB_RENDER_CP_POLY_MODE = 1024;
    XCB_RENDER_CP_DITHER = 2048;
    XCB_RENDER_CP_COMPONENT_ALPHA = 4096;
;
type
  Pxcb_render_sub_pixel_t = ^Txcb_render_sub_pixel_t;
  Txcb_render_sub_pixel_t =  Longint;
  Const
    XCB_RENDER_SUB_PIXEL_UNKNOWN = 0;
    XCB_RENDER_SUB_PIXEL_HORIZONTAL_RGB = 1;
    XCB_RENDER_SUB_PIXEL_HORIZONTAL_BGR = 2;
    XCB_RENDER_SUB_PIXEL_VERTICAL_RGB = 3;
    XCB_RENDER_SUB_PIXEL_VERTICAL_BGR = 4;
    XCB_RENDER_SUB_PIXEL_NONE = 5;
;
type
  Pxcb_render_repeat_t = ^Txcb_render_repeat_t;
  Txcb_render_repeat_t =  Longint;
  Const
    XCB_RENDER_REPEAT_NONE = 0;
    XCB_RENDER_REPEAT_NORMAL = 1;
    XCB_RENDER_REPEAT_PAD = 2;
    XCB_RENDER_REPEAT_REFLECT = 3;
;
type
  Pxcb_render_glyph_t = ^Txcb_render_glyph_t;
  Txcb_render_glyph_t = Tuint32_t;
{*
 * @brief xcb_render_glyph_iterator_t
 * }

  Pxcb_render_glyph_iterator_t = ^Txcb_render_glyph_iterator_t;
  Txcb_render_glyph_iterator_t = record
      data : Pxcb_render_glyph_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_render_glyphset_t = ^Txcb_render_glyphset_t;
  Txcb_render_glyphset_t = Tuint32_t;
{*
 * @brief xcb_render_glyphset_iterator_t
 * }

  Pxcb_render_glyphset_iterator_t = ^Txcb_render_glyphset_iterator_t;
  Txcb_render_glyphset_iterator_t = record
      data : Pxcb_render_glyphset_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_render_picture_t = ^Txcb_render_picture_t;
  Txcb_render_picture_t = Tuint32_t;
{*
 * @brief xcb_render_picture_iterator_t
 * }

  Pxcb_render_picture_iterator_t = ^Txcb_render_picture_iterator_t;
  Txcb_render_picture_iterator_t = record
      data : Pxcb_render_picture_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_render_pictformat_t = ^Txcb_render_pictformat_t;
  Txcb_render_pictformat_t = Tuint32_t;
{*
 * @brief xcb_render_pictformat_iterator_t
 * }

  Pxcb_render_pictformat_iterator_t = ^Txcb_render_pictformat_iterator_t;
  Txcb_render_pictformat_iterator_t = record
      data : Pxcb_render_pictformat_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_render_fixed_t = ^Txcb_render_fixed_t;
  Txcb_render_fixed_t = Tint32_t;
{*
 * @brief xcb_render_fixed_iterator_t
 * }

  Pxcb_render_fixed_iterator_t = ^Txcb_render_fixed_iterator_t;
  Txcb_render_fixed_iterator_t = record
      data : Pxcb_render_fixed_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_render_pict_format.  }

const
  XCB_RENDER_PICT_FORMAT = 0;  
{*
 * @brief xcb_render_pict_format_error_t
 * }
type
  Pxcb_render_pict_format_error_t = ^Txcb_render_pict_format_error_t;
  Txcb_render_pict_format_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{* Opcode for xcb_render_picture.  }

const
  XCB_RENDER_PICTURE = 1;  
{*
 * @brief xcb_render_picture_error_t
 * }
type
  Pxcb_render_picture_error_t = ^Txcb_render_picture_error_t;
  Txcb_render_picture_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{* Opcode for xcb_render_pict_op.  }

const
  XCB_RENDER_PICT_OP = 2;  
{*
 * @brief xcb_render_pict_op_error_t
 * }
type
  Pxcb_render_pict_op_error_t = ^Txcb_render_pict_op_error_t;
  Txcb_render_pict_op_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{* Opcode for xcb_render_glyph_set.  }

const
  XCB_RENDER_GLYPH_SET = 3;  
{*
 * @brief xcb_render_glyph_set_error_t
 * }
type
  Pxcb_render_glyph_set_error_t = ^Txcb_render_glyph_set_error_t;
  Txcb_render_glyph_set_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{* Opcode for xcb_render_glyph.  }

const
  XCB_RENDER_GLYPH = 4;  
{*
 * @brief xcb_render_glyph_error_t
 * }
type
  Pxcb_render_glyph_error_t = ^Txcb_render_glyph_error_t;
  Txcb_render_glyph_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{*
 * @brief xcb_render_directformat_t
 * }

  Pxcb_render_directformat_t = ^Txcb_render_directformat_t;
  Txcb_render_directformat_t = record
      red_shift : Tuint16_t;
      red_mask : Tuint16_t;
      green_shift : Tuint16_t;
      green_mask : Tuint16_t;
      blue_shift : Tuint16_t;
      blue_mask : Tuint16_t;
      alpha_shift : Tuint16_t;
      alpha_mask : Tuint16_t;
    end;
{*
 * @brief xcb_render_directformat_iterator_t
 * }

  Pxcb_render_directformat_iterator_t = ^Txcb_render_directformat_iterator_t;
  Txcb_render_directformat_iterator_t = record
      data : Pxcb_render_directformat_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_pictforminfo_t
 * }

  Pxcb_render_pictforminfo_t = ^Txcb_render_pictforminfo_t;
  Txcb_render_pictforminfo_t = record
      id : Txcb_render_pictformat_t;
      _type : Tuint8_t;
      depth : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
      direct : Txcb_render_directformat_t;
      colormap : Txcb_colormap_t;
    end;
{*
 * @brief xcb_render_pictforminfo_iterator_t
 * }

  Pxcb_render_pictforminfo_iterator_t = ^Txcb_render_pictforminfo_iterator_t;
  Txcb_render_pictforminfo_iterator_t = record
      data : Pxcb_render_pictforminfo_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_pictvisual_t
 * }

  Pxcb_render_pictvisual_t = ^Txcb_render_pictvisual_t;
  Txcb_render_pictvisual_t = record
      visual : Txcb_visualid_t;
      format : Txcb_render_pictformat_t;
    end;
{*
 * @brief xcb_render_pictvisual_iterator_t
 * }

  Pxcb_render_pictvisual_iterator_t = ^Txcb_render_pictvisual_iterator_t;
  Txcb_render_pictvisual_iterator_t = record
      data : Pxcb_render_pictvisual_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_pictdepth_t
 * }

  Pxcb_render_pictdepth_t = ^Txcb_render_pictdepth_t;
  Txcb_render_pictdepth_t = record
      depth : Tuint8_t;
      pad0 : Tuint8_t;
      num_visuals : Tuint16_t;
      pad1 : array[0..3] of Tuint8_t;
    end;
{*
 * @brief xcb_render_pictdepth_iterator_t
 * }

  Pxcb_render_pictdepth_iterator_t = ^Txcb_render_pictdepth_iterator_t;
  Txcb_render_pictdepth_iterator_t = record
      data : Pxcb_render_pictdepth_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_pictscreen_t
 * }

  Pxcb_render_pictscreen_t = ^Txcb_render_pictscreen_t;
  Txcb_render_pictscreen_t = record
      num_depths : Tuint32_t;
      fallback : Txcb_render_pictformat_t;
    end;
{*
 * @brief xcb_render_pictscreen_iterator_t
 * }

  Pxcb_render_pictscreen_iterator_t = ^Txcb_render_pictscreen_iterator_t;
  Txcb_render_pictscreen_iterator_t = record
      data : Pxcb_render_pictscreen_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_indexvalue_t
 * }

  Pxcb_render_indexvalue_t = ^Txcb_render_indexvalue_t;
  Txcb_render_indexvalue_t = record
      pixel : Tuint32_t;
      red : Tuint16_t;
      green : Tuint16_t;
      blue : Tuint16_t;
      alpha : Tuint16_t;
    end;
{*
 * @brief xcb_render_indexvalue_iterator_t
 * }

  Pxcb_render_indexvalue_iterator_t = ^Txcb_render_indexvalue_iterator_t;
  Txcb_render_indexvalue_iterator_t = record
      data : Pxcb_render_indexvalue_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_color_t
 * }

  Pxcb_render_color_t = ^Txcb_render_color_t;
  Txcb_render_color_t = record
      red : Tuint16_t;
      green : Tuint16_t;
      blue : Tuint16_t;
      alpha : Tuint16_t;
    end;
{*
 * @brief xcb_render_color_iterator_t
 * }

  Pxcb_render_color_iterator_t = ^Txcb_render_color_iterator_t;
  Txcb_render_color_iterator_t = record
      data : Pxcb_render_color_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_pointfix_t
 * }

  Pxcb_render_pointfix_t = ^Txcb_render_pointfix_t;
  Txcb_render_pointfix_t = record
      x : Txcb_render_fixed_t;
      y : Txcb_render_fixed_t;
    end;
{*
 * @brief xcb_render_pointfix_iterator_t
 * }

  Pxcb_render_pointfix_iterator_t = ^Txcb_render_pointfix_iterator_t;
  Txcb_render_pointfix_iterator_t = record
      data : Pxcb_render_pointfix_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_linefix_t
 * }

  Pxcb_render_linefix_t = ^Txcb_render_linefix_t;
  Txcb_render_linefix_t = record
      p1 : Txcb_render_pointfix_t;
      p2 : Txcb_render_pointfix_t;
    end;
{*
 * @brief xcb_render_linefix_iterator_t
 * }

  Pxcb_render_linefix_iterator_t = ^Txcb_render_linefix_iterator_t;
  Txcb_render_linefix_iterator_t = record
      data : Pxcb_render_linefix_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_triangle_t
 * }

  Pxcb_render_triangle_t = ^Txcb_render_triangle_t;
  Txcb_render_triangle_t = record
      p1 : Txcb_render_pointfix_t;
      p2 : Txcb_render_pointfix_t;
      p3 : Txcb_render_pointfix_t;
    end;
{*
 * @brief xcb_render_triangle_iterator_t
 * }

  Pxcb_render_triangle_iterator_t = ^Txcb_render_triangle_iterator_t;
  Txcb_render_triangle_iterator_t = record
      data : Pxcb_render_triangle_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_trapezoid_t
 * }

  Pxcb_render_trapezoid_t = ^Txcb_render_trapezoid_t;
  Txcb_render_trapezoid_t = record
      top : Txcb_render_fixed_t;
      bottom : Txcb_render_fixed_t;
      left : Txcb_render_linefix_t;
      right : Txcb_render_linefix_t;
    end;
{*
 * @brief xcb_render_trapezoid_iterator_t
 * }

  Pxcb_render_trapezoid_iterator_t = ^Txcb_render_trapezoid_iterator_t;
  Txcb_render_trapezoid_iterator_t = record
      data : Pxcb_render_trapezoid_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_glyphinfo_t
 * }

  Pxcb_render_glyphinfo_t = ^Txcb_render_glyphinfo_t;
  Txcb_render_glyphinfo_t = record
      width : Tuint16_t;
      height : Tuint16_t;
      x : Tint16_t;
      y : Tint16_t;
      x_off : Tint16_t;
      y_off : Tint16_t;
    end;
{*
 * @brief xcb_render_glyphinfo_iterator_t
 * }

  Pxcb_render_glyphinfo_iterator_t = ^Txcb_render_glyphinfo_iterator_t;
  Txcb_render_glyphinfo_iterator_t = record
      data : Pxcb_render_glyphinfo_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_query_version_cookie_t
 * }

  Pxcb_render_query_version_cookie_t = ^Txcb_render_query_version_cookie_t;
  Txcb_render_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_render_query_version.  }

const
  XCB_RENDER_QUERY_VERSION = 0;  
{*
 * @brief xcb_render_query_version_request_t
 * }
type
  Pxcb_render_query_version_request_t = ^Txcb_render_query_version_request_t;
  Txcb_render_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint32_t;
      client_minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_render_query_version_reply_t
 * }

  Pxcb_render_query_version_reply_t = ^Txcb_render_query_version_reply_t;
  Txcb_render_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{*
 * @brief xcb_render_query_pict_formats_cookie_t
 * }

  Pxcb_render_query_pict_formats_cookie_t = ^Txcb_render_query_pict_formats_cookie_t;
  Txcb_render_query_pict_formats_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_render_query_pict_formats.  }

const
  XCB_RENDER_QUERY_PICT_FORMATS = 1;  
{*
 * @brief xcb_render_query_pict_formats_request_t
 * }
type
  Pxcb_render_query_pict_formats_request_t = ^Txcb_render_query_pict_formats_request_t;
  Txcb_render_query_pict_formats_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_render_query_pict_formats_reply_t
 * }

  Pxcb_render_query_pict_formats_reply_t = ^Txcb_render_query_pict_formats_reply_t;
  Txcb_render_query_pict_formats_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_formats : Tuint32_t;
      num_screens : Tuint32_t;
      num_depths : Tuint32_t;
      num_visuals : Tuint32_t;
      num_subpixel : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
    end;
{*
 * @brief xcb_render_query_pict_index_values_cookie_t
 * }

  Pxcb_render_query_pict_index_values_cookie_t = ^Txcb_render_query_pict_index_values_cookie_t;
  Txcb_render_query_pict_index_values_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_render_query_pict_index_values.  }

const
  XCB_RENDER_QUERY_PICT_INDEX_VALUES = 2;  
{*
 * @brief xcb_render_query_pict_index_values_request_t
 * }
type
  Pxcb_render_query_pict_index_values_request_t = ^Txcb_render_query_pict_index_values_request_t;
  Txcb_render_query_pict_index_values_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      format : Txcb_render_pictformat_t;
    end;
{*
 * @brief xcb_render_query_pict_index_values_reply_t
 * }

  Pxcb_render_query_pict_index_values_reply_t = ^Txcb_render_query_pict_index_values_reply_t;
  Txcb_render_query_pict_index_values_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_values : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_render_create_picture_value_list_t
 * }

  Pxcb_render_create_picture_value_list_t = ^Txcb_render_create_picture_value_list_t;
  Txcb_render_create_picture_value_list_t = record
      _repeat : Tuint32_t;
      alphamap : Txcb_render_picture_t;
      alphaxorigin : Tint32_t;
      alphayorigin : Tint32_t;
      clipxorigin : Tint32_t;
      clipyorigin : Tint32_t;
      clipmask : Txcb_pixmap_t;
      graphicsexposure : Tuint32_t;
      subwindowmode : Tuint32_t;
      polyedge : Tuint32_t;
      polymode : Tuint32_t;
      dither : Txcb_atom_t;
      componentalpha : Tuint32_t;
    end;
{* Opcode for xcb_render_create_picture.  }

const
  XCB_RENDER_CREATE_PICTURE = 4;  
{*
 * @brief xcb_render_create_picture_request_t
 * }
type
  Pxcb_render_create_picture_request_t = ^Txcb_render_create_picture_request_t;
  Txcb_render_create_picture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pid : Txcb_render_picture_t;
      drawable : Txcb_drawable_t;
      format : Txcb_render_pictformat_t;
      value_mask : Tuint32_t;
    end;
{*
 * @brief xcb_render_change_picture_value_list_t
 * }

  Pxcb_render_change_picture_value_list_t = ^Txcb_render_change_picture_value_list_t;
  Txcb_render_change_picture_value_list_t = record
      _repeat : Tuint32_t;
      alphamap : Txcb_render_picture_t;
      alphaxorigin : Tint32_t;
      alphayorigin : Tint32_t;
      clipxorigin : Tint32_t;
      clipyorigin : Tint32_t;
      clipmask : Txcb_pixmap_t;
      graphicsexposure : Tuint32_t;
      subwindowmode : Tuint32_t;
      polyedge : Tuint32_t;
      polymode : Tuint32_t;
      dither : Txcb_atom_t;
      componentalpha : Tuint32_t;
    end;
{* Opcode for xcb_render_change_picture.  }

const
  XCB_RENDER_CHANGE_PICTURE = 5;  
{*
 * @brief xcb_render_change_picture_request_t
 * }
type
  Pxcb_render_change_picture_request_t = ^Txcb_render_change_picture_request_t;
  Txcb_render_change_picture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      value_mask : Tuint32_t;
    end;
{* Opcode for xcb_render_set_picture_clip_rectangles.  }

const
  XCB_RENDER_SET_PICTURE_CLIP_RECTANGLES = 6;  
{*
 * @brief xcb_render_set_picture_clip_rectangles_request_t
 * }
type
  Pxcb_render_set_picture_clip_rectangles_request_t = ^Txcb_render_set_picture_clip_rectangles_request_t;
  Txcb_render_set_picture_clip_rectangles_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      clip_x_origin : Tint16_t;
      clip_y_origin : Tint16_t;
    end;
{* Opcode for xcb_render_free_picture.  }

const
  XCB_RENDER_FREE_PICTURE = 7;  
{*
 * @brief xcb_render_free_picture_request_t
 * }
type
  Pxcb_render_free_picture_request_t = ^Txcb_render_free_picture_request_t;
  Txcb_render_free_picture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
    end;
{* Opcode for xcb_render_composite.  }

const
  XCB_RENDER_COMPOSITE = 8;  
{*
 * @brief xcb_render_composite_request_t
 * }
type
  Pxcb_render_composite_request_t = ^Txcb_render_composite_request_t;
  Txcb_render_composite_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      mask : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
      mask_x : Tint16_t;
      mask_y : Tint16_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{* Opcode for xcb_render_trapezoids.  }

const
  XCB_RENDER_TRAPEZOIDS = 10;  
{*
 * @brief xcb_render_trapezoids_request_t
 * }
type
  Pxcb_render_trapezoids_request_t = ^Txcb_render_trapezoids_request_t;
  Txcb_render_trapezoids_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_triangles.  }

const
  XCB_RENDER_TRIANGLES = 11;  
{*
 * @brief xcb_render_triangles_request_t
 * }
type
  Pxcb_render_triangles_request_t = ^Txcb_render_triangles_request_t;
  Txcb_render_triangles_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_tri_strip.  }

const
  XCB_RENDER_TRI_STRIP = 12;  
{*
 * @brief xcb_render_tri_strip_request_t
 * }
type
  Pxcb_render_tri_strip_request_t = ^Txcb_render_tri_strip_request_t;
  Txcb_render_tri_strip_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_tri_fan.  }

const
  XCB_RENDER_TRI_FAN = 13;  
{*
 * @brief xcb_render_tri_fan_request_t
 * }
type
  Pxcb_render_tri_fan_request_t = ^Txcb_render_tri_fan_request_t;
  Txcb_render_tri_fan_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_create_glyph_set.  }

const
  XCB_RENDER_CREATE_GLYPH_SET = 17;  
{*
 * @brief xcb_render_create_glyph_set_request_t
 * }
type
  Pxcb_render_create_glyph_set_request_t = ^Txcb_render_create_glyph_set_request_t;
  Txcb_render_create_glyph_set_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      gsid : Txcb_render_glyphset_t;
      format : Txcb_render_pictformat_t;
    end;
{* Opcode for xcb_render_reference_glyph_set.  }

const
  XCB_RENDER_REFERENCE_GLYPH_SET = 18;  
{*
 * @brief xcb_render_reference_glyph_set_request_t
 * }
type
  Pxcb_render_reference_glyph_set_request_t = ^Txcb_render_reference_glyph_set_request_t;
  Txcb_render_reference_glyph_set_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      gsid : Txcb_render_glyphset_t;
      existing : Txcb_render_glyphset_t;
    end;
{* Opcode for xcb_render_free_glyph_set.  }

const
  XCB_RENDER_FREE_GLYPH_SET = 19;  
{*
 * @brief xcb_render_free_glyph_set_request_t
 * }
type
  Pxcb_render_free_glyph_set_request_t = ^Txcb_render_free_glyph_set_request_t;
  Txcb_render_free_glyph_set_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      glyphset : Txcb_render_glyphset_t;
    end;
{* Opcode for xcb_render_add_glyphs.  }

const
  XCB_RENDER_ADD_GLYPHS = 20;  
{*
 * @brief xcb_render_add_glyphs_request_t
 * }
type
  Pxcb_render_add_glyphs_request_t = ^Txcb_render_add_glyphs_request_t;
  Txcb_render_add_glyphs_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      glyphset : Txcb_render_glyphset_t;
      glyphs_len : Tuint32_t;
    end;
{* Opcode for xcb_render_free_glyphs.  }

const
  XCB_RENDER_FREE_GLYPHS = 22;  
{*
 * @brief xcb_render_free_glyphs_request_t
 * }
type
  Pxcb_render_free_glyphs_request_t = ^Txcb_render_free_glyphs_request_t;
  Txcb_render_free_glyphs_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      glyphset : Txcb_render_glyphset_t;
    end;
{* Opcode for xcb_render_composite_glyphs_8.  }

const
  XCB_RENDER_COMPOSITE_GLYPHS_8 = 23;  
{*
 * @brief xcb_render_composite_glyphs_8_request_t
 * }
type
  Pxcb_render_composite_glyphs_8_request_t = ^Txcb_render_composite_glyphs_8_request_t;
  Txcb_render_composite_glyphs_8_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      glyphset : Txcb_render_glyphset_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_composite_glyphs_16.  }

const
  XCB_RENDER_COMPOSITE_GLYPHS_16 = 24;  
{*
 * @brief xcb_render_composite_glyphs_16_request_t
 * }
type
  Pxcb_render_composite_glyphs_16_request_t = ^Txcb_render_composite_glyphs_16_request_t;
  Txcb_render_composite_glyphs_16_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      glyphset : Txcb_render_glyphset_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_composite_glyphs_32.  }

const
  XCB_RENDER_COMPOSITE_GLYPHS_32 = 25;  
{*
 * @brief xcb_render_composite_glyphs_32_request_t
 * }
type
  Pxcb_render_composite_glyphs_32_request_t = ^Txcb_render_composite_glyphs_32_request_t;
  Txcb_render_composite_glyphs_32_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      src : Txcb_render_picture_t;
      dst : Txcb_render_picture_t;
      mask_format : Txcb_render_pictformat_t;
      glyphset : Txcb_render_glyphset_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{* Opcode for xcb_render_fill_rectangles.  }

const
  XCB_RENDER_FILL_RECTANGLES = 26;  
{*
 * @brief xcb_render_fill_rectangles_request_t
 * }
type
  Pxcb_render_fill_rectangles_request_t = ^Txcb_render_fill_rectangles_request_t;
  Txcb_render_fill_rectangles_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      op : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      dst : Txcb_render_picture_t;
      color : Txcb_render_color_t;
    end;
{* Opcode for xcb_render_create_cursor.  }

const
  XCB_RENDER_CREATE_CURSOR = 27;  
{*
 * @brief xcb_render_create_cursor_request_t
 * }
type
  Pxcb_render_create_cursor_request_t = ^Txcb_render_create_cursor_request_t;
  Txcb_render_create_cursor_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      cid : Txcb_cursor_t;
      source : Txcb_render_picture_t;
      x : Tuint16_t;
      y : Tuint16_t;
    end;
{*
 * @brief xcb_render_transform_t
 * }

  Pxcb_render_transform_t = ^Txcb_render_transform_t;
  Txcb_render_transform_t = record
      matrix11 : Txcb_render_fixed_t;
      matrix12 : Txcb_render_fixed_t;
      matrix13 : Txcb_render_fixed_t;
      matrix21 : Txcb_render_fixed_t;
      matrix22 : Txcb_render_fixed_t;
      matrix23 : Txcb_render_fixed_t;
      matrix31 : Txcb_render_fixed_t;
      matrix32 : Txcb_render_fixed_t;
      matrix33 : Txcb_render_fixed_t;
    end;
{*
 * @brief xcb_render_transform_iterator_t
 * }

  Pxcb_render_transform_iterator_t = ^Txcb_render_transform_iterator_t;
  Txcb_render_transform_iterator_t = record
      data : Pxcb_render_transform_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_render_set_picture_transform.  }

const
  XCB_RENDER_SET_PICTURE_TRANSFORM = 28;  
{*
 * @brief xcb_render_set_picture_transform_request_t
 * }
type
  Pxcb_render_set_picture_transform_request_t = ^Txcb_render_set_picture_transform_request_t;
  Txcb_render_set_picture_transform_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      transform : Txcb_render_transform_t;
    end;
{*
 * @brief xcb_render_query_filters_cookie_t
 * }

  Pxcb_render_query_filters_cookie_t = ^Txcb_render_query_filters_cookie_t;
  Txcb_render_query_filters_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_render_query_filters.  }

const
  XCB_RENDER_QUERY_FILTERS = 29;  
{*
 * @brief xcb_render_query_filters_request_t
 * }
type
  Pxcb_render_query_filters_request_t = ^Txcb_render_query_filters_request_t;
  Txcb_render_query_filters_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{*
 * @brief xcb_render_query_filters_reply_t
 * }

  Pxcb_render_query_filters_reply_t = ^Txcb_render_query_filters_reply_t;
  Txcb_render_query_filters_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_aliases : Tuint32_t;
      num_filters : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_render_set_picture_filter.  }

const
  XCB_RENDER_SET_PICTURE_FILTER = 30;  
{*
 * @brief xcb_render_set_picture_filter_request_t
 * }
type
  Pxcb_render_set_picture_filter_request_t = ^Txcb_render_set_picture_filter_request_t;
  Txcb_render_set_picture_filter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      filter_len : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_render_animcursorelt_t
 * }

  Pxcb_render_animcursorelt_t = ^Txcb_render_animcursorelt_t;
  Txcb_render_animcursorelt_t = record
      cursor : Txcb_cursor_t;
      delay : Tuint32_t;
    end;
{*
 * @brief xcb_render_animcursorelt_iterator_t
 * }

  Pxcb_render_animcursorelt_iterator_t = ^Txcb_render_animcursorelt_iterator_t;
  Txcb_render_animcursorelt_iterator_t = record
      data : Pxcb_render_animcursorelt_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_render_create_anim_cursor.  }

const
  XCB_RENDER_CREATE_ANIM_CURSOR = 31;  
{*
 * @brief xcb_render_create_anim_cursor_request_t
 * }
type
  Pxcb_render_create_anim_cursor_request_t = ^Txcb_render_create_anim_cursor_request_t;
  Txcb_render_create_anim_cursor_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      cid : Txcb_cursor_t;
    end;
{*
 * @brief xcb_render_spanfix_t
 * }

  Pxcb_render_spanfix_t = ^Txcb_render_spanfix_t;
  Txcb_render_spanfix_t = record
      l : Txcb_render_fixed_t;
      r : Txcb_render_fixed_t;
      y : Txcb_render_fixed_t;
    end;
{*
 * @brief xcb_render_spanfix_iterator_t
 * }

  Pxcb_render_spanfix_iterator_t = ^Txcb_render_spanfix_iterator_t;
  Txcb_render_spanfix_iterator_t = record
      data : Pxcb_render_spanfix_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_render_trap_t
 * }

  Pxcb_render_trap_t = ^Txcb_render_trap_t;
  Txcb_render_trap_t = record
      top : Txcb_render_spanfix_t;
      bot : Txcb_render_spanfix_t;
    end;
{*
 * @brief xcb_render_trap_iterator_t
 * }

  Pxcb_render_trap_iterator_t = ^Txcb_render_trap_iterator_t;
  Txcb_render_trap_iterator_t = record
      data : Pxcb_render_trap_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_render_add_traps.  }

const
  XCB_RENDER_ADD_TRAPS = 32;  
{*
 * @brief xcb_render_add_traps_request_t
 * }
type
  Pxcb_render_add_traps_request_t = ^Txcb_render_add_traps_request_t;
  Txcb_render_add_traps_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      x_off : Tint16_t;
      y_off : Tint16_t;
    end;
{* Opcode for xcb_render_create_solid_fill.  }

const
  XCB_RENDER_CREATE_SOLID_FILL = 33;  
{*
 * @brief xcb_render_create_solid_fill_request_t
 * }
type
  Pxcb_render_create_solid_fill_request_t = ^Txcb_render_create_solid_fill_request_t;
  Txcb_render_create_solid_fill_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      color : Txcb_render_color_t;
    end;
{* Opcode for xcb_render_create_linear_gradient.  }

const
  XCB_RENDER_CREATE_LINEAR_GRADIENT = 34;  
{*
 * @brief xcb_render_create_linear_gradient_request_t
 * }
type
  Pxcb_render_create_linear_gradient_request_t = ^Txcb_render_create_linear_gradient_request_t;
  Txcb_render_create_linear_gradient_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      p1 : Txcb_render_pointfix_t;
      p2 : Txcb_render_pointfix_t;
      num_stops : Tuint32_t;
    end;
{* Opcode for xcb_render_create_radial_gradient.  }

const
  XCB_RENDER_CREATE_RADIAL_GRADIENT = 35;  
{*
 * @brief xcb_render_create_radial_gradient_request_t
 * }
type
  Pxcb_render_create_radial_gradient_request_t = ^Txcb_render_create_radial_gradient_request_t;
  Txcb_render_create_radial_gradient_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      inner : Txcb_render_pointfix_t;
      outer : Txcb_render_pointfix_t;
      inner_radius : Txcb_render_fixed_t;
      outer_radius : Txcb_render_fixed_t;
      num_stops : Tuint32_t;
    end;
{* Opcode for xcb_render_create_conical_gradient.  }

const
  XCB_RENDER_CREATE_CONICAL_GRADIENT = 36;  
{*
 * @brief xcb_render_create_conical_gradient_request_t
 * }
type
  Pxcb_render_create_conical_gradient_request_t = ^Txcb_render_create_conical_gradient_request_t;
  Txcb_render_create_conical_gradient_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      center : Txcb_render_pointfix_t;
      angle : Txcb_render_fixed_t;
      num_stops : Tuint32_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_glyph_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_glyph_t)
  }

procedure xcb_render_glyph_next(i:Pxcb_render_glyph_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_glyph_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_glyph_end(i:Txcb_render_glyph_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_glyphset_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_glyphset_t)
  }
procedure xcb_render_glyphset_next(i:Pxcb_render_glyphset_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_glyphset_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_glyphset_end(i:Txcb_render_glyphset_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_picture_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_picture_t)
  }
procedure xcb_render_picture_next(i:Pxcb_render_picture_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_picture_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_picture_end(i:Txcb_render_picture_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_pictformat_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_pictformat_t)
  }
procedure xcb_render_pictformat_next(i:Pxcb_render_pictformat_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_pictformat_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_pictformat_end(i:Txcb_render_pictformat_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_fixed_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_fixed_t)
  }
procedure xcb_render_fixed_next(i:Pxcb_render_fixed_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_fixed_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_fixed_end(i:Txcb_render_fixed_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_directformat_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_directformat_t)
  }
procedure xcb_render_directformat_next(i:Pxcb_render_directformat_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_directformat_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_directformat_end(i:Txcb_render_directformat_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_pictforminfo_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_pictforminfo_t)
  }
procedure xcb_render_pictforminfo_next(i:Pxcb_render_pictforminfo_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_pictforminfo_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_pictforminfo_end(i:Txcb_render_pictforminfo_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_pictvisual_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_pictvisual_t)
  }
procedure xcb_render_pictvisual_next(i:Pxcb_render_pictvisual_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_pictvisual_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_pictvisual_end(i:Txcb_render_pictvisual_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictdepth_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictdepth_visuals(R:Pxcb_render_pictdepth_t):Pxcb_render_pictvisual_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictdepth_visuals_length(R:Pxcb_render_pictdepth_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictdepth_visuals_iterator(R:Pxcb_render_pictdepth_t):Txcb_render_pictvisual_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_pictdepth_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_pictdepth_t)
  }
procedure xcb_render_pictdepth_next(i:Pxcb_render_pictdepth_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_pictdepth_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_pictdepth_end(i:Txcb_render_pictdepth_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictscreen_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictscreen_depths_length(R:Pxcb_render_pictscreen_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_pictscreen_depths_iterator(R:Pxcb_render_pictscreen_t):Txcb_render_pictdepth_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_pictscreen_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_pictscreen_t)
  }
procedure xcb_render_pictscreen_next(i:Pxcb_render_pictscreen_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_pictscreen_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_pictscreen_end(i:Txcb_render_pictscreen_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_indexvalue_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_indexvalue_t)
  }
procedure xcb_render_indexvalue_next(i:Pxcb_render_indexvalue_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_indexvalue_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_indexvalue_end(i:Txcb_render_indexvalue_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_color_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_color_t)
  }
procedure xcb_render_color_next(i:Pxcb_render_color_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_color_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_color_end(i:Txcb_render_color_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_pointfix_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_pointfix_t)
  }
procedure xcb_render_pointfix_next(i:Pxcb_render_pointfix_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_pointfix_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_pointfix_end(i:Txcb_render_pointfix_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_linefix_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_linefix_t)
  }
procedure xcb_render_linefix_next(i:Pxcb_render_linefix_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_linefix_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_linefix_end(i:Txcb_render_linefix_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_triangle_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_triangle_t)
  }
procedure xcb_render_triangle_next(i:Pxcb_render_triangle_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_triangle_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_triangle_end(i:Txcb_render_triangle_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_trapezoid_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_trapezoid_t)
  }
procedure xcb_render_trapezoid_next(i:Pxcb_render_trapezoid_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_trapezoid_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_trapezoid_end(i:Txcb_render_trapezoid_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_glyphinfo_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_glyphinfo_t)
  }
procedure xcb_render_glyphinfo_next(i:Pxcb_render_glyphinfo_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_glyphinfo_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_glyphinfo_end(i:Txcb_render_glyphinfo_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_query_version(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_render_query_version_cookie_t;cdecl;external;
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
function xcb_render_query_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_render_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_render_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_render_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_render_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_render_query_version_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_query_pict_formats(c:Pxcb_connection_t):Txcb_render_query_pict_formats_cookie_t;cdecl;external;
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
function xcb_render_query_pict_formats_unchecked(c:Pxcb_connection_t):Txcb_render_query_pict_formats_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_formats(R:Pxcb_render_query_pict_formats_reply_t):Pxcb_render_pictforminfo_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_formats_length(R:Pxcb_render_query_pict_formats_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_formats_iterator(R:Pxcb_render_query_pict_formats_reply_t):Txcb_render_pictforminfo_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_screens_length(R:Pxcb_render_query_pict_formats_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_screens_iterator(R:Pxcb_render_query_pict_formats_reply_t):Txcb_render_pictscreen_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_subpixels(R:Pxcb_render_query_pict_formats_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_subpixels_length(R:Pxcb_render_query_pict_formats_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_formats_subpixels_end(R:Pxcb_render_query_pict_formats_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_render_query_pict_formats_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_render_query_pict_formats_reply(c:Pxcb_connection_t; cookie:Txcb_render_query_pict_formats_cookie_t; e:PPxcb_generic_error_t):Pxcb_render_query_pict_formats_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_index_values_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_query_pict_index_values(c:Pxcb_connection_t; format:Txcb_render_pictformat_t):Txcb_render_query_pict_index_values_cookie_t;cdecl;external;
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
function xcb_render_query_pict_index_values_unchecked(c:Pxcb_connection_t; format:Txcb_render_pictformat_t):Txcb_render_query_pict_index_values_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_index_values_values(R:Pxcb_render_query_pict_index_values_reply_t):Pxcb_render_indexvalue_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_index_values_values_length(R:Pxcb_render_query_pict_index_values_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_pict_index_values_values_iterator(R:Pxcb_render_query_pict_index_values_reply_t):Txcb_render_indexvalue_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_render_query_pict_index_values_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_render_query_pict_index_values_reply(c:Pxcb_connection_t; cookie:Txcb_render_query_pict_index_values_cookie_t; e:PPxcb_generic_error_t):Pxcb_render_query_pict_index_values_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_picture_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_render_create_picture_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_picture_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_render_create_picture_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_picture_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_picture_sizeof(_buffer:pointer):longint;cdecl;external;
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
function xcb_render_create_picture_checked(c:Pxcb_connection_t; pid:Txcb_render_picture_t; drawable:Txcb_drawable_t; format:Txcb_render_pictformat_t; value_mask:Tuint32_t; 
           value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_create_picture(c:Pxcb_connection_t; pid:Txcb_render_picture_t; drawable:Txcb_drawable_t; format:Txcb_render_pictformat_t; value_mask:Tuint32_t; 
           value_list:pointer):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_create_picture_aux_checked(c:Pxcb_connection_t; pid:Txcb_render_picture_t; drawable:Txcb_drawable_t; format:Txcb_render_pictformat_t; value_mask:Tuint32_t; 
           value_list:Pxcb_render_create_picture_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_create_picture_aux(c:Pxcb_connection_t; pid:Txcb_render_picture_t; drawable:Txcb_drawable_t; format:Txcb_render_pictformat_t; value_mask:Tuint32_t; 
           value_list:Pxcb_render_create_picture_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_picture_value_list(R:Pxcb_render_create_picture_request_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_render_change_picture_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_render_change_picture_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_change_picture_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_render_change_picture_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_change_picture_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_change_picture_sizeof(_buffer:pointer):longint;cdecl;external;
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
function xcb_render_change_picture_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_change_picture(c:Pxcb_connection_t; picture:Txcb_render_picture_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_change_picture_aux_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; value_mask:Tuint32_t; value_list:Pxcb_render_change_picture_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_change_picture_aux(c:Pxcb_connection_t; picture:Txcb_render_picture_t; value_mask:Tuint32_t; value_list:Pxcb_render_change_picture_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_change_picture_value_list(R:Pxcb_render_change_picture_request_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_clip_rectangles_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_set_picture_clip_rectangles_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; clip_x_origin:Tint16_t; clip_y_origin:Tint16_t; rectangles_len:Tuint32_t; 
           rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_set_picture_clip_rectangles(c:Pxcb_connection_t; picture:Txcb_render_picture_t; clip_x_origin:Tint16_t; clip_y_origin:Tint16_t; rectangles_len:Tuint32_t; 
           rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_clip_rectangles_rectangles(R:Pxcb_render_set_picture_clip_rectangles_request_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_clip_rectangles_rectangles_length(R:Pxcb_render_set_picture_clip_rectangles_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_clip_rectangles_rectangles_iterator(R:Pxcb_render_set_picture_clip_rectangles_request_t):Txcb_rectangle_iterator_t;cdecl;external;
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
function xcb_render_free_picture_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_free_picture(c:Pxcb_connection_t; picture:Txcb_render_picture_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_composite_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; mask:Txcb_render_picture_t; dst:Txcb_render_picture_t; 
           src_x:Tint16_t; src_y:Tint16_t; mask_x:Tint16_t; mask_y:Tint16_t; dst_x:Tint16_t; 
           dst_y:Tint16_t; width:Tuint16_t; height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_composite(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; mask:Txcb_render_picture_t; dst:Txcb_render_picture_t; 
           src_x:Tint16_t; src_y:Tint16_t; mask_x:Tint16_t; mask_y:Tint16_t; dst_x:Tint16_t; 
           dst_y:Tint16_t; width:Tuint16_t; height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_trapezoids_sizeof(_buffer:pointer; traps_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_trapezoids_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; traps_len:Tuint32_t; traps:Pxcb_render_trapezoid_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_trapezoids(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; traps_len:Tuint32_t; traps:Pxcb_render_trapezoid_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_trapezoids_traps(R:Pxcb_render_trapezoids_request_t):Pxcb_render_trapezoid_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_trapezoids_traps_length(R:Pxcb_render_trapezoids_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_trapezoids_traps_iterator(R:Pxcb_render_trapezoids_request_t):Txcb_render_trapezoid_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_triangles_sizeof(_buffer:pointer; triangles_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_triangles_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; triangles_len:Tuint32_t; triangles:Pxcb_render_triangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_triangles(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; triangles_len:Tuint32_t; triangles:Pxcb_render_triangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_triangles_triangles(R:Pxcb_render_triangles_request_t):Pxcb_render_triangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_triangles_triangles_length(R:Pxcb_render_triangles_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_triangles_triangles_iterator(R:Pxcb_render_triangles_request_t):Txcb_render_triangle_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_strip_sizeof(_buffer:pointer; points_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_tri_strip_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; points_len:Tuint32_t; points:Pxcb_render_pointfix_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_tri_strip(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; points_len:Tuint32_t; points:Pxcb_render_pointfix_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_strip_points(R:Pxcb_render_tri_strip_request_t):Pxcb_render_pointfix_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_strip_points_length(R:Pxcb_render_tri_strip_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_strip_points_iterator(R:Pxcb_render_tri_strip_request_t):Txcb_render_pointfix_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_fan_sizeof(_buffer:pointer; points_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_tri_fan_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; points_len:Tuint32_t; points:Pxcb_render_pointfix_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_tri_fan(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; points_len:Tuint32_t; points:Pxcb_render_pointfix_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_fan_points(R:Pxcb_render_tri_fan_request_t):Pxcb_render_pointfix_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_fan_points_length(R:Pxcb_render_tri_fan_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_tri_fan_points_iterator(R:Pxcb_render_tri_fan_request_t):Txcb_render_pointfix_iterator_t;cdecl;external;
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
function xcb_render_create_glyph_set_checked(c:Pxcb_connection_t; gsid:Txcb_render_glyphset_t; format:Txcb_render_pictformat_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_create_glyph_set(c:Pxcb_connection_t; gsid:Txcb_render_glyphset_t; format:Txcb_render_pictformat_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_reference_glyph_set_checked(c:Pxcb_connection_t; gsid:Txcb_render_glyphset_t; existing:Txcb_render_glyphset_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_reference_glyph_set(c:Pxcb_connection_t; gsid:Txcb_render_glyphset_t; existing:Txcb_render_glyphset_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_free_glyph_set_checked(c:Pxcb_connection_t; glyphset:Txcb_render_glyphset_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_free_glyph_set(c:Pxcb_connection_t; glyphset:Txcb_render_glyphset_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_sizeof(_buffer:pointer; data_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_add_glyphs_checked(c:Pxcb_connection_t; glyphset:Txcb_render_glyphset_t; glyphs_len:Tuint32_t; glyphids:Puint32_t; glyphs:Pxcb_render_glyphinfo_t; 
           data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_add_glyphs(c:Pxcb_connection_t; glyphset:Txcb_render_glyphset_t; glyphs_len:Tuint32_t; glyphids:Puint32_t; glyphs:Pxcb_render_glyphinfo_t; 
           data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_glyphids(R:Pxcb_render_add_glyphs_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_glyphids_length(R:Pxcb_render_add_glyphs_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_glyphids_end(R:Pxcb_render_add_glyphs_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_glyphs(R:Pxcb_render_add_glyphs_request_t):Pxcb_render_glyphinfo_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_glyphs_length(R:Pxcb_render_add_glyphs_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_glyphs_iterator(R:Pxcb_render_add_glyphs_request_t):Txcb_render_glyphinfo_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_data(R:Pxcb_render_add_glyphs_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_data_length(R:Pxcb_render_add_glyphs_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_glyphs_data_end(R:Pxcb_render_add_glyphs_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_free_glyphs_sizeof(_buffer:pointer; glyphs_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_free_glyphs_checked(c:Pxcb_connection_t; glyphset:Txcb_render_glyphset_t; glyphs_len:Tuint32_t; glyphs:Pxcb_render_glyph_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_free_glyphs(c:Pxcb_connection_t; glyphset:Txcb_render_glyphset_t; glyphs_len:Tuint32_t; glyphs:Pxcb_render_glyph_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_free_glyphs_glyphs(R:Pxcb_render_free_glyphs_request_t):Pxcb_render_glyph_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_free_glyphs_glyphs_length(R:Pxcb_render_free_glyphs_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_free_glyphs_glyphs_end(R:Pxcb_render_free_glyphs_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_8_sizeof(_buffer:pointer; glyphcmds_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_composite_glyphs_8_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           glyphset:Txcb_render_glyphset_t; src_x:Tint16_t; src_y:Tint16_t; glyphcmds_len:Tuint32_t; glyphcmds:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_composite_glyphs_8(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           glyphset:Txcb_render_glyphset_t; src_x:Tint16_t; src_y:Tint16_t; glyphcmds_len:Tuint32_t; glyphcmds:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_8_glyphcmds(R:Pxcb_render_composite_glyphs_8_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_8_glyphcmds_length(R:Pxcb_render_composite_glyphs_8_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_8_glyphcmds_end(R:Pxcb_render_composite_glyphs_8_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_16_sizeof(_buffer:pointer; glyphcmds_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_composite_glyphs_16_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           glyphset:Txcb_render_glyphset_t; src_x:Tint16_t; src_y:Tint16_t; glyphcmds_len:Tuint32_t; glyphcmds:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_composite_glyphs_16(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           glyphset:Txcb_render_glyphset_t; src_x:Tint16_t; src_y:Tint16_t; glyphcmds_len:Tuint32_t; glyphcmds:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_16_glyphcmds(R:Pxcb_render_composite_glyphs_16_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_16_glyphcmds_length(R:Pxcb_render_composite_glyphs_16_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_16_glyphcmds_end(R:Pxcb_render_composite_glyphs_16_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_32_sizeof(_buffer:pointer; glyphcmds_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_composite_glyphs_32_checked(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           glyphset:Txcb_render_glyphset_t; src_x:Tint16_t; src_y:Tint16_t; glyphcmds_len:Tuint32_t; glyphcmds:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_composite_glyphs_32(c:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           glyphset:Txcb_render_glyphset_t; src_x:Tint16_t; src_y:Tint16_t; glyphcmds_len:Tuint32_t; glyphcmds:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_32_glyphcmds(R:Pxcb_render_composite_glyphs_32_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_32_glyphcmds_length(R:Pxcb_render_composite_glyphs_32_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_composite_glyphs_32_glyphcmds_end(R:Pxcb_render_composite_glyphs_32_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_fill_rectangles_sizeof(_buffer:pointer; rects_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_fill_rectangles_checked(c:Pxcb_connection_t; op:Tuint8_t; dst:Txcb_render_picture_t; color:Txcb_render_color_t; rects_len:Tuint32_t; 
           rects:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_fill_rectangles(c:Pxcb_connection_t; op:Tuint8_t; dst:Txcb_render_picture_t; color:Txcb_render_color_t; rects_len:Tuint32_t; 
           rects:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_fill_rectangles_rects(R:Pxcb_render_fill_rectangles_request_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_fill_rectangles_rects_length(R:Pxcb_render_fill_rectangles_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_fill_rectangles_rects_iterator(R:Pxcb_render_fill_rectangles_request_t):Txcb_rectangle_iterator_t;cdecl;external;
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
function xcb_render_create_cursor_checked(c:Pxcb_connection_t; cid:Txcb_cursor_t; source:Txcb_render_picture_t; x:Tuint16_t; y:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_create_cursor(c:Pxcb_connection_t; cid:Txcb_cursor_t; source:Txcb_render_picture_t; x:Tuint16_t; y:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_transform_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_transform_t)
  }
procedure xcb_render_transform_next(i:Pxcb_render_transform_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_transform_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_transform_end(i:Txcb_render_transform_iterator_t):Txcb_generic_iterator_t;cdecl;external;
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
function xcb_render_set_picture_transform_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; transform:Txcb_render_transform_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_set_picture_transform(c:Pxcb_connection_t; picture:Txcb_render_picture_t; transform:Txcb_render_transform_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_filters_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_query_filters(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_render_query_filters_cookie_t;cdecl;external;
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
function xcb_render_query_filters_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_render_query_filters_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_filters_aliases(R:Pxcb_render_query_filters_reply_t):Puint16_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_filters_aliases_length(R:Pxcb_render_query_filters_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_filters_aliases_end(R:Pxcb_render_query_filters_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_filters_filters_length(R:Pxcb_render_query_filters_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_query_filters_filters_iterator(R:Pxcb_render_query_filters_reply_t):Txcb_str_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_render_query_filters_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_render_query_filters_reply(c:Pxcb_connection_t; cookie:Txcb_render_query_filters_cookie_t; e:PPxcb_generic_error_t):Pxcb_render_query_filters_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_sizeof(_buffer:pointer; values_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_set_picture_filter_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; filter_len:Tuint16_t; filter:Pchar; values_len:Tuint32_t; 
           values:Pxcb_render_fixed_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_set_picture_filter(c:Pxcb_connection_t; picture:Txcb_render_picture_t; filter_len:Tuint16_t; filter:Pchar; values_len:Tuint32_t; 
           values:Pxcb_render_fixed_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_filter(R:Pxcb_render_set_picture_filter_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_filter_length(R:Pxcb_render_set_picture_filter_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_filter_end(R:Pxcb_render_set_picture_filter_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_values(R:Pxcb_render_set_picture_filter_request_t):Pxcb_render_fixed_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_values_length(R:Pxcb_render_set_picture_filter_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_set_picture_filter_values_end(R:Pxcb_render_set_picture_filter_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_animcursorelt_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_animcursorelt_t)
  }
procedure xcb_render_animcursorelt_next(i:Pxcb_render_animcursorelt_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_animcursorelt_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_animcursorelt_end(i:Txcb_render_animcursorelt_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_anim_cursor_sizeof(_buffer:pointer; cursors_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_create_anim_cursor_checked(c:Pxcb_connection_t; cid:Txcb_cursor_t; cursors_len:Tuint32_t; cursors:Pxcb_render_animcursorelt_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_create_anim_cursor(c:Pxcb_connection_t; cid:Txcb_cursor_t; cursors_len:Tuint32_t; cursors:Pxcb_render_animcursorelt_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_anim_cursor_cursors(R:Pxcb_render_create_anim_cursor_request_t):Pxcb_render_animcursorelt_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_anim_cursor_cursors_length(R:Pxcb_render_create_anim_cursor_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_anim_cursor_cursors_iterator(R:Pxcb_render_create_anim_cursor_request_t):Txcb_render_animcursorelt_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_spanfix_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_spanfix_t)
  }
procedure xcb_render_spanfix_next(i:Pxcb_render_spanfix_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_spanfix_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_spanfix_end(i:Txcb_render_spanfix_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_render_trap_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_render_trap_t)
  }
procedure xcb_render_trap_next(i:Pxcb_render_trap_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_render_trap_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_render_trap_end(i:Txcb_render_trap_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_traps_sizeof(_buffer:pointer; traps_len:Tuint32_t):longint;cdecl;external;
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
function xcb_render_add_traps_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; x_off:Tint16_t; y_off:Tint16_t; traps_len:Tuint32_t; 
           traps:Pxcb_render_trap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_render_add_traps(c:Pxcb_connection_t; picture:Txcb_render_picture_t; x_off:Tint16_t; y_off:Tint16_t; traps_len:Tuint32_t; 
           traps:Pxcb_render_trap_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_traps_traps(R:Pxcb_render_add_traps_request_t):Pxcb_render_trap_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_traps_traps_length(R:Pxcb_render_add_traps_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_add_traps_traps_iterator(R:Pxcb_render_add_traps_request_t):Txcb_render_trap_iterator_t;cdecl;external;
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
function xcb_render_create_solid_fill_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; color:Txcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_render_create_solid_fill(c:Pxcb_connection_t; picture:Txcb_render_picture_t; color:Txcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_sizeof(_buffer:pointer):longint;cdecl;external;
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
function xcb_render_create_linear_gradient_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; p1:Txcb_render_pointfix_t; p2:Txcb_render_pointfix_t; num_stops:Tuint32_t; 
           stops:Pxcb_render_fixed_t; colors:Pxcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_create_linear_gradient(c:Pxcb_connection_t; picture:Txcb_render_picture_t; p1:Txcb_render_pointfix_t; p2:Txcb_render_pointfix_t; num_stops:Tuint32_t; 
           stops:Pxcb_render_fixed_t; colors:Pxcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_stops(R:Pxcb_render_create_linear_gradient_request_t):Pxcb_render_fixed_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_stops_length(R:Pxcb_render_create_linear_gradient_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_stops_end(R:Pxcb_render_create_linear_gradient_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_colors(R:Pxcb_render_create_linear_gradient_request_t):Pxcb_render_color_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_colors_length(R:Pxcb_render_create_linear_gradient_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_linear_gradient_colors_iterator(R:Pxcb_render_create_linear_gradient_request_t):Txcb_render_color_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_sizeof(_buffer:pointer):longint;cdecl;external;
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
function xcb_render_create_radial_gradient_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; inner:Txcb_render_pointfix_t; outer:Txcb_render_pointfix_t; inner_radius:Txcb_render_fixed_t; 
           outer_radius:Txcb_render_fixed_t; num_stops:Tuint32_t; stops:Pxcb_render_fixed_t; colors:Pxcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_create_radial_gradient(c:Pxcb_connection_t; picture:Txcb_render_picture_t; inner:Txcb_render_pointfix_t; outer:Txcb_render_pointfix_t; inner_radius:Txcb_render_fixed_t; 
           outer_radius:Txcb_render_fixed_t; num_stops:Tuint32_t; stops:Pxcb_render_fixed_t; colors:Pxcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_stops(R:Pxcb_render_create_radial_gradient_request_t):Pxcb_render_fixed_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_stops_length(R:Pxcb_render_create_radial_gradient_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_stops_end(R:Pxcb_render_create_radial_gradient_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_colors(R:Pxcb_render_create_radial_gradient_request_t):Pxcb_render_color_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_colors_length(R:Pxcb_render_create_radial_gradient_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_radial_gradient_colors_iterator(R:Pxcb_render_create_radial_gradient_request_t):Txcb_render_color_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_sizeof(_buffer:pointer):longint;cdecl;external;
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
function xcb_render_create_conical_gradient_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; center:Txcb_render_pointfix_t; angle:Txcb_render_fixed_t; num_stops:Tuint32_t; 
           stops:Pxcb_render_fixed_t; colors:Pxcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_render_create_conical_gradient(c:Pxcb_connection_t; picture:Txcb_render_picture_t; center:Txcb_render_pointfix_t; angle:Txcb_render_fixed_t; num_stops:Tuint32_t; 
           stops:Pxcb_render_fixed_t; colors:Pxcb_render_color_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_stops(R:Pxcb_render_create_conical_gradient_request_t):Pxcb_render_fixed_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_stops_length(R:Pxcb_render_create_conical_gradient_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_stops_end(R:Pxcb_render_create_conical_gradient_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_colors(R:Pxcb_render_create_conical_gradient_request_t):Pxcb_render_color_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_colors_length(R:Pxcb_render_create_conical_gradient_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_render_create_conical_gradient_colors_iterator(R:Pxcb_render_create_conical_gradient_request_t):Txcb_render_color_iterator_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
