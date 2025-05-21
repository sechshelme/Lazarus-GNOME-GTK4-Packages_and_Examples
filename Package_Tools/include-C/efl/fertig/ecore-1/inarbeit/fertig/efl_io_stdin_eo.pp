
unit efl_io_stdin_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_stdin_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_stdin_eo.h
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
PEfl_Io_Stdin  = ^Efl_Io_Stdin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_STDIN_EO_H_}
{$define _EFL_IO_STDIN_EO_H_}
{$ifndef _EFL_IO_STDIN_EO_CLASS_TYPE}
{$define _EFL_IO_STDIN_EO_CLASS_TYPE}
type
  PEfl_Io_Stdin = ^TEfl_Io_Stdin;
  TEfl_Io_Stdin = TEo;
{$endif}
{$ifndef _EFL_IO_STDIN_EO_TYPES}
{$define _EFL_IO_STDIN_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Application's standard input (stdin).
 *
 * @ingroup Efl_Io_Stdin
  }

{ was #define dname def_expr }
function EFL_IO_STDIN_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_stdin_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_STDIN_CLASS : longint; { return type might be wrong }
  begin
    EFL_IO_STDIN_CLASS:=efl_io_stdin_class_get;
  end;


end.
