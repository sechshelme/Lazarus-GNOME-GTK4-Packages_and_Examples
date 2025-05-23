
unit efl_ui_textpath_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_textpath_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_textpath_eo_legacy.h
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
PEfl_Ui_Textpath  = ^Efl_Ui_Textpath;
PEfl_Ui_Textpath_Direction  = ^Efl_Ui_Textpath_Direction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TEXTPATH_EO_LEGACY_H_}
{$define _EFL_UI_TEXTPATH_EO_LEGACY_H_}
{$ifndef _EFL_UI_TEXTPATH_EO_CLASS_TYPE}
{$define _EFL_UI_TEXTPATH_EO_CLASS_TYPE}
type
  PEfl_Ui_Textpath = ^TEfl_Ui_Textpath;
  TEfl_Ui_Textpath = TEo;
{$endif}
{$ifndef _EFL_UI_TEXTPATH_EO_TYPES}
{$define _EFL_UI_TEXTPATH_EO_TYPES}
{* Textpath direction
 *
 * @ingroup Elm_Textpath_Group
  }
{*< Clockwise  }
{*< Counter-clockwise  }
{*< Clockwise, middle of text will be at start angle @since 1.23  }
{*< Counter-clockwise, middle of text will be at start angle @since 1.23  }
type
  PEfl_Ui_Textpath_Direction = ^TEfl_Ui_Textpath_Direction;
  TEfl_Ui_Textpath_Direction =  Longint;
  Const
    EFL_UI_TEXTPATH_DIRECTION_CW = 0;
    EFL_UI_TEXTPATH_DIRECTION_CCW = 1;
    EFL_UI_TEXTPATH_DIRECTION_CW_CENTER = 2;
    EFL_UI_TEXTPATH_DIRECTION_CCW_CENTER = 3;
;
{$endif}
{*
 * @brief Set a circle with given radius, and start angle.
 *        The circle center will be decided by the object center position.
 *
 * @param[in] obj The object.
 * @param[in] radius Radius of the circle
 * @param[in] start_angle Start angle of the circle
 * @param[in] direction Textpath direction
 *
 * @since 1.23
 * @ingroup Elm_Textpath_Group
  }

procedure elm_textpath_circular_set(obj:PEfl_Ui_Textpath; radius:Tdouble; start_angle:Tdouble; direction:TEfl_Ui_Textpath_Direction);cdecl;external;
{*
 * @brief The number of slices. The larger the number of slice_num is, The
 * better the text follows the path.
 *
 * @param[in] obj The object.
 * @param[in] slice_no Number of slices
 *
 * @ingroup Elm_Textpath_Group
  }
procedure elm_textpath_slice_number_set(obj:PEfl_Ui_Textpath; slice_no:longint);cdecl;external;
{*
 * @brief The number of slices. The larger the number of slice_num is, The
 * better the text follows the path.
 *
 * @param[in] obj The object.
 *
 * @return Number of slices
 *
 * @ingroup Elm_Textpath_Group
  }
(* Const before type ignored *)
function elm_textpath_slice_number_get(obj:PEfl_Ui_Textpath):longint;cdecl;external;
{*
 * @brief Control the ellipsis behavior of the textpath.
 *
 * @param[in] obj The object.
 * @param[in] ellipsis To ellipsis text or not
 *
 * @ingroup Elm_Textpath_Group
  }
procedure elm_textpath_ellipsis_set(obj:PEfl_Ui_Textpath; ellipsis:TEina_Bool);cdecl;external;
{*
 * @brief Control the ellipsis behavior of the textpath.
 *
 * @param[in] obj The object.
 *
 * @return To ellipsis text or not
 *
 * @ingroup Elm_Textpath_Group
  }
(* Const before type ignored *)
function elm_textpath_ellipsis_get(obj:PEfl_Ui_Textpath):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
