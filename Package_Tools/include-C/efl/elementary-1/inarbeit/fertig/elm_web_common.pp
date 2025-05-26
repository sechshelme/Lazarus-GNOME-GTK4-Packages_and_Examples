
unit elm_web_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_web_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_web_common.h
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
Pchar  = ^char;
PEina_Bool  = ^Eina_Bool;
PEina_List  = ^Eina_List;
PElm_Web_Dialog_Alert  = ^Elm_Web_Dialog_Alert;
PElm_Web_Dialog_Confirm  = ^Elm_Web_Dialog_Confirm;
PElm_Web_Dialog_File_Selector  = ^Elm_Web_Dialog_File_Selector;
PElm_Web_Dialog_Prompt  = ^Elm_Web_Dialog_Prompt;
PElm_Web_Download  = ^Elm_Web_Download;
PElm_Web_Frame_Load_Error  = ^Elm_Web_Frame_Load_Error;
PElm_Web_Menu  = ^Elm_Web_Menu;
PElm_Web_Menu_Item  = ^Elm_Web_Menu_Item;
PElm_Web_Menu_Item_Type  = ^Elm_Web_Menu_Item_Type;
PElm_Web_Window_Feature_Flag  = ^Elm_Web_Window_Feature_Flag;
PElm_Web_Window_Features  = ^Elm_Web_Window_Features;
PElm_Web_Window_Open  = ^Elm_Web_Window_Open;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Web
 *
 * @
  }
{*
 * Structure used to report load errors.
 *
 * Load errors are reported as signal by elm_web. All the strings are
 * temporary references and should @b not be used after the signal
 * callback returns. If it's required, make copies with strdup() or
 * eina_stringshare_add() (they are not even guaranteed to be
 * stringshared, so must use eina_stringshare_add() and not
 * eina_stringshare_ref()).
  }
type
{*
 * Structure used to report load errors.
 *
 * Load errors are reported as signal by elm_web. All the strings are
 * temporary references and should @b not be used after the signal
 * callback returns. If it's required, make copies with strdup() or
 * eina_stringshare_add() (they are not even guaranteed to be
 * stringshared, so must use eina_stringshare_add() and not
 * eina_stringshare_ref()).
  }
{*< Numeric error code  }
{*< Error produced by canceling a request  }
(* Const before type ignored *)
{*< Error domain name  }
(* Const before type ignored *)
{*< Error description (already localized)  }
(* Const before type ignored *)
{*< The URL that failed to load  }
{*< Frame object that produced the error  }
  PElm_Web_Frame_Load_Error = ^TElm_Web_Frame_Load_Error;
  TElm_Web_Frame_Load_Error = record
      code : longint;
      is_cancellation : TEina_Bool;
      domain : Pchar;
      description : Pchar;
      failing_url : Pchar;
      frame : PEvas_Object;
    end;

{*
 * The possibles types that the items in a menu can be
  }

  PElm_Web_Menu_Item_Type = ^TElm_Web_Menu_Item_Type;
  TElm_Web_Menu_Item_Type =  Longint;
  Const
    ELM_WEB_MENU_SEPARATOR = 0;
    ELM_WEB_MENU_GROUP = 1;
    ELM_WEB_MENU_OPTION = 2;
;
{*
 * Structure describing the items in a menu
  }
type
{*
 * Structure describing the items in a menu
  }
(* Const before type ignored *)
{*< The text for the item  }
{*< The type of the item  }
  PElm_Web_Menu_Item = ^TElm_Web_Menu_Item;
  TElm_Web_Menu_Item = record
      text : Pchar;
      _type : TElm_Web_Menu_Item_Type;
    end;

{*
 * Structure describing the menu of a popup
 *
 * This structure will be passed as the @p event_info for the "popup,create"
 * signal, which is emitted when a dropdown menu is opened. Users wanting
 * to handle these popups by themselves should listen to this signal and
 * set the @c handled property of the struct to @c EINA_TRUE. Leaving this
 * property as @c EINA_FALSE means that the user will not handle the popup
 * and the default implementation will be used.
 *
 * When the popup is ready to be dismissed, a "popup,willdelete" signal
 * will be emitted to notify the user that it can destroy any objects and
 * free all data related to it.
 *
 * @see elm_web_popup_selected_set()
 * @see elm_web_popup_destroy()
  }
{*
 * Structure describing the menu of a popup
 *
 * This structure will be passed as the @p event_info for the "popup,create"
 * signal, which is emitted when a dropdown menu is opened. Users wanting
 * to handle these popups by themselves should listen to this signal and
 * set the @c handled property of the struct to @c EINA_TRUE. Leaving this
 * property as @c EINA_FALSE means that the user will not handle the popup
 * and the default implementation will be used.
 *
 * When the popup is ready to be dismissed, a "popup,willdelete" signal
 * will be emitted to notify the user that it can destroy any objects and
 * free all data related to it.
 *
 * @see elm_web_popup_selected_set()
 * @see elm_web_popup_destroy()
  }
{*< List of #Elm_Web_Menu_Item  }
{*< The X position of the popup, relative to the elm_web object  }
{*< The Y position of the popup, relative to the elm_web object  }
{*< Width of the popup menu  }
{*< Height of the popup menu  }
{*< Set to @c EINA_TRUE by the user to indicate that the popup has been handled and the default implementation should be ignored. Leave as @c EINA_FALSE otherwise.  }
  PElm_Web_Menu = ^TElm_Web_Menu;
  TElm_Web_Menu = record
      items : PEina_List;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      flag0 : word;
    end;


const
  bm_TElm_Web_Menu_handled = $1;
  bp_TElm_Web_Menu_handled = 0;

function handled(var a : TElm_Web_Menu) : TEina_Bool;
procedure set_handled(var a : TElm_Web_Menu; __handled : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Web_Download = ^TElm_Web_Download;
  TElm_Web_Download = record
      url : Pchar;
    end;

{*
 * Opaque handler containing the features (such as statusbar, menubar, etc)
 * that are to be set on a newly requested window.
  }
{*
 * Definitions of web window features.
 *
  }

  PElm_Web_Window_Feature_Flag = ^TElm_Web_Window_Feature_Flag;
  TElm_Web_Window_Feature_Flag =  Longint;
  Const
    ELM_WEB_WINDOW_FEATURE_TOOLBAR = 0;
    ELM_WEB_WINDOW_FEATURE_STATUSBAR = 1;
    ELM_WEB_WINDOW_FEATURE_SCROLLBARS = 2;
    ELM_WEB_WINDOW_FEATURE_MENUBAR = 3;
    ELM_WEB_WINDOW_FEATURE_LOCATIONBAR = 4;
    ELM_WEB_WINDOW_FEATURE_FULLSCREEN = 5;
;
{*
 * Callback type for the create_window hook.
 *
 * @param data User data pointer set when setting the hook function.
 * @param obj The elm_web object requesting the new window.
 * @param js Set to @c EINA_TRUE if the request was originated from
 * JavaScript. @c EINA_FALSE otherwise.
 * @param window_features A pointer of #Elm_Web_Window_Features indicating
 * the features requested for the new window.
 *
 * @return The @c elm_web widget where the request will be loaded. That is,
 * if a new window or tab is created, the elm_web widget in it should be
 * returned, and @b NOT the window object. Returning @c NULL should cancel
 * the request.
 *
 * @see elm_web_window_create_hook_set()
  }
(* Const before type ignored *)
type
  PElm_Web_Window_Open = ^TElm_Web_Window_Open;
  TElm_Web_Window_Open = function (data:pointer; obj:PEvas_Object; js:TEina_Bool; window_features:PElm_Web_Window_Features):PEvas_Object;cdecl;
{*
 * Callback type for the JS alert hook.
 *
 * @param data User data pointer set when setting the hook function.
 * @param obj The elm_web object requesting the new window.
 * @param message The message to show in the alert dialog.
 *
 * @return The object representing the alert dialog.
 * Elm_Web will run a second main loop to handle the dialog and normal
 * flow of the application will be restored when the object is deleted, so
 * the user should handle the popup properly in order to delete the object
 * when the action is finished.
 * If the function returns @c NULL the popup will be ignored.
 *
 * @see elm_web_dialog_alert_hook_set()
  }
(* Const before type ignored *)

  PElm_Web_Dialog_Alert = ^TElm_Web_Dialog_Alert;
  TElm_Web_Dialog_Alert = function (data:pointer; obj:PEvas_Object; message:Pchar):PEvas_Object;cdecl;
{*
 * Callback type for the JS confirm hook.
 *
 * @param data User data pointer set when setting the hook function.
 * @param obj The elm_web object requesting the new window.
 * @param message The message to show in the confirm dialog.
 * @param ret Pointer to store the user selection. @c EINA_TRUE if
 * the user selected @c Ok, @c EINA_FALSE otherwise.
 *
 * @return The object representing the confirm dialog.
 * Elm_Web will run a second main loop to handle the dialog and normal
 * flow of the application will be restored when the object is deleted, so
 * the user should handle the popup properly in order to delete the object
 * when the action is finished.
 * If the function returns @c NULL the popup will be ignored.
 *
 * @see elm_web_dialog_confirm_hook_set()
  }
(* Const before type ignored *)

  PElm_Web_Dialog_Confirm = ^TElm_Web_Dialog_Confirm;
  TElm_Web_Dialog_Confirm = function (data:pointer; obj:PEvas_Object; message:Pchar; ret:PEina_Bool):PEvas_Object;cdecl;
{*
 * Callback type for the JS prompt hook.
 *
 * @param data User data pointer set when setting the hook function.
 * @param obj The elm_web object requesting the new window.
 * @param message The message to show in the prompt dialog.
 * @param def_value The default value to present the user in the entry
 * @param value Pointer to store the value given by the user. Must
 * be a malloc'ed string or @c NULL if the user canceled the popup.
 * @param ret Pointer to store the user selection. @c EINA_TRUE if
 * the user selected @c Ok, @c EINA_FALSE otherwise.
 *
 * @return The object representing the prompt dialog.
 * Elm_Web will run a second main loop to handle the dialog and normal
 * flow of the application will be restored when the object is deleted, so
 * the user should handle the popup properly in order to delete the object
 * when the action is finished.
 * If the function returns @c NULL the popup will be ignored.
 *
 * @see elm_web_dialog_prompt_hook_set()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PElm_Web_Dialog_Prompt = ^TElm_Web_Dialog_Prompt;
  TElm_Web_Dialog_Prompt = function (data:pointer; obj:PEvas_Object; message:Pchar; def_value:Pchar; value:PPchar; 
               ret:PEina_Bool):PEvas_Object;cdecl;
{*
 * Callback type for the JS file selector hook.
 *
 * @param data User data pointer set when setting the hook function.
 * @param obj The elm_web object requesting the new window.
 * @param allows_multiple @c EINA_TRUE if multiple files can be selected.
 * @param accept_types Mime types accepted.
 * @param selected Pointer to store the list of malloc'ed strings
 * containing the path to each file selected. Must be @c NULL if the file
 * dialog is canceled.
 * @param ret Pointer to store the user selection. @c EINA_TRUE if
 * the user selected @c Ok, @c EINA_FALSE otherwise.
 *
 * @return The object representing the file selector dialog.
 * Elm_Web will run a second main loop to handle the dialog and normal
 * flow of the application will be restored when the object is deleted, so
 * the user should handle the popup properly in order to delete the object
 * when the action is finished.
 * If the function returns @c NULL the popup will be ignored.
 *
 * @see elm_web_dialog_file selector_hook_set()
  }

  PElm_Web_Dialog_File_Selector = ^TElm_Web_Dialog_File_Selector;
  TElm_Web_Dialog_File_Selector = function (data:pointer; obj:PEvas_Object; allows_multiple:TEina_Bool; accept_types:PEina_List; selected:PPEina_List; 
               ret:PEina_Bool):PEvas_Object;cdecl;
{*
 * Callback type for the JS console message hook.
 *
 * When a console message is added from JavaScript, any set function to the
 * console message hook will be called for the user to handle. There is no
 * default implementation of this hook.
 *
 * @param data User data pointer set when setting the hook function.
 * @param obj The elm_web object that originated the message.
 * @param message The message sent.
 * @param line_number The line number.
 * @param source_id Source id.
 *
 * @see elm_web_console_message_hook_set()
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TElm_Web_Console_Message = procedure (data:pointer; obj:PEvas_Object; message:Pchar; line_number:dword; source_id:Pchar);cdecl;
{*
 * Get boolean properties from Elm_Web_Window_Features
 * (such as statusbar, menubar, etc) that are on a window.
 *
 * @param wf The web window features object
 * @param flag The web window feature flag whose value is required.
 *
 * @return @c EINA_TRUE if the flag is set, @c EINA_FALSE otherwise
  }
(* Const before type ignored *)

function elm_web_window_features_property_get(wf:PElm_Web_Window_Features; flag:TElm_Web_Window_Feature_Flag):TEina_Bool;cdecl;external;
{*
 *
 * TODO : Add documentation.
 *
 * @param wf The web window features object
 * @param x, y, w, h - the co-ordinates of the web view window.
  }
(* Const before type ignored *)
procedure elm_web_window_features_region_get(wf:PElm_Web_Window_Features; x:PEvas_Coord; y:PEvas_Coord; w:PEvas_Coord; h:PEvas_Coord);cdecl;external;
procedure elm_web_window_features_ref(wf:PElm_Web_Window_Features);cdecl;external;
procedure elm_web_window_features_unref(wf:PElm_Web_Window_Features);cdecl;external;
{*
 * @
  }

implementation

function handled(var a : TElm_Web_Menu) : TEina_Bool;
begin
  handled:=(a.flag0 and bm_TElm_Web_Menu_handled) shr bp_TElm_Web_Menu_handled;
end;

procedure set_handled(var a : TElm_Web_Menu; __handled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__handled shl bp_TElm_Web_Menu_handled) and bm_TElm_Web_Menu_handled);
end;


end.
