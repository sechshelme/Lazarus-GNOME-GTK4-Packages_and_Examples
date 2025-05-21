
unit ecore_event_message_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_event_message_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_event_message_eo.h
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
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_EVENT_MESSAGE_EO_H_}
{$define _ECORE_EVENT_MESSAGE_EO_H_}
{$ifndef _ECORE_EVENT_MESSAGE_EO_CLASS_TYPE}
{$define _ECORE_EVENT_MESSAGE_EO_CLASS_TYPE}
type
  PEcore_Event_Message = ^TEcore_Event_Message;
  TEcore_Event_Message = TEo;
{$endif}
{$ifndef _ECORE_EVENT_MESSAGE_EO_TYPES}
{$define _ECORE_EVENT_MESSAGE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* For Legacy API usage Only. Legacy Ecore Events
 *
 * @ingroup Ecore_Event_Message
  }

{ was #define dname def_expr }
function ECORE_EVENT_MESSAGE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_event_message_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Property of the legacy event - set and get it
 *
 * @param[in] obj The object.
 * @param[in] type The event type
 * @param[in] data The event data
 * @param[in] free_func Being lazy for legacy
 * @param[in] free_data Free func data
 *
 * @ingroup Ecore_Event_Message
  }
procedure ecore_event_message_data_set(obj:PEo; _type:longint; data:pointer; free_func:pointer; free_data:pointer);cdecl;external;
{*
 * @brief Property of the legacy event - set and get it
 *
 * @param[in] obj The object.
 * @param[out] type The event type
 * @param[out] data The event data
 * @param[out] free_func Being lazy for legacy
 * @param[out] free_data Free func data
 *
 * @ingroup Ecore_Event_Message
  }
(* Const before type ignored *)
procedure ecore_event_message_data_get(obj:PEo; _type:Plongint; data:Ppointer; free_func:Ppointer; free_data:Ppointer);cdecl;external;
{*
 * @brief Steal the data out and set internal values to -1 for type and @c NULL
 * for other vals
 *
 * @param[in] obj The object.
 * @param[out] type The event type
 * @param[out] data The event data
 * @param[out] free_func Being lazy for legacy
 * @param[out] free_data Free func data
 *
 * @ingroup Ecore_Event_Message
  }
procedure ecore_event_message_data_steal(obj:PEo; _type:Plongint; data:Ppointer; free_func:Ppointer; free_data:Ppointer);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_EVENT_MESSAGE_CLASS : longint; { return type might be wrong }
  begin
    ECORE_EVENT_MESSAGE_CLASS:=ecore_event_message_class_get;
  end;


end.
