
unit base;
interface

{
  Automatically converted by H2Pas 1.0.0 from base.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    base.h
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
Pb2AllocFcn  = ^b2AllocFcn;
Pb2AssertFcn  = ^b2AssertFcn;
Pb2FreeFcn  = ^b2FreeFcn;
Pb2LogFcn  = ^b2LogFcn;
Pb2Version  = ^b2Version;
Pchar  = ^char;
Puint64_t  = ^uint64_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-FileCopyrightText: 2023 Erin Catto }
{ SPDX-License-Identifier: MIT }
(** unsupported pragma#pragma once*)
{$include <stdint.h>}
{ clang-format off }
{  }
{ Shared library macros }
{/ Prototype for user allocation function }
{/ @param size the allocation size in bytes }
{/ @param alignment the required alignment, guaranteed to be a power of 2 }
type
  Pb2AllocFcn = ^Tb2AllocFcn;
  Tb2AllocFcn = function (size:dword; alignment:longint):pointer;cdecl;
{/ Prototype for user free function }
{/ @param mem the memory previously allocated through `b2AllocFcn` }
{/ @param size the allocation size in bytes }

  Tb2FreeFcn = procedure (mem:pointer; size:dword);cdecl;
{/ Prototype for the user assert callback. Return 0 to skip the debugger break. }
(* Const before type ignored *)
(* Const before type ignored *)

  Tb2AssertFcn = function (condition:Pchar; fileName:Pchar; lineNumber:longint):longint;cdecl;
{/ Prototype for user log callback. Used to log warnings. }
(* Const before type ignored *)

  Tb2LogFcn = procedure (message:Pchar);cdecl;
{/ This allows the user to override the allocation functions. These should be }
{/ set during application startup. }

procedure b2SetAllocator(allocFcn:Pb2AllocFcn; freeFcn:Pb2FreeFcn);cdecl;external;
{/ @return the total bytes allocated by Box2D }
function b2GetByteCount:longint;cdecl;external;
{/ Override the default assert function }
{/ @param assertFcn a non-null assert callback }
procedure b2SetAssertFcn(assertFcn:Pb2AssertFcn);cdecl;external;
{/ Override the default log function }
{/ @param logFcn a non-null log callback }
procedure b2SetLogFcn(logFcn:Pb2LogFcn);cdecl;external;
{/ Version numbering scheme. }
{/ See https://semver.org/ }
{/ Significant changes }
{/ Incremental changes }
{/ Bug fixes }
type
  Pb2Version = ^Tb2Version;
  Tb2Version = record
      major : longint;
      minor : longint;
      revision : longint;
    end;
{/ Get the current version of Box2D }

function b2GetVersion:Tb2Version;cdecl;external;
{*@ }
{! @cond }
{ see https://github.com/scottt/debugbreak }
{$if defined( _MSC_VER )}

{ was #define dname def_expr }
function B2_BREAKPOINT : longint; { return type might be wrong }

(*** was #elif ****){$else defined( __GNUC__ ) || defined( __clang__ )}

{ was #define dname def_expr }
function B2_BREAKPOINT : longint; { return type might be wrong }

{$else}
{ Unknown compiler }
{$include <assert.h>}

{ was #define dname def_expr }
function B2_BREAKPOINT : longint; { return type might be wrong }

{$endif}
{$if !defined( NDEBUG ) || defined( B2_ENABLE_ASSERT )}
(* Const before type ignored *)
(* Const before type ignored *)

function b2InternalAssertFcn(condition:Pchar; fileName:Pchar; lineNumber:longint):longint;cdecl;external;
{/ Get the absolute number of system ticks. The value is platform specific. }
function b2GetTicks:Tuint64_t;cdecl;external;
{/ Get the milliseconds passed from an initial tick value. }
function b2GetMilliseconds(ticks:Tuint64_t):single;cdecl;external;
{/ Get the milliseconds passed from an initial tick value. Resets the passed in }
{/ value to the current tick value. }
function b2GetMillisecondsAndReset(ticks:Puint64_t):single;cdecl;external;
{/ Yield to be used in a busy loop. }
procedure b2Yield;cdecl;external;
{/ Simple djb2 hash function for determinism testing }
const
  B2_HASH_INIT = 5381;  
(* Const before type ignored *)

function b2Hash(hash:Tuint32_t; data:Puint8_t; count:longint):Tuint32_t;cdecl;external;
{! @endcond }

implementation

{ was #define dname def_expr }
function B2_BREAKPOINT : longint; { return type might be wrong }
  begin
    B2_BREAKPOINT:=__debugbreak;
  end;

{ was #define dname def_expr }
function B2_BREAKPOINT : longint; { return type might be wrong }
  begin
    B2_BREAKPOINT:=__builtin_trap;
  end;

{ was #define dname def_expr }
function B2_BREAKPOINT : longint; { return type might be wrong }
  begin
    B2_BREAKPOINT:=assert(0);
  end;


end.
