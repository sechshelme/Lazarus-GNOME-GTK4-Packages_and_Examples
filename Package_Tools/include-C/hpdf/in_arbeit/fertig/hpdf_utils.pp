
unit hpdf_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_utils.h
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
PHPDF_BYTE  = ^HPDF_BYTE;
PHPDF_UINT16  = ^HPDF_UINT16;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_utils.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_UTILS_H}
{$define _HPDF_UTILS_H}
{$include "hpdf_config.h"}
{$include "hpdf_types.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
(* Const before type ignored *)

function HPDF_AToI(s:Pchar):THPDF_INT;cdecl;external;
(* Const before type ignored *)
function HPDF_AToF(s:Pchar):THPDF_DOUBLE;cdecl;external;
function HPDF_IToA(s:Pchar; val:THPDF_INT32; eptr:Pchar):Pchar;cdecl;external;
function HPDF_IToA2(s:Pchar; val:THPDF_UINT32; len:THPDF_UINT):Pchar;cdecl;external;
function HPDF_FToA(s:Pchar; val:THPDF_REAL; eptr:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function HPDF_MemCpy(out:PHPDF_BYTE; in:PHPDF_BYTE; n:THPDF_UINT):PHPDF_BYTE;cdecl;external;
(* Const before type ignored *)
function HPDF_StrCpy(out:Pchar; in:Pchar; eptr:Pchar):PHPDF_BYTE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function HPDF_MemCmp(s1:PHPDF_BYTE; s2:PHPDF_BYTE; n:THPDF_UINT):THPDF_INT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function HPDF_StrCmp(s1:Pchar; s2:Pchar):THPDF_INT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function HPDF_StrStr(s1:Pchar; s2:Pchar; maxlen:THPDF_UINT):Pchar;cdecl;external;
function HPDF_MemSet(s:pointer; c:THPDF_BYTE; n:THPDF_UINT):pointer;cdecl;external;
(* Const before type ignored *)
function HPDF_StrLen(s:Pchar; maxlen:THPDF_INT):THPDF_UINT;cdecl;external;
function HPDF_ToBox(left:THPDF_INT16; bottom:THPDF_INT16; right:THPDF_INT16; top:THPDF_INT16):THPDF_Box;cdecl;external;
function HPDF_ToPoint(x:THPDF_INT16; y:THPDF_INT16):THPDF_Point;cdecl;external;
function HPDF_ToRect(left:THPDF_REAL; bottom:THPDF_REAL; right:THPDF_REAL; top:THPDF_REAL):THPDF_Rect;cdecl;external;
procedure HPDF_UInt16Swap(value:PHPDF_UINT16);cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HPDF_NEEDS_ESCAPE(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HPDF_IS_WHITE_SPACE(c : longint) : longint;

{---------------------------------------------------------------------------- }
{----- macros for debug ----------------------------------------------------- }
{$ifdef LIBHPDF_DEBUG_TRACE}
{$ifndef HPDF_PTRACE_ON}
{$define HPDF_PTRACE_ON}
{$endif}
{ HPDF_PTRACE_ON  }
{$endif}
{ LIBHPDF_DEBUG_TRACE  }
{$endif}
{ _HPDF_UTILS_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HPDF_NEEDS_ESCAPE(c : longint) : longint;
begin
  HPDF_NEEDS_ESCAPE:=(((((((((((((c<($20 or c))>($7e or c))=('\\' or c))=('%' or c))=('#' or c))=('/' or c))=('(' or c))=(')' or c))=('<' or c))=('>' or c))=('[' or c))=(']' or c))=('{' or c))='}';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HPDF_IS_WHITE_SPACE(c : longint) : longint;
begin
  HPDF_IS_WHITE_SPACE:=(((((c=($00 or c))=($09 or c))=($0A or c))=($0C or c))=($0D or c))=$20;
end;


end.
