
unit shumate_user_agent;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_user_agent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_user_agent.h
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
 * Copyright (C) 2022 James Westman <james@jwestman.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
(* Const before type ignored *)

function shumate_get_user_agent:Pchar;cdecl;external;
(* Const before type ignored *)
procedure shumate_set_user_agent(new_user_agent:Pchar);cdecl;external;

implementation


end.
