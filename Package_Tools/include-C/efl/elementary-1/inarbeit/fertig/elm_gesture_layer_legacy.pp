
unit elm_gesture_layer_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_gesture_layer_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_gesture_layer_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "elm_gesture_layer_eo.legacy.h"}
{*
 * Call this function to construct a new gesture-layer object.
 *
 * @param parent The gesture layer's parent widget.
 *
 * @return A new gesture layer object.
 *
 * This does not activate the gesture layer. You have to
 * call elm_gesture_layer_attach() in order to 'activate' gesture-layer.
 *
 * @ingroup Elm_Gesture_Layer_Group
  }

function elm_gesture_layer_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * This function adds a callback called during Tap + Long Tap sequence.
 *
 * @param state state for the callback to add.
 * @param cb callback pointer
 * @param data user data for the callback.
 *
 * The callbacks will be called as followed:
 * - start cbs on single tap start
 * - move cbs on long press move
 * - end cbs on long press end
 * - abort cbs whenever in the sequence. The event info will be NULL, because it
 *   can be triggered from multiple events (timer expired, abort single/long taps).
 *
 * You can remove the callbacks by using elm_gesture_layer_tap_longpress_cb_del.
 *
 * @see elm_gesture_layer_tap_longpress_cb_del
 * @since 1.8
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_tap_longpress_cb_add(obj:PEvas_Object; state:TElm_Gesture_State; cb:TElm_Gesture_Event_Cb; data:pointer);cdecl;external;
{*
 * This function removes a callback called during Tap + Long Tap sequence.
 *
 * @param state state for the callback to add.
 * @param cb callback pointer
 * @param data user data for the callback.
 *
 * The internal data used for the sequence will be freed ONLY when all the
 * callbacks added via elm_gesture_layer_tap_longpress_cb_add are removed by
 * this function.
 *
 * @see elm_gesture_layer_tap_longpress_cb_add
 * @since 1.8
 * @ingroup Elm_Gesture_Layer_Group
  }
procedure elm_gesture_layer_tap_longpress_cb_del(obj:PEvas_Object; state:TElm_Gesture_State; cb:TElm_Gesture_Event_Cb; data:pointer);cdecl;external;

implementation


end.
