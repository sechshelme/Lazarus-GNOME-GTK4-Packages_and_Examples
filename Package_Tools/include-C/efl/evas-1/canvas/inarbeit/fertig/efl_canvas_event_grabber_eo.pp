
unit efl_canvas_event_grabber_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_event_grabber_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_event_grabber_eo.h
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
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_EVENT_GRABBER_EO_H_}
{$define _EFL_CANVAS_EVENT_GRABBER_EO_H_}
{$ifndef _EFL_CANVAS_EVENT_GRABBER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_EVENT_GRABBER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Event_Grabber = ^TEfl_Canvas_Event_Grabber;
  TEfl_Canvas_Event_Grabber = TEo;
{$endif}
{$ifndef _EFL_CANVAS_EVENT_GRABBER_EO_TYPES}
{$define _EFL_CANVAS_EVENT_GRABBER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Low-level rectangle object.
 *
 * This provides a smart version of the typical "event rectangle", which allows
 * objects to set this as their parent and route events to a group of objects.
 * Events will not propagate to non-member objects below this object.
 *
 * Adding members is done just like a normal smart object, using
 * efl_canvas_group_member_add (Eo API) or evas_object_smart_member_add
 * (legacy).
 *
 * Child objects are not modified in any way, unlike other types of smart
 * objects.
 *
 * No child objects should be stacked above the event grabber parent while the
 * grabber is visible. A critical error will be raised if this is detected.
 *
 * @ingroup Efl_Canvas_Event_Grabber
  }

{ was #define dname def_expr }
function EFL_CANVAS_EVENT_GRABBER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_event_grabber_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Stops the grabber from updating its internal stacking order while
 * visible
 *
 * @param[in] obj The object.
 * @param[in] set If @c true, stop updating
 *
 * @ingroup Efl_Canvas_Event_Grabber
  }
procedure efl_canvas_event_grabber_freeze_when_visible_set(obj:PEo; set:TEina_Bool);cdecl;external;
{*
 * @brief Stops the grabber from updating its internal stacking order while
 * visible
 *
 * @param[in] obj The object.
 *
 * @return If @c true, stop updating
 *
 * @ingroup Efl_Canvas_Event_Grabber
  }
(* Const before type ignored *)
function efl_canvas_event_grabber_freeze_when_visible_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_EVENT_GRABBER_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_EVENT_GRABBER_CLASS:=efl_canvas_event_grabber_class_get;
  end;


end.
