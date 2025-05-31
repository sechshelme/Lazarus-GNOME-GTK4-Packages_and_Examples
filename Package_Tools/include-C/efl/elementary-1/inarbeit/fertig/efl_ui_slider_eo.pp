
unit efl_ui_slider_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_slider_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_slider_eo.h
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
PEfl_Ui_Slider  = ^Efl_Ui_Slider;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SLIDER_EO_H_}
{$define _EFL_UI_SLIDER_EO_H_}
{$ifndef _EFL_UI_SLIDER_EO_CLASS_TYPE}
{$define _EFL_UI_SLIDER_EO_CLASS_TYPE}
type
  PEfl_Ui_Slider = ^TEfl_Ui_Slider;
  TEfl_Ui_Slider = TEo;
{$endif}
{$ifndef _EFL_UI_SLIDER_EO_TYPES}
{$define _EFL_UI_SLIDER_EO_TYPES}
{$endif}
{*
 * @brief Elementary slider class
 *
 * This lets the UI user select a numerical value inside the
 * @ref efl_ui_range_limits_get limits. The current value can be retrieved
 * using the @ref Efl_Ui_Range_Interactive interface. Events monitoring its
 * changes are also available in that interface. The visual representation of
 * min and max can be swapped using @ref efl_ui_layout_orientation_get.
 * Normally the minimum of @ref efl_ui_range_limits_get is shown on the left
 * side, the max on the right side.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Slider
  }

{ was #define dname def_expr }
function EFL_UI_SLIDER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_slider_class_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START : TEfl_Event_Description;cvar;external;
{* Called when a slider drag operation has started. This means a @c press
 * event has been received on the slider thumb but not the @c unpress.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Slider
  }
(* Const before type ignored *)
    _EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP : TEfl_Event_Description;cvar;external;
{* Called when a slider drag operation has finished. This means an @c unpress
 * event has been received on the slider thumb.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Slider
  }

{ was #define dname def_expr }
function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SLIDER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SLIDER_CLASS:=efl_ui_slider_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START : longint; { return type might be wrong }
  begin
    EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START:=@(_EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START);
  end;

{ was #define dname def_expr }
function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP : longint; { return type might be wrong }
  begin
    EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP:=@(_EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP);
  end;


end.
