
unit efl_appthread_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_appthread_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_appthread_eo.h
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
PEfl_Appthread  = ^Efl_Appthread;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_APPTHREAD_EO_H_}
{$define _EFL_APPTHREAD_EO_H_}
{$ifndef _EFL_APPTHREAD_EO_CLASS_TYPE}
{$define _EFL_APPTHREAD_EO_CLASS_TYPE}
type
  PEfl_Appthread = ^TEfl_Appthread;
  TEfl_Appthread = TEo;
{$endif}
{$ifndef _EFL_APPTHREAD_EO_TYPES}
{$define _EFL_APPTHREAD_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This class houses the application's thread and main loop. It works
 * similarly to @ref Efl_App but allows communicating with it from a different
 * thread through the @ref Efl_ThreadIO, @ref Efl_Io_Reader and
 * @ref Efl_Io_Writer interfaces. Methods can be scheduled to be executed in
 * this thread using @ref efl_threadio_call and @ref efl_threadio_call_sync.
 *
 * @ingroup Efl_Appthread
  }

{ was #define dname def_expr }
function EFL_APPTHREAD_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_appthread_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_APPTHREAD_CLASS : longint; { return type might be wrong }
  begin
    EFL_APPTHREAD_CLASS:=efl_appthread_class_get;
  end;


end.
