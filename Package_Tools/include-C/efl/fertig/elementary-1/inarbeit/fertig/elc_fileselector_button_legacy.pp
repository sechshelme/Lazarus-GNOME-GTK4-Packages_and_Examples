
unit elc_fileselector_button_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_fileselector_button_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_fileselector_button_legacy.h
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
PElm_Fileselector_Button  = ^Elm_Fileselector_Button;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new file selector button widget to the given parent
 * Elementary (container) object
 *
 * @param parent The parent object
 * @return a new file selector button widget handle or @c NULL, on
 * errors
 *
 * @ingroup Elm_File_Selector_Button
  }

function elm_fileselector_button_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_fileselector_button_eo.legacy.h"}
{*
 * @brief Set whether a given file selector button widget's internal file
 * selector will raise an Elementary "inner window", instead of a dedicated
 * Elementary window. By default, it depends on the current profile.
 *
 * See @ref elm_win_inwin_add for more information on inner windows. See also
 * @ref elm_fileselector_button_inwin_mode_get.
 *
 * @param[in] value true to make it use an inner window, false to make it use a
 * dedicated window
 *
 * @ingroup Elm_Fileselector_Button
  }

procedure elm_fileselector_button_inwin_mode_set(obj:PElm_Fileselector_Button; value:TEina_Bool);cdecl;external;
{*
 * @brief Get whether a given file selector button widget's internal file
 * selector will raise an Elementary "inner window", instead of a dedicated
 * Elementary window.
 *
 * See also @ref elm_fileselector_button_inwin_mode_set for more details.
 *
 * @return true to make it use an inner window, false to make it use a
 * dedicated window
 *
 * @ingroup Elm_Fileselector_Button
  }
(* Const before type ignored *)
function elm_fileselector_button_inwin_mode_get(obj:PElm_Fileselector_Button):TEina_Bool;cdecl;external;
{*
 * @brief Set the size of a given file selector button widget's window, holding
 * the file selector itself.
 *
 * @note it will only take any effect if the file selector button widget is not
 * under "inwin mode". The default size for the window (when applicable) is
 * 400x400 pixels.
 *
 * See also @ref elm_fileselector_button_window_size_get.
 *
 * @param[in] width The window's width
 * @param[in] height The window's height
 *
 * @ingroup Elm_Fileselector_Button
  }
procedure elm_fileselector_button_window_size_set(obj:PElm_Fileselector_Button; width:TEvas_Coord; height:TEvas_Coord);cdecl;external;
{*
 * @brief Get the size of a given file selector button widget's window, holding
 * the file selector itself.
 *
 * @note Use null pointers on the size values you're not interested in: they'll
 * be ignored by the function.
 *
 * See also @ref elm_fileselector_button_window_size_set for more details.
 *
 * @param[out] width The window's width
 * @param[out] height The window's height
 *
 * @ingroup Elm_Fileselector_Button
  }
(* Const before type ignored *)
procedure elm_fileselector_button_window_size_get(obj:PElm_Fileselector_Button; width:PEvas_Coord; height:PEvas_Coord);cdecl;external;
{*
 * @brief Set the title for a given file selector button widget's window
 *
 * This will change the popup window's title, when the file selector pops out
 * after a click on the button. Those windows have the default (unlocalized)
 * value of "Select a file" as titles.
 *
 * @note It will only take effect if the file selector button widget is not
 * under "inwin mode".
 *
 * See also @ref elm_fileselector_button_window_title_get.
 *
 * @param[in] title The title string.
 *
 * @ingroup Elm_Fileselector_Button
  }
(* Const before type ignored *)
procedure elm_fileselector_button_window_title_set(obj:PElm_Fileselector_Button; title:Pchar);cdecl;external;
{*
 * @brief Get the title for a given file selector button widget's window
 *
 * See also @ref elm_fileselector_button_window_title_set for more details.
 *
 * @return The title string.
 *
 * @ingroup Elm_Fileselector_Button
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_fileselector_button_window_title_get(obj:PElm_Fileselector_Button):Pchar;cdecl;external;

implementation


end.
