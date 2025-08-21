
unit gsl_message;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_message.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_message.h
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
Pxxxx  = ^xxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ err/gsl_message.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_MESSAGE_H__}
{$define __GSL_MESSAGE_H__}
{$include <gsl/gsl_types.h>}
{ Provide a general messaging service for client use.  Messages can
 * be selectively turned off at compile time by defining an
 * appropriate message mask. Client code which uses the GSL_MESSAGE()
 * macro must provide a mask which is or'ed with the GSL_MESSAGE_MASK.
 *
 * The messaging service can be completely turned off
 * by defining GSL_MESSAGING_OFF.   }
(* Const before type ignored *)
(* Const before type ignored *)

procedure gsl_message(message:Pchar; file:Pchar; line:longint; mask:dword);cdecl;external;
{$ifndef GSL_MESSAGE_MASK}
{ default all messages allowed  }

const
  GSL_MESSAGE_MASK = $ffffffff;  
{$endif}
  var
    gsl_message_mask : dword;cvar;external;
{ Provide some symolic masks for client ease of use.  }
type
  Txxxx =  Longint;
  Const
    GSL_MESSAGE_MASK_A = 1;
    GSL_MESSAGE_MASK_B = 2;
    GSL_MESSAGE_MASK_C = 4;
    GSL_MESSAGE_MASK_D = 8;
    GSL_MESSAGE_MASK_E = 16;
    GSL_MESSAGE_MASK_F = 32;
    GSL_MESSAGE_MASK_G = 64;
    GSL_MESSAGE_MASK_H = 128;

{$endif}
{ __GSL_MESSAGE_H__  }

implementation


end.
