
unit elm_code_widget_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_widget_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_widget_eo_legacy.h
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
Pdouble  = ^double;
Pdword  = ^dword;
PElm_Code  = ^Elm_Code;
PElm_Code_Line  = ^Elm_Code_Line;
PElm_Code_Widget  = ^Elm_Code_Widget;
PElm_Scroller_Policy  = ^Elm_Scroller_Policy;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_CODE_WIDGET_EO_LEGACY_H_}
{$define _ELM_CODE_WIDGET_EO_LEGACY_H_}
{$ifndef _ELM_CODE_WIDGET_EO_CLASS_TYPE}
{$define _ELM_CODE_WIDGET_EO_CLASS_TYPE}
type
  PElm_Code_Widget = ^TElm_Code_Widget;
  TElm_Code_Widget = TEo;
{$endif}
{$ifndef _ELM_CODE_WIDGET_EO_TYPES}
{$define _ELM_CODE_WIDGET_EO_TYPES}
{$endif}
{*
 * @brief Set the underlying code object that this widget renders. This can
 * only be set during construction, once the widget is created the backing code
 * object cannot be changed.
 *
 * @param[in] obj The object.
 * @param[in] code Our underlying Elm.Code object
 *
 * @ingroup Elm_Code_Widget_Group
  }

procedure elm_code_widget_code_set(obj:PElm_Code_Widget; code:PElm_Code);cdecl;external;
{*
 * @brief Get the underlying code object we are rendering
 *
 * @param[in] obj The object.
 *
 * @return Our underlying Elm.Code object
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_code_get(obj:PElm_Code_Widget):PElm_Code;cdecl;external;
{*
 * @brief Set the font that this widget uses, the font should be a monospaced
 * scalable font. Passing NULL will load the default system monospaced font.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the font to load
 * @param[in] size The font size for the widget
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
procedure elm_code_widget_font_set(obj:PElm_Code_Widget; name:Pchar; size:longint);cdecl;external;
{*
 * @brief Get the font currently in use. The font name is a copy ad should be
 * freed once it is no longer needed
 *
 * @param[in] obj The object.
 * @param[out] name The name of the font to load
 * @param[out] size The font size for the widget
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_code_widget_font_get(obj:PElm_Code_Widget; name:PPchar; size:Plongint);cdecl;external;
{*
 * @brief Get the number of columns in the widget currently. This will be the
 * max of the number of columns to represent the longest line and the minimum
 * required to fill the visible widget width.
 *
 * @param[in] obj The object.
 *
 * @return The number of columns required to render the widget
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_columns_get(obj:PElm_Code_Widget):dword;cdecl;external;
{*
 * @brief Set how this widget's scroller should respond to new lines being
 * added.
 *
 * An x value of 0.0 will maintain the distance from the left edge, 1.0 will
 * ensure the rightmost edge (of the longest line) is respected With 0.0 for y
 * the view will keep it's position relative to the top whereas 1.0 will scroll
 * downward as lines are added.
 *
 * @param[in] obj The object.
 * @param[in] x The horizontal value of the scroller gravity - valid values are
 * 0.0 and 1.0
 * @param[in] y The vertical gravity of the widget's scroller - valid values
 * are 0.0 and 1.0
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_gravity_set(obj:PElm_Code_Widget; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief Get the current x and y gravity of the widget's scroller
 *
 * @param[in] obj The object.
 * @param[out] x The horizontal value of the scroller gravity - valid values
 * are 0.0 and 1.0
 * @param[out] y The vertical gravity of the widget's scroller - valid values
 * are 0.0 and 1.0
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
procedure elm_code_widget_gravity_get(obj:PElm_Code_Widget; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief Set the policy for scrollbar visibility.
 *
 * @param[in] obj The object.
 * @param[in] policy_h The horizontal scrollbar visibility policy
 * @param[in] policy_v The vertical scrollbar visibility policy
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_policy_set(obj:PElm_Code_Widget; policy_h:TElm_Scroller_Policy; policy_v:TElm_Scroller_Policy);cdecl;external;
{*
 * @brief Get the widget's policy for scrollbar visibility.
 *
 * @param[in] obj The object.
 * @param[out] policy_h The horizontal scrollbar visibility policy
 * @param[out] policy_v The vertical scrollbar visibility policy
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
procedure elm_code_widget_policy_get(obj:PElm_Code_Widget; policy_h:PElm_Scroller_Policy; policy_v:PElm_Scroller_Policy);cdecl;external;
{*
 * @brief Set the width of a tab stop, used purely for visual layout of tab
 * characters.
 *
 * Recommended value is between 2 and 8.
 *
 * @param[in] obj The object.
 * @param[in] tabstop Maximum width of a tab character
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_tabstop_set(obj:PElm_Code_Widget; tabstop:dword);cdecl;external;
{*
 * @brief Get the current width of a tab stop. This is used to determine where
 * characters after a tab should appear in the line.
 *
 * @param[in] obj The object.
 *
 * @return Maximum width of a tab character
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_tabstop_get(obj:PElm_Code_Widget):dword;cdecl;external;
{*
 * @brief Set whether this widget allows editing
 *
 * If editable then the widget will allow user input to manipulate the
 * underlying Elm.Code_File of this Elm.Code instance. Any other
 * Elm.Code_Widget's connected to this Elm.Code will update to reflect the
 * changes.
 *
 * @param[in] obj The object.
 * @param[in] editable The editable state of the widget
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_editable_set(obj:PElm_Code_Widget; editable:TEina_Bool);cdecl;external;
{*
 * @brief Get the current editable state of this widget
 *
 * returns EINA_TRUE if the widget is editable, EINA_FALSE otherwise. If this
 * widget is not editable the underlying Elm.Code_File could still be
 * manipulated by a different widget or the filesystem.
 *
 * @param[in] obj The object.
 *
 * @return The editable state of the widget
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_editable_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{*
 * @brief Set whether line numbers should be displayed in the left gutter.
 *
 * Passing EINA_TRUE will reserve a space for showing line numbers, EINA_FALSE
 * will turn this off.
 *
 * @param[in] obj The object.
 * @param[in] line_numbers Whether or not line numbers (or their placeholder)
 * should be shown
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_line_numbers_set(obj:PElm_Code_Widget; line_numbers:TEina_Bool);cdecl;external;
{*
 * @brief Get the status of line number display for this widget.
 *
 * @param[in] obj The object.
 *
 * @return Whether or not line numbers (or their placeholder) should be shown
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_line_numbers_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{*
 * @brief Set where the line width market should be shown.
 *
 * Passing a non-zero value will set which line width to mark with a vertical
 * line. Passing 0 will hide this marker.
 *
 * @param[in] obj The object.
 * @param[in] line_width_marker Where to display a line width marker, if at all
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_line_width_marker_set(obj:PElm_Code_Widget; line_width_marker:dword);cdecl;external;
{*
 * @brief Get the position of the line width marker, any positive return
 * indicates where the marker appears.
 *
 * @param[in] obj The object.
 *
 * @return Where to display a line width marker, if at all
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_line_width_marker_get(obj:PElm_Code_Widget):dword;cdecl;external;
{*
 * @brief Set whether white space should be shown.
 *
 * @param[in] obj The object.
 * @param[in] show_whitespace Whether or not we show whitespace characters
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_show_whitespace_set(obj:PElm_Code_Widget; show_whitespace:TEina_Bool);cdecl;external;
{*
 * @brief Get whether or not white space will be visible.
 *
 * @param[in] obj The object.
 *
 * @return Whether or not we show whitespace characters
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_show_whitespace_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{*
 * @brief Set an alpha color value for this widget (0 - 255) default is fully
 * opaque (255).
 *
 * @param[in] obj The object.
 * @param[in] alpha Alpha value
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_alpha_set(obj:PElm_Code_Widget; alpha:longint);cdecl;external;
{*
 * @brief Set an alpha color value for this widget (0 - 255) default is fully
 * opaque (255).
 *
 * @param[in] obj The object.
 *
 * @return Alpha value
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_alpha_get(obj:PElm_Code_Widget):longint;cdecl;external;
{*
 * @brief Set whether syntax highlighting should be use for this widget.
 *
 * @param[in] obj The object.
 * @param[in] syntax_enabled Whether or not to enable syntax highlighting
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_syntax_enabled_set(obj:PElm_Code_Widget; syntax_enabled:TEina_Bool);cdecl;external;
{*
 * @brief Get this widget's enabled state for syntax highlighting.
 *
 * @param[in] obj The object.
 *
 * @return Whether or not to enable syntax highlighting
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_syntax_enabled_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{*
 * @brief Set whether space characters should be inserted instead of tabs.
 *
 * @param[in] obj The object.
 * @param[in] tab_inserts_spaces @c true if we should insert space characters
 * instead of a tab when the Tab key is pressed
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_tab_inserts_spaces_set(obj:PElm_Code_Widget; tab_inserts_spaces:TEina_Bool);cdecl;external;
{*
 * @brief Get whether or not space characters will be inserted instead of tabs.
 *
 * @param[in] obj The object.
 *
 * @return @c true if we should insert space characters instead of a tab when
 * the Tab key is pressed
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
function elm_code_widget_tab_inserts_spaces_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{*
 * @brief Set the current location of the text cursor.
 *
 * @param[in] obj The object.
 * @param[in] row The vertical position ov the cursur - the fist row is 1
 * @param[in] col The horizontal position of the cursor, starting from column 1
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_cursor_position_set(obj:PElm_Code_Widget; row:dword; col:dword);cdecl;external;
{*
 * @brief Get the current x and y position of the widget's cursor.
 *
 * @param[in] obj The object.
 * @param[out] row The vertical position ov the cursur - the fist row is 1
 * @param[out] col The horizontal position of the cursor, starting from column
 * 1
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
procedure elm_code_widget_cursor_position_get(obj:PElm_Code_Widget; row:Pdword; col:Pdword);cdecl;external;
{* Update and refresh theme for widget.
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_theme_refresh(obj:PElm_Code_Widget);cdecl;external;
{*
 * @brief Refresh code line in widget
 *
 * @param[in] obj The object.
 * @param[in] line The line to refresh.
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_line_refresh(obj:PElm_Code_Widget; line:PElm_Code_Line);cdecl;external;
{*
 * @brief Check if the code line is currently visible
 *
 * @param[in] obj The object.
 * @param[in] line The line to test for visibility.
 *
 * @return @c true if the line specified is currently visible within the scroll
 * region.
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_line_visible_get(obj:PElm_Code_Widget; line:PElm_Code_Line):TEina_Bool;cdecl;external;
{*
 * @brief Get the number of code lines currently visible in the widget
 *
 * @param[in] obj The object.
 *
 * @return the number of lines currently visible in the widget.
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_lines_visible_get(obj:PElm_Code_Widget):dword;cdecl;external;
{*
 * @brief Get the row, col position for a given coordinate on the widget.
 *
 * @param[in] obj The object.
 * @param[in] x The x coordinate in the widget
 * @param[in] y The y coordinate in the widget
 * @param[in] row The row for the coordinates
 * @param[in] col The column for the coordinates
 *
 * @return @c true if a line exists at these coordinates
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_position_at_coordinates_get(obj:PElm_Code_Widget; x:longint; y:longint; row:Pdword; col:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Get the geometry for the cell at the specified position.
 *
 * @param[in] obj The object.
 * @param[in] row The row for the requested position
 * @param[in] col The column for the requested position
 * @param[in] x The x coordinate of the cell at specified position
 * @param[in] y The y coordinate of the cell at specified position
 * @param[in] w The width of the cell at specified position
 * @param[in] h The height of the cell at specified position
 *
 * @return @c true if a cell exists at the specified position
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_geometry_for_position_get(obj:PElm_Code_Widget; row:dword; col:longint; x:Plongint; y:Plongint; 
           w:Plongint; h:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Get the column width of the gutter
 *
 * @param[in] obj The object.
 *
 * @return The current column width of the gutter for the widget.
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_text_left_gutter_width_get(obj:PElm_Code_Widget):longint;cdecl;external;
{*
 * @brief Get text between given positions
 *
 * @param[in] obj The object.
 * @param[in] start_line The line of the first character to get
 * @param[in] start_col The widget column of the first character to get
 * @param[in] end_line The line of the last character to get
 * @param[in] end_col The widget column of the last character to get
 *
 * @return The text content between start and end positions
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_text_between_positions_get(obj:PElm_Code_Widget; start_line:dword; start_col:dword; end_line:dword; end_col:dword):Pchar;cdecl;external;
{*
 * @brief Insert the provided text at the cursor position. This will add the
 * operation to the widget's undo list.
 *
 * @param[in] obj The object.
 * @param[in] text The text to insert
 *
 * @ingroup Elm_Code_Widget_Group
  }
(* Const before type ignored *)
procedure elm_code_widget_text_at_cursor_insert(obj:PElm_Code_Widget; text:Pchar);cdecl;external;
{*
 * @brief Get text column width at given position
 *
 * @param[in] obj The object.
 * @param[in] line Code line
 * @param[in] position Code position
 *
 * @return Text column width
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_line_text_column_width_to_position(obj:PElm_Code_Widget; line:PElm_Code_Line; position:dword):dword;cdecl;external;
{*
 * @brief Get text column width for code line
 *
 * @param[in] obj The object.
 * @param[in] line Code line
 *
 * @return Text column width
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_line_text_column_width_get(obj:PElm_Code_Widget; line:PElm_Code_Line):dword;cdecl;external;
{*
 * @brief Get position from column
 *
 * @param[in] obj The object.
 * @param[in] line Code line
 * @param[in] column Column
 *
 * @return Position
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_line_text_position_for_column_get(obj:PElm_Code_Widget; line:PElm_Code_Line; column:dword):dword;cdecl;external;
{*
 * @brief Get tabwidth for column
 *
 * @param[in] obj The object.
 * @param[in] column Column
 *
 * @return Tabwidth
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_text_tabwidth_at_column_get(obj:PElm_Code_Widget; column:dword):dword;cdecl;external;
{*
 * @brief Toggle the display of the line status widget
 *
 * @param[in] obj The object.
 * @param[in] line Code line
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_line_status_toggle(obj:PElm_Code_Widget; line:PElm_Code_Line);cdecl;external;
{* Undo last action
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_undo(obj:PElm_Code_Widget);cdecl;external;
{*
 * @brief Determine if there are any available undo operations
 *
 * @param[in] obj The object.
 *
 * @return @c true if there are undo operations
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_can_undo_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{* Redo last action
 *
 * @ingroup Elm_Code_Widget_Group
  }
procedure elm_code_widget_redo(obj:PElm_Code_Widget);cdecl;external;
{*
 * @brief Determine if there are any available redo operations
 *
 * @param[in] obj The object.
 *
 * @return @c true if there are redo operations
 *
 * @ingroup Elm_Code_Widget_Group
  }
function elm_code_widget_can_redo_get(obj:PElm_Code_Widget):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
