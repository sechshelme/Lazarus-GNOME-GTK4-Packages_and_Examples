unit H5PLextern;

interface

uses
  fp_hdf5;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 * All rights reserved.                                                      *
 *                                                                           *
 * This file is part of HDF5.  The full HDF5 copyright notice, including     *
 * terms governing use, modification, and redistribution, is contained in    *
 * the COPYING file, which can be found at the root of the source code       *
 * distribution tree, or in https://www.hdfgroup.org/licenses.               *
 * If you do not have access to either file, you may request a copy from     *
 * help@hdfgroup.org.                                                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  }
{
 * Purpose:     Header file for writing external HDF5 plugins.
  }
{$ifndef H5PLextern_H}
{$define H5PLextern_H}
{ Include HDF5 header  }
{$include "hdf5.h"}
{ plugins always export  }
{$if defined(_MSC_VER) /* MSVC Compiler Case */}

{ was #define dname def_expr }
function H5PLUGIN_DLL : longint; { return type might be wrong }

(*** was #elif ****){$else (__GNUC__ >= 4) /* GCC 4.x has support for visibility options */}

{ was #define dname def_expr }
function H5PLUGIN_DLL : longint; { return type might be wrong }

{$else}
{$define H5PLUGIN_DLL}
{$endif}
{ C++ extern C conditionnal removed }
(* error 
H5PLUGIN_DLL H5PL_type_t H5PLget_plugin_type(void);
 in declarator_list *)
(* error 
H5PLUGIN_DLL const void *H5PLget_plugin_info(void);
 in declarator_list *)
{ C++ end of extern C conditionnal removed }
{$endif}
{ H5PLextern_H  }

// === Konventiert am: 21-8-26 14:23:46 ===


implementation


{ was #define dname def_expr }
function H5PLUGIN_DLL : longint; { return type might be wrong }
  begin
    H5PLUGIN_DLL:=__declspec(dllexport);
  end;

{ was #define dname def_expr }
function H5PLUGIN_DLL : longint; { return type might be wrong }
  begin
    H5PLUGIN_DLL:=__attribute__(visibility('default'));
  end;


end.
