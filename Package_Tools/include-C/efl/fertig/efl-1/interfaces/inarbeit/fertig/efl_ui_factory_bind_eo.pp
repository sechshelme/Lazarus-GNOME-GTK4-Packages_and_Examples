
unit efl_ui_factory_bind_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_factory_bind_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_factory_bind_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Factory  = ^Efl_Ui_Factory;
PEfl_Ui_Factory_Bind  = ^Efl_Ui_Factory_Bind;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FACTORY_BIND_EO_H_}
{$define _EFL_UI_FACTORY_BIND_EO_H_}
{$ifndef _EFL_UI_FACTORY_BIND_EO_CLASS_TYPE}
{$define _EFL_UI_FACTORY_BIND_EO_CLASS_TYPE}
type
  PEfl_Ui_Factory_Bind = ^TEfl_Ui_Factory_Bind;
  TEfl_Ui_Factory_Bind = TEo;
{$endif}
{$ifndef _EFL_UI_FACTORY_BIND_EO_TYPES}
{$define _EFL_UI_FACTORY_BIND_EO_TYPES}
{$endif}
{* Efl UI Property interface. view object can have @ref Efl_Model and need to
 * set cotent with those model stored data. the interface can help binding the
 * factory to create object with model property data. see @ref Efl_Model see
 * @ref Efl_Ui_Factory
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory_Bind
  }

{ was #define dname def_expr }
function EFL_UI_FACTORY_BIND_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_factory_bind_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief bind the factory with the given key string. when the data is ready or
 * changed, factory create the object and bind the data to the key action and
 * process promised work. Note: the input @ref Efl_Ui_Factory need to be
 * @ref efl_ui_property_bind at least once.
 *
 * @param[in] obj The object.
 * @param[in] key Key string for bind model property data
 * @param[in] factory @ref Efl_Ui_Factory for create and bind model property
 * data
 *
 * @return 0 when it succeed, an error code otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory_Bind
  }
(* Const before type ignored *)
function efl_ui_factory_bind(obj:PEo; key:Pchar; factory:PEfl_Ui_Factory):TEina_Error;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FACTORY_BIND_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_FACTORY_BIND_INTERFACE:=efl_ui_factory_bind_interface_get;
  end;


end.
