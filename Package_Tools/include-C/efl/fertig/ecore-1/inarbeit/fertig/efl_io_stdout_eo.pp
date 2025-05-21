
unit efl_io_stdout_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_stdout_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_stdout_eo.h
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
PEfl_Io_Stdout  = ^Efl_Io_Stdout;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_STDOUT_EO_H_}
{$define _EFL_IO_STDOUT_EO_H_}
{$ifndef _EFL_IO_STDOUT_EO_CLASS_TYPE}
{$define _EFL_IO_STDOUT_EO_CLASS_TYPE}
type
  PEfl_Io_Stdout = ^TEfl_Io_Stdout;
  TEfl_Io_Stdout = TEo;
{$endif}
{$ifndef _EFL_IO_STDOUT_EO_TYPES}
{$define _EFL_IO_STDOUT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Application's standard output (stdout).
 *
 * @ingroup Efl_Io_Stdout
  }

{ was #define dname def_expr }
function EFL_IO_STDOUT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_stdout_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_STDOUT_CLASS : longint; { return type might be wrong }
  begin
    EFL_IO_STDOUT_CLASS:=efl_io_stdout_class_get;
  end;


end.
