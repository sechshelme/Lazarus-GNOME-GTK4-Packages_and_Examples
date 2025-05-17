
unit efl_canvas_group_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_group_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_group_animation_eo.h
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
PEfl_Canvas_Group_Animation  = ^Efl_Canvas_Group_Animation;
PEfl_Class  = ^Efl_Class;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GROUP_ANIMATION_EO_H_}
{$define _EFL_CANVAS_GROUP_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_GROUP_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GROUP_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Group_Animation = ^TEfl_Canvas_Group_Animation;
  TEfl_Canvas_Group_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GROUP_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_GROUP_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief Base class for combined animations (groups of animations that are
 * played together).
 *
 * This class provides methods to add, remove and retrieve individual
 * animations from the group.
 *
 * See for example @ref Efl_Canvas_Parallel_Group_Animation and
 * @ref Efl_Canvas_Sequential_Group_Animation.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Group_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_group_animation_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Adds the given animation to the animation group.
 *
 * @param[in] obj The object.
 * @param[in] animation Animation to add to the group.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Group_Animation
  }
procedure efl_animation_group_animation_add(obj:PEo; animation:PEfl_Canvas_Animation);cdecl;external;
{*
 * @brief Removes the given animation from the animation group.
 *
 * @param[in] obj The object.
 * @param[in] animation Animation to remove from the group.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Group_Animation
  }
procedure efl_animation_group_animation_del(obj:PEo; animation:PEfl_Canvas_Animation);cdecl;external;
{*
 * @brief All animations that are currently part of this group.
 *
 * @param[in] obj The object.
 *
 * @return The iterator carrying all animations of this group
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Group_Animation
  }
(* Const before type ignored *)
function efl_animation_group_animations_get(obj:PEo):PEina_Iterator;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GROUP_ANIMATION_CLASS:=efl_canvas_group_animation_class_get;
  end;


end.
