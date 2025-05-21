
unit efl_io_writer_fd_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_writer_fd_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_writer_fd_eo.h
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
PEfl_Io_Writer_Fd  = ^Efl_Io_Writer_Fd;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_WRITER_FD_EO_H_}
{$define _EFL_IO_WRITER_FD_EO_H_}
{$ifndef _EFL_IO_WRITER_FD_EO_CLASS_TYPE}
{$define _EFL_IO_WRITER_FD_EO_CLASS_TYPE}
type
  PEfl_Io_Writer_Fd = ^TEfl_Io_Writer_Fd;
  TEfl_Io_Writer_Fd = TEo;
{$endif}
{$ifndef _EFL_IO_WRITER_FD_EO_TYPES}
{$define _EFL_IO_WRITER_FD_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Writes fd using write(2).
 *
 * @ingroup Efl_Io_Writer_Fd
  }

{ was #define dname def_expr }
function EFL_IO_WRITER_FD_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_writer_fd_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_IO_WRITER_FD_PROTECTED}
{*
 * @brief Writer file descriptor
 *
 * @param[in] obj The object.
 * @param[in] fd File descriptor
 *
 * @ingroup Efl_Io_Writer_Fd
  }
procedure efl_io_writer_fd_set(obj:PEo; fd:longint);cdecl;external;
{$endif}
{*
 * @brief Writer file descriptor
 *
 * @param[in] obj The object.
 *
 * @return File descriptor
 *
 * @ingroup Efl_Io_Writer_Fd
  }
(* Const before type ignored *)

function efl_io_writer_fd_get(obj:PEo):longint;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_WRITER_FD_MIXIN : longint; { return type might be wrong }
  begin
    EFL_IO_WRITER_FD_MIXIN:=efl_io_writer_fd_mixin_get;
  end;


end.
