
unit arithmetic_errors;
interface

{
  Automatically converted by H2Pas 1.0.0 from arithmetic_errors.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    arithmetic_errors.h
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
{ 
 * $Id: arithmetic_errors.h,v 1.4 2006/03/15 19:59:37 verdoolaege Exp $
 *
 * managing arithmetic errors...
 * detecting and managing arithmetic errors on Values should be
 * systematic. These macros gives a C++ look and feel to this
 * management. 
 *
 * (c) CA et FC, Sept 1997
 *
 * $Log: arithmetic_errors.h,v $
 * Revision 1.4  2006/03/15 19:59:37  verdoolaege
 * arith: add some missing consts
 *
 * Revision 1.3  2004/02/08 21:53:27  kienhuis
 * Update from Fabien Coelho, via Bart Kienhuis
 *
 * I've updated here in the C3/Linear library the arithmetic_error
 * package that I developped (with others) to handle exceptions in C.
 * It adds a simple callback feature which is needed for pips here.
 * If you do not use it, it should not harm;-)
 *
 * Revision 1.34  2003/09/03 13:59:46  coelho
 * ++
 *
 * Revision 1.33  2003/09/03 13:35:34  coelho
 * no more callback.
 *
 * Revision 1.32  2003/08/18 14:55:38  coelho
 * callback fix.
 *
 * Revision 1.31  2003/08/18 14:16:45  coelho
 * NULL callback added.
 *
 * Revision 1.30  2003/06/13 13:59:55  coelho
 * hop.
 *
 * Revision 1.29  2000/07/27 15:01:55  coelho
 * hop.
 *
 * Revision 1.28  2000/07/26 09:11:58  coelho
 * hop.
 *
 * Revision 1.27  2000/07/26 09:07:32  coelho
 * *** empty log message ***
 *
 * Revision 1.26  2000/07/26 09:06:32  coelho
 * the_last_just_thrown_exception declared.
 *
 * Revision 1.25  2000/07/26 08:41:40  coelho
 * RETHROW added.
 *
 * Revision 1.24  1998/10/26 14:37:48  coelho
 * constants moved out.
 *
 * Revision 1.23  1998/10/26 14:36:13  coelho
 * constants explicitely defined in .h.
 *
 * Revision 1.22  1998/10/24 15:18:26  coelho
 * THROW macro updated to tell its source.
 *
 * Revision 1.21  1998/10/24 14:33:08  coelho
 * parser exception added.
 *
 * Revision 1.20  1998/10/24 14:32:45  coelho
 * simpler macros.
 *
 * Revision 1.19  1998/10/24 09:22:47  coelho
 * size update.
 *
 * Revision 1.18  1998/10/24 09:21:45  coelho
 * const added to constants.
 *
  }
{$if !defined(linear_arithmetic_error_included)}
{$define linear_arithmetic_error_included}
{$include <setjmp.h>}
(* Const before type ignored *)
(* Const before type ignored *)
type

  Texception_callback_t = procedure (para1:Pchar; para2:Pchar; para3:longint);cdecl;
{
const unsigned int overflow_error = 1;
const unsigned int simplex_arithmetic_error = 2;
const unsigned int user_exception_error = 4;
const unsigned int parser_exception_error = 8;
const unsigned int any_exception_error = ~0;
 }
{ use gnu cpp '__FUNCTION__' extension if possible.
  }
{$if defined(__GNUC__)}

const
  __CURRENT_FUNCTION_NAME__ = __FUNCTION__;  
{$else}

const
  __CURRENT_FUNCTION_NAME__ = '<unknown>';  
{$endif}
  var
    the_last_just_thrown_exception : dword;cvar;external;
{$endif}
{ linear_arithmetic_error_included  }
{ end of it.
  }

implementation


end.
