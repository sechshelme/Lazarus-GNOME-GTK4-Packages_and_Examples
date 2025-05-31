
unit efl_ui_slider_interval_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_slider_interval_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_slider_interval_eo.h
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
Pdouble  = ^double;
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Slider_Interval  = ^Efl_Ui_Slider_Interval;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SLIDER_INTERVAL_EO_H_}
{$define _EFL_UI_SLIDER_INTERVAL_EO_H_}
{$ifndef _EFL_UI_SLIDER_INTERVAL_EO_CLASS_TYPE}
{$define _EFL_UI_SLIDER_INTERVAL_EO_CLASS_TYPE}
type
  PEfl_Ui_Slider_Interval = ^TEfl_Ui_Slider_Interval;
  TEfl_Ui_Slider_Interval = TEo;
{$endif}
{$ifndef _EFL_UI_SLIDER_INTERVAL_EO_TYPES}
{$define _EFL_UI_SLIDER_INTERVAL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An interval slider.
 *
 * This is a slider with two indicators.
 *
 * @ingroup Efl_Ui_Slider_Interval
  }

{ was #define dname def_expr }
function EFL_UI_SLIDER_INTERVAL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_slider_interval_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Sets up position of two indicators at start and end position.
 *
 * @param[in] obj The object.
 * @param[in] from interval minimum value
 * @param[in] to interval maximum value
 *
 * @ingroup Efl_Ui_Slider_Interval
  }
procedure efl_ui_slider_interval_value_set(obj:PEo; from:Tdouble; to:Tdouble);cdecl;external;
{*
 * @brief Sets up position of two indicators at start and end position.
 *
 * @param[in] obj The object.
 * @param[out] from interval minimum value
 * @param[out] to interval maximum value
 *
 * @ingroup Efl_Ui_Slider_Interval
  }
(* Const before type ignored *)
procedure efl_ui_slider_interval_value_get(obj:PEo; from:Pdouble; to:Pdouble);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START : TEfl_Event_Description;cvar;external;
{* Called when a slider drag operation has started. This means a @c press
 * event has been received on the slider thumb but not the @c unpress.
 *
 * @ingroup Efl_Ui_Slider_Interval
  }
(* Const before type ignored *)
    _EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP : TEfl_Event_Description;cvar;external;
{* Called when a slider drag operation has finished. This means an @c unpress
 * event has been received on the slider thumb.
 *
 * @ingroup Efl_Ui_Slider_Interval
  }

{ was #define dname def_expr }
function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SLIDER_INTERVAL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SLIDER_INTERVAL_CLASS:=efl_ui_slider_interval_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START : longint; { return type might be wrong }
  begin
    EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START:=@(_EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START);
  end;

{ was #define dname def_expr }
function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP : longint; { return type might be wrong }
  begin
    EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP:=@(_EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP);
  end;


end.
