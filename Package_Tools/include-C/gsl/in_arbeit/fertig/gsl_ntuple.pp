
unit gsl_ntuple;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_ntuple.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_ntuple.h
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
PFILE  = ^FILE;
Pgsl_histogram  = ^gsl_histogram;
Pgsl_ntuple  = ^gsl_ntuple;
Pgsl_ntuple_select_fn  = ^gsl_ntuple_select_fn;
Pgsl_ntuple_value_fn  = ^gsl_ntuple_value_fn;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ histogram/ntuple.h
 * 
 * Copyright (C) 2000 Simone Piccardi
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
  }
{ Jan/2001 Modified by Brian Gough. Minor changes for GSL  }
{$ifndef __GSL_NTUPLE_H__}
{$define __GSL_NTUPLE_H__}
{$include <stdlib.h>}
{$include <stdio.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_histogram.h>}
type
  Pgsl_ntuple = ^Tgsl_ntuple;
  Tgsl_ntuple = record
      file : PFILE;
      ntuple_data : pointer;
      size : Tsize_t;
    end;

  Pgsl_ntuple_select_fn = ^Tgsl_ntuple_select_fn;
  Tgsl_ntuple_select_fn = record
      _function : function (ntuple_data:pointer; params:pointer):longint;cdecl;
      params : pointer;
    end;

  Pgsl_ntuple_value_fn = ^Tgsl_ntuple_value_fn;
  Tgsl_ntuple_value_fn = record
      _function : function (ntuple_data:pointer; params:pointer):Tdouble;cdecl;
      params : pointer;
    end;

function gsl_ntuple_open(filename:Pchar; ntuple_data:pointer; size:Tsize_t):Pgsl_ntuple;cdecl;external;
function gsl_ntuple_create(filename:Pchar; ntuple_data:pointer; size:Tsize_t):Pgsl_ntuple;cdecl;external;
function gsl_ntuple_write(ntuple:Pgsl_ntuple):longint;cdecl;external;
function gsl_ntuple_read(ntuple:Pgsl_ntuple):longint;cdecl;external;
function gsl_ntuple_bookdata(ntuple:Pgsl_ntuple):longint;cdecl;external;
{ synonym for write  }
function gsl_ntuple_project(h:Pgsl_histogram; ntuple:Pgsl_ntuple; value_func:Pgsl_ntuple_value_fn; select_func:Pgsl_ntuple_select_fn):longint;cdecl;external;
function gsl_ntuple_close(ntuple:Pgsl_ntuple):longint;cdecl;external;
{$endif}
{ __GSL_NTUPLE_H__  }

implementation


end.
