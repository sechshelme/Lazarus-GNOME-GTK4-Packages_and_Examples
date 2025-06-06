
unit elm_colorselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_colorselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_colorselector.h
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
 * @defgroup Elm_Colorselector Colorselector
 * @ingroup Elementary
 *
 * @image html colorselector_inheritance_tree.png
 * @image latex colorselector_inheritance_tree.eps
 *
 * @image html img/widget/colorselector/preview-00.png
 * @image latex img/widget/colorselector/preview-00.eps
 *
 * A ColorSelector is a color selection widget. It allows application
 * to set a series of colors.It also allows to load/save colors
 * from/to config with a unique identifier, by default, the colors are
 * loaded/saved from/to config using "default" identifier. The colors
 * can be picked by user from the color set by clicking on individual
 * color item on the palette or by selecting it from selector.
 *
 * This widget inherits from the @ref Elm_Layout one, so that all the
 * functions acting on it also work for check objects.
 *
 * This widget emits the following signals, besides the ones sent from
 * @ref Elm_Layout :
 * - @c "changed" - When the color value changes on selector
 *   event_info is NULL.
 * - @c "color,item,selected" - When user clicks on color item. The
 *   event_info parameter of the callback will be the selected color
 *   item.
 * - @c "color,item,longpressed" - When user long presses on color
 *   item. The event info parameter of the callback contains selected
 *   color item.
 * - @c "focused" - When the colorselector has received focus. (since 1.8)
 * - @c "unfocused" - When the colorselector has lost focus. (since 1.8)
 * - @c "language,changed" - the program's language changed (since 1.9)
 *
 * See @ref tutorial_colorselector.
 * @
  }
{$include "elm_colorselector_common.h"}
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "elm_colorselector_legacy.h"}
{$endif}
{*
 * @
  }
(* error 
 */

implementation


end.
