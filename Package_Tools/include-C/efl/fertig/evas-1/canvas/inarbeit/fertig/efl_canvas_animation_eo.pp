
unit efl_canvas_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_animation_eo.h
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
PEfl_Canvas_Animation  = ^Efl_Canvas_Animation;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEfl_Interpolator  = ^Efl_Interpolator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_ANIMATION_EO_H_}
{$define _EFL_CANVAS_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Animation = ^TEfl_Canvas_Animation;
  TEfl_Canvas_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief Base class to be used by classes implementing specific canvas
 * animations.
 *
 * A canvas animation modifies the properties of a @ref Efl_Canvas_Object like
 * @ref efl_gfx_entity_position_get, @ref efl_gfx_entity_scale_get or
 * @ref efl_gfx_mapping_rotate, for example. The value of the changed
 * properties moves smoothly as the provided progress value evolves from
 * <tt>0</tt> to <tt>1</tt>.
 *
 * For example implementations see @ref Efl_Canvas_Translate_Animation or
 * @ref Efl_Canvas_Scale_Animation.
 *
 * @note Unless @ref efl_animation_final_state_keep_get is used, when an
 * animation finishes any effect it introduced on the object is removed. This
 * means that if the animation does not end in the object's initial state there
 * will be a noticeable sudden jump. To avoid this, animations must finish in
 * the same state as they begin, or the object's state must be matched to the
 * animation's ending state once the animation finishes (using the
 * @[Efl.Canvas.Object_Animation.animation,changed] event).
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_animation_class_get:PEfl_Class;cdecl;external;
{*
 * @brief If @c true the last mapping state the animation applies will be kept.
 * Otherwise all the @ref Efl_Gfx_Mapping properties will be reset when the
 * animation ends.
 *
 * Be careful, though. Object properties like @ref efl_gfx_entity_position_get
 * do not take animations into account so they might not match the actual
 * rendered values. It is usually better to remove the effects of the animation
 * as soon as it finishes and set the final values on the object's properties.
 *
 * @param[in] obj The object.
 * @param[in] keep @c true to keep the final state.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_final_state_keep_set(obj:PEo; keep:TEina_Bool);cdecl;external;
{*
 * @brief If @c true the last mapping state the animation applies will be kept.
 * Otherwise all the @ref Efl_Gfx_Mapping properties will be reset when the
 * animation ends.
 *
 * Be careful, though. Object properties like @ref efl_gfx_entity_position_get
 * do not take animations into account so they might not match the actual
 * rendered values. It is usually better to remove the effects of the animation
 * as soon as it finishes and set the final values on the object's properties.
 *
 * @param[in] obj The object.
 *
 * @return @c true to keep the final state.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
(* Const before type ignored *)
function efl_animation_final_state_keep_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The duration of a single animation "run". The
 * @ref efl_playable_length_get implementation will return this duration
 * adjusted by @ref efl_animation_repeat_mode_get and
 * @ref efl_animation_play_count_get.
 *
 * @param[in] obj The object.
 * @param[in] sec Duration in seconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_duration_set(obj:PEo; sec:Tdouble);cdecl;external;
{*
 * @brief The duration of a single animation "run". The
 * @ref efl_playable_length_get implementation will return this duration
 * adjusted by @ref efl_animation_repeat_mode_get and
 * @ref efl_animation_play_count_get.
 *
 * @param[in] obj The object.
 *
 * @return Duration in seconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
(* Const before type ignored *)
function efl_animation_duration_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief What to do when the animation finishes.
 *
 * @param[in] obj The object.
 * @param[in] mode Repeat mode.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_repeat_mode_set(obj:PEo; mode:TEfl_Canvas_Animation_Repeat_Mode);cdecl;external;
{*
 * @brief What to do when the animation finishes.
 *
 * @param[in] obj The object.
 *
 * @return Repeat mode.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
(* Const before type ignored *)
function efl_animation_repeat_mode_get(obj:PEo):TEfl_Canvas_Animation_Repeat_Mode;cdecl;external;
{*
 * @brief How many times to play an animation. <tt>1</tt> means that the
 * animation only plays once (it is not repeated), whereas <tt>2</tt> will
 * play it again once it finishes the first time and then stop. <tt>0</tt>
 * means that the animation is repeated forever.
 * @ref efl_animation_repeat_mode_get controls the direction in which
 * subsequent playbacks will run.
 *
 * @param[in] obj The object.
 * @param[in] count Play count.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_play_count_set(obj:PEo; count:longint);cdecl;external;
{*
 * @brief How many times to play an animation. <tt>1</tt> means that the
 * animation only plays once (it is not repeated), whereas <tt>2</tt> will
 * play it again once it finishes the first time and then stop. <tt>0</tt>
 * means that the animation is repeated forever.
 * @ref efl_animation_repeat_mode_get controls the direction in which
 * subsequent playbacks will run.
 *
 * @param[in] obj The object.
 *
 * @return Play count.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
(* Const before type ignored *)
function efl_animation_play_count_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The time that passes since the animation is started and the first
 * real change to the object is applied.
 *
 * @param[in] obj The object.
 * @param[in] sec Delay time in seconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_start_delay_set(obj:PEo; sec:Tdouble);cdecl;external;
{*
 * @brief The time that passes since the animation is started and the first
 * real change to the object is applied.
 *
 * @param[in] obj The object.
 *
 * @return Delay time in seconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
(* Const before type ignored *)
function efl_animation_start_delay_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Optional mapping function.
 *
 * Animations are based on a timer that moves linearly from 0 to 1. This
 * @c interpolator method is applied before the timer is passed to the
 * animation, to achieve effects like acceleration or deceleration, for
 * example.
 *
 * @param[in] obj The object.
 * @param[in] interpolator Mapping function. By default it is @c NULL (linear
 * mapping).
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_interpolator_set(obj:PEo; interpolator:PEfl_Interpolator);cdecl;external;
{*
 * @brief Optional mapping function.
 *
 * Animations are based on a timer that moves linearly from 0 to 1. This
 * @c interpolator method is applied before the timer is passed to the
 * animation, to achieve effects like acceleration or deceleration, for
 * example.
 *
 * @param[in] obj The object.
 *
 * @return Mapping function. By default it is @c NULL (linear mapping).
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
(* Const before type ignored *)
function efl_animation_interpolator_get(obj:PEo):PEfl_Interpolator;cdecl;external;
{*
 * @brief Overwrite this method to implement your own animation subclasses.
 *
 * This is used for example by @ref Efl_Canvas_Translate_Animation or
 * @ref Efl_Canvas_Scale_Animation.
 *
 * Subclasses should call their parent's @ref efl_animation_apply to get the
 * adjusted @c progress value and then perform the animation by modifying the
 * @c target's properties.
 *
 * @param[in] obj The object.
 * @param[in] progress Animation progress from <tt>0</tt> to
 * <tt>1</tt>.
 * @param[in] target Object to animate.
 *
 * @return Final applied progress, after possible adjustments. See
 * @ref efl_animation_interpolator_get.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
function efl_animation_apply(obj:PEo; progress:Tdouble; target:PEfl_Canvas_Object):Tdouble;cdecl;external;
{*
 * @brief Duration that will be used by default on all animations unless
 * another value is set per object using @ref efl_animation_duration_get.
 *
 * @param[in] animation_time Default animation duration, in seconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
procedure efl_animation_default_duration_set(animation_time:Tdouble);cdecl;external;
{*
 * @brief Duration that will be used by default on all animations unless
 * another value is set per object using @ref efl_animation_duration_get.
 *
 * @return Default animation duration, in seconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation
  }
function efl_animation_default_duration_get:Tdouble;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_ANIMATION_CLASS:=efl_canvas_animation_class_get;
  end;


end.
