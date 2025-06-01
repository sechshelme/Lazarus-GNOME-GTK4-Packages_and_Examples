
unit elm_cursor;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_cursor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_cursor.h
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
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Cursors Cursors
 * @ingroup Elementary
  }
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{*
 * @brief The cursor to be shown when mouse is over the object
 *
 * This is the cursor that will be displayed when mouse is over the object. The
 * object can have only one cursor set to it so if @ref elm_object_cursor_set
 * is called twice for an object, the previous set will be unset.
 *
 * If using X cursors, a definition of all the valid cursor names is listed on
 * Elementary_Cursors.h. If an invalid name is set the default cursor will be
 * used.
 *
 * Sets or unsets the current cursor.
 *
 * If @c cursor is @c null this function will reset the cursor to the default
 * one.
 *
 * @param[in] obj The object.
 * @param[in] cursor The cursor name, defined either by the display system or
 * the theme.
 *
 * @return @c true if successful.
 *
 * @ingroup Elm_Cursors
  }
(* Const before type ignored *)

function elm_object_cursor_set(obj:PEo; cursor:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief The cursor to be shown when mouse is over the object
 *
 * This is the cursor that will be displayed when mouse is over the object. The
 * object can have only one cursor set to it so if @ref elm_object_cursor_set
 * is called twice for an object, the previous set will be unset.
 *
 * If using X cursors, a definition of all the valid cursor names is listed on
 * Elementary_Cursors.h. If an invalid name is set the default cursor will be
 * used.
 *
 * Returns the current cursor name.
 *
 * @param[in] obj The object.
 *
 * @return The cursor name, defined either by the display system or the theme.
 *
 * @ingroup Elm_Cursors
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_cursor_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief A different style for the cursor.
 *
 * This only makes sense if theme cursors are used. The cursor should be set
 * with @ref elm_object_cursor_set first before setting its style with this
 * property.
 *
 * Sets a style for the current cursor. Call after @ref elm_object_cursor_set.
 *
 * @param[in] obj The object.
 * @param[in] style A specific style to use, eg. default, transparent, ....
 *
 * @return @c true if successful.
 *
 * @ingroup Elm_Cursors
  }
(* Const before type ignored *)
function elm_object_cursor_style_set(obj:PEo; style:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief A different style for the cursor.
 *
 * This only makes sense if theme cursors are used. The cursor should be set
 * with @ref elm_object_cursor_set first before setting its style with this
 * property.
 *
 * Returns the current cursor style name.
 *
 * @param[in] obj The object.
 *
 * @return A specific style to use, eg. default, transparent, ....
 *
 * @ingroup Elm_Cursors
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_cursor_style_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Whether the cursor may be looked in the theme or not.
 *
 * If @c false, the cursor may only come from the render engine, i.e. from the
 * display manager.
 *
 * Enables or disables theme cursors.
 *
 * @param[in] obj The object.
 * @param[in] allow Whether to use theme cursors.
 *
 * @return @c true if successful.
 *
 * @ingroup Elm_Cursors
  }
function elm_object_cursor_theme_search_enabled_set(obj:PEo; allow:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Whether the cursor may be looked in the theme or not.
 *
 * If @c false, the cursor may only come from the render engine, i.e. from the
 * display manager.
 *
 * Returns the current state of theme cursors search.
 *
 * @param[in] obj The object.
 *
 * @return Whether to use theme cursors.
 *
 * @ingroup Elm_Cursors
  }
(* Const before type ignored *)
function elm_object_cursor_theme_search_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * Unset cursor for object
 *
 * Unset cursor for object, and set the cursor to default if the mouse
 * was over this object.
 *
 * @param obj Target object
 * @see elm_object_cursor_set()
 *
 * @ingroup Elm_Cursors
  }
procedure elm_object_cursor_unset(obj:PEvas_Object);cdecl;external;
{$endif}
{*
 * @
  }

implementation


end.
