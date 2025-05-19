
unit efl_file_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_file_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_file_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_File  = ^Efl_File;
PEina_File  = ^Eina_File;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_FILE_EO_H_}
{$define _EFL_FILE_EO_H_}
{$ifndef _EFL_FILE_EO_CLASS_TYPE}
{$define _EFL_FILE_EO_CLASS_TYPE}
type
  PEfl_File = ^TEfl_File;
  TEfl_File = TEo;
{$endif}
{$ifndef _EFL_FILE_EO_TYPES}
{$define _EFL_FILE_EO_TYPES}
{$endif}
{* Efl file interface
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }

{ was #define dname def_expr }
function EFL_FILE_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_file_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief The mmaped file from where an object will fetch the real data (it
 * must be an @ref Eina_File).
 *
 * If mmap is set during object construction, the object will automatically
 * call @ref efl_file_load during the finalize phase of construction.
 *
 * @param[in] obj The object.
 * @param[in] f The handle to the @ref Eina_File that will be used
 *
 * @return 0 on success, error code otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
function efl_file_mmap_set(obj:PEo; f:PEina_File):TEina_Error;cdecl;external;
{*
 * @brief The mmaped file from where an object will fetch the real data (it
 * must be an @ref Eina_File).
 *
 * If mmap is set during object construction, the object will automatically
 * call @ref efl_file_load during the finalize phase of construction.
 *
 * @param[in] obj The object.
 *
 * @return The handle to the @ref Eina_File that will be used
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_file_mmap_get(obj:PEo):PEina_File;cdecl;external;
{*
 * @brief The file path from where an object will fetch the data.
 *
 * If file is set during object construction, the object will automatically
 * call @ref efl_file_load during the finalize phase of construction.
 *
 * You must not modify the strings on the returned pointers.
 *
 * @param[in] obj The object.
 * @param[in] file The file path.
 *
 * @return 0 on success, error code otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
function efl_file_set(obj:PEo; file:Pchar):TEina_Error;cdecl;external;
{*
 * @brief The file path from where an object will fetch the data.
 *
 * If file is set during object construction, the object will automatically
 * call @ref efl_file_load during the finalize phase of construction.
 *
 * You must not modify the strings on the returned pointers.
 *
 * @param[in] obj The object.
 *
 * @return The file path.
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_file_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The key which corresponds to the target data within a file.
 *
 * Some file types can contain multiple data streams which are indexed by a
 * key. Use this property for such cases (See for example @ref Efl_Ui_Image or
 * @ref Efl_Ui_Layout).
 *
 * You must not modify the strings on the returned pointers.
 *
 * @param[in] obj The object.
 * @param[in] key The group that the data belongs to. See the class
 * documentation for particular implementations of this interface to see how
 * this property is used.
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
procedure efl_file_key_set(obj:PEo; key:Pchar);cdecl;external;
{*
 * @brief The key which corresponds to the target data within a file.
 *
 * Some file types can contain multiple data streams which are indexed by a
 * key. Use this property for such cases (See for example @ref Efl_Ui_Image or
 * @ref Efl_Ui_Layout).
 *
 * You must not modify the strings on the returned pointers.
 *
 * @param[in] obj The object.
 *
 * @return The group that the data belongs to. See the class documentation for
 * particular implementations of this interface to see how this property is
 * used.
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_file_key_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The load state of the object.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the object is loaded, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
(* Const before type ignored *)
function efl_file_loaded_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Perform all necessary operations to open and load file data into the
 * object using the @ref efl_file_get (or @ref efl_file_mmap_get) and
 * @ref efl_file_key_get properties.
 *
 * In the case where @ref efl_file_set has been called on an object, this will
 * internally open the file and call @ref efl_file_mmap_set on the object using
 * the opened file handle.
 *
 * Calling @ref efl_file_load on an object which has already performed file
 * operations based on the currently set properties will have no effect.
 *
 * @param[in] obj The object.
 *
 * @return 0 on success, error code otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
function efl_file_load(obj:PEo):TEina_Error;cdecl;external;
{*
 * @brief Perform all necessary operations to unload file data from the object.
 *
 * In the case where @ref efl_file_mmap_set has been externally called on an
 * object, the file handle stored in the object will be preserved.
 *
 * Calling @ref efl_file_unload on an object which is not currently loaded will
 * have no effect.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_File
  }
procedure efl_file_unload(obj:PEo);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_FILE_MIXIN : longint; { return type might be wrong }
  begin
    EFL_FILE_MIXIN:=efl_file_mixin_get;
  end;


end.
