
unit elm_glview;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_glview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_glview.h
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
 * @defgroup Elm_Glview_Group GLView
 * @ingroup Elementary
 *
 * @image html glview_inheritance_tree.png
 * @image latex glview_inheritance_tree.eps
 *
 * A GLView widget allows for simple GL rendering in elementary environment.
 * GLView hides all the complicated evas_gl details so that the user only
 * has to deal with registering a few callback functions for rendering
 * to a surface using OpenGL APIs.
 *
 * This widget emits the following signals, besides the ones sent from
 * @ref GLView:
 * - @c "focused" - when glview has received focus.
 * - @c "unfocused" - when glview has lost focus.
 * - @c "language,changed" - the program's language changed
 *
 * Below is an illustrative example of how to use GLView and and OpenGL
 * to render in elementary environment.
 * @ref glview_example_01_page
 *
  }
{*
 * @addtogroup Elm_Glview_Group
 * @
  }
{$include "elm_glview_common.h"}
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "elm_glview_legacy.h"}
{$endif}
{*
 * @
  }
(* error 
 */

implementation


end.
