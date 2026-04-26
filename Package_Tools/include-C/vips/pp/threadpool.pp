
unit threadpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from threadpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    threadpool.h
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
Pgboolean  = ^gboolean;
Plongint  = ^longint;
PVipsImage  = ^VipsImage;
PVipsObject  = ^VipsObject;
PVipsRegion  = ^VipsRegion;
PVipsThreadStartFn  = ^VipsThreadStartFn;
PVipsThreadState  = ^VipsThreadState;
PVipsThreadStateClass  = ^VipsThreadStateClass;
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

{ was #define dname def_expr }
function VIPS_TYPE_THREAD_STATE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_THREAD_STATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_THREAD_STATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_THREAD_STATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_THREAD_STATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_THREAD_STATE_GET_CLASS(obj : longint) : longint;

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

function vips_thread_state_set(object:PVipsObject; a:pointer; b:pointer):pointer;cdecl;external;
{ Don't put spaces around void here, it breaks gtk-doc.
  }
function vips_thread_state_get_type:TGType;cdecl;external;
function vips_thread_state_new(im:PVipsImage; a:pointer):PVipsThreadState;cdecl;external;
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
           a:pointer):longint;cdecl;external;
procedure vips_get_tile_size(im:PVipsImage; tile_width:Plongint; tile_height:Plongint; n_lines:Plongint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_THREADPOOL_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_THREAD_STATE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_THREAD_STATE:=vips_thread_state_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_THREAD_STATE(obj : longint) : longint;
begin
  VIPS_THREAD_STATE:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_THREAD_STATE,VipsThreadState);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_THREAD_STATE_CLASS(klass : longint) : longint;
begin
  VIPS_THREAD_STATE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_THREAD_STATE,VipsThreadStateClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_THREAD_STATE(obj : longint) : longint;
begin
  VIPS_IS_THREAD_STATE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_THREAD_STATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_THREAD_STATE_CLASS(klass : longint) : longint;
begin
  VIPS_IS_THREAD_STATE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_THREAD_STATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_THREAD_STATE_GET_CLASS(obj : longint) : longint;
begin
  VIPS_THREAD_STATE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_THREAD_STATE,VipsThreadStateClass);
end;


end.
