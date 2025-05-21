
unit efl_io_file_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_file_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_file_eo.h
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
PEfl_Io_File  = ^Efl_Io_File;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_FILE_EO_H_}
{$define _EFL_IO_FILE_EO_H_}
{$ifndef _EFL_IO_FILE_EO_CLASS_TYPE}
{$define _EFL_IO_FILE_EO_CLASS_TYPE}
type
  PEfl_Io_File = ^TEfl_Io_File;
  TEfl_Io_File = TEo;
{$endif}
{$ifndef _EFL_IO_FILE_EO_TYPES}
{$define _EFL_IO_FILE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief File access (open, close, read, write, lseek, ftruncate)
 *
 * @ref efl_io_closer_close_on_exec_get and
 * @ref efl_io_closer_close_on_invalidate_get are respected and default to
 * @c true. @ref efl_io_closer_close_on_exec_set sets flag O_CLOEXEC.
 *
 * @ingroup Efl_Io_File
  }

{ was #define dname def_expr }
function EFL_IO_FILE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_file_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Bitwise OR'ed flags to open the file, like O_CREAT, O_APPEND...
 *
 * Defaults to O_RDONLY | O_CLOEXEC.
 *
 * The flag O_CLOEXEC will be also managed by
 * @ref efl_io_closer_close_on_exec_set. Setting the property after the file is
 * opened will change its blocking behavior.
 *
 * Constructor property to define flags to open the file
 *
 * @param[in] obj The object.
 * @param[in] flags Flags to open file, see man:open(2).
 *
 * @ingroup Efl_Io_File
  }
procedure efl_io_file_flags_set(obj:PEo; flags:Tuint32_t);cdecl;external;
{*
 * @brief Bitwise OR'ed flags to open the file, like O_CREAT, O_APPEND...
 *
 * Defaults to O_RDONLY | O_CLOEXEC.
 *
 * The flag O_CLOEXEC will be also managed by
 * @ref efl_io_closer_close_on_exec_set. Setting the property after the file is
 * opened will change its blocking behavior.
 *
 * @param[in] obj The object.
 *
 * @return Flags to open file, see man:open(2).
 *
 * @ingroup Efl_Io_File
  }
(* Const before type ignored *)
function efl_io_file_flags_get(obj:PEo):Tuint32_t;cdecl;external;
{*
 * @brief Mode property
 *
 * Constructor property to define mode to open the file
 *
 * @param[in] obj The object.
 * @param[in] mode Mode to open file, see man:open(2).
 *
 * @ingroup Efl_Io_File
  }
procedure efl_io_file_mode_set(obj:PEo; mode:Tuint32_t);cdecl;external;
{*
 * @brief Mode property
 *
 * @param[in] obj The object.
 *
 * @return Mode to open file, see man:open(2).
 *
 * @ingroup Efl_Io_File
  }
(* Const before type ignored *)
function efl_io_file_mode_get(obj:PEo):Tuint32_t;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_FILE_CLASS : longint; { return type might be wrong }
  begin
    EFL_IO_FILE_CLASS:=efl_io_file_class_get;
  end;


end.
