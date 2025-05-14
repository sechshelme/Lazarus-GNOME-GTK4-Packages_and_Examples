
unit efl_canvas_parallel_group_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_parallel_group_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_parallel_group_animation_eo.h
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
PEfl_Canvas_Parallel_Group_Animation  = ^Efl_Canvas_Parallel_Group_Animation;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_PARALLEL_GROUP_ANIMATION_EO_H_}
{$define _EFL_CANVAS_PARALLEL_GROUP_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_PARALLEL_GROUP_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_PARALLEL_GROUP_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Parallel_Group_Animation = ^TEfl_Canvas_Parallel_Group_Animation;
  TEfl_Canvas_Parallel_Group_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_PARALLEL_GROUP_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_PARALLEL_GROUP_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief Combined animation which plays its individual animations in parallel
 * (all of them simultaneously).
 *
 * For instance, this could be used to move an @ref Efl_Canvas_Object from one
 * position to another while rotating it along the way.
 *
 * Use @ref efl_animation_group_animation_add to append individual animations.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Parallel_Group_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_PARALLEL_GROUP_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_parallel_group_animation_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_PARALLEL_GROUP_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_PARALLEL_GROUP_ANIMATION_CLASS:=efl_canvas_parallel_group_animation_class_get;
  end;


end.
