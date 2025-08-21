
unit gsl_histogram;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_histogram.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_histogram.h
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
Pgsl_histogram  = ^gsl_histogram;
Pgsl_histogram_pdf  = ^gsl_histogram_pdf;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ histogram/gsl_histogram.h
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
{$ifndef __GSL_HISTOGRAM_H__}
{$define __GSL_HISTOGRAM_H__}
{$include <stdlib.h>}
{$include <stdio.h>}
type
  Pgsl_histogram = ^Tgsl_histogram;
  Tgsl_histogram = record
      n : Tsize_t;
      range : Pdouble;
      bin : Pdouble;
    end;

  Pgsl_histogram_pdf = ^Tgsl_histogram_pdf;
  Tgsl_histogram_pdf = record
      n : Tsize_t;
      range : Pdouble;
      sum : Pdouble;
    end;

function gsl_histogram_alloc(n:Tsize_t):Pgsl_histogram;cdecl;external;
function gsl_histogram_calloc(n:Tsize_t):Pgsl_histogram;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram_calloc_uniform(n:Tsize_t; xmin:Tdouble; xmax:Tdouble):Pgsl_histogram;cdecl;external;
procedure gsl_histogram_free(h:Pgsl_histogram);cdecl;external;
function gsl_histogram_increment(h:Pgsl_histogram; x:Tdouble):longint;cdecl;external;
function gsl_histogram_accumulate(h:Pgsl_histogram; x:Tdouble; weight:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram_find(h:Pgsl_histogram; x:Tdouble; i:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_get(h:Pgsl_histogram; i:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_get_range(h:Pgsl_histogram; i:Tsize_t; lower:Pdouble; upper:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_max(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_min(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_bins(h:Pgsl_histogram):Tsize_t;cdecl;external;
procedure gsl_histogram_reset(h:Pgsl_histogram);cdecl;external;
function gsl_histogram_calloc_range(n:Tsize_t; range:Pdouble):Pgsl_histogram;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_set_ranges(h:Pgsl_histogram; range:Pdouble; size:Tsize_t):longint;cdecl;external;
function gsl_histogram_set_ranges_uniform(h:Pgsl_histogram; xmin:Tdouble; xmax:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_memcpy(dest:Pgsl_histogram; source:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_clone(source:Pgsl_histogram):Pgsl_histogram;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_max_val(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_max_bin(h:Pgsl_histogram):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_min_val(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_min_bin(h:Pgsl_histogram):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram_equal_bins_p(h1:Pgsl_histogram; h2:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_add(h1:Pgsl_histogram; h2:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_sub(h1:Pgsl_histogram; h2:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_mul(h1:Pgsl_histogram; h2:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_div(h1:Pgsl_histogram; h2:Pgsl_histogram):longint;cdecl;external;
function gsl_histogram_scale(h:Pgsl_histogram; scale:Tdouble):longint;cdecl;external;
function gsl_histogram_shift(h:Pgsl_histogram; shift:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_sigma(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_mean(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_sum(h:Pgsl_histogram):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_fwrite(stream:PFILE; h:Pgsl_histogram):longint;cdecl;external;
function gsl_histogram_fread(stream:PFILE; h:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_histogram_fprintf(stream:PFILE; h:Pgsl_histogram; range_format:Pchar; bin_format:Pchar):longint;cdecl;external;
function gsl_histogram_fscanf(stream:PFILE; h:Pgsl_histogram):longint;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_pdf_alloc(n:Tsize_t):Pgsl_histogram_pdf;cdecl;external;
(* Const before type ignored *)
function gsl_histogram_pdf_init(p:Pgsl_histogram_pdf; h:Pgsl_histogram):longint;cdecl;external;
procedure gsl_histogram_pdf_free(p:Pgsl_histogram_pdf);cdecl;external;
(* Const before type ignored *)
function gsl_histogram_pdf_sample(p:Pgsl_histogram_pdf; r:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_HISTOGRAM_H__  }

implementation


end.
