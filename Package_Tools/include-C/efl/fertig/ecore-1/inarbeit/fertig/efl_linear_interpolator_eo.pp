
unit efl_linear_interpolator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_linear_interpolator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_linear_interpolator_eo.h
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
PEfl_Linear_Interpolator  = ^Efl_Linear_Interpolator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LINEAR_INTERPOLATOR_EO_H_}
{$define _EFL_LINEAR_INTERPOLATOR_EO_H_}
{$ifndef _EFL_LINEAR_INTERPOLATOR_EO_CLASS_TYPE}
{$define _EFL_LINEAR_INTERPOLATOR_EO_CLASS_TYPE}
type
  PEfl_Linear_Interpolator = ^TEfl_Linear_Interpolator;
  TEfl_Linear_Interpolator = TEo;
{$endif}
{$ifndef _EFL_LINEAR_INTERPOLATOR_EO_TYPES}
{$define _EFL_LINEAR_INTERPOLATOR_EO_TYPES}
{$endif}
{* Linear interpolation (pass-through). Input values are used unmodified as
 * output.
 *
 * @since 1.24
 *
 * @ingroup Efl_Linear_Interpolator
  }

{ was #define dname def_expr }
function EFL_LINEAR_INTERPOLATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_linear_interpolator_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LINEAR_INTERPOLATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_LINEAR_INTERPOLATOR_CLASS:=efl_linear_interpolator_class_get;
  end;


end.
