
unit efl_ui_frame_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_frame_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_frame_eo.h
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
PEfl_Ui_Frame  = ^Efl_Ui_Frame;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FRAME_EO_H_}
{$define _EFL_UI_FRAME_EO_H_}
{$ifndef _EFL_UI_FRAME_EO_CLASS_TYPE}
{$define _EFL_UI_FRAME_EO_CLASS_TYPE}
type
  PEfl_Ui_Frame = ^TEfl_Ui_Frame;
  TEfl_Ui_Frame = TEo;
{$endif}
{$ifndef _EFL_UI_FRAME_EO_TYPES}
{$define _EFL_UI_FRAME_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Frame widget
 *
 * The Frame widget allows for collapsing and expanding the content widget by
 * clicking on the frame label. the label and content can be set using text_set
 * and content_set api.
 *
 * @ingroup Efl_Ui_Frame
  }

{ was #define dname def_expr }
function EFL_UI_FRAME_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_frame_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Manually collapse a frame without animations. Use this to toggle the
 * collapsed state of a frame, bypassing animations.
 *
 * @param[in] obj The object.
 * @param[in] collapse @c true to collapse, @c false to expand.
 *
 * @ingroup Efl_Ui_Frame
  }
procedure efl_ui_frame_collapse_set(obj:PEo; collapse:TEina_Bool);cdecl;external;
{*
 * @brief Manually collapse a frame without animations. Use this to toggle the
 * collapsed state of a frame, bypassing animations.
 *
 * @param[in] obj The object.
 *
 * @return @c true to collapse, @c false to expand.
 *
 * @ingroup Efl_Ui_Frame
  }
(* Const before type ignored *)
function efl_ui_frame_collapse_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Toggle autocollapsing of a frame. When @c enable is @c true, clicking
 * a frame's label will collapse the frame vertically, shrinking it to the
 * height of the label. By default, this is DISABLED.
 *
 * @param[in] obj The object.
 * @param[in] autocollapse Whether to enable autocollapse.
 *
 * @ingroup Efl_Ui_Frame
  }
procedure efl_ui_frame_autocollapse_set(obj:PEo; autocollapse:TEina_Bool);cdecl;external;
{*
 * @brief Toggle autocollapsing of a frame. When @c enable is @c true, clicking
 * a frame's label will collapse the frame vertically, shrinking it to the
 * height of the label. By default, this is DISABLED.
 *
 * @param[in] obj The object.
 *
 * @return Whether to enable autocollapse.
 *
 * @ingroup Efl_Ui_Frame
  }
(* Const before type ignored *)
function efl_ui_frame_autocollapse_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Manually collapse a frame with animations Use this to toggle the
 * collapsed state of a frame, triggering animations.
 *
 * @param[in] obj The object.
 * @param[in] collapse @c true to collapse, @c false to expand.
 *
 * @ingroup Efl_Ui_Frame
  }
procedure efl_ui_frame_collapse_go(obj:PEo; collapse:TEina_Bool);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FRAME_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_FRAME_CLASS:=efl_ui_frame_class_get;
  end;


end.
