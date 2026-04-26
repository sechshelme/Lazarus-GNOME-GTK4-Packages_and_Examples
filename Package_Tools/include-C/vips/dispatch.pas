unit dispatch;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ VIPS function dispatch.
 *
 * J. Cupitt, 8/4/93.
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
{$ifndef IM_DISPATCH_H}
{$define IM_DISPATCH_H}
{$include <glib-object.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{$include <vips/vips.h>}
{$include <vips/util.h>}
{ Type names. You may define your own, but if you use one of these, then
 * you should use the built-in VIPS type converters.
  }
{ im_object is ptr to IMAGE[]  }

const
  IM_TYPE_IMAGEVEC = 'imagevec';  
{ im_object is ptr to double[]  }
  IM_TYPE_DOUBLEVEC = 'doublevec';  
{ im_object is ptr to int[]  }
  IM_TYPE_INTVEC = 'intvec';  
{ im_object is ptr to double  }
  IM_TYPE_DOUBLE = 'double';  
{ 32-bit integer  }
  IM_TYPE_INT = 'integer';  
{ Pair of doubles  }
  IM_TYPE_COMPLEX = 'complex';  
{ Zero-terminated char array  }
  IM_TYPE_STRING = 'string';  
{ Integer mask type  }
  IM_TYPE_IMASK = 'intmask';  
{ Double mask type  }
  IM_TYPE_DMASK = 'doublemask';  
{ IMAGE descriptor  }
  IM_TYPE_IMAGE = 'image';  
{ Display descriptor  }
  IM_TYPE_DISPLAY = 'display';  
{ GValue wrapper  }
  IM_TYPE_GVALUE = 'gvalue';  
{ A subclass of VipsInterpolate  }
  IM_TYPE_INTERPOLATE = 'interpolate';  
type
  Pim_arg_type = ^Tim_arg_type;
  Tim_arg_type = Pchar;
{ Type of argument id  }
{ Internal representation of an argument to an image processing function.
  }

  Pim_object = ^Tim_object;
  Tim_object = pointer;
{ These bits are ored together to make the flags in a type descriptor.
 *
 * IM_TYPE_OUTPUT: set to indicate output, otherwise input. If the IM_TYPE_RW
 * bit is set and IM_TYPE_OUTPUT is not set, both input and output (ie. the
 * operation side-effects this argument).
 *
 * IM_TYPE_ARG: Two ways of making an im_object --- with and without a
 * command-line string to help you along. Arguments with a string are thing
 * like IMAGE descriptors, which require a filename to initialise.
 * Arguments without are things like output numbers, where making the object
 * simply involves allocating storage.
  }
{ No flags  }
{ Output/input object  }
{ Uses a str arg in construction  }
{ Read-write  }

  Pim_type_flags = ^Tim_type_flags;
  Tim_type_flags =  Longint;
  Const
    IM_TYPE_NONE = 0;
    IM_TYPE_OUTPUT = $1;
    IM_TYPE_ARG = $2;
    IM_TYPE_RW = $4;
;
{ Initialise, destroy and write objects. The "str" argument to the
 * init function will not be supplied if this is not an ARG type. The
 * write function writes to the GString.
  }
type

  Tim_init_obj_fn = function (obj:Pim_object; str:Pchar):longint;cdecl;

  Tim_dest_obj_fn = function (obj:Tim_object):longint;cdecl;
{ Describe a VIPS type.
  }
{ Type of argument  }
{ sizeof(im_object repres.)  }
{ Flags  }
{ Operation functions  }
{ Destroy object  }

  Pim_type_desc = ^Tim_type_desc;
  Tim_type_desc = record
      _type : Tim_arg_type;
      size : longint;
      flags : Tim_type_flags;
      init : Tim_init_obj_fn;
      dest : Tim_dest_obj_fn;
    end;
{ Success on an argument. This is called if the image processing function
 * succeeds and should be used to (for example) print output.
  }

  Tim_print_obj_fn = function (obj:Tim_object):longint;cdecl;
{ Describe a VIPS command argument.
  }
{ eg. "width"  }
{ Type description  }
{ Print some output objects  }

  Pim_arg_desc = ^Tim_arg_desc;
  Tim_arg_desc = record
      name : Pchar;
      desc : Pim_type_desc;
      print : Tim_print_obj_fn;
    end;
{ Type of VIPS dispatch function.
  }

  Tim_dispatch_fn = function (argv:Pim_object):longint;cdecl;
{ Maximum size of arg table.
  }

const
  IM_MAX_ARGS = 1000;  
{ Flags for functions. These are for information only, and more may be
 * added.
  }
{ No flags set  }
{ Is a partial function  }
{ Performs coordinate transformations  }
{ Point-to-point ... can be done with a LUT  }
{ Result should not be cached  }
type
  Pim_fn_flags = ^Tim_fn_flags;
  Tim_fn_flags =  Longint;
  Const
    IM_FN_NONE = 0;
    IM_FN_PIO = $1;
    IM_FN_TRANSFORM = $2;
    IM_FN_PTOP = $4;
    IM_FN_NOCACHE = $8;
;
{ Describe a VIPS function.
  }
{ eg "im_invert"  }
{ Description - eg "photographic negative"  }
{ Flags for this function  }
{ Dispatch  }
{ Number of args  }
{ Arg table  }
type
  Pim_function = ^Tim_function;
  Tim_function = record
      name : Pchar;
      desc : Pchar;
      flags : Tim_fn_flags;
      disp : Tim_dispatch_fn;
      argc : longint;
      argv : Pim_arg_desc;
    end;
{ A set of VIPS functions forming a package.
  }
{ Package name (eg "arithmetic")  }
{ Number of functions in package  }
{ Array of function descriptors  }

  Pim_package = ^Tim_package;
  Tim_package = record
      name : Pchar;
      nfuncs : longint;
      table : ^Pim_function;
    end;
{ Externs for dispatch.
  }
{ Struct for mask IO to a file.
  }
{ Command-line name in  }
{ Mask --- DOUBLE or INT  }

  Pim_mask_object = ^Tim_mask_object;
  Tim_mask_object = record
      name : Pchar;
      mask : pointer;
    end;
{ Struct for doublevec IO
  }
{ Vector length  }
{ Vector  }

  Pim_doublevec_object = ^Tim_doublevec_object;
  Tim_doublevec_object = record
      n : longint;
      vec : Pdouble;
    end;
{ Struct for intvec IO
  }
{ Vector length  }
{ Vector  }

  Pim_intvec_object = ^Tim_intvec_object;
  Tim_intvec_object = record
      n : longint;
      vec : Plongint;
    end;
{ Struct for imagevec IO
  }
{ Vector length  }
{ Vector  }

  Pim_imagevec_object = ^Tim_imagevec_object;
  Tim_imagevec_object = record
      n : longint;
      vec : ^PIMAGE;
    end;
{ Built-in VIPS types.
  }
{xxxx VIPS_DEPRECATED im_type_desc im__input_int; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_intvec; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_imask; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_int; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_intvec; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_imask; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_double; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_doublevec; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_dmask; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_double; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_doublevec; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_dmask; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_dmask_screen; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_complex; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_string; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_string; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_imagevec; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_image; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_image; }
{xxxx VIPS_DEPRECATED im_type_desc im__rw_image; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_display; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_display; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_gvalue; }
{xxxx VIPS_DEPRECATED im_type_desc im__output_gvalue; }
{xxxx VIPS_DEPRECATED im_type_desc im__input_interpolate; }
{ VIPS print functions.
  }
{xxxx VIPS_DEPRECATED int im__iprint(im_object obj);		/* int */ }
{xxxx VIPS_DEPRECATED int im__ivprint(im_object obj);		/* intvec */ }
{xxxx VIPS_DEPRECATED int im__dprint(im_object obj);		/* double */ }
{xxxx VIPS_DEPRECATED int im__dvprint(im_object obj);		/* doublevec */ }
{xxxx VIPS_DEPRECATED int im__dmsprint(im_object obj);	/* DOUBLEMASK as stats */ }
{xxxx VIPS_DEPRECATED int im__cprint(im_object obj);		/* complex */ }
{xxxx VIPS_DEPRECATED int im__sprint(im_object obj);		/* string */ }
{xxxx VIPS_DEPRECATED int im__displayprint(im_object obj);/* im_col_display */ }
{xxxx VIPS_DEPRECATED int im__gprint(im_object obj);		/* GValue */ }
{ Add a plug-in package.
  }
{xxxx VIPS_DEPRECATED }

function im_load_plugin(name:Pchar):Pim_package;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_load_plugins(fmt:Pchar; args:array of const):longint;cdecl;external libvips;
function im_load_plugins(fmt:Pchar):longint;cdecl;external libvips;
{ Close all plug-ins.
  }
{xxxx VIPS_DEPRECATED }
function im_close_plugins:longint;cdecl;external libvips;
{ Loop over all loaded packages.
  }
{xxxx VIPS_DEPRECATED }
function im_map_packages(fn:TVipsSListMap2Fn; a:pointer):pointer;cdecl;external libvips;
{ Convenience functions for finding packages, functions, etc.
  }
{xxxx VIPS_DEPRECATED }
function im_find_function(name:Pchar):Pim_function;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_find_package(name:Pchar):Pim_package;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_package_of_function(name:Pchar):Pim_package;cdecl;external libvips;
{ Allocate space for, and free im_object argument lists.
  }
{xxxx VIPS_DEPRECATED }
function im_free_vargv(fn:Pim_function; vargv:Pim_object):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_allocate_vargv(fn:Pim_function; vargv:Pim_object):longint;cdecl;external libvips;
{ Run a VIPS command by name.
  }
{xxxx VIPS_DEPRECATED }
function im_run_command(name:Pchar; argc:longint; argv:PPchar):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function vips__input_interpolate_init(obj:Pim_object; str:Pchar):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{IM_DISPATCH_H }

// === Konventiert am: 26-4-26 16:14:15 ===


implementation



end.
