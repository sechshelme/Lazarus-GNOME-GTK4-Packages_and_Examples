
unit efl_ui_panel_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_panel_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_panel_eo.h
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
PEfl_Ui_Panel  = ^Efl_Ui_Panel;
PEfl_Ui_Panel_Orient  = ^Efl_Ui_Panel_Orient;
PEfl_Ui_Panel_Scroll_Info  = ^Efl_Ui_Panel_Scroll_Info;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PANEL_EO_H_}
{$define _EFL_UI_PANEL_EO_H_}
{$ifndef _EFL_UI_PANEL_EO_CLASS_TYPE}
{$define _EFL_UI_PANEL_EO_CLASS_TYPE}
type
  PEfl_Ui_Panel = ^TEfl_Ui_Panel;
  TEfl_Ui_Panel = TEo;
{$endif}
{$ifndef _EFL_UI_PANEL_EO_TYPES}
{$define _EFL_UI_PANEL_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Panel orientation mode
 *
 * @ingroup Efl_Ui_Panel_Orient
  }
{*< Panel (dis)appears from the top  }
{*< Panel (dis)appears from the bottom  }
{*< Panel (dis)appears from the left  }
{*< Panel (dis)appears from the right  }
type
  PEfl_Ui_Panel_Orient = ^TEfl_Ui_Panel_Orient;
  TEfl_Ui_Panel_Orient =  Longint;
  Const
    EFL_UI_PANEL_ORIENT_TOP = 0;
    EFL_UI_PANEL_ORIENT_BOTTOM = 1;
    EFL_UI_PANEL_ORIENT_LEFT = 2;
    EFL_UI_PANEL_ORIENT_RIGHT = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Panel scroll information
 *
 * @ingroup Efl_Ui_Panel_Scroll_Info
  }
{*< content scrolled position (0.0 ~ 1.0) in the panel  }
{*< content scrolled position (0.0 ~ 1.0) in the panel  }
type
  PEfl_Ui_Panel_Scroll_Info = ^TEfl_Ui_Panel_Scroll_Info;
  TEfl_Ui_Panel_Scroll_Info = record
      rel_x : Tdouble;
      rel_y : Tdouble;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary panel class
 *
 * @ingroup Efl_Ui_Panel
  }

{ was #define dname def_expr }
function EFL_UI_PANEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_panel_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The orientation of the panel
 *
 * Sets from where the panel will (dis)appear.
 *
 * @param[in] obj The object.
 * @param[in] orient The panel orientation.
 *
 * @ingroup Efl_Ui_Panel
  }
procedure efl_ui_panel_orient_set(obj:PEo; orient:TEfl_Ui_Panel_Orient);cdecl;external;
{*
 * @brief The orientation of the panel
 *
 * Sets from where the panel will (dis)appear.
 *
 * @param[in] obj The object.
 *
 * @return The panel orientation.
 *
 * @ingroup Efl_Ui_Panel
  }
(* Const before type ignored *)
function efl_ui_panel_orient_get(obj:PEo):TEfl_Ui_Panel_Orient;cdecl;external;
{*
 * @brief The state of the panel.
 *
 * @param[in] obj The object.
 * @param[in] hidden If @c true, the panel will run the animation to disappear.
 *
 * @ingroup Efl_Ui_Panel
  }
procedure efl_ui_panel_hidden_set(obj:PEo; hidden:TEina_Bool);cdecl;external;
{*
 * @brief The state of the panel.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the panel will run the animation to disappear.
 *
 * @ingroup Efl_Ui_Panel
  }
(* Const before type ignored *)
function efl_ui_panel_hidden_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The scrollability of the panel.
 *
 * @param[in] obj The object.
 * @param[in] scrollable The scrollable state.
 *
 * @ingroup Efl_Ui_Panel
  }
procedure efl_ui_panel_scrollable_set(obj:PEo; scrollable:TEina_Bool);cdecl;external;
{*
 * @brief The scrollability of the panel.
 *
 * @param[in] obj The object.
 *
 * @return The scrollable state.
 *
 * @ingroup Efl_Ui_Panel
  }
(* Const before type ignored *)
function efl_ui_panel_scrollable_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The size of the scrollable panel.
 *
 * @param[in] obj The object.
 * @param[in] ratio Size ratio
 *
 * @ingroup Efl_Ui_Panel
  }
procedure efl_ui_panel_scrollable_content_size_set(obj:PEo; ratio:Tdouble);cdecl;external;
{*
 * @brief The size of the scrollable panel.
 *
 * @param[in] obj The object.
 *
 * @return Size ratio
 *
 * @ingroup Efl_Ui_Panel
  }
(* Const before type ignored *)
function efl_ui_panel_scrollable_content_size_get(obj:PEo):Tdouble;cdecl;external;
{* Toggle the hidden state of the panel from code
 *
 * @ingroup Efl_Ui_Panel
  }
procedure efl_ui_panel_toggle(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_PANEL_EVENT_TOGGLED : TEfl_Event_Description;cvar;external;
{* Called when the hidden state was toggled
 *
 * @ingroup Efl_Ui_Panel
  }

{ was #define dname def_expr }
function EFL_UI_PANEL_EVENT_TOGGLED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_PANEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_PANEL_CLASS:=efl_ui_panel_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_PANEL_EVENT_TOGGLED : longint; { return type might be wrong }
  begin
    EFL_UI_PANEL_EVENT_TOGGLED:=@(_EFL_UI_PANEL_EVENT_TOGGLED);
  end;


end.
