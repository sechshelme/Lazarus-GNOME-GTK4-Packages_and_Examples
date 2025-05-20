
unit efl_ui_view_factory_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_view_factory_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_view_factory_eo.h
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
PEfl_Ui_Factory  = ^Efl_Ui_Factory;
PEfl_Ui_View_Factory  = ^Efl_Ui_View_Factory;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_VIEW_FACTORY_EO_H_}
{$define _EFL_UI_VIEW_FACTORY_EO_H_}
{$ifndef _EFL_UI_VIEW_FACTORY_EO_CLASS_TYPE}
{$define _EFL_UI_VIEW_FACTORY_EO_CLASS_TYPE}
type
  PEfl_Ui_View_Factory = ^TEfl_Ui_View_Factory;
  TEfl_Ui_View_Factory = TEo;
{$endif}
{$ifndef _EFL_UI_VIEW_FACTORY_EO_TYPES}
{$define _EFL_UI_VIEW_FACTORY_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This class provide a utility function that class that wish to use
 * @ref efl_ui_factory_create should use.
 *
 * @ingroup Efl_Ui_View_Factory
  }

{ was #define dname def_expr }
function EFL_UI_VIEW_FACTORY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_view_factory_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Create a UI object from the necessary properties in the specified
 * model and generate the created event on the factory when the object is done
 * building. This function must be use by all @ref Efl_Ui_View that need to
 * create object. They should not use @ref efl_ui_factory_create directly.
 *
 * @param[in] factory The factory to use for requesting the new object from and
 * generating the created event onto.
 * @param[in] models Efl iterator providing the model to be associated to the
 * new item. It should remain valid until the end of the function call.
 *
 * @return Created UI object
 *
 * @ingroup Efl_Ui_View_Factory
  }
function efl_ui_view_factory_create_with_event(factory:PEfl_Ui_Factory; models:PEina_Iterator):PEina_Future;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_VIEW_FACTORY_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_VIEW_FACTORY_CLASS:=efl_ui_view_factory_class_get;
  end;


end.
