
unit Ecore_IMF;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_IMF.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_IMF.h
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
PEcore_IMF_Autocapital_Type  = ^Ecore_IMF_Autocapital_Type;
PEcore_IMF_BiDi_Direction  = ^Ecore_IMF_BiDi_Direction;
PEcore_IMF_Callback_Type  = ^Ecore_IMF_Callback_Type;
PEcore_IMF_Candidate_Panel_State  = ^Ecore_IMF_Candidate_Panel_State;
PEcore_IMF_Context  = ^Ecore_IMF_Context;
PEcore_IMF_Context_Class  = ^Ecore_IMF_Context_Class;
PEcore_IMF_Context_Info  = ^Ecore_IMF_Context_Info;
PEcore_IMF_Device_Class  = ^Ecore_IMF_Device_Class;
PEcore_IMF_Device_Subclass  = ^Ecore_IMF_Device_Subclass;
PEcore_IMF_Event  = ^Ecore_IMF_Event;
PEcore_IMF_Event_Commit  = ^Ecore_IMF_Event_Commit;
PEcore_IMF_Event_Commit_Content  = ^Ecore_IMF_Event_Commit_Content;
PEcore_IMF_Event_Delete_Surrounding  = ^Ecore_IMF_Event_Delete_Surrounding;
PEcore_IMF_Event_Key_Down  = ^Ecore_IMF_Event_Key_Down;
PEcore_IMF_Event_Key_Up  = ^Ecore_IMF_Event_Key_Up;
PEcore_IMF_Event_Mouse_Down  = ^Ecore_IMF_Event_Mouse_Down;
PEcore_IMF_Event_Mouse_In  = ^Ecore_IMF_Event_Mouse_In;
PEcore_IMF_Event_Mouse_Move  = ^Ecore_IMF_Event_Mouse_Move;
PEcore_IMF_Event_Mouse_Out  = ^Ecore_IMF_Event_Mouse_Out;
PEcore_IMF_Event_Mouse_Up  = ^Ecore_IMF_Event_Mouse_Up;
PEcore_IMF_Event_Mouse_Wheel  = ^Ecore_IMF_Event_Mouse_Wheel;
PEcore_IMF_Event_Preedit_Changed  = ^Ecore_IMF_Event_Preedit_Changed;
PEcore_IMF_Event_Preedit_End  = ^Ecore_IMF_Event_Preedit_End;
PEcore_IMF_Event_Preedit_Start  = ^Ecore_IMF_Event_Preedit_Start;
PEcore_IMF_Event_Selection  = ^Ecore_IMF_Event_Selection;
PEcore_IMF_Event_Type  = ^Ecore_IMF_Event_Type;
PEcore_IMF_Input_Hints  = ^Ecore_IMF_Input_Hints;
PEcore_IMF_Input_Mode  = ^Ecore_IMF_Input_Mode;
PEcore_IMF_Input_Panel_Event  = ^Ecore_IMF_Input_Panel_Event;
PEcore_IMF_Input_Panel_Keyboard_Mode  = ^Ecore_IMF_Input_Panel_Keyboard_Mode;
PEcore_IMF_Input_Panel_Lang  = ^Ecore_IMF_Input_Panel_Lang;
PEcore_IMF_Input_Panel_Layout  = ^Ecore_IMF_Input_Panel_Layout;
PEcore_IMF_Input_Panel_Layout_Normal_Variation  = ^Ecore_IMF_Input_Panel_Layout_Normal_Variation;
PEcore_IMF_Input_Panel_Layout_Numberonly_Variation  = ^Ecore_IMF_Input_Panel_Layout_Numberonly_Variation;
PEcore_IMF_Input_Panel_Layout_Password_Variation  = ^Ecore_IMF_Input_Panel_Layout_Password_Variation;
PEcore_IMF_Input_Panel_Return_Key_Type  = ^Ecore_IMF_Input_Panel_Return_Key_Type;
PEcore_IMF_Input_Panel_Shift_Mode  = ^Ecore_IMF_Input_Panel_Shift_Mode;
PEcore_IMF_Input_Panel_State  = ^Ecore_IMF_Input_Panel_State;
PEcore_IMF_Keyboard_Locks  = ^Ecore_IMF_Keyboard_Locks;
PEcore_IMF_Keyboard_Modifiers  = ^Ecore_IMF_Keyboard_Modifiers;
PEcore_IMF_Mouse_Flags  = ^Ecore_IMF_Mouse_Flags;
PEcore_IMF_Preedit_Attr  = ^Ecore_IMF_Preedit_Attr;
PEcore_IMF_Preedit_Type  = ^Ecore_IMF_Preedit_Type;
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_IMF_H}
{$define _ECORE_IMF_H}
{$include <Eina.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ @deprecated since 1.24  }

const
  ECORE_IMF_INPUT_HINT_AUTOFILL_MASK = $ff00;  
{*
 * @defgroup Ecore_IMF_Lib_Group Ecore_IMF - Ecore Input Method Library Functions
 * @ingroup Ecore
 *
 * Utility functions that set up and shut down the Ecore Input Method
 * library.
  }
{*
 * @defgroup Ecore_IMF_Context_Group Ecore Input Method Context Functions
 * @ingroup Ecore_IMF_Lib_Group
 *
 * @section ecore_imf_intro Introduction
 *
 * Functions that operate on Ecore Input Method Context objects.

 * Ecore Input Method Context Function defines the interface for EFL input methods.
 * An input method is used by EFL text input widgets like elm_entry
 * (based on edje_entry) to map from key events to Unicode character strings.
 *
 * The default input method can be set through setting the ECORE_IMF_MODULE environment variable.
 * eg) export ECORE_IMF_MODULE=xim (or scim or ibus)
 *
 * An input method may consume multiple key events in sequence and finally output the composed result.
 * This is called preediting, and an input method may provide feedback about
 * this process by displaying the intermediate composition states as preedit text.
 *
 * Immodule is plugin to connect your application and input method framework such as SCIM, ibus, and so on.@n
 * ecore_imf_init() should be called to initialize and load immodule.@n
 * ecore_imf_shutdown() is used for shutdowning and unloading immodule.
 *
 * @section how-to-compose How to process key event for composition or prediction
 *
 * To input Chinese, Japanese, Korean and other complex languages, the editor widget (as known as entry) should be connected with input method framework.@n
 * Each editor widget should have each input context to connect with input service framework.@n
 * Key event is processed by input method engine. The result is notified to application through ECORE_IMF_CALLBACK_PREEDIT_CHANGED and ECORE_IMF_CALLBACK_COMMIT event.@n
 * @n
 * The following example demonstrates how to connect input method framework and handle preedit and commit string from input method framework.
 * @li @ref ecore_imf_example_c
 *
 * @section media-content How to receive media contents from input method editor
 *
 * Users sometimes wants to send images and other rich content with their input method editor (as known as virtual keyboard or soft keyboard).@n
 * According to this requirement, the way to receive the media content URI such as images and other rich content as well as text have been provided since 1.20.@n
 * @n
 * The following code shows how to receive the media content URI.
 *
 * @code
 * #include <glib.h>
 *
 * static void
 * _imf_event_commit_content_cb(void *data, Ecore_IMF_Context *ctx, void *event_info)
 * 
 *    Ecore_IMF_Event_Commit_Content *commit_content = (Ecore_IMF_Event_Commit_Content *)event_info;
 *    if (!commit_content) return;
 *
 *    // convert URI to filename
 *    gchar *filepath = g_filename_from_uri(commit_content->content_uri, NULL, NULL);
 *    printf("filepath : %s, description : %s, mime types : %s\n", filepath, commit_content->description, commit_content->mime_types);
 *
 *    // do something to use filepath
 *
 *    if (filepath)
 *       g_free(filepath);
 * 
 *
 * ecore_imf_context_event_callback_add(en->imf_context, ECORE_IMF_CALLBACK_COMMIT_CONTENT, _imf_event_commit_content_cb, data);
 * @endcode
 *
  }
{*
 * @addtogroup Ecore_IMF_Context_Group
 *
 * @
  }
{*
 * @example ecore_imf_example.c
 * Shows how to write simple editor using the Ecore_IMF library.
  }
{ ecore_imf_context_input_panel_event_callback_add() flag  }
{*
 * @typedef Ecore_IMF_Input_Panel_Event
 * Enum containing input panel events.
  }
{*< called when the state of the input panel is changed. @since 1.7  }
{*< called when the language of the input panel is changed. @since 1.7  }
{*< called when the shift key state of the input panel is changed @since 1.7  }
{*< called when the size of the input panel is changed. @since 1.7  }
{*< called when the state of the candidate word panel is changed. @since 1.7  }
{*< called when the size of the candidate word panel is changed. @since 1.7  }
{*< called when the keyboard mode state of the input panel is changed @since 1.20  }
type
  PEcore_IMF_Input_Panel_Event = ^TEcore_IMF_Input_Panel_Event;
  TEcore_IMF_Input_Panel_Event =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_STATE_EVENT = 0;
    ECORE_IMF_INPUT_PANEL_LANGUAGE_EVENT = 1;
    ECORE_IMF_INPUT_PANEL_SHIFT_MODE_EVENT = 2;
    ECORE_IMF_INPUT_PANEL_GEOMETRY_EVENT = 3;
    ECORE_IMF_CANDIDATE_PANEL_STATE_EVENT = 4;
    ECORE_IMF_CANDIDATE_PANEL_GEOMETRY_EVENT = 5;
    ECORE_IMF_INPUT_PANEL_KEYBOARD_MODE_EVENT = 6;
;
{*
 * @typedef Ecore_IMF_Input_Panel_State
 * Enum containing input panel state notifications.
  }
{*< Notification after the display of the input panel @since 1.7  }
{*< Notification prior to the dismissal of the input panel @since 1.7  }
{*< Notification prior to the display of the input panel @since 1.7  }
type
  PEcore_IMF_Input_Panel_State = ^TEcore_IMF_Input_Panel_State;
  TEcore_IMF_Input_Panel_State =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_STATE_SHOW = 0;
    ECORE_IMF_INPUT_PANEL_STATE_HIDE = 1;
    ECORE_IMF_INPUT_PANEL_STATE_WILL_SHOW = 2;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Shift_Mode
 * Enum containing input shift mode states.
  }
{*< @since 1.7  }
{*< @since 1.7  }
type
  PEcore_IMF_Input_Panel_Shift_Mode = ^TEcore_IMF_Input_Panel_Shift_Mode;
  TEcore_IMF_Input_Panel_Shift_Mode =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_SHIFT_MODE_OFF = 0;
    ECORE_IMF_INPUT_PANEL_SHIFT_MODE_ON = 1;
;
{*
 * @typedef Ecore_IMF_Candidate_Panel_State
 * Enum containing candidate word panel state notifications.
  }
{*< Notification after the display of the candidate word panel @since 1.7  }
{*< Notification prior to the dismissal of the candidate word panel @since 1.7  }
type
  PEcore_IMF_Candidate_Panel_State = ^TEcore_IMF_Candidate_Panel_State;
  TEcore_IMF_Candidate_Panel_State =  Longint;
  Const
    ECORE_IMF_CANDIDATE_PANEL_SHOW = 0;
    ECORE_IMF_CANDIDATE_PANEL_HIDE = 1;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Keyboard_Mode
 * Enum containing keyboard mode states.
  }
{*< @since 1.20  }
{*< @since 1.20  }
type
  PEcore_IMF_Input_Panel_Keyboard_Mode = ^TEcore_IMF_Input_Panel_Keyboard_Mode;
  TEcore_IMF_Input_Panel_Keyboard_Mode =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_HW_KEYBOARD_MODE = 0;
    ECORE_IMF_INPUT_PANEL_SW_KEYBOARD_MODE = 1;
;
{ Events sent by the Input Method  }
type
{ Events to filter  }

  PEcore_IMF_Event = ^TEcore_IMF_Event;
  TEcore_IMF_Event = TEcore_IMF_Event;
{*< An Input Method Context  }
{*< An Input Method Context class  }
{*< An Input Method Context info  }
{ Preedit attribute info  }
  var
    ECORE_IMF_EVENT_PREEDIT_START : longint;cvar;external;
    ECORE_IMF_EVENT_PREEDIT_END : longint;cvar;external;
    ECORE_IMF_EVENT_PREEDIT_CHANGED : longint;cvar;external;
    ECORE_IMF_EVENT_COMMIT : longint;cvar;external;
    ECORE_IMF_EVENT_DELETE_SURROUNDING : longint;cvar;external;
{*
 * @typedef Ecore_IMF_Event_Cb
 *
 * @brief Called when a Ecore_IMF event happens.
 *
 * @see  ecore_imf_context_event_callback_add()
  }
type

  TEcore_IMF_Event_Cb = procedure (data:pointer; ctx:PEcore_IMF_Context; event_info:pointer);cdecl;
{*
 * @typedef Ecore_IMF_Callback_Type
 *
 * Ecore IMF Event callback types.
 *
 * @see ecore_imf_context_event_callback_add()
  }
{*< "PREEDIT_START" is called when a new preediting sequence starts. @since 1.2  }
{*< "PREEDIT_END" is called when a preediting sequence has been completed or canceled. @since 1.2  }
{*< "PREEDIT_CHANGED" is called whenever the preedit sequence currently being entered has changed. @since 1.2  }
{*< "COMMIT" is called when a complete input sequence has been entered by the user @since 1.2  }
{*< "DELETE_SURROUNDING" is called when the input method needs to delete all or part of the context surrounding the cursor @since 1.2  }
{*< "SELECTION_SET" is called when the input method needs to set the selection @since 1.9  }
{*< "PRIVATE_COMMAND_SEND" is called when the input method sends a private command @since 1.12  }
{*< "COMMIT_CONTENT" is called when the input method commits content such as an image @since 1.20  }
{*< "TRANSACTION_START" is called when a new transaction sequence starts. @since 1.21  }
{*< "TRANSACTION_END" is called when a new transaction sequence starts. @since 1.21  }

  PEcore_IMF_Callback_Type = ^TEcore_IMF_Callback_Type;
  TEcore_IMF_Callback_Type =  Longint;
  Const
    ECORE_IMF_CALLBACK_PREEDIT_START = 0;
    ECORE_IMF_CALLBACK_PREEDIT_END = 1;
    ECORE_IMF_CALLBACK_PREEDIT_CHANGED = 2;
    ECORE_IMF_CALLBACK_COMMIT = 3;
    ECORE_IMF_CALLBACK_DELETE_SURROUNDING = 4;
    ECORE_IMF_CALLBACK_SELECTION_SET = 5;
    ECORE_IMF_CALLBACK_PRIVATE_COMMAND_SEND = 6;
    ECORE_IMF_CALLBACK_COMMIT_CONTENT = 7;
    ECORE_IMF_CALLBACK_TRANSACTION_START = 8;
    ECORE_IMF_CALLBACK_TRANSACTION_END = 9;
;
{*
 * @typedef Ecore_IMF_Event_Type
 *
 * Ecore IMF event types.
 *
 * @see ecore_imf_context_filter_event()
  }
{*< Mouse Down event  }
{*< Mouse Up event  }
{*< Mouse In event  }
{*< Mouse Out event  }
{*< Mouse Move event  }
{*< Mouse Wheel event  }
{*< Key Down event  }
{*< Key Up event  }
type
  PEcore_IMF_Event_Type = ^TEcore_IMF_Event_Type;
  TEcore_IMF_Event_Type =  Longint;
  Const
    ECORE_IMF_EVENT_MOUSE_DOWN = 0;
    ECORE_IMF_EVENT_MOUSE_UP = 1;
    ECORE_IMF_EVENT_MOUSE_IN = 2;
    ECORE_IMF_EVENT_MOUSE_OUT = 3;
    ECORE_IMF_EVENT_MOUSE_MOVE = 4;
    ECORE_IMF_EVENT_MOUSE_WHEEL = 5;
    ECORE_IMF_EVENT_KEY_DOWN = 6;
    ECORE_IMF_EVENT_KEY_UP = 7;
;
{*
 * @typedef Ecore_IMF_Keyboard_Modifiers
 * Types for Ecore_IMF keyboard modifiers
  }
{*< No active modifiers  }
{*< "Control" is pressed  }
{*< "Alt" is pressed  }
{*< "Shift" is pressed  }
{*< "Win" (between "Ctrl" and "Alt") is pressed  }
{*< "AltGr" is pressed @since 1.7  }
type
  PEcore_IMF_Keyboard_Modifiers = ^TEcore_IMF_Keyboard_Modifiers;
  TEcore_IMF_Keyboard_Modifiers =  Longint;
  Const
    ECORE_IMF_KEYBOARD_MODIFIER_NONE = 0;
    ECORE_IMF_KEYBOARD_MODIFIER_CTRL = 1 shl 0;
    ECORE_IMF_KEYBOARD_MODIFIER_ALT = 1 shl 1;
    ECORE_IMF_KEYBOARD_MODIFIER_SHIFT = 1 shl 2;
    ECORE_IMF_KEYBOARD_MODIFIER_WIN = 1 shl 3;
    ECORE_IMF_KEYBOARD_MODIFIER_ALTGR = 1 shl 4;
;
{*
 * @typedef Ecore_IMF_Keyboard_Locks
 * Types for Ecore_IMF keyboard locks
  }
{*< No locks are active  }
{*< "Num" lock is active  }
{*< "Caps" lock is active  }
{*< "Scroll" lock is active  }
type
  PEcore_IMF_Keyboard_Locks = ^TEcore_IMF_Keyboard_Locks;
  TEcore_IMF_Keyboard_Locks =  Longint;
  Const
    ECORE_IMF_KEYBOARD_LOCK_NONE = 0;
    ECORE_IMF_KEYBOARD_LOCK_NUM = 1 shl 0;
    ECORE_IMF_KEYBOARD_LOCK_CAPS = 1 shl 1;
    ECORE_IMF_KEYBOARD_LOCK_SCROLL = 1 shl 2;
;
{*
 * @typedef Ecore_IMF_Mouse_Flags
 * Types for Ecore_IMF mouse flags
  }
{*< A single click  }
{*< A double click  }
{*< A triple click  }
type
  PEcore_IMF_Mouse_Flags = ^TEcore_IMF_Mouse_Flags;
  TEcore_IMF_Mouse_Flags =  Longint;
  Const
    ECORE_IMF_MOUSE_NONE = 0;
    ECORE_IMF_MOUSE_DOUBLE_CLICK = 1 shl 0;
    ECORE_IMF_MOUSE_TRIPLE_CLICK = 1 shl 1;
;
{*
 * @typedef Ecore_IMF_Input_Mode
 * Types for Ecore_IMF input mode
  }
type
  PEcore_IMF_Input_Mode = ^TEcore_IMF_Input_Mode;
  TEcore_IMF_Input_Mode =  Longint;
  Const
    ECORE_IMF_INPUT_MODE_ALPHA = 1 shl 0;
    ECORE_IMF_INPUT_MODE_NUMERIC = 1 shl 1;
    ECORE_IMF_INPUT_MODE_SPECIAL = 1 shl 2;
    ECORE_IMF_INPUT_MODE_HEXA = 1 shl 3;
    ECORE_IMF_INPUT_MODE_TELE = 1 shl 4;
    ECORE_IMF_INPUT_MODE_FULL = (ECORE_IMF_INPUT_MODE_ALPHA or ECORE_IMF_INPUT_MODE_NUMERIC) or ECORE_IMF_INPUT_MODE_SPECIAL;
    ECORE_IMF_INPUT_MODE_INVISIBLE = 1 shl 29;
    ECORE_IMF_INPUT_MODE_AUTOCAP = 1 shl 30;
;
{*
 * @typedef Ecore_IMF_Preedit_Type
 *
 * Ecore IMF Preedit style types
 *
 * @see ecore_imf_context_preedit_string_with_attributes_get()
  }
{*< None style @since 1.1  }
{*< Substring style 1 @since 1.1  }
{*< Substring style 2 @since 1.1  }
{*< Substring style 3 @since 1.1  }
{*< Substring style 4 @since 1.8  }
{*< Substring style 5 @since 1.8  }
{*< Substring style 6 @since 1.8  }
{*< Substring style 7 @since 1.8  }
type
  PEcore_IMF_Preedit_Type = ^TEcore_IMF_Preedit_Type;
  TEcore_IMF_Preedit_Type =  Longint;
  Const
    ECORE_IMF_PREEDIT_TYPE_NONE = 0;
    ECORE_IMF_PREEDIT_TYPE_SUB1 = 1;
    ECORE_IMF_PREEDIT_TYPE_SUB2 = 2;
    ECORE_IMF_PREEDIT_TYPE_SUB3 = 3;
    ECORE_IMF_PREEDIT_TYPE_SUB4 = 4;
    ECORE_IMF_PREEDIT_TYPE_SUB5 = 5;
    ECORE_IMF_PREEDIT_TYPE_SUB6 = 6;
    ECORE_IMF_PREEDIT_TYPE_SUB7 = 7;
;
{*
 * @typedef Ecore_IMF_Autocapital_Type
 *
 * Autocapitalization Types.
 *
 * @see ecore_imf_context_autocapital_type_set()
  }
{*< No auto-capitalization when typing @since 1.1  }
{*< Autocapitalize each word typed @since 1.1  }
{*< Autocapitalize the start of each sentence @since 1.1  }
{*< Autocapitalize all letters @since 1.1  }
type
  PEcore_IMF_Autocapital_Type = ^TEcore_IMF_Autocapital_Type;
  TEcore_IMF_Autocapital_Type =  Longint;
  Const
    ECORE_IMF_AUTOCAPITAL_TYPE_NONE = 0;
    ECORE_IMF_AUTOCAPITAL_TYPE_WORD = 1;
    ECORE_IMF_AUTOCAPITAL_TYPE_SENTENCE = 2;
    ECORE_IMF_AUTOCAPITAL_TYPE_ALLCHARACTER = 3;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Layout
 *
 * Input panel (virtual keyboard) layout types.
 *
 * @see ecore_imf_context_input_panel_layout_set()
  }
{*< Default layout  }
{*< Number layout  }
{*< Email layout  }
{*< URL layout  }
{*< Phone Number layout  }
{*< IP layout  }
{*< Month layout  }
{*< Number Only layout  }
{*< Never use this  }
{*< Hexadecimal layout @since 1.2  }
{*< Command-line terminal layout including ESC, Alt, Ctrl key, so on (no auto-correct, no auto-capitalization) @since 1.2  }
{*< Like normal, but no auto-correct, no auto-capitalization etc. @since 1.2  }
{*< Date and time layout @since 1.8  }
{*< Emoticon layout @since 1.10  }
{*< Voice layout, but if the IME does not support voice layout, then normal layout will be shown @since 1.19  }
type
  PEcore_IMF_Input_Panel_Layout = ^TEcore_IMF_Input_Panel_Layout;
  TEcore_IMF_Input_Panel_Layout =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL = 0;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBER = 1;
    ECORE_IMF_INPUT_PANEL_LAYOUT_EMAIL = 2;
    ECORE_IMF_INPUT_PANEL_LAYOUT_URL = 3;
    ECORE_IMF_INPUT_PANEL_LAYOUT_PHONENUMBER = 4;
    ECORE_IMF_INPUT_PANEL_LAYOUT_IP = 5;
    ECORE_IMF_INPUT_PANEL_LAYOUT_MONTH = 6;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY = 7;
    ECORE_IMF_INPUT_PANEL_LAYOUT_INVALID = 8;
    ECORE_IMF_INPUT_PANEL_LAYOUT_HEX = 9;
    ECORE_IMF_INPUT_PANEL_LAYOUT_TERMINAL = 10;
    ECORE_IMF_INPUT_PANEL_LAYOUT_PASSWORD = 11;
    ECORE_IMF_INPUT_PANEL_LAYOUT_DATETIME = 12;
    ECORE_IMF_INPUT_PANEL_LAYOUT_EMOTICON = 13;
    ECORE_IMF_INPUT_PANEL_LAYOUT_VOICE = 14;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Lang
 *
 * Input panel (virtual keyboard) language modes.
 *
 * @see ecore_imf_context_input_panel_language_set()
  }
{*< Automatic @since 1.2  }
{*< Alphabet @since 1.2  }
type
  PEcore_IMF_Input_Panel_Lang = ^TEcore_IMF_Input_Panel_Lang;
  TEcore_IMF_Input_Panel_Lang =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_LANG_AUTOMATIC = 0;
    ECORE_IMF_INPUT_PANEL_LANG_ALPHABET = 1;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Return_Key_Type
 *
 * "Return" Key types on the input panel (virtual keyboard).
 *
 * @see ecore_imf_context_input_panel_return_key_type_set()
  }
{*< Default @since 1.2  }
{*< Done @since 1.2  }
{*< Go @since 1.2  }
{*< Join @since 1.2  }
{*< Login @since 1.2  }
{*< Next @since 1.2  }
{*< Search or magnifier icon @since 1.2  }
{*< Send @since 1.2  }
{*< Sign-in @since 1.8  }
type
  PEcore_IMF_Input_Panel_Return_Key_Type = ^TEcore_IMF_Input_Panel_Return_Key_Type;
  TEcore_IMF_Input_Panel_Return_Key_Type =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7;
    ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;
;
{*
 * @typedef Ecore_IMF_Input_Hints
 * @brief Enumeration for defining the types of Ecore_IMF Input Hints.
 * @since 1.12
  }
{*< No active hints @since 1.12  }
{*< Suggest word auto completion @since 1.12  }
{*< Typed text should not be stored. @since 1.12  }
{*< Multiline text @since 1.18  }
{*< Autofill hint for a credit card expiration date @deprecated since 1.24  }
{*< Autofill hint for a credit card expiration day @deprecated since 1.24  }
{*< Autofill hint for a credit card expiration month @deprecated since 1.24  }
{*< Autofill hint for a credit card expiration year @deprecated since 1.24  }
{*< Autofill hint for a credit card number @deprecated since 1.24  }
{*< Autofill hint for an email address @deprecated since 1.24  }
{*< Autofill hint for a user's real name @deprecated since 1.24  }
{*< Autofill hint for a phone number @deprecated since 1.24  }
{*< Autofill hint for a postal address @deprecated since 1.24  }
{*< Autofill hint for a postal code @deprecated since 1.24  }
{*< Autofill hint for a user's ID @deprecated since 1.24  }
type
  PEcore_IMF_Input_Hints = ^TEcore_IMF_Input_Hints;
  TEcore_IMF_Input_Hints =  Longint;
  Const
    ECORE_IMF_INPUT_HINT_NONE = 0;
    ECORE_IMF_INPUT_HINT_AUTO_COMPLETE = 1 shl 0;
    ECORE_IMF_INPUT_HINT_SENSITIVE_DATA = 1 shl 1;
    ECORE_IMF_INPUT_HINT_MULTILINE = 1 shl 2;
    ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DATE = $100;
    ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DAY = $200;
    ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_MONTH = $300;
    ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_YEAR = $400;
    ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_NUMBER = $500;
    ECORE_IMF_INPUT_HINT_AUTOFILL_EMAIL_ADDRESS = $600;
    ECORE_IMF_INPUT_HINT_AUTOFILL_NAME = $700;
    ECORE_IMF_INPUT_HINT_AUTOFILL_PHONE = $800;
    ECORE_IMF_INPUT_HINT_AUTOFILL_POSTAL_ADDRESS = $900;
    ECORE_IMF_INPUT_HINT_AUTOFILL_POSTAL_CODE = $A00;
    ECORE_IMF_INPUT_HINT_AUTOFILL_ID = $B00;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Layout_Normal_Variation
 * @brief Enumeration for defining the types of Ecore_IMF Input Panel layout for normal variation.
 * @since 1.12
  }
{*< The plain normal layout @since 1.12  }
{*< Filename layout. Symbols such as '/' should be disabled. @since 1.12  }
{*< The name of a person. @since 1.12  }
type
  PEcore_IMF_Input_Panel_Layout_Normal_Variation = ^TEcore_IMF_Input_Panel_Layout_Normal_Variation;
  TEcore_IMF_Input_Panel_Layout_Normal_Variation =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_NORMAL = 0;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_FILENAME = 1;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_PERSON_NAME = 2;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Layout_Numberonly_Variation
 * @brief Enumeration for defining the types of Ecore_IMF Input Panel layout for numberonly variation
 * @since 1.8
  }
{*< The plain normal number layout @since 1.8  }
{*< The number layout to allow a positive or negative sign at the start @since 1.8  }
{*< The number layout to allow decimal point to provide fractional value @since 1.8  }
{*< The number layout to allow decimal point and negative sign @since 1.8  }
type
  PEcore_IMF_Input_Panel_Layout_Numberonly_Variation = ^TEcore_IMF_Input_Panel_Layout_Numberonly_Variation;
  TEcore_IMF_Input_Panel_Layout_Numberonly_Variation =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_NORMAL = 0;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED = 1;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_DECIMAL = 2;
    ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED_AND_DECIMAL = 3;
;
{*
 * @typedef Ecore_IMF_Input_Panel_Layout_Password_Variation
 * @brief Enumeration for defining the types of Ecore_IMF Input Panel layout for password variation
 * @since 1.12
  }
{*< The normal password layout @since 1.12  }
{*< The password layout to allow only number @since 1.12  }
type
  PEcore_IMF_Input_Panel_Layout_Password_Variation = ^TEcore_IMF_Input_Panel_Layout_Password_Variation;
  TEcore_IMF_Input_Panel_Layout_Password_Variation =  Longint;
  Const
    ECORE_IMF_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NORMAL = 0;
    ECORE_IMF_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NUMBERONLY = 1;
;
{*
 * @typedef Ecore_IMF_BiDi_Direction
 * @brief Enumeration for defining the types of Ecore_IMF bidirectionality.
 * @since 1.12
  }
{*< The Neutral mode @since 1.12  }
{*< The Left to Right mode @since 1.12  }
{*< The Right to Left mode @since 1.12  }
type
  PEcore_IMF_BiDi_Direction = ^TEcore_IMF_BiDi_Direction;
  TEcore_IMF_BiDi_Direction =  Longint;
  Const
    ECORE_IMF_BIDI_DIRECTION_NEUTRAL = 0;
    ECORE_IMF_BIDI_DIRECTION_LTR = 1;
    ECORE_IMF_BIDI_DIRECTION_RTL = 2;
;
{*
 * @enum _Ecore_IMF_Device_Class
 * @brief Enumeration for defining the types of Ecore_IMF_Device_Class
 * @since 1.14
  }
{*< Not a device @since 1.14  }
{*< The user/seat (the user themselves) @since 1.14  }
{*< A regular keyboard, numberpad or attached buttons @since 1.14  }
{*< A mouse, trackball or touchpad relative motion device @since 1.14  }
{*< A touchscreen with fingers or stylus @since 1.14  }
{*< A special pen device @since 1.14  }
{*< A laser pointer, wii-style or "minority report" pointing device @since 1.14  }
{*<  A gamepad controller or joystick @since 1.14  }
type
  PEcore_IMF_Device_Class = ^TEcore_IMF_Device_Class;
  TEcore_IMF_Device_Class =  Longint;
  Const
    ECORE_IMF_DEVICE_CLASS_NONE = 0;
    ECORE_IMF_DEVICE_CLASS_SEAT = 1;
    ECORE_IMF_DEVICE_CLASS_KEYBOARD = 2;
    ECORE_IMF_DEVICE_CLASS_MOUSE = 3;
    ECORE_IMF_DEVICE_CLASS_TOUCH = 4;
    ECORE_IMF_DEVICE_CLASS_PEN = 5;
    ECORE_IMF_DEVICE_CLASS_POINTER = 6;
    ECORE_IMF_DEVICE_CLASS_GAMEPAD = 7;
;
{*< A general class of device @since 1.14  }
{*
 * @enum _Ecore_IMF_Device_Subclass
 * @brief Enumeration for defining the types of Ecore_IMF_Device_Subclass
 * @since 1.14
  }
{*< Not a device @since 1.14  }
{*< The normal flat of your finger @since 1.14  }
{*< A fingernail @since 1.14  }
{*< A Knuckle @since 1.14  }
{*< The palm of a users hand @since 1.14  }
{*< The side of your hand @since 1.14  }
{*< The flat of your hand @since 1.14  }
{*< The tip of a pen @since 1.14  }
{*< A trackpad style mouse @since 1.14  }
{*< A trackpoint style mouse @since 1.14  }
{*< A trackball style mouse @since 1.14  }
type
  PEcore_IMF_Device_Subclass = ^TEcore_IMF_Device_Subclass;
  TEcore_IMF_Device_Subclass =  Longint;
  Const
    ECORE_IMF_DEVICE_SUBCLASS_NONE = 0;
    ECORE_IMF_DEVICE_SUBCLASS_FINGER = 1;
    ECORE_IMF_DEVICE_SUBCLASS_FINGERNAIL = 2;
    ECORE_IMF_DEVICE_SUBCLASS_KNUCKLE = 3;
    ECORE_IMF_DEVICE_SUBCLASS_PALM = 4;
    ECORE_IMF_DEVICE_SUBCLASS_HAND_SIZE = 5;
    ECORE_IMF_DEVICE_SUBCLASS_HAND_FLAT = 6;
    ECORE_IMF_DEVICE_SUBCLASS_PEN_TIP = 7;
    ECORE_IMF_DEVICE_SUBCLASS_TRACKPAD = 8;
    ECORE_IMF_DEVICE_SUBCLASS_TRACKPOINT = 9;
    ECORE_IMF_DEVICE_SUBCLASS_TRACKBALL = 10;
;
{*< A general subclass of device @since 1.14  }
{*
 * @struct _Ecore_IMF_Event_Preedit_Start
 * @brief The structure type used with the Preedit_Start Input Method event
  }
type
  PEcore_IMF_Event_Preedit_Start = ^TEcore_IMF_Event_Preedit_Start;
  TEcore_IMF_Event_Preedit_Start = record
      ctx : PEcore_IMF_Context;
    end;

{*
 * @struct _Ecore_IMF_Event_Preedit_End
 * @brief The structure type used with the Preedit_End Input Method event
  }
  PEcore_IMF_Event_Preedit_End = ^TEcore_IMF_Event_Preedit_End;
  TEcore_IMF_Event_Preedit_End = record
      ctx : PEcore_IMF_Context;
    end;

{*
 * @struct _Ecore_IMF_Event_Preedit_Changed
 * @brief The structure type used with the Preedit_Changed Input Method event
  }
  PEcore_IMF_Event_Preedit_Changed = ^TEcore_IMF_Event_Preedit_Changed;
  TEcore_IMF_Event_Preedit_Changed = record
      ctx : PEcore_IMF_Context;
    end;

{*
 * @struct _Ecore_IMF_Event_Commit
 * @brief The structure type used with the Commit Input Method event
  }
  PEcore_IMF_Event_Commit = ^TEcore_IMF_Event_Commit;
  TEcore_IMF_Event_Commit = record
      ctx : PEcore_IMF_Context;
      str : Pchar;
    end;

{*
 * @struct _Ecore_IMF_Event_Delete_Surrounding
 * @brief The structure type used with the Delete_Surrounding Input Method event
  }
  PEcore_IMF_Event_Delete_Surrounding = ^TEcore_IMF_Event_Delete_Surrounding;
  TEcore_IMF_Event_Delete_Surrounding = record
      ctx : PEcore_IMF_Context;
      offset : longint;
      n_chars : longint;
    end;

{*
 * @struct _Ecore_IMF_Event_Selection
 * @brief The structure type used with the Selection Input Method event
  }
  PEcore_IMF_Event_Selection = ^TEcore_IMF_Event_Selection;
  TEcore_IMF_Event_Selection = record
      ctx : PEcore_IMF_Context;
      start : longint;
      end : longint;
    end;

{*
 * @struct _Ecore_IMF_Event_Commit_Content
 * @brief The structure type used with the Commit_Content Input Method event
 * @since 1.20
  }
{*< The associated Ecore IMF Context  }
(* Const before type ignored *)
{*< The content URI  }
(* Const before type ignored *)
{*< The content description  }
(* Const before type ignored *)
{*< The content MIME types  }
  PEcore_IMF_Event_Commit_Content = ^TEcore_IMF_Event_Commit_Content;
  TEcore_IMF_Event_Commit_Content = record
      ctx : PEcore_IMF_Context;
      content_uri : Pchar;
      description : Pchar;
      mime_types : Pchar;
    end;

{*
 * @struct _Ecore_IMF_Event_Mouse_Down
 * @brief The structure type used with the Mouse_Down event
  }
{*< The button which has been pressed  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
{*< The flags corresponding the mouse click (single, double or triple click)  }
{*< The timestamp when the event occurred  }
  PEcore_IMF_Event_Mouse_Down = ^TEcore_IMF_Event_Mouse_Down;
  TEcore_IMF_Event_Mouse_Down = record
      button : longint;
      output : record
          x : longint;
          y : longint;
        end;
      canvas : record
          x : longint;
          y : longint;
        end;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      flags : TEcore_IMF_Mouse_Flags;
      timestamp : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Mouse_Up
 * @brief The structure type used with the Mouse_Up event
  }
{*< The button which has been released  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
{*< The flags corresponding the mouse click (single, double or triple click)  }
{*< The timestamp when the event occurred  }
  PEcore_IMF_Event_Mouse_Up = ^TEcore_IMF_Event_Mouse_Up;
  TEcore_IMF_Event_Mouse_Up = record
      button : longint;
      output : record
          x : longint;
          y : longint;
        end;
      canvas : record
          x : longint;
          y : longint;
        end;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      flags : TEcore_IMF_Mouse_Flags;
      timestamp : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Mouse_In
 * @brief The structure type used with the Mouse_In event
  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
{*< The timestamp when the event occurred  }
  PEcore_IMF_Event_Mouse_In = ^TEcore_IMF_Event_Mouse_In;
  TEcore_IMF_Event_Mouse_In = record
      buttons : longint;
      output : record
          x : longint;
          y : longint;
        end;
      canvas : record
          x : longint;
          y : longint;
        end;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      timestamp : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Mouse_Out
 * @brief The structure type used with the Mouse_Out event
  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
{*< The timestamp when the event occurred  }
  PEcore_IMF_Event_Mouse_Out = ^TEcore_IMF_Event_Mouse_Out;
  TEcore_IMF_Event_Mouse_Out = record
      buttons : longint;
      output : record
          x : longint;
          y : longint;
        end;
      canvas : record
          x : longint;
          y : longint;
        end;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      timestamp : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Mouse_Move
 * @brief The structure type used with the Mouse_Move event
  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
{*< The timestamp when the event occurred  }
  PEcore_IMF_Event_Mouse_Move = ^TEcore_IMF_Event_Mouse_Move;
  TEcore_IMF_Event_Mouse_Move = record
      buttons : longint;
      cur : record
          output : record
              x : longint;
              y : longint;
            end;
          canvas : record
              x : longint;
              y : longint;
            end;
        end;
      prev : record
          output : record
              x : longint;
              y : longint;
            end;
          canvas : record
              x : longint;
              y : longint;
            end;
        end;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      timestamp : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Mouse_Wheel
 * @brief The structure type used with the Mouse_Wheel event
  }
{ 0 = default up/down wheel  }
{ ...,-2,-1 = down, 1,2,... = up  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
{*< The timestamp when the event occurred  }
  PEcore_IMF_Event_Mouse_Wheel = ^TEcore_IMF_Event_Mouse_Wheel;
  TEcore_IMF_Event_Mouse_Wheel = record
      direction : longint;
      z : longint;
      output : record
          x : longint;
          y : longint;
        end;
      canvas : record
          x : longint;
          y : longint;
        end;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      timestamp : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Key_Down
 * @brief The structure type used with the Key_Down event
  }
(* Const before type ignored *)
{*< The string name of the key pressed  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
(* Const before type ignored *)
{*< The logical key : (eg shift+1 == exclamation)  }
(* Const before type ignored *)
{*< A UTF8 string if this keystroke has produced a visible string to be ADDED  }
(* Const before type ignored *)
{*< A UTF8 string if this keystroke has modified a string in the middle of being composed - this string replaces the previous one  }
{*< The timestamp when the event occurred  }
(* Const before type ignored *)
{*< The device name of the key pressed @since 1.14  }
{*< The device class of the key pressed @since 1.14  }
{*< The device subclass of the key pressed @since 1.14  }
{*< Key scan code numeric value @since 1.22  }
  PEcore_IMF_Event_Key_Down = ^TEcore_IMF_Event_Key_Down;
  TEcore_IMF_Event_Key_Down = record
      keyname : Pchar;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      key : Pchar;
      _string : Pchar;
      compose : Pchar;
      timestamp : dword;
      dev_name : Pchar;
      dev_class : TEcore_IMF_Device_Class;
      dev_subclass : TEcore_IMF_Device_Subclass;
      keycode : dword;
    end;

{*
 * @struct _Ecore_IMF_Event_Key_Up
 * @brief The structure type used with the Key_Up event
  }
(* Const before type ignored *)
{*< The string name of the key released  }
{*< The keyboard modifiers active when the event has been emitted  }
{*< The keyboard locks active when the event has been emitted  }
(* Const before type ignored *)
{*< The logical key : (eg shift+1 == exclamation)  }
(* Const before type ignored *)
{*< A UTF8 string if this keystroke has produced a visible string to be ADDED  }
(* Const before type ignored *)
{*< A UTF8 string if this keystroke has modified a string in the middle of being composed - this string replaces the previous one  }
{*< The timestamp when the event occurred  }
(* Const before type ignored *)
{*< The device name of the key released @since 1.14  }
{*< The device class of the key released @since 1.14  }
{*< The device subclass of the key released @since 1.14  }
{*< Key scan code numeric value @since 1.22  }
  PEcore_IMF_Event_Key_Up = ^TEcore_IMF_Event_Key_Up;
  TEcore_IMF_Event_Key_Up = record
      keyname : Pchar;
      modifiers : TEcore_IMF_Keyboard_Modifiers;
      locks : TEcore_IMF_Keyboard_Locks;
      key : Pchar;
      _string : Pchar;
      compose : Pchar;
      timestamp : dword;
      dev_name : Pchar;
      dev_class : TEcore_IMF_Device_Class;
      dev_subclass : TEcore_IMF_Device_Subclass;
      keycode : dword;
    end;

{*
 * @brief A union of IMF events.
  }
  PEcore_IMF_Event = ^TEcore_IMF_Event;
  TEcore_IMF_Event = record
      case longint of
        0 : ( mouse_down : TEcore_IMF_Event_Mouse_Down );
        1 : ( mouse_up : TEcore_IMF_Event_Mouse_Up );
        2 : ( mouse_in : TEcore_IMF_Event_Mouse_In );
        3 : ( mouse_out : TEcore_IMF_Event_Mouse_Out );
        4 : ( mouse_move : TEcore_IMF_Event_Mouse_Move );
        5 : ( mouse_wheel : TEcore_IMF_Event_Mouse_Wheel );
        6 : ( key_down : TEcore_IMF_Event_Key_Down );
        7 : ( key_up : TEcore_IMF_Event_Key_Up );
      end;

{*
 * @struct _Ecore_IMF_Preedit_Attr
 * @brief Structure that contains preedit attribute information.
  }
{*< preedit style type  }
{*< start index of the range (in bytes)  }
{*< end index of the range (in bytes)  }
  PEcore_IMF_Preedit_Attr = ^TEcore_IMF_Preedit_Attr;
  TEcore_IMF_Preedit_Attr = record
      preedit_type : TEcore_IMF_Preedit_Type;
      start_index : dword;
      end_index : dword;
    end;

{*
 * @struct _Ecore_IMF_Context_Class
 * @brief Structure used when creating a new Input Method Context. This
 * structure is mainly used by modules implementing the Input Method Context
 * interface.
 *
  }
{*< Create the Input Method Context  }
{*< Delete the Input Method Context  }
{*< Set the client window for the Input Method Context  }
{*< Set the client canvas for the Input Method Context  }
{*< Show the Input Method Context  }
{*< Hide the Input Method Context  }
{*< Return current preedit string and cursor position  }
{*< Input Method context widget has gained focus  }
{*< Input Method context widget has lost focus  }
{*< A change has been made  }
{*< Cursor position changed  }
{*< Use preedit string to display feedback  }
{*< Set the input mode  }
{*< Internally handle an event  }
{*<  return current preedit string, attributes, and cursor position  }
{*< Allow text prediction  }
{*< Set auto-capitalization type  }
{*< Show the control panel  }
{*< Hide the control panel  }
{*< Set the layout of the input panel  }
{*< Return the current layout of the input panel  }
{*< Set the language of the input panel  }
{*< Get the current language of the input panel  }
{*< Set the cursor location  }
(* Const before type ignored *)
{*< Set panel-specific data to the input panel  }
{*< Get current panel-specific data from the input panel  }
{*< Set the return key theme of the input panel based on return key type provided  }
{*< Disable return key of the input panel  }
{*< Set input panel caps lock mode  }
{*< Return input panel geometry  }
{*< Return input panel state  }
{*< Add a callback on input panel state,language,mode change  }
{*< Delete the input panel event callback  }
{*< Return the current language locale  }
{*< Return the candidate panel geometry  }
{*< Sets input hint to fine-tune input methods behavior  }
{*< Set bidirectionality at the cursor position  }
{*< Return the current keyboard mode of the input panel  }
(* Const before type ignored *)
{*< Set the prediction hint to the input panel  }
(* Const before type ignored *)
{*< Set the MIME type to the input panel  }
{*< Set the position of the input panel  }
  PEcore_IMF_Context_Class = ^TEcore_IMF_Context_Class;
  TEcore_IMF_Context_Class = record
      add : procedure (ctx:PEcore_IMF_Context);cdecl;
      del : procedure (ctx:PEcore_IMF_Context);cdecl;
      client_window_set : procedure (ctx:PEcore_IMF_Context; window:pointer);cdecl;
      client_canvas_set : procedure (ctx:PEcore_IMF_Context; canvas:pointer);cdecl;
      show : procedure (ctx:PEcore_IMF_Context);cdecl;
      hide : procedure (ctx:PEcore_IMF_Context);cdecl;
      preedit_string_get : procedure (ctx:PEcore_IMF_Context; str:PPchar; cursor_pos:Plongint);cdecl;
      focus_in : procedure (ctx:PEcore_IMF_Context);cdecl;
      focus_out : procedure (ctx:PEcore_IMF_Context);cdecl;
      reset : procedure (ctx:PEcore_IMF_Context);cdecl;
      cursor_position_set : procedure (ctx:PEcore_IMF_Context; cursor_pos:longint);cdecl;
      use_preedit_set : procedure (ctx:PEcore_IMF_Context; use_preedit:TEina_Bool);cdecl;
      input_mode_set : procedure (ctx:PEcore_IMF_Context; input_mode:TEcore_IMF_Input_Mode);cdecl;
      filter_event : function (ctx:PEcore_IMF_Context; _type:TEcore_IMF_Event_Type; event:PEcore_IMF_Event):TEina_Bool;cdecl;
      preedit_string_with_attributes_get : procedure (ctx:PEcore_IMF_Context; str:PPchar; attrs:PPEina_List; cursor_pos:Plongint);cdecl;
      prediction_allow_set : procedure (ctx:PEcore_IMF_Context; prediction:TEina_Bool);cdecl;
      autocapital_type_set : procedure (ctx:PEcore_IMF_Context; autocapital_type:TEcore_IMF_Autocapital_Type);cdecl;
      control_panel_show : procedure (ctx:PEcore_IMF_Context);cdecl;
      control_panel_hide : procedure (ctx:PEcore_IMF_Context);cdecl;
      input_panel_layout_set : procedure (ctx:PEcore_IMF_Context; layout:TEcore_IMF_Input_Panel_Layout);cdecl;
      input_panel_layout_get : function (ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Layout;cdecl;
      input_panel_language_set : procedure (ctx:PEcore_IMF_Context; lang:TEcore_IMF_Input_Panel_Lang);cdecl;
      input_panel_language_get : function (ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Lang;cdecl;
      cursor_location_set : procedure (ctx:PEcore_IMF_Context; x:longint; y:longint; w:longint; h:longint);cdecl;
      input_panel_imdata_set : procedure (ctx:PEcore_IMF_Context; data:pointer; len:longint);cdecl;
      input_panel_imdata_get : procedure (ctx:PEcore_IMF_Context; data:pointer; len:Plongint);cdecl;
      input_panel_return_key_type_set : procedure (ctx:PEcore_IMF_Context; return_key_type:TEcore_IMF_Input_Panel_Return_Key_Type);cdecl;
      input_panel_return_key_disabled_set : procedure (ctx:PEcore_IMF_Context; disabled:TEina_Bool);cdecl;
      input_panel_caps_lock_mode_set : procedure (ctx:PEcore_IMF_Context; mode:TEina_Bool);cdecl;
      input_panel_geometry_get : procedure (ctx:PEcore_IMF_Context; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;
      input_panel_state_get : function (ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_State;cdecl;
      input_panel_event_callback_add : procedure (ctx:PEcore_IMF_Context; _type:TEcore_IMF_Input_Panel_Event; func:procedure (data:pointer; ctx:PEcore_IMF_Context; value:longint); data:pointer);cdecl;
      input_panel_event_callback_del : procedure (ctx:PEcore_IMF_Context; _type:TEcore_IMF_Input_Panel_Event; func:procedure (data:pointer; ctx:PEcore_IMF_Context; value:longint));cdecl;
      input_panel_language_locale_get : procedure (ctx:PEcore_IMF_Context; lang:PPchar);cdecl;
      candidate_panel_geometry_get : procedure (ctx:PEcore_IMF_Context; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;
      input_hint_set : procedure (ctx:PEcore_IMF_Context; input_hints:TEcore_IMF_Input_Hints);cdecl;
      bidi_direction_set : procedure (ctx:PEcore_IMF_Context; direction:TEcore_IMF_BiDi_Direction);cdecl;
      keyboard_mode_get : function (ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Keyboard_Mode;cdecl;
      prediction_hint_set : procedure (ctx:PEcore_IMF_Context; prediction_hint:Pchar);cdecl;
      mime_type_accept_set : procedure (ctx:PEcore_IMF_Context; mime_type:Pchar);cdecl;
      input_panel_position_set : procedure (ctx:PEcore_IMF_Context; x:longint; y:longint);cdecl;
    end;

{*
 * @struct _Ecore_IMF_Context_Info
 * @brief A IMF structure containing context information.
  }
(* Const before type ignored *)
{ ID  }
(* Const before type ignored *)
{ Human readable description  }
(* Const before type ignored *)
{ Languages for which this context is the default, separated by :  }
(* Const before type ignored *)
{ The canvas type used by the input method. Eg.: evas  }
{ Whether the canvas usage is required for this input method  }
  PEcore_IMF_Context_Info = ^TEcore_IMF_Context_Info;
  TEcore_IMF_Context_Info = record
      id : Pchar;
      description : Pchar;
      default_locales : Pchar;
      canvas_type : Pchar;
      canvas_required : longint;
    end;

{*
 * @
  }
{*
 * @ingroup Ecore_IMF_Lib_Group
 * @brief Initialises the Ecore_IMF library.
 * @return  Number of times the library has been initialised without being
 *          shut down.
  }

function ecore_imf_init:longint;cdecl;external;
{*
 * @ingroup Ecore_IMF_Lib_Group
 * @brief Shuts down the Ecore_IMF library.
 * @return  Number of times the library has been initialised without being
 *          shut down.
  }
function ecore_imf_shutdown:longint;cdecl;external;
{*
 * @ingroup Ecore_IMF_Lib_Group
 * @brief Registers an Ecore_IMF module.
 *
 * @param info              An Ecore_IMF_Context_Info structure
 * @param imf_module_create A function to call at the creation
 * @param imf_module_exit   A function to call when exiting
 *
  }
(* Const before type ignored *)
procedure ecore_imf_module_register(info:PEcore_IMF_Context_Info; imf_module_create:function :PEcore_IMF_Context; imf_module_exit:function :PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Lib_Group
 * @brief Hides the input panel.
 * @return  EINA_TRUE if the input panel will be hidden
            EINA_FALSE if the input panel is already in hidden state
 * @since 1.8.0
  }
function ecore_imf_input_panel_hide:TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the list of the available Input Method Context ids.
 *
 * Note that the caller is responsible for freeing the Eina_List
 * when finished with it. There is no need to finish the list strings.
 *
 * @return Return an Eina_List of strings;
 *         on failure it returns NULL.
  }
function ecore_imf_context_available_ids_get:PEina_List;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the list of the available Input Method Context ids by canvas type.
 *
 * Note that the caller is responsible for freeing the Eina_List
 * when finished with it. There is no need to finish the list strings.
 *
 * @param  canvas_type A string containing the canvas type.
 * @return Return an Eina_List of strings;
 *         on failure it returns NULL.
  }
(* Const before type ignored *)
function ecore_imf_context_available_ids_by_canvas_type_get(canvas_type:Pchar):PEina_List;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the id of the default Input Method Context.
 * The id may to used to create a new instance of an Input Method
 * Context object.
 *
 * @return Return a string containing the id of the default Input
 *         Method Context; on failure it returns NULL.
  }
(* Const before type ignored *)
function ecore_imf_context_default_id_get:Pchar;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the id of the default Input Method Context corresponding to a canvas
 * type.
 * The id may be used to create a new instance of an Input Method
 * Context object.
 *
 * @param  canvas_type A string containing the canvas type.
 * @return Return a string containing the id of the default Input
 *         Method Context; on failure it returns NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_imf_context_default_id_by_canvas_type_get(canvas_type:Pchar):Pchar;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Retrieves the info for the Input Method Context with @p id.
 *
 * @param id The Input Method Context id to query for.
 * @return Return a #Ecore_IMF_Context_Info for the Input Method Context with @p id;
 *         on failure it returns NULL.
 *
 * Example
 * @code
 *
 * const char *ctx_id;
 * const Ecore_IMF_Context_Info *ctx_info;
 * Ecore_IMF_Context *imf_context;
 * ctx_id = ecore_imf_context_default_id_get();
 * if (ctx_id)
 *   
 *      ctx_info = ecore_imf_context_info_by_id_get(ctx_id);
 *      if (!ctx_info->canvas_type ||
 *          strcmp(ctx_info->canvas_type, "evas") == 0)
 *        
 *           imf_context = ecore_imf_context_add(ctx_id);
 *        
 *      else
 *        
 *           ctx_id = ecore_imf_context_default_id_by_canvas_type_get("evas");
 *           if (ctx_id)
 *             
 *                imf_context = ecore_imf_context_add(ctx_id);
 *             
 *        
 *   
 * @endcode
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_imf_context_info_by_id_get(id:Pchar):PEcore_IMF_Context_Info;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Creates a new Input Method Context defined by the given id.
 *
 * @param id The Input Method Context id.
 * @return A newly allocated Input Method Context;
 *         on failure it returns NULL.
  }
(* Const before type ignored *)
function ecore_imf_context_add(id:Pchar):PEcore_IMF_Context;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Retrieves the info for the given Input Method Context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return Return a #Ecore_IMF_Context_Info for the given Input Method Context;
 *         on failure it returns NULL.
  }
(* Const before type ignored *)
function ecore_imf_context_info_get(ctx:PEcore_IMF_Context):PEcore_IMF_Context_Info;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Deletes the given Input Method Context and free its memory.
 *
 * @param ctx An #Ecore_IMF_Context.
  }
procedure ecore_imf_context_del(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the client window for the Input Method Context; this is the
 * Ecore_X_Window when using X11, Ecore_Win32_Window when using Win32, etc.
 * This window is used in order to correctly position status windows, and may
 * also be used for purposes internal to the Input Method Context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param window The client window. This may be @c NULL to indicate
 *               that the previous client window no longer exists.
  }
procedure ecore_imf_context_client_window_set(ctx:PEcore_IMF_Context; window:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the client window of the Input Method Context.
 *
 * See @ref ecore_imf_context_client_window_set for more details.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return Return the client window.
 * @since 1.1.0
  }
function ecore_imf_context_client_window_get(ctx:PEcore_IMF_Context):pointer;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the client canvas for the Input Method Context; this is the
 * canvas in which the input appears.
 * The canvas type can be determined by using the context canvas type.
 * Actually only canvas with type "evas" (Evas *) is supported.
 * This canvas may be used in order to correctly position status windows, and may
 * also be used for purposes internal to the Input Method Context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param canvas The client canvas. This may be @c NULL to indicate
 *               that the previous client canvas no longer exists.
  }
procedure ecore_imf_context_client_canvas_set(ctx:PEcore_IMF_Context; canvas:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the client canvas of the Input Method Context.
 *
 * See @ref ecore_imf_context_client_canvas_set for more details.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return Return the client canvas.
 * @since 1.1.0
  }
function ecore_imf_context_client_canvas_get(ctx:PEcore_IMF_Context):pointer;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Asks the Input Method Context to show itself.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * @deprecated use ecore_imf_context_input_panel_show() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_show(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Asks the Input Method Context to hide itself.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * @deprecated use ecore_imf_context_input_panel_hide() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_hide(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Retrieves the current preedit string and cursor position
 * for the Input Method Context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param str Location to store the retrieved string. The
 *            string retrieved must be freed with free().
 * @param cursor_pos Location to store position of cursor (in characters)
 *                   within the preedit string.
  }
procedure ecore_imf_context_preedit_string_get(ctx:PEcore_IMF_Context; str:PPchar; cursor_pos:Plongint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Retrieves the current preedit string, attributes and
 * cursor position for the Input Method Context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param str Location to store the retrieved string. The
 *            string retrieved must be freed with free().
 * @param attrs An Eina_List of attributes
 * @param cursor_pos Location to store position of cursor (in characters)
 *                   within the preedit string.
 *
 * Example
 * @code
 * char *preedit_string;
 * int cursor_pos;
 * Eina_List *attrs = NULL, *l = NULL;
 * Ecore_IMF_Preedit_Attr *attr;
 *
 * ecore_imf_context_preedit_string_with_attributes_get(imf_context,
 *                                                      &preedit_string,
 *                                                      &attrs, &cursor_pos);
 * if (!preedit_string) return;
 *
 *  if (strlen(preedit_string) > 0)
 *    
 *       if (attrs)
 *         
 *            EINA_LIST_FOREACH(attrs, l, attr)
 *              
 *                 if (attr->preedit_type == ECORE_IMF_PREEDIT_TYPE_SUB1)
 *                   
 *                      // Something to do
 *                   
 *                 else if (attr->preedit_type == ECORE_IMF_PREEDIT_TYPE_SUB2)
 *                   
 *                      // Something to do
 *                   
 *                 else if (attr->preedit_type == ECORE_IMF_PREEDIT_TYPE_SUB3)
 *                   
 *                      // Something to do
 *                   
 *              
 *         
 *    
 *
 * // delete attribute list
 * EINA_LIST_FREE(attrs, attr) free(attr);
 *
 * free(preedit_string);
 * @endcode
 * @since 1.1.0
  }
procedure ecore_imf_context_preedit_string_with_attributes_get(ctx:PEcore_IMF_Context; str:PPchar; attrs:PPEina_List; cursor_pos:Plongint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Notifies the Input Method Context that the widget to which its
 * correspond has gained focus.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * Example
 * @code
 * static void
 * _focus_in_cb(void *data, Evas_Object *o, const char *emission, const char *source)
 * 
 *    Ecore_IMF_Context *imf_context = data;
 *    ecore_imf_context_focus_in(imf_context);
 * 
 *
 * evas_object_event_callback_add(obj, EVAS_CALLBACK_FOCUS_IN, _focus_in_cb, imf_context);
 * @endcode
  }
procedure ecore_imf_context_focus_in(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Notifies the Input Method Context that the widget to which its
 * correspond has lost focus.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * Example
 * @code
 * static void
 * _focus_out_cb(void *data, Evas_Object *o, const char *emission, const char *source)
 * 
 *    Ecore_IMF_Context *imf_context = data;
 *    ecore_imf_context_reset(imf_context);
 *    ecore_imf_context_focus_out(imf_context);
 * 
 *
 * evas_object_event_callback_add(obj, EVAS_CALLBACK_FOCUS_OUT, _focus_out_cb, ed);
 * @endcode
  }
procedure ecore_imf_context_focus_out(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Notifies the Input Method Context that a change such as a
 * change in cursor position has been made. This will typically
 * cause the Input Method Context to clear the preedit state or commit the preedit string.
 *
 * The operation of ecore_imf_context_reset() depends on the specific characteristics of
 * each language. For example, the preedit string is cleared in the Chinese and Japanese Input Method Engine.
 * However, The preedit string is committed and then cleared in the Korean Input Method Engine.
 *
 * This function should be called in case of the focus-out and mouse down event callback function.
 * In addition, it should be called before inserting some text.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * Example
 * @code
 * static void
 * _focus_out_cb(void *data, Evas_Object *o, const char *emission, const char *source)
 * 
 *    Ecore_IMF_Context *imf_context = data;
 *    ecore_imf_context_reset(imf_context);
 *    ecore_imf_context_focus_out(imf_context);
 * 
 *
 * evas_object_event_callback_add(obj, EVAS_CALLBACK_FOCUS_OUT, _focus_out_cb, imf_context);
 * @endcode
  }
procedure ecore_imf_context_reset(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Notifies the Input Method Context that a change in the cursor
 * position has been made.
 *
 * This function should be called when cursor position is changed or mouse up event is generated.
 * Some input methods that do a heavy job using this event can give a critical performance latency problem.
 * For better typing performance, we suggest that the cursor position change events need to be occurred
 * only if the cursor position is on a confirmed status not on moving status.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param cursor_pos New cursor position in characters.
  }
procedure ecore_imf_context_cursor_position_set(ctx:PEcore_IMF_Context; cursor_pos:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Notifies the Input Method Context that a change in the cursor
 * location has been made. The location is relative to the canvas.
 * The cursor location can be used to determine the position of
 * candidate word window in the immodule.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param x cursor x position.
 * @param y cursor y position.
 * @param w cursor width.
 * @param h cursor height.
 * @since 1.1.0
  }
procedure ecore_imf_context_cursor_location_set(ctx:PEcore_IMF_Context; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets whether the IM context should use the preedit string
 * to display feedback. If @c use_preedit is @c EINA_FALSE (default
 * is @c EINA_TRUE), then the IM context may use some other method to display
 * feedback, such as displaying it in a child of the root window.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param use_preedit Whether the IM context should use the preedit string.
  }
procedure ecore_imf_context_use_preedit_set(ctx:PEcore_IMF_Context; use_preedit:TEina_Bool);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the callback to be used on surrounding_get request.
 *
 * This callback will be called when the Input Method Context
 * module requests the surrounding context.
 * Input methods typically want context in order to constrain input text based on existing text;
 * this is important for languages such as Thai where only some sequences of characters are allowed.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param func The callback to be called.
 * @param data The data pointer to be passed to @p func
  }
(* Const before type ignored *)
procedure ecore_imf_context_retrieve_surrounding_callback_set(ctx:PEcore_IMF_Context; func:function (data:pointer; ctx:PEcore_IMF_Context; text:PPchar; cursor_pos:Plongint):TEina_Bool; data:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the callback to be used on selection_get request.
 *
 * This callback will be called when the Input Method Context
 * module requests the selection context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param func The callback to be called.
 * @param data The data pointer to be passed to @p func
 * @since 1.9.0
  }
(* Const before type ignored *)
procedure ecore_imf_context_retrieve_selection_callback_set(ctx:PEcore_IMF_Context; func:function (data:pointer; ctx:PEcore_IMF_Context; text:PPchar):TEina_Bool; data:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the input mode used by the Ecore Input Context.
 *
 * The input mode can be one of the input modes defined in
 * Ecore_IMF_Input_Mode. The default input mode is
 * ECORE_IMF_INPUT_MODE_FULL.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param input_mode The input mode to be used by @p ctx.
  }
procedure ecore_imf_context_input_mode_set(ctx:PEcore_IMF_Context; input_mode:TEcore_IMF_Input_Mode);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the input mode being used by the Ecore Input Context.
 *
 * See @ref ecore_imf_context_input_mode_set for more details.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return The input mode being used by @p ctx.
  }
function ecore_imf_context_input_mode_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Mode;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Allows an Ecore Input Context to internally handle an event.
 * If this function returns @c EINA_TRUE, then no further processing
 * should be done for this event.
 *
 * Input methods must be able to accept all types of events (simply
 * returning @c EINA_FALSE if the event was not handled), but there is no
 * obligation of any events to be submitted to this function.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param type The type of event defined by #Ecore_IMF_Event_Type.
 * @param event The event itself.
 * @return @c EINA_TRUE if the event was handled; otherwise @c EINA_FALSE.
 *
 * Example
 * @code
 * static void
 * _key_down_cb(void *data, Evas *e, Evas_Object *obj, void *event_info)
 * 
 *    Evas_Event_Key_Down *ev = event_info;
 *    if (!ev->key) return;
 *
 *    if (imf_context)
 *      
 *         Ecore_IMF_Event_Key_Down ecore_ev;
 *         ecore_imf_evas_event_key_down_wrap(ev, &ecore_ev);
 *         if (ecore_imf_context_filter_event(imf_context,
 *                                            ECORE_IMF_EVENT_KEY_DOWN,
 *                                            (Ecore_IMF_Event *)&ecore_ev))
 *           return;
 *      
 * 
 *
 * evas_object_event_callback_add(obj, EVAS_CALLBACK_KEY_DOWN, _key_down_cb, data);
 * @endcode
  }
function ecore_imf_context_filter_event(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Event_Type; event:PEcore_IMF_Event):TEina_Bool;cdecl;external;
{ plugin specific functions  }
{*
 * @defgroup Ecore_IMF_Context_Module_Group Ecore Input Method Context Module Functions
 * @ingroup Ecore_IMF_Lib_Group
 *
 * Functions that should be used by Ecore Input Method Context modules.
  }
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Creates a new Input Method Context with klass specified by @p ctxc.
 *
 * This method should be used by modules implementing the Input
 * Method Context interface.
 *
 * @param ctxc An #Ecore_IMF_Context_Class.
 * @return A new #Ecore_IMF_Context; on failure it returns NULL.
  }
(* Const before type ignored *)
function ecore_imf_context_new(ctxc:PEcore_IMF_Context_Class):PEcore_IMF_Context;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * Sets the Input Method Context specific data.
 *
 * Note that this method should be used by modules to set
 * the Input Method Context specific data and it's not meant to
 * be used by applications to store application specific data.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param data The Input Method Context specific data.
 * @return A new #Ecore_IMF_Context; on failure it returns NULL.
  }
procedure ecore_imf_context_data_set(ctx:PEcore_IMF_Context; data:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Gets the Input Method Context specific data.
 *
 * See @ref ecore_imf_context_data_set for more details.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return The Input Method Context specific data.
  }
function ecore_imf_context_data_get(ctx:PEcore_IMF_Context):pointer;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Retrieves context around insertion point.
 * Input methods typically want context in order to constrain input text based on existing text;
 * this is important for languages such as Thai where only some sequences of characters are allowed.
 * In addition, the text around the insertion point can be used for supporting autocapital feature.
 *
 * This function is implemented by calling the
 * Ecore_IMF_Context::retrieve_surrounding_func (
 * set using #ecore_imf_context_retrieve_surrounding_callback_set).
 *
 * There is no obligation for a widget to respond to the
 * retrieve_surrounding_func, so input methods must be prepared
 * to function without context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param text Location to store a UTF-8 encoded string of text
 *             holding context around the insertion point.
 *             If the function returns @c EINA_TRUE, then you must free
 *             the result stored in this location with free().
 * @param cursor_pos Location to store the position in characters of
 *                   the insertion cursor within @p text.
 * @return @c EINA_TRUE if surrounding text was provided; otherwise
 * @c EINA_FALSE.
  }
function ecore_imf_context_surrounding_get(ctx:PEcore_IMF_Context; text:PPchar; cursor_pos:Plongint):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Retrieves the selected text.
 *
 * This function is implemented by calling the
 * Ecore_IMF_Context::retrieve_selection_func (
 * set using #ecore_imf_context_retrieve_selection_callback_set).
 *
 * There is no obligation for a widget to respond to the
 * retrieve_surrounding_func, so input methods must be prepared
 * to function without context.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param text Location to store a UTF-8 encoded string of the selected text.
 *             If the function returns @c EINA_TRUE, then you must free
 *             the result stored in this location with free().
 * @return @c EINA_TRUE if selected text was provided; otherwise
 * @c EINA_FALSE.
 * @since 1.9.0
  }
function ecore_imf_context_selection_get(ctx:PEcore_IMF_Context; text:PPchar):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Adds ECORE_IMF_EVENT_PREEDIT_START to the event queue.
 *
 * ECORE_IMF_EVENT_PREEDIT_START should be added when a new preedit sequence starts.
 * It's asynchronous method to put event to the event queue.
 * ecore_imf_context_event_callback_call() can be used as synchronous method.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * @deprecated use ecore_imf_context_event_callback_call() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_preedit_start_event_add(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Adds ECORE_IMF_EVENT_PREEDIT_END to the event queue.
 *
 * ECORE_IMF_EVENT_PREEDIT_END should be added when a new preedit sequence has been completed or canceled.
 * It's asynchronous method to put event to the event queue.
 * ecore_imf_context_event_callback_call() can be used as synchronous method.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * @deprecated use ecore_imf_context_event_callback_call() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_preedit_end_event_add(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Adds ECORE_IMF_EVENT_PREEDIT_CHANGED to the event queue.
 *
 * It's asynchronous method to put event to the event queue.
 * ecore_imf_context_event_callback_call() can be used as synchronous method.
 *
 * @param ctx An #Ecore_IMF_Context.
 *
 * @deprecated use ecore_imf_context_event_callback_call() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_preedit_changed_event_add(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Adds ECORE_IMF_EVENT_COMMIT to the event queue.
 *
 * It's asynchronous method to put event to the event queue.
 * ecore_imf_context_event_callback_call() can be used as synchronous method.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param str The committed string.
 *
 * @deprecated use ecore_imf_context_event_callback_call() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
procedure ecore_imf_context_commit_event_add(ctx:PEcore_IMF_Context; str:Pchar);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Adds ECORE_IMF_EVENT_DELETE_SURROUNDING to the event queue.
 *
 * Asks the widget that the input context is attached to to delete characters around the cursor position
 * by adding the ECORE_IMF_EVENT_DELETE_SURROUNDING to the event queue.
 * Note that offset and n_chars are in characters not in bytes.
 *
 * It's asynchronous method to put ECORE_IMF_EVENT_DELETE_SURROUNDING event to the event queue.
 * ecore_imf_context_event_callback_call() can be used as synchronous method.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param offset The start offset of surrounding to be deleted.
 * @param n_chars The number of characters to be deleted.
 *
 * @deprecated use ecore_imf_context_event_callback_call() instead.
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_delete_surrounding_event_add(ctx:PEcore_IMF_Context; offset:longint; n_chars:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Adds (registers) a callback function to a given context event.
 *
 * This function adds a function callback to the context @p ctx when the
 * event of type @p type occurs on it. The function pointer is @p
 * func.
 *
 * The event type @p type to trigger the function may be one of
 * #ECORE_IMF_CALLBACK_PREEDIT_START, #ECORE_IMF_CALLBACK_PREEDIT_END,
 * #ECORE_IMF_CALLBACK_PREEDIT_CHANGED, #ECORE_IMF_CALLBACK_COMMIT,
 * #ECORE_IMF_CALLBACK_DELETE_SURROUNDING, #ECORE_IMF_CALLBACK_SELECTION_SET,
 * #ECORE_IMF_CALLBACK_PRIVATE_COMMAND_SEND, #ECORE_IMF_CALLBACK_COMMIT_CONTENT,
 * #ECORE_IMF_CALLBACK_TRANSACTION_START, and #ECORE_IMF_CALLBACK_TRANSACTION_END.
 *
 * @param ctx Ecore_IMF_Context to attach a callback to.
 * @param type The type of event that will trigger the callback
 * @param func The (callback) function to be called when the event is
 *        triggered
 * @param data The data pointer to be passed to @p func
 * @since 1.2.0
 *
 * Example
 * @code
 * #include <glib.h>
 *
 * // example for handling commit event from input framework
 * static void
 * _imf_event_commit_cb(void *data, Ecore_IMF_Context *ctx, void *event_info)
 * 
 *    char *commit_str = event_info;
 *    // something to do
 * 
 *
 * ecore_imf_context_event_callback_add(en->imf_context, ECORE_IMF_CALLBACK_COMMIT, _imf_event_commit_cb, data);
 *
 * // example for receiving media content URI from input framework
 * @code
 * #include <glib.h>
 *
 * static void
 * _imf_event_commit_content_cb(void *data, Ecore_IMF_Context *ctx, void *event_info)
 * 
 *    Ecore_IMF_Event_Commit_Content *commit_content = (Ecore_IMF_Event_Commit_Content *)event;
 *    if (!commit_content) return;
 *
 *    // convert URI to filename
 *    gchar *filepath = g_filename_from_uri(commit_content->content_uri, NULL, NULL);
 *    printf("filepath : %s, description : %s, mime types : %s\n", filepath, commit_content->description, commit_content->mime_types);
 *
 *    // do something to use filepath
 *
 *    if (filepath)
 *       g_free(filepath);
 * 
 *
 * ecore_imf_context_event_callback_add(en->imf_context, ECORE_IMF_CALLBACK_COMMIT_CONTENT, _imf_event_commit_content_cb, data);
 * @endcode
  }
(* Const before type ignored *)
procedure ecore_imf_context_event_callback_add(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Callback_Type; func:TEcore_IMF_Event_Cb; data:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Deletes (unregisters) a callback function registered to a given
 * context event.
 *
 * This function removes a function callback from the context @p ctx when the
 * event of type @p type occurs on it. The function pointer is @p
 * func.
 *
 * @see ecore_imf_context_event_callback_add() for more details
 *
 * @param ctx Ecore_IMF_Context to remove a callback from.
 * @param type The type of event that was triggering the callback
 * @param func The (callback) function that was to be called when the event was triggered
 * @return the data pointer
 * @since 1.2.0
  }
function ecore_imf_context_event_callback_del(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Callback_Type; func:TEcore_IMF_Event_Cb):pointer;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Module_Group
 * @brief Calls a given callback on the context @p ctx.
 *
 * ecore_imf_context_preedit_start_event_add(), ecore_imf_context_preedit_end_event_add(),
 * ecore_imf_context_preedit_changed_event_add(), ecore_imf_context_commit_event_add() and
 * ecore_imf_context_delete_surrounding_event_add() APIs are asynchronous
 * because those API adds each event to the event queue.
 *
 * This API provides the way to call each callback function immediately.
 *
 * @param ctx Ecore_IMF_Context.
 * @param type The type of event that will trigger the callback
 * @param event_info The pointer to event specific struct or information to
 *        pass to the callback functions registered on this event
 * @since 1.2.0
  }
procedure ecore_imf_context_event_callback_call(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Callback_Type; event_info:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets whether the IM context should allow to use the text prediction.
 * If @p prediction is @c EINA_FALSE (default is @c EINA_TRUE), then the IM
 * context will not display the text prediction window.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param prediction Whether the IM context should allow to use the text prediction.
 * @note Default value is EINA_TRUE.
 * @since 1.1.0
  }
procedure ecore_imf_context_prediction_allow_set(ctx:PEcore_IMF_Context; prediction:TEina_Bool);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets whether the IM context should allow to use the text prediction.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return @c EINA_TRUE if it allows to use the text prediction, otherwise
 * @c EINA_FALSE.
 * @since 1.1.0
  }
function ecore_imf_context_prediction_allow_get(ctx:PEcore_IMF_Context):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the autocapitalization type on the immodule.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param autocapital_type the autocapitalization type.
 * @note Default type is ECORE_IMF_AUTOCAPITAL_TYPE_SENTENCE.
 * @since 1.1.0
  }
procedure ecore_imf_context_autocapital_type_set(ctx:PEcore_IMF_Context; autocapital_type:TEcore_IMF_Autocapital_Type);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the autocapitalization type.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return The autocapital type being used by @p ctx.
 * @since 1.1.0
  }
function ecore_imf_context_autocapital_type_get(ctx:PEcore_IMF_Context):TEcore_IMF_Autocapital_Type;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the input hint which allows input methods to fine-tune their behavior.
 *
 * @param ctx An #Ecore_IMF_Context
 * @param hints Input hint
 * @note The default input hint is @c ECORE_IMF_INPUT_HINT_AUTO_COMPLETE.
 * @since 1.12
  }
procedure ecore_imf_context_input_hint_set(ctx:PEcore_IMF_Context; hints:TEcore_IMF_Input_Hints);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the value of input hint.
 *
 * @param ctx An #Ecore_IMF_Context
 * @return The value of input hint
 * @since 1.12
  }
function ecore_imf_context_input_hint_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Hints;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Asks the Input Method Context to show the control panel of using Input Method.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @since 1.1.0
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_control_panel_show(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Asks the Input Method Context to hide the control panel of using Input Method.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @since 1.1.0
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure ecore_imf_context_control_panel_hide(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Asks the Input Method Context to show the input panel (virtual keyboard).
 *
 * @param ctx An #Ecore_IMF_Context.
 * @since 1.1.0
  }
procedure ecore_imf_context_input_panel_show(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Asks the Input Method Context to hide the input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @since 1.1.0
  }
procedure ecore_imf_context_input_panel_hide(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the layout of the input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param layout see #Ecore_IMF_Input_Panel_Layout
 * @note Default layout type is ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL.
 * @since 1.1.0
  }
procedure ecore_imf_context_input_panel_layout_set(ctx:PEcore_IMF_Context; layout:TEcore_IMF_Input_Panel_Layout);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the layout of the current active input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return layout see #Ecore_IMF_Input_Panel_Layout
 * @since 1.1.0
  }
function ecore_imf_context_input_panel_layout_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Layout;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the layout variation of the current active input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param variation the layout variation
 * @note Default layout variation type is NORMAL.
 * @since 1.8.0
  }
procedure ecore_imf_context_input_panel_layout_variation_set(ctx:PEcore_IMF_Context; variation:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the layout variation of the current active input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return the layout variation
 * @since 1.8.0
  }
function ecore_imf_context_input_panel_layout_variation_get(ctx:PEcore_IMF_Context):longint;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the language of the input panel.
 * This API can be used when you want to show the English keyboard.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param lang the language to be set to the input panel.
 * @since 1.1.0
  }
procedure ecore_imf_context_input_panel_language_set(ctx:PEcore_IMF_Context; lang:TEcore_IMF_Input_Panel_Lang);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the language of the input panel.
 *
 * See @ref ecore_imf_context_input_panel_language_set for more details.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return Ecore_IMF_Input_Panel_Lang
 * @since 1.1.0
  }
function ecore_imf_context_input_panel_language_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Lang;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets whether the Input Method Context should request to show the input panel automatically
 * when the widget has focus.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param enabled If true, the input panel will be shown when the widget is clicked or has focus.
 * @since 1.1.0
  }
procedure ecore_imf_context_input_panel_enabled_set(ctx:PEcore_IMF_Context; enabled:TEina_Bool);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets whether the Input Method Context requests to show the input panel automatically.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return Return the attribute to show the input panel automatically
 * @since 1.1.0
  }
function ecore_imf_context_input_panel_enabled_get(ctx:PEcore_IMF_Context):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the input panel-specific data to deliver to the input panel.
 * This API is used by applications to deliver specific data to the input panel.
 * The data format MUST be negotiated by both application and the input panel.
 * The size and format of data are defined by the input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param data The specific data to be set to the input panel.
 * @param len the length of data, in bytes, to send to the input panel
 * @since 1.2.0
  }
(* Const before type ignored *)
procedure ecore_imf_context_input_panel_imdata_set(ctx:PEcore_IMF_Context; data:pointer; len:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the specific data of the current active input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param data The specific data to be got from the input panel
 * @param len The length of data
 * @since 1.2.0
  }
procedure ecore_imf_context_input_panel_imdata_get(ctx:PEcore_IMF_Context; data:pointer; len:Plongint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the "return" key type. This type is used to set string or icon on the "return" key of the input panel.
 *
 * An input panel displays the string or icon associated with this type.@n
 * Regardless of return key type, return key event will be generated when pressing return key.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param return_key_type The type of "return" key on the input panel
 * @note Default type is ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT.
 * @since 1.2.0
  }
procedure ecore_imf_context_input_panel_return_key_type_set(ctx:PEcore_IMF_Context; return_key_type:TEcore_IMF_Input_Panel_Return_Key_Type);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the "return" key type.
 *
 * @see ecore_imf_context_input_panel_return_key_type_set() for more details
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return The type of "return" key on the input panel
 * @since 1.2.0
  }
function ecore_imf_context_input_panel_return_key_type_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Return_Key_Type;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the return key on the input panel to be disabled.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param disabled The state
 * @since 1.2.0
  }
procedure ecore_imf_context_input_panel_return_key_disabled_set(ctx:PEcore_IMF_Context; disabled:TEina_Bool);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets whether the return key on the input panel should be disabled or not.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return @c EINA_TRUE if it should be disabled.
 * @since 1.2.0
  }
function ecore_imf_context_input_panel_return_key_disabled_get(ctx:PEcore_IMF_Context):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the caps lock mode on the input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param mode Turn on caps lock on the input panel if @c EINA_TRUE.
 * @since 1.2.0
  }
procedure ecore_imf_context_input_panel_caps_lock_mode_set(ctx:PEcore_IMF_Context; mode:TEina_Bool);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the caps lock mode on the input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return @c EINA_TRUE if the caps lock is turned on.
 * @since 1.2.0
  }
function ecore_imf_context_input_panel_caps_lock_mode_get(ctx:PEcore_IMF_Context):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the position of the current active input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param x top-left x co-ordinate of the input panel
 * @param y top-left y co-ordinate of the input panel
 * @param w width of the input panel
 * @param h height of the input panel
 * @since 1.3
  }
procedure ecore_imf_context_input_panel_geometry_get(ctx:PEcore_IMF_Context; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets state of current active input panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return The state of input panel.
 * @since 1.3
  }
function ecore_imf_context_input_panel_state_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_State;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Registers a callback function which will be called if there is change in input panel state,language,mode etc.
 * In order to deregister the callback function
 * Use @ref ecore_imf_context_input_panel_event_callback_del.
 *
 * @param ctx An #Ecore_IMF_Context
 * @param type event type
 * @param func the callback function
 * @param data application-input panel specific data.
 * @since 1.3
  }
(* Const before type ignored *)
procedure ecore_imf_context_input_panel_event_callback_add(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Input_Panel_Event; func:procedure (data:pointer; ctx:PEcore_IMF_Context; value:longint); data:pointer);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Unregisters a callback function which will be called if there is change in input panel state, language, mode etc.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param type An #Ecore_IMF_Input_Panel_Event.
 * @param func the callback function
 * @since 1.3
  }
procedure ecore_imf_context_input_panel_event_callback_del(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Input_Panel_Event; func:procedure (data:pointer; ctx:PEcore_IMF_Context; value:longint));cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Calls a given input panel callback on the context @p ctx.
 *
 * @param ctx Ecore_IMF_Context.
 * @param type The type of event that will trigger the callback
 * @param value the event value
 * @since 1.8.0
  }
procedure ecore_imf_context_input_panel_event_callback_call(ctx:PEcore_IMF_Context; _type:TEcore_IMF_Input_Panel_Event; value:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Deletes all input panel callback on the context @p ctx.
 *
 * Deletes all input panel callback to be registered by ecore_imf_context_input_panel_event_callback_add()
 *
 * @param ctx Ecore_IMF_Context.
 * @since 1.8.0
  }
procedure ecore_imf_context_input_panel_event_callback_clear(ctx:PEcore_IMF_Context);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the current language locale of the input panel.
 *
 * ex) fr_FR
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param lang Location to store the retrieved language string. The
 *             string retrieved must be freed with free().
 * @since 1.3
  }
procedure ecore_imf_context_input_panel_language_locale_get(ctx:PEcore_IMF_Context; lang:PPchar);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the geometry information of the candidate panel.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param x top-left x co-ordinate of the candidate panel
 * @param y top-left y co-ordinate of the candidate panel
 * @param w width of the candidate panel
 * @param h height of the candidate panel
 * @since 1.3
  }
procedure ecore_imf_context_candidate_panel_geometry_get(ctx:PEcore_IMF_Context; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets whether the Input Method Context should request to show the input panel in case of only a user's explicit Mouse Up event.
 * It doesn't request to show the input panel even though the Input Method Context has focus.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @param ondemand If true, the input panel will be shown in case of only Mouse up event. (Focus event will be ignored.)
 * @since 1.8.0
  }
procedure ecore_imf_context_input_panel_show_on_demand_set(ctx:PEcore_IMF_Context; ondemand:TEina_Bool);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets whether the Input Method Context should request to show the input panel in case of only a user's explicit Mouse Up event.
 *
 * @param ctx An #Ecore_IMF_Context.
 * @return @c EINA_TRUE if the input panel will be shown in case of only Mouse up event.
 * @since 1.8.0
  }
function ecore_imf_context_input_panel_show_on_demand_get(ctx:PEcore_IMF_Context):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the bidirectionality at the current cursor position.
 *
 * @since 1.12.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @param[in] direction The direction mode
  }
procedure ecore_imf_context_bidi_direction_set(ctx:PEcore_IMF_Context; direction:TEcore_IMF_BiDi_Direction);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the bidirectionality at the current cursor position.
 *
 * @since 1.12.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @return The direction mode
  }
function ecore_imf_context_bidi_direction_get(ctx:PEcore_IMF_Context):TEcore_IMF_BiDi_Direction;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Get the keyboard mode on the input panel.
 *
 * @since 1.20.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @return the keyboard mode
  }
function ecore_imf_context_keyboard_mode_get(ctx:PEcore_IMF_Context):TEcore_IMF_Input_Panel_Keyboard_Mode;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Set the prediction hint string to deliver to the input panel.
 *
 * This API can be used when you want to set prediction hint to use intelligent reply suggestion service.
 * The intelligent reply suggestion service generates reply candidates for given prediction hint.
 * Example
 * prediction hint: How are you? -> result: I'm fine, Not bad, I'm all right.
 *
 * @since 1.20.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @param[in] prediction_hint The prediction hint string.
  }
(* Const before type ignored *)
procedure ecore_imf_context_prediction_hint_set(ctx:PEcore_IMF_Context; prediction_hint:Pchar);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the allowed MIME type to deliver to the input panel.
 *
 * @since 1.20.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @param[in] mime_type The allowed MIME type in entry
 *
 * Example
 * @code
 * const char *mime_type = "text/plain,image/png,application/pdf";
 * ecore_imf_context_mime_type_accept_set(imf_context, mime_type);
 * @endcode
  }
(* Const before type ignored *)
procedure ecore_imf_context_mime_type_accept_set(ctx:PEcore_IMF_Context; mime_type:Pchar);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the x,y coordinates of the input panel.
 * @remarks This API can be used in floating mode.
 *
 * @since 1.21.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @param x top-left x coordinate of the input panel
 * @param y top-left y coordinate of the input panel
  }
procedure ecore_imf_context_input_panel_position_set(ctx:PEcore_IMF_Context; x:longint; y:longint);cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Sets the prediction hint data at the specified key
 *
 * @since 1.21.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @param key The key of the prediction hint
 * @param value The data to replace
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * This function modifies the data of @p key with @p data in the hash associated @p
 * ctx. If no entry is found, @p data is added to the hash associated @p ctx with the
 * key @p key. On success this function returns EINA_TRUE,
 * otherwise it returns @c EINA_FALSE.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_imf_context_prediction_hint_hash_set(ctx:PEcore_IMF_Context; key:Pchar; value:Pchar):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Removes the prediction hint data identified by a key
 *
 * @since 1.21.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @param key The key of the prediction hint
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * This function removes the entry identified by @p key from the hash associated @p ctx.
  }
(* Const before type ignored *)
function ecore_imf_context_prediction_hint_hash_del(ctx:PEcore_IMF_Context; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IMF_Context_Group
 * @brief Gets the hash table of prediction hint data
 *
 * @since 1.21.0
 *
 * @param[in] ctx An #Ecore_IMF_Context
 * @return The prediction hint hash table
  }
(* Const before type ignored *)
function ecore_imf_context_prediction_hint_hash_get(ctx:PEcore_IMF_Context):PEina_Hash;cdecl;external;

implementation


end.
