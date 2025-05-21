
unit efl_decelerate_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_decelerate_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_decelerate_interpolator_eo.h
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
PEfl_Decelerate_Interpolator  = ^Efl_Decelerate_Interpolator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_DECELERATE_INTERPOLATOR_EO_H_}
{$define _EFL_DECELERATE_INTERPOLATOR_EO_H_}
{$ifndef _EFL_DECELERATE_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_DECELERATE_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Decelerate_Interpolator = ^TEfl_Decelerate_Interpolator;
  TEfl_Decelerate_Interpolator = TEo;
{$endif}
{$ifndef _EFL_DECELERATE_INTERPOLATOR_EO_TYPES}
{$define _EFL_DECELERATE_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Decelerated interpolator. It starts fast and decelerates, stopping
 * smoothly when it reaches <tt>1.0</tt>.
 *
 * Internally it uses the second half of a sinus rise (from 0.5 to 1.0) and the
 * steepness can be customized through the
 * @ref efl_decelerate_interpolator_slope_get property.
 *
 * @since 1.24
 *
 * @ingroup Efl_Decelerate_Interpolator
  }

{ was #define dname def_expr }
function EFL_DECELERATE_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_decelerate_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Customize the deceleration effect.
 *
 * @param[in] obj The object.
 * @param[in] slope How steep is the effect. <tt>0</tt> performs a linear
 * interpolation, <tt>1</tt> corresponds to a sinus function and higher
 * numbers produce an increasingly steep effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Decelerate_Interpolator
  }
procedure efl_decelerate_interpolator_slope_set(obj:PEo; slope:Tdouble);cdecl;external;
{*
 * @brief Customize the deceleration effect.
 *
 * @param[in] obj The object.
 *
 * @return How steep is the effect. <tt>0</tt> performs a linear
 * interpolation, <tt>1</tt> corresponds to a sinus function and higher
 * numbers produce an increasingly steep effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Decelerate_Interpolator
  }
(* Const before type ignored *)
function efl_decelerate_interpolator_slope_get(obj:PEo):Tdouble;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_DECELERATE_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_DECELERATE_INTERPOLATOR_CLASS:=efl_decelerate_interpolator_class_get;
  end;


end.
