unit vector;

interface

uses
  fp_glib2;

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
    vips__vector_enabled : Tgboolean;cvar;external libvips;

function vips_vector_isenabled:Tgboolean;cdecl;external libvips;
procedure vips_vector_set_enabled(enabled:Tgboolean);cdecl;external libvips;
function vips_vector_get_builtin_targets:Tgint64;cdecl;external libvips;
function vips_vector_get_supported_targets:Tgint64;cdecl;external libvips;
function vips_vector_target_name(target:Tgint64):Pchar;cdecl;external libvips;
procedure vips_vector_disable_targets(disabled_targets:Tgint64);cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_VECTOR_H }

// === Konventiert am: 26-4-26 16:08:29 ===


implementation



end.
