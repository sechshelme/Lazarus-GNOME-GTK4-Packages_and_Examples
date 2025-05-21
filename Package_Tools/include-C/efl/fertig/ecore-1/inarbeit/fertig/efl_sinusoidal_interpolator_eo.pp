
unit efl_sinusoidal_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_sinusoidal_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_sinusoidal_interpolator_eo.h
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
PEfl_Sinusoidal_Interpolator  = ^Efl_Sinusoidal_Interpolator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_SINUSOIDAL_INTERPOLATOR_EO_H_}
{$define _EFL_SINUSOIDAL_INTERPOLATOR_EO_H_}
{$ifndef _EFL_SINUSOIDAL_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_SINUSOIDAL_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Sinusoidal_Interpolator = ^TEfl_Sinusoidal_Interpolator;
  TEfl_Sinusoidal_Interpolator = TEo;
{$endif}
{$ifndef _EFL_SINUSOIDAL_INTERPOLATOR_EO_TYPES}
{$define _EFL_SINUSOIDAL_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Sinusoidal interpolator. It starts slow, then moves quickly and then
 * slows down again before stopping.
 *
 * How long it stays in the quick zone (the slope of the curve) can be
 * customized.
 *
 * @since 1.24
 *
 * @ingroup Efl_Sinusoidal_Interpolator
  }

{ was #define dname def_expr }
function EFL_SINUSOIDAL_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_sinusoidal_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Customize the sinusoidal effect.
 *
 * @param[in] obj The object.
 * @param[in] slope How steep is the effect. <tt>0</tt> performs a linear
 * interpolation, <tt>1</tt> corresponds to a sinus function and higher
 * numbers produce an increasingly steep effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Sinusoidal_Interpolator
  }
procedure efl_sinusoidal_interpolator_slope_set(obj:PEo; slope:Tdouble);cdecl;external;
{*
 * @brief Customize the sinusoidal effect.
 *
 * @param[in] obj The object.
 *
 * @return How steep is the effect. <tt>0</tt> performs a linear
 * interpolation, <tt>1</tt> corresponds to a sinus function and higher
 * numbers produce an increasingly steep effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Sinusoidal_Interpolator
  }
(* Const before type ignored *)
function efl_sinusoidal_interpolator_slope_get(obj:PEo):Tdouble;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_SINUSOIDAL_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_SINUSOIDAL_INTERPOLATOR_CLASS:=efl_sinusoidal_interpolator_class_get;
  end;


end.
