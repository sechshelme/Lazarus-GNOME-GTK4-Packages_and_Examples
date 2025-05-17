
unit efl_canvas_object_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_object_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_object_animation_eo.h
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
PEfl_Canvas_Object_Animation  = ^Efl_Canvas_Object_Animation;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_OBJECT_ANIMATION_EO_H_}
{$define _EFL_CANVAS_OBJECT_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_OBJECT_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_OBJECT_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Object_Animation = ^TEfl_Canvas_Object_Animation;
  TEfl_Canvas_Object_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_OBJECT_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_OBJECT_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief A mixin that provides animation capabilities to
 * @ref Efl_Canvas_Object.
 *
 * By including this mixin canvas objects can be animated just by calling
 * @ref efl_canvas_object_animation_start.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_OBJECT_ANIMATION_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_object_animation_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief The animation that is currently played on the canvas object.
 *
 * @c null in case that there is no animation running.
 *
 * @param[in] obj The object.
 *
 * @return The animation which is currently applied on this object.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }
(* Const before type ignored *)
function efl_canvas_object_animation_get(obj:PEo):PEfl_Canvas_Animation;cdecl;external;
{*
 * @brief The current progress of the animation, between <tt>0.0</tt> and
 * <tt>1.0</tt>.
 *
 * Even if the animation is going backwards (speed < 0.0) the progress will
 * still go from <tt>0.0</tt> to <tt>1.0</tt>.
 *
 * If there is no animation going on, this will return <tt>-1.0</tt>.
 *
 * @param[in] obj The object.
 *
 * @return Current progress of the animation.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }
(* Const before type ignored *)
function efl_canvas_object_animation_progress_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Pause the animation.
 *
 * @ref efl_canvas_object_animation_get will not be unset. When @c pause is
 * @c false, the animation will be resumed at the same progress it was when it
 * was paused.
 *
 * @param[in] obj The object.
 * @param[in] pause Paused state.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }
procedure efl_canvas_object_animation_pause_set(obj:PEo; pause:TEina_Bool);cdecl;external;
{*
 * @brief Pause the animation.
 *
 * @ref efl_canvas_object_animation_get will not be unset. When @c pause is
 * @c false, the animation will be resumed at the same progress it was when it
 * was paused.
 *
 * @param[in] obj The object.
 *
 * @return Paused state.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }
(* Const before type ignored *)
function efl_canvas_object_animation_pause_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Start a new animation.
 *
 * If there is an animation going on, it is stopped and the previous
 * @ref efl_canvas_object_animation_get object is replaced. Its lifetime is
 * adjusted accordingly.
 *
 * @param[in] obj The object.
 * @param[in] animation The animation to start. When not needed anymore, the
 * reference that was passed is given up.
 * @param[in] speed The speed of the playback. <tt>1.0</tt> is normal
 * playback. Negative values mean reverse playback.
 * @param[in] starting_progress The progress point where to start. Must be
 * between <tt>0.0</tt> and <tt>1.0</tt>. Useful to revert an
 * animation which has already started.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }
procedure efl_canvas_object_animation_start(obj:PEo; animation:PEfl_Canvas_Animation; speed:Tdouble; starting_progress:Tdouble);cdecl;external;
{*
 * @brief Stop the animation.
 *
 * After this call, @ref efl_canvas_object_animation_get will return @c null.
 * The reference that was taken during @ref efl_canvas_object_animation_start
 * will be given up.
 *
 * @param[in] obj The object.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }
procedure efl_canvas_object_animation_stop(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED : TEfl_Event_Description;cvar;external;
{* The animation object got changed.
 * @return Efl_Canvas_Animation *
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED : TEfl_Event_Description;cvar;external;
{* The animation progress got changed.
 * @return double
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Object_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_OBJECT_ANIMATION_MIXIN : longint; { return type might be wrong }
  begin
    EFL_CANVAS_OBJECT_ANIMATION_MIXIN:=efl_canvas_object_animation_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED:=@(_EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED:=@(_EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED);
  end;


end.
