
unit elm_box_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_box_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_box_legacy.h
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
 * Add a new box to the parent
 *
 * By default, the box will be in vertical mode and non-homogeneous.
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Box_Group
  }

function elm_box_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_box_eo.legacy.h"}
{*
 * @brief Set the layout defining function to be used by the box
 *
 * Whenever anything changes that requires the box in @c obj to recalculate the
 * size and position of its elements, the function @c cb will be called to
 * determine what the layout of the children will be.
 *
 * Once a custom function is set, everything about the children layout is
 * defined by it. The flags set by @ref elm_box_horizontal_set and
 * @ref elm_box_homogeneous_set no longer have any meaning, and the values
 * given by @ref elm_box_padding_set and @ref elm_box_align_set are up to this
 * layout function to decide if they are used and how. These last two will be
 * found in the @c priv parameter, of type @c Evas_Object_Box_Data, passed to
 * @c cb. The @c Evas_Object the function receives is not the Elementary
 * widget, but the internal Evas Box it uses, so none of the functions
 * described here can be used on it.
 *
 * Any of the layout functions in @c Evas can be used here, as well as the
 * special @ref elm_box_layout_transition.
 *
 * The final @c data argument received by @c cb is the same @c data passed
 * here, and the @c free_data function will be called to free it whenever the
 * box is destroyed or another layout function is set.
 *
 * Setting @c cb to @c null will revert back to the default layout function.
 *
 * See also @ref elm_box_layout_transition.
 *
 * @param[in] cb The callback function used for layout
 * @param[in] data Data that will be passed to layout function
 * @param[in] free_data Function called to free @c data
 *
 * @ingroup Elm_Box_Group
  }
(* Const before type ignored *)

procedure elm_box_layout_set(obj:PEvas_Object; cb:TEvas_Object_Box_Layout; data:pointer; free_data:TEcore_Cb);cdecl;external;

implementation


end.
