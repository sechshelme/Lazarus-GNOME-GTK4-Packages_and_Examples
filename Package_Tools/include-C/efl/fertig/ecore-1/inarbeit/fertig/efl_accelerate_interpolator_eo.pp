
unit efl_accelerate_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_accelerate_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_accelerate_interpolator_eo.h
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
PEfl_Accelerate_Interpolator  = ^Efl_Accelerate_Interpolator;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCELERATE_INTERPOLATOR_EO_H_}
{$define _EFL_ACCELERATE_INTERPOLATOR_EO_H_}
{$ifndef _EFL_ACCELERATE_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_ACCELERATE_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Accelerate_Interpolator = ^TEfl_Accelerate_Interpolator;
  TEfl_Accelerate_Interpolator = TEo;
{$endif}
{$ifndef _EFL_ACCELERATE_INTERPOLATOR_EO_TYPES}
{$define _EFL_ACCELERATE_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Accelerated interpolator. It starts slow and accelerates, stopping
 * abruptly when it reaches <tt>1.0</tt>.
 *
 * Internally it uses the first half of a sinus rise (from 0 to 0.5) and the
 * steepness can be customized.
 *
 * @since 1.24
 *
 * @ingroup Efl_Accelerate_Interpolator
  }

{ was #define dname def_expr }
function EFL_ACCELERATE_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_accelerate_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Customize the acceleration effect.
 *
 * @param[in] obj The object.
 * @param[in] slope How steep is the effect. <tt>0</tt> performs a linear
 * interpolation, <tt>1</tt> corresponds to a sinus function and higher
 * numbers produce an increasingly steep effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Accelerate_Interpolator
  }
procedure efl_accelerate_interpolator_slope_set(obj:PEo; slope:Tdouble);cdecl;external;
{*
 * @brief Customize the acceleration effect.
 *
 * @param[in] obj The object.
 *
 * @return How steep is the effect. <tt>0</tt> performs a linear
 * interpolation, <tt>1</tt> corresponds to a sinus function and higher
 * numbers produce an increasingly steep effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Accelerate_Interpolator
  }
(* Const before type ignored *)
function efl_accelerate_interpolator_slope_get(obj:PEo):Tdouble;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCELERATE_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_ACCELERATE_INTERPOLATOR_CLASS:=efl_accelerate_interpolator_class_get;
  end;


end.
