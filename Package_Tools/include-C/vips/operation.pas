unit operation;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ base class for all vips operations
  }
{

	Copyright (C) 1991-2005 The National Gallery

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_OPERATION_H}
{$define VIPS_OPERATION_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{$include <vips/buf.h>}
{$include <vips/basic.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{< flags > }type
  PVipsOperationFlags = ^TVipsOperationFlags;
  TVipsOperationFlags =  Longint;
  Const
    VIPS_OPERATION_NONE = 0;
    VIPS_OPERATION_SEQUENTIAL = 1;
    VIPS_OPERATION_SEQUENTIAL_UNBUFFERED = 2;
    VIPS_OPERATION_NOCACHE = 4;
    VIPS_OPERATION_DEPRECATED = 8;
    VIPS_OPERATION_UNTRUSTED = 16;
    VIPS_OPERATION_BLOCKED = 32;
    VIPS_OPERATION_REVALIDATE = 64;
;

type

  TVipsOperationBuildFn = function (object:PVipsObject):Tgboolean;cdecl;
{ Keep the hash here.
	  }
{ Pixels calculated ... handy for measuring over-calculation.
	  }

  PVipsOperation = ^TVipsOperation;
  TVipsOperation = record
      parent_instance : TVipsObject;
      hash : Tguint;
      found_hash : Tgboolean;
      pixels : longint;
    end;
{ Print the usage message.
	  }
{ Return a set of operation flags.
	  }
{ One of our input images has signalled "invalidate". The cache uses
	 * VipsOperation::invalidate to drop dirty ops.
	  }

  PVipsOperationClass = ^TVipsOperationClass;
  TVipsOperationClass = record
      parent_class : TVipsObjectClass;
      usage : procedure (cls:PVipsOperationClass; buf:PVipsBuf);cdecl;
      get_flags : function (operation:PVipsOperation):TVipsOperationFlags;cdecl;
      flags : TVipsOperationFlags;
      invalidate : procedure (operation:PVipsOperation);cdecl;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_operation_get_type:TGType;cdecl;external libvips;
function vips_operation_get_flags(operation:PVipsOperation):TVipsOperationFlags;cdecl;external libvips;
procedure vips_operation_class_print_usage(operation_class:PVipsOperationClass);cdecl;external libvips;
procedure vips_operation_invalidate(operation:PVipsOperation);cdecl;external libvips;
function vips_operation_call_valist(operation:PVipsOperation; ap:Tva_list):longint;cdecl;external libvips;
function vips_operation_new(name:Pchar):PVipsOperation;cdecl;external libvips;
function vips_call_required_optional(operation:PPVipsOperation; required:Tva_list; optional:Tva_list):longint;cdecl;external libvips;
function vips_call(operation_name:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_call(operation_name:Pchar):longint;cdecl;external libvips;
function vips_call_split(operation_name:Pchar; optional:Tva_list; args:array of const):longint;cdecl;external libvips;
function vips_call_split(operation_name:Pchar; optional:Tva_list):longint;cdecl;external libvips;
function vips_call_split_option_string(operation_name:Pchar; option_string:Pchar; optional:Tva_list; args:array of const):longint;cdecl;external libvips;
function vips_call_split_option_string(operation_name:Pchar; option_string:Pchar; optional:Tva_list):longint;cdecl;external libvips;
procedure vips_call_options(group:PGOptionGroup; operation:PVipsOperation);cdecl;external libvips;
function vips_call_argv(operation:PVipsOperation; argc:longint; argv:PPchar):longint;cdecl;external libvips;
procedure vips_cache_drop_all;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cache_operation_buildp) }
function vips_cache_operation_lookup(operation:PVipsOperation):PVipsOperation;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cache_operation_buildp) }
procedure vips_cache_operation_add(operation:PVipsOperation);cdecl;external libvips;
function vips_cache_operation_buildp(operation:PPVipsOperation):longint;cdecl;external libvips;
function vips_cache_operation_build(operation:PVipsOperation):PVipsOperation;cdecl;external libvips;
procedure vips_cache_print;cdecl;external libvips;
procedure vips_cache_set_max(max:longint);cdecl;external libvips;
procedure vips_cache_set_max_mem(max_mem:Tsize_t);cdecl;external libvips;
function vips_cache_get_max:longint;cdecl;external libvips;
function vips_cache_get_size:longint;cdecl;external libvips;
function vips_cache_get_max_mem:Tsize_t;cdecl;external libvips;
function vips_cache_get_max_files:longint;cdecl;external libvips;
procedure vips_cache_set_max_files(max_files:longint);cdecl;external libvips;
procedure vips_cache_set_dump(dump:Tgboolean);cdecl;external libvips;
procedure vips_cache_set_trace(trace:Tgboolean);cdecl;external libvips;
{ Part of threadpool, really, but we want these in a header that gets scanned
 * for our typelib.
  }
procedure vips_concurrency_set(concurrency:longint);cdecl;external libvips;
function vips_concurrency_get:longint;cdecl;external libvips;
procedure vips_operation_block_set(name:Pchar; state:Tgboolean);cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_OPERATION_H }

// === Konventiert am: 26-4-26 16:11:14 ===

function VIPS_TYPE_OPERATION : TGType;
function VIPS_OPERATION(obj : Pointer) : PVipsOperation;
function VIPS_OPERATION_CLASS(klass : Pointer) : PVipsOperationClass;
function VIPS_IS_OPERATION(obj : Pointer) : Tgboolean;
function VIPS_IS_OPERATION_CLASS(klass : Pointer) : Tgboolean;
function VIPS_OPERATION_GET_CLASS(obj : Pointer) : PVipsOperationClass;

implementation

function VIPS_TYPE_OPERATION : TGType;
  begin
    VIPS_TYPE_OPERATION:=vips_operation_get_type;
  end;

function VIPS_OPERATION(obj : Pointer) : PVipsOperation;
begin
  Result := PVipsOperation(g_type_check_instance_cast(obj, VIPS_TYPE_OPERATION));
end;

function VIPS_OPERATION_CLASS(klass : Pointer) : PVipsOperationClass;
begin
  Result := PVipsOperationClass(g_type_check_class_cast(klass, VIPS_TYPE_OPERATION));
end;

function VIPS_IS_OPERATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VIPS_TYPE_OPERATION);
end;

function VIPS_IS_OPERATION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VIPS_TYPE_OPERATION);
end;

function VIPS_OPERATION_GET_CLASS(obj : Pointer) : PVipsOperationClass;
begin
  Result := PVipsOperationClass(PGTypeInstance(obj)^.g_class);
end;



end.
