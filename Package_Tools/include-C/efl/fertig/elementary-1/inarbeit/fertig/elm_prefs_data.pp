
unit elm_prefs_data;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_prefs_data.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_prefs_data.h
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
PEina_Value  = ^Eina_Value;
PElm_Prefs_Data  = ^Elm_Prefs_Data;
PElm_Prefs_Data_Event_Changed  = ^Elm_Prefs_Data_Event_Changed;
PElm_Prefs_Data_Event_Type  = ^Elm_Prefs_Data_Event_Type;
PElm_Prefs_Item_Type  = ^Elm_Prefs_Item_Type;
PElm_Prefs_Reset_Mode  = ^Elm_Prefs_Reset_Mode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Prefs Elementary Prefs
 * @ingroup Elementary
 *
 * Elementary provides a prefs (for "preferences") infrastructure, which
 * consists of two sets of APIs:
 * - prefs data and
 * - prefs view.
 *
 * @section elm-prefs-data Prefs Data
 *
 * Prefs data are simple key/value storage handles. One is able to
 * set/get their values, which are @c Eina_Value blobs
 * (i.e. dynamically typed). You may also control the version of this
 * data set, for updating purposes. Finally, you may register
 * callbacks on changes on these data.
 *
 * The main user of prefs data is the prefs @b widget. After its
 * creation, it's bound to a given prefs data handle (if not, if gets
 * its values from its definition file, which may have defaults). An
 * elm prefs widget has its visuals defined by an @c .epb file, which
 * is a compiled form of a @c .edc counterpart -- a textual definition
 * much like Edje @c .edc files. On these files, one defines the
 * values (items) a prefs widget hold, which translate to other
 * Elementary widgets. In other words, it does the mapping between UI
 * widgets into prefs data values, and it keeps the synchrony between
 * its child widgets' states and their corresponding prefs data
 * values.
 *
 * @
  }
{* Modes of resetting a prefs widget. see elm_prefs_reset()
 *
 * @since 1.8
  }
{*< reset to default values, declared in its
                                 * <b>.epb</b> file  }
{*< prefs will keep a small history of changes, so this
                        *  resets back to last batch of changes on the UI
                        * elements. it does <b>not</b> work on autosave mode  }
type
  PElm_Prefs_Reset_Mode = ^TElm_Prefs_Reset_Mode;
  TElm_Prefs_Reset_Mode =  Longint;
  Const
    ELM_PREFS_RESET_DEFAULTS = 0;
    ELM_PREFS_RESET_LAST = 1;
;
{* Elm Prefs item types.
 *
 * @since 1.8
  }
{*< Unknown type  }
{*< action type, bound to button-like UI elements  }
{*< boolean type, bound to checkbox-like UI elements  }
{*< integer type, bound to spinner-like UI elements  }
{*< floating point type, bound to spinner-like UI elements  }
{*< label type, bound to read-only, label UI elements  }
{*< date type, bound to date selection UI elements  }
{*< text type, bound to single-line, text entry UI elements  }
{*< text area type, bound to multi-line, text entry UI elements  }
{*< page type, used to nest pages  }
{*< values resetting trigger type, bound to button-like UI elements  }
{*< saving trigger type, bound to button-like UI elements  }
{*< separator type, bound to separator-like UI elements  }
{*< swallow type, bound to an empty 'spot' on the UI
                          * meant to receive and display external content  }
type
  PElm_Prefs_Item_Type = ^TElm_Prefs_Item_Type;
  TElm_Prefs_Item_Type =  Longint;
  Const
    ELM_PREFS_TYPE_UNKNOWN = 0;
    ELM_PREFS_TYPE_ACTION = 1;
    ELM_PREFS_TYPE_BOOL = 2;
    ELM_PREFS_TYPE_INT = 3;
    ELM_PREFS_TYPE_FLOAT = 4;
    ELM_PREFS_TYPE_LABEL = 5;
    ELM_PREFS_TYPE_DATE = 6;
    ELM_PREFS_TYPE_TEXT = 7;
    ELM_PREFS_TYPE_TEXTAREA = 8;
    ELM_PREFS_TYPE_PAGE = 9;
    ELM_PREFS_TYPE_RESET = 10;
    ELM_PREFS_TYPE_SAVE = 11;
    ELM_PREFS_TYPE_SEPARATOR = 12;
    ELM_PREFS_TYPE_SWALLOW = 13;
;
{*
 * Types of events a given prefs data handle may issue.
 *
 * @see elm_prefs_data_event_callback_add()
 *
 * @since 1.8
  }
{* The group of values has been automatically saved (event info is the group's name (key))  }
{* A given item (prefs data value) has been changed (event info is an #Elm_Prefs_Data_Event_Changed pointer)  }
{* sentinel value, don't use it  }
type
  PElm_Prefs_Data_Event_Type = ^TElm_Prefs_Data_Event_Type;
  TElm_Prefs_Data_Event_Type =  Longint;
  Const
    ELM_PREFS_DATA_EVENT_GROUP_AUTOSAVED = 0;
    ELM_PREFS_DATA_EVENT_ITEM_CHANGED = 1;
    ELM_PREFS_DATA_EVENT_LAST = 2;
;
{*
 * @typedef Elm_Prefs_Data
 *
 * An Elm Prefs Data handle.
 *
 * @since 1.8
  }
type

  TElm_Prefs_Data_Event_Cb = procedure (cb_data:pointer; _type:TElm_Prefs_Data_Event_Type; prefs_data:PElm_Prefs_Data; event_info:pointer);cdecl;
{*
 * @typedef Elm_Prefs_Data_Event_Changed
 *
 * An Elm Prefs #ELM_PREFS_DATA_EVENT_ITEM_CHANGED event info data
 * blob.
 *
 * @since 1.8
  }
(* Const before type ignored *)
{* key of the data value which changed  }
(* Const before type ignored *)
{* the value, itself, to be used as a @b read-only Eina_Value (it can be @c NULL, if the data was deleted)  }

  PElm_Prefs_Data_Event_Changed = ^TElm_Prefs_Data_Event_Changed;
  TElm_Prefs_Data_Event_Changed = record
      key : Pchar;
      value : PEina_Value;
    end;
{*
 * Create a new prefs data handle.
 *
 * @param data_file The (user) file where to read data from
 * @param key The key where the data is stored under
 * @param mode The mode of access to the given file
 * @return A new prefs data handle
 *
 * If @a data_file is @c NULL,
 * efreet_config_home_get()/<appname>/preferences.cfg will be used, by
 * default. If @a key is @c NULL, it is considered a default key --
 * "main".
 *
 * If @a mode is @c EET_FILE_MODE_READ, autosave will be always false
 * for this elm_prefs_data handle. If @a mode is
 * @c EET_FILE_MODE_WRITE, than @a data_file @b won't be read, but just
 * written to.
 *
 * @note An elm prefs data handle starts with a reference count of @b
 * 1 (see elm_prefs_data_ref()). Use elm_prefs_data_unref() to delete
 * it.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)

function elm_prefs_data_new(data_file:Pchar; key:Pchar; mode:TEet_File_Mode):PElm_Prefs_Data;cdecl;external;
{*
 * Set the version field of a given prefs data handle.
 *
 * @param prefs_data A valid prefs data handle
 * @param version The version number
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * @see elm_prefs_data_version_get()
 *
 * @since 1.8
  }
function elm_prefs_data_version_set(prefs_data:PElm_Prefs_Data; version:dword):TEina_Bool;cdecl;external;
{*
 * Get the version field of a given prefs data handle.
 *
 * @param prefs_data A valid prefs data handle
 * @return The version of @a prefs_data or -1, on errors.
 *
 * @see elm_prefs_data_version_set()
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_prefs_data_version_get(prefs_data:PElm_Prefs_Data):dword;cdecl;external;
{*
 * Increment reference count on a given prefs data handle.
 *
 * @param prefs_data A valid prefs data handle
 * @return The same prefs data handle, @a prefs_data
 *
 * This increments the reference count of @a by 1. Use this to pass
 * the handle safely to contexts other than the creation one, for
 * example. Only when the reference count on a prefs data handle
 * reaches @b 0 (see elm_prefs_data_unref()) will it be deleted.
 *
 * @since 1.8
  }
function elm_prefs_data_ref(prefs_data:PElm_Prefs_Data):PElm_Prefs_Data;cdecl;external;
{*
 * Decrement reference count on a given prefs data handle.
 *
 * @param prefs_data A valid prefs data handle
 *
 * This decrements the reference count of @a by 1. When the reference
 * count on @a reach @b 0, it will it be deleted.
 *
 * @see elm_prefs_data_ref() for more details.
 *
 * @since 1.8
  }
procedure elm_prefs_data_unref(prefs_data:PElm_Prefs_Data);cdecl;external;
{*
 * Set (or delete) one value of a given prefs data handle.
 *
 * @param prefs_data A valid prefs data handle
 * @param path The (unique) name (key) of the given value
 * @param type The item type to which the value is to be associated
 * @param value The value, itself. It must be a valid @c Eina_Value
 *              handle, bound to a given type and value or @c NULL. On
 *              the second case, the call will actually @b delete the
 *              given key from @a prefs_data.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * A prefs data handle holds a list of key/value entries. This will
 * set one of @a's values, by name. The value itself may be any valid
 * and filled up @c Eina_Value handle.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_data_value_set(prefs_data:PElm_Prefs_Data; path:Pchar; _type:TElm_Prefs_Item_Type; value:PEina_Value):TEina_Bool;cdecl;external;
{*
 * Get one value of a given prefs data handle (by key).
 *
 * @param prefs_data A valid prefs data handle
 * @param path The (unique) name (key) of the given value
 * @param type The item type associated with the value
 * @param value A valid @c Eina_Value handle, where to store the
 *              value, itself.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * This will retrieve one of @a's values, by name. The value itself
 * will be written to @a value, which will be overriden.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_data_value_get(prefs_data:PElm_Prefs_Data; path:Pchar; _type:PElm_Prefs_Item_Type; value:PEina_Value):TEina_Bool;cdecl;external;
{*
 * Register a callback for one of the prefs data events.
 *
 * @param prefs_data A valid prefs data handle
 * @param type The type of event to register to
 * @param cb The callback function to issue on this event
 * @param cb_data The data pointer to pass to @a cb on this event
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * @see #Elm_Prefs_Data_Event_Type for more details on the events.
 * @see elm_prefs_data_event_callback_del()
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_prefs_data_event_callback_add(prefs_data:PElm_Prefs_Data; _type:TElm_Prefs_Data_Event_Type; cb:TElm_Prefs_Data_Event_Cb; cb_data:pointer):TEina_Bool;cdecl;external;
{*
 * Unregister a callback for one of the prefs data events.
 *
 * @param prefs_data A valid prefs data handle
 * @param type The type of event to unregister
 * @param cb The callback function being used to this event
 * @param cb_data The data pointer being passed to @a cb on this event
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * @see #Elm_Prefs_Data_Event_Type for more details on the events.
 * @see elm_prefs_data_event_callback_add()
 *
 * @note If a same event callback (with matching type, callback
 * function and data pointers) was added more than once on
 * @a prefs_data, them same number of matching calls of this type have to
 * issued to delete all them.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_prefs_data_event_callback_del(prefs_data:PElm_Prefs_Data; _type:TElm_Prefs_Data_Event_Type; cb:TElm_Prefs_Data_Event_Cb; cb_data:pointer):TEina_Bool;cdecl;external;
{*
 * Set whether a given elm prefs data handle should save its values
 * back automatically on changes.
 *
 * @param prefs_data A valid prefs data handle
 * @param autosave @c EINA_TRUE to save automatically, @c EINA_FALSE otherwise.
 *
 * If @a autosave is @c EINA_TRUE, every call to
 * elm_prefs_data_value_set() will implicitly issue elm_prefs_data_save() too.
 *
 * @warning This call will do nothing if @a prefs_data was created
 * with mode EET_FILE_MODE_READ -- auto saving will be always disabled
 * in this mode, as it can't write back.
 *
 * @see elm_prefs_data_autosave_get()
 *
 * @since 1.8
  }
procedure elm_prefs_data_autosave_set(prefs_data:PElm_Prefs_Data; autosave:TEina_Bool);cdecl;external;
{*
 * Get whether a given elm prefs data handle is saving its values
 * back automatically on changes.
 *
 * @param prefs_data A valid prefs data handle
 * @return @c EINA_TRUE if @a prefs_data is saving automatically,
 *         @c EINA_FALSE otherwise.
 *
 * @see elm_prefs_data_autosave_set()
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_prefs_data_autosave_get(prefs_data:PElm_Prefs_Data):TEina_Bool;cdecl;external;
{*
 * Save, manually, a given elm prefs data handle data back, on the given
 * file and key.
 *
 * @param prefs_data A valid prefs data handle
 * @param file The file (path) to save to (@c NULL means same file as
 *             it was opened with)
 * @param key The under which to save values (@c NULL means the same
 *            key as it was opened with)
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @see elm_prefs_data_autosave_set()
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_data_save(prefs_data:PElm_Prefs_Data; file:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @
  }

implementation


end.
