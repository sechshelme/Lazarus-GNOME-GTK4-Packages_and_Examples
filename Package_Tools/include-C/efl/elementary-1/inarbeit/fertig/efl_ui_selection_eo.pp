
unit efl_ui_selection_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_selection_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_selection_eo.h
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
PEfl_Ui_Cnp_Buffer  = ^Efl_Ui_Cnp_Buffer;
PEfl_Ui_Selection  = ^Efl_Ui_Selection;
PEfl_Ui_Wm_Selection_Changed  = ^Efl_Ui_Wm_Selection_Changed;
PEina_Content  = ^Eina_Content;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SELECTION_EO_H_}
{$define _EFL_UI_SELECTION_EO_H_}
{$ifndef _EFL_UI_SELECTION_EO_CLASS_TYPE}
{$define _EFL_UI_SELECTION_EO_CLASS_TYPE}
type
  PEfl_Ui_Selection = ^TEfl_Ui_Selection;
  TEfl_Ui_Selection = TEo;
{$endif}
{$ifndef _EFL_UI_SELECTION_EO_TYPES}
{$define _EFL_UI_SELECTION_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* System buffer to use in Copy & Paste operations.
 *
 * @ingroup Efl_Ui_Cnp_Buffer
  }
{*< Buffer typically used when the user
                                    * selects (highlights) some text without
                                    * explicitly requesting to copy it.  }
{*< Buffer used when the user requests
                                        * that the current selection is copied
                                        * (using Ctrl+C, for example).  }
type
  PEfl_Ui_Cnp_Buffer = ^TEfl_Ui_Cnp_Buffer;
  TEfl_Ui_Cnp_Buffer =  Longint;
  Const
    EFL_UI_CNP_BUFFER_SELECTION = 0;
    EFL_UI_CNP_BUFFER_COPY_AND_PASTE = 1;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Information sent along the @[Efl.Ui.Selection.wm_selection,changed] event.
 *
 * @ingroup Efl_Ui_Wm_Selection_Changed
  }
{*< The system buffer that has changed.  }
{*< The EFL widget that triggered the change.
                                * @c NULL if it is not an EFL widget.  }
{*< The seat that triggered the change.  }
type
  PEfl_Ui_Wm_Selection_Changed = ^TEfl_Ui_Wm_Selection_Changed;
  TEfl_Ui_Wm_Selection_Changed = record
      buffer : TEfl_Ui_Cnp_Buffer;
      caused_by : PEfl_Ui_Selection;
      seat : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This mixin provides the ability to interact with the system's Copy & Paste
 * facilities.
 *
 * @ingroup Efl_Ui_Selection
  }

{ was #define dname def_expr }
function EFL_UI_SELECTION_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_selection_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief Sets the current selection.
 *
 * This sends the selected data to the system's specified buffer, making it
 * available to other applications for "pasting" it.
 *
 * This is typically used when the user requests a "copy" operation.
 *
 * @param[in] obj The object.
 * @param[in] buffer System buffer to use.
 * @param[in] content Data to copy.
 * @param[in] seat Seat the data comes from. Use 0 when in doubt.
 *
 * @ingroup Efl_Ui_Selection
  }
procedure efl_ui_selection_set(obj:PEo; buffer:TEfl_Ui_Cnp_Buffer; content:PEina_Content; seat:dword);cdecl;external;
{*
 * @brief Clears the current selection.
 *
 * No data will be available to other applications to paste (until something
 * else is selected).
 *
 * @param[in] obj The object.
 * @param[in] buffer System buffer to clear.
 * @param[in] seat Seat to clear. Use 0 when in doubt.
 *
 * @ingroup Efl_Ui_Selection
  }
procedure efl_ui_selection_clear(obj:PEo; buffer:TEfl_Ui_Cnp_Buffer; seat:dword);cdecl;external;
{*
 * @brief Retrieves the data currently held in the specified buffer.
 *
 * This is typically used when the user requests a "paste" operation.
 *
 * This method is time consuming (since data can potentially be provided by
 * another application), therefore, it is recommended to verify the existence
 * of a selection using @ref efl_ui_selection_has_selection before calling it.
 *
 * @param[in] obj The object.
 * @param[in] buffer System buffer to use.
 * @param[in] seat Seat where the data should be pasted. Use 0 when in doubt.
 * @param[in] acceptable_types List of accepted IANA MIME types:
 * https://www.iana.org/assignments/media-types/media-types.xhtml If automatic
 * conversion cannot be provided to any of the accepted types, an error will be
 * returned.
 *
 * @return A future that will be resolved to the requested content, or to an
 * error if type conversion is not available or the requested buffer is empty.
 *
 * @ingroup Efl_Ui_Selection
  }
function efl_ui_selection_get(obj:PEo; buffer:TEfl_Ui_Cnp_Buffer; seat:dword; acceptable_types:PEina_Iterator):PEina_Future;cdecl;external;
{*
 * @brief Checks if the specified system buffer has content.
 *
 * @param[in] obj The object.
 * @param[in] buffer System buffer to query.
 * @param[in] seat Seat to query. Use 0 when in doubt.
 *
 * @return @c true if there is data available in the requested buffer.
 *
 * @ingroup Efl_Ui_Selection
  }
function efl_ui_selection_has_selection(obj:PEo; buffer:TEfl_Ui_Cnp_Buffer; seat:dword):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED : TEfl_Event_Description;cvar;external;
{* Event emitted when the content of one of the system's buffers changes.
 * @return Efl_Ui_Wm_Selection_Changed
 *
 * @ingroup Efl_Ui_Selection
  }

{ was #define dname def_expr }
function EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SELECTION_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_SELECTION_MIXIN:=efl_ui_selection_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED:=@(_EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED);
  end;


end.
