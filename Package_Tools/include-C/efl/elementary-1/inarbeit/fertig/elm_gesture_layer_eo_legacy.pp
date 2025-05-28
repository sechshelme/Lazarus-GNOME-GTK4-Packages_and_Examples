
unit elm_gesture_layer_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_gesture_layer_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_gesture_layer_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PElm_Gesture_Layer  = ^Elm_Gesture_Layer;
PElm_Gesture_State  = ^Elm_Gesture_State;
PElm_Gesture_Type  = ^Elm_Gesture_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_GESTURE_LAYER_EO_LEGACY_H_}
{$define _ELM_GESTURE_LAYER_EO_LEGACY_H_}
{$ifndef _ELM_GESTURE_LAYER_EO_CLASS_TYPE}
{$define _ELM_GESTURE_LAYER_EO_CLASS_TYPE}
type
  PElm_Gesture_Layer = ^TElm_Gesture_Layer;
  TElm_Gesture_Layer = TEo;
{$endif}
{$ifndef _ELM_GESTURE_LAYER_EO_TYPES}
{$define _ELM_GESTURE_LAYER_EO_TYPES}
{* Enum of supported gesture types.
 *
 * @ingroup Elm_Gesture
  }
{*< First type used for iteration over the enum  }
{*< N fingers single taps  }
{*< N fingers single long-taps  }
{*< N fingers double-single taps  }
{*< N fingers triple-single taps  }
{*< Reports momentum in the direction of move  }
{*< N fingers line gesture  }
{*< N fingers flick gesture  }
{*< Zoom  }
{*< Rotate  }
{*< Sentinel value to indicate last enum field during
                    * iteration  }
type
  PElm_Gesture_Type = ^TElm_Gesture_Type;
  TElm_Gesture_Type =  Longint;
  Const
    ELM_GESTURE_FIRST = 0;
    ELM_GESTURE_N_TAPS = 1;
    ELM_GESTURE_N_LONG_TAPS = 2;
    ELM_GESTURE_N_DOUBLE_TAPS = 3;
    ELM_GESTURE_N_TRIPLE_TAPS = 4;
    ELM_GESTURE_MOMENTUM = 5;
    ELM_GESTURE_N_LINES = 6;
    ELM_GESTURE_N_FLICKS = 7;
    ELM_GESTURE_ZOOM = 8;
    ELM_GESTURE_ROTATE = 9;
    ELM_GESTURE_LAST = 10;
;
{* Enum of gesture states.
 *
 * @ingroup Elm_Gesture
  }
{ +1  }{*< Gesture not started  }
{*< Gesture started  }
{*< Gesture is ongoing  }
{*< Gesture completed  }
{*< Ongoing gesture was aborted  }
type
  PElm_Gesture_State = ^TElm_Gesture_State;
  TElm_Gesture_State =  Longint;
  Const
    ELM_GESTURE_STATE_UNDEFINED = -(1);
    ELM_GESTURE_STATE_START = (-(1))+1;
    ELM_GESTURE_STATE_MOVE = (-(1))+2;
    ELM_GESTURE_STATE_END = (-(1))+3;
    ELM_GESTURE_STATE_ABORT = (-(1))+4;
;
{$endif}
{*
 * @brief Control step value for zoom action.
 *
 * When recognizing the zoom gesture, it should be recognized as zooming larger
 * than step.
 *
 * @param[in] obj The object.
 * @param[in] step The zoom step value.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }

procedure elm_gesture_layer_zoom_step_set(obj:PElm_Gesture_Layer; step:Tdouble);cdecl;external;
{*
 * @brief Control step value for zoom action.
 *
 * @param[in] obj The object.
 *
 * @return The zoom step value.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
(* Const before type ignored *)
function elm_gesture_layer_zoom_step_get(obj:PElm_Gesture_Layer):Tdouble;cdecl;external;
{*
 * @brief This function sets the gesture layer finger-size for taps.
 *
 * If not set, it's taken from elm_config. Set to 0 if you want GLayer to use
 * the system finger size value (default).
 *
 * @param[in] obj The object.
 * @param[in] sz The finger size.
 *
 * @since 1.8
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_tap_finger_size_set(obj:PElm_Gesture_Layer; sz:longint);cdecl;external;
{*
 * @brief This function returns the gesture layer finger-size for taps
 *
 * @param[in] obj The object.
 *
 * @return The finger size.
 *
 * @since 1.8
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
(* Const before type ignored *)
function elm_gesture_layer_tap_finger_size_get(obj:PElm_Gesture_Layer):longint;cdecl;external;
{*
 * @brief This function makes gesture-layer repeat events.
 *
 * Set this if you like to get the raw events only if gestures were not
 * detected.
 *
 * Clear this if you like gesture layer to forward events as testing gestures.
 *
 * @param[in] obj The object.
 * @param[in] hold_events If @c true get events only if gesture was not
 * detected, @c false otherwise
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_hold_events_set(obj:PElm_Gesture_Layer; hold_events:TEina_Bool);cdecl;external;
{*
 * @brief Get the repeat-events setting.
 *
 * @param[in] obj The object.
 *
 * @return If @c true get events only if gesture was not detected, @c false
 * otherwise
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
(* Const before type ignored *)
function elm_gesture_layer_hold_events_get(obj:PElm_Gesture_Layer):TEina_Bool;cdecl;external;
{*
 * @brief This function returns step-value for rotate action.
 *
 * Set to 0 to cancel step setting.
 *
 * When recognizing the rotate gesture, the rotated size must be larger than
 * step.
 *
 * @param[in] obj The object.
 * @param[in] step New rotate step value.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_rotate_step_set(obj:PElm_Gesture_Layer; step:Tdouble);cdecl;external;
{*
 * @brief This function returns step-value for rotate action.
 *
 * @param[in] obj The object.
 *
 * @return New rotate step value.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
(* Const before type ignored *)
function elm_gesture_layer_rotate_step_get(obj:PElm_Gesture_Layer):Tdouble;cdecl;external;
{*
 * @brief Set the gesture state change callback.
 *
 * When all callbacks for the gesture are set to @c null, it means this gesture
 * is disabled.
 *
 * @param[in] obj The object.
 * @param[in] idx The gesture you want to track state of.
 * @param[in] cb_type The event the callback tracks (START, MOVE, END, ABORT).
 * @param[in] cb The callback itself.
 * @param[in] data Custom data to be passed.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_cb_set(obj:PElm_Gesture_Layer; idx:TElm_Gesture_Type; cb_type:TElm_Gesture_State; cb:TElm_Gesture_Event_Cb; data:pointer);cdecl;external;
{*
 * @brief Attach a gesture layer widget to an Evas object (setting the widget's
 * target).
 *
 * A gesture layer's target may be any Evas object. This object will be used to
 * listen to mouse and key events.
 *
 * @param[in] obj The object.
 * @param[in] target The object to attach.
 *
 * @return @c true on success, @c false otherwise.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
function elm_gesture_layer_attach(obj:PElm_Gesture_Layer; target:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Remove a gesture callback.
 *
 * @param[in] obj The object.
 * @param[in] idx The gesture you want to track state of.
 * @param[in] cb_type The event the callback tracks (START, MOVE, END, ABORT).
 * @param[in] cb The callback itself.
 * @param[in] data Custom callback data.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_cb_del(obj:PElm_Gesture_Layer; idx:TElm_Gesture_Type; cb_type:TElm_Gesture_State; cb:TElm_Gesture_Event_Cb; data:pointer);cdecl;external;
{*
 * @brief Add a gesture state change callback.
 *
 * When all callbacks for the gesture are set to @c null, it means this gesture
 * is disabled.
 *
 * If a function was already set for this gesture/type/state, it will be
 * replaced by the new one. For ABI compat, callbacks added by
 * @ref elm_gesture_layer_cb_add will be removed. It is recommended to use only
 * one of these functions for a gesture object.
 *
 * @param[in] obj The object.
 * @param[in] idx The gesture you want to track state of.
 * @param[in] cb_type The event the callback tracks (START, MOVE, END, ABORT).
 * @param[in] cb The callback itself.
 * @param[in] data Custom data to be passed.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_cb_add(obj:PElm_Gesture_Layer; idx:TElm_Gesture_Type; cb_type:TElm_Gesture_State; cb:TElm_Gesture_Event_Cb; data:pointer);cdecl;external;
{$endif}

implementation


end.
