
unit efl_spring_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_spring_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_spring_interpolator_eo.h
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
PEfl_Spring_Interpolator  = ^Efl_Spring_Interpolator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_SPRING_INTERPOLATOR_EO_H_}
{$define _EFL_SPRING_INTERPOLATOR_EO_H_}
{$ifndef _EFL_SPRING_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_SPRING_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Spring_Interpolator = ^TEfl_Spring_Interpolator;
  TEfl_Spring_Interpolator = TEo;
{$endif}
{$ifndef _EFL_SPRING_INTERPOLATOR_EO_TYPES}
{$define _EFL_SPRING_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Spring interpolator. The value quickly reaches <tt>1.0</tt> and
 * then oscillates around it a number of times before stopping (as if linked
 * with a spring).
 *
 * The number of oscillations and how quickly it stops can be customized.
 *
 * @since 1.24
 *
 * @ingroup Efl_Spring_Interpolator
  }

{ was #define dname def_expr }
function EFL_SPRING_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_spring_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Customize the decay factor.
 *
 * @param[in] obj The object.
 * @param[in] decay How quickly energy is lost. Higher numbers result in
 * smaller oscillations.
 *
 * @since 1.24
 *
 * @ingroup Efl_Spring_Interpolator
  }
procedure efl_spring_interpolator_decay_set(obj:PEo; decay:Tdouble);cdecl;external;
{*
 * @brief Customize the decay factor.
 *
 * @param[in] obj The object.
 *
 * @return How quickly energy is lost. Higher numbers result in smaller
 * oscillations.
 *
 * @since 1.24
 *
 * @ingroup Efl_Spring_Interpolator
  }
(* Const before type ignored *)
function efl_spring_interpolator_decay_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Customize number of oscillations.
 *
 * @param[in] obj The object.
 * @param[in] oscillations Number of oscillations before stopping.
 *
 * @since 1.24
 *
 * @ingroup Efl_Spring_Interpolator
  }
procedure efl_spring_interpolator_oscillations_set(obj:PEo; oscillations:longint);cdecl;external;
{*
 * @brief Customize number of oscillations.
 *
 * @param[in] obj The object.
 *
 * @return Number of oscillations before stopping.
 *
 * @since 1.24
 *
 * @ingroup Efl_Spring_Interpolator
  }
(* Const before type ignored *)
function efl_spring_interpolator_oscillations_get(obj:PEo):longint;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_SPRING_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_SPRING_INTERPOLATOR_CLASS:=efl_spring_interpolator_class_get;
  end;


end.
