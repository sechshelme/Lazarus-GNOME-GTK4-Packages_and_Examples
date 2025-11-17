
unit gphoto2_port_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_port_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_port_version.h
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
PGPVersionFunc  = ^GPVersionFunc;
PGPVersionVerbosity  = ^GPVersionVerbosity;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file gphoto2-port-version.h
 *
 * Copyright 2002 Hans Ulrich Niedermann <gp@n-dimensional.de>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_PORT_VERSION_H}
{$define LIBGPHOTO2_GPHOTO2_PORT_VERSION_H}
type
  PGPVersionVerbosity = ^TGPVersionVerbosity;
  TGPVersionVerbosity =  Longint;
  Const
    GP_VERSION_SHORT = 0;
    GP_VERSION_VERBOSE = 1;
;
{ C++ extern C conditionnal removed }
(* Const before type ignored *)
type
  PGPVersionFunc = ^TGPVersionFunc;
  TGPVersionFunc = function (verbose:TGPVersionVerbosity):PPchar;cdecl;
(* Const before type ignored *)

function gp_port_library_version(verbose:TGPVersionVerbosity):^Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_PORT_VERSION_H)  }
{
 * Local Variables:
 * c-file-style:"linux"
 * indent-tabs-mode:t
 * End:
  }

implementation


end.
