
unit gate;
interface

{
  Automatically converted by H2Pas 1.0.0 from gate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gate.h
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


{ Thread profiling.
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_GATE_H}
{$define VIPS_GATE_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{$include <vips/vips.h>}
  var
    vips__thread_profile : Tgboolean;cvar;external;

procedure vips_profile_set(profile:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure vips__thread_profile_attach(thread_name:Pchar);cdecl;external;
procedure vips__thread_profile_detach;cdecl;external;
procedure vips__thread_profile_stop;cdecl;external;
(* Const before type ignored *)
procedure vips__thread_gate_start(gate_name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure vips__thread_gate_stop(gate_name:Pchar);cdecl;external;
procedure vips__thread_malloc_free(size:Tgint64);cdecl;external;
{$endif}
{VIPS_GATE_H }
{ C++ end of extern C conditionnal removed }
{__cplusplus }

implementation


end.
