
unit efl_loop_message_handler_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_message_handler_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_message_handler_eo.h
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
PEfl_Loop_Message  = ^Efl_Loop_Message;
PEfl_Loop_Message_Handler  = ^Efl_Loop_Message_Handler;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_MESSAGE_HANDLER_EO_H_}
{$define _EFL_LOOP_MESSAGE_HANDLER_EO_H_}
{$ifndef _EFL_LOOP_MESSAGE_HANDLER_EO_CLASS_TYPE}
{$define _EFL_LOOP_MESSAGE_HANDLER_EO_CLASS_TYPE}
type
  PEfl_Loop_Message_Handler = ^TEfl_Loop_Message_Handler;
  TEfl_Loop_Message_Handler = TEo;
{$endif}
{$ifndef _EFL_LOOP_MESSAGE_HANDLER_EO_TYPES}
{$define _EFL_LOOP_MESSAGE_HANDLER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Message handlers represent a single message type on the Efl.Loop parent
 * object. These message handlers can be used to listen for that message type
 * by listening to the message event for the generic case or a class specific
 * event type to get specific message object typing correct.
 *
 * @ingroup Efl_Loop_Message_Handler
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_HANDLER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_message_handler_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Creates a new message object of the correct type for this message
 * type.
 *
 * @param[in] obj The object.
 *
 * @return The new message payload object.
 *
 * @ingroup Efl_Loop_Message_Handler
  }
function efl_loop_message_handler_message_add(obj:PEo):PEfl_Loop_Message;cdecl;external;
{*
 * @brief Place the message on the queue to be called later when
 * message_process() is called on the loop object.
 *
 * @param[in] obj The object.
 * @param[in] message The message to place on the queue.
 *
 * @ingroup Efl_Loop_Message_Handler
  }
procedure efl_loop_message_handler_message_send(obj:PEo; message:PEfl_Loop_Message);cdecl;external;
{*
 * @brief Overide me (implement) then call super after calling the right
 * callback type if you specialize the message type.
 *
 * @param[in] obj The object.
 * @param[in] message Generic message event type
 *
 * @ingroup Efl_Loop_Message_Handler
  }
procedure efl_loop_message_handler_message_call(obj:PEo; message:PEfl_Loop_Message);cdecl;external;
{*
 * @brief Delete all queued messages belonging to this message handler that are
 * pending on the queue so they are not processed later.
 *
 * @param[in] obj The object.
 *
 * @return True if any messages of this type were cleared.
 *
 * @ingroup Efl_Loop_Message_Handler
  }
function efl_loop_message_handler_message_clear(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE : TEfl_Event_Description;cvar;external;
{* The message payload data
 * @return Efl_Loop_Message *
 *
 * @ingroup Efl_Loop_Message_Handler
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_HANDLER_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_HANDLER_CLASS:=efl_loop_message_handler_class_get;
  end;

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE:=@(_EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE);
  end;


end.
