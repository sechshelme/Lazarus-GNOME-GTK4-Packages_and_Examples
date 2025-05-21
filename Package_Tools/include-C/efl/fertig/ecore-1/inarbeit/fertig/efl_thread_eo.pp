
unit efl_thread_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_thread_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_thread_eo.h
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
PEfl_Thread  = ^Efl_Thread;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_THREAD_EO_H_}
{$define _EFL_THREAD_EO_H_}
{$ifndef _EFL_THREAD_EO_CLASS_TYPE}
{$define _EFL_THREAD_EO_CLASS_TYPE}
type
  PEfl_Thread = ^TEfl_Thread;
  TEfl_Thread = TEo;
{$endif}
{$ifndef _EFL_THREAD_EO_TYPES}
{$define _EFL_THREAD_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}

{ was #define dname def_expr }
function EFL_THREAD_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_thread_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_THREAD_CLASS : longint; { return type might be wrong }
  begin
    EFL_THREAD_CLASS:=efl_thread_class_get;
  end;


end.
