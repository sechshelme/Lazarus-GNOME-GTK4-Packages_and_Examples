
unit efl_generic_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_generic_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_generic_model_eo.h
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
PEfl_Generic_Model  = ^Efl_Generic_Model;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GENERIC_MODEL_EO_H_}
{$define _EFL_GENERIC_MODEL_EO_H_}
{$ifndef _EFL_GENERIC_MODEL_EO_CLASS_TYPE}
{$define _EFL_GENERIC_MODEL_EO_CLASS_TYPE}
type
  PEfl_Generic_Model = ^TEfl_Generic_Model;
  TEfl_Generic_Model = TEo;
{$endif}
{$ifndef _EFL_GENERIC_MODEL_EO_TYPES}
{$define _EFL_GENERIC_MODEL_EO_TYPES}
{$endif}
{*
 * @brief Generic model that allows any property to be manually set. Also
 * children of the same type can be added and deleted.
 *
 * Intended to be used in scenarios where the user needs a manually defined
 * data model, like in tests.
 *
 * It does not model anything in particular and does not affect anything else
 * in the system.
 *
 * @since 1.23
 *
 * @ingroup Efl_Generic_Model
  }

{ was #define dname def_expr }
function EFL_GENERIC_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_generic_model_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GENERIC_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_GENERIC_MODEL_CLASS:=efl_generic_model_class_get;
  end;


end.
