unit Edje_Common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* All available cursor states
 *
 * @ingroup Edje
  }
{*< Main cursor state  }
{*< Selection begin cursor state  }
{*< Selection end cursor state  }
{*< Pre-edit start cursor state  }
{*< Pre-edit end cursor state  }
{*< User cursor state  }
{*< User extra cursor state  }
type
  PEdje_Cursor = ^TEdje_Cursor;
  TEdje_Cursor =  Longint;
  Const
    EDJE_CURSOR_MAIN = 0;
    EDJE_CURSOR_SELECTION_BEGIN = 1;
    EDJE_CURSOR_SELECTION_END = 2;
    EDJE_CURSOR_PREEDIT_START = 3;
    EDJE_CURSOR_PREEDIT_END = 4;
    EDJE_CURSOR_USER = 5;
    EDJE_CURSOR_USER_EXTRA = 6;
;
{* All Text auto capital mode type values
 *
 * @ingroup Edje_Text
  }
{*< None mode value  }
{*< Word mode value  }
{*< Sentence mode value  }
{*< All characters mode value  }
type
  PEdje_Text_Autocapital_Type = ^TEdje_Text_Autocapital_Type;
  TEdje_Text_Autocapital_Type =  Longint;
  Const
    EDJE_TEXT_AUTOCAPITAL_TYPE_NONE = 0;
    EDJE_TEXT_AUTOCAPITAL_TYPE_WORD = 1;
    EDJE_TEXT_AUTOCAPITAL_TYPE_SENTENCE = 2;
    EDJE_TEXT_AUTOCAPITAL_TYPE_ALLCHARACTER = 3;
;
{* Input hints
 *
 * @ingroup Edje
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
type
  PEdje_Input_Hints = ^TEdje_Input_Hints;
  TEdje_Input_Hints =  Longint;
  Const
    EDJE_INPUT_HINT_NONE = 0;
    EDJE_INPUT_HINT_AUTO_COMPLETE = 1;
    EDJE_INPUT_HINT_SENSITIVE_DATA = 2;
;
{* Input panel language
 *
 * @ingroup Edje_Input_Panel
  }
{*< Automatic
                                        *
                                        * @since 1.2  }
{*< Alphabet
                                  *
                                  * @since 1.2  }
type
  PEdje_Input_Panel_Lang = ^TEdje_Input_Panel_Lang;
  TEdje_Input_Panel_Lang =  Longint;
  Const
    EDJE_INPUT_PANEL_LANG_AUTOMATIC = 0;
    EDJE_INPUT_PANEL_LANG_ALPHABET = 1;
;
{* Input panel return key types
 *
 * @ingroup Edje_Input_Panel
  }
{*< Default
                                                 *
                                                 * @since 1.2  }
{*< Done
                                          *
                                          * @since 1.2  }
{*< Go
                                        *
                                        * @since 1.2  }
{*< Join
                                          *
                                          * @since 1.2  }
{*< Login
                                           *
                                           * @since 1.2  }
{*< Next
                                          *
                                          * @since 1.2  }
{*< Search or magnifier icon
                                            *
                                            * @since 1.2  }
{*< Send
                                          *
                                          * @since 1.2  }
{*< Sign-in
                                           *
                                           * @since 1.8  }
type
  PEdje_Input_Panel_Return_Key_Type = ^TEdje_Input_Panel_Return_Key_Type;
  TEdje_Input_Panel_Return_Key_Type =  Longint;
  Const
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7;
    EDJE_INPUT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;
;
{* Input panel layout
 *
 * @ingroup Edje_Input_Panel
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
{*< Hexadecimal layout
                                *
                                * @since 1.2  }
{*< Command-line terminal layout including
                                     * esc, alt, ctrl key, so on (no
                                     * auto-correct, no auto-capitalization)
                                     *
                                     * @since 1.2  }
{*< Like normal, but no auto-correct, no
                                     * auto-capitalization etc.
                                     *
                                     * @since 1.2  }
{*< Date and time layout
                                     *
                                     * @since 1.8  }
{*< Emoticon layout
                                     *
                                     * @since 1.10  }
{*< Voice layout, but if the IME does not
                                 * support voice layout, then normal layout
                                 * will be shown.
                                 *
                                 * @since 1.19  }
type
  PEdje_Input_Panel_Layout = ^TEdje_Input_Panel_Layout;
  TEdje_Input_Panel_Layout =  Longint;
  Const
    EDJE_INPUT_PANEL_LAYOUT_NORMAL = 0;
    EDJE_INPUT_PANEL_LAYOUT_NUMBER = 1;
    EDJE_INPUT_PANEL_LAYOUT_EMAIL = 2;
    EDJE_INPUT_PANEL_LAYOUT_URL = 3;
    EDJE_INPUT_PANEL_LAYOUT_PHONENUMBER = 4;
    EDJE_INPUT_PANEL_LAYOUT_IP = 5;
    EDJE_INPUT_PANEL_LAYOUT_MONTH = 6;
    EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY = 7;
    EDJE_INPUT_PANEL_LAYOUT_INVALID = 8;
    EDJE_INPUT_PANEL_LAYOUT_HEX = 9;
    EDJE_INPUT_PANEL_LAYOUT_TERMINAL = 10;
    EDJE_INPUT_PANEL_LAYOUT_PASSWORD = 11;
    EDJE_INPUT_PANEL_LAYOUT_DATETIME = 12;
    EDJE_INPUT_PANEL_LAYOUT_EMOTICON = 13;
    EDJE_INPUT_PANEL_LAYOUT_VOICE = 14;
;
{* Perspective info for maps inside edje objects
 *
 * @ingroup Edje
  }
type
{*
 * @internal
 * @ingroup Edje_General_Group
 *
 * @typedef Edje_Version
 * Type for edje version
 *
  }
{*< The major number of Edje version.  }
{*< The minor number of Edje version.  }
{*< The micro number of Edje version.  }
{*< The revision of Edje version.  }

  PEdje_Version = ^TEdje_Version;
  TEdje_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
{*
 * @internal
 * @ingroup Edje_General_Group
 *
 * Current Edje Version info
 *
  }
  var
    edje_version : PEdje_Version;cvar;external libedje;
{$ifndef _EDJE_OBJECT_EO_CLASS_TYPE}
{$define _EDJE_OBJECT_EO_CLASS_TYPE}
type
  PEdje_Object = ^TEdje_Object;
  TEdje_Object = TEo;
{$endif}
{*
 * @typedef Edje_Color_Class
 * Type for edje color class
  }
type
  PEdje_Color_Class = ^TEdje_Color_Class;
  TEdje_Color_Class = record
      name : Pchar;
      r : byte;
      g : byte;
      b : byte;
      a : byte;
      r2 : byte;
      g2 : byte;
      b2 : byte;
      a2 : byte;
      r3 : byte;
      g3 : byte;
      b3 : byte;
      a3 : byte;
      desc : PEina_Stringshare;
    end;

{*
 * @typedef Edje_Text_Class
 * Type for edje text class
 *
 * @since 1.17
  }
  PEdje_Text_Class = ^TEdje_Text_Class;
  TEdje_Text_Class = record
      name : Pchar;
      font : Pchar;
      size : TEvas_Font_Size;
    end;

{*
 * @typedef Edje_Size_Class
 * Type for edje size class
 *
 * @since 1.17
  }
  PEdje_Size_Class = ^TEdje_Size_Class;
  TEdje_Size_Class = record
      name : PEina_Stringshare;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      maxw : TEvas_Coord;
      maxh : TEvas_Coord;
    end;

{*
 * @defgroup Edje_Object_Communication_Interface_Message Edje Communication Interface: Message
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with messages.
 *
 * Edje has two communication interfaces between @b code and @b theme.
 * Signals and messages.
 *
 * Edje messages are one of the communication interfaces between
 * @b code and a given Edje object's @b theme. With messages, one can
 * communicate values like strings, float numbers and integer
 * numbers. Moreover, messages can be identified by integer
 * numbers. See #Edje_Message_Type for the full list of message types.
 *
 * @note Messages must be handled by scripts.
 *
 * @
  }
{*
 * @brief Processes all queued up edje messages.
 *
 * This function triggers the processing of messages addressed to any
 * (alive) edje objects.
 *
  }

procedure edje_message_signal_process;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Communication_Interface_Signal Edje Communication Interface: Signal
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with signals.
 *
 * Edje has two communication interfaces between @b code and @b theme.
 * Signals and messages.
 *
 * This group has functions that deal with signals. One can either
 * emit a signal from @b code to a @b theme or create handles for
 * the ones emitted from @b themes. Signals are identified by strings.
 *
 * @
  }
type

  TEfl_Signal_Cb = procedure (data:pointer; obj:PEvas_Object; emission:Pchar; source:Pchar);cdecl;
{*< Edje signal callback functions's prototype definition. @c data will have the auxiliary data pointer set at the time the callback registration. @c obj will be a pointer the Edje object where the signal comes from. @c emission will identify the exact signal's emission string and @c source the exact signal's source one.  }

  PEdje_Signal_Cb = ^TEdje_Signal_Cb;
  TEdje_Signal_Cb = TEfl_Signal_Cb;
{*
 * @brief Gets extra data passed to callbacks.
 *
 * @return The extra data for that callback.
 *
 * Some callbacks pass extra information. This function gives access to that
 * extra information. It's somehow like event_info in smart callbacks.
 *
 * @see edje_object_signal_callback_add() for more on Edje signals.
 * @since 1.1.0
  }

function edje_object_signal_callback_extra_data_get:pointer;cdecl;external libedje;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Gets seat data passed to callbacks.
 *
 * @return The seat data for that callback.
 *
 * When a callback is initiated by an input event from a seat, we try to
 * provide seat information with it.
 *
 * Signals fired as programmed responses to these signals will also try
 * to carry the seat data along.
 *
 * This returns an opaque pointer to the seat data.
 *
 * @see edje_object_signal_callback_add() for more on Edje signals.
 * @since 1.21
  }
function edje_object_signal_callback_seat_data_get:pointer;cdecl;external libedje;
{$endif}
{*
 * @
  }
{*
 * @defgroup Edje_Audio Edje Audio
 * @ingroup Edje
 *
 * @brief Functions to manipulate audio abilities in edje.
 *
 * @
  }
{*
 * Identifiers of Edje message types, which can be sent back and forth
 * code and a given Edje object's theme file/group.
 *
 * @see edje_audio_channel_mute_set()
 * @see edje_audio_channel_mute_get()
 *
 * @since 1.9
  }
{*< Standard audio effects  }
{*< Background audio sounds   }
{*< Music audio  }
{*< Foreground audio sounds  }
{*< Sounds related to the interface  }
{*< Sounds related to regular input  }
{*< Sounds for major alerts  }
{*< All audio channels (convenience)  }
type
  PEdje_Channel = ^TEdje_Channel;
  TEdje_Channel =  Longint;
  Const
    EDJE_CHANNEL_EFFECT = 0;
    EDJE_CHANNEL_BACKGROUND = 1;
    EDJE_CHANNEL_MUSIC = 2;
    EDJE_CHANNEL_FOREGROUND = 3;
    EDJE_CHANNEL_INTERFACE = 4;
    EDJE_CHANNEL_INPUT = 5;
    EDJE_CHANNEL_ALERT = 6;
    EDJE_CHANNEL_ALL = 7;
;
{*
 * @brief Sets the mute state of audio for the process as a whole.
 *
 * @param channel The channel to set the mute state of
 * @param mute The mute state
 *
 * This sets the mute (no output) state of audio for the given channel.
 *
 * @see edje_audio_channel_mute_get()
 *
 * @since 1.9
  }

procedure edje_audio_channel_mute_set(channel:TEdje_Channel; mute:TEina_Bool);cdecl;external libedje;
{*
 * @brief Gets the mute state of the given channel.
 *
 * @param channel The channel to get the mute state of
 * @return The mute state of the channel
 *
 * @see edje_audio_channel_mute_set()
 *
 * @since 1.9
  }
function edje_audio_channel_mute_get(channel:TEdje_Channel):TEina_Bool;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_General_Group Edje General
 * @ingroup Edje
 *
 * @brief This group discusses functions that have general purposes or affect Edje as a whole.
 *
 * Besides containing the initialize and shutdown functions of the library, which should
 * always be called when we are using Edje, this module contains some other utilities that
 * could be used in many contexts or should do their jobs independent of the context inside Edje.
 *
 * @
  }
{*
 * @brief Initializes the Edje library.
 *
 * @return The new init count. The initial value is zero.
 *
 * This function initializes the Edje library, making the proper calls
 * to internal initialization functions. It will also initialize its
 * @b dependencies, making calls to @c eina_init(), @c ecore_init(),
 * @c embryo_init() and @c eet_init(). So, there is no need to call
 * those functions again, in your code. To shutdown Edje there is the
 * function edje_shutdown().
 *
 * @see edje_shutdown()
 * @see eina_init()
 * @see ecore_init()
 * @see embryo_init()
 * @see eet_init()
 *
  }
function edje_init:longint;cdecl;external libedje;
{*
 * @brief Shuts down the Edje library.
 *
 * @return The number of times the library has been initialized
 *         without being shutdown.
 *
 * This function shuts down the Edje library. It will also call the
 * shutdown functions of its @b dependencies, which are @c
 * eina_shutdown(), @c ecore_shutdown(), @c embryo_shutdown() and @c
 * eet_shutdown(), so there is no need to call these functions again,
 * in your code.
 *
 * @see edje_init()
 * @see eina_shutdown()
 * @see ecore_shutdown()
 * @see embryo_shutdown()
 * @see eet_shutdown()
 *
  }
function edje_shutdown:longint;cdecl;external libedje;
{*
 * @brief Sets the edje append fontset.
 *
 * @param fonts The fontset to append.
 *
 * This function sets the edje append fontset.
 *
  }
procedure edje_fontset_append_set(fonts:Pchar);cdecl;external libedje;
{*
 * @brief Gets data from the file level data block of an edje mapped file.
 * @param f The mapped edje file
 * @param key The data key
 * @return The string value of the data, or @c NULL if no key is found.
 * Must be freed by the user when no longer needed.
 *
 * If an edje file test.edj is built from the following edc:
 *
 * data 
 *   item: "key1" "value1";
 *   item: "key2" "value2";
 * 
 * collections  ... 
 *
 * Then, edje_file_data_get("test.edj", "key1") will return "value1"
  }
function edje_mmap_data_get(f:PEina_File; key:Pchar):Pchar;cdecl;external libedje;
{*
 * @brief Gets data from the file level data block of an edje file.
 * @param file The path to the .edj file
 * @param key The data key
 * @return The string value of the data, or @c NULL if no key is found.
 * Must be freed by the user when no longer needed.
 *
 * If an edje file test.edj is built from the following edc:
 *
 * data 
 *   item: "key1" "value1";
 *   item: "key2" "value2";
 * 
 * collections  ... 
 *
 * Then, edje_file_data_get("test.edj", "key1") will return "value1"
 *
 * @see edje_mmap_data_get()
  }
function edje_file_data_get(file:Pchar; key:Pchar):Pchar;cdecl;external libedje;
{*
 * @brief Loads a new module in Edje.
 * @param module The name of the module that will be added to Edje.
 * @return @c EINA_TRUE if the module was successfully loaded. Otherwise, @c EINA_FALSE.
 *
 * Modules are used to add functionality to Edje.
 * So, when a module is loaded, its functionality should be available for use.
 *
  }
function edje_module_load(module:Pchar):TEina_Bool;cdecl;external libedje;
{*
 * @brief Retrieves all modules that can be loaded.
 * @return A list of all loadable modules.
 *
 * This function retrieves all modules that can be loaded by edje_module_load().
 *
 * @see edje_module_load().
 *
  }
function edje_available_modules_get:PEina_List;cdecl;external libedje;
{*
 * @brief Gets the edje append fontset.
 *
 * @return The edje append fontset.
 *
 * This function returns the edje append fontset set by
 * edje_fontset_append_set() function.
 *
 * @see edje_fontset_append_set().
 *
  }
function edje_fontset_append_get:Pchar;cdecl;external libedje;
{*
 * @brief Sets the file cache size.
 *
 * @param count The file cache size in edje file units. Default is 16.
 *
 * This function sets the file cache size. Edje keeps this cache in
 * order to prevent duplicates of edje file entries in memory. The
 * file cache size can be retrieved with edje_file_cache_get().
 *
 * @see edje_file_cache_get()
 * @see edje_file_cache_flush()
 *
  }
procedure edje_file_cache_set(count:longint);cdecl;external libedje;
{*
 * @brief Returns the file cache size.
 *
 * @return The file cache size in edje file units. Default is 16.
 *
 * This function returns the file cache size set by
 * edje_file_cache_set().
 *
 * @see edje_file_cache_set()
 * @see edje_file_cache_flush()
 *
  }
function edje_file_cache_get:longint;cdecl;external libedje;
{*
 * @brief Cleans the file cache.
 *
 * This function cleans the file cache entries, but keeps this cache's
 * size to the last value set.
 *
 * @see edje_file_cache_set()
 * @see edje_file_cache_get()
 *
  }
procedure edje_file_cache_flush;cdecl;external libedje;
{*
 * @brief Sets the collection cache size.
 *
 * @param count The collection cache size, in edje object units. Default is 16.
 *
 * This function sets the collection cache size. Edje keeps this cache
 * in order to prevent duplicates of edje collection,group,part
 * entries in memory. The collection cache size can be retrieved with
 * edje_collection_cache_get().
 *
 * @see edje_collection_cache_get()
 * @see edje_collection_cache_flush()
 *
  }
procedure edje_collection_cache_set(count:longint);cdecl;external libedje;
{*
 * @brief Returns the collection cache size.
 *
 * @return The collection cache size, in edje object units. Default is 16.
 *
 * This function returns the collection cache size set by
 * edje_collection_cache_set().
 *
 * @see edje_collection_cache_set()
 * @see edje_collection_cache_flush()
 *
  }
function edje_collection_cache_get:longint;cdecl;external libedje;
{*
 * @brief Cleans the collection cache.
 *
 * This function cleans the collection cache, but keeps this cache's
 * size to the last value set.
 *
 * @see edje_collection_cache_set()
 * @see edje_collection_cache_get()
 *
  }
procedure edje_collection_cache_flush;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_External_Group Edje External
 * @ingroup Edje
 *
 * @brief This group discusses functions of the external section of Edje.
 *
 * The programmer can create new types for parts, that will be called generically
 * EXTERNALS as they are not native of Edje. The developer must also create
 * plugins that will define the meaning of each extra properties carried by
 * these parts of type EXTERNAL.
 *
 * As long as there are new types properly registered with the plugins created,
 * the user can use the parts of type EXTERNAL as all the parts of native types.
 *
 * @
  }
{* The possible types the parameters of an EXTERNAL part can be.
 *
 * @ingroup Edje_External
  }
{*< Parameter value is an integer.  }
{*< Parameter value is a double.  }
{*< Parameter value is a string.  }
{*< Parameter value is boolean.  }
{*< Parameter value is one of a set of predefined string choices.  }
{*< Sentinel value to indicate last enum field during iteration  }
type
  PEdje_External_Param_Type = ^TEdje_External_Param_Type;
  TEdje_External_Param_Type =  Longint;
  Const
    EDJE_EXTERNAL_PARAM_TYPE_INT = 0;
    EDJE_EXTERNAL_PARAM_TYPE_DOUBLE = 1;
    EDJE_EXTERNAL_PARAM_TYPE_STRING = 2;
    EDJE_EXTERNAL_PARAM_TYPE_BOOL = 3;
    EDJE_EXTERNAL_PARAM_TYPE_CHOICE = 4;
    EDJE_EXTERNAL_PARAM_TYPE_MAX = 5;
;
{*
 * Flags that determine how a parameter may be accessed in different
 * circumstances.
  }
{*< Property is incapable of operations, this is used to catch bogus flags.  }
{*< Property can be read/get.  }
{*< Property can be written/set. This only enables edje_object_part_external_param_set() and Embryo scripts. To enable the parameter being set from state description whenever it changes state, use #EDJE_EXTERNAL_PARAM_FLAGS_STATE.  }
{*< Property can be set from state description.  }
{*< This property is only set once when the object is constructed using its value from "default" 0.0 state description. Setting this overrides #EDJE_EXTERNAL_PARAM_FLAGS_STATE.  }
{*< Convenience flag that sets property as GET, SET and STATE.  }
type
  PEdje_External_Param_Flags = ^TEdje_External_Param_Flags;
  TEdje_External_Param_Flags =  Longint;
  Const
    EDJE_EXTERNAL_PARAM_FLAGS_NONE = 0;
    EDJE_EXTERNAL_PARAM_FLAGS_GET = 1 shl 0;
    EDJE_EXTERNAL_PARAM_FLAGS_SET = 1 shl 1;
    EDJE_EXTERNAL_PARAM_FLAGS_STATE = 1 shl 2;
    EDJE_EXTERNAL_PARAM_FLAGS_CONSTRUCTOR = 1 shl 3;
    EDJE_EXTERNAL_PARAM_FLAGS_REGULAR = (EDJE_EXTERNAL_PARAM_FLAGS_GET or EDJE_EXTERNAL_PARAM_FLAGS_SET) or EDJE_EXTERNAL_PARAM_FLAGS_STATE;
;
{* Struct that holds parameters for parts of type EXTERNAL.
  }
{*< The name of the parameter.  }
{*< The type of the parameter. This defines
                                  * which of the next three variables holds the
                                  * value for it.  }
{*< Used by both integer and boolean  }
{*< Used by double  }
{*< Used by both string and choice  }
type
  PEdje_External_Param = ^TEdje_External_Param;
  TEdje_External_Param = record
      name : Pchar;
      _type : TEdje_External_Param_Type;
      i : longint;
      d : Tdouble;
      s : Pchar;
    end;
{*
 * @brief Converts type identifier to string nicer representation.
 *
 * This may be used to debug or other informational purposes.
 *
 * @param type the identifier to convert.
 * @return the string with the string representation, or @c "(unknown)".
  }

function edje_external_param_type_str(_type:TEdje_External_Param_Type):Pchar;cdecl;external libedje;
{*
 * Helper macro to indicate an EXTERNAL's integer parameter is undefined.
  }
const
  EDJE_EXTERNAL_INT_UNSET = INT_MAX;  
{*
 * Helper macro to indicate an EXTERNAL's double parameter is undefined.
  }
  EDJE_EXTERNAL_DOUBLE_UNSET = DBL_MAX;  
{*
 * Struct holding information about an EXTERNAL part's parameters.
 *
 * When creating types to use with EXTERNAL parts, an array of this type is
 * used to describe the different parameters the object uses.
 *
 * This struct holds the name, type and flags that define how and when the
 * parameter is used, as well as information specific to each type, like the
 * maximum or minimum value, that can be used by editors to restrict the
 * range of values to set for each parameter.
  }
type
{*
 * Struct holding information about an EXTERNAL part's parameters.
 *
 * When creating types to use with EXTERNAL parts, an array of this type is
 * used to describe the different parameters the object uses.
 *
 * This struct holds the name, type and flags that define how and when the
 * parameter is used, as well as information specific to each type, like the
 * maximum or minimum value, that can be used by editors to restrict the
 * range of values to set for each parameter.
  }
{*< Name of the parameter.  }
{*< Type of the parameter.  }
{*< Flags indicating how this parameter is
                                      used.  }
{*< Default value for the parameter.  }
{*< Minimum value it can have.  }
{*< Maximum value it can have.  }
{*< Values will be a multiple of this.  }
{*< Info about integer type parameters. Use #EDJE_EXTERNAL_INT_UNSET
             on any of them to indicate they are not defined. }
{*< Default value for the parameter.  }
{*< Minimum value it can have.  }
{*< Maximum value it can have.  }
{*< Values will be a multiple of this.  }
{*< Info about double type parameters. Use
#EDJE_EXTERNAL_DOUBLE_UNSET on any of them to indicate they are not defined. }
{*< Default value.  }
{*< Not implemented.  }
{*< Not implemented  }
{*< Info about string type parameters. NULL indicates undefined.  }
{*< Default value.  }
{*< String shown by editors to indicate the false state.  }
{*< String shown by editors to indicate the true state.  }
{*< Info about boolean type parameters. }
{*< Default value.  }
{ Array of strings, each represents a
                                         valid value for this parameter. The
                                         last element of the array must be
                                         NULL.  }
{* return malloc() memory with the default choice, should be used if def is NULL. First parameter is Edje_External_Type::data  }
{* NULL terminated array of strings, memory is dynamically allocated and should be freed with free() for array and each element. First parameter is Edje_External_Type::data  }
{*< Info about choice type parameters.  }
  PEdje_External_Param_Info = ^TEdje_External_Param_Info;
  TEdje_External_Param_Info = record
      name : Pchar;
      _type : TEdje_External_Param_Type;
      flags : TEdje_External_Param_Flags;
      info : record
          case longint of
            0 : ( i : record
                def : longint;
                min : longint;
                max : longint;
                step : longint;
              end );
            1 : ( d : record
                def : Tdouble;
                min : Tdouble;
                max : Tdouble;
                step : Tdouble;
              end );
            2 : ( s : record
                def : Pchar;
                accept_fmt : Pchar;
                deny_fmt : Pchar;
              end );
            3 : ( b : record
                def : longint;
                false_str : Pchar;
                true_str : Pchar;
              end );
            4 : ( c : record
                def : Pchar;
                choices : ^Pchar;
                def_get : function (data:pointer; info:PEdje_External_Param_Info):Pchar;cdecl;
                query : function (data:pointer; info:PEdje_External_Param_Info):PPchar;cdecl;
              end );
          end;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function EDJE_EXTERNAL_PARAM_INFO_INT_FULL(name,def,min,max,step : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FULL(name,def,min,max,step : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_FULL(name,def,accept,deny : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_FULL(name,def,false_str,true_str : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_CHOICE_FULL(name,def,choices : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_CHOICE_DYNAMIC_FULL(name,def_get,query : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT(name,def : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT(name,def : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT(name,def : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT(name,def : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT_FLAGS(name,def,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT_FLAGS(name,def,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT_FLAGS(name,def,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT_FLAGS(name,def,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT(name : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE(name : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING(name : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL(name : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_FLAGS(name,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FLAGS(name,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_FLAGS(name,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_FLAGS(name,flags : longint) : longint;

{#define EDJE_EXTERNAL_PARAM_INFO_SENTINEL NULL, 0, 0, .s = NULL, NULL, NULL }
{* Version of the EDJE External ABI used by this library . }
const
  EDJE_EXTERNAL_TYPE_ABI_VERSION = 3;  
{*
 * @struct _Edje_External_Type
 *
 * @brief Information about an external type to be used.
 *
 * This structure provides information on how to display and modify a
 * third party Evas_Object in Edje.
 *
 * Some function pointers are not really used by Edje, but provide
 * means for Edje users to better interact with such objects. For
 * instance, an editor may use label_get() and icon_get() to list all
 * registered external types.
 *
 * @note The function pointers provided in this structure must check
 *       for errors and invalid or out-of-range values as for
 *       performance reasons Edje will not enforce hints provided as
 *       #Edje_External_Param_Info in the member parameters_info.
  }
{*< always use:
                              *  - #EDJE_EXTERNAL_TYPE_ABI_VERSION to declare.
                              *  - edje_external_type_abi_version_get() to check.
                               }
{*< Name of the module that holds these definitions,
                           as used in the externals  block of a theme
                           definition.  }
{*< Canonical name of the module, for displaying
                                in edition programs, for example.  }
{*< Creates the object to be used by Edje as the part. @p part_name is the name of the part that holds the object and can be used to forward callbacks from the object as signals from Edje. @p params is the list of #Edje_External_Param, not parsed, from the default state of the part. Parameters of type #EDJE_EXTERNAL_PARAM_FLAGS_CONSTRUCTOR should be set on
 the object here.  }
{*< Called upon state changes, including the initial "default" 0.0 state. Parameters are the value returned by params_parse(). The @p pos parameter is a value between 0.0 and 1.0 indicating the position in time within the state transition.  }
{*< Feed a signal emitted with emission originally set as part_name:signal to this object (without the "part_name:" prefix)  }
{*< Dynamically change a parameter of this external, called by scripts and user code. Returns @c EINA_TRUE on success  }
{*< Dynamically fetch a parameter of this external, called by scripts and user code. Returns @c EINA_TRUE on success. (Must check parameter name and type!)  }
{*< Dynamically fetch a sub object of this external, called by scripts and user code. Returns @c Evas_Object * on success. (Must check parameter name and type!)  }
{*< Parses the list of parameters, converting into a friendly representation. Used with state_set()  }
{*< Free parameters parsed with params_parse()  }
{ The following callbacks aren't used by Edje itself, but by UI design
     tools instead  }
{*< Get a label to use to identify this EXTERNAL. (For editors)  }
{*< Get a user friendly description of this EXTERNAL. (For editors)  }
{*< Get an icon to use to identify this EXTERNAL. (For editors)  }
{*< Get a preview of the EXTERNAL object in use. (For editors)  }
{*< called to translate parameters_info name properties for use in user interfaces that support internationalization (i18n) (For editors)  }
{*< An array of #Edje_External_Param_Info describing the different parameters this EXTERNAL may have. The last element in the array must be #EDJE_EXTERNAL_PARAM_INFO_SENTINEL.  }
{*< Private user data that will be passed to all of the class functions.  }
type
  PEdje_External_Type = ^TEdje_External_Type;
  TEdje_External_Type = record
      abi_version : dword;
      module : Pchar;
      module_name : Pchar;
      add : function (data:pointer; evas:PEvas; parent:PEvas_Object; params:PEina_List; part_name:Pchar):PEvas_Object;cdecl;
      state_set : procedure (data:pointer; obj:PEvas_Object; from_params:pointer; to_params:pointer; pos:single);cdecl;
      signal_emit : procedure (data:pointer; obj:PEvas_Object; emission:Pchar; source:Pchar);cdecl;
      param_set : function (data:pointer; obj:PEvas_Object; param:PEdje_External_Param):TEina_Bool;cdecl;
      param_get : function (data:pointer; obj:PEvas_Object; param:PEdje_External_Param):TEina_Bool;cdecl;
      content_get : function (data:pointer; obj:PEvas_Object; content:Pchar):PEvas_Object;cdecl;
      params_parse : function (data:pointer; obj:PEvas_Object; params:PEina_List):pointer;cdecl;
      params_free : procedure (params:pointer);cdecl;
      label_get : function (data:pointer):Pchar;cdecl;
      description_get : function (data:pointer):Pchar;cdecl;
      icon_add : function (data:pointer; e:PEvas):PEvas_Object;cdecl;
      preview_add : function (data:pointer; e:PEvas):PEvas_Object;cdecl;
      translate : function (data:pointer; orig:Pchar):Pchar;cdecl;
      parameters_info : PEdje_External_Param_Info;
      data : pointer;
    end;

{* Alias for _Edje_External_Type  }
{*
 * Convenience struct used to mass-register types of EXTERNAL objects.
 *
 * Used with edje_external_type_array_register().
  }
{*< The name of the type to register.  }
{*< The type definition.  }
  PEdje_External_Type_Info = ^TEdje_External_Type_Info;
  TEdje_External_Type_Info = record
      name : Pchar;
      info : PEdje_External_Type;
    end;

{* Alias for _Edje_External_Type_Info  }
{*
 * @
  }
{*
 * @defgroup Edje_External_Plugin_Development_Group Edje Development of External Plugins
 * @ingroup Edje_External_Group
 *
 * @brief Functions to register, unregister EXTERNAL types and develop the plugins.
 *
 * This group discusses functions useful for the development of new plugins.
 * These functions deal with the newly EXTERNAL types by registering, unregistering and manipulating them.
 *
 *
 * @
  }
{*
 * @brief Registers a type to be used by EXTERNAL parts.
 *
 * Parts of type EXTERNAL will call user defined functions
 * to create and manipulate the object that's allocated in that part. This is
 * done by expecifying in the @c source property of the part the name of the
 * external to use, which must be one registered with this function.
 *
 * @param type_name Name to register and be known by edje's "source:"
 *        parameter of "type: EXTERNAL" parts.
 * @param type_info Meta-information describing how to interact with it.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure (like
 *         type already registered).
 *
 * @see edje_external_type_array_register()
  }

function edje_external_type_register(type_name:Pchar; type_info:PEdje_External_Type):TEina_Bool;cdecl;external libedje;
{*
 * @brief Unregisters a previously registered EXTERNAL type.
 *
 * @param type_name name to unregister. It should have been registered with
 *        edje_external_type_register() before.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure (like
 *         type_name did not exist).
 *
 * @see edje_external_type_array_unregister()
  }
function edje_external_type_unregister(type_name:Pchar):TEina_Bool;cdecl;external libedje;
{*
 * @brief Registers a batch of types and their information.
 *
 * When several types will be registered it is recommended to use this
 * function instead of several calls to edje_external_type_register(), as it
 * is faster.
 *
 * @note The contents of the array will be referenced directly for as long as
 * the type remains registered, so both the @c name and @c info in the
 * @p array must be kept alive during all this period (usually, the entire
 * program lifetime). The most common case would be to keep the array as a
 * @c static @c const type anyway.
 *
 * @param array @c NULL terminated array with type name and
 *        information. Note that type name or information are
 *        referenced directly, so they must be kept alive after
 *        this function returns!
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure (like
 *         type already registered).
 *
 * @see edje_external_type_register()
  }
procedure edje_external_type_array_register(array:PEdje_External_Type_Info);cdecl;external libedje;
{*
 * @brief Unregisters a batch of given external type previously registered.
 *
 * @param array @c NULL terminated array, should be the same as the
 *        one used to register with edje_external_type_array_register()
 *
 * @see edje_external_type_unregister()
  }
procedure edje_external_type_array_unregister(array:PEdje_External_Type_Info);cdecl;external libedje;
{*
 * @brief Returns the current ABI version for Edje_External_Type structure.
 *
 * Always check this number before accessing Edje_External_Type in
 * your own software. If the number is not the same, your software may
 * access invalid memory and crash, or just get garbage values.
 *
 * @warning @b NEVER, EVER define your own Edje_External_Type using the
 *          return of this function as it will change as Edje library
 *          (libedje.so) changes, but your type definition will
 *          not. Instead, use #EDJE_EXTERNAL_TYPE_ABI_VERSION.
 *
 * Summary:
 *   - use edje_external_type_abi_version_get() to check.
 *   - use #EDJE_EXTERNAL_TYPE_ABI_VERSION to define/declare.
 *
 * @return The external ABI version the Edje library was compiled with. That
 * is, the value #EDJE_EXTERNAL_TYPE_ABI_VERSION had at that moment.
  }
function edje_external_type_abi_version_get:dword;cdecl;external libedje;
{*
 *
 * @return An iterator of all the registered EXTERNAL types.
 *
 * Each item in the iterator is an @c Eina_Hash_Tuple which has the type
 * of the external in the @c key and #Edje_External_Type as @c data.
 *
 * @code
 * const Eina_Hash_Tuple *tuple;
 * Eina_Iterator *itr;
 * const Eina_List *l, *modules;
 * const char *s;
 *
 * modules = edje_available_modules_get();
 * EINA_LIST_FOREACH(modules, l, s)
 *   
 *      if (!edje_module_load(s))
 *        printf("Error loading edje module: %s\n", s);
 *   
 *
 * itr = edje_external_iterator_get();
 * EINA_ITERATOR_FOREACH(itr, tuple)
 *   
 *      const char *name = tuple->key;
 *      const Edje_External_Type *type = tuple->data;
 *
 *      if ((!type) ||
 *          (type->abi_version != edje_external_type_abi_version_get()))
 *        
 *           printf("Error: invalid type %p (abi: %d, expected: %d)\n",
 *                   type, type ? type->abi_version : 0,
 *                   edje_external_type_abi_version_get());
 *           continue;
 *        
 *
 *      printf("%s: %s (%s) label='%s' desc='%s'\n",
 *             name, type->module, type->module_name,
 *             type->label_get ? type->label_get(type->data) : "",
 *             type->description_get ? type->description_get(type->data) : "");
 *   
 *
 * @endcode
  }
function edje_external_iterator_get:PEina_Iterator;cdecl;external libedje;
{*
 * @brief Convenience function to find a specific parameter in a list of them.
 *
 * @param params The list of parameters for the external
 * @param key The parameter to look for
 *
 * @return The matching #Edje_External_Param or NULL if it's not found.
  }
function edje_external_param_find(params:PEina_List; key:Pchar):PEdje_External_Param;cdecl;external libedje;
{*
 * @brief Gets the value of the given parameter of integer type.
 *
 * Look for the @p key parameter in the @p params list and return its value in
 * @p ret. If the parameter is found and is of type
 * #EDJE_EXTERNAL_PARAM_TYPE_INT, its value will be stored in the int pointed
 * by @p ret, returning EINA_TRUE. In any other case, the function returns
 * EINA_FALSE.
 *
 * @param params List of parameters where to look
 * @param key Name of the parameter to fetch
 * @param ret Int pointer where to store the value, must not be NULL.
 *
 * @return @c EINA_TRUE if the parameter was found and is of integer type,
 * @c EINA_FALSE otherwise.
  }
function edje_external_param_int_get(params:PEina_List; key:Pchar; ret:Plongint):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the value of the given parameter of double type.
 *
 * Look for the @p key parameter in the @p params list and return its value in
 * @p ret. If the parameter is found and is of type
 * #EDJE_EXTERNAL_PARAM_TYPE_DOUBLE, its value will be stored in the double
 * pointed by @p ret, returning EINA_TRUE. In any other case, the function
 * returns EINA_FALSE.
 *
 * @param params List of parameters where to look
 * @param key Name of the parameter to fetch
 * @param ret Double pointer where to store the value, must not be NULL.
 *
 * @return @c EINA_TRUE if the parameter was found and is of double type,
 * @c EINA_FALSE otherwise.
  }
function edje_external_param_double_get(params:PEina_List; key:Pchar; ret:Pdouble):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the value of the given parameter of string type.
 *
 * Look for the @p key parameter in the @p params list and return its value in
 * @p ret. If the parameter is found and is of type
 * #EDJE_EXTERNAL_PARAM_TYPE_STRING, its value will be stored in the pointer
 * pointed by @p ret, returning EINA_TRUE. In any other case, the function
 * returns EINA_FALSE.
 *
 * The string stored in @p ret must not be freed or modified.
 *
 * @param params List of parameters where to look
 * @param key Name of the parameter to fetch
 * @param ret String pointer where to store the value, must not be NULL.
 *
 * @return @c EINA_TRUE if the parameter was found and is of string type,
 * @c EINA_FALSE otherwise.
  }
function edje_external_param_string_get(params:PEina_List; key:Pchar; ret:PPchar):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the value of the given parameter of boolean type.
 *
 * Look for the @p key parameter in the @p params list and return its value in
 * @p ret. If the parameter is found and is of type
 * #EDJE_EXTERNAL_PARAM_TYPE_BOOL, its value will be stored in the Eina_Bool
 * pointed by @p ret, returning EINA_TRUE. In any other case, the function
 * returns EINA_FALSE.
 *
 * @param params List of parameters where to look
 * @param key Name of the parameter to fetch
 * @param ret Eina_Bool pointer where to store the value, must not be NULL.
 *
 * @return @c EINA_TRUE if the parameter was found and is of boolean type,
 * @c EINA_FALSE otherwise.
  }
function edje_external_param_bool_get(params:PEina_List; key:Pchar; ret:PEina_Bool):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the value of the given parameter of choice type.
 *
 * Look for the @p key parameter in the @p params list and return its value in
 * @p ret. If the parameter is found and is of type
 * #EDJE_EXTERNAL_PARAM_TYPE_CHOICE, its value will be stored in the string
 * pointed by @p ret, returning EINA_TRUE. In any other case, the function
 * returns EINA_FALSE.
 *
 * The string stored in @p ret must not be freed or modified.
 *
 * @param params List of parameters where to look
 * @param key Name of the parameter to fetch
 * @param ret String pointer where to store the value, must not be NULL.
 *
 * @return EINA_TRUE if the parameter was found and is of integer type,
 * EINA_FALSE otherwise.
  }
function edje_external_param_choice_get(params:PEina_List; key:Pchar; ret:PPchar):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the array of parameters information about a type given its name.
 *
 * @note the type names and other strings are static, that means they are
 *       @b NOT translated. One must use
 *       Edje_External_Type::translate() to translate those.
 *
 * @param type_name Edje external type name
 *
 * @return the NULL terminated array, or @c NULL if type is unknown or
 *         it does not have any parameter information.
 *
 * @see edje_external_type_get()
  }
function edje_external_param_info_get(type_name:Pchar):PEdje_External_Param_Info;cdecl;external libedje;
{*
 * @brief Gets the #Edje_External_Type that defines an EXTERNAL type registered with
 * the name @p type_name.
  }
function edje_external_type_get(type_name:Pchar):PEdje_External_Type;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Group Edje Object
 * @ingroup Edje
 *
 * @brief This group discusses functions that deal with Edje layouts and its components
 *
 * An important thing to know about this group is that there is no
 * Edje_Object in @b code. What we refer here as object are layouts (or themes)
 * defined by groups, and parts, both declared in EDC files. They are of
 * type Evas_Object as the other native objects of Evas, but they only exist
 * in Edje, so that is why we are calling them "edje objects".
 *
 * With the Edje Object Group functions we can deal with layouts by managing
 * its aspect, content, message and signal exchange and animation, among others.
 *
 * @
  }
{*
 * @typedef Edje_Aspect_Control
 *
 * All Edje aspect control values.
 *
  }
{< None aspect control value        }
{< Neither aspect control value     }
{< Horizontal aspect control value  }
{< Vertical aspect control value    }
{< Both aspect control value        }
type
  PEdje_Aspect_Control = ^TEdje_Aspect_Control;
  TEdje_Aspect_Control =  Longint;
  Const
    EDJE_ASPECT_CONTROL_NONE = 0;
    EDJE_ASPECT_CONTROL_NEITHER = 1;
    EDJE_ASPECT_CONTROL_HORIZONTAL = 2;
    EDJE_ASPECT_CONTROL_VERTICAL = 3;
    EDJE_ASPECT_CONTROL_BOTH = 4;
;
{*
 * @brief Gets the part name of an edje part object.
 * @param obj An edje part object
 * @return The name of the part, if the object is an edje part, or @c NULL
 * @note If this function returns @c NULL, @p obj was not an Edje part object
 * @see edje_object_part_object_get()
 * @since 1.10
  }

function edje_object_part_object_name_get(obj:PEvas_Object):Pchar;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Scale Edje Scale
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with scaling objects
 *
 * Edje allows one to build scalable interfaces. Scaling factors,
 * which are set to neutral (@c 1.0) values by default (no scaling,
 * actual sizes), are of two types: @b global and @b individual.
 *
 * Scaling affects the values of minimum/maximum @b part sizes, which
 * are @b multiplied by it. Font sizes are scaled, too.
 *
 *
 * @
  }
{*
 * @brief Sets Edje's global scaling factor.
 *
 * @param scale The global scaling factor (the default value is @c 1.0)
 *
 * Edje's global scaling factor will affect all its objects which
 * hadn't their individual scaling factors altered from the default
 * value (which is zero). If they had it set differently, by
 * edje_object_scale_set(), that factor will @b override the global
 * one.
 *
 * @warning Only parts which, at EDC level, had the @c "scale"
 * property set to @c 1, will be affected by this function. Check the
 * complete @ref edcref "syntax reference" for EDC files.
 *
 * @see edje_scale_get().
  }
procedure edje_scale_set(scale:Tdouble);cdecl;external libedje;
{*
 * @brief Retrieves Edje's global scaling factor.
 *
 * @return The global scaling factor.
 *
 * This function returns Edje's global scaling factor.
 *
 * @see edje_scale_set() for more details
 *
  }
function edje_scale_get:Tdouble;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Text_Entry Edje Text Entry
 * @ingroup Edje_Part_Text
 *
 * @brief Functions that deal with text entries
 *
 * In Edje it's possible to use a text part as a entry so the user is
 * able to make inputs of text. To do so, the text part must be set
 * with a input panel that will work as a virtual keyboard.
 *
 * Some of effects can be applied to the entered text and also plenty
 * actions can be performed after any input.
 *
 * Use the functions of this section to handle the user input of text.
 *
 *
 * @
  }
{ Number of cursor positions represented
                                     in content.  }
{*< True if the "change" union's "insert" is valid  }
{*< True if can be merged with the previous one. Used for example with insertion when something is already selected.  }
type
  PEdje_Entry_Change_Info = ^TEdje_Entry_Change_Info;
  TEdje_Entry_Change_Info = record
      change : record
          case longint of
            0 : ( insert : record
                content : Pchar;
                pos : Tsize_t;
                plain_length : Tsize_t;
              end );
            1 : ( del : record
                content : Pchar;
                start : Tsize_t;
                end : Tsize_t;
              end );
          end;
      flag0 : word;
    end;


const
  bm_TEdje_Entry_Change_Info_insert = $1;
  bp_TEdje_Entry_Change_Info_insert = 0;
  bm_TEdje_Entry_Change_Info_merge = $2;
  bp_TEdje_Entry_Change_Info_merge = 1;

function insert(var a : TEdje_Entry_Change_Info) : TEina_Bool;
procedure set_insert(var a : TEdje_Entry_Change_Info; __insert : TEina_Bool);
function merge(var a : TEdje_Entry_Change_Info) : TEina_Bool;
procedure set_merge(var a : TEdje_Entry_Change_Info; __merge : TEina_Bool);
{*
 * @since 1.1.0
  }
type
{*
 * @typedef Edje_Text_Filter_Type
 *
 * All Edje text filters type values.
  }
{*< Text type filter    }
{*< Format type filter  }
{*< Markup type filter  }

  PEdje_Text_Filter_Type = ^TEdje_Text_Filter_Type;
  TEdje_Text_Filter_Type =  Longint;
  Const
    EDJE_TEXT_FILTER_TEXT = 0;
    EDJE_TEXT_FILTER_FORMAT = 1;
    EDJE_TEXT_FILTER_MARKUP = 2;
;
{*< The plain normal layout @since 1.12  }
{*< Filename layout. Symbols such as '/' should be disabled. @since 1.12  }
{*< The name of a person. @since 1.12  }
type
  Txxxx =  Longint;
  Const
    EDJE_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_NORMAL = 0;
    EDJE_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_FILENAME = 1;
    EDJE_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_PERSON_NAME = 2;

{*< The plain normal number layout @since 1.8  }
{*< The number layout to allow a positive or negative sign at the start @since 1.8  }
{*< The number layout to allow decimal point to provide fractional value @since 1.8  }
{*< The number layout to allow decimal point and negative sign @since 1.8  }
type
  Txxx =  Longint;
  Const
    EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_NORMAL = 0;
    EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED = 1;
    EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_DECIMAL = 2;
    EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED_AND_DECIMAL = 3;

{*< The normal password layout @since 1.12  }
{*< The password layout to allow only number @since 1.12  }
type
  Txxxxxx =  Longint;
  Const
    EDJE_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NORMAL = 0;
    EDJE_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NUMBERONLY = 1;

{*
 * @typedef (*Edje_Text_Filter_Cb)
 * @brief Callback prototype for Edje_Text_Filter
 * @param obj The Evas_Object to filter.
 * @param type The filter type.
 * @param text The text of the filter.
  }
type

  TEdje_Text_Filter_Cb = procedure (data:pointer; obj:PEvas_Object; part:Pchar; _type:TEdje_Text_Filter_Type; text:PPchar);cdecl;
{*
 * @typedef (*Edje_Markup_Filter_Cb)
 * @brief Callback prototype for Edje_Text_Filter
 * @param obj The Evas_Object to filter.
 * @param part Edje part name.
 * @param text The text of the filter.
  }

  TEdje_Markup_Filter_Cb = procedure (data:pointer; obj:PEvas_Object; part:Pchar; text:PPchar);cdecl;
{*
 * @typedef (*Edje_Item_Provider_Cb)
 * @brief Callback prototype for Edje_Item_Provider
 * @param data some data provided by user
 * @param obj The Evas_Object to filter.
 * @param part Edje part name
 * @param item Item of container
 * @return Must be an Evas_Object.
  }

  PEdje_Item_Provider_Cb = ^TEdje_Item_Provider_Cb;
  TEdje_Item_Provider_Cb = function (data:pointer; obj:PEvas_Object; part:Pchar; item:Pchar):PEvas_Object;cdecl;
{*
 * @brief Shows last character in password mode.
 *
 * @param password_show_last If TRUE enable last character show in password mode.
 *
 * This function enables last input to be visible when in password mode for few seconds
 * or until the next input is entered.
 *
 * The time out value is obtained by edje_password_show_last_timeout_set function.
 *
 * @see edje_password_show_last_timeout_set().
  }

procedure edje_password_show_last_set(password_show_last:TEina_Bool);cdecl;external libedje;
{*
 * @brief Sets the timeout value in last show password mode.
 *
 * @param password_show_last_timeout The timeout value.
 *
 * This functions sets the time out value for which the last input entered in password
 * mode will be visible. If the time out value is less than zero, the last input entered in password mode will be always visible.
 *
 * This value can be used only when last show mode is set in password mode.
 *
 * @see edje_password_show_last_set().
 *
  }
procedure edje_password_show_last_timeout_set(password_show_last_timeout:Tdouble);cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Color_Class Edje Class: Color
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with Color Classes
 *
 * Sometimes we want to change the color of two or more parts equally and
 * that's when we use color classes.
 *
 * If one or more parts are assigned with a color class, when we set color
 * values to this class it will cause all these parts to have their colors
 * multiplied by the values. Setting values to a color class at a process level
 * will affect all parts with that color class, while at a object level will
 * affect only the parts inside an specified object.
 *
 * @
  }
{*
 * @brief Sets Edje color class.
 *
 * @param color_class
 * @param r Object Red value
 * @param g Object Green value
 * @param b Object Blue value
 * @param a Object Alpha value
 * @param r2 Outline Red value
 * @param g2 Outline Green value
 * @param b2 Outline Blue value
 * @param a2 Outline Alpha value
 * @param r3 Shadow Red value
 * @param g3 Shadow Green value
 * @param b3 Shadow Blue value
 * @param a3 Shadow Alpha value
 *
 * This function sets the color values for a process level color
 * class.  This will cause all edje parts in the current process that
 * have the specified color class to have their colors multiplied by
 * these values.  (Object level color classes set by
 * edje_object_color_class_set() will override the values set by this
 * function).
 *
 * The first color is the object, the second is the text outline, and
 * the third is the text shadow. (Note that the second two only apply
 * to text parts).
 *
 * Setting color emits a signal "color_class,set" with source being
 * the given color class in all objects.
 *
 * @see edje_color_class_set().
 *
 * @note Unlike Evas, Edje colors are @b not pre-multiplied. That is,
 *       half-transparent white is 255 255 255 128.
 *
 * @return Eina_Bool, @c EINA_TRUE on success and @c EINA_FALSE on failure.
  }
function edje_color_class_set(color_class:Pchar; r:longint; g:longint; b:longint; a:longint; 
           r2:longint; g2:longint; b2:longint; a2:longint; r3:longint; 
           g3:longint; b3:longint; a3:longint):TEina_Bool;cdecl;external libedje;
{*
 * @brief Applies changes mad when setting Edje color classes.
 *
 * This forces all changes to color classes made by (for example)
 * edje_color_class_set() to actually take effect.
 * 
 * @since 1.26
  }
procedure edje_color_class_apply;cdecl;external libedje;
{*
 * @brief Gets Edje color class.
 *
 * @param color_class
 * @param r Object Red value
 * @param g Object Green value
 * @param b Object Blue value
 * @param a Object Alpha value
 * @param r2 Outline Red value
 * @param g2 Outline Green value
 * @param b2 Outline Blue value
 * @param a2 Outline Alpha value
 * @param r3 Shadow Red value
 * @param g3 Shadow Green value
 * @param b3 Shadow Blue value
 * @param a3 Shadow Alpha value
 *
 * @return @c EINA_TRUE if found or @c EINA_FALSE if not found and all
 *         values are zeroed.
 *
 * This function gets the color values for a process level color
 * class. This value is the globally set and not per-object, that is,
 * the value that would be used by objects if they did not override with
 * edje_object_color_class_set().
 *
 * The first color is the object, the second is the text outline, and
 * the third is the text shadow. (Note that the second two only apply
 * to text parts).
 *
 * @see edje_color_class_set().
 *
 * @note Unlike Evas, Edje colors are @b not pre-multiplied. That is,
 *       half-transparent white is 255 255 255 128.
  }
function edje_color_class_get(color_class:Pchar; r:Plongint; g:Plongint; b:Plongint; a:Plongint; 
           r2:Plongint; g2:Plongint; b2:Plongint; a2:Plongint; r3:Plongint; 
           g3:Plongint; b3:Plongint; a3:Plongint):TEina_Bool;cdecl;external libedje;
{*
 * @brief Deletes edje color class.
 *
 * @param color_class
 *
 * This function deletes any values at the process level for the
 * specified color class.
 * @note Deleting the color class will revert it to the
 *       values defined in the theme file.
 *
 * Deleting the color class will emit the signal "color_class,del"
 * to all the Edje objects in the running program.
  }
procedure edje_color_class_del(color_class:Pchar);cdecl;external libedje;
{*
 * @brief Lists color classes.
 *
 * @return A list of color class names (strings). These strings and
 * the list must be free()'d by the caller.
 *
 * This function lists all color classes known about by the current
 * process.
 *
  }
function edje_color_class_list:PEina_List;cdecl;external libedje;
{*
 * @brief Iterates over all the active class of an application.
 *
 * @return an iterator of Edje_Color_Class of the currently active color class
 *
 * This function only iterate over the Edje_Color_Class in use by
 * an application.
 *
 * @since 1.14
  }
function edje_color_class_active_iterator_new:PEina_Iterator;cdecl;external libedje;
{*
 * @brief Iterates over all the color class provided by an Edje file.
 *
 * @param f The mapped edje file.
 *
 * @return an iterator of Edje_Color_Class provided by the Edje file.
 *
 * @since 1.14
  }
function edje_mmap_color_class_iterator_new(f:PEina_File):PEina_Iterator;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Size_Class Edje Class: Size
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with Size Classes
 *
 * Sometimes we want to change the size of two or more parts equally and
 * that's when we use size classes.
 *
 * If one or more parts are assigned with a size class, when we set attributes
 * (minw etc.) to this class will update all these parts with the new attributes.
 * Setting values to a size class at a process level will affect
 * all parts with that size class, while at object level will affect only
 * the parts inside an specified object.
 *
 * @
  }
{*
 * @brief Sets the Edje size class.
 *
 * @param size_class The size class name
 * @param minw The min width
 * @param minh The min height
 * @param maxw The max width
 * @param maxh The max height
 *
 * @return @c EINA_TRUE on success, or @c EINA_FALSE on error
 *
 * This function updates all Edje members at the process level which
 * belong to this size class with the new min and max attributes.
 *
 * @see edje_size_class_get().
 *
 * @since 1.17
  }
function edje_size_class_set(size_class:Pchar; minw:TEvas_Coord; minh:TEvas_Coord; maxw:TEvas_Coord; maxh:TEvas_Coord):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the Edje size class.
 *
 * @param size_class The size class name
 * @param minw The min width
 * @param minh The min height
 * @param maxw The max width
 * @param maxh The max height
 *
 * @return @c EINA_TRUE on success, or @c EINA_FALSE on error
 *
 * This function gets the min and max size from the specified Edje
 * size class.
 *
 * @since 1.17
  }
function edje_size_class_get(size_class:Pchar; minw:PEvas_Coord; minh:PEvas_Coord; maxw:PEvas_Coord; maxh:PEvas_Coord):TEina_Bool;cdecl;external libedje;
{*
 * @brief Deletes the size class.
 *
 * @param size_class The size class name
 *
 * This function deletes any values at the process level for the
 * specified size class.
 *
 * @since 1.17
  }
procedure edje_size_class_del(size_class:Pchar);cdecl;external libedje;
{*
 * @brief Lists size classes.
 *
 * @return A list of size class names (strings). These strings are
 * stringshares and the list must be eina_stringshare_del()'ed by the caller.
 *
 * This function lists all size classes known about by the current
 * process.
 *
 * @since 1.17
  }
function edje_size_class_list:PEina_List;cdecl;external libedje;
{*
 * @brief Iterates over all active classes of an application.
 *
 * @return An iterator of Edje_Size_Class of the currently active size class
 *
 * This function only iterates over the Edje_Size_Class in use by
 * an application.
 *
 * @since 1.17
  }
function edje_size_class_active_iterator_new:PEina_Iterator;cdecl;external libedje;
{*
 * @brief Iterates over all size classes provided by an Edje file.
 *
 * @param f The mapped edje file.
 *
 * @return an iterator of Edje_Size_Class provided by the Edje file.
 *
 * @since 1.17
  }
function edje_mmap_size_class_iterator_new(f:PEina_File):PEina_Iterator;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Text_Class Edje Class: Text
 * @ingroup Edje_Object_Group
 * @brief Functions that deal with Text Classes.
 *
 * Sometimes we want to change the text of two or more parts equally and
 * that's when we use text classes.
 *
 * If one or more parts are assigned with a text class, when we set font
 * attributes to this class will update all these parts with the new font
 * attributes. Setting values to a text class at a process level will affect
 * all parts with that text class, while at object level will affect only
 * the parts inside an specified object.
 *
 * @
  }
{*
 * @brief Sets the Edje text class.
 *
 * @param text_class The text class name
 * @param font The font name
 * @param size The font size
 *
 * @return @c EINA_TRUE on success, or @c EINA_FALSE on error
 *
 * This function updates all Edje members at the process level which
 * belong to this text class with the new font attributes.
 * If the @p size is 0 then the font size will be kept with the previous size.
 * If the @p size is less then 0 then the font size will be calculated in the
 * percentage. For example, if the @p size is -50, then the font size will be
 * scaled to half of the original size and if the @p size is -10 then the font
 * size will be scaled as much as 0.1x.
 *
 * @see edje_text_class_get().
 *
  }
function edje_text_class_set(text_class:Pchar; font:Pchar; size:TEvas_Font_Size):TEina_Bool;cdecl;external libedje;
{*
 * @brief Gets the font and the font size from Edje text class.
 *
 * @param text_class The text class name
 * @param font The font name
 * @param size The font size
 *
 * @return @c EINA_TRUE on success, or @c EINA_FALSE on error
 *
 * This function gets the font and the font name from the specified Edje
 * text class. The font string will only be valid until the text class is
 * changed or edje is shut down.
 * @see edje_text_class_set().
 *
 * @since 1.14
  }
function edje_text_class_get(text_class:Pchar; font:PPchar; size:PEvas_Font_Size):TEina_Bool;cdecl;external libedje;
{*
 * @brief Deletes the text class.
 *
 * @param text_class The text class name string
 *
 * This function deletes any values at the process level for the
 * specified text class.
 *
  }
procedure edje_text_class_del(text_class:Pchar);cdecl;external libedje;
{*
 * @brief Lists text classes.
 *
 * @return A list of text class names (strings). These strings are
 * stringshares and the list must be free()'d by the caller.
 *
 * This function lists all text classes known about by the current
 * process.
 *
  }
function edje_text_class_list:PEina_List;cdecl;external libedje;
{*
 * @brief Iterate over all active classes of an application.
 *
 * @return an iterator of Edje_Text_Class of the currently active text class
 *
 * This function only iterates over the Edje_Text_Class in use by
 * an application.
 *
 * @since 1.17
 *
  }
function edje_text_class_active_iterator_new:PEina_Iterator;cdecl;external libedje;
{*
 * @brief Iterate over all text classes provided by an Edje file.
 *
 * @param f The mapped edje file.
 *
 * @return an iterator of Edje_Text_Class provided by the Edje file.
 *
 * @since 1.17
 *
  }
function edje_mmap_text_class_iterator_new(f:PEina_File):PEina_Iterator;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_File Edje Object File
 * @ingroup Edje_Object_Group
 *
 * @brief Functions to deals with EDJ files.
 *
 * Layouts in Edje are usually called themes and they are
 * created using the EDC language. The EDC language is declarative
 * and must be compiled before being used. The output of this
 * compilation is an EDJ file, this file can be loaded by Edje,
 * and the result is a edje object.
 *
 * This groups of functions interact with these EDJ files,
 * either by loading them or retrieving information of the EDC
 * file about objects.
 *
 * @
  }
{*
 * @brief Gets a list of groups in an edje mapped file.
 * @param f The mapped file
 *
 * @return The Eina_List of group names (char *)
 *
 * Note: the list must be freed using edje_mmap_collection_list_free()
 * when you are done with it.
  }
function edje_mmap_collection_list(f:PEina_File):PEina_List;cdecl;external libedje;
{*
 * @brief Frees file collection list.
 * @param lst The Eina_List of groups
 *
 * Frees the list returned by edje_mmap_collection_list().
  }
procedure edje_mmap_collection_list_free(lst:PEina_List);cdecl;external libedje;
{*
 * @brief Returns a list of colorclasses used in this edje file
 * @param f The mapped file
 *
 * @return A list of strings freed by edje_file_color_class_used_free()
 *
 * @since 1.26
  }
function edje_mmap_color_class_used_list(f:PEina_File):PEina_List;cdecl;external libedje;
{*
 * @brief Returns a list of colorclasses used in this edje file
 * @param file The file path
 *
 * @return A list of strings freed by edje_file_color_class_used_free()
 *
 * @since 1.26
  }
function edje_file_color_class_used_list(file:Pchar):PEina_List;cdecl;external libedje;
{*
 * @brief Frees a list of color classes used
 * @param The list
 *
 * This frees the list returned by edje_mmap_color_class_used_list() or 
 * edje_file_color_class_used_list() when you no longer need it.
 *
 * @since 1.26
  }
procedure edje_file_color_class_used_free(lst:PEina_List);cdecl;external libedje;
{*
 * @brief Determines whether a group matching glob exists in an edje mapped file.
 * @param f The mapped file
 * @param glob A glob to match on
 *
 * @return @c 1 if a match is found, @c 0 otherwise
  }
function edje_mmap_group_exists(f:PEina_File; glob:Pchar):TEina_Bool;cdecl;external libedje;
{*
 * @brief Determines whether a group have 3D Scene.
 * @param f The mapped file
 * @param group The group name
 *
 * @return @c 1 if a Scene is found is found, @c 0 otherwise
 *
 * @deprecated
 * @since 1.18
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
function edje_mmap_3d_has(f:PEina_File; group:Pchar):TEina_Bool;cdecl;external libedje;
{*
 * @brief Iterates over all the opened Edje files.
 *
 * @return an iterator of Eina_File for all currently open Edje files.
 *
 * @since 1.14
  }
function edje_file_iterator_new:PEina_Iterator;cdecl;external libedje;
{*
 * @brief Gets a list of groups in an edje file.
 * @param file The path to the edje file
 *
 * @return The Eina_List of group names (char *)
 * @see edje_mmap_collection_list()
 *
 * Note: the list must be freed using edje_file_collection_list_free()
 * when you are done with it.
 *
 * @see edje_mmap_group_exists()
  }
function edje_file_collection_list(file:Pchar):PEina_List;cdecl;external libedje;
{*
 * @brief Frees file collection list.
 * @param lst The Eina_List of groups
 *
 * Frees the list returned by edje_file_collection_list().
  }
procedure edje_file_collection_list_free(lst:PEina_List);cdecl;external libedje;
{*
 * @brief Determines whether a group matching glob exists in an edje file.
 * @param file The file path
 * @param glob A glob to match on
 *
 * @return @c 1 if a match is found, @c 0 otherwise
  }
function edje_file_group_exists(file:Pchar; glob:Pchar):TEina_Bool;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Animation Edje Object Animation
 * @ingroup Edje_Object_Group
 * @brief Functions that deal with animations.
 *
 * Edje has the ability to animate objects. One can start, stop, play,
 * pause, freeze, and thaw edje animations using the functions of this section.
 *
 * @
  }
{*
 * @typedef Edje_Tween_Mode
 *
 * Available tween mode for edje animations.
  }
{*< None tween mode value  }
{*< Linear tween mode value  }
{*< Sinusoidal tween mode value  }
{*< Accelerate tween mode value  }
{*< Decelerate tween mode value  }
{*< Accelerate factor tween mode value  }
{*< Decelerate factor tween mode value  }
{*< Sinusoidal factor tween mode value  }
{*< Divisor iterp tween mode value  }
{*< Bounce tween mode value  }
{*< Spring tween mode value  }
{*< Cubic Bezier tween mode value  }
{*< Last tween mode value  }
{*< Mask tween mode value  }
{*< Options from current tween mode value  }
type
  PEdje_Tween_Mode = ^TEdje_Tween_Mode;
  TEdje_Tween_Mode =  Longint;
  Const
    EDJE_TWEEN_MODE_NONE = 0;
    EDJE_TWEEN_MODE_LINEAR = 1;
    EDJE_TWEEN_MODE_SINUSOIDAL = 2;
    EDJE_TWEEN_MODE_ACCELERATE = 3;
    EDJE_TWEEN_MODE_DECELERATE = 4;
    EDJE_TWEEN_MODE_ACCELERATE_FACTOR = 5;
    EDJE_TWEEN_MODE_DECELERATE_FACTOR = 6;
    EDJE_TWEEN_MODE_SINUSOIDAL_FACTOR = 7;
    EDJE_TWEEN_MODE_DIVISOR_INTERP = 8;
    EDJE_TWEEN_MODE_BOUNCE = 9;
    EDJE_TWEEN_MODE_SPRING = 10;
    EDJE_TWEEN_MODE_CUBIC_BEZIER = 11;
    EDJE_TWEEN_MODE_LAST = 12;
    EDJE_TWEEN_MODE_MASK = $ff;
    EDJE_TWEEN_MODE_OPT_FROM_CURRENT = 1 shl 31;
;
{*
 * @typedef Edje_Action_Type
 *
 * All actions available in Edje programs.
 *
  }
{*< None action value  }
{*< State set action value  }
{*< Action stop action value  }
{*< Signal emit action value  }
{*< Drag val set action value  }
{*< Drag val step action value  }
{*< Drag val page action value  }
{*< Script action value  }
{*< Focus set action value  }
{*< Reversed do action value  }
{*< Focus object action value  }
{*< Param copy action value  }
{*< Param set action value  }
{*< @since 1.1 @brief Sound sample action value  }
{*< @since 1.1 @brief Sound tone action value  }
{*< @since 1.8 @brief Physics impulse action value  }
{*< @since 1.8 @brief Physics torque impulse action value  }
{*< @since 1.8 @brief Physics force action value  }
{*< @since 1.8 @brief Physics torque action value  }
{*< @since 1.8 @brief Physics forces clear action value  }
{*< @since 1.8 @brief Physics velocity set action value  }
{*< @since 1.8 @brief Physics angle velocity set action value  }
{*< @since 1.8 @brief Physics stop action value  }
{*< @since 1.8 @brief Physics rotation set action value  }
{*< @since 1.10 @brief vibration sample action value  }
{*< @since 1.15 @brief Mo action value  }
{* @since 1.24 @brief Vector animation stop action value  }
{* @since 1.24 @brief Vector animation pause action value  }
{* @since 1.24 @brief Vector animation resume action value  }
{* @since 1.24 @brief Vector animation play action value  }
{* @since 1.24 @brief Vector animation rewind action value  }
{* @since 1.24 @brief Vector animation loop value  }
{*< Last action value  }
type
  PEdje_Action_Type = ^TEdje_Action_Type;
  TEdje_Action_Type =  Longint;
  Const
    EDJE_ACTION_TYPE_NONE = 0;
    EDJE_ACTION_TYPE_STATE_SET = 1;
    EDJE_ACTION_TYPE_ACTION_STOP = 2;
    EDJE_ACTION_TYPE_SIGNAL_EMIT = 3;
    EDJE_ACTION_TYPE_DRAG_VAL_SET = 4;
    EDJE_ACTION_TYPE_DRAG_VAL_STEP = 5;
    EDJE_ACTION_TYPE_DRAG_VAL_PAGE = 6;
    EDJE_ACTION_TYPE_SCRIPT = 7;
    EDJE_ACTION_TYPE_FOCUS_SET = 8;
    EDJE_ACTION_TYPE_RESERVED00 = 9;
    EDJE_ACTION_TYPE_FOCUS_OBJECT = 10;
    EDJE_ACTION_TYPE_PARAM_COPY = 11;
    EDJE_ACTION_TYPE_PARAM_SET = 12;
    EDJE_ACTION_TYPE_SOUND_SAMPLE = 13;
    EDJE_ACTION_TYPE_SOUND_TONE = 14;
    EDJE_ACTION_TYPE_PHYSICS_IMPULSE = 15;
    EDJE_ACTION_TYPE_PHYSICS_TORQUE_IMPULSE = 16;
    EDJE_ACTION_TYPE_PHYSICS_FORCE = 17;
    EDJE_ACTION_TYPE_PHYSICS_TORQUE = 18;
    EDJE_ACTION_TYPE_PHYSICS_FORCES_CLEAR = 19;
    EDJE_ACTION_TYPE_PHYSICS_VEL_SET = 20;
    EDJE_ACTION_TYPE_PHYSICS_ANG_VEL_SET = 21;
    EDJE_ACTION_TYPE_PHYSICS_STOP = 22;
    EDJE_ACTION_TYPE_PHYSICS_ROT_SET = 23;
    EDJE_ACTION_TYPE_VIBRATION_SAMPLE = 24;
    EDJE_ACTION_TYPE_MO = 25;
    EDJE_ACTION_TYPE_VG_ANIM_STOP = 26;
    EDJE_ACTION_TYPE_VG_ANIM_PAUSE = 27;
    EDJE_ACTION_TYPE_VG_ANIM_RESUME = 28;
    EDJE_ACTION_TYPE_VG_ANIM_PLAY = 29;
    EDJE_ACTION_TYPE_VG_ANIM_REWIND = 30;
    EDJE_ACTION_TYPE_VG_ANIM_LOOP = 31;
    EDJE_ACTION_TYPE_LAST = 32;
;
{*
 * @brief Sets edje transitions' frame time.
 *
 * @param t The frame time, in seconds. Default value is 1/30.
 *
 * This function sets the edje built-in animations' frame time (thus,
 * affecting their resolution) by calling
 * ecore_animator_frametime_set(). This frame time can be retrieved
 * with edje_frametime_get().
 *
 * @see edje_frametime_get()
 *
  }

procedure edje_frametime_set(t:Tdouble);cdecl;external libedje;
{*
 * @brief Gets edje transitions' frame time.
 *
 * @return The frame time, in seconds.
 *
 * This function returns the edje frame time set by
 * edje_frametime_set() or the default value 1/30.
 *
 * @see edje_frametime_set()
 *
  }
function edje_frametime_get:Tdouble;cdecl;external libedje;
{*
 * @brief Freezes Edje objects.
 *
 * This function freezes all Edje animations in the current process.
 *
 * @note: for freeze a specific object @see edje_object_freeze().
 *
 * @see edje_thaw()
 *
  }
procedure edje_freeze;cdecl;external libedje;
{*
 * @brief Thaws Edje objects.
 *
 * This function thaws all Edje animations in the current process.
 *
 * @note for thaw a specific object @see edje_object_thaw().
 *
 * @see edje_freeze()
 *
  }
procedure edje_thaw;cdecl;external libedje;
{*
 * @brief Sets Edje language.
 *
 * @param locale The locale specifier.
 *
 * This function sets the given language.
 *
 * @note: emits signal edje,language,"locale".
 *
 * @since 1.15
  }
procedure edje_language_set(locale:Pchar);cdecl;external libedje;
{*
 * @brief Sets edje transition duration factor.
 *
 * @param scale The edje transition's duration factor (the default value is @c 1.0)
 *
 * This function sets the edje transition duration factor
 * It will affect the speed of transitions
 * which had the @c use_duration_factor property set to @1.
 * The default value of @c use_duration_factor property is @c zero,
 * but can be changed by @p "USE_DURATION_FACTOR 1" or @p "USE_DURATION_FACTOR 0"
 * as parameter of @c "TRANSITION" property at EDC level.
 * If the parameter is @p "USE_DURATION_FACTOR 0" or not mentioned about @p "USE_DURATION_FACTOR",
 * the duration of transition keeps original duration
 *
 * @warning The transition's duration factor cannot be set on each translation.
 * If you use this function, it will affect transitions globally
 *
 * @see edje_transition_duration_factor_get()
 *
 * @since 1.15
  }
procedure edje_transition_duration_factor_set(scale:Tdouble);cdecl;external libedje;
{*
 * @brief Retrieves transitions duration factor.
 *
 * @return The edje transition duration factor
 *
 * This function returns the edje transition duration factor.
 *
 * @see edje_transition_duration_set() for more details
 *
 * @since 1.15
 *
  }
function edje_transition_duration_factor_get:Tdouble;cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Object_Geometry_Group Edje Object Geometry
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with object's geometry.
 *
 * By geometry we mean size and position. So in this groups there are
 * functions to manipulate object's geometry or retrieve information
 * about it.
 *
 * Keep in mind that by changing an object's geometry, it may affect
 * the appearance in the screen of the parts inside. Most times
 * that is what you want.
 *
 * @
  }
{*
 * @
  }
{*
 * @defgroup Edje_Object_Part Edje Part
 * @ingroup Edje_Object_Group
 *
 * @brief Functions that deal with layout components
 *
 * Parts are layout components, but as a layout, they are objects too.
 *
 * There are several types of parts, these types can be divided into two
 * main categories, the first being containers. Containers are parts
 * that are in effect a group of elements. The second group is that of
 * the elements, these part types may not contain others.
 *
 * This section has some functions specific for some types and others that
 * could be applied to any type.
 *
 * @
  }
{*
 * @defgroup Edje_Part_Text Edje Text Part
 * @ingroup Edje_Object_Part
 *
 * @brief Functions that deal with parts of type text
 *
 * Text is an element type for parts. It's basic functionality is to
 * display a string on the layout, but a lot more things can be done
 * with texts, like string selection, setting the cursor and include
 * a input panel, where one can set a virtual keyboard to handle
 * keyboard entry easily.
 *
 * @
  }
{*
 * @typedef Edje_Text_Effect
 *
 * All possible text effects in Edje.
  }
{*< None text effect value  }
{*< Plain text effect value  }
{*< Outline text effect value  }
{*< Soft outline text effect value  }
{*< Shadown text effect value  }
{*< Soft shadow text effect value  }
{*< Outline shadow text effect value  }
{*< Outline soft shadow text effect value  }
{*< Far shadow text effect value  }
{*< Far soft shadow text effect value  }
{*< Glow text effect value  }
{*< Last text effect value  }
{*< Bottom right shadow direction value  }
{*< Bottom shadow direction value  }
{*< Bottom left shadow direction value  }
{*< Left shadow direction value  }
{*< Top left shadow direction value  }
{*< Top shadow direction value  }
{*< Top right shadow direction value  }
{*< right shadow direction value  }
type
  PEdje_Text_Effect = ^TEdje_Text_Effect;
  TEdje_Text_Effect =  Longint;
  Const
    EDJE_TEXT_EFFECT_NONE = 0;
    EDJE_TEXT_EFFECT_PLAIN = 1;
    EDJE_TEXT_EFFECT_OUTLINE = 2;
    EDJE_TEXT_EFFECT_SOFT_OUTLINE = 3;
    EDJE_TEXT_EFFECT_SHADOW = 4;
    EDJE_TEXT_EFFECT_SOFT_SHADOW = 5;
    EDJE_TEXT_EFFECT_OUTLINE_SHADOW = 6;
    EDJE_TEXT_EFFECT_OUTLINE_SOFT_SHADOW = 7;
    EDJE_TEXT_EFFECT_FAR_SHADOW = 8;
    EDJE_TEXT_EFFECT_FAR_SOFT_SHADOW = 9;
    EDJE_TEXT_EFFECT_GLOW = 10;
    EDJE_TEXT_EFFECT_LAST = 11;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_BOTTOM_RIGHT = $0 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_BOTTOM = $1 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_BOTTOM_LEFT = $2 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_LEFT = $3 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_TOP_LEFT = $4 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_TOP = $5 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_TOP_RIGHT = $6 shl 4;
    EDJE_TEXT_EFFECT_SHADOW_DIRECTION_RIGHT = $7 shl 4;
;
{*
 * @defgroup Edje_Text_Selection Edje Text Selection
 * @ingroup Edje_Part_Text
 *
 * @brief Functions that deal with selection in text parts.
 *
 * Selection is a known functionality for texts in the whole computational
 * world. It is a block of text marked for further manipulation.
 *
 * Edje is responsible for handling this functionality through the
 * following functions.
 *
 * @
  }
{*
 * @
  }
{*
 * @defgroup Edje_Text_Cursor Edje Text Cursor
 * @ingroup Edje_Part_Text
 *
 * @brief Functions that deal with cursor in text parts.
 *
 * Cursor is a known functionality for texts in the whole computational
 * world. It marks a position in the text from where one may want
 * to make a insertion, deletion or selection.
 *
 * Edje is responsible for handling this functionality through the
 * following functions.
 *
 * @
  }
{*
 * @
  }
{*
 * @
  }
{*
 * @defgroup Edje_Part_Swallow Edje Swallow Part
 * @ingroup Edje_Object_Part
 *
 * @brief Functions that deal with parts of type swallow and swallowed objects.
 *
 * A important feature of Edje is to be able to create Evas_Objects
 * in code and place them in a layout. And that is what swallowing
 * is all about.
 *
 * Swallow parts are place holders defined in the EDC file for
 * objects that one may want to include in the layout later, or for
 * objects that are not native of Edje. In this last case, Edje will
 * only treat the Evas_Object properties of the swallowed objects.
 *
 *
 * @
  }
{*
 * @
  }
{*
 * @defgroup Edje_Part_Box Edje Box Part
 * @ingroup Edje_Object_Part
 *
 * @brief Functions that deal with parts of type box.
 *
 * Box is a container type for parts, that means it can contain
 * other parts.
 *
 * @
  }
{*
 * @brief Registers a custom layout to be used in edje boxes.
 *
 * @param name The name of the layout
 * @param func The function defining the layout
 * @param layout_data_get This function gets the custom data pointer
 * for func
 * @param layout_data_free Passed to func to free its private data
 * when needed
 * @param free_data Frees data
 * @param data Private pointer passed to layout_data_get
 *
 * This function registers custom layouts that can be referred from
 * themes by the registered name. The Evas_Object_Box_Layout
 * functions receive two pointers for internal use, one being private
 * data, and the other the function to free that data when it's not
 * longer needed. From Edje, this private data will be retrieved by
 * calling layout_data_get, and layout_data_free will be the free
 * function passed to func. layout_data_get will be called with data
 * as its parameter, and this one will be freed by free_data whenever
 * the layout is unregistered from Edje.
  }

procedure edje_box_layout_register(name:Pchar; func:TEvas_Object_Box_Layout; layout_data_get:function (para1:pointer):pointer; layout_data_free:procedure (para1:pointer); free_data:procedure (para1:pointer); 
            data:pointer);cdecl;external libedje;
{*
 * @
  }
{*
 * @defgroup Edje_Part_Table Edje Table Part
 * @ingroup Edje_Object_Part
 *
 * @brief Functions that deal with parts of type table.
 *
 * Table is a container type for parts, that means it can contain
 * other parts.
 *
 * @
  }
{*
 * @typedef Edje_Object_Table_Homogeneous_Mode
 *
 * Table homogeneous modes.
 *
  }
{< None homogeneous mode   }
{< Table homogeneous mode  }
{< Item homogeneous mode   }
type
  PEdje_Object_Table_Homogeneous_Mode = ^TEdje_Object_Table_Homogeneous_Mode;
  TEdje_Object_Table_Homogeneous_Mode =  Longint;
  Const
    EDJE_OBJECT_TABLE_HOMOGENEOUS_NONE = 0;
    EDJE_OBJECT_TABLE_HOMOGENEOUS_TABLE = 1;
    EDJE_OBJECT_TABLE_HOMOGENEOUS_ITEM = 2;
;
{*
 * @
  }
{*
 * @
  }

// === Konventiert am: 22-5-25 17:55:40 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_FULL(name,def,min,max,step : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_INT_FULL:=EDJE_EXTERNAL_PARAM_INFO_INT_FULL_FLAGS(name,def,min,max,step,EDJE_EXTERNAL_PARAM_FLAGS_REGULAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FULL(name,def,min,max,step : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FULL:=EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FULL_FLAGS(name,def,min,max,step,EDJE_EXTERNAL_PARAM_FLAGS_REGULAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_FULL(name,def,accept,deny : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_STRING_FULL:=EDJE_EXTERNAL_PARAM_INFO_STRING_FULL_FLAGS(name,def,accept,deny,EDJE_EXTERNAL_PARAM_FLAGS_REGULAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_FULL(name,def,false_str,true_str : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_BOOL_FULL:=EDJE_EXTERNAL_PARAM_INFO_BOOL_FULL_FLAGS(name,def,false_str,true_str,EDJE_EXTERNAL_PARAM_FLAGS_REGULAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_CHOICE_FULL(name,def,choices : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_CHOICE_FULL:=EDJE_EXTERNAL_PARAM_INFO_CHOICE_FULL_FLAGS(name,def,choices,EDJE_EXTERNAL_PARAM_FLAGS_REGULAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_CHOICE_DYNAMIC_FULL(name,def_get,query : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_CHOICE_DYNAMIC_FULL:=EDJE_EXTERNAL_PARAM_INFO_CHOICE_DYNAMIC_FULL_FLAGS(name,def_get,query,EDJE_EXTERNAL_PARAM_FLAGS_REGULAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT(name,def : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT:=EDJE_EXTERNAL_PARAM_INFO_INT_FULL(name,def,EDJE_EXTERNAL_INT_UNSET,EDJE_EXTERNAL_INT_UNSET,EDJE_EXTERNAL_INT_UNSET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT(name,def : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT:=EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FULL(name,def,EDJE_EXTERNAL_DOUBLE_UNSET,EDJE_EXTERNAL_DOUBLE_UNSET,EDJE_EXTERNAL_DOUBLE_UNSET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT(name,def : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT:=EDJE_EXTERNAL_PARAM_INFO_STRING_FULL(name,def,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT(name,def : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT:=EDJE_EXTERNAL_PARAM_INFO_BOOL_FULL(name,def,'false','true');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT_FLAGS(name,def,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_INT_FULL_FLAGS(name,def,EDJE_EXTERNAL_INT_UNSET,EDJE_EXTERNAL_INT_UNSET,EDJE_EXTERNAL_INT_UNSET,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT_FLAGS(name,def,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FULL_FLAGS(name,def,EDJE_EXTERNAL_DOUBLE_UNSET,EDJE_EXTERNAL_DOUBLE_UNSET,EDJE_EXTERNAL_DOUBLE_UNSET,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT_FLAGS(name,def,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_STRING_FULL_FLAGS(name,def,NULL,NULL,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT_FLAGS(name,def,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_BOOL_FULL_FLAGS(name,def,'false','true',flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT(name : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_INT:=EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT(name,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE(name : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_DOUBLE:=EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT(name,0.0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING(name : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_STRING:=EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT(name,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL(name : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_BOOL:=EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT(name,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_INT_FLAGS(name,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_INT_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_INT_DEFAULT_FLAGS(name,0,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FLAGS(name,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_DOUBLE_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_DOUBLE_DEFAULT_FLAGS(name,0.0,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_STRING_FLAGS(name,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_STRING_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_STRING_DEFAULT_FLAGS(name,NULL,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EDJE_EXTERNAL_PARAM_INFO_BOOL_FLAGS(name,flags : longint) : longint;
begin
  EDJE_EXTERNAL_PARAM_INFO_BOOL_FLAGS:=EDJE_EXTERNAL_PARAM_INFO_BOOL_DEFAULT_FLAGS(name,0,flags);
end;

function insert(var a : TEdje_Entry_Change_Info) : TEina_Bool;
begin
  insert:=(a.flag0 and bm_TEdje_Entry_Change_Info_insert) shr bp_TEdje_Entry_Change_Info_insert;
end;

procedure set_insert(var a : TEdje_Entry_Change_Info; __insert : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__insert shl bp_TEdje_Entry_Change_Info_insert) and bm_TEdje_Entry_Change_Info_insert);
end;

function merge(var a : TEdje_Entry_Change_Info) : TEina_Bool;
begin
  merge:=(a.flag0 and bm_TEdje_Entry_Change_Info_merge) shr bp_TEdje_Entry_Change_Info_merge;
end;

procedure set_merge(var a : TEdje_Entry_Change_Info; __merge : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__merge shl bp_TEdje_Entry_Change_Info_merge) and bm_TEdje_Entry_Change_Info_merge);
end;


end.
