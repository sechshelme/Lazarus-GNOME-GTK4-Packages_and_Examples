
unit efl_canvas_textblock_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_textblock_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_textblock_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Canvas_Text  = ^Efl_Canvas_Text;
PEfl_Canvas_Textblock  = ^Efl_Canvas_Textblock;
PEfl_Text_Cursor_Handle  = ^Efl_Text_Cursor_Handle;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_TEXTBLOCK_EO_LEGACY_H_}
{$define _EFL_CANVAS_TEXTBLOCK_EO_LEGACY_H_}
{$ifndef _EFL_CANVAS_TEXTBLOCK_EO_CLASS_TYPE}
{$define _EFL_CANVAS_TEXTBLOCK_EO_CLASS_TYPE}
type
  PEfl_Canvas_Textblock = ^TEfl_Canvas_Textblock;
  TEfl_Canvas_Textblock = TEo;

  PEfl_Canvas_Text = ^TEfl_Canvas_Text;
  TEfl_Canvas_Text = TEfl_Canvas_Textblock;
{$endif}
{$ifndef _EFL_CANVAS_TEXTBLOCK_EO_TYPES}
{$define _EFL_CANVAS_TEXTBLOCK_EO_TYPES}
{$endif}
{*
 * @brief Returns the currently visible range.
 *
 * The given @c start and @c end cursor act like out-variables here, as they
 * are set to the positions of the start and the end of the visible range in
 * the text, respectively.
 *
 * @param[in] obj The object.
 * @param[in] start Range start position
 * @param[in] end Range end position
 *
 * @return @c true on success, @c false otherwise
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }

function evas_object_textblock_visible_range_get(obj:PEfl_Canvas_Textblock; start:PEfl_Text_Cursor_Handle; end:PEfl_Text_Cursor_Handle):TEina_Bool;cdecl;external;
{*
 * @brief Gets the left, right, top and bottom insets of the text.
 *
 * The inset is any applied padding on the text.
 *
 * @param[in] obj The object.
 * @param[out] left The left padding
 * @param[out] right The right padding
 * @param[out] top The top padding
 * @param[out] bottom The bottom padding
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
(* Const before type ignored *)
procedure evas_object_textblock_style_insets_get(obj:PEfl_Canvas_Textblock; left:Plongint; right:Plongint; top:Plongint; bottom:Plongint);cdecl;external;
{*
 * @brief BiDi delimiters are used for in-paragraph separation of bidi
 * segments. This is useful, for example, in the recipient fields of e-mail
 * clients where bidi oddities can occur when mixing RTL and LTR.
 *
 * @param[in] obj The object.
 * @param[in] delim A null terminated string of delimiters, e.g ",|" or @c null
 * if empty
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
(* Const before type ignored *)
procedure evas_object_textblock_bidi_delimiters_set(obj:PEfl_Canvas_Textblock; delim:Pchar);cdecl;external;
{*
 * @brief BiDi delimiters are used for in-paragraph separation of bidi
 * segments. This is useful, for example, in the recipient fields of e-mail
 * clients where bidi oddities can occur when mixing RTL and LTR.
 *
 * @param[in] obj The object.
 *
 * @return A null terminated string of delimiters, e.g ",|" or @c null if empty
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_object_textblock_bidi_delimiters_get(obj:PEfl_Canvas_Textblock):Pchar;cdecl;external;
{*
 * @brief When @c true, newline character will behave as a paragraph separator.
 *
 * @param[in] obj The object.
 * @param[in] mode @c true for legacy mode, @c false otherwise
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
procedure evas_object_textblock_legacy_newline_set(obj:PEfl_Canvas_Textblock; mode:TEina_Bool);cdecl;external;
{*
 * @brief When @c true, newline character will behave as a paragraph separator.
 *
 * @param[in] obj The object.
 *
 * @return @c true for legacy mode, @c false otherwise
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
(* Const before type ignored *)
function evas_object_textblock_legacy_newline_get(obj:PEfl_Canvas_Textblock):TEina_Bool;cdecl;external;
{*
 * @brief The formatted width and height.
 *
 * This calculates the actual size after restricting the textblock to the
 * current size of the object.
 *
 * The main difference between this and
 * @ref evas_object_textblock_size_native_get is that the "native" function
 * does not wrapping into account it just calculates the real width of the
 * object if it was placed on an infinite canvas, while this function gives the
 * size after wrapping according to the size restrictions of the object.
 *
 * For example for a textblock containing the text: "You shall not pass!" with
 * no margins or padding and assuming a monospace font and a size of 7x10 char
 * widths (for simplicity) has a native size of 19x1 and a formatted size of
 * 5x4.
 *
 * @param[in] obj The object.
 * @param[out] width The width of the object.
 * @param[out] height The height of the object.
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
(* Const before type ignored *)
procedure evas_object_textblock_size_formatted_get(obj:PEfl_Canvas_Textblock; width:Plongint; height:Plongint);cdecl;external;
{*
 * @brief The native width and height.
 *
 * This calculates the actual size without taking account the current size of
 * the object.
 *
 * The main difference between this and
 * @ref evas_object_textblock_size_formatted_get is that the "native" function
 * does not take wrapping into account it just calculates the real width of the
 * object if it was placed on an infinite canvas, while the "formatted"
 * function gives the size after  wrapping text according to the size
 * restrictions of the object.
 *
 * For example for a textblock containing the text: "You shall not pass!" with
 * no margins or padding and assuming a monospace font and a size of 7x10 char
 * widths (for simplicity) has a native size of 19x1 and a formatted size of
 * 5x4.
 *
 * @param[in] obj The object.
 * @param[out] width The width returned.
 * @param[out] height The height returned.
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
(* Const before type ignored *)
procedure evas_object_textblock_size_native_get(obj:PEfl_Canvas_Textblock; width:Plongint; height:Plongint);cdecl;external;
{*
 * @brief Add obstacle evas object @c eo_obs to be observed during layout of
 * text.
 *
 * The textblock does the layout of the text according to the position of the
 * obstacle.
 *
 * @param[in] obj The object.
 * @param[in] eo_obs Obstacle object
 *
 * @return @c true on success, @c false otherwise.
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
function evas_object_textblock_obstacle_add(obj:PEfl_Canvas_Textblock; eo_obs:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Removes @c eo_obs from observation during text layout.
 *
 * @param[in] obj The object.
 * @param[in] eo_obs Obstacle object
 *
 * @return @c true on success, @c false otherwise.
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
function evas_object_textblock_obstacle_del(obj:PEfl_Canvas_Textblock; eo_obs:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Triggers for relayout due to obstacles' state change.
 *
 * The obstacles alone don't affect the layout, until this is called. Use this
 * after doing changes (moving, positioning etc.) in the obstacles that you
 *  would like to be considered in the layout.
 *
 * For example: if you have just repositioned the obstacles to differrent
 * coordinates relative to the textblock, you need to call this so it will
 * consider this new state and will relayout the text.
 *
 * @param[in] obj The object.
 *
 * @since 1.18
 *
 * @ingroup Evas_Object_Textblock_Group
  }
procedure evas_object_textblock_obstacles_update(obj:PEfl_Canvas_Textblock);cdecl;external;
{$endif}

implementation


end.
