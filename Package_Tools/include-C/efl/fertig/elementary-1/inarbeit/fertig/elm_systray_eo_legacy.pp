
unit elm_systray_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_systray_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_systray_eo_legacy.h
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
PEfl_Object  = ^Efl_Object;
PElm_Systray  = ^Elm_Systray;
PElm_Systray_Category  = ^Elm_Systray_Category;
PElm_Systray_Status  = ^Elm_Systray_Status;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SYSTRAY_EO_LEGACY_H_}
{$define _ELM_SYSTRAY_EO_LEGACY_H_}
{$ifndef _ELM_SYSTRAY_EO_CLASS_TYPE}
{$define _ELM_SYSTRAY_EO_CLASS_TYPE}
type
  PElm_Systray = ^TElm_Systray;
  TElm_Systray = TEo;
{$endif}
{$ifndef _ELM_SYSTRAY_EO_TYPES}
{$define _ELM_SYSTRAY_EO_TYPES}
{* Category of the Status Notifier Item.
 *
 * @since 1.8
 *
 * @ingroup Elm_Systray
  }
{*< Indicators of application status  }
{*< Communications apps  }
{*< System Service apps  }
{*< Hardware indicators  }
{*< Undefined category  }
type
  PElm_Systray_Category = ^TElm_Systray_Category;
  TElm_Systray_Category =  Longint;
  Const
    ELM_SYSTRAY_CATEGORY_APP_STATUS = 0;
    ELM_SYSTRAY_CATEGORY_COMMUNICATIONS = 1;
    ELM_SYSTRAY_CATEGORY_SYS_SERVICES = 2;
    ELM_SYSTRAY_CATEGORY_HARDWARE = 3;
    ELM_SYSTRAY_CATEGORY_OTHER = 4;
;
{* Application status information.
 *
 * @since 1.8
 *
 * @ingroup Elm_Systray
  }
{*< Passive (normal)  }
{*< Active  }
{*< Needs Attention  }
type
  PElm_Systray_Status = ^TElm_Systray_Status;
  TElm_Systray_Status =  Longint;
  Const
    ELM_SYSTRAY_STATUS_PASSIVE = 0;
    ELM_SYSTRAY_STATUS_ACTIVE = 1;
    ELM_SYSTRAY_STATUS_ATTENTION = 2;
;
{$endif}
{*
 * @brief Set the id of the Status Notifier Item.
 *
 * @param[in] obj The object.
 * @param[in] id Status notifier item ID
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)

procedure elm_systray_id_set(obj:PElm_Systray; id:Pchar);cdecl;external;
{*
 * @brief Get the id of the Status Notifier Item.
 *
 * @param[in] obj The object.
 *
 * @return Status notifier item ID
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_systray_id_get(obj:PElm_Systray):Pchar;cdecl;external;
{*
 * @brief Set the category of the Status Notifier Item.
 *
 * @param[in] obj The object.
 * @param[in] cat Category
 *
 * @ingroup Elm_Systray_Group
  }
procedure elm_systray_category_set(obj:PElm_Systray; cat:TElm_Systray_Category);cdecl;external;
{*
 * @brief Get the category of the Status Notifier Item.
 *
 * @param[in] obj The object.
 *
 * @return Category
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
function elm_systray_category_get(obj:PElm_Systray):TElm_Systray_Category;cdecl;external;
{*
 * @brief Set the path to the theme where the icons can be found. Set this
 * value to "" to use the default path.
 *
 * @param[in] obj The object.
 * @param[in] icon_theme_path Icon theme path
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
procedure elm_systray_icon_theme_path_set(obj:PElm_Systray; icon_theme_path:Pchar);cdecl;external;
{*
 * @brief Get the path to the icon's theme currently in use.
 *
 * @param[in] obj The object.
 *
 * @return Icon theme path
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_systray_icon_theme_path_get(obj:PElm_Systray):Pchar;cdecl;external;
{*
 * @brief Set the object path of the D-Bus Menu that is to be show when the
 * Status Notifier Item is activated by the user.
 *
 * @param[in] obj The object.
 * @param[in] menu Object path for DBus menu
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
procedure elm_systray_menu_set(obj:PElm_Systray; menu:PEfl_Object);cdecl;external;
{*
 * @brief Get the object path of the D-Bus Menu currently in use.
 *
 * @param[in] obj The object.
 *
 * @return Object path for DBus menu
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_systray_menu_get(obj:PElm_Systray):PEfl_Object;cdecl;external;
{*
 * @brief Set the name of the attention icon to be used by the Status Notifier
 * Item.
 *
 * @param[in] obj The object.
 * @param[in] att_icon_name Attention icon name
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
procedure elm_systray_att_icon_name_set(obj:PElm_Systray; att_icon_name:Pchar);cdecl;external;
{*
 * @brief Get the name of the attention icon used by the Status Notifier Item.
 *
 * @param[in] obj The object.
 *
 * @return Attention icon name
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_systray_att_icon_name_get(obj:PElm_Systray):Pchar;cdecl;external;
{*
 * @brief Set the status of the Status Notifier Item.
 *
 * @param[in] obj The object.
 * @param[in] st Status
 *
 * @ingroup Elm_Systray_Group
  }
procedure elm_systray_status_set(obj:PElm_Systray; st:TElm_Systray_Status);cdecl;external;
{*
 * @brief Get the status of the Status Notifier Item.
 *
 * @param[in] obj The object.
 *
 * @return Status
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
function elm_systray_status_get(obj:PElm_Systray):TElm_Systray_Status;cdecl;external;
{*
 * @brief Set the name of the icon to be used by the Status Notifier Item.
 *
 * @param[in] obj The object.
 * @param[in] icon_name Status icon name
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
procedure elm_systray_icon_name_set(obj:PElm_Systray; icon_name:Pchar);cdecl;external;
{*
 * @brief Get the name of the icon used by the Status Notifier Item.
 *
 * @param[in] obj The object.
 *
 * @return Status icon name
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_systray_icon_name_get(obj:PElm_Systray):Pchar;cdecl;external;
{*
 * @brief Set the title of the Status Notifier Item.
 *
 * @param[in] obj The object.
 * @param[in] title Title
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
procedure elm_systray_title_set(obj:PElm_Systray; title:Pchar);cdecl;external;
{*
 * @brief Get the title of the Status Notifier Item.
 *
 * @param[in] obj The object.
 *
 * @return Title
 *
 * @ingroup Elm_Systray_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_systray_title_get(obj:PElm_Systray):Pchar;cdecl;external;
{*
 * @brief Register this Status Notifier Item in the System Tray Watcher. This
 * function should only be called after the event #ELM_EVENT_SYSTRAY_READY is
 * emitted.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Systray_Group
  }
function elm_systray_register(obj:PElm_Systray):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
