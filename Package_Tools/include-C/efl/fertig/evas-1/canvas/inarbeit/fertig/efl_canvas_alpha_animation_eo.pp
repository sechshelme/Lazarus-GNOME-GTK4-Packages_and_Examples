
unit efl_canvas_alpha_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_alpha_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_alpha_animation_eo.h
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
PEfl_Canvas_Alpha_Animation  = ^Efl_Canvas_Alpha_Animation;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_ALPHA_ANIMATION_EO_H_}
{$define _EFL_CANVAS_ALPHA_ANIMATION_EO_H_}
{$ifndef _EFL_CANVAS_ALPHA_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_CANVAS_ALPHA_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Canvas_Alpha_Animation = ^TEfl_Canvas_Alpha_Animation;
  TEfl_Canvas_Alpha_Animation = TEo;
{$endif}
{$ifndef _EFL_CANVAS_ALPHA_ANIMATION_EO_TYPES}
{$define _EFL_CANVAS_ALPHA_ANIMATION_EO_TYPES}
{$endif}
{*
 * @brief Animated alpha blending effect.
 *
 * The @ref Efl_Canvas_Object will have its alpha (transparency) value
 * multiplied by this animation. This can be used to create fade-in and
 * fade-out transitions, for example.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Alpha_Animation
  }

{ was #define dname def_expr }
function EFL_CANVAS_ALPHA_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_alpha_animation_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Alpha range to animate. <tt>0.0</tt> means the object is
 * transparent and <tt>1.0</tt> means the object is opaque.
 *
 * @param[in] obj The object.
 * @param[in] from_alpha Initial alpha value.
 * @param[in] to_alpha Ending alpha value.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Alpha_Animation
  }
procedure efl_animation_alpha_set(obj:PEo; from_alpha:Tdouble; to_alpha:Tdouble);cdecl;external;
{*
 * @brief Alpha range to animate. <tt>0.0</tt> means the object is
 * transparent and <tt>1.0</tt> means the object is opaque.
 *
 * @param[in] obj The object.
 * @param[out] from_alpha Initial alpha value.
 * @param[out] to_alpha Ending alpha value.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Alpha_Animation
  }
(* Const before type ignored *)
procedure efl_animation_alpha_get(obj:PEo; from_alpha:Pdouble; to_alpha:Pdouble);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_ALPHA_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_ALPHA_ANIMATION_CLASS:=efl_canvas_alpha_animation_class_get;
  end;


end.
