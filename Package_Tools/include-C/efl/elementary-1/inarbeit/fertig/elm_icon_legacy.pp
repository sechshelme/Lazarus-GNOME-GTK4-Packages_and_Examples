
unit elm_icon_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_icon_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_icon_legacy.h
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
PElm_Icon_Lookup_Order  = ^Elm_Icon_Lookup_Order;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* Lookup order used by elm_icon_standard_set(). Should look for icons in the
 * theme, FDO paths, or both?
 *
 * @ingroup Elm_Icon
 *
 * @deprecated Prefer using elm_config "icon_theme" instead.
  }
{* Icon look up order: freedesktop, theme.  }
{* Icon look up order: theme, freedesktop.  }
{* Icon look up order: freedesktop.  }
{* Icon look up order: theme.  }
type
  PElm_Icon_Lookup_Order = ^TElm_Icon_Lookup_Order;
  TElm_Icon_Lookup_Order =  Longint;
  Const
    ELM_ICON_LOOKUP_FDO_THEME = 0;
    ELM_ICON_LOOKUP_THEME_FDO = 1;
    ELM_ICON_LOOKUP_FDO = 2;
    ELM_ICON_LOOKUP_THEME = 3;
;
{*
 * Add a new icon object to the parent.
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @see elm_image_file_set()
 *
 * @ingroup Elm_Icon
  }

function elm_icon_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the file that will be used, but use a generated thumbnail.
 *
 * This functions like elm_image_file_set() but requires the Ethumb library
 * support to be enabled successfully with @c elm_need_ethumb. When set the
 * file indicated has a thumbnail generated and cached on disk for future use
 * or will directly use an existing cached thumbnail if it is valid.
 *
 * @param[in] file The path to file that will be used as icon image
 * @param[in] group The group that the icon belongs to an edje file
 *
 * @ingroup Elm_Icon
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_icon_thumb_set(obj:PEvas_Object; file:Pchar; group:Pchar);cdecl;external;
{*
 * @brief Sets the icon lookup order used by elm_icon_standard_set().
 *
 * See also @ref elm_icon_order_lookup_get, @ref Elm_Icon_Lookup_Order.
 *
 * @param[in] order The icon lookup order (can be one of
 * ELM_ICON_LOOKUP_FDO_THEME, ELM_ICON_LOOKUP_THEME_FDO, ELM_ICON_LOOKUP_FDO or
 * ELM_ICON_LOOKUP_THEME)
 *
 * @ingroup Elm_Icon
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure elm_icon_order_lookup_set(obj:PEvas_Object; order:TElm_Icon_Lookup_Order);cdecl;external;
{*
 * @brief Get the icon lookup order.
 *
 * See also @ref elm_icon_order_lookup_set, @ref Elm_Icon_Lookup_Order.
 *
 * @return The icon lookup order (can be one of ELM_ICON_LOOKUP_FDO_THEME,
 * ELM_ICON_LOOKUP_THEME_FDO, ELM_ICON_LOOKUP_FDO or ELM_ICON_LOOKUP_THEME)
 *
 * @ingroup Elm_Icon
  }
(* Const before type ignored *)
{xxxxxxxxxx    EINA_DEPRECATED }function elm_icon_order_lookup_get(obj:PEvas_Object):TElm_Icon_Lookup_Order;cdecl;external;
{*
 * @brief Set the icon by icon standards names.
 *
 * For example, freedesktop.org defines standard icon names such as "go-home",
 * "network-wired", etc. There can be different icon sets to match those icon keys.
 * The "name" given as parameter is one of these "keys", and will be used to
 * look in the freedesktop.org paths and elementary theme.
 *
 * If name is not found in any of the expected locations and it is the absolute
 * path of an image file, this image will be used.
 *
 * @note The icon image set by this function can be changed by
 * @ref Efl.File.file.set.
 *
 * @note This function does not accept relative icon path.
 *
 * See also @ref elm_icon_standard_get.
 *
 * @param[in] name The icon name
 *
 * @return true on success, false on error
 *
 * @ingroup Elm_Icon
  }
(* Const before type ignored *)
function elm_icon_standard_set(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the icon name set by icon standard names.
 *
 * If the icon image was set using elm_image_file_set() instead of
 * @ref elm_icon_standard_set, then this function will return null.
 *
 * @return The icon name
 *
 * @ingroup Elm_Icon
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_icon_standard_get(obj:PEvas_Object):Pchar;cdecl;external;
{$include "elm_icon_eo.legacy.h"}

implementation


end.
