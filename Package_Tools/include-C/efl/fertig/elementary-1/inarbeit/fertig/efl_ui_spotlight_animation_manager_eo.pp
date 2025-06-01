
unit efl_ui_spotlight_animation_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spotlight_animation_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spotlight_animation_manager_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Spotlight_Animation_Manager  = ^Efl_Ui_Spotlight_Animation_Manager;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_EO_H_}
{$define _EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_EO_H_}
{$ifndef _EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_EO_CLASS_TYPE}
{$define _EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Spotlight_Animation_Manager = ^TEfl_Ui_Spotlight_Animation_Manager;
  TEfl_Ui_Spotlight_Animation_Manager = TEo;
{$endif}
{$ifndef _EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_EO_TYPES}
{$define _EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A spotlight manager that uses animation objects to react to different
 * @ref efl_ui_spotlight_manager_switch_to situations.
 *
 * Animations are played forward when they are on the @c to argument and they
 * are played backward when they are on the @c from argument.
 *
 * Pop animations are always played backwards, Push animations are always
 * played forward. The reason for this is reusability: you can use the same
 * animation in all situations and this covers the inverted effect that "moving
 * in" and "moving out" has. For example, when you have an alpha channel
 * animation, the Pop animation can be the same as the Jump-In and Out
 * animation, and both will look like fading out.
 *
 * @ingroup Efl_Ui_Spotlight_Animation_Manager
  }

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_spotlight_animation_manager_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Animation that is used to animate the @c to argument of a
 * @ref efl_ui_spotlight_manager_switch_to request when the passed @c reason is
 * @ref EFL_UI_SPOTLIGHT_MANAGER_SWITCH_REASON_PUSH.
 *
 * If these animations are @c null, then the @c in and @c out animation of
 * @ref efl_ui_spotlight_manager_animation_jump_setup_set will be used instead.
 *
 * @param[in] obj The object.
 * @param[in] in The animation to play, the implementation will take an
 * additional reference
 * @param[in] out The animation to play, the implementation will take an
 * additional reference. Can be the same as @c in.
 *
 * @ingroup Efl_Ui_Spotlight_Animation_Manager
  }
procedure efl_ui_spotlight_manager_animation_push_setup_set(obj:PEo; in:PEfl_Canvas_Animation; out:PEfl_Canvas_Animation);cdecl;external;
{*
 * @brief Animation that is used to animate the @c from argument of a
 * @ref efl_ui_spotlight_manager_switch_to request when the passed @c reason is
 * @ref EFL_UI_SPOTLIGHT_MANAGER_SWITCH_REASON_POP.
 *
 * @note These animations are always played backwards, see the class
 * documentation for the reasoning.
 *
 * If these animations are @c null, then the @c in and @c out animation of
 * @ref efl_ui_spotlight_manager_animation_jump_setup_set will be used instead.
 *
 * @param[in] obj The object.
 * @param[in] in The animation to play, the implementation will take an
 * additional reference
 * @param[in] out The animation to play, the implementation will take an
 * additional reference. Can be the same as @c in.
 *
 * @ingroup Efl_Ui_Spotlight_Animation_Manager
  }
procedure efl_ui_spotlight_manager_animation_pop_setup_set(obj:PEo; in:PEfl_Canvas_Animation; out:PEfl_Canvas_Animation);cdecl;external;
{*
 * @brief Sets the animation objects you want to play on a jump in or jump out.
 *
 * When a @ref efl_ui_spotlight_manager_switch_to request is issued, two
 * arguments are getting animated. The @c from object, and the @c to object.
 * The @c from object will play the @c out animation whereas the @c to object
 * will play the @c in animation.
 *
 * The @c out animation will always be played backwards. See the class
 * documentation for the reasoning.
 *
 * @param[in] obj The object.
 * @param[in] in The animation to play, the implementation will take an
 * additional reference
 * @param[in] out The animation to play, the implementation will take an
 * additional reference. Can be the same as @c in.
 *
 * @ingroup Efl_Ui_Spotlight_Animation_Manager
  }
procedure efl_ui_spotlight_manager_animation_jump_setup_set(obj:PEo; in:PEfl_Canvas_Animation; out:PEfl_Canvas_Animation);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_CLASS:=efl_ui_spotlight_animation_manager_class_get;
  end;


end.
