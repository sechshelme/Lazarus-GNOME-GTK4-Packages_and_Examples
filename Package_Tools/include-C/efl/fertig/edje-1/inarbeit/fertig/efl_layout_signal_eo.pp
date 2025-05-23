
unit efl_layout_signal_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_layout_signal_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_layout_signal_eo.h
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
PEfl_Layout_Signal  = ^Efl_Layout_Signal;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LAYOUT_SIGNAL_EO_H_}
{$define _EFL_LAYOUT_SIGNAL_EO_H_}
{$ifndef _EFL_LAYOUT_SIGNAL_EO_CLASS_TYPE}
{$define _EFL_LAYOUT_SIGNAL_EO_CLASS_TYPE}
type
  PEfl_Layout_Signal = ^TEfl_Layout_Signal;
  TEfl_Layout_Signal = TEo;
{$endif}
{$ifndef _EFL_LAYOUT_SIGNAL_EO_TYPES}
{$define _EFL_LAYOUT_SIGNAL_EO_TYPES}
{* EflLayoutSignalCb function that is called when a specifc pair of
 * signal/emission is triggered
 *
 * @since 1.22
 *
 * @ingroup EflLayoutSignalCb
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEflLayoutSignalCb = procedure (data:pointer; object:PEfl_Layout_Signal; emission:Pchar; source:Pchar);cdecl;
{$endif}
{* Layouts asynchronous messaging and signaling interface.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Signal
  }

{ was #define dname def_expr }
function EFL_LAYOUT_SIGNAL_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_layout_signal_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Sends an (Edje) message to a given Edje object
 *
 * This function sends an Edje message to obj and to all of its child objects,
 * if it has any (swallowed objects are one kind of child object). Only a few
 * types are supported: - int, - float/double, - string/stringshare, - arrays
 * of int, float, double or strings.
 *
 * Messages can go both ways, from code to theme, or theme to code.
 *
 * The id argument as a form of code and theme defining a common interface on
 * message communication. One should define the same IDs on both code and EDC
 * declaration, to individualize messages (binding them to a given context).
 *
 * @param[in] obj The object.
 * @param[in] id A identification number for the message to be sent
 * @param[in] msg The message's payload
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Signal
  }
(* Const before type ignored *)
procedure efl_layout_signal_message_send(obj:PEo; id:longint; msg:TEina_Value);cdecl;external;
{*
 * @brief Adds a callback for an arriving Edje signal, emitted by a given Edje
 * object.
 *
 * Edje signals are one of the communication interfaces between code and a
 * given Edje object's theme. With signals, one can communicate two string
 * values at a time, which are: - "emission" value: the name of the signal, in
 * general - "source" value: a name for the signal's context, in general
 *
 * Signals can go both ways, from code to theme, or theme to code.
 *
 * Though there are those common uses for the two strings, one is free to use
 * them however they like.
 *
 * Signal callback registration is powerful, in the way that blobs may be used
 * to match multiple signals at once. All the "*?[\" set of @c fnmatch()
 * operators can be used, both for emission and source.
 *
 * Edje has internal signals it will emit, automatically, on various actions
 * taking place on group parts. For example, the mouse cursor being moved,
 * pressed, released, etc., over a given part's area, all generate individual
 * signals.
 *
 * With something like emission = "mouse,down,*", source = "button.*" where
 * "button.*" is the pattern for the names of parts implementing buttons on an
 * interface, you'd be registering for notifications on events of mouse buttons
 * being pressed down on either of those parts (those events all have the
 * "mouse,down," common prefix on their names, with a suffix giving the button
 * number). The actual emission and source strings of an event will be passed
 * in as the emission and source parameters of the callback function (e.g.
 * "mouse,down,2" and "button.close"), for each of those events.
 *
 * See also the Edje Data Collection Reference for EDC files.
 *
 * See @ref efl_layout_signal_emit on how to emit signals from code to a an
 * object See @ref efl_layout_signal_callback_del.
 *
 * @param[in] obj The object.
 * @param[in] emission The signal's "emission" string
 * @param[in] source The signal's "source" string
 * @param[in] func The callback function to be executed when the signal is
 * emitted.
 *
 * @return @c true in case of success, @c false in case of error.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Signal
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_layout_signal_callback_add(obj:PEo; emission:Pchar; source:Pchar; func_data:pointer; func:TEflLayoutSignalCb; 
           func_free_cb:TEina_Free_Cb):TEina_Bool;cdecl;external;
{*
 * @brief Removes a signal-triggered callback from an object.
 *
 * This function removes a callback, previously attached to the emission of a
 * signal, from the object  obj. The parameters emission, source and func must
 * match exactly those passed to a previous call to
 * @ref efl_layout_signal_callback_add().
 *
 * See @ref efl_layout_signal_callback_add.
 *
 * @param[in] obj The object.
 * @param[in] emission The signal's "emission" string
 * @param[in] source The signal's "source" string
 * @param[in] func The callback function to be executed when the signal is
 * emitted.
 *
 * @return @c true in case of success, @c false in case of error.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Signal
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_layout_signal_callback_del(obj:PEo; emission:Pchar; source:Pchar; func_data:pointer; func:TEflLayoutSignalCb; 
           func_free_cb:TEina_Free_Cb):TEina_Bool;cdecl;external;
{*
 * @brief Sends/emits an Edje signal to this layout.
 *
 * This function sends a signal to the object. An Edje program, at the EDC
 * specification level, can respond to a signal by having declared matching
 * "signal" and "source" fields on its block.
 *
 * See also the Edje Data Collection Reference for EDC files.
 *
 * See @ref efl_layout_signal_callback_add() for more on Edje signals.
 *
 * @param[in] obj The object.
 * @param[in] emission The signal's "emission" string
 * @param[in] source The signal's "source" string
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Signal
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_layout_signal_emit(obj:PEo; emission:Pchar; source:Pchar);cdecl;external;
{*
 * @brief Processes an object's messages and signals queue.
 *
 * This function goes through the object message queue processing the pending
 * messages for this specific Edje object. Normally they'd be processed only at
 * idle time.
 *
 * If @c recurse is @c true, this function will be called recursively on all
 * subobjects.
 *
 * @param[in] obj The object.
 * @param[in] recurse Whether to process messages on children objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Signal
  }
procedure efl_layout_signal_process(obj:PEo; recurse:TEina_Bool);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LAYOUT_SIGNAL_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_LAYOUT_SIGNAL_INTERFACE:=efl_layout_signal_interface_get;
  end;


end.
