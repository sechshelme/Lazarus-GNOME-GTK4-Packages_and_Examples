
unit efl_loop_message_future_handler_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_message_future_handler_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_message_future_handler_eo.h
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
PEfl_Loop_Message_Future  = ^Efl_Loop_Message_Future;
PEfl_Loop_Message_Future_Handler  = ^Efl_Loop_Message_Future_Handler;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EO_H_}
{$define _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EO_H_}
{$ifndef _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EO_CLASS_TYPE}
{$define _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EO_CLASS_TYPE}
type
  PEfl_Loop_Message_Future_Handler = ^TEfl_Loop_Message_Future_Handler;
  TEfl_Loop_Message_Future_Handler = TEo;
{$endif}
{$ifndef _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EO_TYPES}
{$define _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Internal use for future on an efl loop - replacing legacy ecore events
 *
 * @ingroup Efl_Loop_Message_Future_Handler
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_FUTURE_HANDLER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_message_future_handler_class_get:PEfl_Class;cdecl;external;
{*
 * @brief No description supplied.
 *
 * @param[in] obj The object.
 *
 * @return No description supplied.
 *
 * @ingroup Efl_Loop_Message_Future_Handler
  }
function efl_loop_message_future_handler_message_type_add(obj:PEo):PEfl_Loop_Message_Future;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE : TEfl_Event_Description;cvar;external;
{* No description supplied.
 * @return Efl_Loop_Message_Future *
 *
 * @ingroup Efl_Loop_Message_Future_Handler
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_FUTURE_HANDLER_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_FUTURE_HANDLER_CLASS:=efl_loop_message_future_handler_class_get;
  end;

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE:=@(_EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE);
  end;


end.
