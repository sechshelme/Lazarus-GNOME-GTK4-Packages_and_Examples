
unit elm_need;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_need.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_need.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Request that your elementary application needs Efreet
 *
 * This initializes the Efreet library when called and if support exists
 * it returns @c EINA_TRUE, otherwise returns @c EINA_FALSE. This must be called
 * before any efreet calls.
 *
 * @return @c EINA_TRUE if support exists and initialization succeeded.
 *
 * @ingroup Efreet
  }

function elm_need_efreet:TEina_Bool;cdecl;external;
{*
 * Request that your elementary application needs Elm_Systray
 *
 * This initializes the Elm_Systray when called and, if support exists,
 * returns @c EINA_TRUE, otherwise returns @c EINA_FALSE. This must be called
 * before any elm_systray calls.
 *
 * @return @c EINA_TRUE if support exists and initialization succeeded.
 *
 * @ingroup Elm_Systray
 * @since 1.8
  }
function elm_need_systray:TEina_Bool;cdecl;external;
{*
 * Request that your elementary application needs Elm_Sys_Notify
 *
 * This initializes the Elm_Sys_Notify when called and if support exists
 * it returns @c EINA_TRUE, otherwise returns @c EINA_FALSE. This must be called
 * before any elm_sys_notify calls.
 *
 * @return @c EINA_TRUE if support exists and initialization succeeded.
 *
 * @ingroup Elm_Sys_Notify
 * @since 1.8
  }
function elm_need_sys_notify:TEina_Bool;cdecl;external;
{*
 * Request that your elementary application needs e_dbus
 *
 * This initializes the E_dbus library when called and if support exists
 * it returns @c EINA_TRUE, otherwise returns @c EINA_FALSE. This must be called
 * before any e_dbus calls.
 *
 * @return @c EINA_TRUE if support exists and initialization succeeded.
 *
 * @deprecated use elm_need_eldbus() for Eldbus (v2) support. Old API is
 * deprecated.
 *
 * @ingroup E_dbus
  }
{ EINA_DEPRECATED }function elm_need_e_dbus:TEina_Bool;cdecl;external;
{*
 * Request that your elementary application needs eldbus
 *
 * This initializes the eldbus (a.k.a. v2) library when called and if
 * support exists it returns @c EINA_TRUE, otherwise returns
 * @c EINA_FALSE. This must be called before any eldbus calls.
 *
 * @return @c EINA_TRUE if support exists and initialization succeeded.
 *
 * @since 1.8.0
 *
 * @ingroup eldbus
  }
function elm_need_eldbus:TEina_Bool;cdecl;external;
{*
 * Request that your elementary application needs ethumb
 *
 * This initializes the Ethumb library when called and if support exists
 * it returns @c EINA_TRUE, otherwise returns @c EINA_FALSE.
 * This must be called before any other function that deals with
 * elm_thumb objects or ethumb_client instances.
 *
 * @ingroup Elm_Thumb
  }
function elm_need_ethumb:TEina_Bool;cdecl;external;
{*
 * Request that your elementary application needs web support
 *
 * This initializes the Ewebkit library when called and if support exists
 * it returns @c EINA_TRUE, otherwise returns @c EINA_FALSE.
 * This must be called before any other function that deals with
 * elm_web objects or ewk_view instances.
 *
 * @ingroup Elm_Web
  }
function elm_need_web:TEina_Bool;cdecl;external;

implementation


end.
