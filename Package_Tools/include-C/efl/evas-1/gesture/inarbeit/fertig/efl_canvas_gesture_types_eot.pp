
unit efl_canvas_gesture_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_types_eot.h
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
PEfl_Canvas_Gesture_Recognizer_Result  = ^Efl_Canvas_Gesture_Recognizer_Result;
PEfl_Canvas_Gesture_State  = ^Efl_Canvas_Gesture_State;
PEfl_Canvas_Gesture_Touch_State  = ^Efl_Canvas_Gesture_Touch_State;
PEfl_Gesture_Touch_Point_Data  = ^Efl_Gesture_Touch_Point_Data;
PEfl_Gesture_Touch_Point_Info  = ^Efl_Gesture_Touch_Point_Info;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_TYPES_EOT_H_}
{$define _EFL_CANVAS_GESTURE_TYPES_EOT_H_}
{$ifndef _EFL_CANVAS_GESTURE_TYPES_EOT_TYPES}
{$define _EFL_CANVAS_GESTURE_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* This enum type describes the state of a touch event.
 *
 * @ingroup Efl_Canvas_Gesture_Touch_State
  }
{*< Touch state is unset.  }
{*< First touch point has just been added.  }
{*< A touch point position has updated or
                                   * other touch points were added.  }
{*< A touch point has been released.  }
type
  PEfl_Canvas_Gesture_Touch_State = ^TEfl_Canvas_Gesture_Touch_State;
  TEfl_Canvas_Gesture_Touch_State =  Longint;
  Const
    EFL_GESTURE_TOUCH_STATE_UNKNOWN = 0;
    EFL_GESTURE_TOUCH_STATE_BEGIN = 1;
    EFL_GESTURE_TOUCH_STATE_UPDATE = 2;
    EFL_GESTURE_TOUCH_STATE_END = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* This enum type describes the state of a gesture.
 *
 * @ingroup Efl_Canvas_Gesture_State
  }
{*< No gesture state.  }
{*< A gesture has started.  }
{*< A gesture has triggered.  }
{*< A gesture has ended and has triggered.  }
{*< A gesture has ended without triggering.  }
type
  PEfl_Canvas_Gesture_State = ^TEfl_Canvas_Gesture_State;
  TEfl_Canvas_Gesture_State =  Longint;
  Const
    EFL_GESTURE_STATE_NONE = 0;
    EFL_GESTURE_STATE_STARTED = 1;
    EFL_GESTURE_STATE_UPDATED = 2;
    EFL_GESTURE_STATE_FINISHED = 3;
    EFL_GESTURE_STATE_CANCELED = 4;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* This enum type describes the state of a gesture recognizer.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer_Result
  }
{*< The event does not change the
                                             * state of the recognizer.  }
{*< The event changed the internal
                                            * state of the recognizer, but it
                                            * isn't clear yet if it is a
                                            * gesture or not. The recognizer
                                            * needs to filter more events to
                                            * decide.  }
{*< The gesture has been triggered
                                               }
{*< The gesture has been finished
                                             * successfully and the gesture
                                             * triggered.  }
{*< The event made it clear that
                                              * it is not a gesture. If the
                                              * gesture recognizer was in
                                              * Triggered state before, then
                                              * the gesture is canceled.  }
{*< The gesture result mask
                                                    }
type
  PEfl_Canvas_Gesture_Recognizer_Result = ^TEfl_Canvas_Gesture_Recognizer_Result;
  TEfl_Canvas_Gesture_Recognizer_Result =  Longint;
  Const
    EFL_GESTURE_RECOGNIZER_RESULT_IGNORE = 1;
    EFL_GESTURE_RECOGNIZER_RESULT_MAYBE = 2;
    EFL_GESTURE_RECOGNIZER_RESULT_TRIGGER = 4;
    EFL_GESTURE_RECOGNIZER_RESULT_FINISH = 8;
    EFL_GESTURE_RECOGNIZER_RESULT_CANCEL = 16;
    EFL_GESTURE_RECOGNIZER_RESULT_RESULT_MASK = 255;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* This struct represents the underlying data of a touch point.
 *
 * @ingroup Efl_Gesture_Touch_Point_Info
  }
{*< The canvas position of the touch point data.  }
{*< Whether this touch point is currently being pressed
                      * down.  }
{*< The timestamp of the touch point data in
                           * milliseconds.  }
type
  PEfl_Gesture_Touch_Point_Info = ^TEfl_Gesture_Touch_Point_Info;
  TEfl_Gesture_Touch_Point_Info = record
      pos : TEina_Position2D;
      pressed : TEina_Bool;
      timestamp : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* This struct represents the state of a touch point.
 *
 * @ingroup Efl_Gesture_Touch_Point_Data
  }
{*< Touch id of the point, where the first point is $0.  }
{*< The last event with this point.  }
{*< The start data for the touch point.
                                        }
{*< The previous data for the touch point.
                                       }
{*< The current data for the touch point.
                                      }
type
  PEfl_Gesture_Touch_Point_Data = ^TEfl_Gesture_Touch_Point_Data;
  TEfl_Gesture_Touch_Point_Data = record
      id : longint;
      action : TEfl_Pointer_Action;
      start : TEfl_Gesture_Touch_Point_Info;
      prev : TEfl_Gesture_Touch_Point_Info;
      cur : TEfl_Gesture_Touch_Point_Info;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$endif}

implementation


end.
