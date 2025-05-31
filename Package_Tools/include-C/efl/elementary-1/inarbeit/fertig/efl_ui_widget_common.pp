
unit efl_ui_widget_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_common.h
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
PEfl_Ui_Widget  = ^Efl_Ui_Widget;
PEina_Iterator  = ^Eina_Iterator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_COMMON_H}
{$define EFL_UI_WIDGET_COMMON_H}
{*
 * @brief Get an iterator over all subelements located at obj.
 *
 * This iterator contains also the canvas objects which are part of the widgets,
 * be aware that the construction of this tree is internal and might change heavily
 * between versions.
 *
 * @param obj The widget which is the root of the subtree.
 *
 * @return A iterator that contains subelement widgets and canvas objects of the root widget. Every contained object is a Efl.Gfx.Entity.
  }

function efl_ui_widget_tree_iterator(obj:PEfl_Ui_Widget):PEina_Iterator;cdecl;external;
{*
 * @brief Get an iterator over all subelements located at obj.
 *
 * @param obj The widget which is the root of the subtree.
 *
 * @return A iterator that contains subelement widgets of the root widget. Every contained object is a Efl.Ui.Widget.
  }
function efl_ui_widget_tree_widget_iterator(obj:PEfl_Ui_Widget):PEina_Iterator;cdecl;external;
{*
 * @brief Get an iterator that contains all parents of the passed object.
 *
 * @param obj The object to fetch the parents from.
 *
 * @return A iterator that contains all parents of the object. Every contained object is a Efl.Ui.Widget.
  }
function efl_ui_widget_parent_iterator(obj:PEfl_Ui_Widget):PEina_Iterator;cdecl;external;
{$endif}

implementation


end.
