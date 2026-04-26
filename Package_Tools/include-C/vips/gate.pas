unit gate;

interface

uses
  fp_glib2;

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
    vips__thread_profile : Tgboolean;cvar;external libvips;

procedure vips_profile_set(profile:Tgboolean);cdecl;external libvips;
procedure vips__thread_profile_attach(thread_name:Pchar);cdecl;external libvips;
procedure vips__thread_profile_detach;cdecl;external libvips;
procedure vips__thread_profile_stop;cdecl;external libvips;
procedure vips__thread_gate_start(gate_name:Pchar);cdecl;external libvips;
procedure vips__thread_gate_stop(gate_name:Pchar);cdecl;external libvips;
procedure vips__thread_malloc_free(size:Tgint64);cdecl;external libvips;
{$endif}
{VIPS_GATE_H }
{ C++ end of extern C conditionnal removed }
{__cplusplus }

// === Konventiert am: 26-4-26 16:13:20 ===


implementation



end.
