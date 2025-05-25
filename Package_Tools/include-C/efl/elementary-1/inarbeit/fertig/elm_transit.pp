
unit elm_transit;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_transit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_transit.h
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
Pdouble  = ^double;
PEina_List  = ^Eina_List;
PElm_Transit  = ^Elm_Transit;
PElm_Transit_Effect  = ^Elm_Transit_Effect;
PElm_Transit_Effect_Flip_Axis  = ^Elm_Transit_Effect_Flip_Axis;
PElm_Transit_Effect_Wipe_Dir  = ^Elm_Transit_Effect_Wipe_Dir;
PElm_Transit_Effect_Wipe_Type  = ^Elm_Transit_Effect_Wipe_Type;
PElm_Transit_Tween_Mode  = ^Elm_Transit_Tween_Mode;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Transit Transit
 * @ingroup Elementary
 *
 * Transit is designed to apply various animated transition effects to @c
 * Evas_Object, such like translation, rotation, etc. For using these
 * effects, create an @ref Elm_Transit and add the desired transition effects.
 *
 * Once the effects are added into transit, they will be automatically
 * managed (their callback will be called for the set duration and
 * they will be deleted upon completion).
 *
 * Example:
 * @code
 * Elm_Transit *trans = elm_transit_add();
 * elm_transit_object_add(trans, obj);
 * elm_transit_effect_translation_add(trans, 0, 0, 280, 280
 * elm_transit_duration_set(transit, 1);
 * elm_transit_auto_reverse_set(transit, EINA_TRUE);
 * elm_transit_tween_mode_set(transit, ELM_TRANSIT_TWEEN_MODE_DECELERATE);
 * elm_transit_repeat_times_set(transit, 3);
 * @endcode
 *
 * Some transition effects are used to change the properties of objects. They
 * are:
 * @li @ref elm_transit_effect_translation_add
 * @li @ref elm_transit_effect_color_add
 * @li @ref elm_transit_effect_rotation_add
 * @li @ref elm_transit_effect_wipe_add
 * @li @ref elm_transit_effect_zoom_add
 * @li @ref elm_transit_effect_resizing_add
 *
 * Other transition effects are used to make one object disappear and another
 * object appear on its place. These effects are:
 *
 * @li @ref elm_transit_effect_flip_add
 * @li @ref elm_transit_effect_resizable_flip_add
 * @li @ref elm_transit_effect_fade_add
 * @li @ref elm_transit_effect_blend_add
 *
 * It's also possible to make a transition chain with @ref
 * elm_transit_chain_transit_add.
 *
 * @warning We strongly recommend to use elm_transit just when edje can not do
 * the trick. Edje is better at handling transitions than Elm_Transit.
 * Edje has more flexibility and animations can be manipulated inside the theme.
 *
 * List of examples:
 * @li @ref transit_example_01_explained
 * @li @ref transit_example_02_explained
 * @li @ref transit_example_03_c
 * @li @ref transit_example_04_c
 *
 * @
  }
{*
 * @enum Elm_Transit_Tween_Mode
 *
 * The type of acceleration used in the transition.
  }
{*< Constant speed  }
{*< Starts slow, increase speed
                                         over time, then decrease again
                                         and stop slowly, v1 being a power factor  }
{*< Starts fast and decrease
                                         speed over time, v1 being a power factor  }
{*< Starts slow and increase speed
                                         over time, v1 being a power factor  }
{*< Start at gradient v1,
                                             interpolated via power of v2 curve  }
{*< Start at 0.0 then "drop" like a ball
                                     bouncing to the ground at 1.0, and
                                     bounce v2 times, with decay factor of v1  }
{*< Start at 0.0 then "wobble" like a spring
                                     rest position 1.0, and wobble v2 times,
                                     with decay factor of v1  }
{*< @since 1.13
                                          Follow the cubic-bezier curve
                                          calculated with the control points
                                          (x1, y1), (x2, y2)  }
type
  PElm_Transit_Tween_Mode = ^TElm_Transit_Tween_Mode;
  TElm_Transit_Tween_Mode =  Longint;
  Const
    ELM_TRANSIT_TWEEN_MODE_LINEAR = 0;
    ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL = 1;
    ELM_TRANSIT_TWEEN_MODE_DECELERATE = 2;
    ELM_TRANSIT_TWEEN_MODE_ACCELERATE = 3;
    ELM_TRANSIT_TWEEN_MODE_DIVISOR_INTERP = 4;
    ELM_TRANSIT_TWEEN_MODE_BOUNCE = 5;
    ELM_TRANSIT_TWEEN_MODE_SPRING = 6;
    ELM_TRANSIT_TWEEN_MODE_BEZIER_CURVE = 7;
;
{*
 * @enum Elm_Transit_Effect_Flip_Axis
 *
 * The axis along which flip effect should be applied.
  }
{*< Flip on X axis  }
{*< Flip on Y axis  }
type
  PElm_Transit_Effect_Flip_Axis = ^TElm_Transit_Effect_Flip_Axis;
  TElm_Transit_Effect_Flip_Axis =  Longint;
  Const
    ELM_TRANSIT_EFFECT_FLIP_AXIS_X = 0;
    ELM_TRANSIT_EFFECT_FLIP_AXIS_Y = 1;
;
{*
 * @enum Elm_Transit_Effect_Wipe_Dir
 *
 * The direction in which the wipe effect should occur.
  }
{*< Wipe to the left  }
{*< Wipe to the right  }
{*< Wipe up  }
{*< Wipe down  }
type
  PElm_Transit_Effect_Wipe_Dir = ^TElm_Transit_Effect_Wipe_Dir;
  TElm_Transit_Effect_Wipe_Dir =  Longint;
  Const
    ELM_TRANSIT_EFFECT_WIPE_DIR_LEFT = 0;
    ELM_TRANSIT_EFFECT_WIPE_DIR_RIGHT = 1;
    ELM_TRANSIT_EFFECT_WIPE_DIR_UP = 2;
    ELM_TRANSIT_EFFECT_WIPE_DIR_DOWN = 3;
;
{* @enum Elm_Transit_Effect_Wipe_Type
 *
 * Whether the wipe effect should show or hide the object.
  }
{*< Hide the object during the
                                         animation  }
{*< Show the object during the
                                        animation  }
type
  PElm_Transit_Effect_Wipe_Type = ^TElm_Transit_Effect_Wipe_Type;
  TElm_Transit_Effect_Wipe_Type =  Longint;
  Const
    ELM_TRANSIT_EFFECT_WIPE_TYPE_HIDE = 0;
    ELM_TRANSIT_EFFECT_WIPE_TYPE_SHOW = 1;
;
{*
 * @typedef Elm_Transit
 *
 * The Transit created with elm_transit_add(). This type has the information
 * about the objects which the transition will be applied, and the
 * transition effects that will be used. It also contains info about
 * duration, number of repetitions, auto-reverse, etc.
  }
type

  PElm_Transit_Effect = ^TElm_Transit_Effect;
  TElm_Transit_Effect = pointer;
{*
 * @typedef Elm_Transit_Effect_Transition_Cb
 *
 * Transition callback called for this effect on each transition iteration.
  }

  TElm_Transit_Effect_Transition_Cb = procedure (effect:PElm_Transit_Effect; transit:PElm_Transit; progress:Tdouble);cdecl;
{*
 * Elm_Transit_Effect_End_Cb
 *
 * Transition callback called for this effect when the transition is over.
  }

  TElm_Transit_Effect_End_Cb = procedure (effect:PElm_Transit_Effect; transit:PElm_Transit);cdecl;
{*
 * Elm_Transit_Del_Cb
 *
 * A callback called when the transit is deleted.
  }

  TElm_Transit_Del_Cb = procedure (data:pointer; transit:PElm_Transit);cdecl;
{*
 * Create new transit.
 *
 * @note It is not necessary to delete the transit object, it will be deleted at
 * the end of its operation.
 * @note The transit will start playing when the program enters the main loop.
 *
 * @return The transit object.
 *
 * @ingroup Elm_Transit
  }

function elm_transit_add:PElm_Transit;cdecl;external;
{*
 * Stops the animation and delete the @p transit object.
 *
 * Call this function if you want to stop the animation before the
 * transit time. Make sure the @p transit object is still alive with
 * elm_transit_del_cb_set() function.
 * All added effects will be deleted, calling its respective data_free_cb
 * functions. The function set by elm_transit_del_cb_set() will be called.
 *
 * @see elm_transit_del_cb_set()
 *
 * @param transit The transit object to be deleted.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_del(transit:PElm_Transit);cdecl;external;
{*
 * Add a new effect to the transit.
 *
 * @note The cb function and the data are the key to the effect.
 * If you try to add an existing effect, nothing is done.
 * @note After the first addition of an effect to @p transit, if its
 * effect list become empty again, the @p transit will be killed by
 * elm_transit_del(transit) function.
 *
 * Example:
 * @code
 * Elm_Transit *transit = elm_transit_add();
 * elm_transit_effect_add(transit,
 *                        elm_transit_effect_blend_op,
 *                        elm_transit_effect_blend_context_new(),
 *                        elm_transit_effect_blend_context_free);
 * @endcode
 *
 * @param transit The transit object.
 * @param transition_cb The operation function. It is called when the
 * animation begins, it is the function that actually performs the animation.
 * It is called with the @p data, @p transit and the time progression of the
 * animation (a double value between 0.0 and 1.0).
 * @param effect The context data of the effect.
 * @param end_cb The function to free the context data, it will be called
 * at the end of the effect, it must finalize the animation and free the
 * @p data.
 *
 * @ingroup Elm_Transit
 * @warning The transit will free the context data at the and of the
 * transition with the data_free_cb function.
 * Do not share the context data in between different transit objects.
  }
procedure elm_transit_effect_add(transit:PElm_Transit; transition_cb:TElm_Transit_Effect_Transition_Cb; effect:PElm_Transit_Effect; end_cb:TElm_Transit_Effect_End_Cb);cdecl;external;
{*
 * Delete an added effect.
 *
 * This function will remove the effect from the @p transit, calling the
 * data_free_cb to free the @p data.
 *
 * @see elm_transit_effect_add()
 *
 * @note If the effect is not found, nothing is done.
 * @note If the effect list become empty, this function will call
 * elm_transit_del(transit), i.e., it will kill the @p transit.
 *
 * @param transit The transit object.
 * @param transition_cb The operation function.
 * @param effect The context data of the effect.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_effect_del(transit:PElm_Transit; transition_cb:TElm_Transit_Effect_Transition_Cb; effect:PElm_Transit_Effect);cdecl;external;
{*
 * Add new object to apply the effects.
 *
 * @note After the first addition of an object to @p transit, if its
 * object list become empty again, the @p transit will be killed by
 * elm_transit_del(transit) function.
 * @note If the @p obj belongs to another transit, the @p obj will be
 * removed from it and it will only belong to the other @p transit.
 * If the old transit stays without objects, it will die.
 * @note When you add an object into the @p transit, its state from
 * evas_object_pass_events_get(obj) is saved, and it is applied when the
 * transit ends, if you change this state with evas_object_pass_events_set()
 * after add the object, this state will change again when @p transit stops.
 *
 * @param transit The transit object.
 * @param obj Object to be animated.
 *
 * @ingroup Elm_Transit
 * @warning It is not allowed to add a new object after transit begins.
  }
procedure elm_transit_object_add(transit:PElm_Transit; obj:PEvas_Object);cdecl;external;
{*
 * Removes an added object from the transit.
 *
 * @note If the @p obj is not in the @p transit, nothing is done.
 * @note If the list become empty, this function will call
 * elm_transit_del(transit), i.e., it will kill the @p transit.
 *
 * @param transit The transit object.
 * @param obj Object to be removed from @p transit.
 *
 * @ingroup Elm_Transit
 * @warning It is not allowed to remove objects after transit begins.
  }
procedure elm_transit_object_remove(transit:PElm_Transit; obj:PEvas_Object);cdecl;external;
{*
 * Get the objects of the transit.
 *
 * @param transit The transit object.
 * @return a Eina_List with the objects from the transit.
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_transit_objects_get(transit:PElm_Transit):PEina_List;cdecl;external;
{*
 * Enable/disable keeping up the objects states.
 * If it is not kept, the objects states will be reset when transition ends.
 *
 * @note @p transit can not be NULL.
 * @note One state includes geometry, color, map data.
 *
 * @param transit The transit object.
 * @param state_keep retain the state or not.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_objects_final_state_keep_set(transit:PElm_Transit; state_keep:TEina_Bool);cdecl;external;
{*
 * Get a value whether the objects states will be reset or not.
 *
 * @note @p transit can not be NULL
 *
 * @see elm_transit_objects_final_state_keep_set()
 *
 * @param transit The transit object.
 * @return @c EINA_TRUE means the states of the objects will be reset.
 * If @p transit is NULL, @c EINA_FALSE is returned
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_objects_final_state_keep_get(transit:PElm_Transit):TEina_Bool;cdecl;external;
{*
 * Set the event enabled when transit is operating.
 *
 * If @p enabled is @c EINA_TRUE, the objects of the transit will receive
 * events from mouse and keyboard during the animation.
 * @note When you add an object with elm_transit_object_add(), its state from
 * evas_object_freeze_events_get(obj) is saved, and it is applied when the
 * transit ends. If you change this state with evas_object_freeze_events_set()
 * after adding the object, this state will change again when @p transit stops
 * to run.
 *
 * @param transit The transit object.
 * @param enabled Events are received when enabled is @c EINA_TRUE, and
 * ignored otherwise.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_event_enabled_set(transit:PElm_Transit; enabled:TEina_Bool);cdecl;external;
{*
 * Get the value of event enabled status.
 *
 * @see elm_transit_event_enabled_set()
 *
 * @param transit The Transit object
 * @return @c EINA_TRUE, when event is enabled. If @p transit is NULL
 * @c EINA_FALSE is returned
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_event_enabled_get(transit:PElm_Transit):TEina_Bool;cdecl;external;
{*
 * Set the user-callback function when the transit is deleted.
 *
 * @note Using this function twice will overwrite the first function set.
 * @note the @p transit object will be deleted after call @p cb function.
 *
 * @param transit The transit object.
 * @param cb Callback function pointer. This function will be called before
 * the deletion of the transit.
 * @param data Callback function user data. It is the @p op parameter.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_del_cb_set(transit:PElm_Transit; cb:TElm_Transit_Del_Cb; data:pointer);cdecl;external;
{*
 * Set reverse effect automatically.
 *
 * If auto reverse is set, after running the effects with the progress
 * parameter from 0 to 1, it will call the effects again with the progress
 * from 1 to 0. The transit will last for a time equal to (2 * duration * repeat),
 * where the duration was set with the function elm_transit_add and
 * the repeat with the function elm_transit_repeat_times_set().
 *
 * @param transit The transit object.
 * @param reverse @c EINA_TRUE means the auto_reverse is on.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_auto_reverse_set(transit:PElm_Transit; reverse:TEina_Bool);cdecl;external;
{*
 * Get if the auto reverse is on.
 *
 * @see elm_transit_auto_reverse_set()
 *
 * @param transit The transit object.
 * @return @c EINA_TRUE means auto reverse is on. If @p transit is NULL
 * @c EINA_FALSE is returned
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_auto_reverse_get(transit:PElm_Transit):TEina_Bool;cdecl;external;
{*
 * Set the transit repeat count. Effect will be repeated by repeat count.
 *
 * This function sets the number of repetition the transit will run after
 * the first one, i.e., if @p repeat is 1, the transit will run 2 times.
 * If the @p repeat is a negative number, it will repeat infinite times.
 *
 * @note If this function is called during the transit execution, the transit
 * will run @p repeat times, ignoring the times it already performed.
 *
 * @param transit The transit object
 * @param repeat Repeat count
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_repeat_times_set(transit:PElm_Transit; _repeat:longint);cdecl;external;
{*
 * Get the transit repeat count.
 *
 * @see elm_transit_repeat_times_set()
 *
 * @param transit The Transit object.
 * @return The repeat count. If @p transit is NULL
 * 0 is returned
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_repeat_times_get(transit:PElm_Transit):longint;cdecl;external;
{*
 * Get current transit repeated count.
 *
 * @see elm_transit_repeat_times_set()
 *
 * @param transit The Transit object.
 * @return Current repeated count. If @p transit is NULL
 * 0 is returned
 *
 * @warning Return value is only valid when repeat times is set.
 * @since 1.22
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_current_repeat_times_get(transit:PElm_Transit):longint;cdecl;external;
{*
 * Set the transit animation acceleration type.
 *
 * This function sets the tween mode of the transit that can be:
 * ELM_TRANSIT_TWEEN_MODE_LINEAR - The default mode.
 * ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL - Starts in accelerate mode and ends
 * decelerating with factor.
 * ELM_TRANSIT_TWEEN_MODE_DECELERATE - The animation will be slowed over time
 * with factor.
 * ELM_TRANSIT_TWEEN_MODE_ACCELERATE - The animation will accelerate over time
 * with factor.
 * ELM_TRANSIT_TWEEN_MODE_DIVISOR_INTERP - Start at gradient v1, interpolated
 * via power of v2 curve.
 * ELM_TRANSIT_TWEEN_MODE_BOUNCE - Start at 0.0 then "drop" like a ball bouncing
 * to the ground at 1.0, and bounce v2 times, with decay factor of v1.
 * ELM_TRANSIT_TWEEN_MODE_SPRING - Start at 0.0 then "wobble" like a spring rest
 * position 1.0, and wobble v2 times, with decay factor of v1.
 *
 * @param transit The transit object.
 * @param tween_mode The tween type.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_tween_mode_set(transit:PElm_Transit; tween_mode:TElm_Transit_Tween_Mode);cdecl;external;
{*
 * Get the transit animation acceleration type.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @return The tween type. If @p transit is NULL
 * ELM_TRANSIT_TWEEN_MODE_LINEAR is returned.
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_tween_mode_get(transit:PElm_Transit):TElm_Transit_Tween_Mode;cdecl;external;
{*
 * Set the transit animation acceleration factor.
 *
 * This function sets the tween mode factor of the transit that can be:
 * If you use the below tween modes, you have to set the factor using this API.
 * ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL - Start slow, speed up then slow down
 * at end, v1 being a power factor, 0.0 being linear, 1.0 being
 * ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL default, 2.0 being much more pronounced
 * sinusoidal(squared), 3.0 being cubed, etc.
 * ELM_TRANSIT_TWEEN_MODE_DECELERATE - Start fast then slow down, v1 being a
 * power factor, 0.0 being linear, 1.0 being ELM_TRANSIT_TWEEN_MODE_DECELERATE
 * default, 2.0 being much more pronounced decelerate (squared), 3.0 being
 * cubed, etc.
 * ELM_TRANSIT_TWEEN_MODE_ACCELERATE - Start slow then speed up, v1 being a
 * power factor, 0.0 being linear, 1.0 being ELM_TRANSIT_TWEEN_MODE_ACCELERATE
 * default, 2.0 being much more pronounced accelerate (squared), 3.0 being
 * cubed, etc.
 * ELM_TRANSIT_TWEEN_MODE_DIVISOR_INTERP - Start at gradient * v1, interpolated
 * via power of v2 curve
 * ELM_TRANSIT_TWEEN_MODE_BOUNCE - Start at 0.0 then "drop" like a ball bouncing
 * to the ground at 1.0, and bounce v2 times, with decay factor of v1
 * ELM_TRANSIT_TWEEN_MODE_SPRING - Start at 0.0 then "wobble" like a spring rest
 * position 1.0, and wobble v2 times, with decay factor of v1
 *
 * @param transit The transit object.
 * @param v1 A parameter use by the mapping (default is 1.0)
 * @param v2 A parameter use by the mapping (default is 0.0)
 *
 * @see elm_transit_tween_mode_factor_get()
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_tween_mode_factor_set(transit:PElm_Transit; v1:Tdouble; v2:Tdouble);cdecl;external;
{*
 * Get the transit animation acceleration factor.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @param v1      Pointer to an double in which to store the factor value.
 * @param v2      Pointer to an double in which to store the factor value2.
 *
 * @see elm_transit_tween_mode_factor_set()
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
procedure elm_transit_tween_mode_factor_get(transit:PElm_Transit; v1:Pdouble; v2:Pdouble);cdecl;external;
{*
 * Set the transit animation acceleration factor.
 *
 * This function sets the tween mode factor of the transit that can be:
 * If you use the below tween modes, you have to set the factor using this API.
 * ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL - Start slow, speed up then slow down
 * at end, v[0] being a power factor, 0.0 being linear, 1.0 being
 * ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL default, 2.0 being much more pronounced
 * sinusoidal(squared), 3.0 being cubed, etc.
 * ELM_TRANSIT_TWEEN_MODE_DECELERATE - Start fast then slow down, v[0] being a
 * power factor, 0.0 being linear, 1.0 being ELM_TRANSIT_TWEEN_MODE_DECELERATE
 * default, 2.0 being much more pronounced decelerate (squared), 3.0 being
 * cubed, etc.
 * ELM_TRANSIT_TWEEN_MODE_ACCELERATE - Start slow then speed up, v[0] being a
 * power factor, 0.0 being linear, 1.0 being ELM_TRANSIT_TWEEN_MODE_ACCELERATE
 * default, 2.0 being much more pronounced accelerate (squared), 3.0 being
 * cubed, etc.
 * ELM_TRANSIT_TWEEN_MODE_DIVISOR_INTERP - Start at gradient v[0], interpolated
 * via power of v[1] curve
 * ELM_TRANSIT_TWEEN_MODE_BOUNCE - Start at 0.0 then "drop" like a ball bouncing
 * to the ground at 1.0, and bounce v[1] times, with decay factor of v[0]
 * ELM_TRANSIT_TWEEN_MODE_SPRING - Start at 0.0 then "wobble" like a spring rest
 * position 1.0, and wobble v[1] times, with decay factor of v[0]
 * ELM_TRANSIT_TWEEN_MODE_BEZIER_CURVE - Use an interpolated cubic-bezier curve
 * adjusted with parameters from v[0] to v[3]
 *
 * @param transit The transit object.
 * @param v_size The size of the array pointing to v
 * @param v The address of an array with the double parameters to be used by the mapping.
 *
 * @see elm_transit_tween_mode_factor_set()
 * @since 1.13
 * @ingroup Elm_Transit
  }
procedure elm_transit_tween_mode_factor_n_set(transit:PElm_Transit; v_size:dword; v:Pdouble);cdecl;external;
{*
 * Set the transit animation time
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @param duration The animation time.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_duration_set(transit:PElm_Transit; duration:Tdouble);cdecl;external;
{*
 * Get the transit animation time
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 *
 * @return The transit animation time.
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_duration_get(transit:PElm_Transit):Tdouble;cdecl;external;
{*
 * Starts the transition.
 * Once this API is called, the transit begins to measure the time.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_go(transit:PElm_Transit);cdecl;external;
{*
 * This API can be used to reverse play an ongoing transition.
 * It shows effect only when an animation is going on.
 * If this API is called twice transition will go in forward direction as normal one.
 * If a repeat count is set, this API call will revert just the ongoing cycle and once
 * it is reverted back completely, the transition will go in forward direction.
 * If an autoreverse is set for the transition and this API is called in the midst of
 * the transition the ongoing transition will be reverted and once it is done, the
 * transition will begin again and complete a full auto reverse cycle.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @return @c EINA_TRUE if transition is reverted, @c EINA_FALSE otherwise.
 *
 * @since 1.18
 * @ingroup Elm_Transit
  }
function elm_transit_revert(transit:PElm_Transit):TEina_Bool;cdecl;external;
{*
 * Starts the transition in given seconds.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @param in The interval value in seconds
 *
 * @since 1.14
 * @ingroup Elm_Transit
  }
procedure elm_transit_go_in(transit:PElm_Transit; in:Tdouble);cdecl;external;
{*
 * Pause/Resume the transition.
 *
 * If you call elm_transit_go again, the transit will be started from the
 * beginning, and will be played.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @param paused Whether the transition should be paused or not.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_paused_set(transit:PElm_Transit; paused:TEina_Bool);cdecl;external;
{*
 * Get the value of paused status.
 *
 * @see elm_transit_paused_set()
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @return @c EINA_TRUE means transition is paused. If @p transit is NULL
 * @c EINA_FALSE is returned
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_paused_get(transit:PElm_Transit):TEina_Bool;cdecl;external;
{*
 * Get the time progression of the animation (a double value between 0.0 and 1.0).
 *
 * The value returned is a fraction (current time / total time). It
 * represents the progression position relative to the total.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 *
 * @return The time progression value. If @p transit is NULL
 * 0 is returned
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_progress_value_get(transit:PElm_Transit):Tdouble;cdecl;external;
{*
 * Set current time progression of the animation.
 *
 * Intervene current progress instantly when it requires to jump onto a specific frame position.
 *
 * @note @p transit can not be NULL
 *
 * @param transit The transit object.
 * @param progress The time progression value. The value must be in range of (0.0 ~ 1.0).
 *
 * @see elm_transit_progress_value_get()
 *
 * @since 1.22
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_progress_value_set(transit:PElm_Transit; progress:Tdouble);cdecl;external;
{*
 * Makes the chain relationship between two transits.
 *
 * @note @p transit can not be NULL. Transit would have multiple chain transits.
 * @note @p chain_transit can not be NULL. Chain transits could be chained to the only one transit.
 *
 * @param transit The transit object.
 * @param chain_transit The chain transit object. This transit will be operated
 *        after transit is done.
 *
 * This function adds @p chain_transit transition to a chain after the @p
 * transit, and will be started as soon as @p transit ends. See @ref
 * transit_example_02_explained for a full example.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_chain_transit_add(transit:PElm_Transit; chain_transit:PElm_Transit);cdecl;external;
{*
 * Cut off the chain relationship between two transits.
 *
 * @note @p transit can not be NULL. Transit would have the chain relationship with @p chain transit.
 * @note @p chain_transit can not be NULL. Chain transits should be chained to the @p transit.
 *
 * @param transit The transit object.
 * @param chain_transit The chain transit object.
 *
 * This function remove the @p chain_transit transition from the @p transit.
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_chain_transit_del(transit:PElm_Transit; chain_transit:PElm_Transit);cdecl;external;
{*
 * Get the current chain transit list.
 *
 * @note @p transit can not be NULL.
 *
 * @param transit The transit object.
 * @return chain transit list.
 *
 * @ingroup Elm_Transit
  }
(* Const before type ignored *)
function elm_transit_chain_transits_get(transit:PElm_Transit):PEina_List;cdecl;external;
{*
 * Set the smooth effect for a transit.
 *
 * @param transit The transit object
 * @param enabled enable or disable smooth map rendering
 *
 * This sets smoothing for transit map rendering. If the object added in a
 * transit is a type that has its own smoothing settings, then both the smooth
 * settings for this object and the map must be turned off. By default smooth
 * maps are enabled.
 *
 * @see evas_map_smooth_set()
 * @since 1.8
 *
 * @ingroup Elm_Transit
  }
procedure elm_transit_smooth_set(transit:PElm_Transit; enabled:TEina_Bool);cdecl;external;
{*
 * Get the smooth scaling for transit map rendering
 *
 * This gets smooth scaling for transit map rendering.
 *
 * @param transit The transit object
 * @return @c EINA_TRUE if the smooth is enabled, @c EINA_FALSE otherwise.
 *
 * @see elm_transit_smooth_set()
 * @since 1.8
 *
  }
(* Const before type ignored *)
function elm_transit_smooth_get(transit:PElm_Transit):TEina_Bool;cdecl;external;
{*
 * Add the Resizing Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates resizing effect context
 * and add it's required APIs to elm_transit_effect_add.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param from_w Object width size when effect begins.
 * @param from_h Object height size when effect begins.
 * @param to_w Object width size when effect ends.
 * @param to_h Object height size when effect ends.
 * @return Resizing effect context data.
 *
 * @ingroup Elm_Transit
  }
function elm_transit_effect_resizing_add(transit:PElm_Transit; from_w:TEvas_Coord; from_h:TEvas_Coord; to_w:TEvas_Coord; to_h:TEvas_Coord):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Translation Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates translation effect context
 * and add it's required APIs to elm_transit_effect_add.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param from_dx X Position variation when effect begins.
 * @param from_dy Y Position variation when effect begins.
 * @param to_dx X Position variation when effect ends.
 * @param to_dy Y Position variation when effect ends.
 * @return Translation effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the geometry information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_translation_add(transit:PElm_Transit; from_dx:TEvas_Coord; from_dy:TEvas_Coord; to_dx:TEvas_Coord; to_dy:TEvas_Coord):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Zoom Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates zoom effect context
 * and add it's required APIs to elm_transit_effect_add.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param from_rate Scale rate when effect begins (1 is current rate).
 * @param to_rate Scale rate when effect ends.
 * @return Zoom effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the geometry information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_zoom_add(transit:PElm_Transit; from_rate:single; to_rate:single):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Flip Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates flip effect context
 * and add it's required APIs to elm_transit_effect_add.
 * @note This effect is applied to each pair of objects in the order they are listed
 * in the transit list of objects. The first object in the pair will be the
 * "front" object and the second will be the "back" object.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param axis Flipping Axis(X or Y).
 * @param cw Flipping Direction. @c EINA_TRUE is clock-wise.
 * @return Flip effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the geometry information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_flip_add(transit:PElm_Transit; axis:TElm_Transit_Effect_Flip_Axis; cw:TEina_Bool):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Resizeable Flip Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates resizable flip effect context
 * and add it's required APIs to elm_transit_effect_add.
 * @note This effect is applied to each pair of objects in the order they are listed
 * in the transit list of objects. The first object in the pair will be the
 * "front" object and the second will be the "back" object.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param axis Flipping Axis(X or Y).
 * @param cw Flipping Direction. @c EINA_TRUE is clock-wise.
 * @return Resizeable flip effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the geometry information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_resizable_flip_add(transit:PElm_Transit; axis:TElm_Transit_Effect_Flip_Axis; cw:TEina_Bool):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Wipe Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates wipe effect context
 * and add it's required APIs to elm_transit_effect_add.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param type Wipe type. Hide or show.
 * @param dir Wipe Direction.
 * @return Wipe effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the geometry information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_wipe_add(transit:PElm_Transit; _type:TElm_Transit_Effect_Wipe_Type; dir:TElm_Transit_Effect_Wipe_Dir):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Color Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates color effect context
 * and add it's required APIs to elm_transit_effect_add.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit        Transit object.
 * @param  from_r        RGB R when effect begins.
 * @param  from_g        RGB G when effect begins.
 * @param  from_b        RGB B when effect begins.
 * @param  from_a        RGB A when effect begins.
 * @param  to_r          RGB R when effect ends.
 * @param  to_g          RGB G when effect ends.
 * @param  to_b          RGB B when effect ends.
 * @param  to_a          RGB A when effect ends.
 * @return               Color effect context data.
 *
 * @ingroup Elm_Transit
  }
function elm_transit_effect_color_add(transit:PElm_Transit; from_r:dword; from_g:dword; from_b:dword; from_a:dword; 
           to_r:dword; to_g:dword; to_b:dword; to_a:dword):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Fade Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates fade effect context
 * and add it's required APIs to elm_transit_effect_add.
 * @note This effect is applied to each pair of objects in the order they are listed
 * in the transit list of objects. The first object in the pair will be the
 * "before" object and the second will be the "after" object.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @return Fade effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the color information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_fade_add(transit:PElm_Transit):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Blend Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates blend effect context
 * and add it's required APIs to elm_transit_effect_add.
 * @note This effect is applied to each pair of objects in the order they are listed
 * in the transit list of objects. The first object in the pair will be the
 * "before" object and the second will be the "after" object.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @return Blend effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the color information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_blend_add(transit:PElm_Transit):PElm_Transit_Effect;cdecl;external;
{*
 * Add the Rotation Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates rotation effect context
 * and add it's required APIs to elm_transit_effect_add.
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param from_degree Degree when effect begins.
 * @param to_degree Degree when effect is ends.
 * @return Rotation effect context data.
 *
 * @ingroup Elm_Transit
 * @warning It is highly recommended just create a transit with this effect when
 * the window that the objects of the transit belongs has already been created.
 * This is because this effect needs the geometry information about the objects,
 * and if the window was not created yet, it can get a wrong information.
  }
function elm_transit_effect_rotation_add(transit:PElm_Transit; from_degree:single; to_degree:single):PElm_Transit_Effect;cdecl;external;
{*
 * Add the ImageAnimation Effect to Elm_Transit.
 *
 * @note This API is one of the facades. It creates image animation effect context
 * and add it's required APIs to elm_transit_effect_add.
 * The @p images parameter is a list images paths. This list and
 * its contents will be deleted at the end of the effect by
 * elm_transit_effect_image_animation_context_free() function.
 *
 * Example:
 * @code
 * char buf[PATH_MAX];
 * Eina_List *images = NULL;
 * Elm_Transit *transi = elm_transit_add();
 *
 * snprintf(buf, sizeof(buf), "%s/images/icon_11.png", PACKAGE_DATA_DIR);
 * images = eina_list_append(images, eina_stringshare_add(buf));
 *
 * snprintf(buf, sizeof(buf), "%s/images/logo_small.png", PACKAGE_DATA_DIR);
 * images = eina_list_append(images, eina_stringshare_add(buf));
 * elm_transit_effect_image_animation_add(transi, images);
 *
 * @endcode
 *
 * @see elm_transit_effect_add()
 *
 * @param transit Transit object.
 * @param images Eina_List of images file paths. This list and
 * its contents will be deleted at the end of the effect by
 * elm_transit_effect_image_animation_context_free() function.
 * @return Image Animation effect context data.
 *
 * @ingroup Elm_Transit
  }
function elm_transit_effect_image_animation_add(transit:PElm_Transit; images:PEina_List):PElm_Transit_Effect;cdecl;external;
{*
 * @
  }

implementation


end.
