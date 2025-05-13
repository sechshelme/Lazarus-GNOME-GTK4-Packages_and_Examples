
unit efl_text_cursor_object_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_cursor_object_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_cursor_object_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Text_Cursor_Move_Type  = ^Efl_Text_Cursor_Move_Type;
PEfl_Text_Cursor_Object  = ^Efl_Text_Cursor_Object;
PEfl_Text_Cursor_Type  = ^Efl_Text_Cursor_Type;
PEina_Iterator  = ^Eina_Iterator;
PEina_Rect  = ^Eina_Rect;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_CURSOR_OBJECT_EO_H_}
{$define _EFL_TEXT_CURSOR_OBJECT_EO_H_}
{$ifndef _EFL_TEXT_CURSOR_OBJECT_EO_CLASS_TYPE}
{$define _EFL_TEXT_CURSOR_OBJECT_EO_CLASS_TYPE}
type
  PEfl_Text_Cursor_Object = ^TEfl_Text_Cursor_Object;
  TEfl_Text_Cursor_Object = TEo;
{$endif}
{$ifndef _EFL_TEXT_CURSOR_OBJECT_EO_TYPES}
{$define _EFL_TEXT_CURSOR_OBJECT_EO_TYPES}
{* Shape of the text cursor. This is normally used in
 * @ref Efl_Text_Cursor_Object methods to retrieve the cursor's geometry.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Type
  }
{*< Cursor is a vertical bar (I-beam) placed
                                    * before the selected character.
                                    *
                                    * @since 1.24  }
{*< Cursor is an horizontal line (underscore)
                              * placed under the selected character.
                              *
                              * @since 1.24  }
type
  PEfl_Text_Cursor_Type = ^TEfl_Text_Cursor_Type;
  TEfl_Text_Cursor_Type =  Longint;
  Const
    EFL_TEXT_CURSOR_TYPE_BEFORE = 0;
    EFL_TEXT_CURSOR_TYPE_UNDER = 1;
;
{* Text cursor movement types.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Move_Type
  }
{*< Advances to the next
                                                 * character.
                                                 *
                                                 * @since 1.24  }
{*< Advances to the previous
                                                 * character.
                                                 *
                                                 * @since 1.24  }
{*< Advances to the next grapheme
                                           * cluster (A character sequence
                                           * rendered together. See
                                           * https://unicode.org/reports/tr29/).
                                           *
                                           * @since 1.24  }
{*< Advances to the previous
                                               * grapheme cluster (A character
                                               * sequence rendered together.
                                               * See
                                               * https://unicode.org/reports/tr29/).
                                               *
                                               * @since 1.24  }
{*< Advances to the first
                                              * character in current paragraph.
                                              *
                                              * @since 1.24  }
{*< Advances to the last character
                                            * in current paragraph.
                                            *
                                            * @since 1.24  }
{*< Advance to current word start.
                                         *
                                         * @since 1.24  }
{*< Advance to current word end.
                                       *
                                       * @since 1.24  }
{*< Advance to current line first
                                         * character.
                                         *
                                         * @since 1.24  }
{*< Advance to current line last
                                       * character.
                                       *
                                       * @since 1.24  }
{*< Advance to first character in the first
                                    * paragraph.
                                    *
                                    * @since 1.24  }
{*< Advance to last character in the  last
                                   *  paragraph.
                                   *
                                   * @since 1.24  }
{*< Advances to the start of the
                                             * next paragraph.
                                             *
                                             * @since 1.24  }
{*< Advances to the end of the
                                                * previous paragraph.
                                                *
                                                * @since 1.24  }
type
  PEfl_Text_Cursor_Move_Type = ^TEfl_Text_Cursor_Move_Type;
  TEfl_Text_Cursor_Move_Type =  Longint;
  Const
    EFL_TEXT_CURSOR_MOVE_TYPE_CHARACTER_NEXT = 0;
    EFL_TEXT_CURSOR_MOVE_TYPE_CHARACTER_PREVIOUS = 1;
    EFL_TEXT_CURSOR_MOVE_TYPE_CLUSTER_NEXT = 2;
    EFL_TEXT_CURSOR_MOVE_TYPE_CLUSTER_PREVIOUS = 3;
    EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_START = 4;
    EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_END = 5;
    EFL_TEXT_CURSOR_MOVE_TYPE_WORD_START = 6;
    EFL_TEXT_CURSOR_MOVE_TYPE_WORD_END = 7;
    EFL_TEXT_CURSOR_MOVE_TYPE_LINE_START = 8;
    EFL_TEXT_CURSOR_MOVE_TYPE_LINE_END = 9;
    EFL_TEXT_CURSOR_MOVE_TYPE_FIRST = 10;
    EFL_TEXT_CURSOR_MOVE_TYPE_LAST = 11;
    EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_NEXT = 12;
    EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_PREVIOUS = 13;
;
{$endif}
{* Cursor API.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }

{ was #define dname def_expr }
function EFL_TEXT_CURSOR_OBJECT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_cursor_object_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Cursor position.
 *
 * @param[in] obj The object.
 * @param[in] position Cursor position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
procedure efl_text_cursor_object_position_set(obj:PEo; position:longint);cdecl;external;
{*
 * @brief Cursor position.
 *
 * @param[in] obj The object.
 *
 * @return Cursor position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_position_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The content of the cursor (the character under the cursor).
 *
 * @param[in] obj The object.
 *
 * @return The unicode codepoint of the character.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_content_get(obj:PEo):TEina_Unicode;cdecl;external;
{*
 * @brief The geometry of the item/char pointed by the cursor.
 *
 * @param[in] obj The object.
 *
 * @return The geometry in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_content_geometry_get(obj:PEo):TEina_Rect;cdecl;external;
{*
 * @brief The line the cursor is on.
 *
 * @param[in] obj The object.
 * @param[in] line_number The line number.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
procedure efl_text_cursor_object_line_number_set(obj:PEo; line_number:longint);cdecl;external;
{*
 * @brief The line the cursor is on.
 *
 * @param[in] obj The object.
 *
 * @return The line number.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_line_number_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Returns the geometry of cursor, if cursor is shown for the text of
 * the same direction as paragraph,else  ("split cursor") will return and you
 * need to consider the lower ("split cursor")
 * @ref efl_text_cursor_object_lower_cursor_geometry_get
 *
 * Split cursor geometry is valid only  in @ref EFL_TEXT_CURSOR_TYPE_BEFORE
 * cursor mode.
 *
 * @param[in] obj The object.
 * @param[in] ctype The type of the cursor.
 *
 * @return The geometry of the cursor (or upper cursor) in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_cursor_geometry_get(obj:PEo; ctype:TEfl_Text_Cursor_Type):TEina_Rect;cdecl;external;
{*
 * @brief Returns the geometry of the lower ("split cursor"), if logical cursor
 * is between LTR/RTL text.
 *
 * To get the upper ("split cursor")
 * @ref efl_text_cursor_object_cursor_geometry_get with
 * @ref EFL_TEXT_CURSOR_TYPE_BEFORE cursor mode.
 *
 * @param[in] obj The object.
 * @param[out] geometry The geometry of the lower cursor in pixels.
 *
 * @return @c true if split cursor, @c false otherwise.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_lower_cursor_geometry_get(obj:PEo; geometry:PEina_Rect):TEina_Bool;cdecl;external;
{*
 * @brief Check if two cursors are equal - faster than compare if all you want
 * is equality.
 *
 * @param[in] obj The object.
 * @param[in] dst Destination Cursor.
 *
 * @return @c true if cursors are equal, @c false otherwise.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_cursor_object_equal(obj:PEo; dst:PEfl_Text_Cursor_Object):TEina_Bool;cdecl;external;
{*
 * @brief Compare two cursors Return <0 if cursor position less than dst, 0 if
 * cursor == dest and >0 otherwise.
 *
 * @param[in] obj The object.
 * @param[in] dst Destination Cursor.
 *
 * @return Difference between cursors.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_cursor_object_compare(obj:PEo; dst:PEfl_Text_Cursor_Object):longint;cdecl;external;
{*
 * @brief Move the cursor.
 *
 * @param[in] obj The object.
 * @param[in] type The type of movement.
 *
 * @return True if actually moved.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
function efl_text_cursor_object_move(obj:PEo; _type:TEfl_Text_Cursor_Move_Type):TEina_Bool;cdecl;external;
{* Deletes a single character from position pointed by given cursor.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
procedure efl_text_cursor_object_char_delete(obj:PEo);cdecl;external;
{*
 * @brief Jump the cursor by the given number of lines.
 *
 * @param[in] obj The object.
 * @param[in] by Number of lines.
 *
 * @return True if actually moved.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
function efl_text_cursor_object_line_jump_by(obj:PEo; by:longint):TEina_Bool;cdecl;external;
{*
 * @brief Set cursor coordinates.
 *
 * @param[in] obj The object.
 * @param[in] coord The coordinates to set to.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
procedure efl_text_cursor_object_char_coord_set(obj:PEo; coord:TEina_Position2D);cdecl;external;
{*
 * @brief Set cursor coordinates according to grapheme clusters. It does not
 * allow to put a cursor to the middle of a grapheme cluster.
 *
 * @param[in] obj The object.
 * @param[in] coord The coordinates to set to.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
procedure efl_text_cursor_object_cluster_coord_set(obj:PEo; coord:TEina_Position2D);cdecl;external;
{*
 * @brief Adds text to the current cursor position and set the cursor to
 * *after* the start of the text just added.
 *
 * @param[in] obj The object.
 * @param[in] text Text to append (UTF-8 format).
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
procedure efl_text_cursor_object_text_insert(obj:PEo; text:Pchar);cdecl;external;
{*
 * @brief Inserts a markup text at cursor position.
 *
 * @param[in] obj The object.
 * @param[in] markup Text to append (UTF-8 format).
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
procedure efl_text_cursor_object_markup_insert(obj:PEo; markup:Pchar);cdecl;external;
{*
 * @brief Markup of a given range in the text.
 *
 * @param[in] obj The object.
 * @param[in] cur2 End of range.
 *
 * @return The markup in the given range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_range_markup_get(obj:PEo; cur2:PEfl_Text_Cursor_Object):Pchar;cdecl;external;
{*
 * @brief Returns the text in the range between cursor and @c cur2.
 *
 * @param[in] obj The object.
 * @param[in] cur2 End of range.
 *
 * @return The text in the given range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_range_text_get(obj:PEo; cur2:PEfl_Text_Cursor_Object):Pchar;cdecl;external;
{*
 * @brief Get the simple geometry in pixels of a range in the text.
 *
 * The geometry is the geometry in which rectangles in middle lines of range
 * are merged into one big rectangle. This is an optimized version of
 * @ref efl_text_cursor_object_range_precise_geometry_get.
 *
 * @param[in] obj The object.
 * @param[in] cur2 End of range.
 *
 * @return Iterator on all geometries of the given range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
function efl_text_cursor_object_range_geometry_get(obj:PEo; cur2:PEfl_Text_Cursor_Object):PEina_Iterator;cdecl;external;
{*
 * @brief Get the "precise" geometry in pixels of a range.
 *
 * The geometry is represented as rectangles for each of the line segments in
 * the given range [$cur1, @c cur2].
 *
 * @param[in] obj The object.
 * @param[in] cur2 End of range.
 *
 * @return Iterator on all simple geometries of the given range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
function efl_text_cursor_object_range_precise_geometry_get(obj:PEo; cur2:PEfl_Text_Cursor_Object):PEina_Iterator;cdecl;external;
{*
 * @brief Deletes the range between given cursors.
 *
 * This removes all the text in given range [$start,$end].
 *
 * @param[in] obj The object.
 * @param[in] cur2 Range end position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
procedure efl_text_cursor_object_range_delete(obj:PEo; cur2:PEfl_Text_Cursor_Object);cdecl;external;
{*
 * @brief The text object this cursor is associated with.
 *
 * @param[in] obj The object.
 *
 * @return The text object.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }
(* Const before type ignored *)
function efl_text_cursor_object_text_object_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when its position has changed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Cursor_Object
  }

{ was #define dname def_expr }
function EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_CURSOR_OBJECT_CLASS : longint; { return type might be wrong }
  begin
    EFL_TEXT_CURSOR_OBJECT_CLASS:=efl_text_cursor_object_class_get;
  end;

{ was #define dname def_expr }
function EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED:=@(_EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED);
  end;


end.
