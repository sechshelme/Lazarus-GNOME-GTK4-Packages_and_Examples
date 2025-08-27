
unit rltypedefs;
interface

{
  Automatically converted by H2Pas 1.0.0 from rltypedefs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rltypedefs.h
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
PCPFunction  = ^CPFunction;
PCPPFunction  = ^CPPFunction;
PFILE  = ^FILE;
Prl_compentry_func_t  = ^rl_compentry_func_t;
Prl_completion_func_t  = ^rl_completion_func_t;
Prl_cpcpfunc_t  = ^rl_cpcpfunc_t;
Prl_cpcppfunc_t  = ^rl_cpcppfunc_t;
Prl_cpifunc_t  = ^rl_cpifunc_t;
Prl_cpvfunc_t  = ^rl_cpvfunc_t;
Prl_dequote_func_t  = ^rl_dequote_func_t;
Prl_quote_func_t  = ^rl_quote_func_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ rltypedefs.h -- Type declarations for readline functions.  }
{ Copyright (C) 2000-2021 Free Software Foundation, Inc.

   This file is part of the GNU Readline Library (Readline), a library
   for reading lines of text with interactive input and history editing.      

   Readline is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   Readline is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with Readline.  If not, see <http://www.gnu.org/licenses/>.
 }
{$ifndef _RL_TYPEDEFS_H_}
{$define _RL_TYPEDEFS_H_}
{ C++ extern C conditionnal removed }
{ Old-style, attempt to mark as deprecated in some way people will notice.  }
{$if !defined (_FUNCTION_DEF)}
{$define _FUNCTION_DEF}
{$if defined(__GNUC__) || defined(__clang__)}
{$else}
type

  TFunction = function :longint;cdecl;

  TVFunction = procedure ;cdecl;

  PCPFunction = ^TCPFunction;
  TCPFunction = function :Pchar;cdecl;

  PCPPFunction = ^TCPPFunction;
  TCPPFunction = function :PPchar;cdecl;
{$endif}
{$endif}
{ _FUNCTION_DEF  }
{ New style.  }
{$if !defined (_RL_FUNCTION_TYPEDEF)}
{$define _RL_FUNCTION_TYPEDEF}
{ Bindable functions  }
type

  Trl_command_func_t = function (para1:longint; para2:longint):longint;cdecl;
{ Typedefs for the completion system  }
(* Const before type ignored *)

  Prl_compentry_func_t = ^Trl_compentry_func_t;
  Trl_compentry_func_t = function (para1:Pchar; para2:longint):Pchar;cdecl;
(* Const before type ignored *)

  Prl_completion_func_t = ^Trl_completion_func_t;
  Trl_completion_func_t = function (para1:Pchar; para2:longint; para3:longint):PPchar;cdecl;

  Prl_quote_func_t = ^Trl_quote_func_t;
  Trl_quote_func_t = function (para1:Pchar; para2:longint; para3:Pchar):Pchar;cdecl;

  Prl_dequote_func_t = ^Trl_dequote_func_t;
  Trl_dequote_func_t = function (para1:Pchar; para2:longint):Pchar;cdecl;

  Trl_compignore_func_t = function (para1:PPchar):longint;cdecl;

  Trl_compdisp_func_t = procedure (para1:PPchar; para2:longint; para3:longint);cdecl;
{ Type for input and pre-read hook functions like rl_event_hook  }

  Trl_hook_func_t = function (para1:pointer):longint;cdecl;
{ Input function type  }

  Trl_getc_func_t = function (para1:PFILE):longint;cdecl;
{ Generic function that takes a character buffer (which could be the readline
   line buffer) and an index into it (which could be rl_point) and returns
   an int.  }

  Trl_linebuf_func_t = function (para1:Pchar; para2:longint):longint;cdecl;
{ `Generic' function pointer typedefs  }

  Trl_intfunc_t = function (para1:longint):longint;cdecl;

const
  rl_ivoidfunc_t = rl_hook_func_t;  
type

  Trl_icpfunc_t = function (para1:Pchar):longint;cdecl;

  Trl_icppfunc_t = function (para1:PPchar):longint;cdecl;

  Trl_voidfunc_t = procedure (para1:pointer);cdecl;

  Trl_vintfunc_t = procedure (para1:longint);cdecl;

  Trl_vcpfunc_t = procedure (para1:Pchar);cdecl;

  Trl_vcppfunc_t = procedure (para1:PPchar);cdecl;

  Prl_cpvfunc_t = ^Trl_cpvfunc_t;
  Trl_cpvfunc_t = function :Pchar;cdecl;

  Prl_cpifunc_t = ^Trl_cpifunc_t;
  Trl_cpifunc_t = function (para1:longint):Pchar;cdecl;

  Prl_cpcpfunc_t = ^Trl_cpcpfunc_t;
  Trl_cpcpfunc_t = function (para1:Pchar):Pchar;cdecl;

  Prl_cpcppfunc_t = ^Trl_cpcppfunc_t;
  Trl_cpcppfunc_t = function (para1:PPchar):Pchar;cdecl;
{$endif}
{ _RL_FUNCTION_TYPEDEF  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _RL_TYPEDEFS_H_  }

implementation


end.
