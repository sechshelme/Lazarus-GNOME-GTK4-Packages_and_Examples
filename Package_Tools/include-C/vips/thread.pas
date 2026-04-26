unit thread;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Private include file ... if we've been configured without gthread, we need
 * to point the g_thread_*() and g_mutex_*() functions at our own stubs.
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
{$ifndef VIPS_THREAD_H}
{$define VIPS_THREAD_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ We need wrappers over g_mutex_new(), it was replaced by g_mutex_init() in
 * glib 2.32+
  }

function vips_g_mutex_new:PGMutex;cdecl;external libvips;
procedure vips_g_mutex_free(para1:PGMutex);cdecl;external libvips;
{ Same for GCond.
  }
function vips_g_cond_new:PGCond;cdecl;external libvips;
procedure vips_g_cond_free(para1:PGCond);cdecl;external libvips;
{ ... and for GThread.
  }
function vips_g_thread_new(para1:Pchar; para2:TGThreadFunc; para3:Tgpointer):PGThread;cdecl;external libvips;
function vips_thread_isvips:Tgboolean;cdecl;external libvips;
function vips_thread_execute(domain:Pchar; func:TGFunc; data:Tgpointer):longint;cdecl;external libvips;
type

function vips_threadset_new(max_threads:longint):PVipsThreadset;cdecl;external libvips;
function vips_threadset_run(set:PVipsThreadset; domain:Pchar; func:TGFunc; data:Tgpointer):longint;cdecl;external libvips;
procedure vips_threadset_free(set:PVipsThreadset);cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_THREAD_H }

// === Konventiert am: 26-4-26 16:09:54 ===


implementation



end.
