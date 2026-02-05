
unit arithmetique;
interface

{
  Automatically converted by H2Pas 1.0.0 from arithmetique.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    arithmetique.h
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
PFILE  = ^FILE;
Pjmp_buf  = ^jmp_buf;
Psize_t  = ^size_t;
PValue  = ^Value;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    This file is part of PolyLib.

    PolyLib is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PolyLib is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with PolyLib.  If not, see <http://www.gnu.org/licenses/>.
 }
{ header file built by cproto  }
{$ifndef arithmetique_header_included}
{$define arithmetique_header_included}
{* package arithmetique
 *
 * $Id: arithmetique.h,v 1.24 2007/02/22 09:16:57 skimo Exp $
 *
 * Francois Irigoin, mai 1989
 *
 * Modifications
 *  - rewrite of DIVIDE which was wrong (Remi Triolet, Francois Irigoin, 
 *    april 90)
 *  - simplification of POSITIVE_DIVIDE by suppressing one modulo
 *  - B.Meister : added addmul, operation existing in gmp and quite useful 
 *    (05-2005)
  }
{ We would like linear to be generic about the "integer" type used
 * to represent integer values. Thus Value is defined here. It should
 * be changed to "int" "long" or "long long". In an ideal world,
 * any source modification should be limited to this package.
 *
 * Indeed, we cannot switch easily to bignums that need constructors 
 * dans destructors... That would lead to too many modifications...
 * C++ would make things easier and cleaner...
 *
 * Fabien COELHO
  }
{$include <stdio.h>}
{$include <limits.h>   /* Included for getting constants: INT_MAX, etc.. */}
{$ifdef GNUMP}
{$include <gmp.h>}
{$include <stdlib.h>}
{$include <string.h>}

procedure mp_get_memory_functions(alloc_func_ptr:Pfunction (para1:Tsize_t):pointer; realloc_func_ptr:Pfunction (para1:pointer; para2:Tsize_t; para3:Tsize_t):pointer; free_func_ptr:Pprocedure (para1:pointer; para2:Tsize_t));cdecl;external;
type
  PValue = ^TValue;
  TValue = int64;

  Tvalue_print_gmp_free_t = procedure (para1:pointer; para2:Tsize_t);cdecl;
{ errors.c  }  var
    overflow_error : dword;cvar;external;
    simplex_arithmetic_error : dword;cvar;external;
    user_exception_error : dword;cvar;external;
    parser_exception_error : dword;cvar;external;
    any_exception_error : dword;cvar;external;
    the_last_just_thrown_exception : dword;cvar;external;
{f }
procedure dump_exception_stack_to_file(para1:PFILE);cdecl;external;
procedure dump_exception_stack;cdecl;external;
{what }(* Const before type ignored *)
{function }(* Const before type ignored *)
{file }{line }function push_exception_on_stack(para1:longint; para2:Pchar; para3:Pchar; para4:longint):Pjmp_buf;cdecl;external;
{what }(* Const before type ignored *)
{function }(* Const before type ignored *)
{file }{line }procedure pop_exception_from_stack(para1:longint; para2:Pchar; para3:Pchar; para4:longint);cdecl;external;
{what }(* Const before type ignored *)
{function }(* Const before type ignored *)
{file }{line }procedure throw_exception(para1:longint; para2:Pchar; para3:Pchar; para4:longint);cdecl;external;
{$endif}
{ arithmetique_header_included  }

implementation


end.
