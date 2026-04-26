unit threadpool;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Thread eval for VIPS.
 *
 * 29/9/99 JC
 *	- from thread.h
 * 17/3/10
 * 	- from threadgroup
 * 	- rework with a simpler distributed work allocation model
 * 02/02/20 kleisauke
 * 	- reuse threads by using GLib's threadpool
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
{$ifndef VIPS_THREADPOOL_H}
{$define VIPS_THREADPOOL_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/image.h>}
{$include <vips/object.h>}
{$include <vips/region.h>}
{$include <vips/rect.h>}
{$include <vips/semaphore.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Per-thread state. Allocate functions can use these members to
 * communicate with work functions.
  }

{< public > }
{ Image we run on.
	  }
{ This region is created and destroyed by the threadpool for the
	 * use of the worker.
	  }
{ Neither used nor set, do what you like with them.
	  }
{ Set in work to get the allocate to signal stop.
	  }
{ The client data passed to the enclosing vips_threadpool_run().
	  }
{ Set in allocate to stall this thread for a moment. Handy for
	 * debugging race conditions.
	  }
type
  PVipsThreadState = ^TVipsThreadState;
  TVipsThreadState = record
      parent_object : TVipsObject;
      im : PVipsImage;
      reg : PVipsRegion;
      pos : TVipsRect;
      x : longint;
      y : longint;
      stop : Tgboolean;
      a : pointer;
      stall : Tgboolean;
    end;
{< public > }

  PVipsThreadStateClass = ^TVipsThreadStateClass;
  TVipsThreadStateClass = record
      parent_class : TVipsObjectClass;
    end;

function vips_thread_state_set(object:PVipsObject; a:pointer; b:pointer):pointer;cdecl;external libvips;
{ Don't put spaces around void here, it breaks gtk-doc.
  }
function vips_thread_state_get_type:TGType;cdecl;external libvips;
function vips_thread_state_new(im:PVipsImage; a:pointer):PVipsThreadState;cdecl;external libvips;
{ Constructor for per-thread state.
  }
type
  PVipsThreadStartFn = ^TVipsThreadStartFn;
  TVipsThreadStartFn = function (im:PVipsImage; a:pointer):PVipsThreadState;cdecl;
{ A work allocate function. This is run single-threaded by a worker to
 * set up a new work unit.
 * Return non-zero for errors. Set *stop for "no more work to do"
  }

  TVipsThreadpoolAllocateFn = function (state:PVipsThreadState; a:pointer; stop:Pgboolean):longint;cdecl;
{ A work function. This does a unit of work (eg. processing a tile or
 * whatever). Return non-zero for errors.
  }

  TVipsThreadpoolWorkFn = function (state:PVipsThreadState; a:pointer):longint;cdecl;
{ A progress function. This is run by the main thread once for every
 * allocation. Return an error to kill computation early.
  }

  TVipsThreadpoolProgressFn = function (a:pointer):longint;cdecl;

function vips_threadpool_run(im:PVipsImage; start:TVipsThreadStartFn; allocate:TVipsThreadpoolAllocateFn; work:TVipsThreadpoolWorkFn; progress:TVipsThreadpoolProgressFn; 
           a:pointer):longint;cdecl;external libvips;
procedure vips_get_tile_size(im:PVipsImage; tile_width:Plongint; tile_height:Plongint; n_lines:Plongint);cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_THREADPOOL_H }

// === Konventiert am: 26-4-26 16:09:45 ===

function VIPS_TYPE_THREAD_STATE : TGType;
function VIPS_THREAD_STATE(obj : Pointer) : PVipsThreadState;
function VIPS_THREAD_STATE_CLASS(klass : Pointer) : PVipsThreadStateClass;
function VIPS_IS_THREAD_STATE(obj : Pointer) : Tgboolean;
function VIPS_IS_THREAD_STATE_CLASS(klass : Pointer) : Tgboolean;
function VIPS_THREAD_STATE_GET_CLASS(obj : Pointer) : PVipsThreadStateClass;

implementation

function VIPS_TYPE_THREAD_STATE : TGType;
  begin
    VIPS_TYPE_THREAD_STATE:=vips_thread_state_get_type;
  end;

function VIPS_THREAD_STATE(obj : Pointer) : PVipsThreadState;
begin
  Result := PVipsThreadState(g_type_check_instance_cast(obj, VIPS_TYPE_THREAD_STATE));
end;

function VIPS_THREAD_STATE_CLASS(klass : Pointer) : PVipsThreadStateClass;
begin
  Result := PVipsThreadStateClass(g_type_check_class_cast(klass, VIPS_TYPE_THREAD_STATE));
end;

function VIPS_IS_THREAD_STATE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VIPS_TYPE_THREAD_STATE);
end;

function VIPS_IS_THREAD_STATE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VIPS_TYPE_THREAD_STATE);
end;

function VIPS_THREAD_STATE_GET_CLASS(obj : Pointer) : PVipsThreadStateClass;
begin
  Result := PVipsThreadStateClass(PGTypeInstance(obj)^.g_class);
end;



end.
