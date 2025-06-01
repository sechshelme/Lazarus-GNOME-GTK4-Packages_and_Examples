
unit elc_fileselector_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_fileselector_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_fileselector_common.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
{*< File path  }
{*< A flag to show if path is a directory or not. True if the path is a directory.  }
{*< A user data that was given by elm_fileselector_custom_filter_append.  }type

  TElm_Fileselector_Filter_Func = function (path:Pchar; dir:TEina_Bool; data:pointer):TEina_Bool;cdecl;
  var
    ELM_FILESELECTOR_ERROR_UNKNOWN : TEina_Error;cvar;external;
    ELM_FILESELECTOR_ERROR_INVALID_MODEL : TEina_Error;cvar;external;

implementation


end.
