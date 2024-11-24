
unit pango_layout;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_layout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_layout.h
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
PGBytes  = ^GBytes;
PGError  = ^GError;
Pgint  = ^gint;
PGSList  = ^GSList;
Pgunichar  = ^gunichar;
Plongint  = ^longint;
PPangoAlignment  = ^PangoAlignment;
PPangoAttrList  = ^PangoAttrList;
PPangoContext  = ^PangoContext;
PPangoEllipsizeMode  = ^PangoEllipsizeMode;
PPangoFontDescription  = ^PangoFontDescription;
PPangoLayout  = ^PangoLayout;
PPangoLayoutDeserializeError  = ^PangoLayoutDeserializeError;
PPangoLayoutDeserializeFlags  = ^PangoLayoutDeserializeFlags;
PPangoLayoutIter  = ^PangoLayoutIter;
PPangoLayoutLine  = ^PangoLayoutLine;
PPangoLayoutRun  = ^PangoLayoutRun;
PPangoLayoutSerializeFlags  = ^PangoLayoutSerializeFlags;
PPangoLogAttr  = ^PangoLogAttr;
PPangoRectangle  = ^PangoRectangle;
PPangoTabArray  = ^PangoTabArray;
PPangoWrapMode  = ^PangoWrapMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-layout.h: High-level layout driver
 *
 * Copyright (C) 2000 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_LAYOUT_H__}
{$define __PANGO_LAYOUT_H__}
{$include <pango/pango-attributes.h>}
{$include <pango/pango-context.h>}
{$include <pango/pango-glyph-item.h>}
{$include <pango/pango-tabs.h>}
type
{*
 * PangoLayoutRun:
 *
 * A `PangoLayoutRun` represents a single run within a `PangoLayoutLine`.
 *
 * It is simply an alternate name for [struct@Pango.GlyphItem].
 * See the [struct@Pango.GlyphItem] docs for details on the fields.
  }

  PPangoLayoutRun = ^TPangoLayoutRun;
  TPangoLayoutRun = TPangoGlyphItem;
{*
 * PangoAlignment:
 * @PANGO_ALIGN_LEFT: Put all available space on the right
 * @PANGO_ALIGN_CENTER: Center the line within the available space
 * @PANGO_ALIGN_RIGHT: Put all available space on the left
 *
 * `PangoAlignment` describes how to align the lines of a `PangoLayout`
 * within the available space.
 *
 * If the `PangoLayout` is set to justify using [method@Pango.Layout.set_justify],
 * this only affects partial lines.
 *
 * See [method@Pango.Layout.set_auto_dir] for how text direction affects
 * the interpretation of `PangoAlignment` values.
  }

  PPangoAlignment = ^TPangoAlignment;
  TPangoAlignment =  Longint;
  Const
    PANGO_ALIGN_LEFT = 0;
    PANGO_ALIGN_CENTER = 1;
    PANGO_ALIGN_RIGHT = 2;
;
{*
 * PangoWrapMode:
 * @PANGO_WRAP_WORD: wrap lines at word boundaries.
 * @PANGO_WRAP_CHAR: wrap lines at character boundaries.
 * @PANGO_WRAP_WORD_CHAR: wrap lines at word boundaries, but fall back to
 *   character boundaries if there is not enough space for a full word.
 *
 * `PangoWrapMode` describes how to wrap the lines of a `PangoLayout`
 * to the desired width.
 *
 * For @PANGO_WRAP_WORD, Pango uses break opportunities that are determined
 * by the Unicode line breaking algorithm. For @PANGO_WRAP_CHAR, Pango allows
 * breaking at grapheme boundaries that are determined by the Unicode text
 * segmentation algorithm.
  }
type
  PPangoWrapMode = ^TPangoWrapMode;
  TPangoWrapMode =  Longint;
  Const
    PANGO_WRAP_WORD = 0;
    PANGO_WRAP_CHAR = 1;
    PANGO_WRAP_WORD_CHAR = 2;
;
{*
 * PangoEllipsizeMode:
 * @PANGO_ELLIPSIZE_NONE: No ellipsization
 * @PANGO_ELLIPSIZE_START: Omit characters at the start of the text
 * @PANGO_ELLIPSIZE_MIDDLE: Omit characters in the middle of the text
 * @PANGO_ELLIPSIZE_END: Omit characters at the end of the text
 *
 * `PangoEllipsizeMode` describes what sort of ellipsization
 * should be applied to text.
 *
 * In the ellipsization process characters are removed from the
 * text in order to make it fit to a given width and replaced
 * with an ellipsis.
  }
type
  PPangoEllipsizeMode = ^TPangoEllipsizeMode;
  TPangoEllipsizeMode =  Longint;
  Const
    PANGO_ELLIPSIZE_NONE = 0;
    PANGO_ELLIPSIZE_START = 1;
    PANGO_ELLIPSIZE_MIDDLE = 2;
    PANGO_ELLIPSIZE_END = 3;
;
{*
 * PangoLayoutLine:
 * @layout: (nullable): the layout this line belongs to, might be %NULL
 * @start_index: start of line as byte index into layout->text
 * @length: length of line in bytes
 * @runs: (nullable) (element-type Pango.LayoutRun): list of runs in the
 *   line, from left to right
 * @is_paragraph_start: #TRUE if this is the first line of the paragraph
 * @resolved_dir: #Resolved PangoDirection of line
 *
 * A `PangoLayoutLine` represents one of the lines resulting from laying
 * out a paragraph via `PangoLayout`.
 *
 * `PangoLayoutLine` structures are obtained by calling
 * [method@Pango.Layout.get_line] and are only valid until the text,
 * attributes, or settings of the parent `PangoLayout` are modified.
  }
{ start of line as byte index into layout->text  }
{ length of line in bytes  }
{ TRUE if this is the first line of the paragraph  }
{ Resolved PangoDirection of line  }
type
  PPangoLayoutLine = ^TPangoLayoutLine;
  TPangoLayoutLine = record
      layout : PPangoLayout;
      start_index : Tgint;
      length : Tgint;
      runs : PGSList;
      flag0 : word;
    end;


const
  bm_TPangoLayoutLine_is_paragraph_start = $1;
  bp_TPangoLayoutLine_is_paragraph_start = 0;
  bm_TPangoLayoutLine_resolved_dir = $E;
  bp_TPangoLayoutLine_resolved_dir = 1;

function is_paragraph_start(var a : TPangoLayoutLine) : Tguint;
procedure set_is_paragraph_start(var a : TPangoLayoutLine; __is_paragraph_start : Tguint);
function resolved_dir(var a : TPangoLayoutLine) : Tguint;
procedure set_resolved_dir(var a : TPangoLayoutLine; __resolved_dir : Tguint);

{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_GET_CLASS(obj : longint) : longint;

{ The PangoLayout and PangoLayoutClass structs are private; if you
 * need to create a subclass of these, file a bug.
  }
function pango_layout_get_type:TGType;cdecl;external;
function pango_layout_new(context:PPangoContext):PPangoLayout;cdecl;external;
function pango_layout_copy(src:PPangoLayout):PPangoLayout;cdecl;external;
function pango_layout_get_context(layout:PPangoLayout):PPangoContext;cdecl;external;
procedure pango_layout_set_attributes(layout:PPangoLayout; attrs:PPangoAttrList);cdecl;external;
function pango_layout_get_attributes(layout:PPangoLayout):PPangoAttrList;cdecl;external;
(* Const before type ignored *)
procedure pango_layout_set_text(layout:PPangoLayout; text:Pchar; length:longint);cdecl;external;
(* Const before type ignored *)
function pango_layout_get_text(layout:PPangoLayout):Pchar;cdecl;external;
function pango_layout_get_character_count(layout:PPangoLayout):Tgint;cdecl;external;
(* Const before type ignored *)
procedure pango_layout_set_markup(layout:PPangoLayout; markup:Pchar; length:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_layout_set_markup_with_accel(layout:PPangoLayout; markup:Pchar; length:longint; accel_marker:Tgunichar; accel_char:Pgunichar);cdecl;external;
(* Const before type ignored *)
procedure pango_layout_set_font_description(layout:PPangoLayout; desc:PPangoFontDescription);cdecl;external;
(* Const before type ignored *)
function pango_layout_get_font_description(layout:PPangoLayout):PPangoFontDescription;cdecl;external;
procedure pango_layout_set_width(layout:PPangoLayout; width:longint);cdecl;external;
function pango_layout_get_width(layout:PPangoLayout):longint;cdecl;external;
procedure pango_layout_set_height(layout:PPangoLayout; height:longint);cdecl;external;
function pango_layout_get_height(layout:PPangoLayout):longint;cdecl;external;
procedure pango_layout_set_wrap(layout:PPangoLayout; wrap:TPangoWrapMode);cdecl;external;
function pango_layout_get_wrap(layout:PPangoLayout):TPangoWrapMode;cdecl;external;
function pango_layout_is_wrapped(layout:PPangoLayout):Tgboolean;cdecl;external;
procedure pango_layout_set_indent(layout:PPangoLayout; indent:longint);cdecl;external;
function pango_layout_get_indent(layout:PPangoLayout):longint;cdecl;external;
procedure pango_layout_set_spacing(layout:PPangoLayout; spacing:longint);cdecl;external;
function pango_layout_get_spacing(layout:PPangoLayout):longint;cdecl;external;
procedure pango_layout_set_line_spacing(layout:PPangoLayout; factor:single);cdecl;external;
function pango_layout_get_line_spacing(layout:PPangoLayout):single;cdecl;external;
procedure pango_layout_set_justify(layout:PPangoLayout; justify:Tgboolean);cdecl;external;
function pango_layout_get_justify(layout:PPangoLayout):Tgboolean;cdecl;external;
procedure pango_layout_set_justify_last_line(layout:PPangoLayout; justify:Tgboolean);cdecl;external;
function pango_layout_get_justify_last_line(layout:PPangoLayout):Tgboolean;cdecl;external;
procedure pango_layout_set_auto_dir(layout:PPangoLayout; auto_dir:Tgboolean);cdecl;external;
function pango_layout_get_auto_dir(layout:PPangoLayout):Tgboolean;cdecl;external;
procedure pango_layout_set_alignment(layout:PPangoLayout; alignment:TPangoAlignment);cdecl;external;
function pango_layout_get_alignment(layout:PPangoLayout):TPangoAlignment;cdecl;external;
procedure pango_layout_set_tabs(layout:PPangoLayout; tabs:PPangoTabArray);cdecl;external;
function pango_layout_get_tabs(layout:PPangoLayout):PPangoTabArray;cdecl;external;
procedure pango_layout_set_single_paragraph_mode(layout:PPangoLayout; setting:Tgboolean);cdecl;external;
function pango_layout_get_single_paragraph_mode(layout:PPangoLayout):Tgboolean;cdecl;external;
procedure pango_layout_set_ellipsize(layout:PPangoLayout; ellipsize:TPangoEllipsizeMode);cdecl;external;
function pango_layout_get_ellipsize(layout:PPangoLayout):TPangoEllipsizeMode;cdecl;external;
function pango_layout_is_ellipsized(layout:PPangoLayout):Tgboolean;cdecl;external;
function pango_layout_get_unknown_glyphs_count(layout:PPangoLayout):longint;cdecl;external;
function pango_layout_get_direction(layout:PPangoLayout; index:longint):TPangoDirection;cdecl;external;
procedure pango_layout_context_changed(layout:PPangoLayout);cdecl;external;
function pango_layout_get_serial(layout:PPangoLayout):Tguint;cdecl;external;
procedure pango_layout_get_log_attrs(layout:PPangoLayout; attrs:PPPangoLogAttr; n_attrs:Pgint);cdecl;external;
(* Const before type ignored *)
function pango_layout_get_log_attrs_readonly(layout:PPangoLayout; n_attrs:Pgint):PPangoLogAttr;cdecl;external;
procedure pango_layout_index_to_pos(layout:PPangoLayout; index_:longint; pos:PPangoRectangle);cdecl;external;
procedure pango_layout_index_to_line_x(layout:PPangoLayout; index_:longint; trailing:Tgboolean; line:Plongint; x_pos:Plongint);cdecl;external;
procedure pango_layout_get_cursor_pos(layout:PPangoLayout; index_:longint; strong_pos:PPangoRectangle; weak_pos:PPangoRectangle);cdecl;external;
procedure pango_layout_get_caret_pos(layout:PPangoLayout; index_:longint; strong_pos:PPangoRectangle; weak_pos:PPangoRectangle);cdecl;external;
procedure pango_layout_move_cursor_visually(layout:PPangoLayout; strong:Tgboolean; old_index:longint; old_trailing:longint; direction:longint; 
            new_index:Plongint; new_trailing:Plongint);cdecl;external;
function pango_layout_xy_to_index(layout:PPangoLayout; x:longint; y:longint; index_:Plongint; trailing:Plongint):Tgboolean;cdecl;external;
procedure pango_layout_get_extents(layout:PPangoLayout; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
procedure pango_layout_get_pixel_extents(layout:PPangoLayout; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
procedure pango_layout_get_size(layout:PPangoLayout; width:Plongint; height:Plongint);cdecl;external;
procedure pango_layout_get_pixel_size(layout:PPangoLayout; width:Plongint; height:Plongint);cdecl;external;
function pango_layout_get_baseline(layout:PPangoLayout):longint;cdecl;external;
function pango_layout_get_line_count(layout:PPangoLayout):longint;cdecl;external;
function pango_layout_get_line(layout:PPangoLayout; line:longint):PPangoLayoutLine;cdecl;external;
function pango_layout_get_line_readonly(layout:PPangoLayout; line:longint):PPangoLayoutLine;cdecl;external;
function pango_layout_get_lines(layout:PPangoLayout):PGSList;cdecl;external;
function pango_layout_get_lines_readonly(layout:PPangoLayout):PGSList;cdecl;external;
{*
 * PangoLayoutSerializeFlags:
 * @PANGO_LAYOUT_SERIALIZE_DEFAULT: Default behavior
 * @PANGO_LAYOUT_SERIALIZE_CONTEXT: Include context information
 * @PANGO_LAYOUT_SERIALIZE_OUTPUT: Include information about the formatted output
 *
 * Flags that influence the behavior of [method@Pango.Layout.serialize].
 *
 * New members may be added to this enumeration over time.
 *
 * Since: 1.50
  }
type
  PPangoLayoutSerializeFlags = ^TPangoLayoutSerializeFlags;
  TPangoLayoutSerializeFlags =  Longint;
  Const
    PANGO_LAYOUT_SERIALIZE_DEFAULT = 0;
    PANGO_LAYOUT_SERIALIZE_CONTEXT = 1 shl 0;
    PANGO_LAYOUT_SERIALIZE_OUTPUT = 1 shl 1;
;

function pango_layout_serialize(layout:PPangoLayout; flags:TPangoLayoutSerializeFlags):PGBytes;cdecl;external;
(* Const before type ignored *)
function pango_layout_write_to_file(layout:PPangoLayout; flags:TPangoLayoutSerializeFlags; filename:Pchar; error:PPGError):Tgboolean;cdecl;external;
{ was #define dname def_expr }
function PANGO_LAYOUT_DESERIALIZE_ERROR : longint; { return type might be wrong }

{*
 * PangoLayoutDeserializeError:
 * @PANGO_LAYOUT_DESERIALIZE_INVALID: Unspecified error
 * @PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE: A JSon value could not be
 *   interpreted
 * @PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE: A required JSon member was
 *   not found
 *
 * Errors that can be returned by [func@Pango.Layout.deserialize].
 *
 * Since: 1.50
  }
type
  PPangoLayoutDeserializeError = ^TPangoLayoutDeserializeError;
  TPangoLayoutDeserializeError =  Longint;
  Const
    PANGO_LAYOUT_DESERIALIZE_INVALID = 0;
    PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE = 1;
    PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE = 2;
;

function pango_layout_deserialize_error_quark:TGQuark;cdecl;external;
{*
 * PangoLayoutDeserializeFlags:
 * @PANGO_LAYOUT_DESERIALIZE_DEFAULT: Default behavior
 * @PANGO_LAYOUT_DESERIALIZE_CONTEXT: Apply context information
 *   from the serialization to the `PangoContext`
 *
 * Flags that influence the behavior of [func@Pango.Layout.deserialize].
 *
 * New members may be added to this enumeration over time.
 *
 * Since: 1.50
  }
type
  PPangoLayoutDeserializeFlags = ^TPangoLayoutDeserializeFlags;
  TPangoLayoutDeserializeFlags =  Longint;
  Const
    PANGO_LAYOUT_DESERIALIZE_DEFAULT = 0;
    PANGO_LAYOUT_DESERIALIZE_CONTEXT = 1 shl 0;
;

function pango_layout_deserialize(context:PPangoContext; bytes:PGBytes; flags:TPangoLayoutDeserializeFlags; error:PPGError):PPangoLayout;cdecl;external;
{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT_LINE : longint; { return type might be wrong }

function pango_layout_line_get_type:TGType;cdecl;external;
function pango_layout_line_ref(line:PPangoLayoutLine):PPangoLayoutLine;cdecl;external;
procedure pango_layout_line_unref(line:PPangoLayoutLine);cdecl;external;
function pango_layout_line_get_start_index(line:PPangoLayoutLine):longint;cdecl;external;
function pango_layout_line_get_length(line:PPangoLayoutLine):longint;cdecl;external;
function pango_layout_line_is_paragraph_start(line:PPangoLayoutLine):Tgboolean;cdecl;external;
function pango_layout_line_get_resolved_direction(line:PPangoLayoutLine):TPangoDirection;cdecl;external;
function pango_layout_line_x_to_index(line:PPangoLayoutLine; x_pos:longint; index_:Plongint; trailing:Plongint):Tgboolean;cdecl;external;
procedure pango_layout_line_index_to_x(line:PPangoLayoutLine; index_:longint; trailing:Tgboolean; x_pos:Plongint);cdecl;external;
procedure pango_layout_line_get_x_ranges(line:PPangoLayoutLine; start_index:longint; end_index:longint; ranges:PPlongint; n_ranges:Plongint);cdecl;external;
procedure pango_layout_line_get_extents(line:PPangoLayoutLine; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
procedure pango_layout_line_get_height(line:PPangoLayoutLine; height:Plongint);cdecl;external;
procedure pango_layout_line_get_pixel_extents(layout_line:PPangoLayoutLine; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
type

{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT_ITER : longint; { return type might be wrong }

function pango_layout_iter_get_type:TGType;cdecl;external;
function pango_layout_get_iter(layout:PPangoLayout):PPangoLayoutIter;cdecl;external;
function pango_layout_iter_copy(iter:PPangoLayoutIter):PPangoLayoutIter;cdecl;external;
procedure pango_layout_iter_free(iter:PPangoLayoutIter);cdecl;external;
function pango_layout_iter_get_index(iter:PPangoLayoutIter):longint;cdecl;external;
function pango_layout_iter_get_run(iter:PPangoLayoutIter):PPangoLayoutRun;cdecl;external;
function pango_layout_iter_get_run_readonly(iter:PPangoLayoutIter):PPangoLayoutRun;cdecl;external;
function pango_layout_iter_get_line(iter:PPangoLayoutIter):PPangoLayoutLine;cdecl;external;
function pango_layout_iter_get_line_readonly(iter:PPangoLayoutIter):PPangoLayoutLine;cdecl;external;
function pango_layout_iter_at_last_line(iter:PPangoLayoutIter):Tgboolean;cdecl;external;
function pango_layout_iter_get_layout(iter:PPangoLayoutIter):PPangoLayout;cdecl;external;
function pango_layout_iter_next_char(iter:PPangoLayoutIter):Tgboolean;cdecl;external;
function pango_layout_iter_next_cluster(iter:PPangoLayoutIter):Tgboolean;cdecl;external;
function pango_layout_iter_next_run(iter:PPangoLayoutIter):Tgboolean;cdecl;external;
function pango_layout_iter_next_line(iter:PPangoLayoutIter):Tgboolean;cdecl;external;
procedure pango_layout_iter_get_char_extents(iter:PPangoLayoutIter; logical_rect:PPangoRectangle);cdecl;external;
procedure pango_layout_iter_get_cluster_extents(iter:PPangoLayoutIter; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
procedure pango_layout_iter_get_run_extents(iter:PPangoLayoutIter; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
procedure pango_layout_iter_get_line_extents(iter:PPangoLayoutIter; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
{ All the yranges meet, unlike the logical_rect's (i.e. the yranges
 * assign between-line spacing to the nearest line)
  }
procedure pango_layout_iter_get_line_yrange(iter:PPangoLayoutIter; y0_:Plongint; y1_:Plongint);cdecl;external;
procedure pango_layout_iter_get_layout_extents(iter:PPangoLayoutIter; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
function pango_layout_iter_get_baseline(iter:PPangoLayoutIter):longint;cdecl;external;
function pango_layout_iter_get_run_baseline(iter:PPangoLayoutIter):longint;cdecl;external;
{$endif}
{ __PANGO_LAYOUT_H__  }

implementation

function is_paragraph_start(var a : TPangoLayoutLine) : Tguint;
begin
  is_paragraph_start:=(a.flag0 and bm_TPangoLayoutLine_is_paragraph_start) shr bp_TPangoLayoutLine_is_paragraph_start;
end;

procedure set_is_paragraph_start(var a : TPangoLayoutLine; __is_paragraph_start : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_paragraph_start shl bp_TPangoLayoutLine_is_paragraph_start) and bm_TPangoLayoutLine_is_paragraph_start);
end;

function resolved_dir(var a : TPangoLayoutLine) : Tguint;
begin
  resolved_dir:=(a.flag0 and bm_TPangoLayoutLine_resolved_dir) shr bp_TPangoLayoutLine_resolved_dir;
end;

procedure set_resolved_dir(var a : TPangoLayoutLine; __resolved_dir : Tguint);
begin
  a.flag0:=a.flag0 or ((__resolved_dir shl bp_TPangoLayoutLine_resolved_dir) and bm_TPangoLayoutLine_resolved_dir);
end;

{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT : longint; { return type might be wrong }
  begin
    PANGO_TYPE_LAYOUT:=pango_layout_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT(object : longint) : longint;
begin
  PANGO_LAYOUT:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_LAYOUT,PangoLayout);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_CLASS(klass : longint) : longint;
begin
  PANGO_LAYOUT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_LAYOUT,PangoLayoutClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT(object : longint) : longint;
begin
  PANGO_IS_LAYOUT:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_LAYOUT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT_CLASS(klass : longint) : longint;
begin
  PANGO_IS_LAYOUT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_LAYOUT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_GET_CLASS(obj : longint) : longint;
begin
  PANGO_LAYOUT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_LAYOUT,PangoLayoutClass);
end;

{ was #define dname def_expr }
function PANGO_LAYOUT_DESERIALIZE_ERROR : longint; { return type might be wrong }
  begin
    PANGO_LAYOUT_DESERIALIZE_ERROR:=pango_layout_deserialize_error_quark;
  end;

{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT_LINE : longint; { return type might be wrong }
  begin
    PANGO_TYPE_LAYOUT_LINE:=pango_layout_line_get_type;
  end;

{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT_ITER : longint; { return type might be wrong }
  begin
    PANGO_TYPE_LAYOUT_ITER:=pango_layout_iter_get_type;
  end;


end.
