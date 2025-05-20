
unit efl_ui_property_bind_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_property_bind_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_property_bind_eo.h
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
PEfl_Ui_Property_Bind  = ^Efl_Ui_Property_Bind;
PEfl_Ui_Property_Event  = ^Efl_Ui_Property_Event;
PEina_Array  = ^Eina_Array;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PROPERTY_BIND_EO_H_}
{$define _EFL_UI_PROPERTY_BIND_EO_H_}
{$ifndef _EFL_UI_PROPERTY_BIND_EO_CLASS_TYPE}
{$define _EFL_UI_PROPERTY_BIND_EO_CLASS_TYPE}
type
  PEfl_Ui_Property_Bind = ^TEfl_Ui_Property_Bind;
  TEfl_Ui_Property_Bind = TEo;
{$endif}
{$ifndef _EFL_UI_PROPERTY_BIND_EO_TYPES}
{$define _EFL_UI_PROPERTY_BIND_EO_TYPES}
{* EFL Ui property event data structure triggered when an object property
 * change due to the interaction on the object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Property_Event
  }
{*< List of changed properties
                                   *
                                   * @since 1.23  }
type
  PEfl_Ui_Property_Event = ^TEfl_Ui_Property_Event;
  TEfl_Ui_Property_Event = record
      changed_properties : PEina_Array;
    end;
{$endif}
{* Efl UI Property_Bind interface. view object can have @ref Efl_Model to
 * manage the data, the interface can help loading and tracking child data from
 * the model property. see @ref Efl_Model see @ref Efl_Ui_Factory
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Property_Bind
  }

{ was #define dname def_expr }
function EFL_UI_PROPERTY_BIND_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_property_bind_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief bind property data with the given key string. when the data is ready
 * or changed, bind the data to the key action and process promised work.
 *
 * @param[in] obj The object.
 * @param[in] key key string for bind model property data
 * @param[in] property Model property name
 *
 * @return 0 when it succeed, an error code otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Property_Bind
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_property_bind(obj:PEo; key:Pchar; _property:Pchar):TEina_Error;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED : TEfl_Event_Description;cvar;external;
{* Event dispatched when a property on the object has changed due to a user
 * interaction on the object that a model could be interested in.
 * @return Efl_Ui_Property_Event
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Property_Bind
  }
(* Const before type ignored *)
    _EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND : TEfl_Event_Description;cvar;external;

{ was #define dname def_expr }
function EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED : longint; { return type might be wrong }

{* Event dispatched when a property on the object is bound to a model. This is
 * useful to avoid generating too many events.
 * @return Eina_Stringshare *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Property_Bind
  }
{ was #define dname def_expr }
function EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_PROPERTY_BIND_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_PROPERTY_BIND_INTERFACE:=efl_ui_property_bind_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED:=@(_EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND : longint; { return type might be wrong }
  begin
    EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND:=@(_EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND);
  end;


end.
