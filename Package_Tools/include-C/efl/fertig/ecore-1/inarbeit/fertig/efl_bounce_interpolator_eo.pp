
unit efl_bounce_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_bounce_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_bounce_interpolator_eo.h
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
PEfl_Bounce_Interpolator  = ^Efl_Bounce_Interpolator;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_BOUNCE_INTERPOLATOR_EO_H_}
{$define _EFL_BOUNCE_INTERPOLATOR_EO_H_}
{$ifndef _EFL_BOUNCE_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_BOUNCE_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Bounce_Interpolator = ^TEfl_Bounce_Interpolator;
  TEfl_Bounce_Interpolator = TEo;
{$endif}
{$ifndef _EFL_BOUNCE_INTERPOLATOR_EO_TYPES}
{$define _EFL_BOUNCE_INTERPOLATOR_EO_TYPES}
{$endif}
{*
 * @brief Bouncing interpolator. The value quickly reaches <tt>1.0</tt>
 * and then bounces back a number of times before stopping at <tt>1.0</tt>
 * .
 *
 * The number of bounces and how far it goes back on every bounce can be
 * customized.
 *
 * @since 1.24
 *
 * @ingroup Efl_Bounce_Interpolator
  }

{ was #define dname def_expr }
function EFL_BOUNCE_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_bounce_interpolator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Customize the number of bounces.
 *
 * @param[in] obj The object.
 * @param[in] bounces Number of bounces before stopping.
 *
 * @since 1.24
 *
 * @ingroup Efl_Bounce_Interpolator
  }
procedure efl_bounce_interpolator_bounces_set(obj:PEo; bounces:longint);cdecl;external;
{*
 * @brief Customize the number of bounces.
 *
 * @param[in] obj The object.
 *
 * @return Number of bounces before stopping.
 *
 * @since 1.24
 *
 * @ingroup Efl_Bounce_Interpolator
  }
(* Const before type ignored *)
function efl_bounce_interpolator_bounces_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Customize the rigidness.
 *
 * @param[in] obj The object.
 * @param[in] rigidness How much energy is lost on every bounce. Higher numbers
 * result in smaller bounces (lesser bounciness).
 *
 * @since 1.24
 *
 * @ingroup Efl_Bounce_Interpolator
  }
procedure efl_bounce_interpolator_rigidness_set(obj:PEo; rigidness:Tdouble);cdecl;external;
{*
 * @brief Customize the rigidness.
 *
 * @param[in] obj The object.
 *
 * @return How much energy is lost on every bounce. Higher numbers result in
 * smaller bounces (lesser bounciness).
 *
 * @since 1.24
 *
 * @ingroup Efl_Bounce_Interpolator
  }
(* Const before type ignored *)
function efl_bounce_interpolator_rigidness_get(obj:PEo):Tdouble;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_BOUNCE_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_BOUNCE_INTERPOLATOR_CLASS:=efl_bounce_interpolator_class_get;
  end;


end.
