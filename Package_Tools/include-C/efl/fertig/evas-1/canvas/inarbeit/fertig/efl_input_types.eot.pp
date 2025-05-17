
unit efl_input_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_types.eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_types.eot.h
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
PEfl_Input_Flags  = ^Efl_Input_Flags;
PEfl_Input_Lock  = ^Efl_Input_Lock;
PEfl_Input_Modifier  = ^Efl_Input_Modifier;
PEfl_Input_Object_Pointer_Mode  = ^Efl_Input_Object_Pointer_Mode;
PEfl_Input_Value  = ^Efl_Input_Value;
PEfl_Pointer_Action  = ^Efl_Pointer_Action;
PEfl_Pointer_Flags  = ^Efl_Pointer_Flags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_TYPES_EOT_H_}
{$define _EFL_INPUT_TYPES_EOT_H_}
{$ifndef _EFL_INPUT_TYPES_EOT_TYPES}
{$define _EFL_INPUT_TYPES_EOT_TYPES}
{* Pointer event type. Represents which kind of event this is.
 *
 * @since 1.24
 *
 * @ingroup Efl_Pointer_Action
  }
{*< Not a valid event, or nothing new happened
                                * (eg. when querying current state of touch
                                * points).
                                *
                                * @since 1.24  }
{*< Mouse or equivalent pointer moved.
                            *
                            * @since 1.24  }
{*< Mouse button or equivalent pointer pressed down.
                            * Always followed by up or cancel.
                            *
                            * @since 1.24  }
{*< Mouse button or equivalent pointer released. See
                          * also cancel.
                          *
                          * @since 1.24  }
{*< Special event happening after a down if the up
                              * counterpart can not happen (eg. another window
                              * forcibly stole the focus).
                              *
                              * @since 1.24  }
{*< Mouse or pointer entered the object.
                          *
                          * @since 1.24  }
{*< Mouse or pointer exited the object.
                           *
                           * @since 1.24  }
{*< Mouse wheel scroll, horizontally or vertically.
                             *
                             * @since 1.24  }
{*< Axis event (pen, stick, ...).
                           *
                           * @since 1.24  }
type
  PEfl_Pointer_Action = ^TEfl_Pointer_Action;
  TEfl_Pointer_Action =  Longint;
  Const
    EFL_POINTER_ACTION_NONE = 0;
    EFL_POINTER_ACTION_MOVE = 1;
    EFL_POINTER_ACTION_DOWN = 2;
    EFL_POINTER_ACTION_UP = 3;
    EFL_POINTER_ACTION_CANCEL = 4;
    EFL_POINTER_ACTION_IN = 5;
    EFL_POINTER_ACTION_OUT = 6;
    EFL_POINTER_ACTION_WHEEL = 7;
    EFL_POINTER_ACTION_AXIS = 8;
;
{* Pointer flags indicating whether a double or triple click is under way.
 *
 * @since 1.22
 *
 * @ingroup Efl_Pointer_Flags
  }
{*< No extra mouse button data
                               *
                               * @since 1.22  }
{ 1 >> 0  }{*< This mouse button press
                                                    * was the 2nd press of a
                                                    * double click
                                                    *
                                                    * @since 1.22  }
{ 1 >> 1  }{*< This mouse button press
                                                   * was the 3rd press of a
                                                   * triple click
                                                   *
                                                   * @since 1.22  }
type
  PEfl_Pointer_Flags = ^TEfl_Pointer_Flags;
  TEfl_Pointer_Flags =  Longint;
  Const
    EFL_POINTER_FLAGS_NONE = 0;
    EFL_POINTER_FLAGS_DOUBLE_CLICK = 1;
    EFL_POINTER_FLAGS_TRIPLE_CLICK = 2;
;
{* Special flags set during an input event propagation.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Flags
  }
{*< No fancy flags set
                             *
                             * @since 1.22  }
{ 1 >> 0  }{*< This event is being delivered
                                               * and has been processed, so it
                                               * should be put "on hold" until
                                               * the flag is unset. The event
                                               * should be used for
                                               * informational purposes and
                                               * maybe some indications
                                               * visually, but not actually
                                               * perform anything.
                                               *
                                               * @since 1.22  }
{ 1 >> 1  }{*< This event flag indicates the
                                              * event occurs while scrolling;
                                              * for example, DOWN event occurs
                                              * during scrolling. The event
                                              * should be used for
                                              * informational purposes and
                                              * maybe some indications
                                              * visually, but not actually
                                              * perform anything.
                                              *
                                              * @since 1.22  }
type
  PEfl_Input_Flags = ^TEfl_Input_Flags;
  TEfl_Input_Flags =  Longint;
  Const
    EFL_INPUT_FLAGS_NONE = 0;
    EFL_INPUT_FLAGS_PROCESSED = 1;
    EFL_INPUT_FLAGS_SCROLLING = 2;
;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief How the mouse pointer should be handled by EFL.
 *
 * In the mode @c autograb, when a mouse button is pressed down over an object
 * and held down, with the mouse pointer being moved outside of it, the pointer
 * still behaves as being bound to that object, albeit out of its drawing
 * region. When the button is released, the event will be fed to the object,
 * that may check if the final position is over it or not and do something
 * about it.
 *
 * In the mode @c nograb, the pointer will always be bound to the object right
 * below it.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Object_Pointer_Mode
  }
{*< Default, X11-like.
                                                *
                                                * @since 1.22  }
{*< Pointer always bound to the object
                                          * right below it.
                                          *
                                          * @since 1.22  }
{*< Useful on object
                                                          * with "repeat
                                                          * events" enabled,
                                                          * where mouse/touch
                                                          * up and down events
                                                          * WON'T be repeated
                                                          * to objects and
                                                          * these objects wont
                                                          * be auto-grabbed.
                                                          *
                                                          * @since 1.22  }
type
  PEfl_Input_Object_Pointer_Mode = ^TEfl_Input_Object_Pointer_Mode;
  TEfl_Input_Object_Pointer_Mode =  Longint;
  Const
    EFL_INPUT_OBJECT_POINTER_MODE_AUTO_GRAB = 0;
    EFL_INPUT_OBJECT_POINTER_MODE_NO_GRAB = 1;
    EFL_INPUT_OBJECT_POINTER_MODE_NO_GRAB_NO_REPEAT_UPDOWN = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Keys for the generic values of all events.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Value
  }
{*< Not a valid value type.
                             *
                             * @since 1.22  }
{*< Timestamp of this event in seconds.
                              *
                              * @since 1.22  }
{*< ID of the button that triggered this event
                           * (unsigned int). Prefer the method @c button to
                           * read this value. Default: 0.
                           *
                           * @since 1.22  }
{*< 32-bit bit mask (unsigned int). Prefer
                                    * the method @c buttons_pressed to read
                                    * this value. Default: 0.
                                    *
                                    * @since 1.22  }
{*< ID of the finger or tool (eg. pen) that
                             * triggered this event. Prefer the property
                             * @c touch_id to read this value. Default: 0.
                             *
                             * @since 1.22  }
{*< Absolute X position where this event occurred, in
                      * pixels. Relative to the window. Default: last known
                      * position. This value may be smoothed out or even
                      * extrapolated by EFL.
                      *
                      * @since 1.22  }
{*< Absolute Y position where this event occurred, in
                      * pixels. Relative to the window. Default: last known
                      * position. This value may be smoothed out or even
                      * extrapolated by EFL.
                      *
                      * @since 1.22  }
{*< Relative X movement, in pixels. Range: unbounded.
                       * Default: 0.
                       *
                       * @since 1.22  }
{*< Relative Y movement, in pixels. Range: unbounded.
                       * Default: 0.
                       *
                       * @since 1.22  }
{*< Previous X position of the pointer, in
                               * pixels. Default: last known position, may be
                               * equal to x.
                               *
                               * @since 1.22  }
{*< Previous Y position of the pointer, in
                               * pixels. Default: last known position, may be
                               * equal to y.
                               *
                               * @since 1.22  }
{*< Absolute X position where this event occurred.
                          * Default: 0. This value will be set from the
                          * hardware input without any smoothing or
                          * extrapolation. For an axis input event, this is the
                          * raw value set by the driver (undefined range and
                          * unit).
                          *
                          * @since 1.22  }
{*< Absolute X position where this event occurred.
                          * Default: 0. This value will be set from the
                          * hardware input without any smoothing or
                          * extrapolation. For an axis input event, this is the
                          * raw value set by the driver (undefined range and
                          * unit).
                          *
                          * @since 1.22  }
{*< Average radius of the pressed area under a finger
                           * or tool, in pixels. Default is 1.
                           *
                           * @since 1.22  }
{*< Spread over X of the pressed area under a
                             * finger or tool, in pixels. Default is 1.
                             *
                             * @since 1.22  }
{*< Spread over Y of the pressed area under a
                             * finger or tool, in pixels. Default is 1.
                             *
                             * @since 1.22  }
{*< Pressure applied to the button, touch or pen
                             * tip. Range: [0, 1]. Default is 1.
                             *
                             * @since 1.22  }
{*< Relative distance along physical Z axis. Range:
                             * [0, 1]. Default is 0.
                             *
                             * @since 1.22  }
{*< Angle of tool about the Z axis from positive X
                            * axis. Range: [-PI, PI]. Unit: Radians.
                            *
                            * @since 1.22  }
{*< Angle of tool about plane of sensor from positive Z
                         * axis. Range: [0.0, PI]. Unit: Radians.
                         *
                         * @since 1.22  }
{*< Current tilt along the X axis of the tablet's
                           * current logical orientation, in radians off the
                           * tablet's Z axis. Range: [-PI, PI]. Unit: Radians.
                           *
                           * @since 1.22  }
{*< Current tilt along the Y axis of the tablet's
                           * current logical orientation, in radians off the
                           * tablet's Z axis. Range: [-PI, PI]. Unit: Radians.
                           *
                           * @since 1.22  }
{*< Rotation of tool about its major axis from its
                          * "natural" position. Range: [-PI, PI] Unit: Radians.
                          *
                          * @since 1.22  }
{*< Delta movement of the wheel in discrete
                                * steps (int). Default: 0.
                                *
                                * @since 1.22  }
{*< Delta movement of the wheel in radians.
                                * Default: 0.
                                *
                                * @since 1.22  }
{*< Direction of the wheel (horizontal = 1
                                     * or vertical = 0). Default: 0. Prefer the
                                     * property @c wheel_horizontal to read.
                                     *
                                     * @since 1.22  }
{*< Current position of the slider on the tool. Range:
                          * [-1, 1]. Default: 0.
                          *
                          * @since 1.22  }
type
  PEfl_Input_Value = ^TEfl_Input_Value;
  TEfl_Input_Value =  Longint;
  Const
    EFL_INPUT_VALUE_NONE = 0;
    EFL_INPUT_VALUE_TIMESTAMP = 1;
    EFL_INPUT_VALUE_BUTTON = 2;
    EFL_INPUT_VALUE_BUTTONS_PRESSED = 3;
    EFL_INPUT_VALUE_TOUCH_ID = 4;
    EFL_INPUT_VALUE_X = 5;
    EFL_INPUT_VALUE_Y = 6;
    EFL_INPUT_VALUE_DX = 7;
    EFL_INPUT_VALUE_DY = 8;
    EFL_INPUT_VALUE_PREVIOUS_X = 9;
    EFL_INPUT_VALUE_PREVIOUS_Y = 10;
    EFL_INPUT_VALUE_RAW_X = 11;
    EFL_INPUT_VALUE_RAW_Y = 12;
    EFL_INPUT_VALUE_RADIUS = 13;
    EFL_INPUT_VALUE_RADIUS_X = 14;
    EFL_INPUT_VALUE_RADIUS_Y = 15;
    EFL_INPUT_VALUE_PRESSURE = 16;
    EFL_INPUT_VALUE_DISTANCE = 17;
    EFL_INPUT_VALUE_AZIMUTH = 18;
    EFL_INPUT_VALUE_TILT = 19;
    EFL_INPUT_VALUE_TILT_X = 20;
    EFL_INPUT_VALUE_TILT_Y = 21;
    EFL_INPUT_VALUE_TWIST = 22;
    EFL_INPUT_VALUE_WHEEL_DELTA = 23;
    EFL_INPUT_VALUE_WHEEL_ANGLE = 24;
    EFL_INPUT_VALUE_WHEEL_HORIZONTAL = 25;
    EFL_INPUT_VALUE_SLIDER = 26;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Key modifiers such as Control, Alt, etc...
 *
 * This enum may be used as a bitmask with OR operations, depending on the API.
 *
 * The available keys may vary depending on the physical keyboard layout, or
 * language and keyboard settings, or depending on the platform.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Modifier
  }
{*< No key modifier
                                *
                                * @since 1.22  }
{ 1 >> 0  }{*< Alt key modifier
                                            *
                                            * @since 1.22  }
{ 1 >> 1  }{*< Control key modifier ("Ctrl"
                                                * key)
                                                *
                                                * @since 1.22  }
{ 1 >> 2  }{*< Shift key modifier
                                              *
                                              * @since 1.22  }
{ 1 >> 3  }{*< Meta key modifier (often the
                                             * "Windows" key)
                                             *
                                             * @since 1.22  }
{ 1 >> 4  }{*< AltGr key modifier (not
                                               * present on all keyboards)
                                               *
                                               * @since 1.22  }
{ 1 >> 5  }{*< Hyper key modifier (may be
                                               * "Windows" key)
                                               *
                                               * @since 1.22  }
{ 1 >> 6  }{*< Super key modifier (may be
                                              * "Windows" key)
                                              *
                                              * @since 1.22  }
type
  PEfl_Input_Modifier = ^TEfl_Input_Modifier;
  TEfl_Input_Modifier =  Longint;
  Const
    EFL_INPUT_MODIFIER_NONE = 0;
    EFL_INPUT_MODIFIER_ALT = 1;
    EFL_INPUT_MODIFIER_CONTROL = 2;
    EFL_INPUT_MODIFIER_SHIFT = 4;
    EFL_INPUT_MODIFIER_META = 8;
    EFL_INPUT_MODIFIER_ALTGR = 16;
    EFL_INPUT_MODIFIER_HYPER = 32;
    EFL_INPUT_MODIFIER_SUPER = 64;
;
{*
 * @brief Key locks such as Num Lock, Scroll Lock and Caps Lock.
 *
 * This enum may be used as a bitmask with OR operations, depending on the API.
 *
 * The available keys may vary depending on the physical keyboard layout, or
 * language and keyboard settings, or depending on the platform.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Lock
  }
{*< No key modifier
                            *
                            * @since 1.22  }
{ 1 >> 0  }{*< Num Lock for numeric key pad use
                                        *
                                        * @since 1.22  }
{ 1 >> 1  }{*< Caps Lock for writing in all caps
                                         *
                                         * @since 1.22  }
{ 1 >> 2  }{*< Scroll Lock
                                           *
                                           * @since 1.22  }
{ 1 >> 3  }{*< Shift Lock
                                         *
                                         * @since 1.22  }
type
  PEfl_Input_Lock = ^TEfl_Input_Lock;
  TEfl_Input_Lock =  Longint;
  Const
    EFL_INPUT_LOCK_NONE = 0;
    EFL_INPUT_LOCK_NUM = 1;
    EFL_INPUT_LOCK_CAPS = 2;
    EFL_INPUT_LOCK_SCROLL = 4;
    EFL_INPUT_LOCK_SHIFT = 8;
;
{$endif}
{$endif}

implementation


end.
