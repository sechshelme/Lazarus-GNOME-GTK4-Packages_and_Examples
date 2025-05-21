
unit efl_loop_timer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_timer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_timer_eo.h
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
PEfl_Loop_Timer  = ^Efl_Loop_Timer;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_TIMER_EO_H_}
{$define _EFL_LOOP_TIMER_EO_H_}
{$ifndef _EFL_LOOP_TIMER_EO_CLASS_TYPE}
{$define _EFL_LOOP_TIMER_EO_CLASS_TYPE}
type
  PEfl_Loop_Timer = ^TEfl_Loop_Timer;
  TEfl_Loop_Timer = TEo;
{$endif}
{$ifndef _EFL_LOOP_TIMER_EO_TYPES}
{$define _EFL_LOOP_TIMER_EO_TYPES}
{$endif}
{*
 * @brief Timers are objects that will call a given callback at some point in
 * the future and repeat that tick at a given interval.
 *
 * Timers require the ecore main loop to be running and functioning properly.
 * They do not guarantee exact timing but try to work on a "best effort" basis.
 *
 * The @ref efl_event_freeze and @ref efl_event_thaw calls are used to pause
 * and unpause the timer.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }

{ was #define dname def_expr }
function EFL_LOOP_TIMER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_timer_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Interval the timer ticks on.
 *
 * If set during a timer call this will affect the next interval.
 *
 * @param[in] obj The object.
 * @param[in] in The new interval in seconds
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }
procedure efl_loop_timer_interval_set(obj:PEo; in:Tdouble);cdecl;external;
{*
 * @brief Interval the timer ticks on.
 *
 * @param[in] obj The object.
 *
 * @return The new interval in seconds
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }
(* Const before type ignored *)
function efl_loop_timer_interval_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Pending time regarding a timer.
 *
 * @param[in] obj The object.
 *
 * @return Pending time
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }
(* Const before type ignored *)
function efl_loop_timer_time_pending_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Resets a timer to its full interval. This effectively makes the timer
 * start ticking off from zero now.
 *
 * This is equal to delaying the timer by the already passed time, since the
 * timer started ticking
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }
procedure efl_loop_timer_reset(obj:PEo);cdecl;external;
{* This effectively resets a timer but based on the time when this iteration
 * of the main loop started.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }
procedure efl_loop_timer_loop_reset(obj:PEo);cdecl;external;
{*
 * @brief Adds a delay to the next occurrence of a timer. This doesn't affect
 * the timer interval.
 *
 * @param[in] obj The object.
 * @param[in] add The amount of time by which to delay the timer in seconds
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }
procedure efl_loop_timer_delay(obj:PEo; add:Tdouble);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_LOOP_TIMER_EVENT_TIMER_TICK : TEfl_Event_Description;cvar;external;
{* Event triggered when the specified time as passed.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Timer
  }

{ was #define dname def_expr }
function EFL_LOOP_TIMER_EVENT_TIMER_TICK : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_TIMER_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_TIMER_CLASS:=efl_loop_timer_class_get;
  end;

{ was #define dname def_expr }
function EFL_LOOP_TIMER_EVENT_TIMER_TICK : longint; { return type might be wrong }
  begin
    EFL_LOOP_TIMER_EVENT_TIMER_TICK:=@(_EFL_LOOP_TIMER_EVENT_TIMER_TICK);
  end;


end.
