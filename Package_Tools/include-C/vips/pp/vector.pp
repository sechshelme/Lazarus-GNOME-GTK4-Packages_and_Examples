
unit vector;
interface

{
  Automatically converted by H2Pas 1.0.0 from vector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vector.h
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


{ helper stuff for Highway
 *
 * 16/03/21 kleisauke
 *	- from vector.h
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
{$ifndef VIPS_VECTOR_H}
{$define VIPS_VECTOR_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Set from the command-line.
  }
  var
    vips__vector_enabled : Tgboolean;cvar;external;

function vips_vector_isenabled:Tgboolean;cdecl;external;
procedure vips_vector_set_enabled(enabled:Tgboolean);cdecl;external;
function vips_vector_get_builtin_targets:Tgint64;cdecl;external;
function vips_vector_get_supported_targets:Tgint64;cdecl;external;
(* Const before type ignored *)
function vips_vector_target_name(target:Tgint64):Pchar;cdecl;external;
procedure vips_vector_disable_targets(disabled_targets:Tgint64);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_VECTOR_H }

implementation


end.
