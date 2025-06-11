
unit efreet_desktop;
interface

{
  Automatically converted by H2Pas 1.0.0 from efreet_desktop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efreet_desktop.h
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
PEfreet_Desktop  = ^Efreet_Desktop;
PEfreet_Desktop_Action  = ^Efreet_Desktop_Action;
PEfreet_Desktop_Command_Cb  = ^Efreet_Desktop_Command_Cb;
PEfreet_Desktop_Type_Free_Cb  = ^Efreet_Desktop_Type_Free_Cb;
PEfreet_Desktop_Type_Parse_Cb  = ^Efreet_Desktop_Type_Parse_Cb;
PEfreet_Ini  = ^Efreet_Ini;
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_DESKTOP_H}
{$define EFREET_DESKTOP_H}
{*
 * @file efreet_desktop.h
 * @brief Contains the structures and methods used to support the
 *        FDO desktop entry specificiation.
 * @addtogroup Efreet_Desktop Efreet_Desktop: The FDO Desktop Entry
 *                  Specification functions and structures
 * @ingroup Efreet
 *
 * @
  }
  var
    EFREET_DESKTOP_TYPE_APPLICATION : longint;cvar;external;
    EFREET_DESKTOP_TYPE_LINK : longint;cvar;external;
    EFREET_DESKTOP_TYPE_DIRECTORY : longint;cvar;external;
{*
 * Event id for cache update. All users of efreet_desktop_get must listen to
 * this event and refetch. The old eet cache will be closed and mem will
 * be invalidated.
  }
    EFREET_EVENT_DESKTOP_CACHE_UPDATE : longint;cvar;external;
{*
 * Event id for cache build complete.
 * @since 1.1.0
  }
    EFREET_EVENT_DESKTOP_CACHE_BUILD : longint;cvar;external;
{*
 * Efreet_Desktop_Action
 * @since 1.12
  }
type
{*
 * Efreet_Desktop
  }
{*
 * A callback used with efreet_desktop_command_get()
  }

  PEfreet_Desktop_Command_Cb = ^TEfreet_Desktop_Command_Cb;
  TEfreet_Desktop_Command_Cb = function (data:pointer; desktop:PEfreet_Desktop; command:Pchar; remaining:longint):pointer;cdecl;
{*
 * A callback used to get download progress of remote uris
  }

  TEfreet_Desktop_Progress_Cb = function (data:pointer; desktop:PEfreet_Desktop; uri:Pchar; total:longint; current:longint):longint;cdecl;
{*
 * A callback used to parse data for custom types
  }

  PEfreet_Desktop_Type_Parse_Cb = ^TEfreet_Desktop_Type_Parse_Cb;
  TEfreet_Desktop_Type_Parse_Cb = function (desktop:PEfreet_Desktop; ini:PEfreet_Ini):pointer;cdecl;
{*
 * A callback used to save data for custom types
  }

  TEfreet_Desktop_Type_Save_Cb = procedure (desktop:PEfreet_Desktop; ini:PEfreet_Ini);cdecl;
{*
 * A callback used to free data for custom types
  }

  PEfreet_Desktop_Type_Free_Cb = ^TEfreet_Desktop_Type_Free_Cb;
  TEfreet_Desktop_Type_Free_Cb = function (data:pointer):pointer;cdecl;
{*
 * Efreet_Desktop_Action
 * @brief an action described in a .desktop file
 * @since 1.12
  }
{*< Key to identify the action  }
{*< Specific name of the action  }
{*< Icon to display  }
{*< Program to execute  }
  PEfreet_Desktop_Action = ^TEfreet_Desktop_Action;
  TEfreet_Desktop_Action = record
      key : Pchar;cdecl;
      name : Pchar;
      icon : Pchar;
      exec : Pchar;
    end;

{*
 * Efreet_Desktop
 * @brief a parsed representation of a .desktop file
  }
{ Desktop Spec 1.0  }
{*< type of desktop file  }
{*< reference count - internal  }
{*< version of spec file conforms to  }
{*< original path to .desktop file  }
{*< modified time of .desktop on disk  }
{*< Specific name of the application  }
{*< Generic name of the application  }
{*< Tooltip for the entry  }
{*< Icon to display in file manager, menus, etc  }
{*< Binary to determine if app is installed  }
{*< Program to execute  }
{*< Working directory to run app in  }
{*< If specified will map at least one window with
                                the given string as it's WM class or WM name  }
{*< URL to access if type is EFREET_TYPE_LINK  }
{*< list of environments that should
                                                    display the icon  }
{*< list of environments that shoudn't
                                                    display the icon  }
{*< Categories in which item should be shown  }
{*< The mime types supppored by this app  }
{*< Don't display this application in menus  }
{*< User delete the item  }
{*< Does the program run in a terminal  }
{*< The starup notify settings of the app  }
{*< The desktop file is in eet cache  }
{*< Keep track of all user extensions, keys that begin with X-  }
{*< Type specific data for custom types  }
{ Desktop Spec 1.1  }
{*< Activate application by dbus, not Exec. @since 1.12  }
{*< List of Efreet_Desktop_Actions, application actions. @since 1.12  }
{*< Interfaces which is file implements. @since 1.12  }
{*< Keywords which describe this entry. @since 1.12  }
  PEfreet_Desktop = ^TEfreet_Desktop;
  TEfreet_Desktop = record
      _type : longint;
      ref : longint;
      version : Pchar;
      orig_path : Pchar;
      load_time : int64;
      name : Pchar;
      generic_name : Pchar;
      comment : Pchar;
      icon : Pchar;
      try_exec : Pchar;
      exec : Pchar;
      path : Pchar;
      startup_wm_class : Pchar;
      url : Pchar;
      only_show_in : PEina_List;
      not_show_in : PEina_List;
      categories : PEina_List;
      mime_types : PEina_List;
      no_display : byte;
      hidden : byte;
      terminal : byte;
      startup_notify : byte;
      flag0 : word;
      x : PEina_Hash;
      type_data : pointer;
      dbus_activatable : byte;
      actions : PEina_List;
      implements : PEina_List;
      keywords : PEina_List;
    end;


const
  bm_TEfreet_Desktop_eet = $1;
  bp_TEfreet_Desktop_eet = 0;

function eet(var a : TEfreet_Desktop) : byte;
procedure set_eet(var a : TEfreet_Desktop; __eet : byte);
{*
 * @param file The file to get the Efreet_Desktop from
 * @return Returns a reference to a cached Efreet_Desktop on success, NULL
 * on failure
 * @brief Gets a reference to an Efreet_Desktop structure representing the
 * contents of @a file or NULL if @a file is not a valid .desktop file.
 *
 * By using efreet_desktop_get the Efreet_Desktop will be saved in an internal
 * cache for quicker loading.
 *
 * Users of this command should listen to EFREET_EVENT_DESKTOP_CACHE_UPDATE
 * event, if the application is to keep the reference. When the event fires
 * the Efreet_Desktop struct should be invalidated and reloaded from a new
 * cache file.
  }
(* Const before type ignored *)

function efreet_desktop_get(file:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * @param desktop The Efreet_Desktop to ref
 * @return Returns the new reference count
 * @brief Increases reference count on desktop
  }
function efreet_desktop_ref(desktop:PEfreet_Desktop):longint;cdecl;external;
{*
 * @param file The file to create the Efreet_Desktop from
 * @return Returns a new empty_Efreet_Desktop on success, NULL on failure
 * @brief Creates a new empty Efreet_Desktop structure or NULL on failure
  }
(* Const before type ignored *)
function efreet_desktop_empty_new(file:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * @param file The file to get the Efreet_Desktop from
 * @return Returns a reference to a cached Efreet_Desktop on success, NULL
 * on failure
 * @brief Gets a reference to an Efreet_Desktop structure representing the
 * contents of @a file or NULL if @a file is not a valid .desktop file.
 *
 * Users of this command should listen to EFREET_EVENT_DESKTOP_CACHE_UPDATE
 * event, if the application is to keep the reference. When the event fires
 * the Efreet_Desktop struct should be invalidated and reloaded from a new
 * cache file.
  }
(* Const before type ignored *)
function efreet_desktop_new(file:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * @param file The file to create the Efreet_Desktop from
 * @return Returns a new Efreet_Desktop on success, NULL on failure
 * @brief Creates a new Efreet_Desktop structure initialized from the
 * contents of @a file or NULL on failure
 *
 * By using efreet_desktop_uncached_new the Efreet_Desktop structure will be
 * read from disk, and not from any cache.
 *
 * Data in the structure is allocated with strdup, so use free and strdup to
 * change values.
  }
(* Const before type ignored *)
function efreet_desktop_uncached_new(file:Pchar):PEfreet_Desktop;cdecl;external;
{*
 * @param desktop The Efreet_Desktop to work with
 * @return Returns no value
 * @brief Frees the Efreet_Desktop structure and all of it's data
  }
procedure efreet_desktop_free(desktop:PEfreet_Desktop);cdecl;external;
{*
 * @def efreet_desktop_unref(desktop)
 * Alias for efreet_desktop_free(desktop)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efreet_desktop_unref(desktop : longint) : longint;

{*
 * @param desktop The desktop file to save
 * @return Returns 1 on success or 0 on failure
 * @brief Saves any changes made to @a desktop back to the file on the
 * filesystem
  }
function efreet_desktop_save(desktop:PEfreet_Desktop):longint;cdecl;external;
{*
 * @param desktop The desktop file to save
 * @param file The filename to save as
 * @return Returns 1 on success or 0 on failure
 * @brief Saves @a desktop to @a file
 *
 * Please use efreet_desktop_uncached_new() on an existing file
 * before using efreet_desktop_save_as()
  }
(* Const before type ignored *)
function efreet_desktop_save_as(desktop:PEfreet_Desktop; file:Pchar):longint;cdecl;external;
{*
 * @param desktop The desktop file to work with
 * @param files The files to be substituted into the exec line
 * @param data The data pointer to pass
 * @brief Parses the @a desktop exec line and runs the command.
  }
procedure efreet_desktop_exec(desktop:PEfreet_Desktop; files:PEina_List; data:pointer);cdecl;external;
{*
 * @param environment the environment name
 * @brief sets the global desktop environment name
  }
(* Const before type ignored *)
procedure efreet_desktop_environment_set(environment:Pchar);cdecl;external;
{*
 * @return environment the environment name
 * @brief gets the global desktop environment name
 * (e.g. "Enlightenment" or "Gnome")
  }
(* Const before type ignored *)
function efreet_desktop_environment_get:Pchar;cdecl;external;
{*
 * @param desktop the desktop entry
 * @param files an eina list of file names to execute, as either absolute paths,
 * relative paths, or uris
 * @param cb_command a callback to call for each prepared command line
 * @param cb_prog a callback to get progress for the downloads
 * @param data user data passed to the callback
 * @return Returns 1 on success or 0 on failure
 * @brief Get a command to use to execute a desktop entry, and receive progress
 * updates for downloading of remote URI's passed in.
  }
function efreet_desktop_command_progress_get(desktop:PEfreet_Desktop; files:PEina_List; cb_command:TEfreet_Desktop_Command_Cb; cb_prog:TEfreet_Desktop_Progress_Cb; data:pointer):pointer;cdecl;external;
{*
 * @param desktop the desktop entry
 * @param files an eina list of file names to execute, as either absolute paths,
 * relative paths, or uris
 * @param func a callback to call for each prepared command line
 * @param data user data passed to the callback
 * @return Returns the return value of @p func on success or NULL on failure
 * @brief Get a command to use to execute a desktop entry.
  }
function efreet_desktop_command_get(desktop:PEfreet_Desktop; files:PEina_List; func:TEfreet_Desktop_Command_Cb; data:pointer):pointer;cdecl;external;
{*
 * @param desktop the desktop entry
 * @param files an eina list of local files, as absolute paths, local paths, or file// uris (or NULL to get exec string with no files appended)
 * @return Returns an eina list of exec strings
 * @brief Get the command to use to execute a desktop entry
 *
 * The returned list and each of its elements must be freed.
  }
function efreet_desktop_command_local_get(desktop:PEfreet_Desktop; files:PEina_List):PEina_List;cdecl;external;
{*
 * @param desktop The desktop to work with
 * @return Returns the number of categories assigned to this desktop
 * @brief Retrieves the number of categories the given @a desktop belongs
 * too
  }
function efreet_desktop_category_count_get(desktop:PEfreet_Desktop):dword;cdecl;external;
{*
 * @param desktop the desktop
 * @param category the category name
 * @brief add a category to a desktop
  }
(* Const before type ignored *)
procedure efreet_desktop_category_add(desktop:PEfreet_Desktop; category:Pchar);cdecl;external;
{*
 * @param desktop the desktop
 * @param category the category name
 * @brief removes a category from a desktop
 * @return 1 if the desktop had his category listed, 0 otherwise
  }
(* Const before type ignored *)
function efreet_desktop_category_del(desktop:PEfreet_Desktop; category:Pchar):longint;cdecl;external;
{*
 * @param type The type to add to the list of matching types
 * @param parse_func a function to parse out custom fields
 * @param save_func a function to save data returned from @a parse_func
 * @param free_func a function to free data returned from @a parse_func
 * @return Returns the id of the new type
 * @brief Adds the given type to the list of types in the system
  }
(* Const before type ignored *)
function efreet_desktop_type_add(_type:Pchar; parse_func:TEfreet_Desktop_Type_Parse_Cb; save_func:TEfreet_Desktop_Type_Save_Cb; free_func:TEfreet_Desktop_Type_Free_Cb):longint;cdecl;external;
{*
 * @brief Add an alias for an existing desktop type.
 * @param from_type the type to alias (e.g. EFREE_DESKTOP_TYPE_APPLICATION)
 * @param alias the alias
 * @return the new type id, or -1 if @p from_type was not valid
 *
 * This allows applications to add non-standard types that behave exactly as standard types.
  }
(* Const before type ignored *)
function efreet_desktop_type_alias(from_type:longint; alias:Pchar):longint;cdecl;external;
{*
 * @brief get type specific data for custom desktop types
 * @param desktop the desktop
 * @return type specific data, or NULL if there is none
  }
function efreet_desktop_type_data_get(desktop:PEfreet_Desktop):pointer;cdecl;external;
{*
 * @param string the raw string list
 * @return an Eina_List of ecore string's
 * @brief Parse ';' separate list of strings according to the desktop spec
  }
(* Const before type ignored *)
function efreet_desktop_string_list_parse(_string:Pchar):PEina_List;cdecl;external;
{*
 * @param list Eina_List with strings
 * @return a raw string list
 * @brief Create a ';' separate list of strings according to the desktop spec
  }
function efreet_desktop_string_list_join(list:PEina_List):Pchar;cdecl;external;
{*
 * @brief Set the value for a X- field (Non spec) in the structure
 * @param desktop the desktop
 * @param key the key name to set
 * @param data the value to set
 * @return EINA_TRUE on success
 *
 * The key has to start with "X-"
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_desktop_x_field_set(desktop:PEfreet_Desktop; key:Pchar; data:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the value for a X- field (Non spec) in the structure
 * @param desktop the desktop
 * @param key the key
 * @return The value referenced by the key, or NULL if the key does not exist
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_desktop_x_field_get(desktop:PEfreet_Desktop; key:Pchar):Pchar;cdecl;external;
{*
 * @brief Delete the key and value for a X- field (Non spec) in the structure
 * @param desktop the desktop
 * @param key the key
 * @return EINA_TRUE if the key existed
  }
(* Const before type ignored *)
function efreet_desktop_x_field_del(desktop:PEfreet_Desktop; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @
  }
{$endif}

implementation

function eet(var a : TEfreet_Desktop) : byte;
begin
  eet:=(a.flag0 and bm_TEfreet_Desktop_eet) shr bp_TEfreet_Desktop_eet;
end;

procedure set_eet(var a : TEfreet_Desktop; __eet : byte);
begin
  a.flag0:=a.flag0 or ((__eet shl bp_TEfreet_Desktop_eet) and bm_TEfreet_Desktop_eet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efreet_desktop_unref(desktop : longint) : longint;
begin
  efreet_desktop_unref:=efreet_desktop_free(desktop);
end;


end.
