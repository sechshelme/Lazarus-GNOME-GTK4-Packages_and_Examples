
unit efreet_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from efreet_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efreet_utils.h
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
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_UTILS_H}
{$define EFREET_UTILS_H}
{*
 * @file efreet_utils.h
 * @brief Contains utility functions to ease usage of Efreet.
 *        FDO desktop entry specificiation.
 * @addtogroup Efreet_Utils Efreet utilities for FDO
 * @ingroup Efreet
 *
 * @
  }
{*
 * Returns the fdo file id for a given path. If the file isn't inside
 * a default fdo path it will return NULL.
 *
 * @param path The path to find the file id for
 *
 * @return File id for path or NULL
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efreet_util_path_to_file_id(path:Pchar):Pchar;cdecl;external;
{*
 * Find all desktops for a given mime type
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param mime the mime type
 * @return a list of desktops
  }
(* Const before type ignored *)
function efreet_util_desktop_mime_list(mime:Pchar):PEina_List;cdecl;external;
{*
 * Find all desktops for a given wm class
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param wmname the wm name
 * @param wmclass the wm class
 * @return a list of desktops
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_util_desktop_wm_class_find(wmname:Pchar; wmclass:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * Find a desktop by file id
 *
 * return value must be freed by efreet_desktop_free
 *
 * @param file_id the file id
 * @return a desktop
  }
(* Const before type ignored *)
function efreet_util_desktop_file_id_find(file_id:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * Find a desktop by exec
 *
 * return value must be freed by efreet_desktop_free
 *
 * @param exec the exec name
 * @return a desktop
  }
(* Const before type ignored *)
function efreet_util_desktop_exec_find(exec:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * Find a desktop by name
 *
 * return value must be freed by efreet_desktop_free
 *
 * @param name the name
 * @return a desktop
  }
(* Const before type ignored *)
function efreet_util_desktop_name_find(name:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * Find a desktop by generic name
 *
 * return value must be freed by efreet_desktop_free
 *
 * @param generic_name the generic name
 * @return a desktop
  }
(* Const before type ignored *)
function efreet_util_desktop_generic_name_find(generic_name:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * Find all desktops where name matches a glob pattern
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param glob the pattern to match
 * @return a list of desktops
  }
(* Const before type ignored *)
function efreet_util_desktop_name_glob_list(glob:Pchar):PEina_List;cdecl;external;
{*
 * Find all desktops where exec matches a glob pattern
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param glob the pattern to match
 * @return a list of desktops
  }
(* Const before type ignored *)
function efreet_util_desktop_exec_glob_list(glob:Pchar):PEina_List;cdecl;external;
{*
 * Find all desktops where generic name matches a glob pattern
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param glob the pattern to match
 * @return a list of desktops
  }
(* Const before type ignored *)
function efreet_util_desktop_generic_name_glob_list(glob:Pchar):PEina_List;cdecl;external;
{*
 * Find all desktops where comment matches a glob pattern
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param glob the pattern to match
 * @return a list of desktops
  }
(* Const before type ignored *)
function efreet_util_desktop_comment_glob_list(glob:Pchar):PEina_List;cdecl;external;
{*
 * Find all desktop categories
 * This list must be freed using EINA_LIST_FREE
 *
 * @return an Eina_List of category names (const char *)
  }
function efreet_util_desktop_categories_list:PEina_List;cdecl;external;
{*
 * Find all desktops in a given category
 *
 * This list must be freed using EINA_LIST_FREE / efreet_desktop_free
 *
 * @param category the category name
 * @return a list of desktops
  }
(* Const before type ignored *)
function efreet_util_desktop_category_list(category:Pchar):PEina_List;cdecl;external;
{*
 * Returns a list of .menu files found in the various config dirs.
 * @return An eina list of menu file paths (const char *). This must be freed with EINA_LIST_FREE.
  }
function efreet_util_menus_find:PEina_List;cdecl;external;
{*
 * Find all known desktop environments
 * This list must be freed using EINA_LIST_FREE
 * @since 1.12
 *
 * @return an Eina_List of desktop environments names (const char *)
  }
function efreet_util_desktop_environments_list:PEina_List;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
