
unit efl_ui_flip_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_flip_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_flip_eo_legacy.h
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
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FLIP_EO_LEGACY_H_}
{$define _EFL_UI_FLIP_EO_LEGACY_H_}
{*
 * @brief Set the interactive flip mode.
 *
 * This sets if the flip should be interactive (allow user to click and drag a
 * side of the flip to reveal the back page and cause it to flip). By default a
 * flip is not interactive. You may also need to set which sides of the flip
 * are "active" for flipping and how much space they use (a minimum of a finger
 * size) with @ref Efl.Ui.Flip.interaction_direction_enabled_set and
 * @ref Efl.Ui.Flip.interaction_direction_hitsize_set.
 *
 * The four available mode of interaction are #ELM_FLIP_INTERACTION_NONE,
 * #ELM_FLIP_INTERACTION_ROTATE, #ELM_FLIP_INTERACTION_CUBE and
 *  #ELM_FLIP_INTERACTION_PAGE.
 *
 * @note #ELM_FLIP_INTERACTION_ROTATE won't cause
 * #ELM_FLIP_ROTATE_XZ_CENTER_AXIS or #ELM_FLIP_ROTATE_YZ_CENTER_AXIS to
 * happen, those can only be achieved with @ref elm_flip_go.
 *
 * @param[in] obj The object.
 * @param[in] mode The interactive flip mode to use.
 *
 * @ingroup Elm_Flip_Group
  }

procedure elm_flip_interaction_set(obj:PEo; mode:TElm_Flip_Interaction);cdecl;external;
{*
 * @brief Get the interactive flip mode.
 *
 * @param[in] obj The object.
 *
 * @return The interactive flip mode to use.
 *
 * @ingroup Elm_Flip_Group
  }
(* Const before type ignored *)
function elm_flip_interaction_get(obj:PEo):TElm_Flip_Interaction;cdecl;external;
{*
 * @brief Get flip front visibility state.
 *
 * @param[in] obj The object.
 *
 * @return @c true if front front is showing, @c false if the back is showing.
 *
 * @ingroup Elm_Flip_Group
  }
(* Const before type ignored *)
function elm_flip_front_visible_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Runs the flip animation.
 *
 * Flips the front and back contents using the @c mode animation. This
 * effectively hides the currently visible content and shows the hidden one.
 *
 * There a number of possible animations to use for flipping, namely
 * #ELM_FLIP_ROTATE_X_CENTER_AXIS (rotate the currently visible content around
 * a horizontal axis in the middle of its height, the other content is shown as
 * the other side of the flip), #ELM_FLIP_ROTATE_Y_CENTER_AXIS (rotate the
 * currently visible content around a vertical axis in the middle of its width,
 * the other content is shown as the other side of the flip),
 * #ELM_FLIP_ROTATE_XZ_CENTER_AXIS (rotate the currently visible content around
 * a diagonal axis in the middle of its width, the other content is shown as
 * the other side of the flip), #ELM_FLIP_ROTATE_YZ_CENTER_AXIS (rotate the
 * currently visible content around a diagonal axis in the middle of its
 * height, the other content is shown as the other side of the flip).
 * #ELM_FLIP_CUBE_LEFT (rotate the currently visible content to the left as if
 * the flip was a cube, the other content is shown as the right face of the
 * cube), #ELM_FLIP_CUBE_RIGHT (rotate the currently visible content to the
 * right as if the flip was a cube, the other content is shown as the left face
 * of the cube), #ELM_FLIP_CUBE_UP (rotate the currently visible content up as
 * if the flip was a cube, the other content is shown as the bottom face of the
 * cube), #ELM_FLIP_CUBE_DOWN (rotate the currently visible content down as if
 * the flip was a cube, the other content is shown as the upper face of the
 * cube), #ELM_FLIP_PAGE_LEFT (move the currently visible content to the left
 * as if the flip was a book, the other content is shown as the page below
 * that), #ELM_FLIP_PAGE_RIGHT (move the currently visible content to the right
 * as if the flip was a book, the other content is shown as the page below it),
 * #ELM_FLIP_PAGE_UP (move the currently visible content up as if the flip was
 * a book, the other content is shown as the page below it),
 * #ELM_FLIP_PAGE_DOWN (move the currently visible content down as if the flip
 * was a book, the other content is shown as the page below that) and
 * #ELM_FLIP_CROSS_FADE (fade out the currently visible content, while fading
 * in the invisible content).
 *
 * @param[in] obj The object.
 * @param[in] mode The mode type.
 *
 * @ingroup Elm_Flip_Group
  }
procedure elm_flip_go(obj:PEo; mode:TElm_Flip_Mode);cdecl;external;
{*
 * @brief Runs the flip animation to front or back.
 *
 * Flips the front and back contents using the @c mode animation. This
 * effectively hides the currently visible content and shows he hidden one.
 *
 * There a number of possible animations to use for flipping, namely
 * #ELM_FLIP_ROTATE_X_CENTER_AXIS (rotate the currently visible content around
 * a horizontal axis in the middle of its height, the other content is shown as
 * the other side of the flip), #ELM_FLIP_ROTATE_Y_CENTER_AXIS (rotate the
 * currently visible content around a vertical axis in the middle of its width,
 * the other content is shown as the other side of the flip),
 * #ELM_FLIP_ROTATE_XZ_CENTER_AXIS (rotate the currently visible content around
 * a diagonal axis in the middle of its width, the other content is shown as
 * the other side of the flip), #ELM_FLIP_ROTATE_YZ_CENTER_AXIS (rotate the
 * currently visible content around a diagonal axis in the middle of its
 * height, the other content is shown as the other side of the flip).
 * #ELM_FLIP_CUBE_LEFT (rotate the currently visible content to the left as if
 * the flip was a cube, the other content is show as the right face of the
 * cube), #ELM_FLIP_CUBE_RIGHT (rotate the currently visible content to the
 * right as if the flip was a cube, the other content is show as the left face
 * of the cube), #ELM_FLIP_CUBE_UP (rotate the currently visible content up as
 * if the flip was a cube, the other content is shown as the bottom face of the
 * cube), #ELM_FLIP_CUBE_DOWN (rotate the currently visible content down as if
 * the flip was a cube, the other content is shown as the upper face of the
 * cube), #ELM_FLIP_PAGE_LEFT (move the currently visible content to the left
 * as if the flip was a book, the other content is shown as the page below
 * that), #ELM_FLIP_PAGE_RIGHT (move the currently visible content to the right
 * as if the flip was a book, the other content is shown as the page below it),
 * #ELM_FLIP_PAGE_UP (move the currently visible content up as if the flip was
 * a book, the other content is shown as the page below it) and
 * #ELM_FLIP_PAGE_DOWN (move the currently visible content down as if the flip
 * was a book, the other content is shown as the page below that).
 *
 * @param[in] obj The object.
 * @param[in] front If @c true, makes front visible, otherwise makes back.
 * @param[in] mode The mode type.
 *
 * @ingroup Elm_Flip_Group
  }
procedure elm_flip_go_to(obj:PEo; front:TEina_Bool; mode:TElm_Flip_Mode);cdecl;external;
{$endif}

implementation


end.
