
unit efl_ui_win_inlined_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_win_inlined_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_win_inlined_eo.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Win_Inlined  = ^Efl_Ui_Win_Inlined;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIN_INLINED_EO_H_}
{$define _EFL_UI_WIN_INLINED_EO_H_}
{$ifndef _EFL_UI_WIN_INLINED_EO_CLASS_TYPE}
{$define _EFL_UI_WIN_INLINED_EO_CLASS_TYPE}
type
  PEfl_Ui_Win_Inlined = ^TEfl_Ui_Win_Inlined;
  TEfl_Ui_Win_Inlined = TEo;
{$endif}
{$ifndef _EFL_UI_WIN_INLINED_EO_TYPES}
{$define _EFL_UI_WIN_INLINED_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An inlined window.
 *
 * The window is rendered onto an image buffer. No actual window is created,
 * instead the window and all of its contents will be rendered to an image
 * buffer. This allows child windows inside a parent just like any other
 * object.  You can also do other things like apply map effects. This window
 * must have a valid @ref Efl_Canvas_Object parent.
 *
 * @ingroup Efl_Ui_Win_Inlined
  }

{ was #define dname def_expr }
function EFL_UI_WIN_INLINED_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_win_inlined_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This property holds the parent object in the parent canvas.
 *
 * @param[in] obj The object.
 *
 * @return An object in the parent canvas.
 *
 * @ingroup Efl_Ui_Win_Inlined
  }
(* Const before type ignored *)
function efl_ui_win_inlined_parent_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIN_INLINED_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_WIN_INLINED_CLASS:=efl_ui_win_inlined_class_get;
  end;


end.
