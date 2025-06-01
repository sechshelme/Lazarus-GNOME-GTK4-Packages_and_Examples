
unit elm_notify_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_notify_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_notify_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Add a new notify to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Notify_Group
  }

function elm_notify_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the notify parent
 *
 * @param obj The notify object
 * @param parent The new parent
 *
 * Once the parent object is set, a previously set one will be disconnected
 * and replaced.
 *
 * @ingroup Elm_Notify_Group
  }
procedure elm_notify_parent_set(obj:PEvas_Object; parent:PEvas_Object);cdecl;external;
{*
 * @brief Get the notify parent
 *
 * @param obj The notify object
 * @return The parent
 *
 * @see elm_notify_parent_set()
 *
 * @ingroup Elm_Notify_Group
  }
(* Const before type ignored *)
function elm_notify_parent_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_notify_eo.legacy.h"}

implementation


end.
