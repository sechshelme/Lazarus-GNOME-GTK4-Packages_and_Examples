
unit efl_cubic_bezier_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_cubic_bezier_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_cubic_bezier_interpolator_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Cubic_Bezier_Interpolator  = ^Efl_Cubic_Bezier_Interpolator;
PEina_Vector2  = ^Eina_Vector2;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CUBIC_BEZIER_INTERPOLATOR_EO_H_}
{$define _EFL_CUBIC_BEZIER_INTERPOLATOR_EO_H_}
{$ifndef _EFL_CUBIC_BEZIER_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_CUBIC_BEZIER_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Cubic_Bezier_Interpolator = ^TEfl_Cubic_Bezier_Interpolator;
  TEfl_Cubic_Bezier_Interpolator = TEo;
{$endif}
{$ifndef _EFL_CUBIC_BEZIER_INTERPOLATOR_EO_TYPES}
{$define _EFL_CUBIC_BEZIER_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Cubic Bezier interpolator. It starts slow, then moves quickly and
 * then slows down again before stopping.
 *
 * The exact shape of the mapping curve can be modified through the
 * @ref efl_cubic_bezier_interpolator_control_points_get property.
 *
 * @since 1.24
 *
 * @ingroup Efl_Cubic_Bezier_Interpolator
  }

{ was #define dname def_expr }
function EFL_CUBIC_BEZIER_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_cubic_bezier_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Cubic Bezier curves are described by 4 2D control points
 * (https://en.wikipedia.org/wiki/B%C3%A9zier_curve). For each control point,
 * the X coordinate is an input value and the Y coordinate is the corresponding
 * output value. The first one, P0, is set to <tt>(0,0)</tt>: The input
 * <tt>0.0</tt> is mapped to the <tt>0.0</tt> output. The last one, P3, is
 * set to <tt>(1,1)</tt>: The input <tt>1.0</tt> is mapped to the
 * <tt>1.0</tt> output. The other two control points can be set through this
 * property and control the shape of the curve. Note that the control points do
 * not need to be in the <tt>0...1</tt> range, and neither do the output
 * values of the curve.
 *
 * @param[in] obj The object.
 * @param[in] p1 P1 control point.
 * @param[in] p2 P2 control point.
 *
 * @since 1.24
 *
 * @ingroup Efl_Cubic_Bezier_Interpolator
  }
procedure efl_cubic_bezier_interpolator_control_points_set(obj:PEo; p1:TEina_Vector2; p2:TEina_Vector2);cdecl;external;
{*
 * @brief Cubic Bezier curves are described by 4 2D control points
 * (https://en.wikipedia.org/wiki/B%C3%A9zier_curve). For each control point,
 * the X coordinate is an input value and the Y coordinate is the corresponding
 * output value. The first one, P0, is set to <tt>(0,0)</tt>: The input
 * <tt>0.0</tt> is mapped to the <tt>0.0</tt> output. The last one, P3, is
 * set to <tt>(1,1)</tt>: The input <tt>1.0</tt> is mapped to the
 * <tt>1.0</tt> output. The other two control points can be set through this
 * property and control the shape of the curve. Note that the control points do
 * not need to be in the <tt>0...1</tt> range, and neither do the output
 * values of the curve.
 *
 * @param[in] obj The object.
 * @param[out] p1 P1 control point.
 * @param[out] p2 P2 control point.
 *
 * @since 1.24
 *
 * @ingroup Efl_Cubic_Bezier_Interpolator
  }
(* Const before type ignored *)
procedure efl_cubic_bezier_interpolator_control_points_get(obj:PEo; p1:PEina_Vector2; p2:PEina_Vector2);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CUBIC_BEZIER_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_CUBIC_BEZIER_INTERPOLATOR_CLASS:=efl_cubic_bezier_interpolator_class_get;
  end;


end.
