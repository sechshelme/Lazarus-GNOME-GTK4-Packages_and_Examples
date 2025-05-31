
unit efl_ui_vg_animation_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_vg_animation_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_vg_animation_legacy.h
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
Pchar  = ^char;
PElm_Animation_View  = ^Elm_Animation_View;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "efl_ui_vg_animation_eo.legacy.h"}
{*
 * Add a new animation view widget to the parent's canvas
 *
 * @param parent The parent object
 * @return The new animation view object or @c NULL if it failed to create.
 *
 * @ingroup Elm_Animation_View
 *
 * @since 1.23
  }

function elm_animation_view_add(parent:PEvas_Object):PElm_Animation_View;cdecl;external;
{*
 *
 * Set the source file from where an vector object must fetch the real
 * vector data (it may be one of json, svg, eet files).
 *
 * If the file supports multiple data stored in it (as Eet files do),
 * you can specify the key to be used as the index of the vector in
 * this file.
 *
 * @param[in] file The vector file path.
 * @param[in] key The vector key in @p file (if its an Eet one), or @c
NULL, otherwise.
 *
 * @return @c EINA_TRUE if it's succeed to read file, @c EINA_FALSE otherwise.
 *
 * @ingroup Elm_Animation_View
 *
 * @since 1.23
 }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_animation_view_file_set(obj:PElm_Animation_View; file:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get current animation view state.
 *
 * @return Current animation view state
 *
 * @see Elm_Animation_View_State
 *
 * @ingroup Elm_Animation_View
 *
 * @since 1.23
  }
function elm_animation_view_state_get(obj:PElm_Animation_View):TElm_Animation_View_State;cdecl;external;

implementation


end.
