
unit elm_layout_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_layout_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_layout_legacy.h
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
PEina_File  = ^Eina_File;
PEina_List  = ^Eina_List;
PElm_Layout  = ^Elm_Layout;
PElm_Layout_Part_Alias_Description  = ^Elm_Layout_Part_Alias_Description;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Elementary Layout-based widgets may declare part proxies, i.e., aliases for
 * real theme part names to expose to the API calls:
 * - elm_layout_text_set()
 * - elm_layout_text_get()
 * - elm_layout_content_set()
 * - elm_layout_content_get()
 * - elm_layout_content_unset()
 * and their equivalents. This list must be set on the "_smart_set_user()"
 * function of inheriting widgets, so that part aliasing is handled
 * automatically for them.
 *
 * @deprecated Should not be used outside of EFL internal code.
  }
(* Const before type ignored *)
{*< Alternate name for a given (real) part. Calls
                      * receiving this string as a part name will be translated
                      * to the string at
                      * Efl.Ui.Layout_Part_Proxies_Description::real_part  }
(* Const before type ignored *)
{*< Target part name for the alias set on
                          * Efl.Ui.Layout_Part_Proxies_Description::real_part. An
                          * example of usage would be "default" on that field,
                          * with "elm.content.swallow" on this one  }
type
  PElm_Layout_Part_Alias_Description = ^TElm_Layout_Part_Alias_Description;
  TElm_Layout_Part_Alias_Description = record
      alias : Pchar;
      real_part : Pchar;
    end;


  PElm_Layout = ^TElm_Layout;
  TElm_Layout = TEo;
{*
 * Add a new layout to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @see elm_layout_file_set()
 * @see elm_layout_theme_set()
 *
 * @ingroup Elm_Layout
  }

function elm_layout_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the edje group from the elementary theme that will be used as
 * layout.
 *
 * Note that @c style will be the new style of @c obj too, as in an @ref
 * elm_object_style_set call.
 *
 * @param[in] klass The class of the group.
 * @param[in] group The group.
 * @param[in] style The style to used.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_theme_set(obj:PEvas_Object; klass:Pchar; group:Pchar; style:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the edje data from the given layout.
 *
 * This function fetches data specified inside the edje theme of this layout.
 * This function return NULL if data is not found.
 *
 * In EDC this comes from a data block within the group block that @c obj was
 * loaded from.
 *
 * @param[in] key The data key.
 *
 * @return The edje data string.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_data_get(obj:PEvas_Object; key:Pchar):Pchar;cdecl;external;
{*
 * @brief Eval sizing.
 *
 * Manually forces a sizing re-evaluation. This is useful when the minimum size
 * required by the edje theme of this layout has changed. The change on the
 * minimum size required by the edje theme is not immediately reported to the
 * elementary layout, so one needs to call this function in order to tell the
 * widget (layout) that it needs to reevaluate its own size.
 *
 * The minimum size of the theme is calculated based on minimum size of parts,
 * the size of elements inside containers like box and table, etc. All of this
 * can change due to state changes, and that's when this function should be
 * called.
 *
 * Also note that a standard signal of "size,eval" "elm" emitted from the edje
 * object will cause this to happen too.
 *
 * @ingroup Elm_Layout
  }
procedure elm_layout_sizing_eval(obj:PEvas_Object);cdecl;external;
{*
 * @brief Request sizing reevaluation, restricted to current width and/or
 * height.
 *
 * Useful mostly when there are TEXTBLOCK parts defining the height of the
 * object and nothing else restricting it to a minimum width. Calling this
 * function will restrict the minimum size in the Edje calculation to whatever
 * size it the layout has at the moment.
 *
 * @param[in] width Restrict minimum size to the current width.
 * @param[in] height Restrict minimum size ot the current height.
 *
 * @since 1.8
 *
 * @ingroup Elm_Layout
  }
procedure elm_layout_sizing_restricted_eval(obj:PEvas_Object; width:TEina_Bool; height:TEina_Bool);cdecl;external;
{*
 * @brief Add a callback for a (Edje) signal emitted by a layout widget's
 * underlying Edje object.
 *
 * This function connects a callback function to a signal emitted by the
 * underlying Edje object of @c obj. Globs are accepted in either the emission
 * or source strings.
 *
 * @param[in] emission The signal's name string.
 * @param[in] source The signal's source string.
 * @param[in] func The callback function to be executed when the signal is
 * emitted.
 * @param[in] data A pointer to data to pass in to the callback function.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_layout_signal_callback_add(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove a signal-triggered callback from a given layout widget.
 *
 * This function removes the last callback attached to a signal emitted by the
 * underlying Edje object of @c obj, with parameters @c emission, @c source and
 * @c func matching exactly those passed to a previous call to
 * @ref elm_layout_signal_callback_add. The data pointer that was passed to
 * this call will be returned.
 *
 * @param[in] emission The signal's name string.
 * @param[in] source The signal's source string.
 * @param[in] func The callback function being executed when the signal was
 * emitted.
 *
 * @return The data pointer of the signal callback (passed on
 * @ref elm_layout_signal_callback_add) or @c null on errors.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_signal_callback_del(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb):pointer;cdecl;external;
{*
 * @brief Send a (Edje) signal to a given layout widget's underlying Edje
 * object.
 *
 * This function sends a signal to the underlying Edje object of @c obj. An
 * Edje program on that Edje object's definition can respond to a signal by
 * specifying matching 'signal' and 'source' fields.
 *
 * @param[in] emission The signal's name string.
 * @param[in] source The signal's source string.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_layout_signal_emit(obj:PEvas_Object; emission:Pchar; source:Pchar);cdecl;external;
{*
 * @brief Get the edje layout
 *
 * This returns the edje object. It is not expected to be used to then swallow
 * objects via @ref edje_object_part_swallow for example. Use @ref
 * elm_layout_content_set instead so child object handling and sizing is done
 * properly.
 *
 * @note This function should only be used if you really need to call some low
 * level Edje function on this edje object. All the common stuff (setting text,
 * emitting signals, hooking callbacks to signals, etc.) can be done with
 * proper elementary functions.
 *
 * @return An Evas_Object with the edje layout settings loaded @ref
 * elm_layout_file_set.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_edje_get(obj:PEvas_Object):PEfl_Canvas_Object;cdecl;external;
{*
 * Get the list of swallow parts of a given container widget
 *
 * @param obj The layout object
 *
 * @return list of swallow parts which should be freed by the user program with elm_list_free()
 *
 * @since 1.9
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_content_swallow_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * Set the layout content.
 *
 * @param obj The layout object
 * @param swallow The swallow part name in the edje file
 * @param content The child that will be added in this layout object
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * Once the content object is set, a previously set one will be deleted.
 * If you want to keep that old content object, use the
 * elm_layout_content_unset() function.
 *
 * @note In an Edje theme, the part used as a content container is called
 * @c SWALLOW. This is why the parameter name is called @p swallow, but it is
 * expected to be a part name just like the second parameter of
 * elm_layout_box_append().
 *
 * @see elm_layout_box_append()
 * @see elm_layout_content_get()
 * @see elm_layout_content_unset()
 *
 * @see @ref secBox
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_content_set(obj:PEvas_Object; swallow:Pchar; content:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Get the child object in the given content part.
 *
 * @param obj The layout object
 * @param swallow The SWALLOW part to get its content
 *
 * @return The swallowed object or NULL if none or an error occurred
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_content_get(obj:PEvas_Object; swallow:Pchar):PEvas_Object;cdecl;external;
{*
 * Unset the layout content.
 *
 * @param obj The layout object
 * @param swallow The swallow part name in the edje file
 * @return The content that was being used
 *
 * Unparent and return the content object which was set for this part.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_content_unset(obj:PEvas_Object; swallow:Pchar):PEvas_Object;cdecl;external;
{*
 * Set the file that will be used as layout
 *
 * @return (1 = success, 0 = error)
 *
 * @ingroup Elm_Layout
 *
 * @param[in] file The path to file (edj) that will be used as layout
 * @param[in] group The group that the layout belongs in edje file
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_file_set(obj:PEo; file:Pchar; group:Pchar):TEina_Bool;cdecl;external;
{*
 * Get the loaded file
 *
 *
 * @ingroup Elm_Layout
 *
 * @param file The path to file (edj) used as layout
 * @param group The group that the layout belongs in edje file
 *
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_layout_file_get(obj:PEo; file:PPchar; group:PPchar);cdecl;external;
{*
 * Set the mmap file that will be used as layout
 *
 * @return (1 = success, 0 = error)
 *
 * @ingroup Elm_Layout
 *
 * @param[in] file Eina_File (edj) that will be used as layout
 * @param[in] group The group that the layout belongs in edje file
 *
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_mmap_set(obj:PEo; file:PEina_File; group:Pchar):TEina_Bool;cdecl;external;
{*
 * Get the loaded mmap file
 *
 * @ingroup Elm_Layout
 *
 * @param file Eina_File (edj) used as layout
 * @param group The group that the layout belongs in edje file
 *
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_layout_mmap_get(obj:PEo; file:PPEina_File; group:PPchar);cdecl;external;
{*
 * @brief Freezes the Elementary layout object.
 *
 * This function puts all changes on hold. Successive freezes will nest,
 * requiring an equal number of thaws.
 *
 * See also @ref elm_layout_thaw.
 *
 * @return The frozen state or 0 on error.
  }
function elm_layout_freeze(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Thaws the Elementary object.
 *
 * This function thaws the given Edje object and the Elementary sizing calc.
 *
 * @note If successive freezings were done, an equal number of thaws will be
 * required.
 *
 * See also @ref elm_layout_freeze.
 *
 * @return The frozen state or 0 if the object is not frozen or on error.
  }
function elm_layout_thaw(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Append child to layout box part.
 *
 * Once the object is appended, it will become child of the layout. Its
 * lifetime will be bound to the layout, whenever the layout dies the child
 * will be deleted automatically. One should use @ref elm_layout_box_remove to
 * make this layout forget about the object.
 *
 * @param[in] child The child object to append to box.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_box_append(obj:PEvas_Object; part:Pchar; child:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Prepend child to layout box part.
 *
 * Once the object is prepended, it will become child of the layout. Its
 * lifetime will be bound to the layout, whenever the layout dies the child
 * will be deleted automatically. One should use @ref elm_layout_box_remove to
 * make this layout forget about the object.
 *
 * @param[in] child The child object to prepend to box.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_box_prepend(obj:PEvas_Object; part:Pchar; child:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Insert child to layout box part before a reference object.
 *
 * Once the object is inserted, it will become child of the layout. Its
 * lifetime will be bound to the layout, whenever the layout dies the child
 * will be deleted automatically. One should use @ref elm_layout_box_remove to
 * make this layout forget about the object.
 *
 * @param[in] child The child object to insert into box.
 * @param[in] reference Another reference object to insert before in box.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_box_insert_before(obj:PEvas_Object; part:Pchar; child:PEvas_Object; reference:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Insert child to layout box part at a given position.
 *
 * Once the object is inserted, it will become child of the layout. Its
 * lifetime will be bound to the layout, whenever the layout dies the child
 * will be deleted automatically. One should use @ref elm_layout_box_remove to
 * make this layout forget about the object.
 *
 * @param[in] child The child object to insert into box.
 * @param[in] pos The numeric position >=0 to insert the child.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_box_insert_at(obj:PEvas_Object; part:Pchar; child:PEvas_Object; pos:dword):TEina_Bool;cdecl;external;
{*
 * @brief Remove a child of the given part box.
 *
 * The object will be removed from the box part and its lifetime will not be
 * handled by the layout anymore. This is equivalent to @ref
 * elm_layout_content_unset for box.
 *
 * @param[in] child The object to remove from box.
 *
 * @return The object that was being used, or @c null if not found.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_box_remove(obj:PEvas_Object; part:Pchar; child:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Remove all children of the given part box.
 *
 * The objects will be removed from the box part and their lifetime will not be
 * handled by the layout anymore. This is equivalent to
 * @ref elm_layout_box_remove for all box children.
 *
 * @param[in] clear If true, then all objects will be deleted as well,
 * otherwise they will just be removed and will be dangling on the canvas.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_box_remove_all(obj:PEvas_Object; part:Pchar; clear:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Insert child to layout table part.
 *
 * Once the object is inserted, it will become child of the table. Its lifetime
 * will be bound to the layout, and whenever the layout dies the child will be
 * deleted automatically. One should use @ref elm_layout_table_unpack to make
 * this layout forget about the object.
 *
 * If @c colspan or @c rowspan are bigger than 1, that object will occupy more
 * space than a single cell.
 *
 * See also @ref elm_layout_table_unpack, @ref elm_layout_table_clear.
 *
 * @param[in] child The child object to pack into table.
 * @param[in] col The column to which the child should be added. (>= 0)
 * @param[in] row The row to which the child should be added. (>= 0)
 * @param[in] colspan How many columns should be used to store this object. (>=
 * 1)
 * @param[in] rowspan How many rows should be used to store this object. (>= 1)
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_table_pack(obj:PEvas_Object; part:Pchar; child:PEvas_Object; col:word; row:word; 
           colspan:word; rowspan:word):TEina_Bool;cdecl;external;
{*
 * @brief Unpack (remove) a child of the given part table.
 *
 * The object will be unpacked from the table part and its lifetime will not be
 * handled by the layout anymore. This is equivalent to @ref
 * elm_layout_content_unset for table.
 *
 * @param[in] child The object to remove from table.
 *
 * @return The object that was being used, or @c null if not found.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_table_unpack(obj:PEvas_Object; part:Pchar; child:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Remove all the child objects of the given part table.
 *
 * The objects will be removed from the table part and their lifetime will not
 * be handled by the layout anymore. This is equivalent to
 * @ref elm_layout_table_unpack for all table children.
 *
 * @param[in] clear If true, then all objects will be deleted as well,
 * otherwise they will just be removed and will be dangling on the canvas.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_table_clear(obj:PEvas_Object; part:Pchar; clear:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Get the edje data from the given layout.
 *
 * This function fetches data specified inside the edje theme of this layout.
 * This function return NULL if data is not found.
 *
 * In EDC this comes from a data block within the group block that @c obj was
 * loaded from.
 *
 * @param[in] key The data key.
 *
 * @return The edje data string.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_data_get(obj:PEvas_Object; key:Pchar):Pchar;cdecl;external;
{*
 * @brief Send a (Edje) signal to a given layout widget's underlying Edje
 * object.
 *
 * This function sends a signal to the underlying Edje object of @c obj. An
 * Edje program on that Edje object's definition can respond to a signal by
 * specifying matching 'signal' and 'source' fields.
 *
 * @param[in] emission The signal's name string.
 * @param[in] source The signal's source string.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_layout_signal_emit(obj:PEvas_Object; emission:Pchar; source:Pchar);cdecl;external;
{*
 * @brief Add a callback for a (Edje) signal emitted by a layout widget's
 * underlying Edje object.
 *
 * This function connects a callback function to a signal emitted by the
 * underlying Edje object of @c obj. Globs are accepted in either the emission
 * or source strings.
 *
 * @param[in] emission The signal's name string.
 * @param[in] source The signal's source string.
 * @param[in] func The callback function to be executed when the signal is
 * emitted.
 * @param[in] data A pointer to data to pass in to the callback function.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_layout_signal_callback_add(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove a signal-triggered callback from a given layout widget.
 *
 * This function removes the last callback attached to a signal emitted by the
 * underlying Edje object of @c obj, with parameters @c emission, @c source and
 * @c func matching exactly those passed to a previous call to
 * @ref elm_layout_signal_callback_add. The data pointer that was passed to
 * this call will be returned.
 *
 * @param[in] emission The signal's name string.
 * @param[in] source The signal's source string.
 * @param[in] func The callback function being executed when the signal was
 * emitted.
 *
 * @return The data pointer of the signal callback (passed on
 * @ref elm_layout_signal_callback_add) or @c null on errors.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_signal_callback_del(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb):pointer;cdecl;external;
{*
 * @brief Freezes the Elementary layout object.
 *
 * This function puts all changes on hold. Successive freezes will nest,
 * requiring an equal number of thaws.
 *
 * See also @ref elm_layout_thaw.
 *
 * @return The frozen state or 0 on error.
 *
 * @ingroup Elm_Layout
  }
function elm_layout_freeze(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Thaws the Elementary object.
 *
 * This function thaws the given Edje object and the Elementary sizing calc.
 *
 * @note If successive freezings were done, an equal number of thaws will be
 * required.
 *
 * See also @ref elm_layout_freeze.
 *
 * @return The frozen state or 0 if the object is not frozen or on error.
 *
 * @ingroup Elm_Layout
  }
function elm_layout_thaw(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Set the text of the given part.
 *
 * @param[in] part The TEXT part where to set the text.
 * @param[in] text The text to set.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_text_set(obj:PEvas_Object; part:Pchar; text:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the text set in the given part.
 *
 * @param[in] part The TEXT part where to set the text.
 *
 * @return The text to set.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_text_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Set accessibility to all texblock(text) parts in the layout object.
 *
 * @param[in] can_access Makes all textblock(text) parts in the layout @c obj
 * possible to have accessibility. @c true means textblock(text) parts can be
 * accessible.
 *
 * @return @c true on success or @c false on failure. If @c obj is not a proper
 * layout object, @c false is returned.
 *
 * @since 1.7
 *
 * @ingroup Elm_Layout
  }
function elm_layout_edje_object_can_access_set(obj:PEvas_Object; can_access:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Get accessibility state of texblock(text) parts in the layout object
 *
 * @return Makes all textblock(text) parts in the layout @c obj possible to
 * have accessibility. @c true means textblock(text) parts can be accessible.
 *
 * @since 1.7
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_edje_object_can_access_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the cursor set should be searched on the theme or should use
 * the provided by the engine, only.
 *
 * @note Before you set if should look on theme you should define a cursor with
 * @ref elm_layout_part_cursor_set. By default it will only look for cursors
 * provided by the engine.
 *
 * @param[in] part_name A part from loaded edje group.
 * @param[in] engine_only If cursors should be just provided by the engine
 * ($true) or should also search on widget's theme as well ($false)
 *
 * @return @c true on success or @c false on failure, that may be part not
 * exists or it did not had a cursor set.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_part_cursor_engine_only_set(obj:PEvas_Object; part_name:Pchar; engine_only:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Get a specific cursor engine_only for an edje part.
 *
 * @param[in] part_name A part from loaded edje group.
 *
 * @return Whenever the cursor is just provided by engine or also from theme.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_part_cursor_engine_only_get(obj:PEvas_Object; part_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets a specific cursor for an edje part.
 *
 * @param[in] part_name A part from loaded edje group.
 * @param[in] cursor Cursor name to use, see Elementary_Cursor.h.
 *
 * @return @c true on success or @c false on failure, that may be part not
 * exists or it has "mouse_events: 0".
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_part_cursor_set(obj:PEvas_Object; part_name:Pchar; cursor:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the cursor to be shown when mouse is over an edje part.
 *
 * @param[in] part_name A part from loaded edje group.
 *
 * @return Cursor name
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_part_cursor_get(obj:PEvas_Object; part_name:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets a specific cursor style for an edje part.
 *
 * @param[in] part_name A part from loaded edje group.
 * @param[in] style The theme style to use (default, transparent, ...).
 *
 * @return @c true on success or @c false on failure, that may be part not
 * exists or it did not had a cursor set.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_part_cursor_style_set(obj:PEvas_Object; part_name:Pchar; style:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get a specific cursor style for an edje part.
 *
 * @param[in] part_name A part from loaded edje group.
 *
 * @return The theme style in use, defaults to "default". If the object does
 * not have a cursor set, then @c null is returned.
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_layout_part_cursor_style_get(obj:PEvas_Object; part_name:Pchar):Pchar;cdecl;external;
{*
 * @brief Unsets a cursor previously set with @ref elm_layout_part_cursor_set.
 *
 * @param[in] part_name A part from loaded edje group, that had a cursor set
 * wit @ref elm_layout_part_cursor_set.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Layout
  }
(* Const before type ignored *)
function elm_layout_part_cursor_unset(obj:PEvas_Object; part_name:Pchar):TEina_Bool;cdecl;external;

implementation


end.
