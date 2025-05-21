
unit efl_divisor_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_divisor_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_divisor_interpolator_eo.h
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
PEfl_Divisor_Interpolator  = ^Efl_Divisor_Interpolator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_DIVISOR_INTERPOLATOR_EO_H_}
{$define _EFL_DIVISOR_INTERPOLATOR_EO_H_}
{$ifndef _EFL_DIVISOR_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_DIVISOR_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Divisor_Interpolator = ^TEfl_Divisor_Interpolator;
  TEfl_Divisor_Interpolator = TEo;
{$endif}
{$ifndef _EFL_DIVISOR_INTERPOLATOR_EO_TYPES}
{$define _EFL_DIVISOR_INTERPOLATOR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Divisor interpolator.
 *
 * @ingroup Efl_Divisor_Interpolator
  }

{ was #define dname def_expr }
function EFL_DIVISOR_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_divisor_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Customize divisor factor.
 *
 * @param[in] obj The object.
 * @param[in] divisor Divisor.
 *
 * @ingroup Efl_Divisor_Interpolator
  }
procedure efl_divisor_interpolator_divisor_set(obj:PEo; divisor:Tdouble);cdecl;external;
{*
 * @brief Customize divisor factor.
 *
 * @param[in] obj The object.
 *
 * @return Divisor.
 *
 * @ingroup Efl_Divisor_Interpolator
  }
(* Const before type ignored *)
function efl_divisor_interpolator_divisor_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Customize power factor.
 *
 * @param[in] obj The object.
 * @param[in] power Exponent.
 *
 * @ingroup Efl_Divisor_Interpolator
  }
procedure efl_divisor_interpolator_power_set(obj:PEo; power:longint);cdecl;external;
{*
 * @brief Customize power factor.
 *
 * @param[in] obj The object.
 *
 * @return Exponent.
 *
 * @ingroup Efl_Divisor_Interpolator
  }
(* Const before type ignored *)
function efl_divisor_interpolator_power_get(obj:PEo):longint;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_DIVISOR_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_DIVISOR_INTERPOLATOR_CLASS:=efl_divisor_interpolator_class_get;
  end;


end.
