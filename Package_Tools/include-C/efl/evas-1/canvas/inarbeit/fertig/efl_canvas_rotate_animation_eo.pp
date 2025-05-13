
unit efl_canvas_rotate_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_rotate_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_rotate_animation_eo.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Canvas_Rotate_Animation  = ^Efl_Canvas_Rotate_Animation;
PEfl_Class  = ^Efl_Class;
PEina_Position2D  = ^Eina_Position2D;
PEina_Vector2  = ^Eina_Vector2;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_ROTATE_ANIMATION_EO_H_}
{$define _EFL_CANVAS_ROTATE_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_ROTATE_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_ROTATE_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Rotate_Animation = ^TEfl_Canvas_Rotate_Animation;
  TEfl_Canvas_Rotate_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_ROTATE_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_ROTATE_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief Animated rotation effect.
 *
 * The @ref Efl_Canvas_Object will rotate around a pivot point from one degree
 * to another. Coordinates for the pivot point can be relative to another
 * object or absolute (relative to the containing canvas).
 *
 * @note Changing an object's position using @ref efl_gfx_entity_position_get
 * while this animation is running might lead to unexpected results.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Rotate_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_ROTATE_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_rotate_animation_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Degree range to animate and pivot object. The object will rotate from
 * @c from_degree to @c to_degree around the pivot point. All of the object's
 * vertices (i.e. the corners, if it's a rectangular object) will be rotated by
 * these degrees, relative to the pivot point inside the pivot object. The
 * pivot point is another object @c pivot plus an additional offset
 * @c center_point.
 *
 * @param[in] obj The object.
 * @param[in] from_degree Initial rotation (from 0 to 360). 0 means no
 * rotation.
 * @param[in] to_degree Ending rotation (from 0 to 360). 0 means no rotation.
 * @param[in] pivot Object to use as pivot. @c NULL means the animated object
 * itself.
 * @param[in] center_point Position in pixels of the pivot point inside the
 * pivot object. <tt>(0,0)</tt> means the upper-left corner.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Rotate_Animation
  }
procedure efl_animation_rotate_set(obj:PEo; from_degree:Tdouble; to_degree:Tdouble; pivot:PEfl_Canvas_Object; center_point:TEina_Vector2);cdecl;external;
{*
 * @brief Degree range to animate and pivot object. The object will rotate from
 * @c from_degree to @c to_degree around the pivot point. All of the object's
 * vertices (i.e. the corners, if it's a rectangular object) will be rotated by
 * these degrees, relative to the pivot point inside the pivot object. The
 * pivot point is another object @c pivot plus an additional offset
 * @c center_point.
 *
 * @param[in] obj The object.
 * @param[out] from_degree Initial rotation (from 0 to 360). 0 means no
 * rotation.
 * @param[out] to_degree Ending rotation (from 0 to 360). 0 means no rotation.
 * @param[out] pivot Object to use as pivot. @c NULL means the animated object
 * itself.
 * @param[out] center_point Position in pixels of the pivot point inside the
 * pivot object. <tt>(0,0)</tt> means the upper-left corner.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Rotate_Animation
  }
(* Const before type ignored *)
procedure efl_animation_rotate_get(obj:PEo; from_degree:Pdouble; to_degree:Pdouble; pivot:PPEfl_Canvas_Object; center_point:PEina_Vector2);cdecl;external;
{*
 * @brief Degree range to animate and absolute pivot point. The object will
 * rotate from @c from_degree to @c to_degree around the pivot point. All of
 * the object's vertices (i.e. the corners, if it's a rectangular object) will
 * be rotated by these degrees, relative to an absolute pivot point. The pivot
 * point is relative to the canvas.
 *
 * @param[in] obj The object.
 * @param[in] from_degree Initial rotation (from 0 to 360). 0 means no
 * rotation.
 * @param[in] to_degree Ending rotation (from 0 to 360). 0 means no rotation.
 * @param[in] pivot_point Position of the pivot point relative to the canvas.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Rotate_Animation
  }
procedure efl_animation_rotate_absolute_set(obj:PEo; from_degree:Tdouble; to_degree:Tdouble; pivot_point:TEina_Position2D);cdecl;external;
{*
 * @brief Degree range to animate and absolute pivot point. The object will
 * rotate from @c from_degree to @c to_degree around the pivot point. All of
 * the object's vertices (i.e. the corners, if it's a rectangular object) will
 * be rotated by these degrees, relative to an absolute pivot point. The pivot
 * point is relative to the canvas.
 *
 * @param[in] obj The object.
 * @param[out] from_degree Initial rotation (from 0 to 360). 0 means no
 * rotation.
 * @param[out] to_degree Ending rotation (from 0 to 360). 0 means no rotation.
 * @param[out] pivot_point Position of the pivot point relative to the canvas.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Rotate_Animation
  }
(* Const before type ignored *)
procedure efl_animation_rotate_absolute_get(obj:PEo; from_degree:Pdouble; to_degree:Pdouble; pivot_point:PEina_Position2D);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_ROTATE_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_ROTATE_ANIMATION_CLASS:=efl_canvas_rotate_animation_class_get;
  end;


end.
