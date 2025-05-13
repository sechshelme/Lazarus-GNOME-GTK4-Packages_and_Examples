unit elm_entry_eo_legacy;

interface

uses
  ctypes, elf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PElm_Entry = ^TElm_Entry;
  TElm_Entry = TEo;

procedure elm_entry_scrollable_set(obj:PElm_Entry; scroll:TEina_Bool);cdecl;external libelementary;
function elm_entry_scrollable_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
procedure elm_entry_input_panel_show_on_demand_set(obj:PElm_Entry; ondemand:TEina_Bool);cdecl;external libelementary;
function elm_entry_input_panel_show_on_demand_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
procedure elm_entry_context_menu_disabled_set(obj:PElm_Entry; disabled:TEina_Bool);cdecl;external libelementary;
function elm_entry_context_menu_disabled_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
procedure elm_entry_cnp_mode_set(obj:PElm_Entry; cnp_mode:TElm_Cnp_Mode);cdecl;external libelementary;
function elm_entry_cnp_mode_get(obj:PElm_Entry):TElm_Cnp_Mode;cdecl;external libelementary;
procedure elm_entry_file_text_format_set(obj:PElm_Entry; format:TElm_Text_Format);cdecl;external libelementary;
{*
 * @brief Set the language mode of the input panel.
 *
 * This API can be used if you want to show the alphabet keyboard mode.
 *
 * @param[in] obj The object.
 * @param[in] lang Language to be set to the input panel.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_language_set(obj:PElm_Entry; lang:TElm_Input_Panel_Lang);cdecl;external libelementary;
{*
 * @brief Get the language mode of the input panel.
 *
 * @param[in] obj The object.
 *
 * @return Language to be set to the input panel.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_panel_language_get(obj:PElm_Entry):TElm_Input_Panel_Lang;cdecl;external libelementary;
{*
 * @brief This disabled the entry's selection handlers.
 *
 * @param[in] obj The object.
 * @param[in] disabled If @c true, the selection handlers are disabled.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_selection_handler_disabled_set(obj:PElm_Entry; disabled:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Set the input panel layout variation of the entry
 *
 * @param[in] obj The object.
 * @param[in] variation Layout variation type.
 *
 * @since 1.8
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_layout_variation_set(obj:PElm_Entry; variation:longint);cdecl;external libelementary;
{*
 * @brief Get the input panel layout variation of the entry
 *
 * @param[in] obj The object.
 *
 * @return Layout variation type.
 *
 * @since 1.8
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_panel_layout_variation_get(obj:PElm_Entry):longint;cdecl;external libelementary;
{*
 * @brief Set the autocapitalization type on the immodule.
 *
 * @param[in] obj The object.
 * @param[in] autocapital_type The type of autocapitalization.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_autocapital_type_set(obj:PElm_Entry; autocapital_type:TElm_Autocapital_Type);cdecl;external libelementary;
{*
 * @brief Get the autocapitalization type on the immodule.
 *
 * @param[in] obj The object.
 *
 * @return The type of autocapitalization.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_autocapital_type_get(obj:PElm_Entry):TElm_Autocapital_Type;cdecl;external libelementary;
{*
 * @brief Sets if the entry is to be editable or not.
 *
 * By default, entries are editable and when focused, any text input by the
 * user will be inserted at the current cursor position. But calling this
 * function with @c editable as @c false will prevent the user from inputting
 * text into the entry.
 *
 * The only way to change the text of a non-editable entry is to use @ref
 * elm_object_text_set, @ref elm_entry_entry_insert and other related
 * functions.
 *
 * @param[in] obj The object.
 * @param[in] editable If @c true, user input will be inserted in the entry, if
 * not, the entry is read-only and no user input is allowed.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_editable_set(obj:PElm_Entry; editable:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Get whether the entry is editable or not.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, user input will be inserted in the entry, if not, the
 * entry is read-only and no user input is allowed.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_editable_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Set the style that the hover should use
 *
 * When creating the popup hover, entry will request that it's themed according
 * to @c style.
 *
 * Setting style no @c null means disabling automatic hover.
 *
 * @param[in] obj The object.
 * @param[in] style The style to use for the underlying hover.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_anchor_hover_style_set(obj:PElm_Entry; style:Pchar);cdecl;external libelementary;
{*
 * @brief Get the style that the hover should use.
 *
 * @param[in] obj The object.
 *
 * @return The style to use for the underlying hover.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_anchor_hover_style_get(obj:PElm_Entry):Pchar;cdecl;external libelementary;
{*
 * @brief Sets the entry to single line mode.
 *
 * In single line mode, entries don't ever wrap when the text reaches the edge,
 * and instead they keep growing horizontally. Pressing the @c Enter key will
 * generate an $"activate" event instead of adding a new line.
 *
 * When @c single_line is @c false, line wrapping takes effect again and
 * pressing enter will break the text into a different line without generating
 * any events.
 *
 * @param[in] obj The object.
 * @param[in] single_line If @c true, the text in the entry will be on a single
 * line.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_single_line_set(obj:PElm_Entry; single_line:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Get whether the entry is set to be single line.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the text in the entry will be on a single line.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_single_line_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Sets the entry to password mode.
 *
 * In password mode, entries are implicitly single line and the display of any
 * text in them is replaced with asterisks (*).
 *
 * @param[in] obj The object.
 * @param[in] password If @c true, password mode is enabled.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_password_set(obj:PElm_Entry; password:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Get whether the entry is set to password mode.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, password mode is enabled.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_password_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Set the return key on the input panel to be disabled.
 *
 * @param[in] obj The object.
 * @param[in] disabled The state to put in in: @c true for disabled, @c false
 * for enabled.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_return_key_disabled_set(obj:PElm_Entry; disabled:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Get whether the return key on the input panel should be disabled or
 * not.
 *
 * @param[in] obj The object.
 *
 * @return The state to put in in: @c true for disabled, @c false for enabled.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_panel_return_key_disabled_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief This sets the entry object to 'autosave' the loaded text file or not.
 *
 * @param[in] obj The object.
 * @param[in] auto_save Autosave the loaded file or not.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_autosave_set(obj:PElm_Entry; auto_save:TEina_Bool);cdecl;external libelementary;
{*
 * @brief This gets the entry object's 'autosave' status.
 *
 * @param[in] obj The object.
 *
 * @return Autosave the loaded file or not.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_autosave_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Set the parent of the hover popup
 *
 * Sets the parent object to use by the hover created by the entry when an
 * anchor is clicked.
 *
 * @param[in] obj The object.
 * @param[in] parent The object to use as parent for the hover.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_anchor_hover_parent_set(obj:PElm_Entry; parent:PEfl_Canvas_Object);cdecl;external libelementary;
{*
 * @brief Get the parent of the hover popup
 *
 * Get the object used as parent for the hover created by the entry widget. If
 * no parent is set, the same entry object will be used.
 *
 * @param[in] obj The object.
 *
 * @return The object to use as parent for the hover.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_anchor_hover_parent_get(obj:PElm_Entry):PEfl_Canvas_Object;cdecl;external libelementary;
{*
 * @brief Set whether the entry should allow to use the text prediction.
 *
 * @param[in] obj The object.
 * @param[in] prediction Whether the entry should allow to use the text
 * prediction.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_prediction_allow_set(obj:PElm_Entry; prediction:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Get whether the entry should allow to use the text prediction.
 *
 * @param[in] obj The object.
 *
 * @return Whether the entry should allow to use the text prediction.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_prediction_allow_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Sets the input hint which allows input methods to fine-tune their
 * behavior.
 *
 * @param[in] obj The object.
 * @param[in] hints Input hint.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_hint_set(obj:PElm_Entry; hints:TElm_Input_Hints);cdecl;external libelementary;
{*
 * @brief Gets the value of input hint.
 *
 * @param[in] obj The object.
 *
 * @return Input hint.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_hint_get(obj:PElm_Entry):TElm_Input_Hints;cdecl;external libelementary;
{*
 * @brief Set the input panel layout of the entry.
 *
 * @param[in] obj The object.
 * @param[in] layout Layout type.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_layout_set(obj:PElm_Entry; layout:TElm_Input_Panel_Layout);cdecl;external libelementary;
{*
 * @brief Get the input panel layout of the entry.
 *
 * @param[in] obj The object.
 *
 * @return Layout type.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_panel_layout_get(obj:PElm_Entry):TElm_Input_Panel_Layout;cdecl;external libelementary;
{*
 * @brief Set the "return" key type. This type is used to set string or icon on
 * the "return" key of the input panel.
 *
 * An input panel displays the string or icon associated with this type.
 *
 * Regardless of return key type, "activated" event will be generated when
 * pressing return key in single line entry.
 *
 * @param[in] obj The object.
 * @param[in] return_key_type The type of "return" key on the input panel.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_return_key_type_set(obj:PElm_Entry; return_key_type:TElm_Input_Panel_Return_Key_Type);cdecl;external libelementary;
{*
 * @brief Get the "return" key type.
 *
 * @param[in] obj The object.
 *
 * @return The type of "return" key on the input panel.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_panel_return_key_type_get(obj:PElm_Entry):TElm_Input_Panel_Return_Key_Type;cdecl;external libelementary;
{*
 * @brief Sets the attribute to show the input panel automatically.
 *
 * @param[in] obj The object.
 * @param[in] enabled If @c true, the input panel is appeared when entry is
 * clicked or has a focus.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_enabled_set(obj:PElm_Entry; enabled:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Get the attribute to show the input panel automatically.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the input panel is appeared when entry is clicked or has
 * a focus.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_input_panel_enabled_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Set the line wrap type to use on multi-line entries.
 *
 * Sets the wrap type used by the entry to any of the specified in
 * Elm_Wrap_Type. This tells how the text will be implicitly cut into a new
 * line (without inserting a line break or paragraph separator) when it reaches
 * the far edge of the widget.
 *
 * Note that this only makes sense for multi-line entries. A widget set to be
 * single line will never wrap.
 *
 * @param[in] obj The object.
 * @param[in] wrap The wrap mode to use. See Elm_Wrap_Type for details on them.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_line_wrap_set(obj:PElm_Entry; wrap:TElm_Wrap_Type);cdecl;external libelementary;
{*
 * @brief Get the wrap mode the entry was set to use.
 *
 * @param[in] obj The object.
 *
 * @return The wrap mode to use. See Elm_Wrap_Type for details on them.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_line_wrap_get(obj:PElm_Entry):TElm_Wrap_Type;cdecl;external libelementary;
{*
 * @brief Sets the cursor position in the entry to the given value
 *
 * The value in @c pos is the index of the character position within the
 * contents of the string as returned by @ref elm_entry_cursor_pos_get.
 *
 * @param[in] obj The object.
 * @param[in] pos The position of the cursor.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_pos_set(obj:PElm_Entry; pos:longint);cdecl;external libelementary;
{*
 * @brief Get the current position of the cursor in the entry.
 *
 * @param[in] obj The object.
 *
 * @return The position of the cursor.
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_pos_get(obj:PElm_Entry):longint;cdecl;external libelementary;
{*
 * @brief Sets the visibility of the left-side widget of the entry, set by @ref
 * elm_object_part_content_set.
 *
 * @param[in] obj The object.
 * @param[in] setting @c true if the object should be displayed, @c false if
 * not.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_icon_visible_set(obj:PElm_Entry; setting:TEina_Bool);cdecl;external libelementary;
{* This moves the cursor to the end of the current line.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_line_end_set(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief This selects a region of text within the entry.
 *
 * @param[in] obj The object.
 * @param[in] start The starting position.
 * @param[in] end The end position.
 *
 * @since 1.9
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_select_region_set(obj:PElm_Entry; start:longint; end:longint);cdecl;external libelementary;
{*
 * @brief Get the current position of the selection cursors in the entry.
 *
 * @param[in] obj The object.
 * @param[out] start The starting position.
 * @param[out] end The end position.
 *
 * @since 1.18
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_select_region_get(obj:PElm_Entry; start:Plongint; end:Plongint);cdecl;external libelementary;
{*
 * @brief Set whether the return key on the input panel is disabled
 * automatically when entry has no text.
 *
 * If @c enabled is @c true, The return key on input panel is disabled when the
 * entry has no text. The return key on the input panel is automatically
 * enabled when the entry has text. The default value is @c false.
 *
 * @param[in] obj The object.
 * @param[in] enabled If @c enabled is @c true, the return key is automatically
 * disabled when the entry has no text.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_return_key_autoenabled_set(obj:PElm_Entry; enabled:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Sets the visibility of the end widget of the entry, set by @ref
 * elm_object_part_content_set(ent, "end", content).
 *
 * @param[in] obj The object.
 * @param[in] setting @c true if the object should be displayed, false if not.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_end_visible_set(obj:PElm_Entry; setting:TEina_Bool);cdecl;external libelementary;
{* This moves the cursor to the beginning of the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_begin_set(obj:PElm_Entry);cdecl;external libelementary;
{* This moves the cursor to the beginning of the current line.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_line_begin_set(obj:PElm_Entry);cdecl;external libelementary;
{* This moves the cursor to the end of the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_end_set(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief Returns the actual textblock object of the entry.
 *
 * This function exposes the internal textblock object that actually contains
 * and draws the text. This should be used for low-level manipulations that are
 * otherwise not possible.
 *
 * Changing the textblock directly from here will not notify edje/elm to
 * recalculate the textblock size automatically, so any modifications done to
 * the textblock returned by this function should be followed by a call to @ref
 * elm_entry_calc_force.
 *
 * The return value is marked as const as an additional warning. One should not
 * use the returned object with any of the generic evas functions
 * (geometry_get/resize/move and etc), but only with the textblock functions;
 * The former will either not work at all, or break the correct functionality.
 *
 * IMPORTANT: Many functions may change (i.e delete and create a new one) the
 * internal textblock object. Do NOT cache the returned object, and try not to
 * mix calls on this object with regular elm_entry calls (which may change the
 * internal textblock object). This applies to all cursors returned from
 * textblock calls, and all the other derivative values.
 *
 * @param[in] obj The object.
 *
 * @return Textblock object
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_textblock_get(obj:PElm_Entry):PEfl_Canvas_Object;cdecl;external libelementary;
{*
 * @brief This function returns the geometry of the cursor.
 *
 * It's useful if you want to draw something on the cursor (or where it is), or
 * for example in the case of scrolled entry where you want to show the cursor.
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 * @param[out] w Width
 * @param[out] h Height
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_geometry_get(obj:PElm_Entry; x:Plongint; y:Plongint; w:Plongint; h:Plongint):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Returns the input method context of the entry.
 *
 * This function exposes the internal input method context.
 *
 * IMPORTANT: Many functions may change (i.e delete and create a new one) the
 * internal input method context. Do NOT cache the returned object.
 *
 * @param[in] obj The object.
 *
 * @return Input method context
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_imf_context_get(obj:PElm_Entry):pointer;cdecl;external libelementary;
{*
 * @brief Get whether a format node exists at the current cursor position.
 *
 * A format node is anything that defines how the text is rendered. It can be a
 * visible format node, such as a line break or a paragraph separator, or an
 * invisible one, such as bold begin or end tag. This function returns whether
 * any format node exists at the current cursor position.
 *
 * @param[in] obj The object.
 *
 * @return @c true if format node exists, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_is_format_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Get the character pointed by the cursor at its current position.
 *
 * This function returns a string with the utf8 character stored at the current
 * cursor position. Only the text is returned, any format that may exist will
 * not be part of the return value. You must free the string when done with
 * @ref free.
 *
 * @param[in] obj The object.
 *
 * @return Character
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_content_get(obj:PElm_Entry):Pchar;cdecl;external libelementary;
{*
 * @brief Get any selected text within the entry.
 *
 * If there's any selected text in the entry, this function returns it as a
 * string in markup format. @c null is returned if no selection exists or if an
 * error occurred.
 *
 * The returned value points to an internal string and should not be freed or
 * modified in any way. If the @c entry object is deleted or its contents are
 * changed, the returned pointer should be considered invalid.
 *
 * @param[in] obj The object.
 *
 * @return Selected string
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_selection_get(obj:PElm_Entry):Pchar;cdecl;external libelementary;
{*
 * @brief Get if the current cursor position holds a visible format node.
 *
 * @param[in] obj The object.
 *
 * @return @c true if position has a visible format, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_is_visible_format_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Allow selection in the entry.
 *
 * @param[in] obj The object.
 * @param[in] allow If @c allow is true, the text selection is allowed.
 *
 * @since 1.18
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_select_allow_set(obj:PElm_Entry; allow:TEina_Bool);cdecl;external libelementary;
{*
 * @brief Allow selection in the entry.
 *
 * @param[in] obj The object.
 *
 * @return If @c allow is true, the text selection is allowed.
 *
 * @since 1.18
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_select_allow_get(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief This moves the cursor one place to the left within the entry.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_prev(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{* Remove the style in the top of user style stack.
 *
 * @since 1.7
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_text_style_user_pop(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief This prepends a custom item provider to the list for that entry
 *
 * This prepends the given callback.
 *
 * @param[in] obj The object.
 * @param[in] func The function called to provide the item object.
 * @param[in] data The data passed to @c func.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_item_provider_prepend(obj:PElm_Entry; func:TElm_Entry_Item_Provider_Cb; data:pointer);cdecl;external libelementary;
{*
 * @brief Show the input panel (virtual keyboard) based on the input panel
 * property of entry such as layout, autocapital types, and so on.
 *
 * Note that input panel is shown or hidden automatically according to the
 * focus state of entry widget. This API can be used in the case of manually
 * controlling by using @ref elm_entry_input_panel_enabled_set(en, @c false).
 * @param[in] obj The object.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_show(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief Reset the input method context of the entry if needed.
 *
 * This can be necessary in the case where modifying the buffer would confuse
 * on-going input method behavior. This will typically cause the Input Method
 * Context to clear the preedit state.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_imf_context_reset(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief Ends the hover popup in the entry
 *
 * When an anchor is clicked, the entry widget will create a hover object to
 * use as a popup with user provided content. This function terminates this
 * popup, returning the entry to its normal state.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_anchor_hover_end(obj:PElm_Entry);cdecl;external libelementary;
{* This begins a selection within the entry as though the user were holding
 * down the mouse button to make a selection.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_selection_begin(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief This moves the cursor one line down within the entry.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_down(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{* This function writes any changes made to the file set with @ref
 * elm_entry_file_set.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_file_save(obj:PElm_Entry);cdecl;external libelementary;
{* This executes a "copy" action on the selected text in the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_selection_copy(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief Push the style to the top of user style stack. If there is styles in
 * the user style stack, the properties in the top style of user style stack
 * will replace the properties in current theme. The input style is specified
 * in format tag='property=value' (i.e. DEFAULT='font=Sans
 * font_size=60'hilight=' + font_weight=Bold').
 *
 * @param[in] obj The object.
 * @param[in] style The style user to push.
 *
 * @since 1.7
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_text_style_user_push(obj:PElm_Entry; style:Pchar);cdecl;external libelementary;
{*
 * @brief This removes a custom item provider to the list for that entry
 *
 * This removes the given callback. See @ref elm_entry_item_provider_append for
 * more information
 *
 * @param[in] obj The object.
 * @param[in] func The function called to provide the item object.
 * @param[in] data The data passed to @c func.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_item_provider_remove(obj:PElm_Entry; func:TElm_Entry_Item_Provider_Cb; data:pointer);cdecl;external libelementary;
{*
 * @brief Get the style on the top of user style stack.
 *
 * See also @ref elm_entry_text_style_user_push.
 *
 * @param[in] obj The object.
 *
 * @return Style
 *
 * @since 1.7
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_text_style_user_peek(obj:PElm_Entry):Pchar;cdecl;external libelementary;
{*
 * @brief This clears and frees the items in a entry's contextual (longpress)
 * menu.
 *
 * See also @ref elm_entry_context_menu_item_add.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_context_menu_clear(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief This moves the cursor one line up within the entry.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_up(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Inserts the given text into the entry at the current cursor position.
 *
 * This inserts text at the cursor position as if it was typed by the user
 * (note that this also allows markup which a user can't just "type" as it
 * would be converted to escaped text, so this call can be used to insert
 * things like emoticon items or bold push/pop tags, other font and color
 * change tags etc.)
 *
 * If any selection exists, it will be replaced by the inserted text.
 *
 * The inserted text is subject to any filters set for the widget.
 *
 * See also @ref elm_entry_markup_filter_append.
 *
 * @param[in] obj The object.
 * @param[in] entry The text to insert.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_entry_insert(obj:PElm_Entry; entry:Pchar);cdecl;external libelementary;
{*
 * @brief Set the input panel-specific data to deliver to the input panel.
 *
 * This API is used by applications to deliver specific data to the input
 * panel. The data format MUST be negotiated by both application and the input
 * panel. The size and format of data are defined by the input panel.
 *
 * @param[in] obj The object.
 * @param[in] data The specific data to be set to the input panel.
 * @param[in] len The length of data, in bytes, to send to the input panel.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_imdata_set(obj:PElm_Entry; data:pointer; len:longint);cdecl;external libelementary;
{*
 * @brief Get the specific data of the current input panel.
 *
 * @param[in] obj The object.
 * @param[out] data The specific data to be got from the input panel.
 * @param[out] len The length of data.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_imdata_get(obj:PElm_Entry; data:pointer; len:Plongint);cdecl;external libelementary;
{* This executes a "paste" action in the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_selection_paste(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief This moves the cursor one place to the right within the entry.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_cursor_next(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{* This drops any existing text selection within the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_select_none(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief Hide the input panel (virtual keyboard).
 *
 * Note that input panel is shown or hidden automatically according to the
 * focus state of entry widget. This API can be used in the case of manually
 * controlling by using @ref elm_entry_input_panel_enabled_set(en, @c false)
 * @param[in] obj The object.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_input_panel_hide(obj:PElm_Entry);cdecl;external libelementary;
{* This selects all text within the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_select_all(obj:PElm_Entry);cdecl;external libelementary;
{* This ends a selection within the entry as though the user had just released
 * the mouse button while making a selection.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_cursor_selection_end(obj:PElm_Entry);cdecl;external libelementary;
{* This executes a "cut" action on the selected text in the entry.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_selection_cut(obj:PElm_Entry);cdecl;external libelementary;
{*
 * @brief Get whether the entry is empty.
 *
 * Empty means no text at all. If there are any markup tags, like an item tag
 * for which no provider finds anything, and no text is displayed, this
 * function still returns @c false.
 *
 * @param[in] obj The object.
 *
 * @return @c true if empty, @c false otherwise
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_is_empty(obj:PElm_Entry):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Remove a markup filter from the list
 *
 * Removes the given callback from the filter list. See
 * @ref elm_entry_markup_filter_append for more information.
 *
 * @param[in] obj The object.
 * @param[in] func The filter function to remove.
 * @param[in] data The user data passed when adding the function.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_markup_filter_remove(obj:PElm_Entry; func:TElm_Entry_Filter_Cb; data:pointer);cdecl;external libelementary;
{*
 * @brief This appends a custom item provider to the list for that entry
 *
 * This appends the given callback. The list is walked from beginning to end
 * with each function called given the item href string in the text. If the
 * function returns an object handle other than @c null (it should create an
 * object to do this), then this object is used to replace that item. If not
 * the next provider is called until one provides an item object, or the
 * default provider in entry does.
 *
 * See also @ref entry-items.
 *
 * @param[in] obj The object.
 * @param[in] func The function called to provide the item object.
 * @param[in] data The data passed to @c func.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_item_provider_append(obj:PElm_Entry; func:TElm_Entry_Item_Provider_Cb; data:pointer);cdecl;external libelementary;
{*
 * @brief Append a markup filter function for text inserted in the entry
 *
 * Append the given callback to the list. This functions will be called
 * whenever any text is inserted into the entry, with the text to be inserted
 * as a parameter. The type of given text is always markup. The callback
 * function is free to alter the text in any way it wants, but it must remember
 * to free the given pointer and update it. If the new text is to be discarded,
 * the function can free it and set its text parameter to @c null. This will
 * also prevent any following filters from being called.
 *
 * @param[in] obj The object.
 * @param[in] func The function to use as text filter.
 * @param[in] data User data to pass to @c func.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_markup_filter_append(obj:PElm_Entry; func:TElm_Entry_Filter_Cb; data:pointer);cdecl;external libelementary;
{*
 * @brief Appends @c str to the text of the entry.
 *
 * Adds the text in @c str to the end of any text already present in the
 * widget.
 *
 * The appended text is subject to any filters set for the widget.
 *
 * See also @ref elm_entry_markup_filter_append.
 *
 * @param[in] obj The object.
 * @param[in] str The text to be appended.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_entry_append(obj:PElm_Entry; str:Pchar);cdecl;external libelementary;
{*
 * @brief This adds an item to the entry's contextual menu.
 *
 * A longpress on an entry will make the contextual menu show up, if this
 * hasn't been disabled with @ref elm_entry_context_menu_disabled_set. By
 * default, this menu provides a few options like enabling selection mode,
 * which is useful on embedded devices that need to be explicit about it, and
 * when a selection exists it also shows the copy and cut actions.
 *
 * With this function, developers can add other options to this menu to perform
 * any action they deem necessary.
 *
 * @param[in] obj The object.
 * @param[in] label The item's text label.
 * @param[in] icon_file The item's icon file.
 * @param[in] icon_type The item's icon type.
 * @param[in] func The callback to execute when the item is clicked.
 * @param[in] data The data to associate with the item for related functions.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_context_menu_item_add(obj:PElm_Entry; _label:Pchar; icon_file:Pchar; icon_type:TElm_Icon_Type; func:TEvas_Smart_Cb; 
            data:pointer);cdecl;external libelementary;
{*
 * @brief Prepend a markup filter function for text inserted in the entry
 *
 * Prepend the given callback to the list.
 *
 * @param[in] obj The object.
 * @param[in] func The function to use as text filter.
 * @param[in] data User data to pass to @c func.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_markup_filter_prepend(obj:PElm_Entry; func:TElm_Entry_Filter_Cb; data:pointer);cdecl;external libelementary;
{*
 * @brief Sets the prediction hint to use an intelligent reply suggestion
 * service.
 *
 * @param[in] obj The object.
 * @param[in] prediction_hint The prediction hint text.
 *
 * @since 1.20
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_prediction_hint_set(obj:PElm_Entry; prediction_hint:Pchar);cdecl;external libelementary;
{*
 * @brief Sets the prediction hint data at the specified key.
 *
 * @param[in] obj The object.
 * @param[in] key The key of the prediction hint.
 * @param[in] value The data to replace.
 *
 * @return @c true on success, @c false otherwise
 *
 * @since 1.21
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_prediction_hint_hash_set(obj:PElm_Entry; key:Pchar; value:Pchar):TEina_Bool;cdecl;external libelementary;
{*
 * @brief Removes the prediction hint data identified by a key.
 *
 * @param[in] obj The object.
 * @param[in] key The key of the prediction hint.
 *
 * @return @c true on success, @c false otherwise
 *
 * @since 1.21
 *
 * @ingroup Elm_Entry_Group
  }
function elm_entry_prediction_hint_hash_del(obj:PElm_Entry; key:Pchar):TEina_Bool;cdecl;external libelementary;
{$endif}

// === Konventiert am: 13-5-25 14:06:07 ===


implementation



end.
