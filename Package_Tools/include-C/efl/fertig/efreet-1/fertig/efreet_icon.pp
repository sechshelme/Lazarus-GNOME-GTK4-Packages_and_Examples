
unit efreet_icon;
interface

{
  Automatically converted by H2Pas 1.0.0 from efreet_icon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efreet_icon.h
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
PEfreet_Icon  = ^Efreet_Icon;
PEfreet_Icon_Point  = ^Efreet_Icon_Point;
PEfreet_Icon_Size_Type  = ^Efreet_Icon_Size_Type;
PEfreet_Icon_Theme  = ^Efreet_Icon_Theme;
PEfreet_Icon_Theme_Context  = ^Efreet_Icon_Theme_Context;
PEfreet_Icon_Theme_Directory  = ^Efreet_Icon_Theme_Directory;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_ICON_H}
{$define EFREET_ICON_H}
{*
 * @file efreet_icon.h
 * @brief Contains the structures and methods used to support the FDO icon
 * theme specificiation.
 * @addtogroup Efreet_Icon Efreet_Icon: The FDO Icon Theme
 *                  Specification functions and structures
 *
 * @ingroup Efreet
 * @
  }
{*
 * Event id for cache update.
  }
  var
    EFREET_EVENT_ICON_CACHE_UPDATE : longint;cvar;external;
{*
 * The possible contexts for an icon directory
  }
type
  PEfreet_Icon_Theme_Context = ^TEfreet_Icon_Theme_Context;
  TEfreet_Icon_Theme_Context =  Longint;
  Const
    EFREET_ICON_THEME_CONTEXT_NONE = 0;
    EFREET_ICON_THEME_CONTEXT_ACTIONS = 1;
    EFREET_ICON_THEME_CONTEXT_DEVICES = 2;
    EFREET_ICON_THEME_CONTEXT_FILESYSTEMS = 3;
    EFREET_ICON_THEME_CONTEXT_MIMETYPES = 4;
;
{*
 * The possible size types for an icon directory
  }
type
  PEfreet_Icon_Size_Type = ^TEfreet_Icon_Size_Type;
  TEfreet_Icon_Size_Type =  Longint;
  Const
    EFREET_ICON_SIZE_TYPE_NONE = 0;
    EFREET_ICON_SIZE_TYPE_FIXED = 1;
    EFREET_ICON_SIZE_TYPE_SCALABLE = 2;
    EFREET_ICON_SIZE_TYPE_THRESHOLD = 3;
;
{*
 * Efreet_Icon_Theme
  }
type
{*
 * Efreet_Icon_Theme
 * @brief contains all of the known information about a given theme
  }
(* Const before type ignored *)
{*< The internal theme name  }
(* Const before type ignored *)
{*< The user visible name  }
{*< The different names for the theme  }
(* Const before type ignored *)
{*< String describing the theme  }
(* Const before type ignored *)
{*< Icon to use as an example of the theme  }
{ An icon theme can have multiple directories that store it's icons. We
     * need to be able to find a search each one.  }
{*< The paths  }
{*< Icon themes we inherit from  }
{*< List of subdirectories for this theme  }
  PEfreet_Icon_Theme = ^TEfreet_Icon_Theme;
  TEfreet_Icon_Theme = record
      name : record
          internal : Pchar;
          name : Pchar;
        end;
      comment : Pchar;
      example_icon : Pchar;
      paths : PEina_List;
      inherits : PEina_List;
      directories : PEina_List;
    end;

{*
 * Efreet_Icon_Theme_Directory
  }
{*
 * Efreet_Icon_Theme_Directory
 * @brief Contains all the information about a sub-directory of a theme
  }
(* Const before type ignored *)
{*< The directory name  }
{*< The type of icons in the dir  }
{*< The size type for the icons  }
{*< The size for this directory  }
{*< The minimum size for this directory  }
{*< The maximum size for this directory  }
{*< Size difference threshold  }
{*< The size settings for the icon theme  }
  PEfreet_Icon_Theme_Directory = ^TEfreet_Icon_Theme_Directory;
  TEfreet_Icon_Theme_Directory = record
      name : Pchar;
      context : TEfreet_Icon_Theme_Context;
      _type : TEfreet_Icon_Size_Type;
      size : record
          normal : dword;
          min : dword;
          max : dword;
          threshold : dword;
        end;
    end;

{*
 * Efreet_Icon
  }
{*
 * Efreet_Icon
 * @brief Contains all the information about a given icon
  }
(* Const before type ignored *)
{*< Full path to the icon  }
(* Const before type ignored *)
{*< Translated UTF8 string that can
                                    be used for the icon name  }
{*< x0 position  }
{*< y0 position  }
{*< x1 position  }
{*< y1 position  }
{*< Rectangle where text can
                                        be displayed on the icon  }
{*< List of points to be used as anchor
                                        points for emblems/overlays  }
{*< References to this icon  }
{*< Has the embedded
                                                        rectangle set  }
  PEfreet_Icon = ^TEfreet_Icon;
  TEfreet_Icon = record
      path : Pchar;
      name : Pchar;
      embedded_text_rectangle : record
          x0 : longint;
          y0 : longint;
          x1 : longint;
          y1 : longint;
        end;
      attach_points : PEina_List;
      ref_count : dword;
      flag0 : word;
    end;


const
  bm_TEfreet_Icon_has_embedded_text_rectangle = $1;
  bp_TEfreet_Icon_has_embedded_text_rectangle = 0;

function has_embedded_text_rectangle(var a : TEfreet_Icon) : byte;
procedure set_has_embedded_text_rectangle(var a : TEfreet_Icon; __has_embedded_text_rectangle : byte);
{*
 * Efreet_Icon_Point
  }
type
{*
 * Efreet_Icon_Point
 * @brief Stores an x, y point.
  }
{*< x coord  }
{*< y coord  }
  PEfreet_Icon_Point = ^TEfreet_Icon_Point;
  TEfreet_Icon_Point = record
      x : longint;
      y : longint;
    end;

{*
 * @return Returns the user icon directory
 * @brief Returns the user icon directory
  }
(* Const before type ignored *)

function efreet_icon_user_dir_get:Pchar;cdecl;external;
{*
 * @return Returns the deprecated user icon directory
 * @brief Returns the deprecated user icon directory
  }
(* Const before type ignored *)
function efreet_icon_deprecated_user_dir_get:Pchar;cdecl;external;
{*
 * @param ext The extension to add to the list of checked extensions
 * @return Returns no value.
 * @brief Adds the given extension to the list of possible icon extensions
  }
(* Const before type ignored *)
procedure efreet_icon_extension_add(ext:Pchar);cdecl;external;
{*
 * @return Returns a list of strings that are paths to other icon directories
 * @brief Gets the list of all extra directories to look for icons. These
 * directories are used to look for icons after looking in the user icon dir
 * and before looking in standard system directories. The order of search is
 * from first to last directory in this list. the strings in the list should
 * be created with eina_stringshare_add().
  }
function efreet_icon_extra_list_get:^PEina_List;cdecl;external;
{*
 * @return Returns a list of strings that are icon extensions to look for
 * @brief Gets the list of all icon extensions to look for
  }
function efreet_icon_extensions_list_get:PEina_List;cdecl;external;
{*
 * @return Returns a list of Efreet_Icon structs for all the non-hidden icon
 * themes
 * @brief Retrieves all of the non-hidden icon themes available on the system.
 * The returned list must be freed. Do not free the list data.
  }
function efreet_icon_theme_list_get:PEina_List;cdecl;external;
{*
 * @param theme_name The theme to look for
 * @return Returns the icon theme related to the given theme name or NULL if
 * none exists.
 * @brief Tries to get the icon theme structure for the given theme name
  }
(* Const before type ignored *)
function efreet_icon_theme_find(theme_name:Pchar):PEfreet_Icon_Theme;cdecl;external;
{*
 * @param theme_name The icon theme to look for
 * @param icon The icon to look for
 * @param size The icon size to look for
 * @return Returns the Efreet_Icon structure representing this icon or NULL
 * if the icon is not found
 * @brief Retrieves all of the information about the given icon.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_icon_find(theme_name:Pchar; icon:Pchar; size:dword):PEfreet_Icon;cdecl;external;
{*
 * @param theme_name The icon theme to look for
 * @param icons List of icons to look for
 * @param size; The icon size to look for
 * @return Returns the path representing first found icon or
 * NULL if none of the icons are found
 * @brief Retrieves all of the information about the first found icon in
 * the list.
 * @note This function will search the given theme for all icons before falling
 * back. This is useful when searching for mimetype icons.
 *
 * There is no guarantee for how long the pointer to the path will be valid.
 * If the pointer is to be kept, the user must create a copy of the path.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_icon_list_find(theme_name:Pchar; icons:PEina_List; size:dword):Pchar;cdecl;external;
{*
 * @param theme_name The icon theme to look for
 * @param icon The icon to look for
 * @param size; The icon size to look for
 * @return Returns the path to the given icon or NULL if none found
 * @brief Retrives the path to the given icon.
 *
 * There is no guarantee for how long the pointer to the path will be valid.
 * If the pointer is to be kept, the user must create a copy of the path.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_icon_path_find(theme_name:Pchar; icon:Pchar; size:dword):Pchar;cdecl;external;
{*
 * @param icon The Efreet_Icon to cleanup
 * @return Returns no value.
 * @brief Free's the given icon and all its internal data.
  }
procedure efreet_icon_free(icon:PEfreet_Icon);cdecl;external;
{*
 * @
  }
{$endif}

implementation

function has_embedded_text_rectangle(var a : TEfreet_Icon) : byte;
begin
  has_embedded_text_rectangle:=(a.flag0 and bm_TEfreet_Icon_has_embedded_text_rectangle) shr bp_TEfreet_Icon_has_embedded_text_rectangle;
end;

procedure set_has_embedded_text_rectangle(var a : TEfreet_Icon; __has_embedded_text_rectangle : byte);
begin
  a.flag0:=a.flag0 or ((__has_embedded_text_rectangle shl bp_TEfreet_Icon_has_embedded_text_rectangle) and bm_TEfreet_Icon_has_embedded_text_rectangle);
end;


end.
