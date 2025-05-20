
unit efl_input_text_entity_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_text_entity_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_text_entity_eo.h
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
PEfl_Input_Text_Capitalize_Type  = ^Efl_Input_Text_Capitalize_Type;
PEfl_Input_Text_Content_Type  = ^Efl_Input_Text_Content_Type;
PEfl_Input_Text_Entity  = ^Efl_Input_Text_Entity;
PEfl_Input_Text_Panel_Language_Type  = ^Efl_Input_Text_Panel_Language_Type;
PEfl_Input_Text_Panel_Layout_Normal_Variation_Type  = ^Efl_Input_Text_Panel_Layout_Normal_Variation_Type;
PEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type  = ^Efl_Input_Text_Panel_Layout_Numberonly_Variation_Type;
PEfl_Input_Text_Panel_Layout_Password_Variation_Type  = ^Efl_Input_Text_Panel_Layout_Password_Variation_Type;
PEfl_Input_Text_Panel_Layout_Type  = ^Efl_Input_Text_Panel_Layout_Type;
PEfl_Input_Text_Panel_Return_Key_State  = ^Efl_Input_Text_Panel_Return_Key_State;
PEfl_Input_Text_Panel_Return_Key_Type  = ^Efl_Input_Text_Panel_Return_Key_Type;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_TEXT_ENTITY_EO_H_}
{$define _EFL_INPUT_TEXT_ENTITY_EO_H_}
{$ifndef _EFL_INPUT_TEXT_ENTITY_EO_CLASS_TYPE}
{$define _EFL_INPUT_TEXT_ENTITY_EO_CLASS_TYPE}
type
  PEfl_Input_Text_Entity = ^TEfl_Input_Text_Entity;
  TEfl_Input_Text_Entity = TEo;
{$endif}
{$ifndef _EFL_INPUT_TEXT_ENTITY_EO_TYPES}
{$define _EFL_INPUT_TEXT_ENTITY_EO_TYPES}
{* Input panel (virtual keyboard) layout types. Type of input panel (virtual
 * keyboard) to use - this is a hint and may not provide exactly what is
 * desired.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Panel_Layout_Type
  }
{*< Default layout.
                                                *
                                                * @since 1.24  }
{*< Number layout.
                                            *
                                            * @since 1.24  }
{*< Email layout.
                                           *
                                           * @since 1.24  }
{*< URL layout.
                                         *
                                         * @since 1.24  }
{*< Phone Number layout.
                                                  *
                                                  * @since 1.24  }
{*< IP layout.
                                        *
                                        * @since 1.24  }
{*< Month layout.
                                           *
                                           * @since 1.24  }
{*< Number Only layout.
                                                 *
                                                 * @since 1.24  }
{*< Never use this.
                                             *
                                             * @since 1.24  }
{*< Hexadecimal layout.
                                         *
                                         * @since 1.24  }
{*< Command-line terminal layout
                                              * including esc, alt, ctrl key,
                                              * so on (no auto-correct, no
                                              * auto-capitalization).
                                              *
                                              * @since 1.24  }
{*< Like normal, but no
                                              * auto-correct, no
                                              * auto-capitalization etc.
                                              *
                                              * @since 1.24  }
{*< Date and time layout.
                                              *
                                              * @since 1.24  }
{*< Emoticon layout.
                                              *
                                              * @since 1.24  }
{*< Voice layout, but if the IME does
                                          * not support voice layout, then
                                          * normal layout will be shown.
                                          *
                                          * @since 1.24  }
type
  PEfl_Input_Text_Panel_Layout_Type = ^TEfl_Input_Text_Panel_Layout_Type;
  TEfl_Input_Text_Panel_Layout_Type =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_NORMAL = 0;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_NUMBER = 1;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_EMAIL = 2;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_URL = 3;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_PHONE_NUMBER = 4;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_IP = 5;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_MONTH = 6;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_NUMBER_ONLY = 7;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_INVALID = 8;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_HEX = 9;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_TERMINAL = 10;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_PASSWORD = 11;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_DATETIME = 12;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_EMOTICON = 13;
    EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_VOICE = 14;
;
{* Input panel (virtual keyboard) language modes.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Panel_Language_Type
  }
{*< Automatic
                                                     *
                                                     * @since 1.24  }
{*< Alphabet
                                               *
                                               * @since 1.24  }
type
  PEfl_Input_Text_Panel_Language_Type = ^TEfl_Input_Text_Panel_Language_Type;
  TEfl_Input_Text_Panel_Language_Type =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_LANGUAGE_TYPE_AUTOMATIC = 0;
    EFL_INPUT_TEXT_PANEL_LANGUAGE_TYPE_ALPHABET = 1;
;
{* Autocapitalization Types. Choose method of auto-capitalization.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Capitalize_Type
  }
{*< No auto-capitalization when
                                            * typing.
                                            *
                                            * @since 1.24  }
{*< Autocapitalize each word typed.
                                        *
                                        * @since 1.24  }
{*< Autocapitalize the start of each
                                            * sentence.
                                            *
                                            * @since 1.24  }
{*< Autocapitalize all letters.
                                      *
                                      * @since 1.24  }
type
  PEfl_Input_Text_Capitalize_Type = ^TEfl_Input_Text_Capitalize_Type;
  TEfl_Input_Text_Capitalize_Type =  Longint;
  Const
    EFL_INPUT_TEXT_CAPITALIZE_TYPE_NONE = 0;
    EFL_INPUT_TEXT_CAPITALIZE_TYPE_WORD = 1;
    EFL_INPUT_TEXT_CAPITALIZE_TYPE_SENTENCE = 2;
    EFL_INPUT_TEXT_CAPITALIZE_TYPE_ALL = 3;
;
{* "Return" Key types on the input panel (virtual keyboard).
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Panel_Return_Key_Type
  }
{*< Default.
                                                     *
                                                     * @since 1.24  }
{*< Done.
                                              *
                                              * @since 1.24  }
{*< Go.
                                            *
                                            * @since 1.24  }
{*< Join.
                                              *
                                              * @since 1.24  }
{*< Login.
                                               *
                                               * @since 1.24  }
{*< Next.
                                              *
                                              * @since 1.24  }
{*< Search string or magnifier
                                                * icon.
                                                *
                                                * @since 1.24  }
{*< Send.
                                              *
                                              * @since 1.24  }
{*< Sign-in.
                                               *
                                               * @since 1.24  }
type
  PEfl_Input_Text_Panel_Return_Key_Type = ^TEfl_Input_Text_Panel_Return_Key_Type;
  TEfl_Input_Text_Panel_Return_Key_Type =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_DONE = 1;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_GO = 2;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_SEND = 7;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;
;
{* "Return" Key state on the input panel (virtual keyboard).
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Panel_Return_Key_State
  }
{*< The return key on input
                                                   * panel is disabled when the
                                                   * entry has no text, if
                                                   * entry has text, return key
                                                   * is enabled.
                                                   *
                                                   * @since 1.24  }
{*< The return key on input
                                                  * panel is enabled.
                                                  *
                                                  * @since 1.24  }
{*< The return key on input
                                                  * panel is disabled.
                                                  *
                                                  * @since 1.24  }
type
  PEfl_Input_Text_Panel_Return_Key_State = ^TEfl_Input_Text_Panel_Return_Key_State;
  TEfl_Input_Text_Panel_Return_Key_State =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_STATE_AUTO = 0;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_STATE_ENABLED = 1;
    EFL_INPUT_TEXT_PANEL_RETURN_KEY_STATE_DISABLED = 2;
;
{* Enumeration that defines the types of Input Hints.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Content_Type
  }
{*< No active hints.
                                         *
                                         * @since 1.24  }
{ 1 >> 0  }{*< Suggest word auto completion.
                                                               *
                                                               * @since 1.24  }
{ 1 >> 1  }{*< Typed text should not be stored.
                                                                *
                                                                * @since 1.24  }
{*< Autofill hint for a credit card
                                                                           * expiration date.
                                                                           *
                                                                           * @since 1.24  }
{*< Autofill hint for a credit card
                                                                          * expiration day.
                                                                          *
                                                                          * @since 1.24  }
{*< Autofill hint for a credit card
                                                                            * expiration month.
                                                                            *
                                                                            * @since 1.24  }
{*< Autofill hint for a credit card
                                                                            * expiration year.
                                                                            *
                                                                            * @since 1.24  }
{*< Autofill hint for a credit card
                                                                   * number.
                                                                   *
                                                                   * @since 1.24  }
{*< Autofill hint for an email address.
                                                              *
                                                              * @since 1.24  }
{*< Autofill hint for a
                                                     * user's real name.
                                                     *
                                                     * @since 1.24  }
{*< Autofill hint for a
                                                      * phone number.
                                                      *
                                                      * @since 1.24  }
{*< Autofill hint for a postal address.
                                                               *
                                                               * @since 1.24  }
{*< Autofill hint
                                                            * for a postal
                                                            * code.
                                                            *
                                                            * @since 1.24  }
{*< Autofill hint for a user's
                                                  * ID.
                                                  *
                                                  * @since 1.24  }
type
  PEfl_Input_Text_Content_Type = ^TEfl_Input_Text_Content_Type;
  TEfl_Input_Text_Content_Type =  Longint;
  Const
    EFL_INPUT_TEXT_CONTENT_TYPE_NONE = 0;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTO_COMPLETE = 1;
    EFL_INPUT_TEXT_CONTENT_TYPE_SENSITIVE_DATA = 2;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_DATE = 256;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_DAY = 512;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_MONTH = 768;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_YEAR = 1024;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_NUMBER = 1280;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_EMAIL_ADDRESS = 1536;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_NAME = 1792;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_PHONE = 2048;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_POSTAL_ADDRESS = 2304;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_POSTAL_CODE = 2560;
    EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_ID = 2816;
;
{$ifdef EFL_BETA_API_SUPPORT}
{* Enumeration for defining the types of @ref Efl_Input_Text_Panel_Layout_Type
 * for normal variation.
 *
 * @ingroup Efl_Input_Text_Panel_Layout_Normal_Variation_Type
  }
{*< The plain normal layout.  }
{*< Filename layout. Symbols such as
                                                                * '/' should be disabled.  }
{*< The name of a person,
                                                                 * @ref efl_input_text_autocapitalization_get
                                                                 * will be set to
                                                                 * @ref EFL_INPUT_TEXT_CAPITALIZE_TYPE_WORD.
                                                                  }
type
  PEfl_Input_Text_Panel_Layout_Normal_Variation_Type = ^TEfl_Input_Text_Panel_Layout_Normal_Variation_Type;
  TEfl_Input_Text_Panel_Layout_Normal_Variation_Type =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_LAYOUT_NORMAL_VARIATION_TYPE_NORMAL = 0;
    EFL_INPUT_TEXT_PANEL_LAYOUT_NORMAL_VARIATION_TYPE_FILE_NAME = 1;
    EFL_INPUT_TEXT_PANEL_LAYOUT_NORMAL_VARIATION_TYPE_PERSON_NAME = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Enumeration for defining the types of @ref Efl_Input_Text_Panel_Layout_Type
 * for normal variation.
 *
 * @ingroup Efl_Input_Text_Panel_Layout_Numberonly_Variation_Type
  }
{*< The plain normal number layout.  }
{*< The number layout to allow a
                                                                 * positive or negative sign at the
                                                                 * start.  }
{*< The number layout to allow decimal
                                                                  * point to provide fractional value.
                                                                   }
{*< The number layout to allow decimal
                                                                            * point and negative sign.  }
type
  PEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type = ^TEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type;
  TEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_NORMAL = 0;
    EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_SIGNED = 1;
    EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_DECIMAL = 2;
    EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_SIGNED_AND_DECIMAL = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Enumeration for defining the types of @ref Efl_Input_Text_Panel_Layout_Type
 * for normal variation.
 *
 * @ingroup Efl_Input_Text_Panel_Layout_Password_Variation_Type
  }
{*< The normal password layout.  }
{*< The password layout to allow only
                                                                   * number.  }
type
  PEfl_Input_Text_Panel_Layout_Password_Variation_Type = ^TEfl_Input_Text_Panel_Layout_Password_Variation_Type;
  TEfl_Input_Text_Panel_Layout_Password_Variation_Type =  Longint;
  Const
    EFL_INPUT_TEXT_PANEL_LAYOUT_PASSWORD_VARIATION_TYPE_NORMAL = 0;
    EFL_INPUT_TEXT_PANEL_LAYOUT_PASSWORD_VARIATION_TYPE_NUMBER_ONLY = 1;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{* All the functionality relating to input hints/
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }

{ was #define dname def_expr }
function EFL_INPUT_TEXT_ENTITY_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_text_entity_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Set/Get the attribute to show the input panel in case of only a
 * user's explicit Mouse Up event. It doesn't request to show the input panel
 * even though it has focus.
 *
 * @param[in] obj The object.
 * @param[in] ondemand If @c true, the input panel will be shown in case of
 * only Mouse up event. (Focus event will be ignored.)
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_show_on_demand_set(obj:PEo; ondemand:TEina_Bool);cdecl;external;
{*
 * @brief Set/Get the attribute to show the input panel in case of only a
 * user's explicit Mouse Up event. It doesn't request to show the input panel
 * even though it has focus.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the input panel will be shown in case of only Mouse up
 * event. (Focus event will be ignored.)
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_show_on_demand_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The language mode of the input panel. This API can be used if you
 * want to show the alphabet keyboard mode.
 *
 * @param[in] obj The object.
 * @param[in] lang Language to be set to the input panel.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_language_set(obj:PEo; lang:TEfl_Input_Text_Panel_Language_Type);cdecl;external;
{*
 * @brief The language mode of the input panel. This API can be used if you
 * want to show the alphabet keyboard mode.
 *
 * @param[in] obj The object.
 *
 * @return Language to be set to the input panel.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_language_get(obj:PEo):TEfl_Input_Text_Panel_Language_Type;cdecl;external;
{*
 * @brief The input panel layout variation of the entry, this can be
 * @ref Efl_Input_Text_Panel_Layout_Normal_Variation_Type ,
 * @ref Efl_Input_Text_Panel_Layout_Numberonly_Variation_Type or
 * @ref Efl_Input_Text_Panel_Layout_Password_Variation_Type.
 *
 * @param[in] obj The object.
 * @param[in] variation Layout variation type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_layout_variation_set(obj:PEo; variation:longint);cdecl;external;
{*
 * @brief The input panel layout variation of the entry, this can be
 * @ref Efl_Input_Text_Panel_Layout_Normal_Variation_Type ,
 * @ref Efl_Input_Text_Panel_Layout_Numberonly_Variation_Type or
 * @ref Efl_Input_Text_Panel_Layout_Password_Variation_Type.
 *
 * @param[in] obj The object.
 *
 * @return Layout variation type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_layout_variation_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The autocapitalization type on the immodule.
 *
 * @param[in] obj The object.
 * @param[in] autocapital_type The type of autocapitalization.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_autocapitalization_set(obj:PEo; autocapital_type:TEfl_Input_Text_Capitalize_Type);cdecl;external;
{*
 * @brief The autocapitalization type on the immodule.
 *
 * @param[in] obj The object.
 *
 * @return The type of autocapitalization.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_autocapitalization_get(obj:PEo):TEfl_Input_Text_Capitalize_Type;cdecl;external;
{*
 * @brief Whether the entry should allow predictive text.
 *
 * @param[in] obj The object.
 * @param[in] prediction Whether the entry should allow predictive text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_predictable_set(obj:PEo; prediction:TEina_Bool);cdecl;external;
{*
 * @brief Whether the entry should allow predictive text.
 *
 * @param[in] obj The object.
 *
 * @return Whether the entry should allow predictive text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_predictable_get(obj:PEo):TEina_Bool;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The input hint which allows input methods to fine-tune their
 * behavior.
 *
 * @param[in] obj The object.
 * @param[in] hints Input hint.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_content_type_set(obj:PEo; hints:TEfl_Input_Text_Content_Type);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The input hint which allows input methods to fine-tune their
 * behavior.
 *
 * @param[in] obj The object.
 *
 * @return Input hint.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)

function efl_input_text_input_content_type_get(obj:PEo):TEfl_Input_Text_Content_Type;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief The input panel layout of the entry.
 *
 * @param[in] obj The object.
 * @param[in] layout Layout type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }

procedure efl_input_text_input_panel_layout_set(obj:PEo; layout:TEfl_Input_Text_Panel_Layout_Type);cdecl;external;
{*
 * @brief The input panel layout of the entry.
 *
 * @param[in] obj The object.
 *
 * @return Layout type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_layout_get(obj:PEo):TEfl_Input_Text_Panel_Layout_Type;cdecl;external;
{*
 * @brief The "return" key type. This type is used to set string or icon on the
 * "return" key of the input panel. An input panel displays the string or icon
 * associated with this type.
 *
 * @param[in] obj The object.
 * @param[in] return_key_type The type of "return" key on the input panel.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_return_key_type_set(obj:PEo; return_key_type:TEfl_Input_Text_Panel_Return_Key_Type);cdecl;external;
{*
 * @brief The "return" key type. This type is used to set string or icon on the
 * "return" key of the input panel. An input panel displays the string or icon
 * associated with this type.
 *
 * @param[in] obj The object.
 *
 * @return The type of "return" key on the input panel.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_return_key_type_get(obj:PEo):TEfl_Input_Text_Panel_Return_Key_Type;cdecl;external;
{*
 * @brief The attribute to show the input panel automatically.
 *
 * @param[in] obj The object.
 * @param[in] enabled If @c true, the input panel is appeared when entry is
 * clicked or has a focus.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_autoshow_set(obj:PEo; enabled:TEina_Bool);cdecl;external;
{*
 * @brief The attribute to show the input panel automatically.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the input panel is appeared when entry is clicked or has
 * a focus.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_autoshow_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief State for the return key on the input panel see
 * @ref Efl_Input_Text_Panel_Return_Key_State.
 *
 * @param[in] obj The object.
 * @param[in] state Enable state for return key, see
 * @ref Efl_Input_Text_Panel_Return_Key_State.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_return_key_state_set(obj:PEo; state:TEfl_Input_Text_Panel_Return_Key_State);cdecl;external;
{*
 * @brief State for the return key on the input panel see
 * @ref Efl_Input_Text_Panel_Return_Key_State.
 *
 * @param[in] obj The object.
 *
 * @return Enable state for return key, see
 * @ref Efl_Input_Text_Panel_Return_Key_State.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_return_key_state_get(obj:PEo):TEfl_Input_Text_Panel_Return_Key_State;cdecl;external;
{*
 * @brief Show the input panel (virtual keyboard) based on the input panel
 * property of entry such as layout, autocapital types and so on.
 *
 * Note that input panel is shown or hidden automatically according to the
 * focus state of entry widget. This API can be used in the case of manually
 * controlling by using @ref efl_input_text_input_panel_autoshow_set(en,
 * @c false).
 *
 * @param[in] obj The object.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_show(obj:PEo);cdecl;external;
{* Hide the input panel (virtual keyboard). Note that input panel is shown or
 * hidden automatically according to the focus state of entry widget. This API
 * can be used in the case of manually controlling by using
 * @ref efl_input_text_input_panel_autoshow_set(en, @c false).
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_hide(obj:PEo);cdecl;external;
{*
 * @brief Set/Get the input panel-specific data to deliver to the input panel.
 *
 * This API is used by applications to deliver specific data to the input
 * panel. The data format MUST be negotiated by both application and the input
 * panel. The size and format of data are defined by the input panel.
 *
 * @param[in] obj The object.
 * @param[in] value The specific data to be set/get to the input panel.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
procedure efl_input_text_input_panel_imdata_set(obj:PEo; value:TEina_Slice);cdecl;external;
{*
 * @brief Set/Get the input panel-specific data to deliver to the input panel.
 *
 * This API is used by applications to deliver specific data to the input
 * panel. The data format MUST be negotiated by both application and the input
 * panel. The size and format of data are defined by the input panel.
 *
 * @param[in] obj The object.
 *
 * @return The specific data to be set/get to the input panel.
 *
 * @since 1.24
 *
 * @ingroup Efl_Input_Text_Entity
  }
(* Const before type ignored *)
function efl_input_text_input_panel_imdata_get(obj:PEo):TEina_Slice;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_TEXT_ENTITY_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_INPUT_TEXT_ENTITY_INTERFACE:=efl_input_text_entity_interface_get;
  end;


end.
