
unit eldbus_model_signal_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_signal_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_signal_eo.h
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
PEldbus_Introspection_Signal  = ^Eldbus_Introspection_Signal;
PEldbus_Model_Signal  = ^Eldbus_Model_Signal;
PEldbus_Proxy  = ^Eldbus_Proxy;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_SIGNAL_EO_H_}
{$define _ELDBUS_MODEL_SIGNAL_EO_H_}
{$ifndef _ELDBUS_MODEL_SIGNAL_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_SIGNAL_EO_CLASS_TYPE}
type
  PEldbus_Model_Signal = ^TEldbus_Model_Signal;
  TEldbus_Model_Signal = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_SIGNAL_EO_TYPES}
{$define _ELDBUS_MODEL_SIGNAL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Eldbus model signal class
 *
 * @ingroup Eldbus_Model_Signal
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_SIGNAL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_signal_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Custom Eldbus_Model_Signal constructor.
 *
 * @param[in] obj The object.
 * @param[in] proxy Eldbus proxy
 * @param[in] signal The introspected method
 *
 * @since 1.16
 *
 * @ingroup Eldbus_Model_Signal
  }
(* Const before type ignored *)
procedure eldbus_model_signal_constructor(obj:PEo; proxy:PEldbus_Proxy; signal:PEldbus_Introspection_Signal);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_SIGNAL_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_SIGNAL_CLASS:=eldbus_model_signal_class_get;
  end;


end.
