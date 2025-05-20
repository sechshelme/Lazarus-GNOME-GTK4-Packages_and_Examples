
unit efl_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_interpolator_eo.h
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
PEfl_Interpolator  = ^Efl_Interpolator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INTERPOLATOR_EO_H_}
{$define _EFL_INTERPOLATOR_EO_H_}
{$ifndef _EFL_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Interpolator = ^TEfl_Interpolator;
  TEfl_Interpolator = TEo;
{$endif}
{$ifndef _EFL_INTERPOLATOR_EO_TYPES}
{$define _EFL_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Interface providing interpolation capabilities.
 *
 * In the context of EFL, interpolation is defined as the mapping of values in
 * the <tt>0, 1</tt> range to another range (typically close).
 *
 * This is used for example in animations, where the timer moves linearly from
 * <tt>0.0</tt> to <tt>1.0</tt> but the property being animated can
 * accelerate, decelerate, bounce or even move slightly out-of-bounds and come
 * back.
 *
 * For example implementations see @ref Efl_Accelerate_Interpolator,
 * @ref Efl_Decelerate_Interpolator or @ref Efl_Bounce_Interpolator.
 *
 * @since 1.24
 *
 * @ingroup Efl_Interpolator
  }

{ was #define dname def_expr }
function EFL_INTERPOLATOR_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_interpolator_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Performs the mapping operation.
 *
 * @param[in] obj The object.
 * @param[in] progress Input value between <tt>0.0</tt> and
 * <tt>1.0</tt>. Values outside this range might yield unpredictable results.
 *
 * @return Output mapped value. Its range is unrestricted. In particular, it
 * might be outside the input <tt>0, 1</tt> range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Interpolator
  }
function efl_interpolator_interpolate(obj:PEo; progress:Tdouble):Tdouble;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INTERPOLATOR_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_INTERPOLATOR_INTERFACE:=efl_interpolator_interface_get;
  end;


end.
