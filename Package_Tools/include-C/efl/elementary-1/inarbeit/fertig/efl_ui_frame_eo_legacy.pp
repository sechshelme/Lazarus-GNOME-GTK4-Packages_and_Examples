
unit efl_ui_frame_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_frame_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_frame_eo_legacy.h
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
PEfl_Ui_Frame  = ^Efl_Ui_Frame;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FRAME_EO_LEGACY_H_}
{$define _EFL_UI_FRAME_EO_LEGACY_H_}
{$ifndef _EFL_UI_FRAME_EO_CLASS_TYPE}
{$define _EFL_UI_FRAME_EO_CLASS_TYPE}
type
  PEfl_Ui_Frame = ^TEfl_Ui_Frame;
  TEfl_Ui_Frame = TEo;
{$endif}
{$ifndef _EFL_UI_FRAME_EO_TYPES}
{$define _EFL_UI_FRAME_EO_TYPES}
{$endif}
{*
 * @brief Manually collapse a frame without animations Use this to toggle the
 * collapsed state of a frame, bypassing animations.
 *
 * @param[in] obj The object.
 * @param[in] collapse @c true to collapse, @c false to expand.
 *
 * @ingroup Elm_Frame_Group
  }

procedure elm_frame_collapse_set(obj:PEfl_Ui_Frame; collapse:TEina_Bool);cdecl;external;
{*
 * @brief Determine the collapse state of a frame Use this to determine the
 * collapse state of a frame.
 *
 * @param[in] obj The object.
 *
 * @return @c true to collapse, @c false to expand.
 *
 * @ingroup Elm_Frame_Group
  }
(* Const before type ignored *)
function elm_frame_collapse_get(obj:PEfl_Ui_Frame):TEina_Bool;cdecl;external;
{*
 * @brief Toggle autocollapsing of a frame When @c enable is @c true, clicking
 * a frame's label will collapse the frame vertically, shrinking it to the
 * height of the label. By default, this is DISABLED.
 *
 * @param[in] obj The object.
 * @param[in] autocollapse Whether to enable autocollapse.
 *
 * @ingroup Elm_Frame_Group
  }
procedure elm_frame_autocollapse_set(obj:PEfl_Ui_Frame; autocollapse:TEina_Bool);cdecl;external;
{*
 * @brief Determine autocollapsing of a frame
 *
 * When this returns @c true, clicking a frame's label will collapse the frame
 * vertically, shrinking it to the height of the label. By default, this is
 * DISABLED.
 *
 * @param[in] obj The object.
 *
 * @return Whether to enable autocollapse.
 *
 * @ingroup Elm_Frame_Group
  }
(* Const before type ignored *)
function elm_frame_autocollapse_get(obj:PEfl_Ui_Frame):TEina_Bool;cdecl;external;
{*
 * @brief Manually collapse a frame with animations Use this to toggle the
 * collapsed state of a frame, triggering animations.
 *
 * @param[in] obj The object.
 * @param[in] collapse @c true to collapse, @c false to expand.
 *
 * @ingroup Elm_Frame_Group
  }
procedure elm_frame_collapse_go(obj:PEfl_Ui_Frame; collapse:TEina_Bool);cdecl;external;
{$endif}

implementation


end.
