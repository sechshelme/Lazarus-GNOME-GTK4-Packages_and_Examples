
unit elm_grid;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_grid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_grid.h
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
 * @defgroup Elm_Grid_Group Grid
 * @ingroup Elementary
 *
 * @image html grid_inheritance_tree.png
 * @image latex grid_inheritance_tree.eps
 *
 * The grid is a grid layout widget that lays out a series of children as a
 * fixed "grid" of widgets using a given percentage of the grid width and
 * height each using the child object.
 *
 * The Grid uses a "Virtual resolution" that is stretched to fill the grid
 * widgets size itself. The default is 100 x 100, so that means the
 * position and sizes of children will effectively be percentages (0 to 100)
 * of the width or height of the grid widget
 *
 * @
  }
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include <elm_grid_legacy.h>}
{$endif}
{*
 * @
  }
(* error 
 */

implementation


end.
