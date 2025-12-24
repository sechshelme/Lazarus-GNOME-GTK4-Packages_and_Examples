
unit alternative;
interface

{
  Automatically converted by H2Pas 1.0.0 from alternative.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    alternative.h
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


{$ifndef fooalternativehfoo}
{$define fooalternativehfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{* \file alternative.h Functions to find alternative names for hosts and services in the case of name collision  }
{$include <avahi-common/cdecl.h>}
{* Find an alternative for the specified host name. If called with an
 * original host name, "-2" is appended, afterwards the number is
 * increased on each call. (i.e. "foo" becomes "foo-2" becomes "foo-3"
 * and so on.) avahi_free() the result.  }
(* Const before type ignored *)

function avahi_alternative_host_name(s:Pchar):Pchar;cdecl;external;
{* Find an alternative for the specified service name. If called with
 * an original service name, " #2" is appended. Afterwards the number
 * is increased on each call (i.e. "foo" becomes "foo #2" becomes "foo
 * #3" and so on.) avahi_free() the result.  }
(* Const before type ignored *)
function avahi_alternative_service_name(s:Pchar):Pchar;cdecl;external;
{$endif}

implementation


end.
