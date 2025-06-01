
unit efl_ui_pan_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_pan_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_pan_eo.h
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
PEfl_Ui_Pan  = ^Efl_Ui_Pan;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PAN_EO_H_}
{$define _EFL_UI_PAN_EO_H_}
{$ifndef _EFL_UI_PAN_EO_CLASS_TYPE}
{$define _EFL_UI_PAN_EO_CLASS_TYPE}
type
  PEfl_Ui_Pan = ^TEfl_Ui_Pan;
  TEfl_Ui_Pan = TEo;
{$endif}
{$ifndef _EFL_UI_PAN_EO_TYPES}
{$define _EFL_UI_PAN_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Pan widget class.
 *
 * This widget positions its contents (set using @ref efl_content_get) relative
 * to the widget itself. This is particularly useful for large content which
 * does not fit inside its container. In this case only a portion is shown.
 *
 * The position of this "window" into the content can be changed using
 * @ref efl_ui_pan_position_get. This widget does not provide means for a user
 * to change the content's position (like scroll bars). This widget is meant to
 * be used internally by other classes like @ref Efl_Ui_Scroll_Manager.
 *
 * @ingroup Efl_Ui_Pan
  }

{ was #define dname def_expr }
function EFL_UI_PAN_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_pan_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Position of the content inside the Pan widget.
 *
 * Setting the position to @ref efl_ui_pan_position_min_get makes the upper
 * left corner of the content visible. Setting the position to
 * @ref efl_ui_pan_position_max_get makes the lower right corner of the content
 * visible. Values outside this range are valid and make the background show.
 *
 * @param[in] obj The object.
 * @param[in] position Content position.
 *
 * @ingroup Efl_Ui_Pan
  }
procedure efl_ui_pan_position_set(obj:PEo; position:TEina_Position2D);cdecl;external;
{*
 * @brief Position of the content inside the Pan widget.
 *
 * Setting the position to @ref efl_ui_pan_position_min_get makes the upper
 * left corner of the content visible. Setting the position to
 * @ref efl_ui_pan_position_max_get makes the lower right corner of the content
 * visible. Values outside this range are valid and make the background show.
 *
 * @param[in] obj The object.
 *
 * @return Content position.
 *
 * @ingroup Efl_Ui_Pan
  }
(* Const before type ignored *)
function efl_ui_pan_position_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Size of the content currently set through @ref efl_content_get. This
 * is a convenience proxy.
 *
 * @param[in] obj The object.
 *
 * @return The size of the content.
 *
 * @ingroup Efl_Ui_Pan
  }
(* Const before type ignored *)
function efl_ui_pan_content_size_get(obj:PEo):TEina_Size2D;cdecl;external;
{*
 * @brief Position you can set to @ref efl_ui_pan_position_get so that the
 * content's upper left corner is visible. Always (0, 0).
 *
 * @param[in] obj The object.
 *
 * @return Content's upper left corner position.
 *
 * @ingroup Efl_Ui_Pan
  }
(* Const before type ignored *)
function efl_ui_pan_position_min_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Position you can set to @ref efl_ui_pan_position_get so that the
 * content's lower right corner is visible. It depends both on the content's
 * size and this widget's size.
 *
 * @param[in] obj The object.
 *
 * @return Content's lower right corner position.
 *
 * @ingroup Efl_Ui_Pan
  }
(* Const before type ignored *)
function efl_ui_pan_position_max_get(obj:PEo):TEina_Position2D;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED : TEfl_Event_Description;cvar;external;
{* The content's position has changed, its position in the event is the new
 * position.
 * @return Eina_Position2D
 *
 * @ingroup Efl_Ui_Pan
  }
(* Const before type ignored *)
    _EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED : TEfl_Event_Description;cvar;external;
{* The content's size has changed, its size in the event is the new size.
 * @return Eina_Size2D
 *
 * @ingroup Efl_Ui_Pan
  }

{ was #define dname def_expr }
function EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_PAN_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_PAN_CLASS:=efl_ui_pan_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED:=@(_EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED:=@(_EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED);
  end;


end.
