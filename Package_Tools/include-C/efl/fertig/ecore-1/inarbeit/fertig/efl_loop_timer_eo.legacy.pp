
unit efl_loop_timer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_timer_eo.legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_timer_eo.legacy.h
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
PEfl_Loop_Timer  = ^Efl_Loop_Timer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_TIMER_EO_LEGACY_H_}
{$define _EFL_LOOP_TIMER_EO_LEGACY_H_}
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
 * @brief Interval the timer ticks on.
 *
 * If set during a timer call this will affect the next interval.
 *
 * @param[in] obj The object.
 * @param[in] in The new interval in seconds
 *
 * @ingroup Ecore_Timer_Group
  }

procedure ecore_timer_interval_set(obj:PEfl_Loop_Timer; in:Tdouble);cdecl;external;
{*
 * @brief Interval the timer ticks on.
 *
 * @param[in] obj The object.
 *
 * @return The new interval in seconds
 *
 * @ingroup Ecore_Timer_Group
  }
(* Const before type ignored *)
function ecore_timer_interval_get(obj:PEfl_Loop_Timer):Tdouble;cdecl;external;
{*
 * @brief Pending time regarding a timer.
 *
 * @param[in] obj The object.
 *
 * @return Pending time
 *
 * @ingroup Ecore_Timer_Group
  }
(* Const before type ignored *)
function ecore_timer_pending_get(obj:PEfl_Loop_Timer):Tdouble;cdecl;external;
{*
 * @brief Resets a timer to its full interval. This effectively makes the timer
 * start ticking off from zero now.
 *
 * This is equal to delaying the timer by the already passed time, since the
 * timer started ticking
 *
 * @param[in] obj The object.
 *
 * @since 1.2
 *
 * @ingroup Ecore_Timer_Group
  }
procedure ecore_timer_reset(obj:PEfl_Loop_Timer);cdecl;external;
{* This effectively resets a timer but based on the time when this iteration
 * of the main loop started.
 *
 * @since 1.18
 *
 * @ingroup Ecore_Timer_Group
  }
procedure ecore_timer_loop_reset(obj:PEfl_Loop_Timer);cdecl;external;
{*
 * @brief Adds a delay to the next occurrence of a timer. This doesn't affect
 * the timer interval.
 *
 * @param[in] obj The object.
 * @param[in] add The amount of time by which to delay the timer in seconds
 *
 * @ingroup Ecore_Timer_Group
  }
procedure ecore_timer_delay(obj:PEfl_Loop_Timer; add:Tdouble);cdecl;external;
{$endif}

implementation


end.
