
unit efl_loop_message_future_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_message_future_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_message_future_eo.h
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
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_MESSAGE_FUTURE_EO_H_}
{$define _EFL_LOOP_MESSAGE_FUTURE_EO_H_}
{$ifndef _EFL_LOOP_MESSAGE_FUTURE_EO_CLASS_TYPE}
{$define _EFL_LOOP_MESSAGE_FUTURE_EO_CLASS_TYPE}
type
  PEfl_Loop_Message_Future = ^TEfl_Loop_Message_Future;
  TEfl_Loop_Message_Future = TEo;
{$endif}
{$ifndef _EFL_LOOP_MESSAGE_FUTURE_EO_TYPES}
{$define _EFL_LOOP_MESSAGE_FUTURE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Used internally for futures on the loop
 *
 * @ingroup Efl_Loop_Message_Future
  }

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_FUTURE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_message_future_class_get:PEfl_Class;cdecl;external;
{*
 * @brief No description supplied.
 *
 * @param[in] obj The object.
 * @param[in] data No description supplied.
 *
 * @ingroup Efl_Loop_Message_Future
  }
procedure efl_loop_message_future_data_set(obj:PEo; data:pointer);cdecl;external;
{*
 * @brief No description supplied.
 *
 * @param[in] obj The object.
 *
 * @return No description supplied.
 *
 * @ingroup Efl_Loop_Message_Future
  }
(* Const before type ignored *)
function efl_loop_message_future_data_get(obj:PEo):pointer;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_MESSAGE_FUTURE_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_MESSAGE_FUTURE_CLASS:=efl_loop_message_future_class_get;
  end;


end.
