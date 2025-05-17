
unit efl_canvas_translate_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_translate_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_translate_animation_eo.h
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
PEfl_Canvas_Translate_Animation  = ^Efl_Canvas_Translate_Animation;
PEfl_Class  = ^Efl_Class;
PEina_Position2D  = ^Eina_Position2D;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_TRANSLATE_ANIMATION_EO_H_}
{$define _EFL_CANVAS_TRANSLATE_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_TRANSLATE_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_TRANSLATE_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Translate_Animation = ^TEfl_Canvas_Translate_Animation;
  TEfl_Canvas_Translate_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_TRANSLATE_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_TRANSLATE_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief Animated translation effect.
 *
 * The @ref Efl_Canvas_Object will move from one point to another. Coordinates
 * for the origin and destination points can be relative to the object or
 * absolute (relative to the containing canvas).
 *
 * @note Changing an object's position using @ref efl_gfx_entity_position_get
 * while this animation is running might lead to unexpected results.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Translate_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_TRANSLATE_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_translate_animation_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Translation vector, relative to the starting position of the object.
 * So, for example, if @c from is <tt>(0,0)</tt>, the object will move
 * from its current position to @c to.
 *
 * @param[in] obj The object.
 * @param[in] from Relative initial position.
 * @param[in] to Relative ending position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Translate_Animation
  }
procedure efl_animation_translate_set(obj:PEo; from:TEina_Position2D; to:TEina_Position2D);cdecl;external;
{*
 * @brief Translation vector, relative to the starting position of the object.
 * So, for example, if @c from is <tt>(0,0)</tt>, the object will move
 * from its current position to @c to.
 *
 * @param[in] obj The object.
 * @param[out] from Relative initial position.
 * @param[out] to Relative ending position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Translate_Animation
  }
(* Const before type ignored *)
procedure efl_animation_translate_get(obj:PEo; from:PEina_Position2D; to:PEina_Position2D);cdecl;external;
{*
 * @brief Translation vector, relative to the canvas. So, for example, if
 * @c from is <tt>(0,0)</tt>, the object will always start from the origin
 * of the canvas, regardless of the current object position.
 *
 * @param[in] obj The object.
 * @param[in] from Absolute initial position.
 * @param[in] to Absolute ending position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Translate_Animation
  }
procedure efl_animation_translate_absolute_set(obj:PEo; from:TEina_Position2D; to:TEina_Position2D);cdecl;external;
{*
 * @brief Translation vector, relative to the canvas. So, for example, if
 * @c from is <tt>(0,0)</tt>, the object will always start from the origin
 * of the canvas, regardless of the current object position.
 *
 * @param[in] obj The object.
 * @param[out] from Absolute initial position.
 * @param[out] to Absolute ending position.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Translate_Animation
  }
(* Const before type ignored *)
procedure efl_animation_translate_absolute_get(obj:PEo; from:PEina_Position2D; to:PEina_Position2D);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_TRANSLATE_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_TRANSLATE_ANIMATION_CLASS:=efl_canvas_translate_animation_class_get;
  end;


end.
