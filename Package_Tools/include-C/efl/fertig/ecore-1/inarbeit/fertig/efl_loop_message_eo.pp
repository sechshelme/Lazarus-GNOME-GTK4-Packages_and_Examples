
unit efl_loop_message_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_message_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_message_eo.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_MESSAGE_EO_H_}
{$define _EFL_LOOP_MESSAGE_EO_H_}
{$ifndef _EFL_LOOP_MESSAGE_EO_CLASS_TYPE}
{$define _EFL_LOOP_MESSAGE_EO_CLASS_TYPE}
type
  PEfl_Loop_Message = ^TEfl_Loop_Message;
  TEfl_Loop_Message = TEo;
{$endif}
{$ifndef _EFL_LOOP_MESSAGE_EO_TYPES}
{$define _EFL_LOOP_MESSAGE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Base message payload object class. Inherit this and extend for specific
 * message types.
 *
 * @ingroup Efl_Loop_Message
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_message_class_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_LOOP_MESSAGE_EVENT_MESSAGE : TEfl_Event_Description;cvar;external;
{* The message payload data
 * @return Efl_Loop_Message *
 *
 * @ingroup Efl_Loop_Message
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_EVENT_MESSAGE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_CLASS:=efl_loop_message_class_get;
  end;

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_EVENT_MESSAGE : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_EVENT_MESSAGE:=@(_EFL_LOOP_MESSAGE_EVENT_MESSAGE);
  end;


end.
