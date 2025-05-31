
unit efl_ui_check_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_check_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_check_eo.h
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
PEfl_Ui_Check  = ^Efl_Ui_Check;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_CHECK_EO_H_}
{$define _EFL_UI_CHECK_EO_H_}
{$ifndef _EFL_UI_CHECK_EO_CLASS_TYPE}
{$define _EFL_UI_CHECK_EO_CLASS_TYPE}
type
  PEfl_Ui_Check = ^TEfl_Ui_Check;
  TEfl_Ui_Check = TEo;
{$endif}
{$ifndef _EFL_UI_CHECK_EO_TYPES}
{$define _EFL_UI_CHECK_EO_TYPES}
{$endif}
{*
 * @brief Check widget.
 *
 * The check widget allows for toggling a value between @c true and @c false.
 * Check objects are a lot like @ref Efl_Ui_Radio objects in layout and
 * functionality, except they do not work as a group, but independently, and
 * only toggle the value of a boolean between @c false and @c true. The boolean
 * value of the check can be retrieved using the
 * @ref efl_ui_selectable_selected_get property. Changes to
 * @ref efl_ui_selectable_selected_get can be listed to using the
 * @[Efl.Ui.Selectable.selected,changed] event.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Check
  }

{ was #define dname def_expr }
function EFL_UI_CHECK_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_check_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_CHECK_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_CHECK_CLASS:=efl_ui_check_class_get;
  end;


end.
