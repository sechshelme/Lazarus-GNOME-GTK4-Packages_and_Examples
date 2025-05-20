
unit efl_file_save_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_file_save_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_file_save_eo.h
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
PEfl_File_Save  = ^Efl_File_Save;
PEfl_File_Save_Info  = ^Efl_File_Save_Info;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_FILE_SAVE_EO_H_}
{$define _EFL_FILE_SAVE_EO_H_}
{$ifndef _EFL_FILE_SAVE_EO_CLASS_TYPE}
{$define _EFL_FILE_SAVE_EO_CLASS_TYPE}
type
  PEfl_File_Save = ^TEfl_File_Save;
  TEfl_File_Save = TEo;
{$endif}
{$ifndef _EFL_FILE_SAVE_EO_TYPES}
{$define _EFL_FILE_SAVE_EO_TYPES}
{* Info used to determine various attributes when saving a file.
 *
 * @since 1.22
 *
 * @ingroup Efl_File_Save_Info
  }
{*< The quality level (0-100) to save the file with;
                         * commonly used when saving image files.
                         *
                         * @since 1.22  }
{*< The compression level (0-100) to save the file
                             * with.
                             *
                             * @since 1.22  }
(* Const before type ignored *)
{*< The encoding to use when saving the file.
                         *
                         * @since 1.22  }
type
  PEfl_File_Save_Info = ^TEfl_File_Save_Info;
  TEfl_File_Save_Info = record
      quality : dword;
      compression : dword;
      encoding : Pchar;
    end;
{$endif}
{* Efl file saving interface
 *
 * @since 1.22
 *
 * @ingroup Efl_File_Save
  }

{ was #define dname def_expr }
function EFL_FILE_SAVE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_file_save_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Save the given image object's contents to an (image) file.
 *
 * The extension suffix on @c file will determine which saver module Evas is to
 * use when saving, thus the final file's format. If the file supports multiple
 * data stored in it (Eet ones), you can specify the key to be used as the
 * index of the image in it.
 *
 * You can specify some flags when saving the image.  Currently acceptable
 * flags are @c quality and @c compress. Eg.: "quality=100 compress=9".
 *
 * @param[in] obj The object.
 * @param[in] file The filename to be used to save the image (extension
 * obligatory).
 * @param[in] key The image key in the file (if an Eet one), or @c null,
 * otherwise.
 * @param[in] info The flags to be used ($null for defaults).
 *
 * @return @c true on success, @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_File_Save
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_file_save(obj:PEo; file:Pchar; key:Pchar; info:PEfl_File_Save_Info):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_FILE_SAVE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_FILE_SAVE_INTERFACE:=efl_file_save_interface_get;
  end;


end.
