
unit efl_model_provider_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_model_provider_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_model_provider_eo.h
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
PEfl_Model_Provider  = ^Efl_Model_Provider;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_MODEL_PROVIDER_EO_H_}
{$define _EFL_MODEL_PROVIDER_EO_H_}
{$ifndef _EFL_MODEL_PROVIDER_EO_CLASS_TYPE}
{$define _EFL_MODEL_PROVIDER_EO_CLASS_TYPE}
type
  PEfl_Model_Provider = ^TEfl_Model_Provider;
  TEfl_Model_Provider = TEo;
{$endif}
{$ifndef _EFL_MODEL_PROVIDER_EO_TYPES}
{$define _EFL_MODEL_PROVIDER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief EFL object that provide a model to all.
 *
 * You can use this when you would otherwise have to call
 * @ref efl_ui_view_model_set on multiple widgets by registering this object
 * using @ref efl_provider_register on a parent that they all depends on.
 *
 * @ingroup Efl_Model_Provider
  }

{ was #define dname def_expr }
function EFL_MODEL_PROVIDER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_model_provider_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_MODEL_PROVIDER_CLASS : longint; { return type might be wrong }
  begin
    EFL_MODEL_PROVIDER_CLASS:=efl_model_provider_class_get;
  end;


end.
