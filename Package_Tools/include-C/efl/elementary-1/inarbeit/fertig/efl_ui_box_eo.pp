
unit efl_ui_box_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_box_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_box_eo.h
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
PEfl_Ui_Box  = ^Efl_Ui_Box;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_BOX_EO_H_}
{$define _EFL_UI_BOX_EO_H_}
{$ifndef _EFL_UI_BOX_EO_CLASS_TYPE}
{$define _EFL_UI_BOX_EO_CLASS_TYPE}
type
  PEfl_Ui_Box = ^TEfl_Ui_Box;
  TEfl_Ui_Box = TEo;
{$endif}
{$ifndef _EFL_UI_BOX_EO_TYPES}
{$define _EFL_UI_BOX_EO_TYPES}
{$endif}
{*
 * @brief A container that arranges children widgets in a vertical or
 * horizontal fashion.
 *
 * The Box widget is the most basic (and the most used) of the container
 * widgets. Other widgets are added to the Box through the @ref Efl_Pack_Linear
 * interface, and the layout direction (either vertical or horizontal) is
 * controlled through the @ref efl_ui_layout_orientation_get property.
 *
 * The Box widget itself is invisible, as are most container widgets: Their
 * purpose is to handle the position and size of all their children so you
 * don't have to.
 *
 * All widgets inside a vertical Box container will have the same width as the
 * container, and their heights will be automatically chosen so that they cover
 * the whole surface of the container from top to bottom (Imagine a stack of
 * pizza boxes neatly fitting inside your oven). The
 * @ref efl_ui_box_homogeneous_get property then controls whether all widgets
 * have the same height (homogeneous) or not.
 *
 * A horizontal Box container example would be the button toolbar at the top of
 * most word processing programs.
 *
 * Precise layout can be further customized through the
 * @ref Efl_Gfx_Arrangement interface on the Box itself, or through the
 * @ref Efl_Gfx_Hint interface on each of the children widgets.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Box
  }

{ was #define dname def_expr }
function EFL_UI_BOX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_box_class_get:PEfl_Class;cdecl;external;
{*
 * @brief In homogeneous mode all children of a vertical Box have the same
 * height, equal to the height of the tallest widget. Children of a horizontal
 * Box have the same width, equal to the width of the widest widget. Otherwise,
 * individual widget sizes are not modified.
 *
 * @param[in] obj The object.
 * @param[in] homogeneous @c true if the Box is homogeneous, @c false
 * otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Box
  }
procedure efl_ui_box_homogeneous_set(obj:PEo; homogeneous:TEina_Bool);cdecl;external;
{*
 * @brief In homogeneous mode all children of a vertical Box have the same
 * height, equal to the height of the tallest widget. Children of a horizontal
 * Box have the same width, equal to the width of the widest widget. Otherwise,
 * individual widget sizes are not modified.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the Box is homogeneous, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Box
  }
(* Const before type ignored *)
function efl_ui_box_homogeneous_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_BOX_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_BOX_CLASS:=efl_ui_box_class_get;
  end;


end.
