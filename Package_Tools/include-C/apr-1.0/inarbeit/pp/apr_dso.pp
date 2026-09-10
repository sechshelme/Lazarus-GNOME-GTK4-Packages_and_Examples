
unit apr_dso;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_dso.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_dso.h
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
Papr_dso_handle_sym_t  = ^apr_dso_handle_sym_t;
Papr_dso_handle_t  = ^apr_dso_handle_t;
Papr_pool_t  = ^apr_pool_t;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_DSO_DOT_H}
{$define APR_DSO_DOT_H}
{*
 * @file apr_dso.h
 * @brief APR Dynamic Object Handling Routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{ C++ extern C conditionnal removed }
{*
 * @defgroup apr_dso Dynamic Object Handling
 * @ingroup APR 
 * @
  }
{$if APR_HAS_DSO || defined(DOXYGEN)}
{*
 * Structure for referencing dynamic objects
  }
type
{*
 * Structure for referencing symbols from dynamic objects
  }

  Papr_dso_handle_sym_t = ^Tapr_dso_handle_sym_t;
  Tapr_dso_handle_sym_t = pointer;
{*
 * Load a DSO library.
 * @param res_handle Location to store new handle for the DSO.
 * @param path Path to the DSO library
 * @param ctx Pool to use.
 * @bug We aught to provide an alternative to RTLD_GLOBAL, which
 * is the only supported method of loading DSOs today.
  }
(* Const before type ignored *)

function apr_dso_load(res_handle:PPapr_dso_handle_t; path:Pchar; ctx:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Close a DSO library.
 * @param handle handle to close.
  }
function apr_dso_unload(handle:Papr_dso_handle_t):Tapr_status_t;cdecl;external;
{*
 * Load a symbol from a DSO handle.
 * @param ressym Location to store the loaded symbol
 * @param handle handle to load the symbol from.
 * @param symname Name of the symbol to load.
  }
(* Const before type ignored *)
function apr_dso_sym(ressym:Papr_dso_handle_sym_t; handle:Papr_dso_handle_t; symname:Pchar):Tapr_status_t;cdecl;external;
{*
 * Report more information when a DSO function fails.
 * @param dso The dso handle that has been opened
 * @param buf Location to store the dso error
 * @param bufsize The size of the provided buffer
  }
(* Const before type ignored *)
function apr_dso_error(dso:Papr_dso_handle_t; buf:Pchar; bufsize:Tapr_size_t):Pchar;cdecl;external;
{$endif}
{ APR_HAS_DSO  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
