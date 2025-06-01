
unit elm_mirroring;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_mirroring.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_mirroring.h
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
 * @defgroup Elm_Mirroring Mirroring
 * @ingroup Elementary
 *
 * These functions allow you to set ui-mirroring on specific
 * widgets or the whole interface. Widgets can be in one of two
 * modes, automatic and manual.  Automatic means they'll be changed
 * according to the system mirroring mode and manual means only
 * explicit changes will matter. You are not supposed to change
 * mirroring state of a widget set to automatic, will mostly work,
 * but the behavior is not really defined.
 *
 * @
  }
{*
 * Get the widget's mirrored mode.
 *
 * @param obj The widget.
 * @return @c EINA_TRUE if mirrored is set, @c EINA_FALSE otherwise
 *
 * @ingroup Elm_Mirroring
  }
(* Const before type ignored *)

function elm_object_mirrored_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Set the widget's mirrored mode.
 *
 * @param obj The widget.
 * @param mirrored @c EINA_TRUE to set mirrored mode, @c EINA_FALSE to unset it.
 *
 * @ingroup Elm_Mirroring
  }
procedure elm_object_mirrored_set(obj:PEvas_Object; mirrored:TEina_Bool);cdecl;external;
{*
 * Returns the widget's mirrored mode setting.
 *
 * @param obj The widget.
 * @return mirrored mode setting of the object.
 *
 * @ingroup Elm_Mirroring
  }
(* Const before type ignored *)
function elm_object_mirrored_automatic_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Sets the widget's mirrored mode setting.
 * When widget in automatic mode, it follows the system mirrored mode set by
 * elm_mirrored_set().
 * @param obj The widget.
 * @param automatic @c EINA_TRUE for auto mirrored mode. @c EINA_FALSE for
 * manual.
 *
 * @ingroup Elm_Mirroring
  }
procedure elm_object_mirrored_automatic_set(obj:PEvas_Object; automatic:TEina_Bool);cdecl;external;
{*
 * @
  }

implementation


end.
