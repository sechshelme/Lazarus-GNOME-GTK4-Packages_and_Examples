
unit elm_index;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_index.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_index.h
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
 * @defgroup Elm_Index_Group Index
 * @ingroup Elementary
 *
 * @image html index_inheritance_tree.png
 * @image latex index_inheritance_tree.eps
 *
 * An index widget gives you an index for fast access to whichever
 * group of other UI items one might have. It's a list of text
 * items (usually letters, for alphabetically ordered access).
 *
 * Index widgets are by default hidden and just appear when the
 * user clicks over it's reserved area in the canvas. In its
 * default theme, it's an area one @ref Elm_Fingers "finger" wide on
 * the right side of the index widget's container.
 *
 * When items on the index are selected, smart callbacks get
 * called, so that its user can make other container objects to
 * show a given area or child object depending on the index item
 * selected. You'd probably be using an index together with @ref
 * Elm_List "lists", @ref Elm_Genlist "generic lists" or @ref Elm_Gengrid
 * "general grids".
 *
 * This widget inherits from the @ref Elm_Layout one, so that all the
 * functions acting on it also work for index objects.
 *
 * This widget emits the following signals, besides the ones sent from
 * @ref Elm_Layout :
 * - @c "changed" - When the selected index item changes. @c
 *      event_info is the selected item's data pointer.
 * - @c "delay,changed" - When the selected index item changes, but
 *      after a small idling period. @p event_info is the selected
 *      item's data pointer.
 * - @c "selected" - When the user releases a mouse button and
 *      selects an item. @p event_info is the selected item's pointer.
 * - @c "level,up" - when the user moves a finger from the first
 *      level to the second level
 * - @c "level,down" - when the user moves a finger from the second
 *      level to the first level
 * - @c "language,changed" - the program's language changed
 * - @c "focused" - When the index has received focus. (since 1.8)
 * - @c "unfocused" - When the index has lost focus. (since 1.8)
 *
 * The @c "delay,changed" event is so that it'll wait a small time
 * before actually reporting those events and, moreover, just the
 * last event happening on those time frames will actually be
 * reported.
 *
 * Supported elm_object_item common APIs
 * @li elm_object_item_del
 *
 * Here are some examples on its usage:
 * @li @ref index_example_01
 * @li @ref index_example_02
  }
{*
 * @addtogroup Elm_Index_Group
 * @
  }
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include <elm_index_legacy.h>}
{$endif}
{*
 * @
  }
(* error 
 */

implementation


end.
