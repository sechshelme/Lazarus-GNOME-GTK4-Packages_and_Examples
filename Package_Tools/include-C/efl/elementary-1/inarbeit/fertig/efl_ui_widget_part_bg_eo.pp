
unit efl_ui_widget_part_bg_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_part_bg_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_part_bg_eo.h
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
PEfl_Ui_Widget_Part_Bg  = ^Efl_Ui_Widget_Part_Bg;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIDGET_PART_BG_EO_H_}
{$define _EFL_UI_WIDGET_PART_BG_EO_H_}
{$ifndef _EFL_UI_WIDGET_PART_BG_EO_CLASS_TYPE}
{$define _EFL_UI_WIDGET_PART_BG_EO_CLASS_TYPE}
type
  PEfl_Ui_Widget_Part_Bg = ^TEfl_Ui_Widget_Part_Bg;
  TEfl_Ui_Widget_Part_Bg = TEo;
{$endif}
{$ifndef _EFL_UI_WIDGET_PART_BG_EO_TYPES}
{$define _EFL_UI_WIDGET_PART_BG_EO_TYPES}
{$endif}
{*
 * @brief Elementary widget internal part background class
 *
 * This part will proxy the calls on it to the @ref Efl_Ui_Bg internal object
 * of this widget. This internal object is stacked below the
 * @ref efl_ui_widget_resize_object_set and co-located with the widget.
 *
 * All @ref Efl_Ui_Widget objects have this part, allowing the background of
 * the widget to be customized.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Part_Bg
  }

{ was #define dname def_expr }
function EFL_UI_WIDGET_PART_BG_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_widget_part_bg_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIDGET_PART_BG_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_WIDGET_PART_BG_CLASS:=efl_ui_widget_part_bg_class_get;
  end;


end.
