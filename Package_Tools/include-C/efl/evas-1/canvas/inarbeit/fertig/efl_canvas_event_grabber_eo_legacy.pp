
unit efl_canvas_event_grabber_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_event_grabber_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_event_grabber_eo_legacy.h
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
PEfl_Canvas_Event_Grabber  = ^Efl_Canvas_Event_Grabber;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_EVENT_GRABBER_EO_LEGACY_H_}
{$define _EFL_CANVAS_EVENT_GRABBER_EO_LEGACY_H_}
{$ifndef _EFL_CANVAS_EVENT_GRABBER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_EVENT_GRABBER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Event_Grabber = ^TEfl_Canvas_Event_Grabber;
  TEfl_Canvas_Event_Grabber = TEo;
{$endif}
{$ifndef _EFL_CANVAS_EVENT_GRABBER_EO_TYPES}
{$define _EFL_CANVAS_EVENT_GRABBER_EO_TYPES}
{$endif}
{*
 * @brief Stops the grabber from updating its internal stacking order while
 * visible
 *
 * @param[in] obj The object.
 * @param[in] set If @c true, stop updating
 *
 * @since 1.20
 *
 * @ingroup Evas_Object_Event_Grabber_Group
  }

procedure evas_object_event_grabber_freeze_when_visible_set(obj:PEfl_Canvas_Event_Grabber; set:TEina_Bool);cdecl;external;
{*
 * @brief Stops the grabber from updating its internal stacking order while
 * visible
 *
 * @param[in] obj The object.
 *
 * @return If @c true, stop updating
 *
 * @since 1.20
 *
 * @ingroup Evas_Object_Event_Grabber_Group
  }
(* Const before type ignored *)
function evas_object_event_grabber_freeze_when_visible_get(obj:PEfl_Canvas_Event_Grabber):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
