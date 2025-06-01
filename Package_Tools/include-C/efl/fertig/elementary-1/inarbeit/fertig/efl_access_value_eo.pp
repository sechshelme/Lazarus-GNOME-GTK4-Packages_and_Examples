
unit efl_access_value_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_value_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_value_eo.h
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
Pchar  = ^char;
Pdouble  = ^double;
PEfl_Access_Value  = ^Efl_Access_Value;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_VALUE_EO_H_}
{$define _EFL_ACCESS_VALUE_EO_H_}
{$ifndef _EFL_ACCESS_VALUE_EO_CLASS_TYPE}
{$define _EFL_ACCESS_VALUE_EO_CLASS_TYPE}
type
  PEfl_Access_Value = ^TEfl_Access_Value;
  TEfl_Access_Value = TEo;
{$endif}
{$ifndef _EFL_ACCESS_VALUE_EO_TYPES}
{$define _EFL_ACCESS_VALUE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary Access value interface
 *
 * @ingroup Efl_Access_Value
  }

{ was #define dname def_expr }
function EFL_ACCESS_VALUE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_value_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_VALUE_PROTECTED}
{*
 * @brief Value and text displayed bye accessible widget.
 *
 * @param[in] obj The object.
 * @param[in] value Value of widget casted to floating point number.
 * @param[in] text string describing value in given context eg. small, enough
 *
 * @return @c true if setting widgets value has succeeded, otherwise @c false .
 *
 * @ingroup Efl_Access_Value
  }
(* Const before type ignored *)
function efl_access_value_and_text_set(obj:PEo; value:Tdouble; text:Pchar):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_VALUE_PROTECTED}
{*
 * @brief Value and text displayed bye accessible widget.
 *
 * @param[in] obj The object.
 * @param[out] value Value of widget casted to floating point number.
 * @param[out] text string describing value in given context eg. small, enough
 *
 * @ingroup Efl_Access_Value
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure efl_access_value_and_text_get(obj:PEo; value:Pdouble; text:PPchar);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_VALUE_PROTECTED}
{*
 * @brief The range of all possible values and its description
 *
 * @param[in] obj The object.
 * @param[out] lower_limit Lower limit of the range
 * @param[out] upper_limit Upper limit of the range
 * @param[out] description Description of the range
 *
 * @ingroup Efl_Access_Value
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure efl_access_value_range_get(obj:PEo; lower_limit:Pdouble; upper_limit:Pdouble; description:PPchar);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_VALUE_PROTECTED}
{*
 * @brief Gets an minimal incrementation value
 *
 * @param[in] obj The object.
 *
 * @return Minimal incrementation value
 *
 * @ingroup Efl_Access_Value
  }
(* Const before type ignored *)

function efl_access_value_increment_get(obj:PEo):Tdouble;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_VALUE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_ACCESS_VALUE_INTERFACE:=efl_access_value_interface_get;
  end;


end.
