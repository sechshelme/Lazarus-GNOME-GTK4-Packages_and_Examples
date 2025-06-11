
unit efreet_menu;
interface

{
  Automatically converted by H2Pas 1.0.0 from efreet_menu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efreet_menu.h
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
PEfreet_Desktop  = ^Efreet_Desktop;
PEfreet_Menu  = ^Efreet_Menu;
PEfreet_Menu_Entry_Type  = ^Efreet_Menu_Entry_Type;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_MENU_H}
{$define EFREET_MENU_H}
{*
 * @file efreet_menu.h
 * @brief Contains the structures and methods to support the Desktop
 * Menu Specification.
 * @addtogroup Efreet_Menu Efreet_Menu: The FDO Desktop Menu Specification
 * functions and structures
 * @ingroup Efreet
 *
 * @
  }
{*
 * The type of entry
  }
type
  PEfreet_Menu_Entry_Type = ^TEfreet_Menu_Entry_Type;
  TEfreet_Menu_Entry_Type =  Longint;
  Const
    EFREET_MENU_ENTRY_MENU = 0;
    EFREET_MENU_ENTRY_DESKTOP = 1;
    EFREET_MENU_ENTRY_SEPARATOR = 2;
    EFREET_MENU_ENTRY_HEADER = 3;
;
{*
 * Efreet_Menu
  }
type
{*
 * Efreet_Menu
 * Stores information on a entry in the menu
  }
(* Const before type ignored *)
{*< File-id for desktop and relative name for menu  }
(* Const before type ignored *)
{*< Name this entry should show  }
(* Const before type ignored *)
{*< Icon for this entry  }
{*< The desktop we refer too  }
{*< The menu items  }
{*< refcount (keeps menu util ref is at 0) @since 1.11  }
  PEfreet_Menu = ^TEfreet_Menu;
  TEfreet_Menu = record
      _type : TEfreet_Menu_Entry_Type;
      id : Pchar;
      name : Pchar;
      icon : Pchar;
      desktop : PEfreet_Desktop;
      entries : PEina_List;
      references : longint;
    end;

{*
 * A callback used with efreet_menu_async_get() and efreet_menu_async_parse()
 *
 * @since 1.8
  }

  TEfreet_Menu_Cb = procedure (data:pointer; menu:PEfreet_Menu);cdecl;
{*
 * @return Returns no value
 * @brief Initialize legacy kde support. This function blocks while
 * the kde-config script is run.
  }

function efreet_menu_kde_legacy_init:longint;cdecl;external;
{*
 * @param name The internal name of the menu
 * @return Returns the Efreet_Menu on success or
 * NULL on failure
 * @brief Creates a new menu
  }
(* Const before type ignored *)
function efreet_menu_new(name:Pchar):PEfreet_Menu;cdecl;external;
{*
 * @brief Override which file is used for menu creation
 * @param file The file to use for menu creation
 *
 * This file is only used if it exists, else the standard files will be used
 * for the menu.
  }
(* Const before type ignored *)
procedure efreet_menu_file_set(file:Pchar);cdecl;external;
{*
 * Creates the Efreet_Menu representation of the default menu or
 * NULL if none found and returns it in the callback.
 * @param func function to call when menu is created
 * @param data user data to return in callback
 *
 * @deprecated
  }
{EFREET_DEPRECATED_API }(* Const before type ignored *)
procedure efreet_menu_async_get(func:TEfreet_Menu_Cb; data:pointer);cdecl;external;
{*
 * @return Returns the Efreet_Menu representation of the default menu or
 * NULL if none found
 * @brief Creates the default menu representation
  }
function efreet_menu_get:PEfreet_Menu;cdecl;external;
{*
 * Parses the given .menu file and creates the menu representation, and
 * returns it in the callback
 * @param path The path of the menu to load
 * @param func function to call when menu is created
 * @param data user data to return in callback
 *
 * @deprecated
  }
{EFREET_DEPRECATED_API }(* Const before type ignored *)
(* Const before type ignored *)
procedure efreet_menu_async_parse(path:Pchar; func:TEfreet_Menu_Cb; data:pointer);cdecl;external;
{*
 * @param path The path of the menu to load
 * @return Returns the Efreet_Menu representation on success or NULL on
 * failure
 * @brief Parses the given .menu file and creates the menu representation
  }
(* Const before type ignored *)
function efreet_menu_parse(path:Pchar):PEfreet_Menu;cdecl;external;
{*
 * @param menu The menu to work with
 * @param path The path where the menu should be saved
 * @return Returns 1 on success, 0 on failure
 * @brief Saves the menu to file
  }
(* Const before type ignored *)
function efreet_menu_save(menu:PEfreet_Menu; path:Pchar):longint;cdecl;external;
{*
 * @param menu The Efreet_Menu to free
 * @return Returns no value
 * @brief Frees the given structure (if refcount at 1 at the time of this call)
  }
procedure efreet_menu_free(menu:PEfreet_Menu);cdecl;external;
{*
 * @param menu The Efreet_Menu to reference
 * @return Returns no value
 * @brief Incriments refcount for the menu
 * @since 1.11
  }
procedure efreet_menu_ref(menu:PEfreet_Menu);cdecl;external;
{*
 * @param menu The Efreet_Menu to unreference
 * @return Returns no value
 * @brief Decrements refcount for the menu, and on 0 frees
 * @since 1.11
  }
procedure efreet_menu_unref(menu:PEfreet_Menu);cdecl;external;
{*
 * @param menu The menu to work with
 * @param desktop The desktop to insert
 * @param pos The position to place the new desktop
 * @return Returns 1 on success, 0 on failure
 * @brief Insert a desktop element in a menu structure. Only accepts desktop files
 * in default directories.
  }
function efreet_menu_desktop_insert(menu:PEfreet_Menu; desktop:PEfreet_Desktop; pos:longint):longint;cdecl;external;
{*
 * @param menu The menu to work with
 * @param desktop The desktop to remove
 * @return Returns 1 on success, 0 on failure
 * @brief Remove a desktop element in a menu structure. Only accepts desktop files
 * in default directories.
  }
function efreet_menu_desktop_remove(menu:PEfreet_Menu; desktop:PEfreet_Desktop):longint;cdecl;external;
{*
 * @param menu The menu to work with
 * @param menu The menu to work with
 * @param indent The indent level to print the menu at
 * @return Returns no value
 * @brief Dumps the contents of the menu to the command line
  }
(* Const before type ignored *)
procedure efreet_menu_dump(menu:PEfreet_Menu; indent:Pchar);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
