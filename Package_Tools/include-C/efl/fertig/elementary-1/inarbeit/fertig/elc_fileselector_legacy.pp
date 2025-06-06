
unit elc_fileselector_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_fileselector_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_fileselector_legacy.h
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
PEina_List  = ^Eina_List;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "elm_interface_fileselector_eo.legacy.h"}
{*
 * Add a new file selector widget to the given parent Elementary
 * (container) object
 *
 * @param parent The parent object
 * @return a new file selector widget handle or @c NULL, on errors
 *
 * This function inserts a new file selector widget on the canvas.
 *
 * @ingroup Elm_Fileselector
  }

function elm_fileselector_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Enable/disable the file name entry box where the user can type
 * in a name for a file, in a given file selector widget
 *
 * @param obj The file selector object
 * @param is_save @c EINA_TRUE to make the file selector a "saving
 * dialog", @c EINA_FALSE otherwise. Default is @c EINA_TRUE.
 *
 * Having the entry editable is useful on file saving dialogs on
 * applications, where one gives a file name to save contents to,
 * in a given directory in the system. This custom file name will
 * be reported on the @c "done" smart callback.
 *
 * @see elm_fileselector_is_save_get()
 *
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_is_save_set(obj:PEvas_Object; is_save:TEina_Bool);cdecl;external;
{*
 * Get whether the given file selector is in "saving dialog" mode
 *
 * @param obj The file selector object
 * @return @c EINA_TRUE, if the file selector is in "saving dialog"
 * mode, @c EINA_FALSE otherwise (and on errors)
 *
 * @see elm_fileselector_is_save_set() for more details
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_is_save_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Enable/disable folder-only view for a given file selector widget
 *
 * @param obj The file selector object
 * @param only @c EINA_TRUE to make @p obj only display
 * directories, @c EINA_FALSE to make files to be displayed in it
 * too
 *
 * If enabled, the widget's view will only display folder items,
 * naturally.
 *
 * @see elm_fileselector_folder_only_get()
 *
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_folder_only_set(obj:PEvas_Object; only:TEina_Bool);cdecl;external;
{*
 * Get whether folder-only view is set for a given file selector
 * widget
 *
 * @param obj The file selector object
 * @return only @c EINA_TRUE if @p obj is only displaying
 * directories, @c EINA_FALSE if files are being displayed in it
 * too (and on errors)
 *
 * @see elm_fileselector_folder_only_get()
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_folder_only_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Enable/disable a tree view in the given file selector widget,
 * <b>if it's in @c #ELM_FILESELECTOR_LIST mode</b>
 *
 * @param obj The file selector object
 * @param expand @c EINA_TRUE to enable tree view, @c EINA_FALSE to
 * disable
 *
 * In a tree view, arrows are created on the sides of directories,
 * allowing them to expand in place.
 *
 * @note If it's in other mode, the changes made by this function
 * will only be visible when one switches back to "list" mode.
 *
 * @see elm_fileselector_expandable_get()
 *
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_expandable_set(obj:PEvas_Object; expand:TEina_Bool);cdecl;external;
{*
 * Get whether tree view is enabled for the given file selector
 * widget
 *
 * @param obj The file selector object
 * @return @c EINA_TRUE if @p obj is in tree view, @c EINA_FALSE
 * otherwise (and or errors)
 *
 * @see elm_fileselector_expandable_set() for more details
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_expandable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Set, programmatically, the @b directory that a given file
 * selector widget will display contents from
 *
 * @param obj The file selector object
 * @param path The path to display in @p obj
 *
 * This will change the @b directory that @p obj is displaying. It
 * will also clear the text entry area on the @p obj object, which
 * displays select files' names.
 *
 * @see elm_fileselector_path_get()
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
procedure elm_fileselector_path_set(obj:PEvas_Object; path:Pchar);cdecl;external;
{*
 * Get the parent directory's path that a given file selector
 * widget is displaying
 *
 * @param obj The file selector object
 * @return The (full) path of the directory the file selector is
 * displaying, a @b stringshared string
 *
 * @see elm_fileselector_path_set()
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_fileselector_path_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * Set the mode in which a given file selector widget will display
 * (layout) file system entries in its view
 *
 * @param obj The file selector object
 * @param mode The mode of the fileselector, being it one of #ELM_FILESELECTOR_LIST
 * (default) or #ELM_FILESELECTOR_GRID. The first one, naturally, will display
 * the files in a list. The latter will make the widget to display its entries
 * in a grid form.
 *
 * @note By using elm_fileselector_expandable_set(), the user may
 * trigger a tree view for that list.
 *
 * @note If Elementary is built with support of the Ethumb
 * thumbnailing library, the second form of view will display
 * preview thumbnails of files which it supports. You must have
 * elm_need_ethumb() called in your Elementary for thumbnailing to
 * work, though.
 *
 * @see elm_fileselector_expandable_set().
 * @see elm_fileselector_mode_get().
 *
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_mode_set(obj:PEvas_Object; mode:TElm_Fileselector_Mode);cdecl;external;
{*
 * Get the mode in which a given file selector widget is displaying
 * (layouting) file system entries in its view
 *
 * @param obj The fileselector object
 * @return The mode in which the fileselector is at
 *
 * @see elm_fileselector_mode_set() for more details
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_mode_get(obj:PEvas_Object):TElm_Fileselector_Mode;cdecl;external;
{*
 * Enable or disable multi-selection in the file selector widget.
 *
 * @param obj The file selector object
 * @param multi Multi-select enable/disable. Default is disabled.
 *
 * This enables (@c EINA_TRUE) or disables (@c EINA_FALSE) multi-selection in
 * the list/grid of the file selector widget. This allows more than 1 item to
 * be selected. To retrieve the list of selected paths, use
 * elm_fileselector_selected_paths_get().
 *
 * @see elm_fileselector_selected_paths_get()
 * @see elm_fileselector_multi_select_get()
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_multi_select_set(obj:PEvas_Object; multi:TEina_Bool);cdecl;external;
{*
 * Get if multi-selection in the file selector is enabled or disabled.
 *
 * @param obj The file selector object
 * @return Multi-select enabled/disabled
 * (@c EINA_TRUE = enabled/@c EINA_FALSE = disabled). Default is @c EINA_FALSE.
 *
 * @see elm_fileselector_multi_select_set()
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_multi_select_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Set, programmatically, the currently selected file/directory in
 * the given file selector widget
 *
 * @param obj The file selector object
 * @param path The (full) path to a file or directory
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure. The
 * latter case occurs if the directory or file pointed to do not
 * exist.
 *
 * @see elm_fileselector_selected_get()
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_selected_set(obj:PEvas_Object; path:Pchar):TEina_Bool;cdecl;external;
{*
 * Get the currently selected item's (full) path, in the given file
 * selector widget
 *
 * @param obj The file selector object
 * @return The absolute path of the selected item, a @b
 * stringshared string
 *
 * @note Custom editions on @p obj object's text entry, if made,
 * will appear on the return string of this function, naturally.
 *
 * @see elm_fileselector_selected_set() for more details
 *
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_fileselector_selected_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
procedure elm_fileselector_current_name_set(obj:PEvas_Object; name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_fileselector_current_name_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * Get a list of selected paths in the file selector.
 *
 * @param obj The file selector object
 * @return The list of selected paths, or NULL if not in multi-select mode or none are selected.
 *
 * It returns a list of the selected paths. This list pointer is only valid so
 * long as the selection doesn't change (no items are selected or unselected, or
 * unselected implicitly by deletion). The list contains const char *.
 * The order of the items in this list is the order which they were selected,
 * i.e. the first item in this list is the first item that was selected, and so on.
 *
 * @note If not in multi-select mode, consider using function
 * elm_fileselector_selected_get() instead.
 *
 * @see elm_fileselector_multi_select_set()
 * @see elm_fileselector_selected_get()
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_fileselector_selected_paths_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * Append mime types filter into filter list
 *
 * @param obj The file selector object
 * @param mime_types comma(,) separated mime types to be allowed.
 * @param filter_name The name to be displayed, @p mime_types will be displayed if NULL
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * @note a sub type of mime can be asterisk(*)
 * @note mime type filter is only working with efreet now.
 * @note first added filter will be the default filter at the moment.
 *
 * @see elm_need_efreet()
 * @see elm_fileselector_filters_clear()
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_fileselector_mime_types_filter_append(obj:PEvas_Object; mime_types:Pchar; filter_name:Pchar):TEina_Bool;cdecl;external;
{*
 * Append custom filter into filter list
 *
 * @param obj The file selector object
 * @param func The function to call when manipulating files and directories.
 * @param data The data to be passed to this @p func call.
 * @param filter_name The name to be displayed, "custom" will be displayed if NULL
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * @note first added filter will be the default filter at the moment.
 *
 * @since 1.9
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_custom_filter_append(obj:PEvas_Object; func:TElm_Fileselector_Filter_Func; data:pointer; filter_name:Pchar):TEina_Bool;cdecl;external;
{*
 * Clear all filters registered
 *
 * @param obj The file selector object
 *
 * @note If filter list is empty, file selector assume that all
 * files are matched.
 *
 * @see elm_fileselector_mime_type_filter_append()
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_filters_clear(obj:PEvas_Object);cdecl;external;
{*
 * Enable or disable visibility of hidden files/directories
 * in the file selector widget.
 *
 * @param obj The file selector object
 * @param visible Visibility of hidden files/directories. Default is disabled.
 *
 * This enables (@c EINA_TRUE) or disables (@c EINA_FALSE) visibility of hidden
 * files/directories in the list/grid of the file selector widget.
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_hidden_visible_set(obj:PEvas_Object; visible:TEina_Bool);cdecl;external;
{*
 * Get if hidden files/directories in the file selector widget are visible or not.
 *
 * @param obj The file selector object
 * @return Visibility of hidden files/directories
 * (@c EINA_TRUE = enabled/@c EINA_FALSE = disabled). Default is @c EINA_FALSE.
 *
 * @see elm_fileselector_hidden_visible_set()
 *
 * @since 1.8
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_hidden_visible_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Set the size for the thumbnail of the file selector widget's view.
 *
 * @param obj The file selector object
 * @param w The thumbnail's width.
 * @param h The thumbnail's height.
 *
 * @note If w or h is 0, default value will be used.
 *
 * @see elm_fileselector_thumbnail_size_get()
 *
 * @since 1.9
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_thumbnail_size_set(obj:PEvas_Object; w:TEvas_Coord; h:TEvas_Coord);cdecl;external;
{*
 * Get the size for the thumbnail of a given file selector widget
 *
 * @param obj The file selector object.
 * @param w Pointer to a variable where to store the thumbnail's width.
 * @param h Pointer to a variable where to store the thumbnail's height.
 *
 * @note Use @c NULL pointers on the size values you're not
 * interested in: they'll be ignored by the function.
 *
 * @see elm_fileselector_thumbnail_size_set()
 *
 * @since 1.9
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
procedure elm_fileselector_thumbnail_size_get(obj:PEvas_Object; w:PEvas_Coord; h:PEvas_Coord);cdecl;external;
{*
 * Get the sort method of the file selector widget.
 *
 * @param obj The file selector object
 * @return The sort method
 *
 * @see elm_fileselector_sort_method_set()
 *
 * @since 1.9
 * @ingroup Elm_Fileselector
  }
(* Const before type ignored *)
function elm_fileselector_sort_method_get(obj:PEvas_Object):TElm_Fileselector_Sort;cdecl;external;
{*
 * Set the sort method of the file selector widget.
 *
 * @param obj The file selector object
 * @param sort The sort method
 *
 * @see elm_fileselector_sort_method_get()
 *
 * @since 1.9
 * @ingroup Elm_Fileselector
  }
procedure elm_fileselector_sort_method_set(obj:PEvas_Object; sort:TElm_Fileselector_Sort);cdecl;external;
{$include "elm_fileselector_eo.legacy.h"}

implementation


end.
