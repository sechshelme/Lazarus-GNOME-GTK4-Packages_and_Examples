
unit efl_ui_layout_orientable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_orientable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_orientable_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Layout_Orientable  = ^Efl_Ui_Layout_Orientable;
PEfl_Ui_Layout_Orientation  = ^Efl_Ui_Layout_Orientation;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_ORIENTABLE_EO_H_}
{$define _EFL_UI_LAYOUT_ORIENTABLE_EO_H_}
{$ifndef _EFL_UI_LAYOUT_ORIENTABLE_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_ORIENTABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout_Orientable = ^TEfl_Ui_Layout_Orientable;
  TEfl_Ui_Layout_Orientable = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_ORIENTABLE_EO_TYPES}
{$define _EFL_UI_LAYOUT_ORIENTABLE_EO_TYPES}
{*
 * @brief Orientation for UI objects and layouts that can have multiple
 * configurations.
 *
 * Select among @c horizontal or @c vertical orientations (or use @c default to
 * let the object decide). Additionally, @c inverted can be added to reverse
 * the direction along the selected axis.
 *
 * Not to be confused with @ref Efl_Gfx_Image_Orientation which is for images
 * and canvases. This enum is used to define how widgets should expand and
 * orient themselves, not to rotate images.
 *
 * See also @ref Efl_Ui_Layout_Orientable.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Orientation
  }
{*< Default direction. Each widget may
                                          * have a different default.
                                          *
                                          * @since 1.23  }
{*< Horizontal direction, along the
                                             * X axis. Usually left-to-right,
                                             * but can be inverted.
                                             *
                                             * @since 1.23  }
{*< Vertical direction, along the Y
                                           * axis. Usually downwards but can be
                                           * inverted.
                                           *
                                           * @since 1.23  }
{*< This bitmask can be used to
                                               * isolate the axis value from
                                               * the rest of bits.
                                               *
                                               * @since 1.23  }
{*< Add this value to make the object
                                          * invert its default direction along
                                          * the selected axis.
                                          *
                                          * @since 1.23  }
type
  PEfl_Ui_Layout_Orientation = ^TEfl_Ui_Layout_Orientation;
  TEfl_Ui_Layout_Orientation =  Longint;
  Const
    EFL_UI_LAYOUT_ORIENTATION_DEFAULT = 0;
    EFL_UI_LAYOUT_ORIENTATION_HORIZONTAL = 1;
    EFL_UI_LAYOUT_ORIENTATION_VERTICAL = 2;
    EFL_UI_LAYOUT_ORIENTATION_AXIS_BITMASK = 3;
    EFL_UI_LAYOUT_ORIENTATION_INVERTED = 4;
;
{$endif}
{*
 * @brief Interface for UI objects which can have more than one orientation.
 *
 * For example, sliders, which can be horizontal or vertical, or container
 * boxes, which can arrange their elements in a horizontal or vertical fashion.
 *
 * Compare with @ref Efl_Gfx_Image_Orientable that works for images and
 * includes rotation.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Orientable
  }

{ was #define dname def_expr }
function EFL_UI_LAYOUT_ORIENTABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_orientable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control the direction of a given widget.
 *
 * Use this function to change how your widget is to be disposed: vertically or
 * horizontally or inverted vertically or inverted horizontally.
 *
 * Mirroring as defined in @ref Efl_Ui_I18n can invert the @c horizontal
 * direction: it is @c ltr by default, but becomes @c rtl if the object is
 * mirrored.
 *
 * @param[in] obj The object.
 * @param[in] dir Direction of the widget.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Orientable
  }
procedure efl_ui_layout_orientation_set(obj:PEo; dir:TEfl_Ui_Layout_Orientation);cdecl;external;
{*
 * @brief Control the direction of a given widget.
 *
 * Use this function to change how your widget is to be disposed: vertically or
 * horizontally or inverted vertically or inverted horizontally.
 *
 * Mirroring as defined in @ref Efl_Ui_I18n can invert the @c horizontal
 * direction: it is @c ltr by default, but becomes @c rtl if the object is
 * mirrored.
 *
 * @param[in] obj The object.
 *
 * @return Direction of the widget.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Orientable
  }
(* Const before type ignored *)
function efl_ui_layout_orientation_get(obj:PEo):TEfl_Ui_Layout_Orientation;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_ORIENTABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_ORIENTABLE_INTERFACE:=efl_ui_layout_orientable_interface_get;
  end;


end.
