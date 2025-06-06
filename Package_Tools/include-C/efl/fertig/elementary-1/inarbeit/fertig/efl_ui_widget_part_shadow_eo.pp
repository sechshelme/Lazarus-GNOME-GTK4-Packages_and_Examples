
unit efl_ui_widget_part_shadow_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_part_shadow_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_part_shadow_eo.h
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
PEfl_Ui_Widget_Part_Shadow  = ^Efl_Ui_Widget_Part_Shadow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIDGET_PART_SHADOW_EO_H_}
{$define _EFL_UI_WIDGET_PART_SHADOW_EO_H_}
{$ifndef _EFL_UI_WIDGET_PART_SHADOW_EO_CLASS_TYPE}
{$define _EFL_UI_WIDGET_PART_SHADOW_EO_CLASS_TYPE}
type
  PEfl_Ui_Widget_Part_Shadow = ^TEfl_Ui_Widget_Part_Shadow;
  TEfl_Ui_Widget_Part_Shadow = TEo;
{$endif}
{$ifndef _EFL_UI_WIDGET_PART_SHADOW_EO_TYPES}
{$define _EFL_UI_WIDGET_PART_SHADOW_EO_TYPES}
{$endif}
{*
 * @brief A drop-shadow or glow effect around any widget.
 *
 * A simple drop-shadow effect can be applied to any widget by setting the
 * color and blur radius on this part.
 *
 * For instance, a blue glow can be achieved with: obj.shadow().color_set(0,
 * 128, 255, 255); obj.shadow().grow_set(2); obj.shadow().radius_set(3, 3);
 *
 * As another example, here's a black drop-shadow: obj.shadow().color_set(0, 0,
 * 0, 255); obj.shadow().grow_set(1); obj.shadow().radius_set(5, 5);
 * obj.shadow().offset_set(5, 5);
 *
 * It is also possible to manually specify which @ref Efl_Gfx_Filter program to
 * use.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Part_Shadow
  }

{ was #define dname def_expr }
function EFL_UI_WIDGET_PART_SHADOW_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_widget_part_shadow_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIDGET_PART_SHADOW_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_WIDGET_PART_SHADOW_CLASS:=efl_ui_widget_part_shadow_class_get;
  end;


end.
