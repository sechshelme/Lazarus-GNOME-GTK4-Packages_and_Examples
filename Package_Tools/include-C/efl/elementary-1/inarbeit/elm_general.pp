
unit elm_general;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_general.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_general.h
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
PElm_Atspi_Bridge_State  = ^Elm_Atspi_Bridge_State;
PElm_Autocapital_Type  = ^Elm_Autocapital_Type;
PElm_Cnp_Mode  = ^Elm_Cnp_Mode;
PElm_Event_Atspi_Bridge_State_Changed  = ^Elm_Event_Atspi_Bridge_State_Changed;
PElm_Event_Policy_Changed  = ^Elm_Event_Policy_Changed;
PElm_Focus_Autoscroll_Mode  = ^Elm_Focus_Autoscroll_Mode;
PElm_Focus_Direction  = ^Elm_Focus_Direction;
PElm_Focus_Move_Policy  = ^Elm_Focus_Move_Policy;
PElm_Focus_Region_Show_Mode  = ^Elm_Focus_Region_Show_Mode;
PElm_Gengrid_Item_Field_Type  = ^Elm_Gengrid_Item_Field_Type;
PElm_Gengrid_Item_Scrollto_Type  = ^Elm_Gengrid_Item_Scrollto_Type;
PElm_Genlist_Item_Field_Type  = ^Elm_Genlist_Item_Field_Type;
PElm_Genlist_Item_Scrollto_Type  = ^Elm_Genlist_Item_Scrollto_Type;
PElm_Genlist_Item_Type  = ^Elm_Genlist_Item_Type;
PElm_Icon_Type  = ^Elm_Icon_Type;
PElm_Input_Hints  = ^Elm_Input_Hints;
PElm_Input_Panel_Lang  = ^Elm_Input_Panel_Lang;
PElm_Input_Panel_Layout  = ^Elm_Input_Panel_Layout;
PElm_Input_Panel_Return_Key_Type  = ^Elm_Input_Panel_Return_Key_Type;
PElm_List_Mode  = ^Elm_List_Mode;
PElm_Object_Layer  = ^Elm_Object_Layer;
PElm_Object_Multi_Select_Mode  = ^Elm_Object_Multi_Select_Mode;
PElm_Object_Select_Mode  = ^Elm_Object_Select_Mode;
PElm_Policy  = ^Elm_Policy;
PElm_Policy_Exit  = ^Elm_Policy_Exit;
PElm_Policy_Quit  = ^Elm_Policy_Quit;
PElm_Policy_Throttle  = ^Elm_Policy_Throttle;
PElm_Process_State  = ^Elm_Process_State;
PElm_Slider_Indicator_Visible_Mode  = ^Elm_Slider_Indicator_Visible_Mode;
PElm_Softcursor_Mode  = ^Elm_Softcursor_Mode;
PElm_Text_Format  = ^Elm_Text_Format;
PElm_Wrap_Type  = ^Elm_Wrap_Type;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_GENERAL_H}
{$define _ELM_GENERAL_H}
{*
 * @defgroup Elm_General General
 * @ingroup Elementary
 *
 * @brief General Elementary API. Functions that don't relate to
 * Elementary objects specifically.
 *
 * Here are documented functions which init/shutdown the library,
 * that apply to generic Elementary objects, that deal with
 * configuration, et cetera.
 *
 * @ref general_functions_example_page "This" example contemplates
 * some of these functions.
  }
{*
 * @addtogroup Elm_General
 * @
  }
{ Legacy types }
{$include "elm_general.eot.h"}
{* Possible values for the selection policy of some widgets.
 *
 * @since 1.7
 *
 * @ingroup Elm_Object
  }
{*< default select mode. Once an item is
                                       * selected, it would stay highlighted
                                       * and not going to call selected
                                       * callback again even it was clicked.
                                       * Items can get focus.  }
{*< always select mode. Item selected
                                  * callbacks will be called every time for
                                  * click events, even after the item was
                                  * already selected. Items can get focus.  }
{*< no select mode. Items will never be
                                * highlighted and selected but the size will be
                                * adjusted by the finger size configuration.
                                * Items can't get focus.  }
{*< no select mode with no finger size
                                        * rule. Items will never be highlighted
                                        * and selected and ignore the finger
                                        * size. So the item size can be reduced
                                        * below than the finger size
                                        * configuration. Items can't get focus.
                                         }
{*< canary value: any value greater or equal to
                              * ELM_OBJECT_SELECT_MODE_MAX is forbidden.  }
type
  PElm_Object_Select_Mode = ^TElm_Object_Select_Mode;
  TElm_Object_Select_Mode =  Longint;
  Const
    ELM_OBJECT_SELECT_MODE_DEFAULT = 0;
    ELM_OBJECT_SELECT_MODE_ALWAYS = 1;
    ELM_OBJECT_SELECT_MODE_NONE = 2;
    ELM_OBJECT_SELECT_MODE_DISPLAY_ONLY = 3;
    ELM_OBJECT_SELECT_MODE_MAX = 4;
;
{* Elementary icon types
 *
 * @ingroup Elm_Icon
  }
{*< Icon has no type set  }
{*< Icon is of type file  }
{*< Icon is of type standard  }
type
  PElm_Icon_Type = ^TElm_Icon_Type;
  TElm_Icon_Type =  Longint;
  Const
    ELM_ICON_NONE = 0;
    ELM_ICON_FILE = 1;
    ELM_ICON_STANDARD = 2;
;
{* Input panel (virtual keyboard) layout types. Type of input panel (virtual
 * keyboard) to use - this is a hint and may not provide exactly what is
 * desired.
 *
 * @ingroup Elm_Input_Panel
  }
{*< Default layout.  }
{*< Number layout.  }
{*< Email layout.  }
{*< URL layout.  }
{*< Phone Number layout.  }
{*< IP layout.  }
{*< Month layout.  }
{*< Number Only layout.  }
{*< Never use this.  }
{*< Hexadecimal layout.  }
{*< Command-line terminal layout including
                                    * esc, alt, ctrl key, so on (no
                                    * auto-correct, no auto-capitalization).  }
{*< Like normal, but no auto-correct, no
                                    * auto-capitalization etc.  }
{*< Date and time layout
                                    *
                                    * @since 1.8  }
{*< Emoticon layout
                                    *
                                    * @since 1.10  }
{*< Voice layout, but if the IME does not
                                * support voice layout, then normal layout will
                                * be shown.
                                *
                                * @since 1.19  }
type
  PElm_Input_Panel_Layout = ^TElm_Input_Panel_Layout;
  TElm_Input_Panel_Layout =  Longint;
  Const
    ELM_INPUT_PANEL_LAYOUT_NORMAL = 0;
    ELM_INPUT_PANEL_LAYOUT_NUMBER = 1;
    ELM_INPUT_PANEL_LAYOUT_EMAIL = 2;
    ELM_INPUT_PANEL_LAYOUT_URL = 3;
    ELM_INPUT_PANEL_LAYOUT_PHONENUMBER = 4;
    ELM_INPUT_PANEL_LAYOUT_IP = 5;
    ELM_INPUT_PANEL_LAYOUT_MONTH = 6;
    ELM_INPUT_PANEL_LAYOUT_NUMBERONLY = 7;
    ELM_INPUT_PANEL_LAYOUT_INVALID = 8;
    ELM_INPUT_PANEL_LAYOUT_HEX = 9;
    ELM_INPUT_PANEL_LAYOUT_TERMINAL = 10;
    ELM_INPUT_PANEL_LAYOUT_PASSWORD = 11;
    ELM_INPUT_PANEL_LAYOUT_DATETIME = 12;
    ELM_INPUT_PANEL_LAYOUT_EMOTICON = 13;
    ELM_INPUT_PANEL_LAYOUT_VOICE = 14;
;
{* Input panel (virtual keyboard) language modes.
 *
 * @ingroup Elm_Input_Panel
  }
{*< Automatic  }
{*< Alphabet  }
type
  PElm_Input_Panel_Lang = ^TElm_Input_Panel_Lang;
  TElm_Input_Panel_Lang =  Longint;
  Const
    ELM_INPUT_PANEL_LANG_AUTOMATIC = 0;
    ELM_INPUT_PANEL_LANG_ALPHABET = 1;
;
{* Autocapitalization Types. Choose method of auto-capitalization.
 *
 * @ingroup Elm_Autocapital
  }
{*< No auto-capitalization when typing.  }
{*< Autocapitalize each word typed.  }
{*< Autocapitalize the start of each sentence.
                                   }
{*< Autocapitalize all letters.  }
type
  PElm_Autocapital_Type = ^TElm_Autocapital_Type;
  TElm_Autocapital_Type =  Longint;
  Const
    ELM_AUTOCAPITAL_TYPE_NONE = 0;
    ELM_AUTOCAPITAL_TYPE_WORD = 1;
    ELM_AUTOCAPITAL_TYPE_SENTENCE = 2;
    ELM_AUTOCAPITAL_TYPE_ALLCHARACTER = 3;
;
{* "Return" Key types on the input panel (virtual keyboard).
 *
 * @ingroup Elm_Input_Panel_Return_Key
  }
{*< Default.  }
{*< Done.  }
{*< Go.  }
{*< Join.  }
{*< Login.  }
{*< Next.  }
{*< Search string or magnifier icon.
                                            }
{*< Send.  }
{*< Sign-in
                                          *
                                          * @since 1.8  }
type
  PElm_Input_Panel_Return_Key_Type = ^TElm_Input_Panel_Return_Key_Type;
  TElm_Input_Panel_Return_Key_Type =  Longint;
  Const
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7;
    ELM_INPUT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;
;
{* Enumeration that defines the types of Input Hints.
 *
 * @since 1.12
 *
 * @ingroup Elm_Input
  }
{*< No active hints
                            *
                            * @since 1.12  }
{ 1 >> 0  }{*< Suggest word auto
                                                  * completion
                                                  *
                                                  * @since 1.12  }
{ 1 >> 1  }{*< Typed text should not be
                                                   * stored.
                                                   *
                                                   * @since 1.12  }
{*< Autofill hint for a credit card
                                                              * expiration date
                                                              *
                                                              * @since 1.21  }
{*< Autofill hint for a credit card
                                                             * expiration day
                                                             *
                                                             * @since 1.21  }
{*< Autofill hint for a credit card
                                                               * expiration month
                                                               *
                                                               * @since 1.21  }
{*< Autofill hint for a credit card
                                                               * expiration year
                                                               *
                                                               * @since 1.21  }
{*< Autofill hint for a
                                                      * credit card number
                                                      *
                                                      * @since 1.21  }
{*< Autofill hint for an email
                                                 * address
                                                 *
                                                 * @since 1.21  }
{*< Autofill hint for a user's real name
                                        *
                                        * @since 1.21  }
{*< Autofill hint for a phone number
                                         *
                                         * @since 1.21  }
{*< Autofill hint for a postal
                                                  * address
                                                  *
                                                  * @since 1.21  }
{*< Autofill hint for a postal
                                               * code
                                               *
                                               * @since 1.21  }
{*< Autofill hint for a user's ID
                                     *
                                     * @since 1.21  }
type
  PElm_Input_Hints = ^TElm_Input_Hints;
  TElm_Input_Hints =  Longint;
  Const
    ELM_INPUT_HINT_NONE = 0;
    ELM_INPUT_HINT_AUTO_COMPLETE = 1;
    ELM_INPUT_HINT_SENSITIVE_DATA = 2;
    ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DATE = 256;
    ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DAY = 512;
    ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_MONTH = 768;
    ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_YEAR = 1024;
    ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_NUMBER = 1280;
    ELM_INPUT_HINT_AUTOFILL_EMAIL_ADDRESS = 1536;
    ELM_INPUT_HINT_AUTOFILL_NAME = 1792;
    ELM_INPUT_HINT_AUTOFILL_PHONE = 2048;
    ELM_INPUT_HINT_AUTOFILL_POSTAL_ADDRESS = 2304;
    ELM_INPUT_HINT_AUTOFILL_POSTAL_CODE = 2560;
    ELM_INPUT_HINT_AUTOFILL_ID = 2816;
;
{* Data on the event when an Elementary policy has changed
 *
 * @ingroup Elm_Event
  }
{*< the policy identifier  }
{*< value the policy had before the change  }
{*< new value the policy got  }
type
  PElm_Event_Policy_Changed = ^TElm_Event_Policy_Changed;
  TElm_Event_Policy_Changed = record
      policy : dword;
      new_value : longint;
      old_value : longint;
    end;
{* Policy identifiers.
 *
 * @ingroup Elm
  }
{*< under which circumstances the application should
                        * quit automatically. See also @ref ELM_POLICY_QUIT.  }
{*< defines elm_exit() behaviour. See also
                    * @ref ELM_POLICY_EXIT.
                    *
                    * @since 1.8  }
{*< defines how throttling should work. See also
                        * @ref ELM_POLICY_THROTTLE
                        *
                        * @since 1.8  }
{*< Sentinel value to indicate last enum field during
                   * iteration  }

  PElm_Policy = ^TElm_Policy;
  TElm_Policy =  Longint;
  Const
    ELM_POLICY_QUIT = 0;
    ELM_POLICY_EXIT = 1;
    ELM_POLICY_THROTTLE = 2;
    ELM_POLICY_LAST = 3;
;
{* Possible values for the @ref ELM_POLICY_QUIT policy
 *
 * @ingroup Elm
  }
{*< never quit the application automatically  }
{*< quit when the application's last
                                       * window is closed  }
{*< quit when the application's last
                                      * window is hidden
                                      *
                                      * @since 1.14  }
type
  PElm_Policy_Quit = ^TElm_Policy_Quit;
  TElm_Policy_Quit =  Longint;
  Const
    ELM_POLICY_QUIT_NONE = 0;
    ELM_POLICY_QUIT_LAST_WINDOW_CLOSED = 1;
    ELM_POLICY_QUIT_LAST_WINDOW_HIDDEN = 2;
;
{* Possible values for the @ref ELM_POLICY_EXIT policy.
 *
 * @since 1.8
 *
 * @ingroup Elm
  }
{*< just quit the main loop on elm_exit()  }
{*< delete all the windows after quitting the
                               * main loop  }
type
  PElm_Policy_Exit = ^TElm_Policy_Exit;
  TElm_Policy_Exit =  Longint;
  Const
    ELM_POLICY_EXIT_NONE = 0;
    ELM_POLICY_EXIT_WINDOWS_DEL = 1;
;
{* Possible values for the @ref ELM_POLICY_THROTTLE policy.
 *
 * @since 1.8
 *
 * @ingroup Elm
  }
{*< do whatever elementary config is
                                   * configured to do  }
{*< always throttle when all windows are
                                      * no longer visible  }
{*< never throttle when windows are all hidden,
                             * regardless of config settings  }
type
  PElm_Policy_Throttle = ^TElm_Policy_Throttle;
  TElm_Policy_Throttle =  Longint;
  Const
    ELM_POLICY_THROTTLE_CONFIG = 0;
    ELM_POLICY_THROTTLE_HIDDEN_ALWAYS = 1;
    ELM_POLICY_THROTTLE_NEVER = 2;
;
{* Possible values for the multi-selection policy of some widgets.
 *
 * @since 1.8
 *
 * @ingroup Elm_Object
  }
{*< default multiple select mode  }
{*< disallow multiple selection
                                              * when clicked without control
                                              * key pressed  }
{*< canary value: any value greater or equal
                                    * to ELM_OBJECT_MULTI_SELECT_MODE_MAX is
                                    * forbidden.  }
type
  PElm_Object_Multi_Select_Mode = ^TElm_Object_Multi_Select_Mode;
  TElm_Object_Multi_Select_Mode =  Longint;
  Const
    ELM_OBJECT_MULTI_SELECT_MODE_DEFAULT = 0;
    ELM_OBJECT_MULTI_SELECT_MODE_WITH_CONTROL = 1;
    ELM_OBJECT_MULTI_SELECT_MODE_MAX = 2;
;
{*
 * @brief Line wrapping types. Type of word or character wrapping to use.
 *
 * See also @ref elm_entry_line_wrap_set, @ref
 * elm_popup_content_text_wrap_type_set, @ref elm_label_line_wrap_set.
 *
 * @ingroup Elm_Wrap
  }
{*< No wrap - value is zero.  }
{*< Char wrap - wrap between characters.  }
{*< Word wrap - wrap in allowed wrapping points (as defined in
                  * the unicode standard).  }
{*< Mixed wrap - Word wrap, and if that fails, char wrap.  }
{*< Sentinel value to indicate last enum field during iteration
                  }
type
  PElm_Wrap_Type = ^TElm_Wrap_Type;
  TElm_Wrap_Type =  Longint;
  Const
    ELM_WRAP_NONE = 0;
    ELM_WRAP_CHAR = 1;
    ELM_WRAP_WORD = 2;
    ELM_WRAP_MIXED = 3;
    ELM_WRAP_LAST = 4;
;
{* Text Format types.
 *
 * @ingroup Elm
  }
{*< Plain UTF8 type  }
{*< Markup UTF8 type  }
type
  PElm_Text_Format = ^TElm_Text_Format;
  TElm_Text_Format =  Longint;
  Const
    ELM_TEXT_FORMAT_PLAIN_UTF8 = 0;
    ELM_TEXT_FORMAT_MARKUP_UTF8 = 1;
;
{* Enum of entry's copy & paste policy.
 *
 * @ingroup Elm
  }
{*< copy & paste text with markup tag  }
{*< copy & paste text without item(image) tag  }
{*< copy & paste text without markup tag  }
type
  PElm_Cnp_Mode = ^TElm_Cnp_Mode;
  TElm_Cnp_Mode =  Longint;
  Const
    ELM_CNP_MODE_MARKUP = 0;
    ELM_CNP_MODE_NO_IMAGE = 1;
    ELM_CNP_MODE_PLAINTEXT = 2;
;
{* Defines if the item is of any special type (has subitems or it's the index
 * of a group), or is just a simple item.
 *
 * @ingroup Elm_Genlist_Item_Group
  }
{*< Simple item.  }
{ 1 >> 0  }{*< This may be expanded and have
                                           * child items.  }
{ 1 >> 1  }{*< An index item of a group of
                                            * items. this item can have child
                                            * items.  }
{ 1 >> 2  }{*< Sentinel value to indicate last
                                         * enum field during iteration  }
type
  PElm_Genlist_Item_Type = ^TElm_Genlist_Item_Type;
  TElm_Genlist_Item_Type =  Longint;
  Const
    ELM_GENLIST_ITEM_NONE = 0;
    ELM_GENLIST_ITEM_TREE = 1;
    ELM_GENLIST_ITEM_GROUP = 2;
    ELM_GENLIST_ITEM_MAX = 4;
;
{* Defines the type of the item part Used while updating item's parts It can
 * be used at updating multi fields.
 *
 * @ingroup Elm_Genlist_Item_Group
  }
{*< Type all  }
{ 1 >> 0  }{*< Type text  }
{ 1 >> 1  }{*< Type content  }
{ 1 >> 2  }{*< Type state  }
type
  PElm_Genlist_Item_Field_Type = ^TElm_Genlist_Item_Field_Type;
  TElm_Genlist_Item_Field_Type =  Longint;
  Const
    ELM_GENLIST_ITEM_FIELD_ALL = 0;
    ELM_GENLIST_ITEM_FIELD_TEXT = 1;
    ELM_GENLIST_ITEM_FIELD_CONTENT = 2;
    ELM_GENLIST_ITEM_FIELD_STATE = 4;
;
{* Defines where to position the item in the genlist.
 *
 * @ingroup Elm_Genlist_Item_Group
  }
{*< Nothing will happen, Don't use this
                                       * value.  }
{ 1 >> 0  }{*< To the nearest viewport.
                                                   }
{ 1 >> 1  }{*< To the top of viewport.
                                                    }
{ 1 >> 2  }{*< To the middle of
                                                      * viewport.  }
{ 1 >> 3  }{*< To the bottom of
                                                     * viewport.  }
type
  PElm_Genlist_Item_Scrollto_Type = ^TElm_Genlist_Item_Scrollto_Type;
  TElm_Genlist_Item_Scrollto_Type =  Longint;
  Const
    ELM_GENLIST_ITEM_SCROLLTO_NONE = 0;
    ELM_GENLIST_ITEM_SCROLLTO_IN = 1;
    ELM_GENLIST_ITEM_SCROLLTO_TOP = 2;
    ELM_GENLIST_ITEM_SCROLLTO_MIDDLE = 4;
    ELM_GENLIST_ITEM_SCROLLTO_BOTTOM = 8;
;
{* Defines where to position the item in the genlist.
 *
 * @ingroup Elm_Gengrid_Item_Group
  }
{*< No scrollto.  }
{ 1 >> 0  }{*< To the nearest viewport.
                                                   }
{ 1 >> 1  }{*< To the top of viewport.
                                                    }
{ 1 >> 2  }{*< To the middle of
                                                      * viewport.  }
{ 1 >> 3  }{*< To the bottom of
                                                     * viewport.  }
type
  PElm_Gengrid_Item_Scrollto_Type = ^TElm_Gengrid_Item_Scrollto_Type;
  TElm_Gengrid_Item_Scrollto_Type =  Longint;
  Const
    ELM_GENGRID_ITEM_SCROLLTO_NONE = 0;
    ELM_GENGRID_ITEM_SCROLLTO_IN = 1;
    ELM_GENGRID_ITEM_SCROLLTO_TOP = 2;
    ELM_GENGRID_ITEM_SCROLLTO_MIDDLE = 4;
    ELM_GENGRID_ITEM_SCROLLTO_BOTTOM = 8;
;
{* Defines the type of the item part Used while updating item's parts. It can
 * be used at updating multi fields.
 *
 * @ingroup Elm_Gengrid_Item_Group
  }
{*< Type all  }
{ 1 >> 0  }{*< Type text  }
{ 1 >> 1  }{*< Type content  }
{ 1 >> 2  }{*< Type state  }
type
  PElm_Gengrid_Item_Field_Type = ^TElm_Gengrid_Item_Field_Type;
  TElm_Gengrid_Item_Field_Type =  Longint;
  Const
    ELM_GENGRID_ITEM_FIELD_ALL = 0;
    ELM_GENGRID_ITEM_FIELD_TEXT = 1;
    ELM_GENGRID_ITEM_FIELD_CONTENT = 2;
    ELM_GENGRID_ITEM_FIELD_STATE = 4;
;
{*
 * @brief Set list's resizing behavior, transverse axis scrolling and items
 * cropping. See each mode's description for more details.
 *
 * @note Default value is @ref ELM_LIST_SCROLL.
 *
 * Values here don't work as bitmasks -- only one can be chosen at a time.
 *
 * @ingroup Elm_List
  }
{*< The list won't set any of its size hints to inform
                          * how a possible container should resize it. Then, if
                          * it's not created as a "resize object", it might end
                          * with zeroed dimensions. The list will respect the
                          * container's geometry and, if any of its items won't
                          * fit into its transverse axis, one won't be able to
                          * scroll it in that direction.  }
{*< Default value. This is the same as #ELM_LIST_COMPRESS,
                    * with the exception that if any of its items won't fit
                    * into its transverse axis, one will be able to scroll it
                    * in that direction.  }
{*< Sets a minimum size hint on the list object, so that
                   * containers may respect it (and resize itself to fit the
                   * child properly). More specifically, a minimum size hint
                   * will be set for its transverse axis, so that the largest
                   * item in that direction fits well. This is naturally bound
                   * by the list object's maximum size hints, set externally.
                    }
{*< Besides setting a minimum size on the transverse axis,
                    * just like on @ref ELM_LIST_LIMIT, the list will set a
                    * minimum size on the longitudinal axis, trying to reserve
                    * space to all its children to be visible at a time. . This
                    * is naturally bound by the list object's maximum size
                    * hints, set externally.  }
{*< Indicates error if returned by elm_list_mode_get().  }
type
  PElm_List_Mode = ^TElm_List_Mode;
  TElm_List_Mode =  Longint;
  Const
    ELM_LIST_COMPRESS = 0;
    ELM_LIST_SCROLL = 1;
    ELM_LIST_LIMIT = 2;
    ELM_LIST_EXPAND = 3;
    ELM_LIST_LAST = 4;
;
{*< previous direction  }
{*< next direction  }
{*< up direction  }
{*< down direction  }
{*< right direction  }
{*< left direction  }
{*< last direction  }
type
  PElm_Focus_Direction = ^TElm_Focus_Direction;
  TElm_Focus_Direction =  Longint;
  Const
    ELM_FOCUS_PREVIOUS = 0;
    ELM_FOCUS_NEXT = 1;
    ELM_FOCUS_UP = 2;
    ELM_FOCUS_DOWN = 3;
    ELM_FOCUS_RIGHT = 4;
    ELM_FOCUS_LEFT = 5;
    ELM_FOCUS_LAST = 6;
;
{*
 * Defines couple of standard Evas_Object layers to be used
 * with evas_object_layer_set().
 *
 * @note whenever extending with new values, try to keep some padding
 *       to siblings so there is room for further extensions.
  }
{*< where to place backgrounds  }
{*< Evas_Object default layer (and thus for Elementary)  }
{*< where focus object visualization is  }
{*< where to show tooltips  }
{*< where to show cursors  }
{*< last layer known by Elementary  }
type
  PElm_Object_Layer = ^TElm_Object_Layer;
  TElm_Object_Layer =  Longint;
  Const
    ELM_OBJECT_LAYER_BACKGROUND = EVAS_LAYER_MIN+64;
    ELM_OBJECT_LAYER_DEFAULT = 0;
    ELM_OBJECT_LAYER_FOCUS = EVAS_LAYER_MAX-128;
    ELM_OBJECT_LAYER_TOOLTIP = EVAS_LAYER_MAX-64;
    ELM_OBJECT_LAYER_CURSOR = EVAS_LAYER_MAX-32;
    ELM_OBJECT_LAYER_LAST = (EVAS_LAYER_MAX-32)+1;
;
{* How the focus region should be calculated (not related to input focus).  }
{*< As a widget.  }
{*< As an item.  }
type
  PElm_Focus_Region_Show_Mode = ^TElm_Focus_Region_Show_Mode;
  TElm_Focus_Region_Show_Mode =  Longint;
  Const
    ELM_FOCUS_REGION_SHOW_WIDGET = 0;
    ELM_FOCUS_REGION_SHOW_ITEM = 1;
;
{* Possible values for the atspi bridge state.
 *
 * @since 1.26
 *
 * @ingroup Elm_Atspi_Bridge
  }
{*< when atspi bridge is ready  }
{*< when atspi bridge is shutdown  }
type
  PElm_Atspi_Bridge_State = ^TElm_Atspi_Bridge_State;
  TElm_Atspi_Bridge_State =  Longint;
  Const
    ELM_ATSPI_BRIDGE_CONNECTED = 0;
    ELM_ATSPI_BRIDGE_DISCONNECTED = 1;
;
{* Data on event when atspi bridge state is changed
 *
 * @since 1.26
 *
 * @ingroup Elm_Atspi_Bridge
  }
type
  PElm_Event_Atspi_Bridge_State_Changed = ^TElm_Event_Atspi_Bridge_State_Changed;
  TElm_Event_Atspi_Bridge_State_Changed = record
      state : TElm_Atspi_Bridge_State;
    end;
{************************************************************************ }
  var
    ELM_ECORE_EVENT_ETHUMB_CONNECT : longint;cvar;external;
{*
 * Emitted when the application has reconfigured elementary settings due
 * to an external configuration tool asking it to.
  }
    ELM_EVENT_CONFIG_ALL_CHANGED : longint;cvar;external;
{*
 * Emitted when any Elementary's policy value is changed.
  }
    ELM_EVENT_POLICY_CHANGED : longint;cvar;external;
{*
 * Emitted when nothing is visible and the process as a whole should go into
 * a background state.
 * @since 1.12
  }
    ELM_EVENT_PROCESS_BACKGROUND : longint;cvar;external;
{*
 * Emitted when going from nothing being visible to at least one window
 * being visible.
 * @since 1.12
  }
    ELM_EVENT_PROCESS_FOREGROUND : longint;cvar;external;
{*
 * Emitted when atspi bridge state is changed.
 * @since 1.26
  }
    ELM_EVENT_ATSPI_BRIDGE_STATE_CHANGED : longint;cvar;external;
type

  TElm_Event_Cb = function (data:pointer; obj:PEvas_Object; src:PEvas_Object; _type:TEvas_Callback_Type; event_info:pointer):TEina_Bool;cdecl;
{*< Function prototype definition for callbacks on input events happening on Elementary widgets. @a data will receive the user data pointer passed to elm_object_event_callback_add(). @a src will be a pointer to the widget on which the input event took place. @a type will get the type of this event and @a event_info, the struct with details on this event.  }
  var
    _elm_startup_time : Tdouble;cvar;external;
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
{#ifndef ELM_LIB_QUICKLAUNCH }
{#define ELM_MAIN() int main(int argc, char **argv)  int ret__; _elm_startup_time = ecore_time_unix_get(); elm_init(argc, argv); ret__ = elm_main(argc, argv); elm_shutdown(); return ret__;  /**< macro to be used after the elm_main() function */ }
{#else }
{* @deprecated macro to be used after the elm_main() function.
 * Do not define ELM_LIB_QUICKLAUNCH
 * Compile your programs with -fpie and -pie -rdynamic instead, to generate a single binary (linkable executable).
  }
{#define ELM_MAIN() int main(int argc, char **argv)  int ret__; _elm_startup_time = ecore_time_unix_get(); ret__ = elm_quicklaunch_fallback(argc, argv); elm_shutdown(); return ret__;  }
{#endif }
{$define __EFL_UI_IS_REQUIRED}
{$include "efl_general.h"}
{$ifndef __EFL_UI_IS_DEFINED}
{$error "You have an old efl_general.h installed in your local include/elementary-1/ remove it first."}
{$endif}
{************************************************************************ }
{ General calls  }
{*
 * Initialize Elementary
 *
 * @param[in] argc System's argument count value
 * @param[in] argv System's pointer to array of argument strings
 * @return The init counter value.
 *
 * This function initializes Elementary and increments a counter of
 * the number of calls to it. It returns the new counter's value.
 *
 * @warning This call is exported only for use by the @c ELM_MAIN()
 * macro. There is no need to use this if you use this macro (which
 * is highly advisable). An elm_main() should contain the entry
 * point code for your application, having the same prototype as
 * elm_init(), and @b not being static (putting the @c extern_MAIN symbol
 * in front of its type declaration is advisable). The @c
 * ELM_MAIN() call should be placed just after it.
 *
 * Example:
 * @dontinclude bg_example_01.c
 * @skip static void
 * @until ELM_MAIN
 *
 * See the full @ref bg_example_01_c "example".
 *
 * @see elm_shutdown().
 * @ingroup Elm_General
  }

function elm_init(argc:longint; argv:PPchar):longint;cdecl;external;
{*
 * Shut down Elementary
 *
 * @return The init counter value.
 *
 * This should be called at the end of your application, just
 * before it ceases to do any more processing. This will clean up
 * any permanent resources your application may have allocated via
 * Elementary that would otherwise persist.
 *
 * @see elm_init() for an example
 *
 * @note elm_shutdown() will iterate main loop until all ecore_evas are freed.
 * There is a possibility to call your ecore callbacks(timer, animator, event,
 * job, and etc.) in elm_shutdown()
 *
 * @ingroup Elm_General
  }
function elm_shutdown:longint;cdecl;external;
{*
 * Run Elementary's main loop
 *
 * This call should be issued just after all initialization is
 * completed. This function will not return until elm_exit() is
 * called. It will keep looping, running the main
 * (event/processing) loop for Elementary.
 *
 * This function should be called once only from the same thread that
 * initted elementary, (elm_init(), eina_init(), ...) and should never
 * be nested. Never call it from within an instance of itself.
 *
 * @see elm_init() for an example
 *
 * @ingroup Elm_General
  }
procedure elm_run;cdecl;external;
{*
 * Ask to exit Elementary's main loop
 *
 * If this call is issued, it will flag the main loop to cease
 * processing and return back to its parent function (usually your
 * elm_main() function). This does not mean the main loop instantly quits.
 * So your ecore callbacks(timer, animator, event, job, and etc.) have chances
 * to be called even after elm_exit().
 *
 * @see elm_init() for an example. There, just after a request to
 * close the window comes, the main loop will be left.
 *
 * @note By using the appropriate #ELM_POLICY_QUIT on your Elementary
 * applications, you'll be able to get this function called automatically for you.
 *
 * @ingroup Elm_General
  }
procedure elm_exit;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
procedure elm_quicklaunch_mode_set(ql_on:TEina_Bool);cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_mode_get:TEina_Bool;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_init(argc:longint; argv:PPchar):longint;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_sub_init(argc:longint; argv:PPchar):longint;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_sub_shutdown:longint;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_shutdown:longint;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
procedure elm_quicklaunch_seed;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
(* Const before type ignored *)
function elm_quicklaunch_prepare(argc:longint; argv:PPchar; cwd:Pchar):TEina_Bool;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
(* Const before type ignored *)
function efl_quicklaunch_prepare(argc:longint; argv:PPchar; cwd:Pchar):TEina_Bool;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_fork(argc:longint; argv:PPchar; cwd:Pchar; postfork_func:procedure (data:pointer); postfork_data:pointer):longint;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
procedure elm_quicklaunch_cleanup;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
function elm_quicklaunch_fallback(argc:longint; argv:PPchar):longint;cdecl;external;
{*
 * Exposed symbol used only by macros and should not be used by apps
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_quicklaunch_exe_path_get(exe:Pchar; cwd:Pchar):Pchar;cdecl;external;
{*
 * Set a new policy's value (for a given policy group/identifier).
 *
 * @param policy policy identifier, as in @ref Elm_Policy.
 * @param value policy value, which depends on the identifier
 *
 * @return @c EINA_TRUE on success or @c EINA_FALSE, on error.
 *
 * Elementary policies define applications' behavior,
 * somehow. These behaviors are divided in policy groups
 * (see #Elm_Policy enumeration). This call will emit the Ecore
 * event #ELM_EVENT_POLICY_CHANGED, which can be hooked at with
 * handlers. An #Elm_Event_Policy_Changed struct will be passed,
 * then.
 *
 * @note Currently, we have only one policy identifier/group
 * (#ELM_POLICY_QUIT), which has two possible values.
 *
 * @ingroup Elm_General
  }
function elm_policy_set(policy:dword; value:longint):TEina_Bool;cdecl;external;
{*
 * Get the policy value for given policy identifier.
 *
 * @param policy policy identifier, as in #Elm_Policy.
 * @return The currently set policy value, for that
 * identifier. Will be @c 0 if @p policy passed is invalid.
 *
 * @ingroup Elm_General
  }
function elm_policy_get(policy:dword):longint;cdecl;external;
{*
 * Change the language of the current application
 *
 * The @p lang passed must be the full name of the locale to use, for
 * example "en_US.utf8" or "es_ES@euro".
 *
 * Changing language with this function will make Elementary run through
 * all its widgets, translating strings set with
 * elm_object_domain_translatable_part_text_set(). This way, an entire
 * UI can have its language changed without having to restart the program.
 *
 * For more complex cases, like having formatted strings that need
 * translation, widgets will also emit a "language,changed" signal that
 * the user can listen to and manually translate the text.
 *
 * @param lang Language to set, must be the full name of the locale
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
procedure elm_language_set(lang:Pchar);cdecl;external;
{< The process is in a foreground/active/running state - work as normal. @since 1.12  }
{< The process is in the bacgkround, so you may want to stop animating, fetching data as often etc. @since 1.12  }
type
  PElm_Process_State = ^TElm_Process_State;
  TElm_Process_State =  Longint;
  Const
    ELM_PROCESS_STATE_FOREGROUND = 0;
    ELM_PROCESS_STATE_BACKGROUND = 1;
;
{* The state of the process as a whole. @since 1.12  }
{*
 * Get the process state as a while
 *
 * @return The current process state
 *
 * The process may logically be some runnable state. a "foreground" application
 * runs as normal and may be user-visible or "active" in some way. A
 * background application is not user-visible or otherwise important and
 * likely should release resources and not wake up often or process much.
 *
 * @ingroup Elm_General
 * @since 1.12
  }

function elm_process_state_get:TElm_Process_State;cdecl;external;
{ legacy to eo translation  }
{*< Directly show the focused region
                                          * or item automatically.  }
{*< Do not show the focused region or item
                                      * automatically.  }
{*< Bring in the focused region or item
                                         * automatically which might invole the
                                         * scrolling.  }
type
  PElm_Focus_Autoscroll_Mode = ^TElm_Focus_Autoscroll_Mode;
  TElm_Focus_Autoscroll_Mode =  Longint;
  Const
    ELM_FOCUS_AUTOSCROLL_MODE_SHOW = 0;
    ELM_FOCUS_AUTOSCROLL_MODE_NONE = 1;
    ELM_FOCUS_AUTOSCROLL_MODE_BRING_IN = 2;
;
{*< Auto-detect if a software cursor should
                                    * be used (default).  }
{*< Always use a softcursor.  }
{*< Never use a softcursor.  }
type
  PElm_Softcursor_Mode = ^TElm_Softcursor_Mode;
  TElm_Softcursor_Mode =  Longint;
  Const
    ELM_SOFTCURSOR_MODE_AUTO = 0;
    ELM_SOFTCURSOR_MODE_ON = 1;
    ELM_SOFTCURSOR_MODE_OFF = 2;
;
{*< show indicator on mouse
                                                     * down or change in slider
                                                     * value  }
{*< Always show the indicator.
                                                 }
{*< Show the indicator on
                                                  * focus  }
{*< Never show the indicator  }
type
  PElm_Slider_Indicator_Visible_Mode = ^TElm_Slider_Indicator_Visible_Mode;
  TElm_Slider_Indicator_Visible_Mode =  Longint;
  Const
    ELM_SLIDER_INDICATOR_VISIBLE_MODE_DEFAULT = 0;
    ELM_SLIDER_INDICATOR_VISIBLE_MODE_ALWAYS = 1;
    ELM_SLIDER_INDICATOR_VISIBLE_MODE_ON_FOCUS = 2;
    ELM_SLIDER_INDICATOR_VISIBLE_MODE_NONE = 3;
;
{*< Move focus by mouse click or touch.
                                       * Elementary focus is set on mouse click
                                       * and this is checked at mouse up time.
                                       * (default)  }
{*< Move focus by mouse in. Elementary focus is
                                * set on mouse move when the mouse pointer is
                                * moved into an object.  }
{*< Move focus by key. Elementary focus is
                                     * set on key input like Left, Right, Up,
                                     * Down, Tab, or Shift+Tab.  }
type
  PElm_Focus_Move_Policy = ^TElm_Focus_Move_Policy;
  TElm_Focus_Move_Policy =  Longint;
  Const
    ELM_FOCUS_MOVE_POLICY_CLICK = 0;
    ELM_FOCUS_MOVE_POLICY_IN = 1;
    ELM_FOCUS_MOVE_POLICY_KEY_ONLY = 2;
;
{*
 * @
  }
{$endif}

implementation


end.
