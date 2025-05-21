
unit ecore_event_message_handler_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_event_message_handler_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_event_message_handler_eo.h
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
PEcore_Event_Message  = ^Ecore_Event_Message;
PEcore_Event_Message_Handler  = ^Ecore_Event_Message_Handler;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_EVENT_MESSAGE_HANDLER_EO_H_}
{$define _ECORE_EVENT_MESSAGE_HANDLER_EO_H_}
{$ifndef _ECORE_EVENT_MESSAGE_HANDLER_EO_CLASS_TYPE}
{$define _ECORE_EVENT_MESSAGE_HANDLER_EO_CLASS_TYPE}
type
  PEcore_Event_Message_Handler = ^TEcore_Event_Message_Handler;
  TEcore_Event_Message_Handler = TEo;
{$endif}
{$ifndef _ECORE_EVENT_MESSAGE_HANDLER_EO_TYPES}
{$define _ECORE_EVENT_MESSAGE_HANDLER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* For Legacy API usage Only This class is rather hacky/messy as it's really
 * internal glue to handle legacy ecore events alongside the new loop message
 * stuff merged together. This is ugly as it's internal only to quickly glue
 * things together and is destined for death in EFL 2.0 or when we dump legacy.
 *
 * @ingroup Ecore_Event_Message_Handler
  }

{ was #define dname def_expr }
function ECORE_EVENT_MESSAGE_HANDLER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_event_message_handler_class_get:PEfl_Class;cdecl;external;
{*
 * @brief No description supplied.
 *
 * @param[in] obj The object.
 *
 * @return No description supplied.
 *
 * @ingroup Ecore_Event_Message_Handler
  }
function ecore_event_message_handler_message_type_add(obj:PEo):PEcore_Event_Message;cdecl;external;
{*
 * @brief No description supplied.
 *
 * @param[in] obj The object.
 *
 * @return No description supplied.
 *
 * @ingroup Ecore_Event_Message_Handler
  }
function ecore_event_message_handler_type_new(obj:PEo):longint;cdecl;external;
{*
 * @brief Legacy list of callback handlers so they can return false
 *
 * @param[in] obj The object.
 * @param[in] type
 * @param[in] func
 * @param[in] data
 *
 * @return Lazy return handle
 *
 * @ingroup Ecore_Event_Message_Handler
  }
function ecore_event_message_handler_add(obj:PEo; _type:longint; func:pointer; data:pointer):pointer;cdecl;external;
{*
 * @brief Legacy list of callback handlers so they can return false
 *
 * @param[in] obj The object.
 * @param[in] type
 * @param[in] func
 * @param[in] data
 *
 * @return Lazy return handle
 *
 * @ingroup Ecore_Event_Message_Handler
  }
function ecore_event_message_handler_prepend(obj:PEo; _type:longint; func:pointer; data:pointer):pointer;cdecl;external;
function ecore_event_message_handler_del(obj:PEo; handler:pointer):pointer;cdecl;external;
function ecore_event_message_handler_data_get(obj:PEo; handler:pointer):pointer;cdecl;external;
function ecore_event_message_handler_data_set(obj:PEo; handler:pointer; data:pointer):pointer;cdecl;external;
{*
 * @brief Legacy event filter
 *
 * @param[in] obj The object.
 * @param[in] func_start
 * @param[in] func_filter
 * @param[in] func_end
 * @param[in] data
 *
 * @return Lazy return filter handle
 *
 * @ingroup Ecore_Event_Message_Handler
  }
function ecore_event_message_handler_filter_add(obj:PEo; func_start:pointer; func_filter:pointer; func_end:pointer; data:pointer):pointer;cdecl;external;
function ecore_event_message_handler_filter_del(obj:PEo; filter:pointer):pointer;cdecl;external;
function ecore_event_message_handler_current_type_get(obj:PEo):longint;cdecl;external;
function ecore_event_message_handler_current_event_get(obj:PEo):pointer;cdecl;external;
procedure ecore_event_message_handler_type_flush(obj:PEo; _type:longint);cdecl;external;
(* Const before type ignored *)
  var
    _ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT : TEfl_Event_Description;cvar;external;
{* Sample - override this
 * @return Ecore_Event_Message *
 *
 * @ingroup Ecore_Event_Message_Handler
  }

{ was #define dname def_expr }
function ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_EVENT_MESSAGE_HANDLER_CLASS : longint; { return type might be wrong }
  begin
    ECORE_EVENT_MESSAGE_HANDLER_CLASS:=ecore_event_message_handler_class_get;
  end;

{ was #define dname def_expr }
function ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT : longint; { return type might be wrong }
  begin
    ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT:=@(_ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT);
  end;


end.
