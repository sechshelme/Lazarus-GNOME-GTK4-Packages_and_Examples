
unit Edje_Edit;
interface

{
  Automatically converted by H2Pas 1.0.0 from Edje_Edit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Edje_Edit.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
PEdje_Edit_Entry_Mode  = ^Edje_Edit_Entry_Mode;
PEdje_Edit_Image_Comp  = ^Edje_Edit_Image_Comp;
PEdje_Edit_Limit  = ^Edje_Edit_Limit;
PEdje_Edit_Script_Error  = ^Edje_Edit_Script_Error;
PEdje_Edit_Select_Mode  = ^Edje_Edit_Select_Mode;
PEdje_Edit_Sound_Comp  = ^Edje_Edit_Sound_Comp;
PEdje_External_Param_Type  = ^Edje_External_Param_Type;
PEdje_Part_Image_Use  = ^Edje_Part_Image_Use;
PEina_Binbuf  = ^Eina_Binbuf;
PEina_Bool  = ^Eina_Bool;
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PEvas  = ^Evas;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EDJE_EDIT_H}
{$define _EDJE_EDIT_H}
{$ifndef EDJE_EDIT_IS_UNSTABLE_AND_I_KNOW_ABOUT_IT}
{$error "Do not use the Edje_Edit API unless you know what you are doing. It's meant only for writing editors and nothing else."}
{$endif}
{$include <Edje.h>}
{*
 * Compression type for the image.
 *
 * @ref edcref
  }
type
  PEdje_Edit_Image_Comp = ^TEdje_Edit_Image_Comp;
  TEdje_Edit_Image_Comp =  Longint;
  Const
    EDJE_EDIT_IMAGE_COMP_RAW = 0;
    EDJE_EDIT_IMAGE_COMP_USER = 1;
    EDJE_EDIT_IMAGE_COMP_COMP = 2;
    EDJE_EDIT_IMAGE_COMP_LOSSY = 3;
    EDJE_EDIT_IMAGE_COMP_LOSSY_ETC1 = 4;
    EDJE_EDIT_IMAGE_COMP_LOSSY_ETC2 = 5;
;
{*
 * Mode for a textblock part.
 *
 * @ref edcref
  }
type
  PEdje_Edit_Select_Mode = ^TEdje_Edit_Select_Mode;
  TEdje_Edit_Select_Mode =  Longint;
  Const
    EDJE_EDIT_SELECT_MODE_DEFAULT = 0;
    EDJE_EDIT_SELECT_MODE_EXPLICIT = 1;
;
{*
 * Sound type compression.
 *
 * @ref edcref
  }
type
  PEdje_Edit_Sound_Comp = ^TEdje_Edit_Sound_Comp;
  TEdje_Edit_Sound_Comp =  Longint;
  Const
    EDJE_EDIT_SOUND_COMP_NONE = 0;
    EDJE_EDIT_SOUND_COMP_RAW = 1;
    EDJE_EDIT_SOUND_COMP_COMP = 2;
    EDJE_EDIT_SOUND_COMP_LOSSY = 3;
    EDJE_EDIT_SOUND_COMP_AS_IS = 4;
;
{*
 * Mode for a textblock part.
 *
 * @ref edcref
  }
type
  PEdje_Edit_Entry_Mode = ^TEdje_Edit_Entry_Mode;
  TEdje_Edit_Entry_Mode =  Longint;
  Const
    EDJE_EDIT_ENTRY_MODE_NONE = 0;
    EDJE_EDIT_ENTRY_MODE_PLAIN = 1;
    EDJE_EDIT_ENTRY_MODE_EDITABLE = 2;
    EDJE_EDIT_ENTRY_MODE_PASSWORD = 3;
;
{*
 * @typedef Edje_Edit_Script_Error
 *
 * This is structure used for the list of errors that resulted from the last
 * attempt to rebuild the Embryo script for the edited group.
 *
 * @see edje_edit_script_error_list_get()
  }
(* Const before type ignored *)
{*< name of the script, if null then it is group shared script  }
{*< Line of the error inside in scriptcode  }
(* Const before type ignored *)
{*< Error Message  }
type
  PEdje_Edit_Script_Error = ^TEdje_Edit_Script_Error;
  TEdje_Edit_Script_Error = record
      program_name : Pchar;
      line : longint;
      error_str : Pchar;
    end;

{*
 * @typedef Edje_Part_Image_Use
 *
 * This is structure used for the list of group-part-state triplets where certain
 * image is being used and pointed.
 *
 * @see edje_edit_image_usage_list_get()
 * @see edje_edit_vector_usage_list_get()
 * @see edje_edit_image_usage_list_free()
  }
(* Const before type ignored *)
{*< name of group (or set) that use image  }
(* Const before type ignored *)
{*< name of part that use image  }
(* Const before type ignored *)
{*< name of the state  }
{*< value of the state (-1 if it is set)  }
{*< structure that contain state's information  }
  PEdje_Part_Image_Use = ^TEdje_Part_Image_Use;
  TEdje_Part_Image_Use = record
      group : Pchar;
      part : Pchar;
      state : record
          name : Pchar;
          value : Tdouble;
        end;
    end;

{*
 * @typedef Edje_Edit_Limit
 *
 * This is structure used for list with the item names inside the limits block.
 *
 * @see edje_edit_group_limits_vertical_list_get()
 * @see edje_edit_group_limits_horizontal_list_get()
 * @see edje_edit_group_limits_vertical_del()
 * @see edje_edit_group_limits_horizontal_del()
 * @see edje_edit_group_limits_vertical_add()
 * @see edje_edit_group_limits_horizontal_add()
 * @see edje_edit_limits_list_free()
  }
{*< name of the limit  }
{*< value of the limit  }
  PEdje_Edit_Limit = ^TEdje_Edit_Limit;
  TEdje_Edit_Limit = record
      name : PEina_Stringshare;
      value : longint;
    end;

{*
 * @file
 * @brief Functions to deal with edje internal object. Don't use in standard
 * situations. The use of any of the edje_edit_* functions can break your
 * theme ability, remember that the program must be separated from the interface!
 *
 * This was intended ONLY for use in an actual edje editor program. Unless
 * you are writing one of these, do NOT use this API here.
 *
 * The API can be used to query or set every part of an edje object in real time.
 * You can manage every aspect of parts, part states, programs, script and whatever
 * is contained in the edje file. For a reference of what all parameter means
 * look at the complete @ref edcref.
 *
 * Don't forget to free all the strings and the lists returned by any edje_edit_*()
 * functions using edje_edit_string_free() and edje_edit_string_list_free() when
 * you don't need anymore.
 *
 * Example: print all the part in a loaded edje_object
 * @code
 *  Eina_List *parts, *l;
 *  char *part;
 *
 *  parts = edje_edit_parts_list_get(edje_object);
 *  EINA_LIST_FOREACH(parts, l, part)
 *  
 *     printf("Part: %s\n", part);
 *  
 *  edje_edit_string_list_free(parts);
 * @endcode
 *
 * Example: Change the color of a rect inside an edje file
 * @code
 * Evas_Object *edje;
 *
 * edje = edje_edit_object_add(evas);
 * edje_object_file_set(edje, "edj/file/name", "group to load");
 * edje_edit_state_color_set(edje, "MyRectName", "default", 0.00, 255, 255, 0, 255);
 * edje_edit_save(edje);
 * @endcode
 *
 }
{ C++ extern C conditionnal removed }
{**************************************************************************** }
{*************************   GENERAL API   ********************************** }
{**************************************************************************** }
{*
 * @name General API
 * General functions that don't fit in other categories.
  }{@ }
{*
 * @brief Adds an editable Edje object to the canvas.
 * An Edje_Edit object is, for the most part, a standard Edje object. Only
 * difference is you can use the Edje_Edit API on them.
 *
 * @param e Evas canvas where to add the object.
 *
 * @return An Evas_Object of type Edje_Edit, or NULL if an error occurred.
  }

function edje_edit_object_add(e:PEvas):PEvas_Object;cdecl;external;
{*
 * @brief Frees a generic Eina_List of (char *) allocated by an edje_edit_*_get() function.
 * @param lst List of strings to free.
  }
procedure edje_edit_string_list_free(lst:PEina_List);cdecl;external;
{*
 * @brief Frees a generic string (char *) allocated by an edje_edit_*_get() function.
 * @param str String to free.
  }
(* Const before type ignored *)
procedure edje_edit_string_free(str:Pchar);cdecl;external;
{*
 * @brief Gets the name of the program that compiled the edje file.
 * Can be 'edje_cc' or 'edje_edit'
 *
 * @param obj Object being edited.
 *
 * @return Compiler stored in the Edje file
  }
(* Const before type ignored *)
function edje_edit_compiler_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Saves the modified edje object back to his file.
 * Use this function when you are done with your editing, all the change made
 * to the current loaded group will be saved back to the original file.
 *
 * @note Source for the whole file will be auto generated and will overwrite
 * any previously stored source.
 *
 * @param obj Object to save back to the file it was loaded from.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @todo Add a way to check what the error actually was, the way Edje Load does.
  }
function edje_edit_save(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Saves every group back into the file.
 * @param obj Object to save.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_save()
  }
function edje_edit_save_all(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Saves every group into new file.
 * Use this function when you need clean eet dictionary in .edj file from
 * unnecessary text entries (e.g. names of deleted groups etc.).
 *
 * @param obj Object to save.
 * @param new_file_name Where to save object. File should not exist, otherwise
 * EINA_FALSE will be returned.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_save()
  }
(* Const before type ignored *)
function edje_edit_clean_save_as(obj:PEvas_Object; new_file_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Saves the group(s) back to the file, without generation source code.
 * This function saves changes in group(s) back into the edj file. Process of
 * saving takes a bit time in compare with @see edje_edit_save() and @see edje_edit_save_all(),
 * because this function DOES NOT generate source code for groups.
 *
 * @note With using this function all source code will be erased. And DOES NOT
 * generated new code. In attempt to decompile edj file, which was saved with
 * using this functions will unpacked only resources(like fonts, images, sounds).
 * If needed saving source code into file, please use  @see edje_edit_save() or
 * @see edje_edit_save_all().

 * @param obj Object to save back to the file it was loaded from.
 * @param current_group EINA_TRUE if needed save only group which loaded with obj,
 * or EINA_FALSE for save all groups, which exists in edj file.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
function edje_edit_without_source_save(obj:PEvas_Object; current_group:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Prints on standard output many information about the internal status
 * of the edje object.
 *
 * This is probably only useful to debug.
 *
 * @param obj Object being edited.
  }
procedure edje_edit_print_internal_status(obj:PEvas_Object);cdecl;external;
{@ }
{**************************************************************************** }
{*************************   GROUPS API   *********************************** }
{**************************************************************************** }
{*
 * @name Groups API
 * Functions to deal with groups property (see @ref edcref).
  }{@ }
{*
 * @brief Adds an edje (empty) group to an edje object's group set.
 *
 * @param obj The pointer to edje object.
 * @param name The name of the group.
 *
 * @return @c EINA_TRUE If it could allocate memory to the part group added
 * or zero if not.
 *
 * This function adds, at run time, one more group, which will reside
 * in memory, to the group set found in the .edj file which @a obj was
 * loaded with. This group can be manipulated by other API functions,
 * like @c edje_edit_part_add(), for example. If desired, the new
 * group can be actually committed the respective .edj by use of @c
 * edje_edit_save().
 *
  }
(* Const before type ignored *)
function edje_edit_group_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Copies whole group and all it's data into separate group.
 *
 * @param obj The pointer to edje object.
 * @param group_name The name of the group.
 * @param copy_name The name of the new group that is a copy.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * This function copy, at run time, a whole group, which will reside
 * in memory, to the group set found in the .edj file which @a obj was
 * loaded with. This group can be manipulated by other API functions,
 * like @c edje_edit_part_add(), for example.
 *
 * You need to save everything to make sure the file won't have broken
 * references the next time is loaded.
 * @see edje_edit_save_all(), edje_edit_without_source_save().
 *
 * @attention This group will copy the whole group and this operation can't be undone as all references to the group will be added to the file.
 * (for example all scripts will be written to the file directly)
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_copy(obj:PEvas_Object; group_name:Pchar; copy_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the specified group from the edje file.
 *
 * @param obj The pointer to the edje object.
 * @param group_name Group to delete.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * This function deletes the given group from the file @a obj is set to. This
 * operation can't be undone as all references to the group are removed from
 * the file.
 * This function may fail if the group to be deleted is currently in use.
 * You need to save everything to make sure the file won't have broken
 * references the next time is loaded.
 * @see edje_edit_save_all(), edje_edit_without_source_save().
 *
 * @attention be careful, if you deleting group, it will delete all it's aliases also,
 * if you deleting alias, then it will delete alias only.
 *
  }
(* Const before type ignored *)
function edje_edit_group_del(obj:PEvas_Object; group_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if a group with the given name exist in the edje.
 * @param obj Object being edited.
 * @param group Group name to check for.
 *
 * @return @c EINA_TRUE if group exists, @c EINA_FALSE if not.
  }
(* Const before type ignored *)
function edje_edit_group_exist(obj:PEvas_Object; group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets a new name for the current open group.
 *
 * You can only rename a group that is currently loaded
 * Note that the relative getter function don't exist as it doesn't make sense ;)
 * @param obj Object being edited.
 * @param new_name New name for the group.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_name_set(obj:PEvas_Object; new_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the group minimum width.
 *
 * @param obj Object being edited.
 *
 * @return The minimum width set for the group. -1 if an error occurred.
  }
function edje_edit_group_min_w_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Sets the group minimum width.
 *
 * @param obj Object being edited.
 * @param w New minimum width for the group.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
function edje_edit_group_min_w_set(obj:PEvas_Object; w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the group minimum height.
 *
 * @param obj Object being edited.
 *
 * @return The minimum height set for the group. @c -1 if an error occurred.
  }
function edje_edit_group_min_h_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Sets the group minimum height.
 *
 * @param obj Object being edited.
 * @param h New minimum height for the group.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
function edje_edit_group_min_h_set(obj:PEvas_Object; h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the group maximum width.
 *
 * @param obj Object being edited.
 *
 * @return The maximum width set for the group. @c -1 if an error occurred.
  }
function edje_edit_group_max_w_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Sets the group maximum width.
 *
 * @param obj Object being edited.
 * @param w New maximum width for the group.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
function edje_edit_group_max_w_set(obj:PEvas_Object; w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the group maximum height.
 *
 * @param obj Object being edited.
 *
 * @return The maximum height set for the group. @c -1 if an error occurred.
  }
function edje_edit_group_max_h_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Sets the group maximum height.
 *
 * @param obj Object being edited.
 * @param h New maximum height for the group.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
function edje_edit_group_max_h_set(obj:PEvas_Object; h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the group broadcast_signal.
 *
 * @param obj Object being edited.
 *
 * @return @c EINA_FALSE if group not accept broadcast signal, @c EINA_TRUE otherwise (Default to true since 1.1.).
 * @since 1.11
  }
function edje_edit_group_broadcast_signal_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Sets the group broadcast signal.
 *
 * @param obj Object being edited.
 * @param bs @c EINA_TRUE if group will accept broadcast signal, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
function edje_edit_group_broadcast_signal_set(obj:PEvas_Object; bs:TEina_Bool):TEina_Bool;cdecl;external;
{@ }
{*
 * @brief Retrieves a list with the item names inside the vertical limits block at the group level.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being a name of vertical limit in the limits block for the group.
  }
function edje_edit_group_limits_vertical_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Deletes given pair name-value from the vertical limits block at the group level.
 *
 * @param obj Object being edited.
 * @param name Limit name.
 * @param value Limit value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_limits_vertical_del(obj:PEvas_Object; name:Pchar; value:longint):TEina_Bool;cdecl;external;
{*
 * @brief Adds given pair name-value to the vertical limits block at the group level.
 *
 * @param obj Object being edited.
 * @param name Limit name.
 * @param value Limit value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_limits_vertical_add(obj:PEvas_Object; name:Pchar; value:longint):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves a list with the item names inside the horizontal limits block at the group level.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being a name of horizontal limit in the limits block for the group.
  }
function edje_edit_group_limits_horizontal_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Deletes given pair name-value from the horizontal limits block at the group level.
 *
 * @param obj Object being edited.
 * @param name Limit name.
 * @param value Limit value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_limits_horizontal_del(obj:PEvas_Object; name:Pchar; value:longint):TEina_Bool;cdecl;external;
{*
 * @brief Adds given pair name-value to the horizontal limits block at the group level.
 *
 * @param obj Object being edited.
 * @param name Limit name.
 * @param value Limit value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_limits_horizontal_add(obj:PEvas_Object; name:Pchar; value:longint):TEina_Bool;cdecl;external;
{*
 @brief Frees an Eina_List of (Edje_Edit_List *) allocated by an edje_edit_limits_vertical_list_get() or edje_edit_limits_horizontal_list_get() functions.
 *
 * @param lst List to free.
  }
procedure edje_edit_limits_list_free(lst:PEina_List);cdecl;external;
{**************************************************************************** }
{*************************   ALIAS API   ************************************* }
{**************************************************************************** }
{*
 * @name Alias API
 * Functions to deal with aliases that just another names of the group in the edje (see @ref edcref).
  }{@ }
{*
 * @brief Retrieves a list of aliases for this group.
 * If given group name is an alias name then this function will return NULL.
 *
 * @attention After you done using returned list, please use edje_edit_string_list_free to free this list.
 *
 * @param obj Object being edited.
 * @param group_name Group name or alias.
 *
 * @return List of strings, each being a name of alias of given group or alias name.
  }
(* Const before type ignored *)
function edje_edit_group_aliases_get(obj:PEvas_Object; group_name:Pchar):PEina_List;cdecl;external;
{*
 * @brief Checks if this group is an alias name.
 *
 * @param obj Object being edited.
 * @param alias_name Group name that is alias.
 *
 * @return @c EINA_TRUE if alias, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_alias_is(obj:PEvas_Object; alias_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Returns the main group name that is aliased by given alias name.
 *
 * @attention After you done using this string, please use edje_edit_string_free to free this string.
 *
 * @param obj Object being edited.
 * @param alias_name Group name that is alias.
 *
 * @return name of the main group that is being aliased.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_aliased_get(obj:PEvas_Object; alias_name:Pchar):Pchar;cdecl;external;
{*
 * @brief Adds new alias to the given group.
 *
 * @attention when aliasing a group, be sure that the given group_name is no an alias.
 *
 * @param obj Object being edited.
 * @param group_name Group name that is being aliased.
 * @param alias_name Group name that is alias.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_alias_add(obj:PEvas_Object; group_name:Pchar; alias_name:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   DATA API   ************************************* }
{**************************************************************************** }
{*
 * @name Data API
 * Functions to deal with data embedded in the edje (see @ref edcref).
  }{@ }
{*
 * @brief Retrieves a list with the item names inside the data block.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being a name entry in the global data block for the file.
  }
function edje_edit_data_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new *global* data object in the given edje file.
 *
 * If another data entry with the same name exists, nothing is created and
 * EINA_FALSE is returned.
 *
 * @param obj Object being edited.
 * @param itemname Name for the new data entry.
 * @param value Value for the new data entry.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_data_add(obj:PEvas_Object; itemname:Pchar; value:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given data object from edje.
 *
 * @param obj Object being edited.
 * @param itemname Data entry to remove from the global data block.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_data_del(obj:PEvas_Object; itemname:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the data associated with the given itemname.
 *
 * @param obj Object being edited.
 * @param itemname Name of the data entry to fetch the value for.
 *
 * @return Value of the given entry, or NULL if not found.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_data_value_get(obj:PEvas_Object; itemname:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the data associated with the given itemname.
 *
 * @param obj Object being edited.
 * @param itemname Name of data entry to change the value.
 * @param value New value for the entry.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_data_value_set(obj:PEvas_Object; itemname:Pchar; value:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Changes the name of the given data object.
 *
 * @param obj Object being edited.
 * @param itemname Data entry to rename.
 * @param newname New name for the data entry.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_data_name_set(obj:PEvas_Object; itemname:Pchar; newname:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves a list with the item names inside the data block at the group level.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being a name entry in the data block for the group.
  }
function edje_edit_group_data_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new data object in the given edje file *belonging to the current group*.
 *
 * If another data entry with the same name exists,
 * nothing is created and EINA_FALSE is returned.
 *
 * @param obj Object being edited.
 * @param itemname Name for the new data entry.
 * @param value Value for the new data entry.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_data_add(obj:PEvas_Object; itemname:Pchar; value:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given data object from the group.
 *
 * @param obj Object being edited.
 * @param itemname Name of the data entry to remove.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_group_data_del(obj:PEvas_Object; itemname:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the data associated with the given itemname.
 *
 * @param obj Object being edited.
 * @param itemname Name of the data entry.
 *
 * @return Value of the data entry or NULL if not found.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_data_value_get(obj:PEvas_Object; itemname:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the data associated with the given itemname.
 *
 * @param obj Object being edited.
 * @param itemname Name of the data entry to set the value.
 * @param value Value to set for the data entry.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_data_value_set(obj:PEvas_Object; itemname:Pchar; value:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Changes the name of the given data object.
 *
 * @param obj Object being edited.
 * @param itemname Name of the data entry to rename.
 * @param newname New name for the data entry.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_group_data_name_set(obj:PEvas_Object; itemname:Pchar; newname:Pchar):TEina_Bool;cdecl;external;
{@ }
{*************************************************************************** }
{**********************   SIZE CLASSES API   ******************************* }
{*************************************************************************** }
{*
 * @name Size Classes API
 * Functions to deal with Size Classes (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the Size Classes in the given edje object.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being one size class.
 *         The return value should be freed with edje_edit_string_list_free().
 *
 * @see edje_edit_string_list_free()
 *
 * @since 1.18
  }
function edje_edit_size_classes_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new size class object in the given edje.
 *
 * If class is already exist then nothing is created and EINA_FALSE returned.
 *
 * @param obj Object being edited.
 * @param name Name for the new size class.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes size class object from edje.
 *
 * @param obj Object being edited.
 * @param name Size class to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Changes name of a size class.
 *
 * @param obj Object being edited.
 * @param name Size class to rename.
 * @param newname New name for the size class.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_size_class_name_set(obj:PEvas_Object; name:Pchar; newname:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Returns width min size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to fetch values.
 *
 * @return @c Evas_Coord.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_min_w_get(obj:PEvas_Object; class_name:Pchar):TEvas_Coord;cdecl;external;
{*
 * @brief Sets width min size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to set values.
 * @param size Size which is greater or equal than zero (0).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_min_w_set(obj:PEvas_Object; class_name:Pchar; size:TEvas_Coord):TEina_Bool;cdecl;external;
{*
 * @brief Returns width max size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to fetch values.
 *
 * @return @c Evas_Coord.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_max_w_get(obj:PEvas_Object; class_name:Pchar):TEvas_Coord;cdecl;external;
{*
 * @brief Sets width max size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to set values.
 * @param size Size which is greater or equal than zero (0).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_max_w_set(obj:PEvas_Object; class_name:Pchar; size:TEvas_Coord):TEina_Bool;cdecl;external;
{*
 * @brief Returns height min size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to fetch values.
 *
 * @return @c Evas_Coord.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_min_h_get(obj:PEvas_Object; class_name:Pchar):TEvas_Coord;cdecl;external;
{*
 * @brief Sets height min size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to set values.
 * @param size Size which is greater or equal than zero (0).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_min_h_set(obj:PEvas_Object; class_name:Pchar; size:TEvas_Coord):TEina_Bool;cdecl;external;
{*
 * @brief Returns height max size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to fetch values.
 *
 * @return @c Evas_Coord (-1 is default value).
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_max_h_get(obj:PEvas_Object; class_name:Pchar):TEvas_Coord;cdecl;external;
{*
 * @brief Sets height max size of specified size class.
 *
 * @param obj Object being edited.
 * @param class_name Size class to set values.
 * @param size Size which is greater or equal minus one (-1, which is default value).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_size_class_max_h_set(obj:PEvas_Object; class_name:Pchar; size:TEvas_Coord):TEina_Bool;cdecl;external;
{@ }
{*************************************************************************** }
{**********************   TEXT CLASSES API   ******************************* }
{*************************************************************************** }
{*
 * @name Text Classes API
 * Functions to deal with Text Classes (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the Text Classes in the given edje object.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being one text class.
 *         The return value should be freed with edje_edit_string_list_free().
 *
 * @see edje_edit_string_list_free()
 *
 * @since 1.18
  }
function edje_edit_text_classes_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new text class object in the given edje.
 *
 * If class is already exist then nothing is created and EINA_FALSE returned.
 *
 * @param obj Object being edited.
 * @param name Name for the new text class.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_text_class_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes text class object from edje.
 *
 * @param obj Object being edited.
 * @param name Text class to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_text_class_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Changes name of a text class.
 *
 * @param obj Object being edited.
 * @param name Text class to rename.
 * @param newname New name for the text class.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_text_class_name_set(obj:PEvas_Object; name:Pchar; newname:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Returns font name of specified text class.
 *
 * @param obj Object being edited.
 * @param class_name Text class to fetch values.
 *
 * @return font name in case of success, NULL otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_text_class_font_get(obj:PEvas_Object; class_name:Pchar):PEina_Stringshare;cdecl;external;
{*
 * @brief Sets font for the given text class.
 *
 * NULL is possible value.
 *
 * @param obj Object being edited.
 * @param class_name Text class to set values.
 * @param font Name of font.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_text_class_font_set(obj:PEvas_Object; class_name:Pchar; font:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Returns font size of specified text class.
 *
 * @param obj Object being edited.
 * @param class_name Text class to fetch values.
 *
 * @return @c Evas_Font_Size.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_text_class_size_get(obj:PEvas_Object; class_name:Pchar):TEvas_Font_Size;cdecl;external;
{*
 * @brief Sets font size for specified text class
 *
 * @param obj Object being edited.
 * @param class_name Text class to set values.
 * @param size Font size which is greater or equal than zero (0).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_text_class_size_set(obj:PEvas_Object; class_name:Pchar; size:TEvas_Font_Size):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{**********************   COLOR CLASSES API   ******************************* }
{**************************************************************************** }
{*
 * @name Color Classes API
 * Functions to deal with Color Classes (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the Color Classes in the given edje object.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being one color class.
  }
function edje_edit_color_classes_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new color class object in the given edje.
 *
 * If another class with the same name exists nothing is created and EINA_FALSE is returned.
 *
 * @param obj Object being edited.
 * @param name Name for the new color class.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_color_class_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given class object from edje.
 *
 * @param obj Object being edited.
 * @param name Color class to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_color_class_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets all the colors that compose the class.
 *
 * You can pass NULL to colors you are not interested in.
 *
 * @param obj Object being edited.
 * @param class_name Color class to fetch values.
 * @param r Red component of main color.
 * @param g Green component of main color.
 * @param b Blue component of main color.
 * @param a Alpha component of main color.
 * @param r2 Red component of secondary color.
 * @param g2 Green component of secondary color.
 * @param b2 Blue component of secondary color.
 * @param a2 Alpha component of secondary color.
 * @param r3 Red component of tertiary color.
 * @param g3 Green component of tertiary color.
 * @param b3 Blue component of tertiary color.
 * @param a3 Alpha component of tertiary color.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_color_class_colors_get(obj:PEvas_Object; class_name:Pchar; r:Plongint; g:Plongint; b:Plongint; 
           a:Plongint; r2:Plongint; g2:Plongint; b2:Plongint; a2:Plongint; 
           r3:Plongint; g3:Plongint; b3:Plongint; a3:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the colors for the given color class.
 *
 * If you set a color to -1 it will not be touched.
 *
 * @param obj Object being edited.
 * @param class_name Color class to fetch values.
 * @param r Red component of main color.
 * @param g Green component of main color.
 * @param b Blue component of main color.
 * @param a Alpha component of main color.
 * @param r2 Red component of secondary color.
 * @param g2 Green component of secondary color.
 * @param b2 Blue component of secondary color.
 * @param a2 Alpha component of secondary color.
 * @param r3 Red component of tertiary color.
 * @param g3 Green component of tertiary color.
 * @param b3 Blue component of tertiary color.
 * @param a3 Alpha component of tertiary color.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_color_class_colors_set(obj:PEvas_Object; class_name:Pchar; r:longint; g:longint; b:longint; 
           a:longint; r2:longint; g2:longint; b2:longint; a2:longint; 
           r3:longint; g3:longint; b3:longint; a3:longint):TEina_Bool;cdecl;external;
{*
 * @brief Changes the name of a color class.
 *
 * @param obj Object being edited.
 * @param name Color class to rename.
 * @param newname New name for the color class.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_color_class_name_set(obj:PEvas_Object; name:Pchar; newname:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the description of a color class.
 *
 * @param obj Object being edited.
 * @param class_name Color class to get the description of.
 *
 * @return The description of the color class or @c NULL if not found
 * @since 1.14
  }
(* Const before type ignored *)
function edje_edit_color_class_description_get(obj:PEvas_Object; class_name:Pchar):PEina_Stringshare;cdecl;external;
{*
 * @brief Changes the description of a color class.
 *
 * @param obj Object being edited.
 * @param class_name Color class to edit.
 * @param desc New description for the color class
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_color_class_description_set(obj:PEvas_Object; class_name:Pchar; desc:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   TEXT STYLES ************************************ }
{**************************************************************************** }
{*
 * @name Text styles API
 * Functions to deal with text styles (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the text styles in the given edje object.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being the name for a text style.
  }
function edje_edit_styles_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new text style object in the given edje.
 *
 * If another style with the same name exists nothing is created and EINA_FALSE is returned.
 *
 * @param obj Object being edited.
 * @param style Name for the new style.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_style_add(obj:PEvas_Object; style:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given text style and all the child tags.
 *
 * @param obj Object being edited.
 * @param style Style to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_style_del(obj:PEvas_Object; style:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all the tags name in the given text style.
 *
 * @param obj Object being edited.
 * @param style Style to get the tags for.
 *
 * @return List of strings, each being one tag in the given style.
  }
(* Const before type ignored *)
function edje_edit_style_tags_list_get(obj:PEvas_Object; style:Pchar):PEina_List;cdecl;external;
{*
 * @brief Gets the value of the given tag.
 *
 * @param obj Object being edited.
 * @param style Style containing the tag being.
 * @param tag Tag to get the value for.
 *
 * @return Value of the given tag.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_style_tag_value_get(obj:PEvas_Object; style:Pchar; tag:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the value of the given tag.
 *
 * @param obj Object being edited.
 * @param style Style containing the tag to change.
 * @param tag Name of the tag to set the value for.
 * @param new_value Value for the tag.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_style_tag_value_set(obj:PEvas_Object; style:Pchar; tag:Pchar; new_value:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the name of the given tag.
 *
 * @param obj Object being edited.
 * @param style Style containing the tag to rename.
 * @param tag Tag to rename.
 * @param new_name New name for the tag.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_style_tag_name_set(obj:PEvas_Object; style:Pchar; tag:Pchar; new_name:Pchar):TEina_Bool;cdecl;external;
{*
 @ @brief Adds a new tag to the given text style.
 *
 * If another tag with the same name exists nothing is created and EINA_FALSE is returned.
 *
 * @param obj Object being edited.
 * @param style Style where to add the new tag.
 * @param tag_name Name for the new tag.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_style_tag_add(obj:PEvas_Object; style:Pchar; tag_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given tag.
 *
 * @param obj Object being edited.
 * @param style Style from where to remove the tag.
 * @param tag Tag to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_style_tag_del(obj:PEvas_Object; style:Pchar; tag:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{***********************   EXTERNALS API   ********************************** }
{**************************************************************************** }
{*
 * @name Externals API
 * Functions to deal with list of external modules (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the externals requested in the given edje object.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being an entry in the block of automatically loaded external modules.
  }
function edje_edit_externals_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Adds an external module to be requested on edje load.
 *
 * @param obj Object being edited.
 * @param external Name of the external module to add to the list of autoload.
 *
 * @return @c EINA_TRUE on success (or it was already there), @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_external_add(obj:PEvas_Object; external:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given external from the list.
 *
 * @param obj Object being edited.
 * @param external Name of the external module to remove from the autoload list.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_external_del(obj:PEvas_Object; external:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   PARTS API   ************************************ }
{**************************************************************************** }
{*
 * @name Parts API
 * Functions to deal with part objects (see @ref edcref).
  }{@ }
{*
 * @brief Gets the select mode for a textblock part.

 * @param obj Object being edited.
 * @param part Name of the part.
 *
 * @return One of possible enum Edje_Edit_Select_Mode.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_select_mode_get(obj:PEvas_Object; part:Pchar):TEdje_Edit_Select_Mode;cdecl;external;
{*
 * @brief Sets the select mode for a textblock part.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 * @param mode One of possible enum Edje_Edit_Select_Mode:
 * EDJE_EDIT_SELECT_MODE_DEFAULT, EDJE_EDIT_SELECT_MODE_EXPLICIT.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_select_mode_set(obj:PEvas_Object; part:Pchar; mode:TEdje_Edit_Select_Mode):TEina_Bool;cdecl;external;
{*
 * @brief Gets the edit mode for a textblock part.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 *
 * @return One of possible enum Edje_Entry_Mode.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_entry_mode_get(obj:PEvas_Object; part:Pchar):TEdje_Edit_Entry_Mode;cdecl;external;
{*
 * @brief Sets the edit mode for a textblock part.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 * @param mode One of possible enum Edje_Entry_Mode:
 * EDJE_EDIT_ENTRY_MODE_NONE, EDJE_EDIT_ENTRY_MODE_PLAIN, EDJE_EDIT_ENTRY_MODE_EDITABLE, EDJE_EDIT_ENTRY_MODE_PASSWORD.

 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_entry_mode_set(obj:PEvas_Object; part:Pchar; mode:TEdje_Edit_Entry_Mode):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all the parts in the given edje object.
 *
 * @param obj Object being edited.
 *
 * @return List of strings, each being the name for a part in the open group.
 *         The return value should be freed with edje_edit_string_list_free().
 *
 * @see edje_edit_string_list_free()
  }
function edje_edit_parts_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Creates a new part in the given edje.
 *
 * If another part with the same name just exists nothing is created and EINA_FALSE is returned.
 * Note that this function also create a default description for the part.
 *
 * @param obj Object being edited.
 * @param name Name for the new part.
 * @param type Type of the new part. See @ref edcref for more info on this.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_add(obj:PEvas_Object; name:Pchar; _type:TEdje_Part_Type):TEina_Bool;cdecl;external;
{*
 * @brief Creates a new part of type EXTERNAL in the given edje.
 *
 * If another part with the same name just exists nothing is created and EINA_FALSE is returned.
 * Note that this function also create a default description for the part.
 *
 * @param obj Object being edited.
 * @param name Name for the new part.
 * @param source The registered external type to use for this part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_external_add(obj:PEvas_Object; name:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given part from the edje.
 *
 * All the reference to this part will be zeroed.
 *
 * @param obj Object being edited.
 * @param part Name of part to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_del(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Copies the given part in edje.
 *
 * If another part with the same name just exists nothing is created and EINA_FALSE is returned.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 * @param new_copy Name of the new copied part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_copy(obj:PEvas_Object; part:Pchar; new_copy:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if a part with the given name exist in the edje object.
 *
 * @param obj Object being edited.
 * @param part Name of part to check for its existence.
 *
 * @return @c EINA_TRUE if the part exists, @c EINA_FALSE if not.
  }
(* Const before type ignored *)
function edje_edit_part_exist(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the name of part stacked above the one passed.
 *
 * @param obj Object being edited.
 * @param part Name of part of which to check the one above.
 *
 * @return Name of the part above. NULL if an error occurred or if @p part is
 * the topmost part in the group.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_above_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets the name of part stacked below the one passed.
 *
 * @param obj Object being edited.
 * @param part Name of part of which to check the one below.
 *
 * @return Name of the part below. NULL if an error occurred or if @p part is
 * the bottommost part in the group.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_below_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Moves the given part below the previous one.
 *
 * @param obj Object being edited.
 * @param part Name of part to move one step below.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_restack_below(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Moves the given part below the part named below.
 *
 * @param obj Object being edited.
 * @param part Name of part which will be moved.
 * @param below Name of part for which will be moved 'part'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_restack_part_below(obj:PEvas_Object; part:Pchar; below:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Moves the given part above the next one.
 *
 * @param obj Object being edited.
 * @param part Name of part to move one step above.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_restack_above(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Moves the given part above the part named above.
 *
 * @param obj Object being edited.
 * @param part Name of part which will be moved.
 * @param above Name of part for which will be moved 'part'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_restack_part_above(obj:PEvas_Object; part:Pchar; above:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets a new name for part.
 *
 * Note that the relative getter function don't exist as it don't make sense ;)
 *
 * @param obj Object being edited.
 * @param part Name of part to rename.
 * @param new_name New name for the given part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_name_set(obj:PEvas_Object; part:Pchar; new_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets api's name of a part.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 *
 * @return Name of the API if successful, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_api_name_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets api's description of a part.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 *
 * @return Description of the api if successful, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_api_description_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets api's name of a part.
 *
 * @param obj Object being edited.
 * @param part Name of the part.
 * @param name New name for the api property.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_api_name_set(obj:PEvas_Object; part:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets api's description of a part.
 *
 * @param obj Object being edited.
 * @param part Name of part.
 * @param description New description for the api property.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_api_description_set(obj:PEvas_Object; part:Pchar; description:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the type of a part.
 *
 * @param obj Object being edited.
 * @param part Name of part to get the type of.
 *
 * @return Type of the part. See @ref edcref for details.
  }
(* Const before type ignored *)
function edje_edit_part_type_get(obj:PEvas_Object; part:Pchar):TEdje_Part_Type;cdecl;external;
{*
 * @brief Gets the clip_to part.
 *
 * @param obj Object being edited.
 * @param part Name of the part whose clipper to get.
 *
 * @return Name of the part @p part is clipped to. NULL is returned on errors and if the part don't have a clip.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_clip_to_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets a part to clip part to.
 *
 * @param obj Object being edited.
 * @param part Part to set the clipper to.
 * @param clip_to Part to use as clipper, if NULL then the clipping value will be cancelled (unset clipping).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_clip_to_set(obj:PEvas_Object; part:Pchar; clip_to:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source of part.
 *
 * The meaning of this parameter varies depending on the type of the part.
 * For GROUP parts, it's the name of another group in the Edje file which will
 * be autoloaded and swallowed on this part.
 * For TEXTBLOCK parts, it's the name of a group to be used for selection
 * display under the text.
 * For EXTERNAL parts, it's the name of the registered external widget to load
 * and swallow on this part.
 *
 * @param obj Object being edited.
 * @param part Part to get the source from.
 *
 * @return Content of the source parameter or NULL if nothing set or an error occurred.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the source of part.
 *
 * If setting source of the part will lead to recursive reference
 * (when A source to B, and B is going to be source to A because of this function),
 * then it will return EINA_FALSE.
 *
 * @param obj Object being edited.
 * @param part Part to set the source of.
 * @param source Value for the source parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_part_source_get()
 *
 * @note You can't change the source for EXTERNAL parts, it's akin to changing
 * the type of the part.
 *
 * NOTE: This is not applied now. You must reload the edje to see the change.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source_set(obj:PEvas_Object; part:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source2 of part.
 *
 * Only available to TEXTBLOCK parts. It is used for the group to be loaded and
 * used for selection display OVER the selected text. source is used for under
 * of the selected text, if source is specified.
 *
 * @param obj Object being edited.
 * @param part Part to get the source from.
 *
 * @return Content of the source2 parameter or NULL if nothing set or an error occurred.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source2_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the source2 of part.
 *
 * @param obj Object being edited.
 * @param part Part to set the source of.
 * @param source Value for the source parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_part_source2_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source2_set(obj:PEvas_Object; part:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source3 of part.
 *
 * Only available to TEXTBLOCK parts. It is used for the group to be loaded and
 * used for cursor display UNDER the cursor position. source4 is used for over
 * the cursor text, if source4 is specified.
 *
 * @param obj Object being edited.
 * @param part Part to get the source from.
 *
 * @return Content of the source3 parameter or NULL if nothing set or an error occurred.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source3_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the source3 of part.
 *
 * @param obj Object being edited.
 * @param part Part to set the source of.
 * @param source Value for the source parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_part_source3_get()
 * @since 1.11
 *
 * NOTE: This is not applied now. You must reload the edje to see the change.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source3_set(obj:PEvas_Object; part:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source4 of part.
 *
 * Only available to TEXTBLOCK parts. It is used for the group to be loaded and
 * used for cursor display OVER the cursor position. source3 is used for under
 * the cursor text, if source4 is specified.
 *
 * @param obj Object being edited.
 * @param part Part to get the source from.
 *
 * @return Content of the source4 parameter or NULL if nothing set or an error occurred.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source4_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the source4 of part.
 *
 * @param obj Object being edited.
 * @param part Part to set the source of.
 * @param source Value for the source parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_part_source4_get()
 * @since 1.11
 *
 * NOTE: This is not applied now. You must reload the edje to see the change.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source4_set(obj:PEvas_Object; part:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source5 of part.
 *
 * Only available to TEXTBLOCK parts. It is used for the group to be loaded and
 * used for anchors display UNDER the anchor position. source6 is used for over
 * the anchors text, if source6 is specified.
 *
 * @param obj Object being edited.
 * @param part Part to get the source from.
 *
 * @return Content of the source5 parameter or NULL if nothing set or an error occurred.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source5_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the source5 of part.
 *
 * @param obj Object being edited.
 * @param part Part to set the source of.
 * @param source Value for the source parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_part_source5_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source5_set(obj:PEvas_Object; part:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source6 of part.
 *
 * Only available to TEXTBLOCK parts. It is used for the group to be loaded and
 * used for anchor display OVER the anchor position. source5 is used for under
 * the anchor text, if source6 is specified.
 *
 * @param obj Object being edited.
 * @param part Part to get the source from.
 *
 * @return Content of the source6 parameter or NULL if nothing set or an error occurred.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source6_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the source6 of part.
 *
 * @param obj Object being edited.
 * @param part Part to set the source of.
 * @param source Value for the source parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see edje_edit_part_source6_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_source6_set(obj:PEvas_Object; part:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the effect for a given part.
 *
 * Gets the effect used for parts of type TEXT. See @ref edcref for more details.
 *
 * @param obj Object being edited.
 * @param part Part to get the effect of.
 *
 * @return The effect set for the part.
  }
(* Const before type ignored *)
function edje_edit_part_effect_get(obj:PEvas_Object; part:Pchar):TEdje_Text_Effect;cdecl;external;
{*
 * @brief Sets the effect for a given part.
 * Effects and shadow directions can be combined.
 *
 * For effect and shadow direction list please look at Edje Part Text ref page.
 *
 * @param obj Object being edited.
 * @param part Part to set the effect to. Only makes sense on type TEXT.
 * @param effect Effect to set for the part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @see Edje_Part_Text
  }
(* Const before type ignored *)
function edje_edit_part_effect_set(obj:PEvas_Object; part:Pchar; effect:TEdje_Text_Effect):TEina_Bool;cdecl;external;
{*
 * @brief Gets the current selected state in part.
 *
 * @param obj Object being edited.
 * @param part Part to get the selected state of.
 * @param value Pointer to a double where the value of the state will be stored.
 *
 * @return The name of the currently selected state for the part.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_selected_state_get(obj:PEvas_Object; part:Pchar; value:Pdouble):Pchar;cdecl;external;
{*
 * @brief Sets the current state in part.
 *
 * @param obj Object being edited.
 * @param part Part to set the state of.
 * @param state Name of the state to set.
 * @param value Value of the state.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_selected_state_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets mouse_events for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if the mouse events is accepted.
 *
 * @return @c EINA_TRUE if part will accept mouse events, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_mouse_events_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets mouse_events for part.
 *
 * @param obj Object being edited.
 * @param part The part to set if the mouse events is accepted.
 * @param mouse_events @c EINA_TRUE if part will accept mouse events, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_mouse_events_set(obj:PEvas_Object; part:Pchar; mouse_events:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets required value for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if the part is required by API.
 *
 * @return @c EINA_TRUE if part is required by the object's implementation, @c EINA_FALSE otherwise.
 * @since 1.23
  }
(* Const before type ignored *)
function edje_edit_part_required_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets anti-aliasing for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if the anti-aliasing is accepted.
 *
 * @return @c EINA_TRUE if part will draw anti-aliased, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_anti_alias_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets anti-aliasing for part.
 *
 * @param obj Object being edited.
 * @param part The part to set if the anti-aliasing is accepted.
 * @param anti_alias @c EINA_TRUE if part should be drawn anti-aliased, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_anti_alias_set(obj:PEvas_Object; part:Pchar; anti_alias:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets repeat_events for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if it will pass all events to the other parts.
 *
 * @return @c EINA_TRUE if the events received will propagate to other parts, @c EINA_FALSE otherwise
  }
(* Const before type ignored *)
function edje_edit_part_repeat_events_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets repeat_events for part.
 *
 * @param obj Object being edited.
 * @param part Part to set if will repeat all the received mouse events to other parts.
 * @param repeat_events @c EINA_TRUE if the events received will propagate to other parts, @c EINA_FALSE otherwise
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_repeat_events_set(obj:PEvas_Object; part:Pchar; repeat_events:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets use_alternate_font_metrics variable for part.
 *
 * @param obj Object being edited.
 * @param part Part to get use_alternate_font_metrics for text or textblock part is enabled.
 *
 * @return @c EINA_TRUE if use_alternate_font_metrics, @c EINA_FALSE otherwise
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_use_alternate_font_metrics_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets use_alternate_font_metrics variable for part.
 *
 * @param obj Object being edited.
 * @param part Part to set use_alternate_font_metrics for text or textblock part is enabled.
 * @param use EINA_TRUE if use_alternate_font_metrics, @c EINA_FALSE otherwise
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_use_alternate_font_metrics_set(obj:PEvas_Object; part:Pchar; use:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets multiline for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if editing multiple lines for text or textblock part is enabled.
 *
 * @return @c EINA_TRUE if multiple lines for editing is enabled, @c EINA_FALSE otherwise
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_multiline_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets multiline for part.
 *
 * @param obj Object being edited.
 * @param part Part to set if editing multiple lines for text or textblock part is enabled.
 * @param multiline @c EINA_TRUE if multiple lines for editing is enabled, @c EINA_FALSE otherwise
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_multiline_set(obj:PEvas_Object; part:Pchar; multiline:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets precise_is_inside for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if it will enable point collision detection for the part.
 *
 * @return @c EINA_TRUE if point collision detection for the part is enabled, @c EINA_FALSE otherwise
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_precise_is_inside_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets precise_is_inside for part.
 *
 * @param obj Object being edited.
 * @param part Part to set if it will enable point collision detection for the part.
 * @param precise_is_inside EINA_TRUE if point collision detection for the part is enabled, @c EINA_FALSE otherwise
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_precise_is_inside_set(obj:PEvas_Object; part:Pchar; precise_is_inside:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets accessibility for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if it uses accessibility feature.
 *
 * @return @c EINA_TRUE if part uses accessibility feature, @c EINA_FALSE otherwise
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_access_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets accessibility for part.
 *
 * @param obj Object being edited.
 * @param part Part to set if it uses accessibility feature.
 * @param access EINA_TRUE if part uses accessibility feature, @c EINA_FALSE otherwise
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_access_set(obj:PEvas_Object; part:Pchar; access:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets ignore_flags for part.
 *
 * @param obj Object being edited.
 * @param part Part to get which event_flags are being ignored.
 *
 * @return The Event flags set to the part.
  }
(* Const before type ignored *)
function edje_edit_part_ignore_flags_get(obj:PEvas_Object; part:Pchar):TEvas_Event_Flags;cdecl;external;
{*
 * @brief Sets ignore_flags for part.
 *
 * @param obj Object being edited.
 * @param part Part to set which event flags will be ignored.
 * @param ignore_flags The Event flags to be ignored by the part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_ignore_flags_set(obj:PEvas_Object; part:Pchar; ignore_flags:TEvas_Event_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Gets mask_flags for part.
 *
 * @param obj Object being edited.
 * @param part Part to get which event_flags are being masked.
 *
 * @return The Event flags set to the part.
  }
(* Const before type ignored *)
function edje_edit_part_mask_flags_get(obj:PEvas_Object; part:Pchar):TEvas_Event_Flags;cdecl;external;
{*
 * @brief Sets mask_flags for part.
 *
 * @param obj Object being edited.
 * @param part Part to set which event flags will be masked.
 * @param mask_flags The Event flags to be masked by the part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_mask_flags_set(obj:PEvas_Object; part:Pchar; mask_flags:TEvas_Event_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Gets pointer_mode of a part.
 *
 * @param obj Object being edited.
 * @param part Part name to get it's pointer_mode.
 *
 * @return Pointer Mode of the part.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_pointer_mode_get(obj:PEvas_Object; part:Pchar):TEvas_Object_Pointer_Mode;cdecl;external;
{*
 * @brief Gets pointer_mode of a part.
 *
 * Note that Pointer Mode can be:
 * - EVAS_OBJECT_POINTER_MODE_AUTOGRAB - default, X11-like
 * - EVAS_OBJECT_POINTER_MODE_NOGRAB - pointer always bound to the object right below it
 * - EVAS_OBJECT_POINTER_MODE_NOGRAB_NO_REPEAT_UPDOWN - useful on object with "repeat events" enabled, @since 1.2
 *
 * @param obj Object being edited.
 * @param part Part name to get it's pointer_mode.
 * @param pointer_mode Pointer Mode.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_pointer_mode_set(obj:PEvas_Object; part:Pchar; pointer_mode:TEvas_Object_Pointer_Mode):TEina_Bool;cdecl;external;
{*
 * @brief Gets cursor_mode of a part.
 *
 * Note that Cursor Mode can be:
 * 0 - UNDER cursor mode means the cursor will draw below the character pointed
 *     at. That's the default.
 * 1 - BEFORE cursor mode means the cursor is drawn as a vertical line before
 *     the current character, just like many other GUI toolkits handle it.
 *
 * @param obj Object being edited.
 * @param part Part name to get it's cursor_mode.
 *
 * @return Pointer Mode of the part.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_cursor_mode_get(obj:PEvas_Object; part:Pchar):byte;cdecl;external;
{*
 * @brief Gets pointer_mode of a part.
 *
 * Note that Cursor Mode can be:
 * 0 - UNDER cursor mode means the cursor will draw below the character pointed
 *     at. That's the default.
 * 1 - BEFORE cursor mode means the cursor is drawn as a vertical line before
 *     the current character, just like many other GUI toolkits handle it.
 *
 * @param obj Object being edited.
 * @param part Part name to get it's pointer_mode.
 * @param cursor_mode Pointer Mode.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_part_cursor_mode_set(obj:PEvas_Object; part:Pchar; cursor_mode:byte):TEina_Bool;cdecl;external;
{*
 * @brief Sets scale property for the part.
 *
 * This property tells Edje that the given part should be scaled by the
 * Edje scale factor.
 *
 * @param obj Object being edited.
 * @param part Part to set scale for.
 * @param scale Scale value to set.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_scale_set(obj:PEvas_Object; part:Pchar; scale:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets scale for the part.
 *
 * @param obj Object being edited.
 * @param part Part to get the scale value of.
 *
 * @return Whether scale is on (EINA_TRUE) or not.
  }
(* Const before type ignored *)
function edje_edit_part_scale_get(obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets horizontal draggable state for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if can be dragged horizontally.
 *
 * @return @c 1 (or -1) if the part can be dragged horizontally, @c 0 otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_x_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Sets horizontal draggable state for part.
 *
 * @param obj Object being edited.
 * @param part Part to set if should be dragged horizontally.
 * @param drag @c 1 (or -1) if the part should be dragged horizontally, @c 0 otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_x_set(obj:PEvas_Object; part:Pchar; drag:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets vertical draggable state for part.
 *
 * @param obj Object being edited.
 * @param part Part to get if can be dragged vertically.
 *
 * @return @c 1 (or - 1) if the part can be dragged vertically, @c 0 otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_y_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Sets vertical draggable state for part.
 *
 * @param obj Object being edited.
 * @param part Part to set if should be dragged vertically.
 * @param drag @c 1 (or -1) of the part should be dragged vertically, @c 0 otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_y_set(obj:PEvas_Object; part:Pchar; drag:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets horizontal draggable step for part.
 *
 * @param obj Object being edited.
 * @param part Part to get the drag horizontal step value.
 *
 * @return The step value.
  }
(* Const before type ignored *)
function edje_edit_part_drag_step_x_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Sets horizontal draggable state for part.
 *
 * @param obj Object being edited.
 * @param part Part to set the drag horizontal step value.
 * @param step The step the will be dragged.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_step_x_set(obj:PEvas_Object; part:Pchar; step:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets vertical draggable step for part.
 *
 * @param obj Object being edited.
 * @param part Part to get the drag vertical step value.
 *
 * @return The step value.
  }
(* Const before type ignored *)
function edje_edit_part_drag_step_y_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Sets vertical draggable state for part.
 *
 * @param obj Object being edited.
 * @param part Part to set the drag vertical step value.
 * @param step The step the will be dragged.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_step_y_set(obj:PEvas_Object; part:Pchar; step:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets horizontal draggable count for part.
 *
 * @param obj Object being edited.
 * @param part Part to get the drag horizontal count value.
 *
 * @return Horizontal draggable count value
  }
(* Const before type ignored *)
function edje_edit_part_drag_count_x_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Sets horizontal draggable count for part.
 *
 * @param obj Object being edited.
 * @param part Part to set the drag horizontal count value.
 * @param count The count value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_count_x_set(obj:PEvas_Object; part:Pchar; count:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets vertical draggable count for part.
 *
 * @param obj Object being edited.
 * @param part Part to get the drag vertical count value.
 *
 * @return Vertical draggable count value
  }
(* Const before type ignored *)
function edje_edit_part_drag_count_y_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Sets vertical draggable count for part.
 *
 * @param obj Object being edited.
 * @param part Part to set the drag vertical count value.
 * @param count The count value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_part_drag_count_y_set(obj:PEvas_Object; part:Pchar; count:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the name of the part that is used as 'confine' for the given draggies.
 *
 * @param obj Object being edited.
 * @param part Part to get the name that is used as 'confine' for the given draggies.
 *
 * @return The name of the confine part, or NULL (if unset).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_drag_confine_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the name of the part that is used as 'confine' for the given draggies.
 *
 * @param obj Object being edited.
 * @param part Part to set the name that is used as 'confine' for the given draggies.
 * @param confine The name of the confine part, or NULL to unset confine.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_drag_confine_set(obj:PEvas_Object; part:Pchar; confine:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the name of the part that is used as the receiver of the drag event.
 *
 * @param obj Object being edited.
 * @param part Part to get the name that is used as the receiver of the drag event.
 *
 * @return The name of the part that will receive events, or NULL (if unset).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_drag_event_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the name of the part that will receive events from the given draggies.
 *
 * @param obj Object being edited.
 * @param part Part to set the name that will receive events from the given draggies.
 * @param event The name of the part that will receive events, or NULL to unset.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_drag_event_set(obj:PEvas_Object; part:Pchar; event:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the name of the part that is used as 'threshold' for the given draggies.
 *
 * @param obj Object being edited.
 * @param part Part to get the name that is used as 'threshold' for the given draggies.
 *
 * @return The name of the threshold part, or NULL (if unset).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_drag_threshold_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the name of the part that is used as 'threshold' for the given draggies.
 *
 * @param obj Object being edited.
 * @param part Part to set the name that is used as 'threshold' for the given draggies.
 * @param threshold The name of the threshold part, or NULL to unset confine.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_drag_threshold_set(obj:PEvas_Object; part:Pchar; threshold:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{******************************      BOX API      *************************** }
{**************************************************************************** }
{*
 * @name Box Description API
 * Functions to deal with box (see @ref edcref).
  }{@ }
{*
 * @brief Gets primary layout of the box.
 *
 * @note The returned string should be freed with @c eina_stringshare_del().
 * @param obj Object being edited.
 * @param part Part that have BOX type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return Primary layout of a BOX part in given state.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_box_layout_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):PEina_Stringshare;cdecl;external;
{*
 * @brief Sets primary layout of the box.
 *
 * When trying to set primary layout to NULL, function will use
 * alternative layout instead.
 *
 * @param obj Object being edited.
 * @param part Part that have BOX type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param layout New primary layout to set name.
 *
 * Possible layouts:
 *     @li horizontal (default)
 *     @li vertical
 *     @li horizontal_homogeneous
 *     @li vertical_homogeneous
 *     @li horizontal_max (homogeneous to the max sized child)
 *     @li vertical_max
 *     @li horizontal_flow
 *     @li vertical_flow
 *     @li stack
 *     @li some_other_custom_layout_set_by_the_application
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_box_layout_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; layout:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets fallback layout of the box.
 *
 * @note The returned string should be freed with @c eina_stringshare_del().
 * @param obj Object being edited.
 * @param part Part that have BOX type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return Fallback layout of a BOX part in given state.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_box_alt_layout_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):PEina_Stringshare;cdecl;external;
{*
 * @brief Sets fallback layout of the box.
 *
 * When trying to set fallback layout to NULL, function will use
 * default layout ("horizontal") instead.
 *
 * @param obj Object being edited.
 * @param part Part that have BOX type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param layout New fallback layout to set name.
 *
 * Possible layouts:
 *     @li horizontal (default)
 *     @li vertical
 *     @li horizontal_homogeneous
 *     @li vertical_homogeneous
 *     @li horizontal_max (homogeneous to the max sized child)
 *     @li vertical_max
 *     @li horizontal_flow
 *     @li vertical_flow
 *     @li stack
 *     @li some_other_custom_layout_set_by_the_application
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_box_alt_layout_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; layout:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   TABLE API   ************************************ }
{**************************************************************************** }
{*
 * @name Table Description API
 * Functions to deal with table (see @ref edcref).
  }{@ }
{*
 * @brief Sets homogeneous mode for TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that have TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param homogeneous Homogeneous mode for table.
 *
 * Possible modes:
 *     @li EDJE_OBJECT_TABLE_HOMOGENEOUS_NONE,
 *     @li EDJE_OBJECT_TABLE_HOMOGENEOUS_TABLE,
 *     @li EDJE_OBJECT_TABLE_HOMOGENEOUS_ITEM
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_table_homogeneous_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; homogeneous:byte):TEina_Bool;cdecl;external;
{*
 * @brief Gets homogeneous mode for TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that have TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * Possible modes:
 *     @li EDJE_OBJECT_TABLE_HOMOGENEOUS_NONE,
 *     @li EDJE_OBJECT_TABLE_HOMOGENEOUS_TABLE,
 *     @li EDJE_OBJECT_TABLE_HOMOGENEOUS_ITEM
 *
 * @return Table homogeneous mode on success, or @c 0 on any error.
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_table_homogeneous_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):byte;cdecl;external;
{@ }
{**************************************************************************** }
{**********************   TABLE & BOX API   ********************************* }
{**************************************************************************** }
{*
 * @name "Container" Description API
 * Functions to deal both with box and table (see @ref edcref).
 * Those functions called edje_edit_state_container_<something> because they
 * are working both for TABLE and BOX at same time.
  }{@ }
{*
 * @deprecated Use edje_edit_state_container_min_h_get() and
 * edje_edit_state_container_min_v_get() instead.
 *
 * @brief Gets whether vertical or horizontal minimum size's of the box are equal
 * to the minimum vertical or horizontal size of items
 * (function for BOX or TABLE part.
 * If EINA_TRUE - is equal, if EINA_FALSE - is not)
 *
 * @param obj Object being edited.
 * @param part Part that have BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param h Variable to store horizontal min value.
 * @param v Variable to store vertical min value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_min_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; h:PEina_Bool; 
           v:PEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets whether horizontal min size of the container is equal to the min
 * horizontal size of items (BOX and TABLE part functions).
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return @c EINA_TRUE If the part forces container's minimal horizontal size,
 *         @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_min_h_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets whether vertical min size of the container is equal to the min vertical
 * size of items (BOX and TABLE part functions).
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return @c EINA_TRUE If the part forces container's minimal horizontal size,
 *         @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_min_v_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @deprecated Use edje_edit_state_container_min_h_set() and
 * edje_edit_state_container_min_v_set() instead.
 *
 * @brief Sets whether vertical or horizontal minimum size's of the box are equal
 * to the minimum vertical or horizontal size of items
 * (function for BOX or TABLE part.
 * If EINA_TRUE - is equal, if EINA_FALSE - is not)
 *
 * @param obj Object being edited.
 * @param part Part that have BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param h horizontal min value.
 * @param v vertical min value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_min_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; h:TEina_Bool; 
           v:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets whether horizontal min size of the container should be equal to the min
 * horizontal size of items (BOX and TABLE part functions).
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param h New horizontal min value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_min_h_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; h:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets whether vertical min size of the container should be equal to the min
 * vertical size of items (BOX and TABLE part functions).
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param v New vertical min value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_min_v_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; v:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @deprecated Use edje_edit_state_container_padding_x_get() and
 * edje_edit_state_container_padding_y_get() instead.
 *
 * @brief Gets x and y paddings for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that have BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param x Variable to store x padding.
 * @param y Variable to store y padding.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_padding_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Plongint; 
           y:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Gets x padding for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return The padding by x axis.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_padding_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Gets y padding for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return The padding by y axis.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_padding_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @deprecated Use edje_edit_state_container_padding_x_set() and
 * edje_edit_state_container_padding_y_set() instead.
 *
 * @brief Sets x and y paddings for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that have BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param x Value for setting x padding.
 * @param y Value for setting y padding.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_padding_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:longint; 
           y:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets x padding for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param x New x padding value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_padding_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets y padding for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param y New y padding value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_padding_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:longint):TEina_Bool;cdecl;external;
{*
 * @deprecated Use edje_edit_state_container_align_x_set() and
 * edje_edit_state_container_align_y_set() instead.
 *
 * @brief Sets x and y align for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that have BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param x Variable to store x value.
 * @param y Variable to store y value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_align_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble; 
           y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets x align for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param x New x align value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_align_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets y align for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param y New y align value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_align_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @deprecated Use edje_edit_state_container_align_x_set() and
 * edje_edit_state_container_align_y_set() instead.
 *
 * @brief Gets x and y align for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that have BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 * @param x Value for setting x align.
 * @param y Value for setting y align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.14
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_align_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Pdouble; 
           y:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets x align for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return The align by x axis.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_align_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets y align for BOX or TABLE part.
 *
 * @param obj Object being edited.
 * @param part Part that has BOX/TABLE type.
 * @param state Name of the state.
 * @param value Value of the state.
 *
 * @return The align by y axis.
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_container_align_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   BOX & TABLE ITEMS API   ************************ }
{**************************************************************************** }
{*
 * @name Items API
 * Functions to deal with table and box part's items (see @ref edcref).
  }{@ }
{*
 * @brief Appends new item to box or table part.
 *
 * @param obj Object being edited.
 * @param part Part to add a new item. This part should have BOX or TABLE type.
 * @param item_name Name of new item that is not exist in BOX or TABLE yet.
 * @param source_group Source (means group name) of the new item
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_append(obj:PEvas_Object; part:Pchar; item_name:Pchar; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Inserts new item to box or table part before specified existing item.
 *
 * @param obj Object being edited.
 * @param part Part to add a new item. This part should have BOX or TABLE type.
 * @param item_name Name of new item that is not exist in BOX or TABLE yet.
 * @param item_before Name of repeated item that is exist in BOX or TABLE.
 * @param source_group Source (means group name) of the new item.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_insert_before(obj:PEvas_Object; part:Pchar; item_name:Pchar; item_before:Pchar; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Inserts new item to box or table part before specified existing item.
 *
 * @param obj Object being edited.
 * @param part Part to add a new item. This part should have BOX or TABLE type.
 * @param item_name Name of new item that is not exist in BOX or TABLE yet.
 * @param index Index of repeated item that is exist in BOX or TABLE.
 * @param source_group Source (means group name) of the new item.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_insert_before_index(obj:PEvas_Object; part:Pchar; item_name:Pchar; index:dword; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Inserts new item to box or table part after specified existing item.
 *
 * @param obj Object being edited.
 * @param part Part to add a new item. This part should have BOX or TABLE type.
 * @param item_name Name of new item that is not exist in BOX or TABLE yet.
 * @param item_after Name of repeated item that is exist in BOX or TABLE.
 * @param source_group Source (means group name) of the new item.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_insert_after(obj:PEvas_Object; part:Pchar; item_name:Pchar; item_after:Pchar; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Inserts new item to box or table part after specified existing item.
 *
 * @param obj Object being edited.
 * @param part Part to add a new item. This part should have BOX or TABLE type.
 * @param item_name Name of new item that is not exist in BOX or TABLE yet.
 * @param index Index of repeated item that is exist in BOX or TABLE.
 * @param source_group Source (means group name) of the new item.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_insert_after_index(obj:PEvas_Object; part:Pchar; item_name:Pchar; index:dword; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Inserts new item to box or table part directly into specified position.
 *
 * @param obj Object being edited.
 * @param part Part to add a new item. This part should have BOX or TABLE type.
 * @param item_name Name of new item that is not exist in BOX or TABLE yet.
 * @param source_group Source (means group name) of the new item.
 * @param place Specified place to insert item into. Place cannot be less than 0 or
 *              greater than current number of items in BOX or TABLE.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_insert_at(obj:PEvas_Object; part:Pchar; item_name:Pchar; source_group:Pchar; place:dword):TEina_Bool;cdecl;external;
{*
 * @brief Restacks existing item above.
 *
 * @param obj Object being edited.
 * @param part Part which contain items. This part should have BOX or TABLE type.
 * @param item_name Name of item that will be moved above.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_move_above(obj:PEvas_Object; part:Pchar; item_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Restacks existing item above.
 *
 * @param obj Object being edited.
 * @param part Part which contain items. This part should have BOX or TABLE type.
 * @param index Index of item that will be moved above.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_move_above_index(obj:PEvas_Object; part:Pchar; index:dword):TEina_Bool;cdecl;external;
{*
 * @brief Restacks existing item below.
 *
 * @param obj Object being edited.
 * @param part Part which contain items. This part should have BOX or TABLE type.
 * @param item_name Name of item that will be moved below.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_move_below(obj:PEvas_Object; part:Pchar; item_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Restacks existing item below.
 *
 * @param obj Object being edited.
 * @param part Part which contain items. This part should have BOX or TABLE type.
 * @param index Index of item that will be moved below.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_move_below_index(obj:PEvas_Object; part:Pchar; index:dword):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all part items in the given edje.
 *
 * @param obj Object being edited.
 * @param part Name of part which is TABLE or BOX part and contain items.
 *
 * @return A List containing all part items names found in the edje file.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
function edje_edit_part_items_list_get(obj:PEvas_Object; part:Pchar):PEina_List;cdecl;external;
{*
 * @brief Gets the count of part items in the given edje.
 *
 * @param obj Object being edited.
 * @param part Name of part which is TABLE or BOX part and contain items.
 *
 * @return A count part items in case of success, and -1 otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_items_count_get(obj:PEvas_Object; part:Pchar):longint;cdecl;external;
{*
 * @brief Deletes item from box or table part.
 *
 * @param obj Object being edited.
 * @param part Part to delete exist item. This part should have BOX or TABLE type.
 * @param name Name of exist item to delete it from BOX or TABLE.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_del(obj:PEvas_Object; part:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes item from box or table part by index.
 *
 * @param obj Object being edited.
 * @param part Part to delete exist item. This part should have BOX or TABLE type.
 * @param index Index of exist item to delete it from BOX or TABLE.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_del(obj:PEvas_Object; part:Pchar; index:dword):TEina_Bool;cdecl;external;
{*
 * @brief Sets name for item from table or box items.
 *
 * @param obj Object being edited.
 * @param part Part to change item's source. This part should have BOX or TABLE type.
 * @param index Index of item
 * @param name New item name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_index_name_set(obj:PEvas_Object; part:Pchar; index:dword; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets name for item from table or box items.
 *
 * @param obj Object being edited.
 * @param part Part to return item's source. This part should have BOX or TABLE type.
 * @param index Index of item.
 *
 * @return name of the given item.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_index_name_get(obj:PEvas_Object; part:Pchar; index:dword):Pchar;cdecl;external;
{*
 * @brief Sets source for item from table or box items.
 *
 * @param obj Object being edited.
 * @param part Part to change item's source. This part should have BOX or TABLE type.
 * @param item_name Name of item.
 * @param source_group New group name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_source_set(obj:PEvas_Object; part:Pchar; item_name:Pchar; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets source for item from table or box items.
 *
 * @param obj Object being edited.
 * @param part Part to change item's source. This part should have BOX or TABLE type.
 * @param index Index of item
 * @param source_group New group name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_index_source_set(obj:PEvas_Object; part:Pchar; index:dword; source_group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets source for item from table or box items.
 *
 * @param obj Object being edited.
 * @param part Part to return item's source. This part should have BOX or TABLE type.
 * @param item_name Name of item.
 *
 * @return source of the given item.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_source_get(obj:PEvas_Object; part:Pchar; item_name:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets source for item from table or box items.
 *
 * @param obj Object being edited.
 * @param part Part to return item's source. This part should have BOX or TABLE type.
 * @param index Index of item.
 *
 * @return source of the given item.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_index_source_get(obj:PEvas_Object; part:Pchar; index:dword):Pchar;cdecl;external;
{*
 * @brief Gets the minimum width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get minimum width.
 *
 * @return The minimum width value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_min_w_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the minimum width value of a part's item.
 * The minimum width should be greater than 0.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set minimum width.
 * @param min_w Minimum width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_min_w_set(obj:PEvas_Object; part:Pchar; item:Pchar; min_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the minimum height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get minimum height.
 *
 * @return The minimum height value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_min_h_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the minimum height value of a part's item.
 * The minimum height should be greater than 0.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set minimum height.
 * @param min_h Minimum height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_min_h_set(obj:PEvas_Object; part:Pchar; item:Pchar; min_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the maximum width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get maximum width.
 *
 * @return The maximum width value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_max_w_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the maximum width value of a part's item.
 * The maximum width should be greater than -1.
 * The value -1 means that state doesn't have any boundaries on width direction.
 * (it can be any size that is bigger than it's min)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set maximum width.
 * @param max_w Maximum width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_max_w_set(obj:PEvas_Object; part:Pchar; item:Pchar; max_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the maximum height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get maximum height.
 *
 * @return The maximum height value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_max_h_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the maximum height value of a part's item.
 * The maximum height should be greater than -1.
 * The value -1 means that state doesn't have any boundaries on height direction.
 * (it can be any size that is bigger than it's min)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set maximum height.
 * @param max_h Maximum height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_max_h_set(obj:PEvas_Object; part:Pchar; item:Pchar; max_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the aspect width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get aspect width.
 *
 * @return The aspect width value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_aspect_w_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the aspect width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set aspect width.
 * @param aspect_w Aspect width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_aspect_w_set(obj:PEvas_Object; part:Pchar; item:Pchar; aspect_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the aspect height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get aspect height.
 *
 * @return The maximum height value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_aspect_h_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the aspect height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set aspect height.
 * @param aspect_h Aspect height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_aspect_h_set(obj:PEvas_Object; part:Pchar; item:Pchar; aspect_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the prefer width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get prefer width.
 *
 * @return The prefer width value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_prefer_w_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Gets aspect mode for an item of TABLE or BOX.
 *
 * This may return next values:
 * - EDJE_ASPECT_CONTROL_NONE
 * - EDJE_ASPECT_CONTROL_NEITHER
 * - EDJE_ASPECT_CONTROL_HORIZONTAL
 * - EDJE_ASPECT_CONTROL_VERTICAL
 * - EDJE_ASPECT_CONTROL_BOTH
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to set aspect mode.
 *
 * @return One of possible enum Edje_Aspect_Control.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_aspect_mode_get(obj:PEvas_Object; part:Pchar; item:Pchar):TEdje_Aspect_Control;cdecl;external;
{*
 * @brief Sets aspect mode for an item of TABLE or BOX.
 *
 * Mode may be next:
 * - EDJE_ASPECT_CONTROL_NONE
 * - EDJE_ASPECT_CONTROL_NEITHER
 * - EDJE_ASPECT_CONTROL_HORIZONTAL
 * - EDJE_ASPECT_CONTROL_VERTICAL
 * - EDJE_ASPECT_CONTROL_BOTH
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to set aspect mode.
 * @param mode One of possible enum from Edje_Aspect_Control:

 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_aspect_mode_set(obj:PEvas_Object; part:Pchar; item:Pchar; mode:TEdje_Aspect_Control):TEina_Bool;cdecl;external;
{*
 * @brief Sets the prefer width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set prefer width.
 * @param prefer_w Prefer width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_prefer_w_set(obj:PEvas_Object; part:Pchar; item:Pchar; prefer_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the prefer height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get prefer height.
 *
 * @return The maximum height value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_prefer_h_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the prefer height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set prefer height.
 * @param prefer_h Prefer height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_prefer_h_set(obj:PEvas_Object; part:Pchar; item:Pchar; prefer_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the spread width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get spread width.
 *
 * @return The spread width value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_spread_w_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the spread width value of a part's item.
 *
 * @attention be careful, if you set up huge number (like 10 or 100) width and height of
 * spread is being multiplied and you will get huge number of objects that may "eat"
 * all of your processor performance at once... Or if you want, you may
 * get some coffee and wait until it will recalculate all of those objects :)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set spread width.
 * @param spread_w Maximum width value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_spread_w_set(obj:PEvas_Object; part:Pchar; item:Pchar; spread_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the spread height value of a part's item.
 *
 * @attention be careful, if you set up huge number (like 10 or 100) width and height of
 * spread is being multiplied and you will get huge number of objects that may "eat"
 * all of your processor performance at once... Or if you want, you may
 * get some coffee and wait until it will recalculate all of those objects :)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to get spread height.
 *
 * @return The spread height value.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_spread_h_get(obj:PEvas_Object; part:Pchar; item:Pchar):longint;cdecl;external;
{*
 * @brief Sets the spread height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param item The name of the item to set spread height.
 * @param spread_h spread height value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_spread_h_set(obj:PEvas_Object; part:Pchar; item:Pchar; spread_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the minimum width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get minimum width.
 *
 * @return The minimum width value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_min_w_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the minimum width value of a part's item.
 * The minimum width should be greater than 0.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set minimum width.
 * @param min_w Minimum width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_min_w_set(obj:PEvas_Object; part:Pchar; index:dword; min_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the minimum height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get minimum height.
 *
 * @return The minimum height value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_min_h_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the minimum height value of a part's item.
 * The minimum height should be greater than 0.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set minimum height.
 * @param min_h Minimum height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_min_h_set(obj:PEvas_Object; part:Pchar; index:dword; min_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the maximum width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get maximum width.
 *
 * @return The maximum width value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_max_w_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the maximum width value of a part's item.
 * The maximum width should be greater than -1.
 * The value -1 means that state doesn't have any boundaries on width direction.
 * (it can be any size that is bigger than it's min)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set maximum width.
 * @param max_w Maximum width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_max_w_set(obj:PEvas_Object; part:Pchar; index:dword; max_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the maximum height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get maximum height.
 *
 * @return The maximum height value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_max_h_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the maximum height value of a part's item.
 * The maximum height should be greater than -1.
 * The value -1 means that state doesn't have any boundaries on height direction.
 * (it can be any size that is bigger than it's min)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set maximum height.
 * @param max_h Maximum height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_max_h_set(obj:PEvas_Object; part:Pchar; index:dword; max_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the aspect width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get aspect width.
 *
 * @return The aspect width value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_aspect_w_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the aspect width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set aspect width.
 * @param aspect_w Aspect width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_aspect_w_set(obj:PEvas_Object; part:Pchar; index:dword; aspect_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the aspect height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get aspect height.
 *
 * @return The maximum height value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_aspect_h_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the aspect height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set aspect height.
 * @param aspect_h Aspect height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_aspect_h_set(obj:PEvas_Object; part:Pchar; index:dword; aspect_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the prefer width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get prefer width.
 *
 * @return The prefer width value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_prefer_w_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Gets aspect mode for an item of TABLE or BOX.
 *
 * This may return next values:
 * - EDJE_ASPECT_CONTROL_NONE
 * - EDJE_ASPECT_CONTROL_NEITHER
 * - EDJE_ASPECT_CONTROL_HORIZONTAL
 * - EDJE_ASPECT_CONTROL_VERTICAL
 * - EDJE_ASPECT_CONTROL_BOTH
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to set aspect mode.
 *
 * @return One of possible enum Edje_Aspect_Control.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_aspect_mode_get(obj:PEvas_Object; part:Pchar; index:dword):TEdje_Aspect_Control;cdecl;external;
{*
 * @brief Sets aspect mode for an item of TABLE or BOX.
 *
 * Mode may be next:
 * - EDJE_ASPECT_CONTROL_NONE
 * - EDJE_ASPECT_CONTROL_NEITHER
 * - EDJE_ASPECT_CONTROL_HORIZONTAL
 * - EDJE_ASPECT_CONTROL_VERTICAL
 * - EDJE_ASPECT_CONTROL_BOTH
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to set aspect mode.
 * @param mode One of possible enum from Edje_Aspect_Control:

 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_aspect_mode_set(obj:PEvas_Object; part:Pchar; index:dword; mode:TEdje_Aspect_Control):TEina_Bool;cdecl;external;
{*
 * @brief Sets the prefer width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set prefer width.
 * @param prefer_w Prefer width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_prefer_w_set(obj:PEvas_Object; part:Pchar; index:dword; prefer_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the prefer height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get prefer height.
 *
 * @return The maximum height value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_prefer_h_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the prefer height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set prefer height.
 * @param prefer_h Prefer height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_prefer_h_set(obj:PEvas_Object; part:Pchar; index:dword; prefer_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the spread width value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get spread width.
 *
 * @return The spread width value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_spread_w_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the spread width value of a part's item.
 *
 * @attention be careful, if you set up huge number (like 10 or 100) width and height of
 * spread is being multiplied and you will get huge number of objects that may "eat"
 * all of your processor performance at once... Or if you want, you may
 * get some coffee and wait until it will recalculate all of those objects :)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set spread width.
 * @param spread_w Maximum width value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_spread_w_set(obj:PEvas_Object; part:Pchar; index:dword; spread_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the spread height value of a part's item.
 *
 * @attention be careful, if you set up huge number (like 10 or 100) width and height of
 * spread is being multiplied and you will get huge number of objects that may "eat"
 * all of your processor performance at once... Or if you want, you may
 * get some coffee and wait until it will recalculate all of those objects :)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to get spread height.
 *
 * @return The spread height value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_spread_h_get(obj:PEvas_Object; part:Pchar; index:dword):longint;cdecl;external;
{*
 * @brief Sets the spread height value of a part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param index Index of the item to set spread height.
 * @param spread_h spread height value.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_spread_h_set(obj:PEvas_Object; part:Pchar; index:dword; spread_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets paddings of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 * @param l A pointer to store the left padding value.
 * @param r A pointer to store the right padding value.
 * @param t A pointer to store the top padding value.
 * @param b A pointer to store the bottom padding value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_padding_get(obj:PEvas_Object; part:Pchar; item_name:Pchar; l:Plongint; r:Plongint; 
           t:Plongint; b:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets paddings of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 * @param l Value of the left padding.
 * @param r Value of the right padding.
 * @param t Value of the top padding.
 * @param b Value of the bottom padding.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_padding_set(obj:PEvas_Object; part:Pchar; item_name:Pchar; l:longint; r:longint; 
           t:longint; b:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets paddings of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 * @param l A pointer to store the left padding value.
 * @param r A pointer to store the right padding value.
 * @param t A pointer to store the top padding value.
 * @param b A pointer to store the bottom padding value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_padding_get(obj:PEvas_Object; part:Pchar; index:dword; l:Plongint; r:Plongint; 
           t:Plongint; b:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets paddings of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 * @param l Value of the left padding.
 * @param r Value of the right padding.
 * @param t Value of the top padding.
 * @param b Value of the bottom padding.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_padding_set(obj:PEvas_Object; part:Pchar; index:dword; l:longint; r:longint; 
           t:longint; b:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to get horizontal align value.
 *
 * @return The horizontal align value for the given align (value is between -1.0 and 1.0)
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_align_x_get(obj:PEvas_Object; part:Pchar; item:Pchar):Tdouble;cdecl;external;
{*
 * @brief Gets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get horizontal align value.
 *
 * @return The horizontal align value for the given align (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_align_x_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contains item
 * @param item The name of the item to set horizontal align value.
 * @param align_x New value of the horizontal align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_align_x_set(obj:PEvas_Object; part:Pchar; item:Pchar; align_x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contains item
 * @param index Index of the item to set horizontal align value.
 * @param align_x New value of the horizontal align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_align_x_set(obj:PEvas_Object; part:Pchar; index:dword; align_x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to get vertical align value.
 *
 * @return The vertical align value for the given align (value is between -1.0 and 1.0)
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_align_y_get(obj:PEvas_Object; part:Pchar; item:Pchar):Tdouble;cdecl;external;
{*
 * @brief Gets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get vertical align value.
 *
 * @return The vertical align value for the given align (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_align_y_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to set vertical align value.
 * @param align_y New value of the vertical align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_align_y_set(obj:PEvas_Object; part:Pchar; item:Pchar; align_y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to set vertical align value.
 * @param align_y New value of the vertical align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_align_y_set(obj:PEvas_Object; part:Pchar; index:dword; align_y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the horizontal weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to get horizontal weight value.
 *
 * @return The horizontal weight value for the given item (value is between -1.0 and 1.0)
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_weight_x_get(obj:PEvas_Object; part:Pchar; item:Pchar):Tdouble;cdecl;external;
{*
 * @brief Gets the horizontal weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get horizontal weight value.
 *
 * @return The horizontal weight value for the given item (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_weight_x_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the horizontal we value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contains item
 * @param item The name of the item to set horizontal weight value.
 * @param weight_x New value of the horizontal weight.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_weight_x_set(obj:PEvas_Object; part:Pchar; item:Pchar; weight_x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the horizontal we value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contains item
 * @param index Index of the item to set horizontal weight value.
 * @param weight_x New value of the horizontal weight.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_weight_x_set(obj:PEvas_Object; part:Pchar; index:dword; weight_x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the vertical weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to get vertical weight value.
 *
 * @return The vertical weight value for the given item (value is between -1.0 and 1.0)
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_weight_y_get(obj:PEvas_Object; part:Pchar; item:Pchar):Tdouble;cdecl;external;
{*
 * @brief Gets the vertical weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get vertical weight value.
 *
 * @return The vertical weight value for the given item (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_weight_y_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the vertical weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item to set vertical weight value.
 * @param weight_y New value of the vertical weight.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_weight_y_set(obj:PEvas_Object; part:Pchar; item:Pchar; weight_y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the vertical weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to set vertical weight value.
 * @param weight_y New value of the vertical weight.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_weight_y_set(obj:PEvas_Object; part:Pchar; index:dword; weight_y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @deprecated Use edje_edit_part_item_position_col_get() and
 * edje_edit_part_item_position_row_get() instead.
 *
 * @brief Gets column/row position of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 * @param col Column item position.
 * @param row Row item position.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_position_get(obj:PEvas_Object; part:Pchar; item_name:Pchar; col:Pword; row:Pword):TEina_Bool;cdecl;external;
{*
 * @brief Gets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get horizontal align value.
 *
 * @return The horizontal align value for the given align (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_align_x_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item
 * @param index Index of the item to set horizontal align value.
 * @param align_x New value of the horizontal align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_align_x_set(obj:PEvas_Object; part:Pchar; index:dword; align_x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get vertical align value.
 *
 * @return The vertical align value for the given align (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_align_y_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to set vertical align value.
 * @param align_y New value of the vertical align.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_align_y_set(obj:PEvas_Object; part:Pchar; index:dword; align_y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the horizontal weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get horizontal weight value.
 *
 * @return The horizontal weight value for the given item (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_weight_x_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the horizontal we value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contains item
 * @param index Index of the item to set horizontal weight value.
 * @param weight_x New value of the horizontal weight.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_weight_x_set(obj:PEvas_Object; part:Pchar; index:dword; weight_x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the vertical weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to get vertical weight value.
 *
 * @return The vertical weight value for the given item (value is between -1.0 and 1.0)
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_weight_y_get(obj:PEvas_Object; part:Pchar; index:dword):Tdouble;cdecl;external;
{*
 * @brief Sets the vertical weight value of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item to set vertical weight value.
 * @param weight_y New value of the vertical weight.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_item_weight_y_set(obj:PEvas_Object; part:Pchar; index:dword; weight_y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets column position of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 *
 * @return The item column value.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_position_col_get(obj:PEvas_Object; part:Pchar; item_name:Pchar):word;cdecl;external;
{*
 * @brief Gets row position of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 *
 * @return The item row value.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_position_row_get(obj:PEvas_Object; part:Pchar; item_name:Pchar):word;cdecl;external;
{*
 * @brief Gets column position of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 *
 * @return The item column value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_position_col_get(obj:PEvas_Object; part:Pchar; index:dword):word;cdecl;external;
{*
 * @brief Gets row position of the part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 *
 * @return The item row value.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_position_row_get(obj:PEvas_Object; part:Pchar; index:dword):word;cdecl;external;
{*
 * @deprecated Use edje_edit_part_item_position_col_set() and
 * edje_edit_part_item_position_row_set() instead.
 *
 * @brief Sets column/row position of a new part's item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 * @param col Column item position.
 * @param row Row item position.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_position_set(obj:PEvas_Object; part:Pchar; item_name:Pchar; col:word; row:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets column position of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 * @param col Column item position.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_position_col_set(obj:PEvas_Object; part:Pchar; item_name:Pchar; col:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets row position of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item_name The name of the item.
 * @param row Row item position.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_position_row_set(obj:PEvas_Object; part:Pchar; item_name:Pchar; row:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets column position of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 * @param col Column item position.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_position_col_set(obj:PEvas_Object; part:Pchar; index:dword; col:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets row position of a part item.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 * @param row Row item position.
 *
 * @return @c EINA_TRUE If successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_position_row_set(obj:PEvas_Object; part:Pchar; index:dword; row:word):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves the how many columns and rows will span for use by item.
 *
 * @param obj object being edited.
 * @param part part that contain item.
 * @param item the name of the item of part.
 * @param col Pointer to an unsigned char in which to store the columns count.
 * @param row Pointer to an unsigned char in which to store the rows count.
 *
 * @deprecated Use edje_edit_part_item_span_row_get() and
 * edje_edit_part_item_span_col_get() instead.
 *
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
procedure edje_edit_part_item_span_get(obj:PEvas_Object; part:Pchar; item:Pchar; col:Pbyte; row:Pbyte);cdecl;external;
{*
 * @brief Gets the number of span columns.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item of part.
 *
 * @return The count of span columns.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_span_col_get(obj:PEvas_Object; part:Pchar; item:Pchar):word;cdecl;external;
{*
 * @brief Gets the number of span rows.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item of part.
 *
 * @return The count of span rows.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_span_row_get(obj:PEvas_Object; part:Pchar; item:Pchar):word;cdecl;external;
{*
 * @brief Sets the count of columns and rows, which this item will spans for use.
 *
 * @param obj object being edited.
 * @param part part that contain item.
 * @param item the name of the item to set new count of columns spans.
 * @param col new count of the columns spans.
 * @param row new count of the rows spans.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.11
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_span_set(obj:PEvas_Object; part:Pchar; item:Pchar; col:byte; row:byte):TEina_Bool;cdecl;external;
{*
 * @brief Sets the count of columns which this item will spans for use.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item.
 * @param col new count of the columns spans.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_span_col_set(obj:PEvas_Object; part:Pchar; item:Pchar; col:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets the count of rows which this item will spans for use.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param item The name of the item.
 * @param row new count of the rows spans.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.16
  }
{xxxxxxxxxx    EINA_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_part_item_span_row_set(obj:PEvas_Object; part:Pchar; item:Pchar; row:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets the count of columns which this item will spans for use.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 * @param col new count of the columns spans.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_span_col_set(obj:PEvas_Object; part:Pchar; index:dword; col:word):TEina_Bool;cdecl;external;
{*
 * @brief Sets the count of rows which this item will spans for use.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item.
 * @param row new count of the rows spans.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_span_row_set(obj:PEvas_Object; part:Pchar; index:dword; row:word):TEina_Bool;cdecl;external;
{*
 * @brief Gets the number of span columns.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item of part.
 *
 * @return The count of span columns.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_span_col_get(obj:PEvas_Object; part:Pchar; index:dword):word;cdecl;external;
{*
 * @brief Gets the number of span rows.
 *
 * @param obj Object being edited.
 * @param part Part that contain item.
 * @param index Index of the item of part.
 *
 * @return The count of span rows.
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_part_item_index_span_row_get(obj:PEvas_Object; part:Pchar; index:dword):word;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   STATES API   *********************************** }
{**************************************************************************** }
{*
 * @name States API
 * Functions to deal with part states (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the states in the given part.
 *
 * @param obj Object being edited.
 * @param part Part to get the states names list.
 *
 * @return An Eina_List* of string (char *)containing all the states names found
 * in part, including the float value (ex: "default 0.00").
 *
 * Use edje_edit_string_list_free() when you don't need it anymore.
  }
(* Const before type ignored *)
function edje_edit_part_states_list_get(obj:PEvas_Object; part:Pchar):PEina_List;cdecl;external;
{*
 * @brief Sets a new name for the given state in the given part.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state Name of the state to rename.
 * @param value Value of the state to rename.
 * @param new_name The new name for the state.
 * @param new_value The new value for the state.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_name_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; new_name:Pchar; 
           new_value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Creates a new state to the give part.
 *
 * @param obj Object being edited.
 * @param part Part to set the name of the new state.
 * @param name Name for the new state (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE if successfully, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_add(obj:PEvas_Object; part:Pchar; name:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given part state from the edje.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The current name of the state (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE if successfully, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_del(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Checks if a part state with the given name exist.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to check (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE if the part state exist, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_exist(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Copies the state @p from into @p to. If @p to doesn't exist it will be created.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param from State to copy from (not including state value).
 * @param val_from The value of the state to copy from.
 * @param to State to copy into (not including state value).
 * @param val_to The value of the state to copy into.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_copy(obj:PEvas_Object; part:Pchar; from:Pchar; val_from:Tdouble; to:Pchar; 
           val_to:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the 'rel1 relative X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel1 relative X' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel1 relative X' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_relative_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the 'rel1 relative Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel1 relative Y' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel1 relative Y' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_relative_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the 'rel2 relative X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel2 relative X' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel2 relative X' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_relative_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the 'rel2 relative Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel2 relative Y' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel2 relative Y' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_relative_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the 'rel1 relative X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel1 relative X' (not including the state value).
 * @param value The state value.
 * @param x The new 'rel1 relative X' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_relative_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the 'rel1 relative Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel1 relative Y' (not including the state value).
 * @param value The state value.
 * @param y The new 'rel1 relative Y' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_relative_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the 'rel2 relative X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel2 relative X' (not including the state value).
 * @param value The state value.
 * @param x The new 'rel2 relative X' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_relative_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the 'rel2 relative Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel2 relative Y' (not including the state value).
 * @param value The state value.
 * @param y The new 'rel2 relative Y' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_relative_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the 'rel1 offset X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel1 offset X' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel1 offset X' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_offset_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Gets the 'rel1 offset Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel1 offset Y' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel1 offset Y' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_offset_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Gets the 'rel2 offset X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel2 offset X' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel2 offset X' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_offset_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Gets the 'rel2 offset Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get 'rel2 offset Y' (not including the state value).
 * @param value The state value.
 *
 * @return The 'rel2 offset Y' value of the part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_offset_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the 'rel1 offset X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel1 offset X' (not including the state value).
 * @param value The state value.
 * @param x The new 'rel1 offset X' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_offset_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the 'rel1 offset Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel1 offset Y' (not including the state value).
 * @param value The state value.
 * @param y The new 'rel1 offset Y' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_offset_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the 'rel2 offset X' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel2 offset X' (not including the state value).
 * @param value The state value.
 * @param x The new 'rel2 offset X' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_offset_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the 'rel2 offset Y' value of state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set 'rel2 offset Y' (not including the state value).
 * @param value The state value.
 * @param y The new 'rel2 offset Y' value to set'.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_offset_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the part name rel1x is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The state that contain which the part name rel1x is relative to (not including the state value).
 * @param value The state value.
 *
 * @return The part name rel1x is relative to, or NULL if the part is relative to the whole interface.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_to_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Gets the part name rel1y is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The state that contain which the part name rel1y is relative to (not including the state value).
 * @param value The state value.
 *
 * @return The part name rel1y is relative to, or NULL if the part is relative to the whole interface.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_to_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Gets the part name rel2x is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The state that contain which the part name rel2x is relative to (not including the state value).
 * @param value The state value.
 *
 * @return The part name rel2x is relative to, or NULL if the part is relative to the whole interface.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_to_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Gets the part name rel2y is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The state that contain which the part name rel2y is relative to (not including the state value).
 * @param value The state value.
 *
 * @return The part name rel2y is relative to, or NULL if the part is relative to the whole interface.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_to_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the part rel1x is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set rel1x is relative to (not including the state value).
 * @param value The state value.
 * @param rel_to The name of the part that is used as container/parent (NULL make the part relative to the whole interface).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_to_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; rel_to:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the part rel1y is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set rel1y is relative to (not including the state value).
 * @param value The state value.
 * @param rel_to The name of the part that is used as container/parent (NULL make the part relative to the whole interface).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel1_to_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; rel_to:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the part rel2x is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set rel2x is relative to (not including the state value).
 * @param value The state value.
 * @param rel_to The name of the part that is used as container/parent (NULL make the part relative to the whole interface).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_to_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; rel_to:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the part rel2y is relative to.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set rel2y is relative to (not including the state value).
 * @param value The state value.
 * @param rel_to The name of the part that is used as container/parent (NULL make the part relative to the whole interface).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_rel2_to_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; rel_to:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the color of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get color (not including the state value).
 * @param value The state value.
 * @param r A pointer to store the red value.
 * @param g A pointer to store the green value.
 * @param b A pointer to store the blue value.
 * @param a A pointer to store the alpha value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure edje_edit_state_color_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; r:Plongint; 
            g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Gets the color2 of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get color (not including the state value).
 * @param value The state value.
 * @param r A pointer to store the red value.
 * @param g A pointer to store the green value.
 * @param b A pointer to store the blue value.
 * @param a A pointer to store the alpha value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure edje_edit_state_color2_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; r:Plongint; 
            g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Gets the color3 of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get color (not including the state value).
 * @param value The state value.
 * @param r A pointer to store the red value.
 * @param g A pointer to store the green value.
 * @param b A pointer to store the blue value.
 * @param a A pointer to store the alpha value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure edje_edit_state_color3_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; r:Plongint; 
            g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Sets the color of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set color (not including the state value).
 * @param value The state value.
 * @param r The red value of the color.
 * @param g The green value of the color.
 * @param b The blue value of the color.
 * @param a The alpha value of the color.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_color_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; r:longint; 
           g:longint; b:longint; a:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the color2 of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set color (not including the state value).
 * @param value The state value.
 * @param r The red value of the color.
 * @param g The green value of the color.
 * @param b The blue value of the color.
 * @param a The alpha value of the color.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_color2_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; r:longint; 
           g:longint; b:longint; a:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the color3 of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set color (not including the state value).
 * @param value The state value.
 * @param r The red value of the color.
 * @param g The green value of the color.
 * @param b The blue value of the color.
 * @param a The alpha value of the color.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_color3_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; r:longint; 
           g:longint; b:longint; a:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get horizontal align (not including the state value).
 * @param value The state value.
 *
 * @return The horizontal align value for the given state
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_align_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get horizontal align (not including the state value).
 * @param value The state value.
 *
 * @return The vertical align value for the given state
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_align_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the horizontal align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get horizontal align (not including the state value).
 * @param value The state value.
 * @param align The new vertical align value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_align_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; align:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the vertical align value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get vertical align (not including the state value).
 * @param value The state value.
 * @param align The new vertical align value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_align_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; align:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the minimum width value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get minimum width (not including the state value).
 * @param value The state value.
 *
 * @return The minimum width value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_min_w_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the minimum width value of a part state.
 * The minimum width should be greater than 0.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set minimum width (not including the state value).
 * @param value The state value.
 * @param min_w Minimum width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_min_w_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; min_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the minimum height value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get minimum height (not including the state value).
 * @param value The state value.
 *
 * @return The minimum height value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_min_h_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the minimum height value of a part state.
 * The minimum height should be greater than 0.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set minimum height (not including the state value).
 * @param value The state value.
 * @param min_h Minimum height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_min_h_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; min_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the maximum width value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get maximum width (not including the state value).
 * @param value The state value.
 *
 * @return The maximum width value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_max_w_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the maximum width value of a part state.
 * The maximum width should be greater than -1.
 * The value -1 means that state doesn't have any boundaries on width direction.
 * (it can be any size that is bigger than it's min)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set maximum width (not including the state value).
 * @param value The state value.
 * @param max_w Maximum width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_max_w_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; max_w:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the maximum height value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get maximum height (not including the state value).
 * @param value The state value.
 *
 * @return The maximum height value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_max_h_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the maximum height value of a part state.
 * The maximum height should be greater than -1.
 * The value -1 means that state doesn't have any boundaries on height direction.
 * (it can be any size that is bigger than it's min)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set maximum height (not including the state value).
 * @param value The state value.
 * @param max_h Maximum height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_max_h_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; max_h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the multiplier (minmul) width value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get multiplier width (not including the state value).
 * @param value The state value.
 *
 * @return The maximum width value.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_minmul_w_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the multiplier (minmul) width value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set multiplier width (not including the state value).
 * @param value The state value.
 * @param minmul_w Multiplier width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_minmul_w_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; minmul_w:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the multiplier (minmul) height value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get multiplier height (not including the state value).
 * @param value The state value.
 *
 * @return The maximum height value.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_minmul_h_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the multiplier (minmul) height value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set multiplier height (not including the state value).
 * @param value The state value.
 * @param minmul_h Multiplier height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_minmul_h_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; minmul_h:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the fixed width value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fixed width value (not including the state value).
 * @param value The state value.
 *
 * @return The fixed width value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fixed_w_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fixed width value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fixed width value (not including the state value).
 * @param value The state value.
 * @param fixed Fixed width value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fixed_w_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; fixed:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the fixed height value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fixed height value (not including the state value).
 * @param value The state value.
 *
 * @return The fixed height value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fixed_h_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fixed height value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set maximum height (not including the state value).
 * @param value The state value.
 * @param fixed Fixed height value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fixed_h_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; fixed:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the minimum aspect value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get minimum aspect (not including the state value).
 * @param value The state value.
 *
 * @return The minimum aspect
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_aspect_min_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the maximum aspect value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get maximum aspect (not including the state value).
 * @param value The state value.
 *
 * @return The maximum aspect
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_aspect_max_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the minimum aspect value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set minimum aspect (not including the state value).
 * @param value The state value.
 * @param aspect Minimum aspect value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_aspect_min_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; aspect:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the maximum aspect value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set maximum aspect (not including the state value).
 * @param value The state value.
 * @param aspect Maximum aspect value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_aspect_max_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; aspect:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the aspect preference of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get aspect preference (not including the state value).
 * @param value The state value.
 *
 * @return The aspect preference (0 = None, 1 = Vertical, 2 = Horizontal, 3 = Both)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_aspect_pref_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):byte;cdecl;external;
{*
 * @brief Sets the aspect preference of a part state.
 *
 * The available values of aspect preference are:
 * <ul style="list-style-type:none">
 *     <li>0 - None</li>
 *     <li>1 - Vertical</li>
 *     <li>2 - Horizontal</li>
 *     <li>3 - Both</li>
 *     <li>4 - Source</li>
 * </ul>
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set aspect preference (not
 *              including the state value).
 * @param value The state value.
 * @param pref The aspect preference to be set
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_aspect_pref_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; pref:byte):TEina_Bool;cdecl;external;
{*
 * @brief Gets the smooth property for given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the fill horizontal origin relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The smooth value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_smooth_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the smooth property for given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal origin relative to area (not including the state value).
 * @param value The state value.
 * @param smooth The smooth value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_smooth_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; smooth:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the fill type property for given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 *
 * @return The value that represents fill type: 0 for SCALE or 1 for TILE. In case of error (for example, if part type does not match) returns 2.
 * @see edje_edit_state_fill_type_set()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_type_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):byte;cdecl;external;
{*
 * @brief Sets the fill type property for given part state.
 *
 * Sets the image fill type. The available types are:
 * <dl>
 * <dt>SCALE</dt>
 * <dd>image will be scaled accordingly to the 'relative' and 'offset' params values from 'origin' and 'size' blocks.</dd>
 * <dt>TILE</dt>
 * <dd>image will be tiled accordingly to the 'relative' and 'offset' params values from 'origin' and 'size' blocks.</dd>
 * </dl>
 * <b>Important</b>: the part parameter 'min' must be set, it's size of tiled image.
 * If parameter 'max' is set tiled area will be resized accordingly to the 'max' values of part.
 * The default value of fill type is SCALE.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 * @param fill_type The value that represents fill type: 0 for SCALE or 1 for TILE.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_state_fill_type_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_type_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; fill_type:byte):TEina_Bool;cdecl;external;
{*
 * @brief Gets the fill horizontal origin relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the fill horizontal origin relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill horizontal origin relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_relative_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the fill vertical origin relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill vertical origin relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill vertical origin relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_relative_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the fill horizontal origin offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill horizontal origin offset relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill horizontal origin offset relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_offset_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Gets the fill vertical origin offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill vertical origin offset relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill vertical origin offset value.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_offset_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the fill horizontal origin relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal origin relative to area (not including the state value).
 * @param value The state value.
 * @param x The fill horizontal origin value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_relative_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fill horizontal origin relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill vertical origin relative to area (not including the state value).
 * @param value The state value.
 * @param y The fill vertical origin value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_relative_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fill horizontal origin offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal origin offset relative to area (not including the state value).
 * @param value The state value.
 * @param x The fill horizontal origin offset value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_offset_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fill vertical origin offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill vertical origin offset relative to area (not including the state value).
 * @param value The state value.
 * @param y The fill vertical origin offset value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_origin_offset_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the fill horizontal size relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill horizontal size relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill horizontal size relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_relative_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the fill vertical size relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill vertical size relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill vertical size relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_relative_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the fill horizontal size offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill horizontal size
 * offset relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill horizontal size offset relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_offset_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Gets the fill vertical size offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get fill vertical size offset
 * relative to area (not including the state value).
 * @param value The state value.
 *
 * @return The fill vertical size offset relative to area.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_offset_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the fill horizontal size relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal size
 * relative value (not including the state value).
 * @param value The state value.
 * @param x The horizontal size relative value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_relative_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fill vertical size relative value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill vertical size
 * relative value (not including the state value).
 * @param value The state value.
 * @param x The vertical size relative value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_relative_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fill horizontal size offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal size
 * offset relative value (not including the state value).
 * @param value The state value.
 * @param x The horizontal size offset value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_offset_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the fill vertical size offset value of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill vertical size offset
 * relative value (not including the state value).
 * @param value The state value.
 * @param y The vertical size offset value.
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_fill_size_offset_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the visibility of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get visibility (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE if the state is visible, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_visible_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the visibility of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set visibility (not including the state value).
 * @param value The state value.
 * @param visible To set state visible (EINA_TRUE if the state is visible, @c EINA_FALSE otherwise)
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_visible_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; visible:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the color class of the given part state.
 *
 * Remember to free the string with edje_edit_string_free()
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get color class (not including the state value).
 * @param value The state value.
 *
 * @return The current color class.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_color_class_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the color class of the given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set color class (not including the state value).
 * @param value The state value.
 * @param color_class The color class to assign.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_color_class_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; color_class:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of parameters for an external part.
 *
 * DO NOT FREE THE LIST!
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get list of Edje_External_Param (not including the state value).
 * @param value The state value.
 *
 * @return The list of Edje_External_Param.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_params_list_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):PEina_List;cdecl;external;
{*
 * @brief Gets the external parameter type and value.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter to look for.
 * @param type The type of the parameter will be stored here.
 * @param val Pointer to value will be stored here - DO NOT FREE IT!
 *
 * @return @c EINA_TRUE if the parameter was found, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           _type:PEdje_External_Param_Type; val:Ppointer):TEina_Bool;cdecl;external;
{*
 * @brief Gets external parameter of type INT.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type INT (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val The value of the parameter.
 *
 * @return @c EINA_TRUE if successful. @c EINA_FALSE if not found or is of different type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_int_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Gets external parameter of type BOOL.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type BOOL (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val The value of the parameter.
 *
 * @return @c EINA_TRUE if successful. @c EINA_FALSE if not found or is of different type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_bool_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:PEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets external parameter of type DOUBLE.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type DOUBLE (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val The value of the parameter.
 *
 * @return @c EINA_TRUE if successful. @c EINA_FALSE if not found or is of different type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_double_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets external parameter of type STRING.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of
 *              type STRING (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val The value of the parameter.
 *
 * @return @c EINA_TRUE if successful. @c EINA_FALSE if not found or is of
 * different type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_string_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:PPchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets external parameter of type CHOICE.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of
 *        type CHOICE (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val The value of the parameter.
 *
 * @return @c EINA_TRUE if successful. @c EINA_FALSE if not found or is of
 * different type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_choice_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:PPchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the external parameter type and value, adding it if it didn't
 * exist before.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter (not
 *              including the state value).
 * @param value The state value.
 * @param param The name of the parameter set.
 * @param type The type of the parameter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
{*
 * Arguments should have proper sized values matching their types:
 *   - EDJE_EXTERNAL_PARAM_TYPE_INT: int
 *   - EDJE_EXTERNAL_PARAM_TYPE_BOOL: int
 *   - EDJE_EXTERNAL_PARAM_TYPE_DOUBLE: double
 *   - EDJE_EXTERNAL_PARAM_TYPE_STRING: char*
 *   - EDJE_EXTERNAL_PARAM_TYPE_CHOICE: char*
 *
 * @note: The validation of the parameter will occur only if the part
 * is in the same state as the one being modified.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           _type:TEdje_External_Param_Type; args:array of const):TEina_Bool;cdecl;external;
function edje_edit_state_external_param_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           _type:TEdje_External_Param_Type):TEina_Bool;cdecl;external;
{*
 * @brief Sets external parameter of type INT.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of
 *              type INT (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val Value will be stored here.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_int_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sets external parameter of type BOOL.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type BOOL (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val Value will be stored here.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_bool_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets external parameter of type DOUBLE.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type DOUBLE (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val Value will be stored here.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_double_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets external parameter of type STRING.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type STRING (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val Value will be stored here.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_string_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets external parameter of type CHOICE.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get external parameter of type CHOICE (not including the state value).
 * @param value The state value.
 * @param param The name of the parameter.
 * @param val Value will be stored here.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_external_param_choice_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; param:Pchar; 
           val:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the states step parameter values.
 *
 * Step parameter restricts resizing of each dimension to values divisible by
 * its value. This causes the part to jump from value to value while resizing.
 * The default value is "0 0" disabling stepping.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal size
 * relative value (not including the state value).
 * @param value The state value.
 * @param step_x The horizontal step value.
 * @param step_y The vertical step value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_state_step_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_step_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; step_x:longint; 
           step_y:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the states step values.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set fill horizontal size
 * relative value (not including the state value).
 * @param value The state value.
 * @param step_x The pointer to the variable where horizontal step value should be written.
 * @param step_y The pointer to the variable where vertical step value should be written.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_state_step_set()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_step_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; step_x:Plongint; 
           step_y:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the states limit parameter value.
 *
 * Set limit causes the emission of signals when the size of part changes
 * from zero or to a zero size in corresponding to the limit value.
 * For example, the signals emitted on width changing are <i>'limit,width,over'</i>
 * and <i>'limit,width,zero'</i>
 * The available values are:
 * <ul>
 * <li>NONE - 0 (the default value)</li>
 * <li>WIDTH - 1</li>
 * <li>HEIGHT - 2</li>
 * <li>BOTH - 3</li>
 * </ul>
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 * @param limit The value that represents the states limit value in case of success.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_state_limit_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_limit_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; limit:byte):TEina_Bool;cdecl;external;
{*
 * @brief Gets the states limit value.
 *
 * Returns value that represents the states limit value:
 * <ul>
 * <li>NONE - 0 (the default value)</li>
 * <li>WIDTH - 1</li>
 * <li>HEIGHT - 2</li>
 * <li>BOTH - 3</li>
 * </ul>
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 *
 * @return The value that represents the states limit value in case of success, otherwise returns 4.
 * @see edje_edit_state_limit_set()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_limit_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):byte;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   MAP API   *********************************** }
{**************************************************************************** }
{*
 * @name Map API
 * Functions to deal with objects with rotation properties (see @ref edcref).
  }{@ }
{*
 * @brief Gets the flag which enables mapping for the part.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return  @c EINA_TRUE in case if mapping allowed or @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_on_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Enables mapping for the part. Default is 0.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param on The flag which allow mapping for the part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_on_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; on:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the part's name that is used as the 'perspective point'.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state to get perspective (not including the state value).
 * @param value The state value.
 *
 * @return The name of the source part that is used as 'perspective point'.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the part's name that is used as the 'perspective point'.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state to get perspective (not including the state value).
 * @param value The state value.
 * @param source_part The source part's name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; source_part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the part's name that is used as the 'light' for calculating the brightness.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return The name of the source part that is used as 'light'.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_light_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the part that is used as the 'light'.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param source_part The source part's name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_light_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; source_part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets backface_cull value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return backface_cull value of given part state.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_backface_cull_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets backface_cull value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param backface_cull New backface_cull value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_backface_cull_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; backface_cull:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets perspective_on value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return perspective_on value of given part state.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_on_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets perspective_on value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param perspective_on New perspective_on value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_on_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; perspective_on:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets map.alpha value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return map.alpha value of given part state.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_alpha_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets map.alpha value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param alpha New map.alpha value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_alpha_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; alpha:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets map.smooth value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return map.smooth value of given part state.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_smooth_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets map.smooth value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param smooth New map.smooth value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_smooth_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; smooth:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets map.rotation of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param x x-rotation.
 * @param y x-rotation.
 * @param z z-rotation.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_rotation_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Pdouble; 
           y:Pdouble; z:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets map.rotation of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param x x-rotation.
 * @param y x-rotation.
 * @param z z-rotation.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_rotation_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble; 
           y:Tdouble; z:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets map.perspective.focal value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return map.perspective.focal value of given part state.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_focal_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets map.perspective.focal value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param focal New map.perspective.focal value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_focal_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; focal:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets map.perspective.zplane value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return map.perspective.zplane value of given part state.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_zplane_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets map.perspective.zplane value of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param zplane New map.perspective.zplane value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_perspective_zplane_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; zplane:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the part's name that is used as the center rotation.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 *
 * @return The name of the source part that is used as center rotation.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_rotation_center_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets map.zoom (x and y) values of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param x value of x
 * @param y value of y
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.19
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_zoom_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Tdouble; 
           y:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets map.zoom (x and y) values of given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param x variable to store value of x
 * @param y variable to store value of y
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.19
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_zoom_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; x:Pdouble; 
           y:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the part that is used as the center of rotation when rotating the part with this description. If no center is given, the parts original center itself is used for the rotation center.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param source_part The source part's name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_rotation_center_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; source_part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the color for vertex/point of the current part.
 * For more detailed information please @see evas_map_point_color_set().
 *
 * In edje there is (currently) only 4 main point:
 *  - Top-Left (0), Top-Right (1), Bottom-Right (2), Bottom-Left (3).
 *
 *  Default value is 255 255 255 255 for every point.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param idx The index of point.
 * @param r The red value to set.
 * @param g The green color value to set.
 * @param b The blue color value to set.
 * @param a The alpha color value to set.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_point_color_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; idx:longint; 
           r:longint; g:longint; b:longint; a:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the color of given vertex/point of the current part.
 * For more detailed information please @see evas_map_point_color_set().
 *
 * In edje there is (currently) only 4 main point:
 *  - Top-Left (0), Top-Right (1), Bottom-Right (2), Bottom-Left (3).
 *
 *  Default value is 255 255 255 255 for every point.
 *
 * @param obj Object being edited.
 * @param part The name of the part.
 * @param state The name of the state (not including the state value).
 * @param value The state value.
 * @param idx The index of point.
 * @param r The red value to get.
 * @param g The green color value to get.
 * @param b The blue color value to get.
 * @param a The alpha color value to get.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
 * }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_map_point_color_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; idx:longint; 
           r:Plongint; g:Plongint; b:Plongint; a:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the source part for given part state.
 *
 * Set another part content as the content of this part.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 * @param source_name The name of part to be set as source. If NULL is passed, the source will be unset.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_state_proxy_source_get()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_proxy_source_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; source_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source name for given state of part.
 *
 * @note The returned string should be freed with @c eina_stringshare_del().
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 *
 * @return The name of the source part in case of success. Otherwise returns NULL.
 * @see edje_edit_state_proxy_source_set()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_proxy_source_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):PEina_Stringshare;cdecl;external;
{*
 * @brief Sets the source clip for given PROXY part state.
 *
 * The source clipper is ignored or used when rendering the proxy part.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 * @param clip Value to set if ignore or use source cliper.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_proxy_source_clip_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; clip:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source clip for given PROXY part state.
 *
 * The source clipper is ignored or used when rendering the proxy part.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 *
 * @return @c EINA_TRUE in case if source clipper is used, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_proxy_source_clip_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the source visibility for given PROXY part state.
 *
 * Defines if both the proxy and its source object will be visible or not.
 * In case of false flag, the source object will not be visible at all while
 * proxy will still show source object.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 * @param visibility Value to set if source object is visible or not.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_proxy_source_visible_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; visibility:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the source visibility for given PROXY part state.
 *
 * Defines if both the proxy and its source object will be visible or not.
 * In case of false flag, the source object will not be visible at all while
 * proxy will still show source object.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state.
 * @param value The state value.
 *
 * @return @c EINA_TRUE in case when source object visibility is set to true, @c EINA_FALSE otherwise.
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_proxy_source_visible_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   TEXT API   *********************************** }
{**************************************************************************** }
{*
 * @name Text API
 * Functions to deal with text objects (see @ref edcref).
  }{@ }
{*
 * @brief Gets the text of a part state.
 *
 * Remember to free the returned string with edje_edit_string_free().
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get text (not including the state value).
 * @param value The state value.
 *
 * @return A newly allocated string containing the text for the given state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the text of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set text (not including the state value).
 * @param value The state value.
 * @param text The new text to assign.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; text:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets font name for a given part state.
 *
 * Remember to free the returned string using edje_edit_string_free().
 *
 * @param obj Object being edited.
 * @param part The name of the part to get the font of.
 * @param state The state of the part to get the font of.
 * @param value Value of the state.
 *
 * @return Font used by the part or NULL if error or nothing is set.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_font_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets font name for a given part state.
 *
 * Font name can be any alias of an internal font in the Edje file and,
 * if it doesn't match any, Edje will look for a font with the given name
 * in the system fonts.
 *
 * @param obj Object being edited.
 * @param part Part to set the font of.
 * @param state State in which the font is set.
 * @param value Value of the state.
 * @param font The font name to use.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_font_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; font:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the text size of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get text size (not including the state value).
 * @param value The state value.
 *
 * @return The text size or @c -1 on errors.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_size_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):longint;cdecl;external;
{*
 * @brief Sets the text size of a part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set text size (not including the state value).
 * @param value The state value.
 * @param size The new font size to set (in pixel)
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_size_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; size:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the text horizontal align of a part state.
 *
 * The value range is from 0.0(right) to 1.0(left)
 * If the value is between -1.0 and 0.0 then it uses align automatically.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the text horizontal align (not including the state value).
 * @param value The state value.
 *
 * @return The text horizontal align value
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_align_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the text vertical align of a part state.
 *
 * The value range is from 0.0(top) to 1.0(bottom)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the text vertical align (not including the state value).
 * @param value The state value.
 *
 * @return The text horizontal align value
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_align_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the text horizontal align of a part state.
 *
 * The value range is from 0.0(right) to 1.0(left)
 * If the value is between -1.0 and 0.0 then it uses align automatically.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the text horizontal align (not including the state value).
 * @param value The state value.
 * @param align The new text horizontal align value
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_align_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; align:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the text vertical align of a part state.
 *
 * The value range is from 0.0(top) to 1.0(bottom)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the text vertical align (not including the state value).
 * @param value The state value.
 * @param align The new text vertical align value
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_align_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; align:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the text elipsis of a part state.
 *
 * The value range is from 0.0(right) to 1.0(left), and -1.0 (if disabled)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the text elipsis value (not including the state value).
 * @param value The state value.
 *
 * @return The text elipsis value
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_elipsis_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the text vertical align of a part state.
 *
 * The value range is from 0.0(right) to 1.0(left)
 * If the value is in range from -1.0 to 0.0 then ellipsis is disabled.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the text elipsis value (not including the state value).
 * @param value The state value.
 * @param balance The position where to cut the string
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_elipsis_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; balance:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the text part fit it's container horizontally.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the if the text part fit it's container horizontally (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE If the part fit it's container horizontally, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_fit_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the text part should fit it's container horizontally.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the if the text part fit it's container horizontally (not including the state value).
 * @param value The state value.
 * @param fit @c EINA_TRUE to make the text fit it's container horizontally, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_fit_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; fit:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the text part fit it's container vertically.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the if the text part fit it's container vertically (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE If the part fit it's container vertically, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_fit_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the text part should fit it's container vertically.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the if the text part fit it's container vertically (not including the state value).
 * @param value The state value.
 * @param fit @c EINA_TRUE to make the text fit it's container vertically, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_fit_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; fit:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the text part forces the minimum horizontal size of the container to be equal to the minimum horizontal size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the minimum horizontal size of the container to be equal (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE If the part forces container's minimum horizontal size, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_min_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the text part forces the maximum horizontal size of the container to be equal to the maximum horizontal size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the minimum horizontal size of the container to be equal (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE If the part forces container's maximum horizontal size, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_max_x_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the text part forces the minimum vertical size of the container to be equal to the minimum vertical size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the minimum vertical size of the container to be equal (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE If the part forces container's minimum vertical size, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_min_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the text part forces the maximum vertical size of the container to be equal to the maximum vertical size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the maximum vertical size of the container to be equal (not including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE If the part forces container's maximum vertical size, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_max_y_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the text part forces the minimum horizontal size of the container to be equal to the minimum horizontal size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the minimum horizontal size of the container to be equal (not including the state value).
 * @param value The state value.
 * @param v @c EINA_TRUE to make the text force it's forces container's minimum horizontal size, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_min_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; v:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the text part forces the maximum horizontal size of the container to be equal to the maximum horizontal size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the maximum horizontal size of the container to be equal (not including the state value).
 * @param value The state value.
 * @param v @c EINA_TRUE to make the text force it's forces container's maximum horizontal size, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_max_x_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; v:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the text part forces the minimum vertical size of the container to be equal to the minimum vertical size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the minimum vertical size of the container to be equal (not including the state value).
 * @param value The state value.
 * @param v @c EINA_TRUE to make the text force it's forces container's minimum vertical size, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_min_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; v:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets if the text part forces the maximum vertical size of the container to be equal to the maximum vertical size of the text part
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the maximum vertical size of the container to be equal (not including the state value).
 * @param value The state value.
 * @param v @c EINA_TRUE to make the text force it's forces container's maximum vertical size, @c EINA_FALSE otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_max_y_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; v:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets style name for a given part state.
 *
 * @param obj Object being edited.
 * @param part The name of the part to get the style of.
 * @param state The state of the part to get the style of.
 * @param value Value of the state.
 *
 * @return Style used by the part, or NULL if error or nothing is set.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_style_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets style name for a given part state.
 *
 * Causes the part to use the default style and tags defined in the "style" block with the specified name.
 *
 * @param obj Object being edited.
 * @param part Part to set the style of.
 * @param state State in which the style is set.
 * @param value Value of the state.
 * @param style The style name to use. In case when NULL style will removed from textblock part description.
 *
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_style_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; style:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets part name, which used as text source.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the maximum vertical size of
 * the container to be equal (not including the state value).
 * @param value Value of the state.
 *
 * @return The name of part or NULL, if text_source param not a setted.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_text_source_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the source text part for a given part.
 * Causes the part to display the content text of another part and update
 * them as they change.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the maximum vertical size of
 * the container to be equal (not including the state value).
 * @param value Value of the state.
 * @param source The text source part name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_text_source_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets part name, which used as style text source.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the maximum vertical size of
 * @param value Value of the state.
 * The container to be equal (not including the state value).
 *
 * @return The name of part or NULL, if text_source param not a setted.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_source_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the source part which would be used as style for text for a given part.
 * Causes the part to use the text properties (like font and size) of another
 * part and update them as they change.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the maximum vertical size of
 * the container to be equal (not including the state value).
 * @param value Value of the state.
 * @param source The text source part name.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_source_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the text class of the given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get text class (not including the state value).
 * @param value The state value.
 *
 * @return The current text class.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_class_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the text class of the given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set text class (not including the state value).
 * @param value The state value.
 * @param text_class The text class to assign.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_class_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; text_class:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the replacement character string of the given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get replacement character
 * (not including the state value).
 * @param value The state value.
 *
 * @return The current replacement character.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_repch_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets the replacement character string of the given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get replacement character
 * (not including the state value).
 * @param value The state value.
 * @param repch The replacement character string to assign.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_repch_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; repch:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the min and max font size allowed for the text part.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state State in which the part is set.
 * @param value Value of the state.
 * @param min Minimal value of the font size in points (pt).
 * @param max Maximum value of the font size in points (pt).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_size_range_min_max_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; min:Plongint; 
           max:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the min and max font size allowed for the text part.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state State in which the part is set.
 * @param value Value of the state.
 * @param min Minimal value of the font size in points (pt).
 * @param max Maximum value of the font size in points (pt).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_text_size_range_min_max_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; min:longint; 
           max:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all the fonts in the given edje.
 *
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 *
 * @return A list containing all the fonts names found in the edje file.
  }
function edje_edit_fonts_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Adds a new font to the edje file.
 *
 * The newly created font will be available to all the groups in the edje, not only the current one.
 *
 * @param obj Object being edited.
 * @param path The file path to load the font from.
 * @param alias The alias for file, or NULL to use filename
 *
 * @return @c EINA_TRUE if font cat be loaded, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_font_add(obj:PEvas_Object; path:Pchar; alias:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes font from the edje file.
 *
 * The font will be removed from all the groups in the edje, not only the current one.
 *
 * @param obj Object being edited.
 * @param alias The font alias
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.(including the
 * case when the alias is not valid).
  }
(* Const before type ignored *)
function edje_edit_font_del(obj:PEvas_Object; alias:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets font path for a given font alias.
 *
 * Remember to free the string with edje_edit_string_free()
 *
 * @param obj Object being edited.
 * @param alias The font alias.
 *
 * @return The path of the given font alias.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_font_path_get(obj:PEvas_Object; alias:Pchar):Pchar;cdecl;external;
{@ }
{**************************************************************************** }
{***********************   IMAGE SET API   ********************************** }
{**************************************************************************** }
{*
 * @name Image Set API
 * Functions to deal with image objects (see @ref edcref).
  }{@ }
{*
 * @brief Checks if given image name is set of images or not.
 *
 * @param obj Object being edited.
 * @param image a name to check if it is set or not.
 *
 * @return @c EINA_TRUE in case when given name is set, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_exists(obj:PEvas_Object; image:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets id of image set.
 *
 * @param obj Object being edited.
 * @param name image set's name.
 *
 * @return The id of the given image name.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_id_get(obj:PEvas_Object; name:Pchar):longint;cdecl;external;
{*
 * @brief Renames image set.
 *
 * @param obj Object being edited.
 * @param set image set's name.
 * @param new_set new name of image set.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_image_set_rename(obj:PEvas_Object; set:Pchar; new_set:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all the image sets in the given edje.
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 *
 * @return A List containing all image sets names found in the edje file.
 *
 * @since 1.18
  }
function edje_edit_image_set_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Gets list of (Edje_Part_Image_Use *) - group-part-state triplets where given
 * set is used
 *
 * Use edje_edit_image_usage_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 * @param name The name of the image.
 * @param first_only If @c EINA_TRUE, return only one triplet.
 *
 * @return Eina_List containing Edje_Part_Image_Use if successful, NULL otherwise
  }
(* Const before type ignored *)
function edje_edit_set_usage_list_get(obj:PEvas_Object; name:Pchar; first_only:TEina_Bool):PEina_List;cdecl;external;
{*
 * @brief Adds new image set.
 *
 * @param obj Object being edited.
 * @param name image set's name.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes image set.
 *
 * Can't delete set if it is used by any part.
 *
 * @param obj Object being edited.
 * @param name image set's name.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all images inside of given set in the given edje.
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 * @param name name of image set.
 *
 * @return A List containing all images found inside of given set in the edje file.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_images_list_get(obj:PEvas_Object; name:Pchar):PEina_List;cdecl;external;
{*
 * @brief Adds image to set.
 *
 * Add image to given set. If image is not exist inside of edje
 * collection then function @see edje_edit_image_add should be
 * used to get image added to edje collection.
 * This function uses only already added functions
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param name image set's name.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise (and when image is not exist).
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_image_set_image_add(obj:PEvas_Object; set_name:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes image on current position from set.
 *
 * Remove image from given set. To be sure what kind of image will be
 * deleted, firstly check it's position via
 * @see edje_edit_image_set_images_list_get function.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image to be deleted.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_del(obj:PEvas_Object; set_name:Pchar; place:dword):TEina_Bool;cdecl;external;
{*
 * @brief Gets min size of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param w Where to store the width min value.
 * @param h Where to store the height min value.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_min_get(obj:PEvas_Object; set_name:Pchar; place:dword; w:Plongint; h:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets min size of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param w New value of picture's min width.
 * @param h New value of picture's min height.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_min_set(obj:PEvas_Object; set_name:Pchar; place:dword; w:longint; h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets max size of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param w Where to store the width max value.
 * @param h Where to store the height max value.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_max_get(obj:PEvas_Object; set_name:Pchar; place:dword; w:Plongint; h:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets max size of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param w New value of picture's max width.
 * @param h New value of picture's max height.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_max_set(obj:PEvas_Object; set_name:Pchar; place:dword; w:longint; h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets border of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param l Where to store the left border value.
 * @param r Where to store the right border value.
 * @param b Where to store the bottom border value.
 * @param t Where to store the top border value.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_border_get(obj:PEvas_Object; set_name:Pchar; place:dword; l:Plongint; r:Plongint; 
           b:Plongint; t:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets border of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param l New value of left border value.
 * @param r New value of right border value.
 * @param b New value of bottom border value.
 * @param t New value of top border value.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_border_set(obj:PEvas_Object; set_name:Pchar; place:dword; l:longint; r:longint; 
           b:longint; t:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets border scale of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 *
 * @return @c border scale value on success, @c -1 otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_border_scale_get(obj:PEvas_Object; set_name:Pchar; place:dword):Tdouble;cdecl;external;
{*
 * @brief Sets border scale of set's image.
 *
 * @param obj Object being edited.
 * @param set_name name of image set.
 * @param place position of image.
 * @param scale_by New border scale.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
function edje_edit_image_set_image_border_scale_set(obj:PEvas_Object; set_name:Pchar; place:dword; scale_by:Tdouble):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   IMAGES API   *********************************** }
{**************************************************************************** }
{*
 * @name Images API
 * Functions to deal with image objects (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the images in the given edje.
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 *
 * @return A List containing all images names found in the edje file.
  }
function edje_edit_images_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Adds an new image to the image collection
 *
 * This function add the given image inside the edje. Don't add a new image part
 * but only put the image inside the edje file. It actually write directly to
 * the file so you don't have to save.
 * After you have to create a new image_part that use this image. Note that all
 * the parts in the edje share the same image collection, thus you can/must use
 * the same image for different part.
 *
 * The format of the image files that can be loaded depend on the evas engine on your system
 *
 * @param obj Object being edited.
 * @param path The name of the image file to include in the edje.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_image_add(obj:PEvas_Object; path:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes an image from the image collection
 *
 * It actually write directly to the file so you don't have to save.
 * Can't delete image if it is used by any part.
 *
 * @param obj Object being edited.
 * @param name The name of the image file to include in the edje.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.(including the
 * case when the name is not valid or image is in use).
  }
(* Const before type ignored *)
function edje_edit_image_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Replaces one image in all descriptions.
 *
 * @param obj Object being edited.
 * @param name The name of the image to replace.
 * @param new_name The new_name of the image to replace with.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.(including the
 * case when one of the names is not valid)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_image_replace(obj:PEvas_Object; name:Pchar; new_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Renames image.
 *
 * @param obj Object being edited.
 * @param name The name of the image to be renamed.
 * @param new_name The new_name of the image.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.(including the
 * case when one of the names is not valid)
 *
 * @since 1.13
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_image_rename(obj:PEvas_Object; name:Pchar; new_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets list of (Edje_Part_Image_Use *) - group-part-state triplets where given
 * image is used.
 *
 * Important! Image can also be used inside of set and plenty of times, so for each use
 * inside of set triplet would set "set's" name into group name, and it's state
 * value would be -1. Every other fields will be 0.
 *
 * Use edje_edit_image_usage_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 * @param name The name of the image.
 * @param first_only If @c EINA_TRUE, return only one triplet.
 *
 * @return Eina_List containing Edje_Part_Image_Use if successful, NULL otherwise
  }
(* Const before type ignored *)
function edje_edit_image_usage_list_get(obj:PEvas_Object; name:Pchar; first_only:TEina_Bool):PEina_List;cdecl;external;
{*
 * @brief Frees an Eina_List of (Edje_Part_Image_Use *) allocated by an edje_edit_image_usage_list_get() or
 * an edje_edit_vector_usage_list_get() function.
 *
 * @param lst List of strings to free.
  }
procedure edje_edit_image_usage_list_free(lst:PEina_List);cdecl;external;
{*
 * @brief Adds an image entry to the image collection.
 *
 * This function adds the given image entry to the edje image collection. The
 * image needs to be inside the eet already, with key name "images/id". After
 * you have to create a new image_part that use this image, referring to it as
 * "name". Note that all the parts in the edje share the same image collection,
 * thus you can/must use the same image for different part.
 *
 * @param obj Object being edited.
 * @param name The image entry name.
 * @param id The image id.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_image_data_add(obj:PEvas_Object; name:Pchar; id:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets normal image name for a given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the name that is being used (not including the state value).
 * @param value The state value.
 *
 * @return The name of the image used by state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets normal image for a given part state.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the image that will be used (not including the state value).
 * @param value The state value.
 * @param image The name of the image (must be an image contained in the edje file).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; image:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets normal vector name for a given part state.
 * Part should be of type VECTOR
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the name that is being used (not including the state value).
 * @param value The state value.
 *
 * @return The name of the vector used by state.
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_vector_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Sets normal vector name for a given part state.
 * Part should be of type VECTOR
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the vector that will be used (not including the state value).
 * @param value The state value.
 * @param image The name of the vector (must be contained in the edje file).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_vector_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; image:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets image id for a given image name.
 *
 * @param obj Object being edited.
 * @param image_name The image name.
 *
 * @return The id of the given image name.
  }
(* Const before type ignored *)
function edje_edit_image_id_get(obj:PEvas_Object; image_name:Pchar):longint;cdecl;external;
{*
 * @brief Gets compression type for the given image.
 *
 * @param obj Object being edited.
 * @param image The name of the image.
 *
 * @return One of Image Compression types.
 * (EDJE_EDIT_IMAGE_COMP_RAW, EDJE_EDIT_IMAGE_COMP_USER, EDJE_EDIT_IMAGE_COMP_COMP, EDJE_EDIT_IMAGE_COMP_LOSSY[_ETC1]).
  }
(* Const before type ignored *)
function edje_edit_image_compression_type_get(obj:PEvas_Object; image:Pchar):TEdje_Edit_Image_Comp;cdecl;external;
{*
 * @brief Sets compression type for the given image.
 *
 * @param obj Object being edited.
 * @param image The name of the image.
 * @param ic Edje_Edit_Image_Comp.
 * (EDJE_EDIT_IMAGE_COMP_RAW, EDJE_EDIT_IMAGE_COMP_USER, EDJE_EDIT_IMAGE_COMP_COMP, EDJE_EDIT_IMAGE_COMP_LOSSY[_ETC1]).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_image_compression_type_set(obj:PEvas_Object; image:Pchar; ic:TEdje_Edit_Image_Comp):TEina_Bool;cdecl;external;
{*
 * @brief Gets compression rate for the given image.
 *
 * @param obj Object being edited.
 * @param image The name of the image.
 *
 * @return The compression rate (if the image is @c
 *         EDJE_EDIT_IMAGE_COMP_LOSSY[_ETC1]) or < 0, on errors.
  }
(* Const before type ignored *)
function edje_edit_image_compression_rate_get(obj:PEvas_Object; image:Pchar):longint;cdecl;external;
{*
 * @brief Gets the image border of a part state.
 *
 * Pass NULL to any of [r,g,b,a] to get only the others.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the image border (not
 *              including the state value).
 * @param value The state value.
 * @param l A pointer to store the left value
 * @param r A pointer to store the right value
 * @param t A pointer to store the top value
 * @param b A pointer to store the bottom value
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure edje_edit_state_image_border_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; l:Plongint; 
            r:Plongint; t:Plongint; b:Plongint);cdecl;external;
{*
 * @brief Sets the image border of a part state.
 *
 * Pass -1 to any of [l,r,t,b] to leave the value untouched.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the image border (not
 *              including the state value).
 * @param value The state value.
 * @param l Left border value (or -1).
 * @param r Right border value (or -1).
 * @param t Top border value (or -1).
 * @param b Bottom border value (or -1).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; l:longint; 
           r:longint; t:longint; b:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the border scale value of a part state.
 *
 * This value tells Edje if the border should be scaled by
 * the object/global edje scale factors
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the image border scale (not
 *              including the state value).
 * @param value The state value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_scale_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the border scale value of a part state.
 *
 * This value tells Edje if the border should be scaled by
 * the object/global edje scale factors
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the image border scale (not
 *              including the state value).
 * @param value The state value.
 * @param scale New image border scale value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_scale_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; scale:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Gets the border scale by value of a part state.
 *
 * Valid values are: 0.0 or bigger (0.0 or 1.0 to turn it off)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the image border scale by (not
 *              including the state value).
 * @param value The state value.
 *
 * @return border scaling value.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_scale_by_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Sets the border scale by value of a part state.
 *
 * Valid values are: 0.0 or bigger (0.0 or 1.0 to turn it off)
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the image border scale by (not
 *              including the state value).
 * @param value The state value.
 * @param scale New image border scale value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_scale_by_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; scale:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets if the image center should be draw.
 *
 * 1 or 2 means to draw the center, 0 to don't draw it.
 * If 1 - then the center will apply alpha channel.
 * If 2 (SOLID mode) - then the center of an image wont have alpha channel (Just black color).
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the image border fill (not including the state value).
 * @param value The state value.
 *
 * @return @c 2 if the center of the bordered image is draw without alpha, @c 1 drawing with alpha and @c 0 not drawing the center.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_fill_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):byte;cdecl;external;
{*
 * @brief Sets if the image center should be draw.
 *
 * 1 or 2 means to draw the center, 0 to don't draw it.
 * If 1 - then the center will apply alpha channel.
 * If 2 (SOLID mode) - then the center of an image wont have alpha channel (Just black color).
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to set the image border fill (not including the state value).
 * @param value The state value.
 * @param fill Fill to be set. 1 or 2 if the center of the bordered image is draw, 0 otherwise.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_image_border_fill_set(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; fill:byte):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of all the tweens images in the given part state.
 *
 * Use edje_edit_string_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to get the list of all the tweens images (not including the state value).
 * @param value The state value.
 *
 * @return A string list containing all the image name that form a tween animation in the given part state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_tweens_list_get(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble):PEina_List;cdecl;external;
{*
 * @brief Adds a new tween frame to the given part state.
 *
 * The tween param must be the name of an existing image.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to add a new tween frame (not including the state value).
 * @param value The state value.
 * @param tween The name of the image to add.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_tween_add(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; tween:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Inserts a new tween frame to the given part state into a specific place.
 *
 * The tween param must be the name of an existing image.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to add a new tween frame (not including the state value).
 * @param value The state value.
 * @param tween The name of the image to add.
 * @param place Place to be added. It can't be less than 0 or more than current size of tweens.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_tween_insert_at(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; tween:Pchar; 
           place:longint):TEina_Bool;cdecl;external;
{*
 * @brief Removes the first tween with the given name.
 *
 * The image is not removed from the edje.
 *
 * @param obj Object being edited.
 * @param part Part that contain state.
 * @param state The name of the state to delete the tween (not including the state value).
 * @param value The state value.
 * @param tween The name of the image to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_state_tween_del(obj:PEvas_Object; part:Pchar; state:Pchar; value:Tdouble; tween:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   VECTORS API   *********************************** }
{**************************************************************************** }
{*
 * @brief Gets vector id for a given vector name.
 *
 * @param obj Object being edited.
 * @param vector_name The vector name.
 *
 * @return The id of the given vector name.
 * @since 1.19
  }
(* Const before type ignored *)
function edje_edit_vector_id_get(obj:PEvas_Object; vector_name:Pchar):longint;cdecl;external;
{*
 * @name Vectors API
 * Functions to deal with vector objects of images (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the vectors in the given edje.
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 *
 * @return A List containing all vector names found in the edje file.
 * @since 1.19
  }
function edje_edit_vectors_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Deletes vector from the vector collection
 *
 * It actually write directly to the file so you don't have to save.
 * Can't delete vector if it is used by any part.
 *
 * @param obj Object being edited.
 * @param name The name of the vector file.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise (including the
 * case when the name is not valid or vector is in use).
 * @since 1.19
  }
(* Const before type ignored *)
function edje_edit_vector_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets list of (Edje_Part_Image_Use *) - group-part-state triplets where given
 * vector is used.
 *
 * Use edje_edit_image_usage_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 * @param name The name of the vector.
 * @param first_only If EINA_TRUE, return only one triplet.
 *
 * @return Eina_List containing Edje_Part_Image_Use if successful, NULL otherwise
 * @since 1.19
  }
(* Const before type ignored *)
function edje_edit_vector_usage_list_get(obj:PEvas_Object; name:Pchar; first_only:TEina_Bool):PEina_List;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   SOUNDS API   *********************************** }
{**************************************************************************** }
{*
 * @name Sounds API
 * Functions to deal with sound objects (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the sounds samples in the given edje.
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 *
 * @return A List containing all sounds samples names found in the edje file.
 * @since 1.11
  }
function edje_edit_sound_samples_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Gets the list of all the sounds tones in the given edje.
 * Use edje_edit_string_list_free() when you don't need the list anymore.
 *
 * @param obj Object being edited.
 *
 * @return A List containing all sounds tones names found in the edje file.
 * @since 1.11
  }
function edje_edit_sound_tones_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Adds new sound sample to samples collection.
 *
 * This function adds the given sound file to the edje collection.
 * The added sound sample could be used by PLAY_SAMPLE action in any program
 * of any group that is in the current collection.
 * The quality of added sound by default is uncompressed (RAW).
 *
 * The available formats list of the sound files that can be loaded depends
 * on the evas engine on your system.
 *
 * @param obj Object being edited.
 * @param name The name that will identify sample.
 * @param snd_src The name of the sound file to add.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_sound_sample_del()
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_sound_sample_add(obj:PEvas_Object; name:Pchar; snd_src:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes sound sample from the collection.
 *
 * Deletes sound sample from collection by its name. After successful deletion
 * all PLAY_SAMPLE actions in all programs of all groups of current collection
 * that use deleted sound will be deleted.
 *
 * @param obj Object being edited.
 * @param name The name of the sound to be deleted from the edje.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_sound_sample_add()
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_sample_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Adds new tone to the collection.
 *
 * This function adds new tone with given frequency to the edje collection.
 * The added sound sample could be used by PLAY_TONE action in any program
 * of any group that is in the current collection.
 *
 * @param obj Object being edited.
 * @param name The name that will identify tone.
 * @param frequency Frequency of added tone. This value should be in range of 20 to 20000 inclusive.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @see edje_edit_sound_tone_del()
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_tone_add(obj:PEvas_Object; name:Pchar; frequency:longint):TEina_Bool;cdecl;external;
{*
 * @brief Deletes tone from the collection.
 *
 * Deletes tone from collection by its name. After successful deletion
 * all PLAY_TONE actions in all programs of all groups of current collection
 * that use deleted sound will be deleted.
 *
 * @param obj Object being edited.
 * @param name The name of the tone to be deleted from the edje.
 *
 * @return @c EINA_TRUE if successful, @c EINA_FALSE otherwise.
 * @see edje_edit_sound_tone_add()
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_tone_del(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the sound quality compression.
 *
 * @param obj Object being edited.
 * @param sound The name of the sample.
 *
 * @return Quality of the compression of the sample sound.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_compression_rate_get(obj:PEvas_Object; sound:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the sound quality compression.
 *
 * @param obj Object being edited.
 * @param sound The name of the sample.
 * @param rate Quality of the compression.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_compression_rate_set(obj:PEvas_Object; sound:Pchar; rate:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets the frequency of tone.
 *
 * @param obj Object being edited.
 * @param name The name of the tone.
 * @param frequency The value of frequency of tone. This value has to be in range of 20 to 20000 inclusive.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @see edje_edit_sound_tone_frequency_get()
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_tone_frequency_set(obj:PEvas_Object; name:Pchar; frequency:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the frequency of tone.
 *
 * @param obj Object being edited.
 * @param name The name of the tone.
 *
 * @return The frequency of tone if successful, otherwise returns -1.
 * @see edje_edit_sound_tone_frequency_set()
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_tone_frequency_get(obj:PEvas_Object; name:Pchar):longint;cdecl;external;
{*
 * @brief Gets the sound type compression.
 *
 * @param obj Object being edited.
 * @param name The name of the sample.
 *
 * @return Compression type of the sample sound.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_compression_type_get(obj:PEvas_Object; name:Pchar):TEdje_Edit_Sound_Comp;cdecl;external;
{*
 * @brief Sets the sound type compression.
 *
 * @param obj Object being edited.
 * @param name The name of the sample.
 * @param sc Edje_Edit_Sound_Comp
 * (@c EDJE_EDIT_SOUND_COMP_RAW, @c EDJE_EDIT_SOUND_COMP_COMP, @c EDJE_EDIT_SOUND_COMP_LOSSY, @c EDJE_EDIT_SOUND_COMP_AS_IS).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_compression_type_set(obj:PEvas_Object; name:Pchar; sc:TEdje_Edit_Sound_Comp):TEina_Bool;cdecl;external;
{*
 * @brief Gets the certain sound data from the edje object.
 *
 * @param obj Object being edited.
 * @param sample_name The name of the sound.
 *
 * @return buf The buffer that contains data of the sound. To free the resources use eina_binbuf_free().
 * @since 1.11
  }
(* Const before type ignored *)
function edje_edit_sound_samplebuffer_get(obj:PEvas_Object; sample_name:Pchar):PEina_Binbuf;cdecl;external;
{*
 * @brief Gets the name of sample source.
 *
 * @param obj Object being edited.
 * @param sample_name The name of the sample.
 *
 * @return snd_src The sample source name.
 * @since 1.11
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_sound_samplesource_get(obj:PEvas_Object; sample_name:Pchar):Pchar;cdecl;external;
{@ }
{**************************************************************************** }
{************************   SPECTRUM API   ********************************** }
{**************************************************************************** }
{*
 * @name Spectrum API
 * Functions to manage spectrum (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the spectrum in the given edje object.
 *
 * Use edje_edit_string_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 *
 * @return A list containing all the spectra names.
  }
function edje_edit_spectrum_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Adds a new spectra in the given edje object.
 *
 * @param obj Object being edited.
 * @param name The name of the spectra to include in the edje.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_spectra_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given spectra from the edje object.
 *
 * @param obj Object being edited.
 * @param spectra The name of the spectra to delete.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_spectra_del(obj:PEvas_Object; spectra:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Changes the name of the given spectra.
 *
 * @param obj Object being edited.
 * @param spectra The name of the current spectra.
 * @param name The new name to assign.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_spectra_name_set(obj:PEvas_Object; spectra:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the number of stops in the given spectra.
 *
 * @param obj Object being edited.
 * @param spectra The name of the spectra.
 *
 * @return The number of stops (or 0 on errors).
  }
(* Const before type ignored *)
function edje_edit_spectra_stop_num_get(obj:PEvas_Object; spectra:Pchar):longint;cdecl;external;
{*
 * @brief Sets the number of stops in the given spectra.
 *
 * @param obj Object being edited.
 * @param spectra The name of the spectra.
 * @param num The number of stops you want
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_spectra_stop_num_set(obj:PEvas_Object; spectra:Pchar; num:longint):TEina_Bool;cdecl;external;
{*
 * @brief Gets the colors of the given stop.
 *
 * @param obj Object being edited.
 * @param spectra The name of the spectra.
 * @param stop_number The number of the stop,
 * @param r Where to store the red color value,
 * @param g Where to store the green color value,
 * @param b Where to store the blue color value,
 * @param a Where to store the alpha color value,
 * @param d Where to store the delta stop value,
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_spectra_stop_color_get(obj:PEvas_Object; spectra:Pchar; stop_number:longint; r:Plongint; g:Plongint; 
           b:Plongint; a:Plongint; d:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Sets the colors of the given stop.
 *
 * @param obj Object being edited.
 * @param spectra The name of the spectra.
 * @param stop_number The number of the stops,
 * @param r The red color value to set,
 * @param g The green color value to set,
 * @param b The blue color value to set,
 * @param a The alpha color value to set,
 * @param d The delta stop value to set,
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_spectra_stop_color_set(obj:PEvas_Object; spectra:Pchar; stop_number:longint; r:longint; g:longint; 
           b:longint; a:longint; d:longint):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{************************   PROGRAMS API   ********************************** }
{**************************************************************************** }
{*
 * @name Programs API
 * Functions to deal with programs (see @ref edcref).
  }{@ }
{*
 * @brief Gets the list of all the programs in the given edje object.
 *
 * Use edje_edit_string_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 *
 * @return A list containing all the program names.
  }
function edje_edit_programs_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Adds a new program to the edje file
 *
 * If a program with the same name just exist the function will fail.
 *
 * @param obj Object being edited.
 * @param name The name of the new program.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_add(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Removes the given program from the edje file.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to remove.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_del(obj:PEvas_Object; prog:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if a program with the given name exist in the edje object.
 *
 * @param obj Object being edited.
 * @param prog The prog of the program that will be searched.
 *
 * @return @c EINA_TRUE if the program exist, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_exist(obj:PEvas_Object; prog:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Runs the given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to execute.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_run(obj:PEvas_Object; prog:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Stops all running programs.
 *
 * @param obj Object being edited.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
function edje_edit_program_stop_all(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Sets parts into intermediate state of programs transition.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to use. Program should have action STATE_SET.
 * @param pos State of transition to be setted. Value from 0.0 to 1.0.
 * 0.0 represents the start state, 1.0 - the final state. Other values will set
 * parts to an intermediate state taking into account programs transition type.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_state_set(obj:PEvas_Object; prog:Pchar; pos:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets a new name for the given program.
 *
 * @param obj Object being edited.
 * @param prog The current program name.
 * @param new_name The new name to assign.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_name_set(obj:PEvas_Object; prog:Pchar; new_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets source of a given program.
 *
 * Remember to free the returned string using edje_edit_string_free().
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get source.
 *
 * @return The source value per program.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_source_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets source of the given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set source.
 * @param source The new source value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_source_set(obj:PEvas_Object; prog:Pchar; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets signal of a given program.
 *
 * Remember to free the returned string using edje_edit_string_free().
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the signal.
 *
 * @return The signal value for program.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_signal_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets signal of the given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the signal.
 * @param signal The new signal value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_signal_set(obj:PEvas_Object; prog:Pchar; signal:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets in.from of a given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the delay.
 *
 * @return The delay.
  }
(* Const before type ignored *)
function edje_edit_program_in_from_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets in.from of a given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the delay.
 * @param seconds Number of seconds to delay the program execution
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_in_from_set(obj:PEvas_Object; prog:Pchar; seconds:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets in.range of a given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get random delay.
 *
 * @return The delay random.
  }
(* Const before type ignored *)
function edje_edit_program_in_range_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets in.range of a given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set random delay.
 * @param seconds Max random number of seconds to delay.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_in_range_set(obj:PEvas_Object; prog:Pchar; seconds:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the action of a given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the action.
 *
 * @return The action type, or @c -1 on errors.
 * Action can be one of EDJE_ACTION_TYPE_NONE, _STATE_SET, ACTION_STOP, SIGNAL_EMIT, DRAG_VAL_SET, _DRAG_VAL_STEP, _DRAG_VAL_PAGE, _SCRIPT
  }
(* Const before type ignored *)
function edje_edit_program_action_get(obj:PEvas_Object; prog:Pchar):TEdje_Action_Type;cdecl;external;
{*
 * @brief Sets the action of a given program.
 *
 * Action can be one of EDJE_ACTION_TYPE_NONE, _STATE_SET, ACTION_STOP, SIGNAL_EMIT, DRAG_VAL_SET, _DRAG_VAL_STEP, _DRAG_VAL_PAGE, _SCRIPT
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the action.
 * @param action The new action type.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_action_set(obj:PEvas_Object; prog:Pchar; action:TEdje_Action_Type):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of the targets for the given program.
 *
 * Use edje_edit_string_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the list of the targets.
 *
 * @return A list with all the targets names, or NULL on error.
  }
(* Const before type ignored *)
function edje_edit_program_targets_get(obj:PEvas_Object; prog:Pchar):PEina_List;cdecl;external;
{*
 * @brief Adds a new target program to the list of 'targets' in the given program.
 *
 * If program action is @c EDJE_ACTION_TYPE_ACTION_STOP, then 'target'
 * must be an existing program name. If it's @c
 * EDJE_ACTION_TYPE_STATE_SET, then 'target' must be an existing part
 * name.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to add a new target.
 * @param target The name of the new target itself.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_target_add(obj:PEvas_Object; prog:Pchar; target:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Adds a new target program to certain place in list of 'targets' in the given program.
 *
 * If program action is @c EDJE_ACTION_TYPE_ACTION_STOP, then 'target'
 * must be an existing program name. If it's @c
 * EDJE_ACTION_TYPE_STATE_SET, then 'target' must be an existing part
 * name.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to add a new target.
 * @param target The name of the new target itself.
 * @param place Specific play for target to be inserted into.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_target_insert_at(obj:PEvas_Object; prog:Pchar; target:Pchar; place:longint):TEina_Bool;cdecl;external;
{*
 * @brief Deletes a target from the list of 'targets' in the given program.
 *
 * If program action is EDJE_ACTION_TYPE_ACTION_STOP then 'target' must be an existing program name.
 * If action is EDJE_ACTION_TYPE_STATE_SET then 'target' must be an existing part name.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to del a target from the list of targets.
 * @param target The name of another program or another part.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_target_del(obj:PEvas_Object; prog:Pchar; target:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Clears the 'targets' list of the given program
 *
 * @param obj Object being edited.
 * @param prog The name of the program to clear the 'targets' list.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_targets_clear(obj:PEvas_Object; prog:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of action that will be run after the give program.
 *
 * Use edje_edit_string_list_free() when you don't need it anymore.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the list of actions
 *
 * @return A list with all program names, or NULL on error.
  }
(* Const before type ignored *)
function edje_edit_program_afters_get(obj:PEvas_Object; prog:Pchar):PEina_List;cdecl;external;
{*
 * @brief Adds a new program name to the list of 'afters' in the given program.
 *
 * All the programs listed in 'afters' will be executed after program execution.
 *
 * @param obj Object being edited.
 * @param prog The name of the program that contains the list of afters
 * @param after The name of another program to add to the afters list
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_after_add(obj:PEvas_Object; prog:Pchar; after:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Adds a new program name into specific place in list of 'afters' in the given program.
 *
 * All the programs listed in 'afters' will be executed after program execution.
 *
 * @param obj Object being edited.
 * @param prog The name of the program that contains the list of afters
 * @param after The name of another program to add to the afters list
 * @param place Specific place for after to be inserted into. Note that if place is greater than total number of afters then it would append to the end of list
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
 *
 * @since 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_after_insert_at(obj:PEvas_Object; prog:Pchar; after:Pchar; place:longint):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given program from the list of 'afters' of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program from where to remove the after.
 * @param after The name of the program to remove from the list of afters.
 *
 * @return @c EINA_TRUE is successful or not in the list, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_after_del(obj:PEvas_Object; prog:Pchar; after:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Clears the 'afters' list of the given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to clear the 'afters' list.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_afters_clear(obj:PEvas_Object; prog:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the state for the given program.
 *
 * In a STATE_SET action this is the name of state to set.
 * In a SIGNAL_EMIT action is the name of the signal to emit.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the state.
 *
 * @return The name of the state.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_state_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets api's name of a program.
 *
 * @param obj Object being edited.
 * @param prog Name of program.
 *
 * @return Name of the api if successful, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_api_name_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets api's description of a program.
 *
 * @param obj Object being edited.
 * @param prog Name of program.
 *
 * @return Description of the api if successful, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_api_description_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets api's name of a program.
 *
 * @param obj Object being edited.
 * @param prog Name of the part.
 * @param name New name for the api property.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_api_name_set(obj:PEvas_Object; prog:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets api's description of a program.
 *
 * @param obj Object being edited.
 * @param prog Name of the program.
 * @param description New description for the api property.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_api_description_set(obj:PEvas_Object; prog:Pchar; description:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets the state for the given program.
 *
 * In a STATE_SET action this is the name of state to set.
 * In a SIGNAL_EMIT action is the name of the signal to emit.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set a state.
 * @param state The name of the state to set (not including the state value)
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_state_set(obj:PEvas_Object; prog:Pchar; state:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the value of state for the given program.
 *
 * In a STATE_SET action this is the value of state to set.
 * Not used on SIGNAL_EMIT action.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the value of state.
 *
 * @return The value of state for the program.
  }
(* Const before type ignored *)
function edje_edit_program_value_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the value of state for the given program.
 *
 * In a STATE_SET action this is the value of state to set.
 * Not used on SIGNAL_EMIT action.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the value of state.
 * @param value The vale to set.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_value_set(obj:PEvas_Object; prog:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the state2 for the given program
 *
 * In a STATE_SET action is not used
 * In a SIGNAL_EMIT action is the source of the emitted signal.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the state2.
 *
 * @return The source to emit for the program.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_state2_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the state2 for the given program
 *
 * In a STATE_SET action is not used
 * In a SIGNAL_EMIT action is the source of the emitted signal.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the state2.
 * @param state2 The name of the state to set.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_state2_set(obj:PEvas_Object; prog:Pchar; state2:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the value of state2 for the given program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the state2 value.
 *
 * @return The vale of the state2 for the program.
  }
(* Const before type ignored *)
function edje_edit_program_value2_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the value2 of state for the given program.
 *
 * This is used in DRAG_ACTION
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the state2 value.
 * @param value The value of the state2 to set.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_value2_set(obj:PEvas_Object; prog:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the type of transition to use when apply animations.
 *
 * Can be one of: EDJE_TWEEN_MODE_NONE, EDJE_TWEEN_MODE_LINEAR, EDJE_TWEEN_MODE_SINUSOIDAL, EDJE_TWEEN_MODE_ACCELERATE or EDJE_TWEEN_MODE_DECELERATE.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the transition.
 *
 * @return The type of transition used by program.
  }
(* Const before type ignored *)
function edje_edit_program_transition_get(obj:PEvas_Object; prog:Pchar):TEdje_Tween_Mode;cdecl;external;
{*
 * @brief Sets the type of transition to use when apply animations.
 *
 * Can be one of: EDJE_TWEEN_MODE_NONE, EDJE_TWEEN_MODE_LINEAR, EDJE_TWEEN_MODE_SINUSOIDAL, EDJE_TWEEN_MODE_ACCELERATE or EDJE_TWEEN_MODE_DECELERATE.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the transition.
 * @param transition The transition type to set
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_set(obj:PEvas_Object; prog:Pchar; transition:TEdje_Tween_Mode):TEina_Bool;cdecl;external;
{*
 * @brief Gets the interpolation value 1 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_ACCELERATE_FACTOR, EDJE_TWEEN_MODE_DECELERATE_FACTOR, EDJE_TWEEN_MODE_SINUSOIDAL_FACTOR, EDJE_TWEEN_MODE_DIVISOR_INTERP, EDJE_TWEEN_MODE_BOUNCE or EDJE_TWEEN_MODE_SPRING.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 1.
 *
 * @return Interpolation value 1.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value1_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the interpolation value 1 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_ACCELERATE_FACTOR, EDJE_TWEEN_MODE_DECELERATE_FACTOR, EDJE_TWEEN_MODE_SINUSOIDAL_FACTOR, EDJE_TWEEN_MODE_DIVISOR_INTERP, EDJE_TWEEN_MODE_BOUNCE or EDJE_TWEEN_MODE_SPRING.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 1.
 * @param value The interpolation value 1 for the transition.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value1_set(obj:PEvas_Object; prog:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the interpolation value 2 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_DIVISOR_INTERP, EDJE_TWEEN_MODE_BOUNCE or EDJE_TWEEN_MODE_SPRING.
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 2.
 *
 * @return Interpolation value 2.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value2_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the interpolation value 2 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_DIVISOR_INTERP, EDJE_TWEEN_MODE_BOUNCE or EDJE_TWEEN_MODE_SPRING.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 2.
 * @param value The interpolation value 2 for the transition.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value2_set(obj:PEvas_Object; prog:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the interpolation value 3 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_CUBIC_BEZIER.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 3.
 *
 * @return Interpolation value 3.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value3_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the interpolation value 3 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_CUBIC_BEZIER.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 3.
 * @param value The interpolation value 3 for the transition.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value3_set(obj:PEvas_Object; prog:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the interpolation value 4 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_CUBIC_BEZIER.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 4.
 *
 * @return Interpolation value 4.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value4_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the interpolation value 4 of the transition.
 *  Can be used with one of transition type: EDJE_TWEEN_MODE_CUBIC_BEZIER.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the interpolation value 4.
 * @param value The interpolation value 4 for the transition.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_value4_set(obj:PEvas_Object; prog:Pchar; value:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets the duration of the transition in seconds.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to get the transition time.
 *
 * @return The duration of the transition.
  }
(* Const before type ignored *)
function edje_edit_program_transition_time_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets the duration of the transition in seconds.
 *
 * @param obj Object being edited.
 * @param prog The name of the program to set the transition time.
 * @param seconds The duration of the transition (in seconds).
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_transition_time_set(obj:PEvas_Object; prog:Pchar; seconds:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets sample name of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return const char* sample_name on success, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_sample_name_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets sample name of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param name The name of the sample.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_sample_name_set(obj:PEvas_Object; prog:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets tone name of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return const char* tone_name on success, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_tone_name_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets tone name of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param name The name of the tone.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_tone_name_set(obj:PEvas_Object; prog:Pchar; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets sample speed of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return Double speed on success, @c -1 otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_sample_speed_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets sample speed of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param speed New speed value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_sample_speed_set(obj:PEvas_Object; prog:Pchar; speed:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets tone duration of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return Double duration on success, @c -1 otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_tone_duration_get(obj:PEvas_Object; prog:Pchar):Tdouble;cdecl;external;
{*
 * @brief Sets tone duration of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param duration New duration value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_tone_duration_set(obj:PEvas_Object; prog:Pchar; duration:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief Gets sample channel of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return Channel on success, @c 0 otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_channel_get(obj:PEvas_Object; prog:Pchar):byte;cdecl;external;
{*
 * @brief Sets sample channel of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param channel New channel value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_program_channel_set(obj:PEvas_Object; prog:Pchar; channel:TEdje_Channel):TEina_Bool;cdecl;external;
{*
 * @brief Gets filter part name of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return const char* part_name on success, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_filter_part_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets filter part name of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param filter_part The name of the part to be set as filter.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_filter_part_set(obj:PEvas_Object; prog:Pchar; filter_part:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets filter state of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 *
 * @return const char* state_name on success, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_filter_state_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets filter state of the program.
 *
 * @param obj Object being edited.
 * @param prog The name of the program.
 * @param filter_state New filter state value.
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_program_filter_state_set(obj:PEvas_Object; prog:Pchar; filter_state:Pchar):TEina_Bool;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   SCRIPTS API   ********************************** }
{**************************************************************************** }
{*
 * @name Scripts API
 * Functions to deal with embryo scripts (see @ref edcref).
  }{@ }
{*
 * @brief Gets the Embryo script for the group of the given object.
 *
 * Get the shared script for the group under edition. Shared script means
 * the script  block for the group, not counting what's in each program.
 * It returns a malloc'd duplicate of the code, so users are free to modify
 * the contents directly and they should remember to free() it when done.
 * NULL will be returned if there's no script or an error occurred.
 *
 * @param obj Object being edited.
 *
 * @return The shared script code for this group.
  }
function edje_edit_script_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Sets the code for the group script.
 *
 * Set the Embryo source code for the shared script of the edited group.
 * Note that changing the code itself will not update the running VM, you
 * need to call @see edje_edit_script_compile() for it to get updated.
 *
 * @param obj The object being edited
 * @param code The Embryo source
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function edje_edit_script_set(obj:PEvas_Object; code:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the Embryo script for the given program.
 *
 * Get the script code for the given program. Like the group script, this
 * function returns a duplicate of the code that the user can modify at will
 * and must free when done using it.
 * NULL will be returned if the program doesn't exist, doesn't have any
 * script or is not of type script.
 *
 * @param obj Object being edited
 * @param prog Program name
 *
 * @return The program script code
  }
(* Const before type ignored *)
function edje_edit_script_program_get(obj:PEvas_Object; prog:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets the Embryo script for the given program.
 *
 * Set the Embryo source code for the program @p prog. It must be an
 * existing program of type EDJE_ACTION_TYPE_SCRIPT, or the function
 * will fail and do nothing.
 * Note that changing the code itself will not update the running VM, you
 * need to call @see edje_edit_script_compile() for it to get updated.
 *
 * @param obj The object being edited
 * @param prog The program name
 * @param code The Embryo source
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function edje_edit_script_program_set(obj:PEvas_Object; prog:Pchar; code:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Compiles the Embryo script for the given object.
 *
 * If required, this function will process all script code for the group and
 * build the bytecode, updating the running Embryo VM Program if the build
 * is successful.
 *
 * @param obj The object being edited
 *
 * @return @c EINA_TRUE in case of success, @c EINA_FALSE otherwise.
  }
function edje_edit_script_compile(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Gets the list of errors resulting from the last script build.
 *
 * Get the list of errors that resulted from the last attempt to rebuild
 * the Embryo script for the edited group. This will be a standard Eina_List
 * with Edje_Edit_Script_Error pointers as its data.
 * The user should not do anything else but read the contents of this list.
 * These errors can be the output of the embryo compiler, or internal errors
 * generated by Edje_Edit if the preprocessing of the scripts failed.
 *
 * @param obj The object being edited
 *
 * @return A constant list of Edje_Edit_Script_Error, or NULL if there are none
  }
(* Const before type ignored *)
function edje_edit_script_error_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{@ }
{**************************************************************************** }
{***********************   SOURCE CODE API   ******************************** }
{**************************************************************************** }
{*
 * @name Scripts API
 * Functions to deal with embryo scripts (see @ref edcref).
  }{@ }
{*
 * @brief Returns source code of the current edje edit object.
 *
 * Remember to free the string with edje_edit_string_free().
 *
 * This function will return source code of the whole group, loaded previously.
 * This function also will collect all possible resources that is required and
 * mentioned in description blocks. For example: all images, fonts, data, styles,
 * and color_classes.
 *
 * @param obj The object being edited
 *
 * @return Source code containing all resources required by the object.
  }
(* Const before type ignored *)
function edje_edit_source_generate(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Returns source code of the current edje edit object.
 *
 * Remember to free the string with edje_edit_string_free().
 *
 * This function will return source code of the whole group, loaded previously.
 * This function also will collect all possible resources that is required and
 * mentioned in description blocks. For example: all images, fonts, styles and
 * color_classes.
 *
 * @note A source code will be top block 'collection'.
 *
 * @param obj The object being edited
 *
 * @return Source code containing all resources required by the object.
  }
(* Const before type ignored *)
function edje_edit_object_source_generate(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Returns source code of all collections.
 *
 * Remember to free the string with free().
 *
 * This function will generate and return source code of all collections and
 * other top level blocks.
 *
 * @param obj The object being edited
 *
 * @return Source code as char *.
  }
function edje_edit_full_source_generate(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Returns source code of global block data.
 *
 * Remember to free the string with edje_edit_string_free().
 *
 * @param obj The object being edited
 *
 * @return Source code of global block data.
  }
(* Const before type ignored *)
function edje_edit_data_source_generate(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Gets a list of color classes which given object use.
 *
 * @param obj The object being edited
 *
 * @return The color classes list
  }
function edje_edit_object_color_class_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
{*
 * @brief Gets the source code for given color classes.
 *
 * @param obj The object being edited
 * @param color_classes The list of color classes for generate code
 *
 * @return The color classes source code
  }
(* Const before type ignored *)
function edje_edit_color_classes_source_generate(obj:PEvas_Object; color_classes:PEina_List):Pchar;cdecl;external;
{@ }
{**************************************************************************** }
{*************************   ERROR API   ********************************** }
{**************************************************************************** }
{*
 * @name Error API
 * Functions to deal with error messages (see @ref edcref).
  }{@ }
  var
    EDJE_EDIT_ERROR_GROUP_CURRENTLY_USED : TEina_Error;cvar;external;
    EDJE_EDIT_ERROR_GROUP_REFERENCED : TEina_Error;cvar;external;
    EDJE_EDIT_ERROR_GROUP_DOES_NOT_EXIST : TEina_Error;cvar;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
