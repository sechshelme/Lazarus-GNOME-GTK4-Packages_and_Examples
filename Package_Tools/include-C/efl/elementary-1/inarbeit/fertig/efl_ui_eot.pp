
unit efl_ui_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_eot.h
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
PEfl_Ui_Activate  = ^Efl_Ui_Activate;
PEfl_Ui_Focus_Autoscroll_Mode  = ^Efl_Ui_Focus_Autoscroll_Mode;
PEfl_Ui_Focus_Direction  = ^Efl_Ui_Focus_Direction;
PEfl_Ui_Focus_Move_Policy  = ^Efl_Ui_Focus_Move_Policy;
PEfl_Ui_Select_Mode  = ^Efl_Ui_Select_Mode;
PEfl_Ui_Softcursor_Mode  = ^Efl_Ui_Softcursor_Mode;
PEfl_Ui_Widget_Orientation_Mode  = ^Efl_Ui_Widget_Orientation_Mode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_EOT_H_}
{$define _EFL_UI_EOT_H_}
{$ifndef _EFL_UI_EOT_TYPES}
{$define _EFL_UI_EOT_TYPES}

function efl_ui_theme_apply_error_default_get:TEina_Error;cdecl;external;
{* Successfully applied the default style. The widget may look different from
 * the rest of the UI if a custom theme is in use, but it should be usable.
 *
 * @ingroup Efl_Ui_Theme_Apply_Error_DEFAULT
  }
{ was #define dname def_expr }
function EFL_UI_THEME_APPLY_ERROR_DEFAULT : longint; { return type might be wrong }

function efl_ui_theme_apply_error_generic_get:TEina_Error;cdecl;external;
{* Failed to apply theme. The widget may become unusable.
 *
 * @ingroup Efl_Ui_Theme_Apply_Error_GENERIC
  }
{ was #define dname def_expr }
function EFL_UI_THEME_APPLY_ERROR_GENERIC : longint; { return type might be wrong }

function efl_ui_theme_apply_error_version_get:TEina_Error;cdecl;external;
{* The theme was applied. The widget may not function or look as expected.
 *
 * @ingroup Efl_Ui_Theme_Apply_Error_VERSION
  }
{ was #define dname def_expr }
function EFL_UI_THEME_APPLY_ERROR_VERSION : longint; { return type might be wrong }

{* Focus directions.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Focus_Direction
  }
{*< previous direction
                                        *
                                        * @since 1.23  }
{*< next direction
                                    *
                                    * @since 1.23  }
{*< up direction
                                  *
                                  * @since 1.23  }
{*< down direction
                                    *
                                    * @since 1.23  }
{*< right direction
                                     *
                                     * @since 1.23  }
{*< left direction
                                    *
                                    * @since 1.23  }
{*< last direction
                                   *
                                   * @since 1.23  }
type
  PEfl_Ui_Focus_Direction = ^TEfl_Ui_Focus_Direction;
  TEfl_Ui_Focus_Direction =  Longint;
  Const
    EFL_UI_FOCUS_DIRECTION_PREVIOUS = 0;
    EFL_UI_FOCUS_DIRECTION_NEXT = 1;
    EFL_UI_FOCUS_DIRECTION_UP = 2;
    EFL_UI_FOCUS_DIRECTION_DOWN = 3;
    EFL_UI_FOCUS_DIRECTION_RIGHT = 4;
    EFL_UI_FOCUS_DIRECTION_LEFT = 5;
    EFL_UI_FOCUS_DIRECTION_LAST = 6;
;
{* Focus Movement Policy.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Move_Policy
  }
{*< Move focus by mouse click or touch.
                                       * Elementary focus is set on mouse click
                                       * and this is checked at mouse up time.
                                       * (default)
                                       *
                                       * @since 1.22  }
{*< Move focus by mouse in. Elementary
                                     * focus is set on mouse move when the
                                     * mouse pointer is moved into an object.
                                     *
                                     * @since 1.22  }
{*< Move focus by key. Elementary focus is
                                     * set on key input like Left, Right, Up,
                                     * Down, Tab, or Shift+Tab.
                                     *
                                     * @since 1.22  }
type
  PEfl_Ui_Focus_Move_Policy = ^TEfl_Ui_Focus_Move_Policy;
  TEfl_Ui_Focus_Move_Policy =  Longint;
  Const
    EFL_UI_FOCUS_MOVE_POLICY_CLICK = 0;
    EFL_UI_FOCUS_MOVE_POLICY_MOVE_IN = 1;
    EFL_UI_FOCUS_MOVE_POLICY_KEY_ONLY = 2;
;
{$ifdef EFL_BETA_API_SUPPORT}
{* Focus Autoscroll Mode
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Autoscroll_Mode
  }
{*< Directly show the focused region
                                          * or item automatically.
                                          *
                                          * @since 1.22  }
{*< Do not show the focused region or item
                                      * automatically.
                                      *
                                      * @since 1.22  }
{*< Bring in the focused region or item
                                         * automatically which might invole the
                                         * scrolling.
                                         *
                                         * @since 1.22  }
type
  PEfl_Ui_Focus_Autoscroll_Mode = ^TEfl_Ui_Focus_Autoscroll_Mode;
  TEfl_Ui_Focus_Autoscroll_Mode =  Longint;
  Const
    EFL_UI_FOCUS_AUTOSCROLL_MODE_SHOW = 0;
    EFL_UI_FOCUS_AUTOSCROLL_MODE_NONE = 1;
    EFL_UI_FOCUS_AUTOSCROLL_MODE_BRING_IN = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Software cursor mode.
 *
 * @ingroup Efl_Ui_Softcursor_Mode
  }
{*< Auto-detect if a software cursor should
                                    * be used (default).  }
{*< Always use a softcursor.  }
{*< Never use a softcursor.  }
type
  PEfl_Ui_Softcursor_Mode = ^TEfl_Ui_Softcursor_Mode;
  TEfl_Ui_Softcursor_Mode =  Longint;
  Const
    EFL_UI_SOFTCURSOR_MODE_AUTO = 0;
    EFL_UI_SOFTCURSOR_MODE_ON = 1;
    EFL_UI_SOFTCURSOR_MODE_OFF = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility
 *
 * @ingroup Efl_Ui_Activate
  }
{*< Activate default  }
{*< Activate up  }
{*< Activate down  }
{*< Activate right  }
{*< Activate left  }
{*< Activate back  }
type
  PEfl_Ui_Activate = ^TEfl_Ui_Activate;
  TEfl_Ui_Activate =  Longint;
  Const
    EFL_UI_ACTIVATE_DEFAULT = 0;
    EFL_UI_ACTIVATE_UP = 1;
    EFL_UI_ACTIVATE_DOWN = 2;
    EFL_UI_ACTIVATE_RIGHT = 3;
    EFL_UI_ACTIVATE_LEFT = 4;
    EFL_UI_ACTIVATE_BACK = 5;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Widget orientation mode, or how the theme handles screen orientation.
 *
 * @note Support for this feature is highly dependent on the theme in use. At
 * the time of writing, the default theme for EFL does not implement support
 * for orientation modes.
 *
 * @ingroup Efl_Ui_Widget_Orientation_Mode
  }
{*< Default or automatic mode: if
                                               * the widget's theme supports
                                               * orientation, it will be
                                               * handled automatically.  }
{*< No signal is sent to the widget's
                                           * theme. Widget's theme will not
                                           * change according to the window or
                                           * screen orientation.  }
type
  PEfl_Ui_Widget_Orientation_Mode = ^TEfl_Ui_Widget_Orientation_Mode;
  TEfl_Ui_Widget_Orientation_Mode =  Longint;
  Const
    EFL_UI_WIDGET_ORIENTATION_MODE_DEFAULT = 0;
    EFL_UI_WIDGET_ORIENTATION_MODE_DISABLED = 1;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{* Type of multi selectable object.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Select_Mode
  }
{*< Only single child is selected. If a child
                                  * is selected, previous selected child will
                                  * be unselected.
                                  *
                                  * @since 1.24  }
{*< Allow multiple selection of children.
                             *
                             * @since 1.24  }
{*< No child can be selected at all.
                           *
                           * @since 1.24  }
type
  PEfl_Ui_Select_Mode = ^TEfl_Ui_Select_Mode;
  TEfl_Ui_Select_Mode =  Longint;
  Const
    EFL_UI_SELECT_MODE_SINGLE = 0;
    EFL_UI_SELECT_MODE_MULTI = 1;
    EFL_UI_SELECT_MODE_NONE = 2;
;
{$endif}
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_THEME_APPLY_ERROR_DEFAULT : longint; { return type might be wrong }
  begin
    EFL_UI_THEME_APPLY_ERROR_DEFAULT:=efl_ui_theme_apply_error_default_get;
  end;

{ was #define dname def_expr }
function EFL_UI_THEME_APPLY_ERROR_GENERIC : longint; { return type might be wrong }
  begin
    EFL_UI_THEME_APPLY_ERROR_GENERIC:=efl_ui_theme_apply_error_generic_get;
  end;

{ was #define dname def_expr }
function EFL_UI_THEME_APPLY_ERROR_VERSION : longint; { return type might be wrong }
  begin
    EFL_UI_THEME_APPLY_ERROR_VERSION:=efl_ui_theme_apply_error_version_get;
  end;


end.
