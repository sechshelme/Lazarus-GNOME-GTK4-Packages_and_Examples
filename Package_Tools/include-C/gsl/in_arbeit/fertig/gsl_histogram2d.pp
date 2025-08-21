
unit gsl_histogram2d;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_histogram2d.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_histogram2d.h
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
Pdouble  = ^double;
PFILE  = ^FILE;
Pgsl_histogram2d  = ^gsl_histogram2d;
Pgsl_histogram2d_pdf  = ^gsl_histogram2d_pdf;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ histogram/gsl_histogram2d.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Brian Gough
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
  }
{$ifndef __GSL_HISTOGRAM2D_H__}
{$define __GSL_HISTOGRAM2D_H__}
{$include <stdlib.h>}
{$include <stdio.h>}
type
  Pgsl_histogram2d = ^Tgsl_histogram2d;
  Tgsl_histogram2d = record
      nx : Tsize_t;
      ny : Tsize_t;
      xrange : Pdouble;
      yrange : Pdouble;
      bin : Pdouble;
    end;

  Pgsl_histogram2d_pdf = ^Tgsl_histogram2d_pdf;
  Tgsl_histogram2d_pdf = record
      nx : Tsize_t;
      ny : Tsize_t;
      xrange : Pdouble;
      yrange : Pdouble;
      sum : Pdouble;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_histogram2d_alloc(nx:Tsize_t; ny:Tsize_t):Pgsl_histogram2d;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_calloc(nx:Tsize_t; ny:Tsize_t):Pgsl_histogram2d;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_calloc_uniform(nx:Tsize_t; ny:Tsize_t; xmin:Tdouble; xmax:Tdouble; ymin:Tdouble; 
           ymax:Tdouble):Pgsl_histogram2d;cdecl;external;
procedure gsl_histogram2d_free(h:Pgsl_histogram2d);cdecl;external;
function gsl_histogram2d_increment(h:Pgsl_histogram2d; x:Tdouble; y:Tdouble):longint;cdecl;external;
function gsl_histogram2d_accumulate(h:Pgsl_histogram2d; x:Tdouble; y:Tdouble; weight:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_find(h:Pgsl_histogram2d; x:Tdouble; y:Tdouble; i:Psize_t; j:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_get(h:Pgsl_histogram2d; i:Tsize_t; j:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_get_xrange(h:Pgsl_histogram2d; i:Tsize_t; xlower:Pdouble; xupper:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_get_yrange(h:Pgsl_histogram2d; j:Tsize_t; ylower:Pdouble; yupper:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_xmax(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_xmin(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_nx(h:Pgsl_histogram2d):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_ymax(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_ymin(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_ny(h:Pgsl_histogram2d):Tsize_t;cdecl;external;
procedure gsl_histogram2d_reset(h:Pgsl_histogram2d);cdecl;external;
function gsl_histogram2d_calloc_range(nx:Tsize_t; ny:Tsize_t; xrange:Pdouble; yrange:Pdouble):Pgsl_histogram2d;cdecl;external;
function gsl_histogram2d_set_ranges_uniform(h:Pgsl_histogram2d; xmin:Tdouble; xmax:Tdouble; ymin:Tdouble; ymax:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_set_ranges(h:Pgsl_histogram2d; xrange:Pdouble; xsize:Tsize_t; yrange:Pdouble; ysize:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_memcpy(dest:Pgsl_histogram2d; source:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_clone(source:Pgsl_histogram2d):Pgsl_histogram2d;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_max_val(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_histogram2d_max_bin(h:Pgsl_histogram2d; i:Psize_t; j:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_min_val(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_histogram2d_min_bin(h:Pgsl_histogram2d; i:Psize_t; j:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_xmean(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_ymean(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_xsigma(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_ysigma(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_cov(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_sum(h:Pgsl_histogram2d):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_equal_bins_p(h1:Pgsl_histogram2d; h2:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_add(h1:Pgsl_histogram2d; h2:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_sub(h1:Pgsl_histogram2d; h2:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_mul(h1:Pgsl_histogram2d; h2:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_div(h1:Pgsl_histogram2d; h2:Pgsl_histogram2d):longint;cdecl;external;
function gsl_histogram2d_scale(h:Pgsl_histogram2d; scale:Tdouble):longint;cdecl;external;
function gsl_histogram2d_shift(h:Pgsl_histogram2d; shift:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_fwrite(stream:PFILE; h:Pgsl_histogram2d):longint;cdecl;external;
function gsl_histogram2d_fread(stream:PFILE; h:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_fprintf(stream:PFILE; h:Pgsl_histogram2d; range_format:Pchar; bin_format:Pchar):longint;cdecl;external;
function gsl_histogram2d_fscanf(stream:PFILE; h:Pgsl_histogram2d):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram2d_pdf_alloc(nx:Tsize_t; ny:Tsize_t):Pgsl_histogram2d_pdf;cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_pdf_init(p:Pgsl_histogram2d_pdf; h:Pgsl_histogram2d):longint;cdecl;external;
procedure gsl_histogram2d_pdf_free(p:Pgsl_histogram2d_pdf);cdecl;external;
(* Const before type ignored *)
function gsl_histogram2d_pdf_sample(p:Pgsl_histogram2d_pdf; r1:Tdouble; r2:Tdouble; x:Pdouble; y:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_HISTOGRAM2D_H__  }

implementation


end.
