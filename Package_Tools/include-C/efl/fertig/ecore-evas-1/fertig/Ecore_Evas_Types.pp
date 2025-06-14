
unit Ecore_Evas_Types;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Evas_Types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Evas_Types.h
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
Pdword  = ^dword;
PEcore_Evas  = ^Ecore_Evas;
PEcore_Getopt_Value  = ^Ecore_Getopt_Value;
PEcore_Window  = ^Ecore_Window;
PEcore_X_Atom  = ^Ecore_X_Atom;
PEcore_X_Icon  = ^Ecore_X_Icon;
PEcore_X_Pixmap  = ^Ecore_X_Pixmap;
PEcore_X_Window  = ^Ecore_X_Window;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_EVAS_TYPES_H_}
{$define _ECORE_EVAS_TYPES_H_}
{$ifdef _WIN32}
{$include <stddef.h>}
{$else}
{$include <inttypes.h>}
{$endif}
{$ifndef _ECORE_X_H}
{$define _ECORE_X_WINDOW_PREDEF}
type
  PEcore_X_Window = ^TEcore_X_Window;
  TEcore_X_Window = dword;

  PEcore_X_Pixmap = ^TEcore_X_Pixmap;
  TEcore_X_Pixmap = dword;

  PEcore_X_Atom = ^TEcore_X_Atom;
  TEcore_X_Atom = dword;

  PEcore_X_Icon = ^TEcore_X_Icon;
  TEcore_X_Icon = record
      width : dword;
      height : dword;
      data : Pdword;
    end;
{$endif}
{$ifndef _ECORE_DIRECTFB_H}
{$define _ECORE_DIRECTFB_WINDOW_PREDEF}
type
{$endif}
{$ifndef __ECORE_WIN32_H__}
type
{$endif}
{$ifndef __ECORE_WINCE_H__}
type
{$endif}
{$ifndef __ECORE_COCOA_H__}
{$define _ECORE_COCOA_WINDOW_PREDEF}
type
{$endif}
{$ifndef _ECORE_EVAS_PRIVATE_H}
{ basic data types  }
type

  TEcore_Evas_Event_Cb = procedure (ee:PEcore_Evas);cdecl;
{*< Callback used for several ecore evas events @since 1.2  }

  TEcore_Evas_Focus_Device_Event_Cb = procedure (ee:PEcore_Evas; seat:PEo);cdecl;
{* Callback used to report an focus in/out event originated from a seat. @since 1.19 }

  TEcore_Evas_Mouse_IO_Cb = procedure (ee:PEcore_Evas; mouse:PEo);cdecl;
{*< Callback used to report mouse in/out events. @since 1.19  }
{$endif}
{$ifndef _ECORE_WAYLAND_H_}
{$define _ECORE_WAYLAND_WINDOW_PREDEF}
type
{$endif}
{$ifndef _ECORE_WL2_H_}
{$define _ECORE_WL2_WINDOW_PREDEF}
type
{$endif}
{$ifndef _ECORE_GETOPT_PREDEF}
type

const
  _ECORE_GETOPT_PREDEF = 1;  
{$endif}
{$ifndef _ECORE_GETOPT_DESC_PREDEF}
type

const
  _ECORE_GETOPT_DESC_PREDEF = 1;  
{$endif}
{$ifndef _ECORE_GETOPT_VALUE_PREDEF}
type
  PEcore_Getopt_Value = ^TEcore_Getopt_Value;
  TEcore_Getopt_Value = TEcore_Getopt_Value;

const
  _ECORE_GETOPT_VALUE_PREDEF = 1;  
{$endif}
{$ifndef _ECORE_WINDOW_PREDEF}
type
  PEcore_Window = ^TEcore_Window;
  TEcore_Window = Tuintptr_t;

const
  _ECORE_WINDOW_PREDEF = 1;  
{$endif}
{$endif}
{ _ECORE_EVAS_TYPES_H_  }

implementation


end.
