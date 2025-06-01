
unit efl_ui_textpath_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_textpath_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_textpath_eo.h
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
PEfl_Ui_Textpath  = ^Efl_Ui_Textpath;
PEfl_Ui_Textpath_Direction  = ^Efl_Ui_Textpath_Direction;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TEXTPATH_EO_H_}
{$define _EFL_UI_TEXTPATH_EO_H_}
{$ifndef _EFL_UI_TEXTPATH_EO_CLASS_TYPE}
{$define _EFL_UI_TEXTPATH_EO_CLASS_TYPE}
type
  PEfl_Ui_Textpath = ^TEfl_Ui_Textpath;
  TEfl_Ui_Textpath = TEo;
{$endif}
{$ifndef _EFL_UI_TEXTPATH_EO_TYPES}
{$define _EFL_UI_TEXTPATH_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Textpath direction
 *
 * @ingroup Efl_Ui_Textpath_Direction
  }
{*< Clockwise  }
{*< Counter-clockwise  }
{*< Clockwise, middle of text will be at
                                        * start angle
                                        *
                                        * @since 1.23  }
{*< Counter-clockwise, middle of text
                                        * will be at start angle
                                        *
                                        * @since 1.23  }
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
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl Ui Textpath class
 *
 * @ingroup Efl_Ui_Textpath
  }

{ was #define dname def_expr }
function EFL_UI_TEXTPATH_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_textpath_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set a circle with given radius and start angle. The center of the
 * circle will be decided by the object center position.
 *
 * @param[in] obj The object.
 * @param[in] radius Radius of the circle
 * @param[in] start_angle Start angle of the circle
 * @param[in] direction Textpath direction
 *
 * @ingroup Efl_Ui_Textpath
  }
procedure efl_ui_textpath_circular_set(obj:PEo; radius:Tdouble; start_angle:Tdouble; direction:TEfl_Ui_Textpath_Direction);cdecl;external;
{*
 * @brief The number of slices. The larger the number of slice_num is, The
 * better the text follows the path.
 *
 * @param[in] obj The object.
 * @param[in] slice_no Number of slices
 *
 * @ingroup Efl_Ui_Textpath
  }
procedure efl_ui_textpath_slice_number_set(obj:PEo; slice_no:longint);cdecl;external;
{*
 * @brief The number of slices. The larger the number of slice_num is, The
 * better the text follows the path.
 *
 * @param[in] obj The object.
 *
 * @return Number of slices
 *
 * @ingroup Efl_Ui_Textpath
  }
(* Const before type ignored *)
function efl_ui_textpath_slice_number_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Control the ellipsis behavior of the textpath.
 *
 * @param[in] obj The object.
 * @param[in] ellipsis To ellipsis text or not
 *
 * @ingroup Efl_Ui_Textpath
  }
procedure efl_ui_textpath_ellipsis_set(obj:PEo; ellipsis:TEina_Bool);cdecl;external;
{*
 * @brief Control the ellipsis behavior of the textpath.
 *
 * @param[in] obj The object.
 *
 * @return To ellipsis text or not
 *
 * @ingroup Efl_Ui_Textpath
  }
(* Const before type ignored *)
function efl_ui_textpath_ellipsis_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TEXTPATH_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTPATH_CLASS:=efl_ui_textpath_class_get;
  end;


end.
