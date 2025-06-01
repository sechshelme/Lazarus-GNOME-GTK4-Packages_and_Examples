
unit elm_entry_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_entry_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_entry_legacy.h
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
PElm_Text_Format  = ^Elm_Text_Format;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "elm_entry_eo.legacy.h"}
{*
 * This adds an entry to @p parent object.
 *
 * By default, entries are:
 * @li not scrolled
 * @li multi-line
 * @li word wrapped
 * @li autosave is enabled
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Entry_Group
  }

function elm_entry_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * This sets the text displayed within the entry to @p entry.
 *
 * @param obj The entry object
 * @param entry The text to be displayed
 *
 * @note Using this function bypasses text filters
 *
 * @ingroup Elm_Entry_Group
  }
(* Const before type ignored *)
procedure elm_entry_entry_set(obj:PEvas_Object; entry:Pchar);cdecl;external;
{*
 * This returns the text currently shown in object @p entry.
 * See also elm_entry_entry_set().
 *
 * @param obj The entry object
 * @return The currently displayed text or NULL on failure
 *
 * @ingroup Elm_Entry_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_entry_entry_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 *
 * This sets the file (and implicitly loads it) for the text to display and
 * then edit. All changes are written back to the file after a short delay if
 * the entry object is set to autosave (which is the default).
 *
 * If the entry had any other file set previously, any changes made to it
 * will be saved if the autosave feature is enabled, otherwise, the file
 * will be silently discarded and any non-saved changes will be lost.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * @ingroup Elm_Entry_Group
 *
 * @param[in] obj The entry object
 * @param[in] file The path to the file to load and save
 * @param[in] format The file format
  }
(* Const before type ignored *)
function elm_entry_file_set(obj:PEvas_Object; file:Pchar; format:TElm_Text_Format):TEina_Bool;cdecl;external;
{*
 *
 * Get the file being edited by the entry.
 *
 * This function can be used to retrieve any file set on the entry for
 * edition, along with the format used to load and save it.
 *
 * @ingroup Elm_Entry_Group
 *
 * @param[in] obj The entry object
 * @param[out] file The path to the file to load and save
 * @param[out] format The file format
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_entry_file_get(obj:PEvas_Object; file:PPchar; format:PElm_Text_Format);cdecl;external;
{*
 * @brief Forces calculation of the entry size and text layouting.
 *
 * This should be used after modifying the textblock object directly. See
 * @ref elm_entry_textblock_get for more information.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Entry_Group
  }
procedure elm_entry_calc_force(obj:PEvas_Object);cdecl;external;

implementation


end.
