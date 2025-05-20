
unit efl_ui_factory_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_factory_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_factory_eo.h
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
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Model  = ^Efl_Model;
PEfl_Ui_Factory  = ^Efl_Ui_Factory;
PEfl_Ui_Factory_Item_Created_Event  = ^Efl_Ui_Factory_Item_Created_Event;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FACTORY_EO_H_}
{$define _EFL_UI_FACTORY_EO_H_}
{$ifndef _EFL_UI_FACTORY_EO_CLASS_TYPE}
{$define _EFL_UI_FACTORY_EO_CLASS_TYPE}
type
  PEfl_Ui_Factory = ^TEfl_Ui_Factory;
  TEfl_Ui_Factory = TEo;
{$endif}
{$ifndef _EFL_UI_FACTORY_EO_TYPES}
{$define _EFL_UI_FACTORY_EO_TYPES}
{* EFL UI Factory event structure provided when an item was just created.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory_Item_Created_Event
  }
{*< The model already set on the new item.
                     *
                     * @since 1.23  }
{*< The item that was just created.
                         *
                         * @since 1.23  }
type
  PEfl_Ui_Factory_Item_Created_Event = ^TEfl_Ui_Factory_Item_Created_Event;
  TEfl_Ui_Factory_Item_Created_Event = record
      model : PEfl_Model;
      item : PEfl_Gfx_Entity;
    end;
{$endif}
{*
 * @brief Interface for factory-pattern object creation.
 *
 * This object represents a Factory in the factory pattern. Objects should be
 * created via the method @ref efl_ui_view_factory_create_with_event, which
 * will in turn call the necessary APIs from this interface. Objects created
 * this way should be removed using @ref efl_ui_factory_release.
 *
 * It is recommended to not create your own @ref Efl_Ui_Factory and use event
 * handler as much as possible.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }

{ was #define dname def_expr }
function EFL_UI_FACTORY_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_factory_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_UI_FACTORY_PROTECTED}
{*
 * @brief Create a UI object from the necessary properties in the specified
 * model.
 *
 * @note This is the function you need to implement for a custom factory, but
 * if you want to use a factory, you should rely on
 * @ref efl_ui_view_factory_create_with_event.
 *
 * @param[in] obj The object.
 * @param[in] models Efl iterator providing the model to be associated to the
 * new item. It should remain valid until the end of the function call.
 *
 * @return Created UI object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }
function efl_ui_factory_create(obj:PEo; models:PEina_Iterator):PEina_Future;cdecl;external;
{$endif}
{*
 * @brief Release a UI object and disconnect from models.
 *
 * @param[in] obj The object.
 * @param[in] ui_views Object to remove.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }

procedure efl_ui_factory_release(obj:PEo; ui_views:PEina_Iterator);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING : TEfl_Event_Description;cvar;external;
{* Event emitted when an item is under construction (between the
 * @ref efl_constructor and @ref efl_finalize call on the item). Note: If the
 * @ref Efl_Ui_Factory keeps a cache of objects, this won't be called when
 * objects are pulled from the cache.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }
(* Const before type ignored *)
    _EFL_UI_FACTORY_EVENT_ITEM_BUILDING : TEfl_Event_Description;cvar;external;
{* Event emitted when an item has processed @ref efl_finalize, but before all
 * the factory are done building it. Note: If the @ref Efl_Ui_Factory keeps a
 * cache of objects, this will be called when objects are pulled from the
 * cache.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }
(* Const before type ignored *)
    _EFL_UI_FACTORY_EVENT_ITEM_CREATED : TEfl_Event_Description;cvar;external;
{* Event emitted when an item has been successfully created by the factory and
 * is about to be used by an @ref Efl_Ui_View.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }
(* Const before type ignored *)
    _EFL_UI_FACTORY_EVENT_ITEM_RELEASING : TEfl_Event_Description;cvar;external;
{* Event emitted when an item is being released by the @ref Efl_Ui_Factory. It
 * must be assumed that after this call, the object can be recycles to another
 * @ref Efl_Ui_View and there can be more than one call for the same item.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Factory
  }

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_BUILDING : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_CREATED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_RELEASING : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FACTORY_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_FACTORY_INTERFACE:=efl_ui_factory_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING : longint; { return type might be wrong }
  begin
    EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING:=@(_EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING);
  end;

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_BUILDING : longint; { return type might be wrong }
  begin
    EFL_UI_FACTORY_EVENT_ITEM_BUILDING:=@(_EFL_UI_FACTORY_EVENT_ITEM_BUILDING);
  end;

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_CREATED : longint; { return type might be wrong }
  begin
    EFL_UI_FACTORY_EVENT_ITEM_CREATED:=@(_EFL_UI_FACTORY_EVENT_ITEM_CREATED);
  end;

{ was #define dname def_expr }
function EFL_UI_FACTORY_EVENT_ITEM_RELEASING : longint; { return type might be wrong }
  begin
    EFL_UI_FACTORY_EVENT_ITEM_RELEASING:=@(_EFL_UI_FACTORY_EVENT_ITEM_RELEASING);
  end;


end.
