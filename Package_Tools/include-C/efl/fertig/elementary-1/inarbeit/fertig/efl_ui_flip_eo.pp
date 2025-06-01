
unit efl_ui_flip_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_flip_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_flip_eo.h
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
PEfl_Ui_Flip  = ^Efl_Ui_Flip;
PEfl_Ui_Flip_Interaction  = ^Efl_Ui_Flip_Interaction;
PEfl_Ui_Flip_Mode  = ^Efl_Ui_Flip_Mode;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FLIP_EO_H_}
{$define _EFL_UI_FLIP_EO_H_}
{$ifndef _EFL_UI_FLIP_EO_CLASS_TYPE}
{$define _EFL_UI_FLIP_EO_CLASS_TYPE}
type
  PEfl_Ui_Flip = ^TEfl_Ui_Flip;
  TEfl_Ui_Flip = TEo;
{$endif}
{$ifndef _EFL_UI_FLIP_EO_TYPES}
{$define _EFL_UI_FLIP_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI flip mode used by @ref efl_ui_flip_go and @ref efl_ui_flip_go_to.
 *
 * @ingroup Efl_Ui_Flip_Mode
  }
{*< Rotate Y center axis flip
                                              * mode: Rotates the currently
                                              * visible content around a
                                              * vertical axis in the middle of
                                              * its width, the other content is
                                              * shown as the other side of the
                                              * flip.  }
{*< Rotate X center axis flip mode:
                                          * Rotates the currently visible
                                          * content around a horizontal axis in
                                          * the middle of its height, the other
                                          * content is shown as the other side
                                          * of the flip.  }
{*< Rotate XZ center axis flip mode:
                                           * Rotates the currently visible
                                           * content around a diagonal axis in
                                           * the middle of its width, the other
                                           * content is shown as the other side
                                           * of the flip.  }
{*< Rotate YZ center axis flip mode:
                                           * Rotates the currently visible
                                           * content around a diagonal axis in
                                           * the middle of its height, the
                                           * other content is shown as the
                                           * other side of the flip.  }
{*< Cube left flip mode: Rotates the currently
                               * visible content to the left as if the flip was
                               * a cube, the other content is shown as the
                               * right face of the cube.  }
{*< Cube right flip mode: Rotates the currently
                                * visible content to the right as if the flip
                                * was a cube, the other content is shown as the
                                * left face of the cube.  }
{*< Cube up flip mode: Rotates the currently
                             * visible content up as if the flip was a cube,
                             * the other content is shown as the bottom face of
                             * the cube.  }
{*< Cube down flip mode: Rotates the currently
                               * visible content down as if the flip was a
                               * cube, the other content is shown as the upper
                               * face of the cube.  }
{*< Page left flip mode: Moves the currently
                               * visible content to the left as if the flip was
                               * a book, the other content is shown as the page
                               * below that.  }
{*< Page right flip mode: Moves the currently
                                * visible content to the right as if the flip
                                * was a book, the other content is shown as the
                                * page below it.  }
{*< Page up flip mode: Moves the currently visible
                             * content up as if the flip was a book, the other
                             * content is shown as the page below it.  }
{*< Page down flip mode: Moves the currently
                               * visible content down as if the flip was a
                               * book, the other content is shown as the page
                               * below that.  }
{*< Cross fade flip mode: Fades out the currently
                               * visible content, while fading in the invisible
                               * content.  }
type
  PEfl_Ui_Flip_Mode = ^TEfl_Ui_Flip_Mode;
  TEfl_Ui_Flip_Mode =  Longint;
  Const
    EFL_UI_FLIP_MODE_ROTATE_Y_CENTER_AXIS = 0;
    EFL_UI_FLIP_MODE_ROTATE_X_CENTER_AXIS = 1;
    EFL_UI_FLIP_MODE_ROTATE_XZ_CENTER_AXIS = 2;
    EFL_UI_FLIP_MODE_ROTATE_YZ_CENTER_AXIS = 3;
    EFL_UI_FLIP_MODE_CUBE_LEFT = 4;
    EFL_UI_FLIP_MODE_CUBE_RIGHT = 5;
    EFL_UI_FLIP_MODE_CUBE_UP = 6;
    EFL_UI_FLIP_MODE_CUBE_DOWN = 7;
    EFL_UI_FLIP_MODE_PAGE_LEFT = 8;
    EFL_UI_FLIP_MODE_PAGE_RIGHT = 9;
    EFL_UI_FLIP_MODE_PAGE_UP = 10;
    EFL_UI_FLIP_MODE_PAGE_DOWN = 11;
    EFL_UI_FLIP_MODE_CROSS_FADE = 12;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI flip interaction mode used by @ref efl_ui_flip_interaction_get.
 *
 * @ingroup Efl_Ui_Flip_Interaction
  }
{*< No interaction.  }
{*< Rotate interaction.  }
{*< Cube interaction.  }
{*< Page interaction.  }
type
  PEfl_Ui_Flip_Interaction = ^TEfl_Ui_Flip_Interaction;
  TEfl_Ui_Flip_Interaction =  Longint;
  Const
    EFL_UI_FLIP_INTERACTION_NONE = 0;
    EFL_UI_FLIP_INTERACTION_ROTATE = 1;
    EFL_UI_FLIP_INTERACTION_CUBE = 2;
    EFL_UI_FLIP_INTERACTION_PAGE = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI flip class
 *
 * @ingroup Efl_Ui_Flip
  }

{ was #define dname def_expr }
function EFL_UI_FLIP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_flip_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Interactive flip mode.
 *
 * This selects if the flip should be interactive (allow user to click and drag
 * a side of the flip to reveal the back page and cause it to flip). By default
 * a flip is not interactive. You may also need to set which sides of the flip
 * are "active" for flipping and how much space they use (a minimum of a finger
 * size) with @ref efl_ui_flip_interaction_direction_enabled_set and
 * @ref efl_ui_flip_interaction_direction_hitsize_set.
 *
 * The four available modes of interaction are
 * @ref EFL_UI_FLIP_INTERACTION_NONE, @ref EFL_UI_FLIP_INTERACTION_ROTATE,
 * @ref EFL_UI_FLIP_INTERACTION_CUBE and @ref EFL_UI_FLIP_INTERACTION_PAGE.
 *
 * @note @ref EFL_UI_FLIP_INTERACTION_ROTATE cannot trigger
 * @ref EFL_UI_FLIP_MODE_ROTATE_XZ_CENTER_AXIS or
 * @ref EFL_UI_FLIP_MODE_ROTATE_YZ_CENTER_AXIS animations. These are only
 * available through the @ref efl_ui_flip_go and @ref efl_ui_flip_go_to
 * methods.
 *
 * @param[in] obj The object.
 * @param[in] mode The interactive flip mode to use.
 *
 * @ingroup Efl_Ui_Flip
  }
procedure efl_ui_flip_interaction_set(obj:PEo; mode:TEfl_Ui_Flip_Interaction);cdecl;external;
{*
 * @brief Interactive flip mode.
 *
 * This selects if the flip should be interactive (allow user to click and drag
 * a side of the flip to reveal the back page and cause it to flip). By default
 * a flip is not interactive. You may also need to set which sides of the flip
 * are "active" for flipping and how much space they use (a minimum of a finger
 * size) with @ref efl_ui_flip_interaction_direction_enabled_set and
 * @ref efl_ui_flip_interaction_direction_hitsize_set.
 *
 * The four available modes of interaction are
 * @ref EFL_UI_FLIP_INTERACTION_NONE, @ref EFL_UI_FLIP_INTERACTION_ROTATE,
 * @ref EFL_UI_FLIP_INTERACTION_CUBE and @ref EFL_UI_FLIP_INTERACTION_PAGE.
 *
 * @note @ref EFL_UI_FLIP_INTERACTION_ROTATE cannot trigger
 * @ref EFL_UI_FLIP_MODE_ROTATE_XZ_CENTER_AXIS or
 * @ref EFL_UI_FLIP_MODE_ROTATE_YZ_CENTER_AXIS animations. These are only
 * available through the @ref efl_ui_flip_go and @ref efl_ui_flip_go_to
 * methods.
 *
 * @param[in] obj The object.
 *
 * @return The interactive flip mode to use.
 *
 * @ingroup Efl_Ui_Flip
  }
(* Const before type ignored *)
function efl_ui_flip_interaction_get(obj:PEo):TEfl_Ui_Flip_Interaction;cdecl;external;
{*
 * @brief Get flip front visibility state.
 *
 * @param[in] obj The object.
 *
 * @return @c true if front front is showing, @c false if the back is showing.
 *
 * @ingroup Efl_Ui_Flip
  }
(* Const before type ignored *)
function efl_ui_flip_front_visible_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Set the amount of the flip that is sensitive to interactive flip.
 *
 * Set the amount of the flip that is sensitive to interactive flip, with 0
 * representing no area in the flip and 1 representing the entire flip. There
 * is however a consideration to be made in that the area will never be smaller
 * than the finger size set (as set in your Elementary configuration), and
 * dragging must always start from the opposite half of the flip (e.g. right
 * half of the flip when dragging to the left).
 *
 * @note The @c dir parameter is not actually related to the direction of the
 * drag, it only refers to the area in the flip where interaction can occur
 * (top, bottom, left, right).
 *
 * Negative values of @c hitsize will disable this hit area.
 *
 * See also @ref efl_ui_flip_interaction_set.
 *
 * @param[in] obj The object.
 * @param[in] dir The hit area to set.
 * @param[in] hitsize The amount of that dimension (0.0 to 1.0) to use.
 *
 * @ingroup Efl_Ui_Flip
  }
procedure efl_ui_flip_interaction_direction_hitsize_set(obj:PEo; dir:TEfl_Ui_Layout_Orientation; hitsize:Tdouble);cdecl;external;
{*
 * @brief Get the amount of the flip that is sensitive to interactive flip.
 *
 * @param[in] obj The object.
 * @param[in] dir The direction to check.
 *
 * @return The size set for that direction.
 *
 * @ingroup Efl_Ui_Flip
  }
function efl_ui_flip_interaction_direction_hitsize_get(obj:PEo; dir:TEfl_Ui_Layout_Orientation):Tdouble;cdecl;external;
{*
 * @brief Set which directions of the flip respond to interactive flip
 *
 * By default all directions are disabled, so you may want to enable the
 * desired directions for flipping if you need interactive flipping. You must
 * call this function once for each direction that's enabled.
 *
 * You can also set the appropriate hit area size by calling
 * @ref efl_ui_flip_interaction_direction_hitsize_set. By default, a minimum
 * hit area will be created on the opposite edge of the flip.
 *
 * @param[in] obj The object.
 * @param[in] dir The direction to change.
 * @param[in] enabled If that direction is enabled or not.
 *
 * @ingroup Efl_Ui_Flip
  }
procedure efl_ui_flip_interaction_direction_enabled_set(obj:PEo; dir:TEfl_Ui_Layout_Orientation; enabled:TEina_Bool);cdecl;external;
{*
 * @brief Get the enabled state of that flip direction.
 *
 * @param[in] obj The object.
 * @param[in] dir The direction to check.
 *
 * @return If that direction is enabled or not.
 *
 * @ingroup Efl_Ui_Flip
  }
function efl_ui_flip_interaction_direction_enabled_get(obj:PEo; dir:TEfl_Ui_Layout_Orientation):TEina_Bool;cdecl;external;
{*
 * @brief Runs the flip animation.
 *
 * Flips the front and back contents using the @c mode animation. This
 * effectively hides the currently visible content and shows the hidden one.
 *
 * Compare with @ref efl_ui_flip_go_to which only switches sides if necessary.
 *
 * @param[in] obj The object.
 * @param[in] mode The mode type.
 *
 * @ingroup Efl_Ui_Flip
  }
procedure efl_ui_flip_go(obj:PEo; mode:TEfl_Ui_Flip_Mode);cdecl;external;
{*
 * @brief Runs the flip animation to front or back as selected with @c front.
 * If the flip is already showing this side, nothing is done (Compare with
 * @ref efl_ui_flip_go which always switches sides).
 *
 * Flips the front and back contents using the @c mode animation. This
 * effectively hides the currently visible content and shows he hidden one.
 *
 * @param[in] obj The object.
 * @param[in] front If @c true, makes front visible, otherwise makes back.
 * @param[in] mode The mode type.
 *
 * @ingroup Efl_Ui_Flip
  }
procedure efl_ui_flip_go_to(obj:PEo; front:TEina_Bool; mode:TEfl_Ui_Flip_Mode);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_FLIP_EVENT_ANIMATE_BEGIN : TEfl_Event_Description;cvar;external;
{* Called when flip animation begins
 *
 * @ingroup Efl_Ui_Flip
  }
(* Const before type ignored *)
    _EFL_UI_FLIP_EVENT_ANIMATE_DONE : TEfl_Event_Description;cvar;external;
{* Called when flip animation is done
 *
 * @ingroup Efl_Ui_Flip
  }

{ was #define dname def_expr }
function EFL_UI_FLIP_EVENT_ANIMATE_BEGIN : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FLIP_EVENT_ANIMATE_DONE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FLIP_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_FLIP_CLASS:=efl_ui_flip_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_FLIP_EVENT_ANIMATE_BEGIN : longint; { return type might be wrong }
  begin
    EFL_UI_FLIP_EVENT_ANIMATE_BEGIN:=@(_EFL_UI_FLIP_EVENT_ANIMATE_BEGIN);
  end;

{ was #define dname def_expr }
function EFL_UI_FLIP_EVENT_ANIMATE_DONE : longint; { return type might be wrong }
  begin
    EFL_UI_FLIP_EVENT_ANIMATE_DONE:=@(_EFL_UI_FLIP_EVENT_ANIMATE_DONE);
  end;


end.
