
unit object;
interface

{
  Automatically converted by H2Pas 1.0.0 from object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    object.h
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
PGObject  = ^GObject;
PGParamSpec  = ^GParamSpec;
PGSList  = ^GSList;
PGValue  = ^GValue;
Plongint  = ^longint;
PVipsArgument  = ^VipsArgument;
PVipsArgumentClass  = ^VipsArgumentClass;
PVipsArgumentClassMapFn  = ^VipsArgumentClassMapFn;
PVipsArgumentFlags  = ^VipsArgumentFlags;
PVipsArgumentInstance  = ^VipsArgumentInstance;
PVipsArgumentMapFn  = ^VipsArgumentMapFn;
PVipsArgumentTable  = ^VipsArgumentTable;
PVipsBuf  = ^VipsBuf;
PVipsClassMapFn  = ^VipsClassMapFn;
PVipsObject  = ^VipsObject;
PVipsObjectClass  = ^VipsObjectClass;
PVipsObjectSetArguments  = ^VipsObjectSetArguments;
PVipsTypeMap2Fn  = ^VipsTypeMap2Fn;
PVipsTypeMapFn  = ^VipsTypeMapFn;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ abstract base class for all vips objects
  }
{

	Copyright (C) 1991-2003 The National Gallery

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
{$ifndef VIPS_OBJECT_H}
{$define VIPS_OBJECT_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/buf.h>}
{$include <vips/basic.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Handy!

typedef struct _VipsObject VipsObject;
typedef struct _VipsObjectClass VipsObjectClass;

/* Track extra stuff for arguments to objects
  }
{< flags > }type
  PVipsArgumentFlags = ^TVipsArgumentFlags;
  TVipsArgumentFlags =  Longint;
  Const
    VIPS_ARGUMENT_NONE = 0;
    VIPS_ARGUMENT_REQUIRED = 1;
    VIPS_ARGUMENT_CONSTRUCT = 2;
    VIPS_ARGUMENT_SET_ONCE = 4;
    VIPS_ARGUMENT_SET_ALWAYS = 8;
    VIPS_ARGUMENT_INPUT = 16;
    VIPS_ARGUMENT_OUTPUT = 32;
    VIPS_ARGUMENT_DEPRECATED = 64;
    VIPS_ARGUMENT_MODIFY = 128;
    VIPS_ARGUMENT_NON_HASHABLE = 256;
;
{ Useful flag combinations. User-visible ones are:
 *
 * VIPS_ARGUMENT_REQUIRED_INPUT 	Eg. the "left" argument for an add operation
 *
 * VIPS_ARGUMENT_OPTIONAL_INPUT 	Eg. the "caption" for an object
 *
 * VIPS_ARGUMENT_REQUIRED_OUTPUT  	Eg. the "result" of an add operation
 *
 * VIPS_ARGUMENT_OPTIONAL_OUTPUT  	Eg. the x pos of the image minimum
 *
 * Other combinations are used internally, eg. supplying the cast-table for an
 * arithmetic operation
  }
  VIPS_ARGUMENT_REQUIRED_INPUT = (VIPS_ARGUMENT_INPUT or VIPS_ARGUMENT_REQUIRED) or VIPS_ARGUMENT_CONSTRUCT;  
  VIPS_ARGUMENT_OPTIONAL_INPUT = VIPS_ARGUMENT_INPUT or VIPS_ARGUMENT_CONSTRUCT;  
  VIPS_ARGUMENT_REQUIRED_OUTPUT = (VIPS_ARGUMENT_OUTPUT or VIPS_ARGUMENT_REQUIRED) or VIPS_ARGUMENT_CONSTRUCT;  
  VIPS_ARGUMENT_OPTIONAL_OUTPUT = VIPS_ARGUMENT_OUTPUT or VIPS_ARGUMENT_CONSTRUCT;  
{ Keep one of these for every argument.
  }
{ pspec for this argument  }
{ More stuff, see below  }
type
  PVipsArgument = ^TVipsArgument;
  TVipsArgument = record
      pspec : PGParamSpec;
    end;
{ Keep one of these in the class struct for every argument.
  }
{ The class of the object we are an arg for.
	  }
{ Order args by this  }
{ G_STRUCT_OFFSET of member in object  }

  PVipsArgumentClass = ^TVipsArgumentClass;
  TVipsArgumentClass = record
      parent : TVipsArgument;
      object_class : PVipsObjectClass;
      flags : TVipsArgumentFlags;
      priority : longint;
      offset : Tguint;
    end;
{ Keep one of these in the object struct for every argument instance.
  }
{ The class we are part of.
	  }
{ The object we are attached to.
	  }
{ Has been set.
	  }
{ If this is an output argument, keep the id of our "close" handler
	 * here.
	  }
{ We need to listen for "invalidate" on input images and send our own
	 * "invalidate" out. If we go, we need to disconnect.
	  }

  PVipsArgumentInstance = ^TVipsArgumentInstance;
  TVipsArgumentInstance = record
      parent : TVipsArgument;
      argument_class : PVipsArgumentClass;
      object : PVipsObject;
      assigned : Tgboolean;
      close_id : Tgulong;
      invalidate_id : Tgulong;
    end;
{ Need to look up our VipsArgument structs from a pspec. Just hash the
 * pointer (ie. we assume pspecs are never shared, is this correct?)
  }

  PVipsArgumentTable = ^TVipsArgumentTable;
  TVipsArgumentTable = TGHashTable;

function vips_argument_get_id:longint;cdecl;external;
procedure vips__object_set_member(object:PVipsObject; pspec:PGParamSpec; member:PPGObject; argument:PGObject);cdecl;external;
type
  PVipsArgumentMapFn = ^TVipsArgumentMapFn;
  TVipsArgumentMapFn = function (object:PVipsObject; pspec:PGParamSpec; argument_class:PVipsArgumentClass; argument_instance:PVipsArgumentInstance; a:pointer; 
               b:pointer):pointer;cdecl;

function vips_argument_map(object:PVipsObject; fn:TVipsArgumentMapFn; a:pointer; b:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function vips_object_get_args(object:PVipsObject; names:PPPchar; flags:PPlongint; n_args:Plongint):longint;cdecl;external;
type
  PVipsArgumentClassMapFn = ^TVipsArgumentClassMapFn;
  TVipsArgumentClassMapFn = function (object_class:PVipsObjectClass; pspec:PGParamSpec; argument_class:PVipsArgumentClass; a:pointer; b:pointer):pointer;cdecl;

function vips_argument_class_map(object_class:PVipsObjectClass; fn:TVipsArgumentClassMapFn; a:pointer; b:pointer):pointer;cdecl;external;
function vips_argument_class_needsstring(argument_class:PVipsArgumentClass):Tgboolean;cdecl;external;
(* Const before type ignored *)
function vips_object_get_argument(object:PVipsObject; name:Pchar; pspec:PPGParamSpec; argument_class:PPVipsArgumentClass; argument_instance:PPVipsArgumentInstance):longint;cdecl;external;
(* Const before type ignored *)
function vips_object_argument_isset(object:PVipsObject; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function vips_object_get_argument_flags(object:PVipsObject; name:Pchar):TVipsArgumentFlags;cdecl;external;
(* Const before type ignored *)
function vips_object_get_argument_priority(object:PVipsObject; name:Pchar):longint;cdecl;external;
{ We have to loop over an objects args in several places, and we can't always
 * use vips_argument_map(), the preferred looper. Have the loop code as a
 * macro as well for these odd cases.
  }
{ And some macros to collect args from a va list.
 *
 * Use something like this:
 *
 *    GParamSpec *pspec;
 *    VipsArgumentClass *argument_class;
 *    VipsArgumentInstance *argument_instance;
 *
 *    if (vips_object_get_argument(VIPS_OBJECT(operation), name,
 * 		   &pspec, &argument_class, &argument_instance))
 * 	   return -1;
 *
 *    VIPS_ARGUMENT_COLLECT_SET(pspec, argument_class, ap);
 *
 * 	   GValue value holds the value of an input argument, do
 * 	   something with it
 *
 *    VIPS_ARGUMENT_COLLECT_GET(pspec, argument_class, ap);
 *
 * 	   void **arg points to where to write an output argument
 *
 *    VIPS_ARGUMENT_COLLECT_END
  }
{ was #define dname def_expr }
function VIPS_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OBJECT_GET_CLASS(obj : longint) : longint;

{ Set after ->build() has run successfully: construct is fully done
	 * and checked.
	  }
{ Set for static objects which are allocated at startup and never
	 * freed. These objects are omitted from leak reports.
	  }
{ Table of argument instances for this class and any derived classes.
	  }
{ Class properties (see below), duplicated in the instance so we can
	 * get at them easily via the property system.
	  }
{ The pre/post/close callbacks are all fire-once.
	  }
{ Total memory allocated relative to this object, handy for
	 * profiling.
	  }
type
  PVipsObject = ^TVipsObject;
  TVipsObject = record
      parent_instance : TGObject;cdecl;
      constructed : Tgboolean;
      static_object : Tgboolean;
      argument_table : PVipsArgumentTable;
      nickname : Pchar;
      description : Pchar;
      preclose : Tgboolean;
      close : Tgboolean;
      postclose : Tgboolean;
      local_memory : Tsize_t;
    end;

{ Build the object ... all argument properties have been set,
	 * now build the thing.
	  }
{ Just after build ... the object is fully ready for work.
	  }
{ Try to print something about the class, handy for help displays.
	 * Keep to one line.
	  }
{ Try to print a one-line summary for the object, the user can see
	 * this output via things like "header fred.tif", --vips-cache-trace,
	 * etc.
	  }
{ Try to print everything about the object, handy for debugging.
	  }
{ Sanity-check the object. Print messages and stuff.
	 * Handy for debugging.
	  }
{ Rewind. Save and restore any stuff that needs to survive a
	 * dispose().
	  }
{ Just before close, everything is still alive.
	  }
{ Close, time to free stuff.
	  }
{ Post-close, everything is dead, except the VipsObject pointer.
	 * Useful for eg. deleting the file associated with a temp image.
	  }
{ The CLI interface. Implement these four to get CLI input and output
	 * for your object.
	  }
{ Given a command-line arg (eg. a filename), make an instance of the
	 * object. Just do the g_object_new(), don't call _build().
	 *
	 * Don't call this directly, see vips_object_new_from_string().
	  }
(* Const before type ignored *)
{ The inverse of ^^. Given an object, output what ->new_from_string()
	 * would have been given to make that object.
	  }
{ Does this output arg need an arg from the command line? Image
	 * output, for example, needs a filename to write to.
	  }
{ Write the object to the string. Return 0 for success, or -1 on
	 * error, setting vips_error(). string is NULL if output_needs_arg()
	 * was FALSE.
	  }
(* Const before type ignored *)
{ Class nickname, eg. "VipsInterpolateBicubic" has "bicubic" as a
	 * nickname. Not internationalised.
	  }
(* Const before type ignored *)
{ Class description. Used for help messages, so internationalised.
	  }
(* Const before type ignored *)
{ Hash from pspec to VipsArgumentClass.
	 *
	 * This records the VipsArgumentClass for every pspec used in
	 * VipsObject and any subclass (ie. everywhere), so it's huge. Don't
	 * loop over this hash! Fine for lookups though.
	  }
{ A sorted (by priority) list of the VipsArgumentClass for this class
	 * and any superclasses. This is small and specific to this class.
	 *
	 * Use the stored GType to work out when to restart the list for a
	 * subclass.
	  }
{ This class is deprecated and therefore hidden from various UI bits.
	 *
	 * VipsOperation has a deprecated flag, use that in preference to this
	 * if you can.
	  }
{ Reserved for future expansion.
	  }
  PVipsObjectClass = ^TVipsObjectClass;
  TVipsObjectClass = record
      parent_class : TGObjectClass;
      build : function (object:PVipsObject):longint;cdecl;
      postbuild : function (object:PVipsObject; data:pointer):longint;cdecl;
      summary_class : procedure (cls:PVipsObjectClass; buf:PVipsBuf);cdecl;
      summary : procedure (object:PVipsObject; buf:PVipsBuf);cdecl;
      dump : procedure (object:PVipsObject; buf:PVipsBuf);cdecl;
      sanity : procedure (object:PVipsObject; buf:PVipsBuf);cdecl;
      rewind : procedure (object:PVipsObject);cdecl;
      preclose : procedure (object:PVipsObject);cdecl;
      close : procedure (object:PVipsObject);cdecl;
      postclose : procedure (object:PVipsObject);cdecl;
      new_from_string : function (_string:Pchar):PVipsObject;cdecl;
      to_string : procedure (object:PVipsObject; buf:PVipsBuf);cdecl;
      output_needs_arg : Tgboolean;
      output_to_arg : function (object:PVipsObject; _string:Pchar):longint;cdecl;
      nickname : Pchar;
      description : Pchar;
      argument_table : PVipsArgumentTable;
      argument_table_traverse : PGSList;
      argument_table_traverse_gtype : TGType;
      deprecated : Tgboolean;
      _vips_reserved1 : procedure ;cdecl;
      _vips_reserved2 : procedure ;cdecl;
      _vips_reserved3 : procedure ;cdecl;
      _vips_reserved4 : procedure ;cdecl;
    end;

(* Const before type ignored *)

function vips_value_is_null(psoec:PGParamSpec; value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure vips_object_set_property(gobject:PGObject; property_id:Tguint; value:PGValue; pspec:PGParamSpec);cdecl;external;
procedure vips_object_get_property(gobject:PGObject; property_id:Tguint; value:PGValue; pspec:PGParamSpec);cdecl;external;
procedure vips_object_preclose(object:PVipsObject);cdecl;external;
function vips_object_build(object:PVipsObject):longint;cdecl;external;
procedure vips_object_summary_class(klass:PVipsObjectClass; buf:PVipsBuf);cdecl;external;
procedure vips_object_summary(object:PVipsObject; buf:PVipsBuf);cdecl;external;
procedure vips_object_dump(object:PVipsObject; buf:PVipsBuf);cdecl;external;
procedure vips_object_print_summary_class(klass:PVipsObjectClass);cdecl;external;
procedure vips_object_print_summary(object:PVipsObject);cdecl;external;
procedure vips_object_print_dump(object:PVipsObject);cdecl;external;
procedure vips_object_print_name(object:PVipsObject);cdecl;external;
function vips_object_sanity(object:PVipsObject):Tgboolean;cdecl;external;
{ Don't put spaces around void here, it breaks gtk-doc.
  }
function vips_object_get_type:TGType;cdecl;external;
procedure vips_object_class_install_argument(cls:PVipsObjectClass; pspec:PGParamSpec; flags:TVipsArgumentFlags; priority:longint; offset:Tguint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_object_set_argument_from_string(object:PVipsObject; name:Pchar; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_object_argument_needsstring(object:PVipsObject; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_object_get_argument_to_string(object:PVipsObject; name:Pchar; arg:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_object_set_required(object:PVipsObject; value:Pchar):longint;cdecl;external;
type
  PVipsObjectSetArguments = ^TVipsObjectSetArguments;
  TVipsObjectSetArguments = function (object:PVipsObject; a:pointer; b:pointer):pointer;cdecl;

function vips_object_new(_type:TGType; set:TVipsObjectSetArguments; a:pointer; b:pointer):PVipsObject;cdecl;external;
function vips_object_set_valist(object:PVipsObject; ap:Tva_list):longint;cdecl;external;
function vips_object_set(object:PVipsObject; args:array of const):longint;cdecl;external;
function vips_object_set(object:PVipsObject):longint;cdecl;external;
(* Const before type ignored *)
function vips_object_set_from_string(object:PVipsObject; _string:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_object_new_from_string(object_class:PVipsObjectClass; p:Pchar):PVipsObject;cdecl;external;
procedure vips_object_to_string(object:PVipsObject; buf:PVipsBuf);cdecl;external;
function vips_object_map(fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external;
type
  PVipsTypeMapFn = ^TVipsTypeMapFn;
  TVipsTypeMapFn = function (_type:TGType; a:pointer):pointer;cdecl;

  PVipsTypeMap2Fn = ^TVipsTypeMap2Fn;
  TVipsTypeMap2Fn = function (_type:TGType; a:pointer; b:pointer):pointer;cdecl;

  PVipsClassMapFn = ^TVipsClassMapFn;
  TVipsClassMapFn = function (cls:PVipsObjectClass; a:pointer):pointer;cdecl;

function vips_type_map(base:TGType; fn:TVipsTypeMap2Fn; a:pointer; b:pointer):pointer;cdecl;external;
function vips_type_map_all(base:TGType; fn:TVipsTypeMapFn; a:pointer):pointer;cdecl;external;
function vips_type_depth(_type:TGType):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_type_find(basename:Pchar; nickname:Pchar):TGType;cdecl;external;
(* Const before type ignored *)
function vips_nickname_find(_type:TGType):Pchar;cdecl;external;
function vips_class_map_all(_type:TGType; fn:TVipsClassMapFn; a:pointer):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function vips_class_find(basename:Pchar; nickname:Pchar):PVipsObjectClass;cdecl;external;
function vips_object_local_array(parent:PVipsObject; n:longint):^PVipsObject;cdecl;external;
procedure vips_object_local_cb(vobject:PVipsObject; gobject:PGObject);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function vips_object_local(V,G : longint) : longint;

procedure vips_object_set_static(object:PVipsObject; static_object:Tgboolean);cdecl;external;
procedure vips_object_print_all;cdecl;external;
procedure vips_object_sanity_all;cdecl;external;
procedure vips_object_rewind(object:PVipsObject);cdecl;external;
procedure vips_object_unref_outputs(object:PVipsObject);cdecl;external;
(* Const before type ignored *)
function vips_object_get_description(object:PVipsObject):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_OBJECT_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    VIPS_TYPE_OBJECT:=vips_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OBJECT(obj : longint) : longint;
begin
  VIPS_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_OBJECT,VipsObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OBJECT_CLASS(klass : longint) : longint;
begin
  VIPS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_OBJECT,VipsObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OBJECT(obj : longint) : longint;
begin
  VIPS_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_OBJECT_CLASS(klass : longint) : longint;
begin
  VIPS_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_OBJECT_GET_CLASS(obj : longint) : longint;
begin
  VIPS_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_OBJECT,VipsObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function vips_object_local(V,G : longint) : longint;
begin
  vips_object_local:=g_signal_connect(V,'close',G_CALLBACK(vips_object_local_cb),G);
end;


end.
