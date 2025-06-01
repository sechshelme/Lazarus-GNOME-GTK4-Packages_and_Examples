
unit efl_ui_progressbar;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_progressbar.eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_progressbar.eo.h
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
PEfl_Ui_Progressbar  = ^Efl_Ui_Progressbar;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PROGRESSBAR_EO_H_}
{$define _EFL_UI_PROGRESSBAR_EO_H_}
{$ifndef _EFL_UI_PROGRESSBAR_EO_CLASS_TYPE}
{$define _EFL_UI_PROGRESSBAR_EO_CLASS_TYPE}
type
  PEfl_Ui_Progressbar = ^TEfl_Ui_Progressbar;
  TEfl_Ui_Progressbar = TEo;
{$endif}
{$ifndef _EFL_UI_PROGRESSBAR_EO_TYPES}
{$define _EFL_UI_PROGRESSBAR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Progress bar widget.
 *
 * It shows a graphical indication of the current progress of some lengthy
 * operation, typically as a bar that gradually fills or a pointer that moves
 * from one side of the bar to the other. The bar can be horizontal or
 * vertical, controlled with @ref Efl_Ui_Layout_Orientable.
 *
 * The minimum and maximum values (or starting and ending values), along with
 * the current value can be set using the @ref Efl_Ui_Range_Display interface.
 *
 * @ref efl_ui_progressbar_infinite_mode_get can be set when the progress state
 * is unknown. An optional textual label can be shown to indicate the exact
 * numerical value of the progress.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Progressbar
  }

{ was #define dname def_expr }
function EFL_UI_PROGRESSBAR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_progressbar_class_get:PEfl_Class;cdecl;external;
{*
 * @brief When this mode is enabled the progress bar indicates that there is an
 * operation going on, but does not give information about its progress. This
 * is typically shown as a "pulsing" animation or an endless spinning bar,
 * depending on the theme.
 *
 * @param[in] obj The object.
 * @param[in] state @c true if the progress bar should animate infinitely.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Progressbar
  }
procedure efl_ui_progressbar_infinite_mode_set(obj:PEo; state:TEina_Bool);cdecl;external;
{*
 * @brief When this mode is enabled the progress bar indicates that there is an
 * operation going on, but does not give information about its progress. This
 * is typically shown as a "pulsing" animation or an endless spinning bar,
 * depending on the theme.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the progress bar should animate infinitely.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Progressbar
  }
(* Const before type ignored *)
function efl_ui_progressbar_infinite_mode_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Whether a textual progress label is shown alongside the progress bar
 * to give an exact numerical indication of the current progress. Control the
 * conversion of the numerical value to a text string using @ref Efl_Ui_Format.
 *
 * Not to be confused with the widget label set through @ref efl_text_get.
 *
 * The exact location and appearance of the progress label depend on the theme.
 *
 * @param[in] obj The object.
 * @param[in] show @c true to show the progress label.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Progressbar
  }
procedure efl_ui_progressbar_show_progress_label_set(obj:PEo; show:TEina_Bool);cdecl;external;
{*
 * @brief Whether a textual progress label is shown alongside the progress bar
 * to give an exact numerical indication of the current progress. Control the
 * conversion of the numerical value to a text string using @ref Efl_Ui_Format.
 *
 * Not to be confused with the widget label set through @ref efl_text_get.
 *
 * The exact location and appearance of the progress label depend on the theme.
 *
 * @param[in] obj The object.
 *
 * @return @c true to show the progress label.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Progressbar
  }
(* Const before type ignored *)
function efl_ui_progressbar_show_progress_label_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_PROGRESSBAR_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_PROGRESSBAR_CLASS:=efl_ui_progressbar_class_get;
  end;


end.
