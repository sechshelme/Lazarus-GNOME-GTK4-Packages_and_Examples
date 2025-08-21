
unit gsl_dht;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_dht.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_dht.h
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
Pdouble  = ^double;
Pgsl_dht  = ^gsl_dht;
Pgsl_dht_struct  = ^gsl_dht_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ dht/gsl_dht.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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
{ Author:  G. Jungman
  }
{$ifndef __GSL_DHT_H__}
{$define __GSL_DHT_H__}
{$include <stdlib.h>}
{ size of the sample arrays to be transformed     }
{ Bessel function order                           }
{ the upper limit to the x-sampling domain        }
{ the upper limit to the k-sampling domain        }
{ array of computed J_nu zeros, j_nu,s = j[s]   }
{ transform numerator, J_nu(j_i j_m / j_N)        }
{ transform denominator, J_nu+1^2(j_m)          }
type
  Pgsl_dht_struct = ^Tgsl_dht_struct;
  Tgsl_dht_struct = record
      size : Tsize_t;
      nu : Tdouble;
      xmax : Tdouble;
      kmax : Tdouble;
      j : Pdouble;
      Jjj : Pdouble;
      J2 : Pdouble;
    end;

  Tgsl_dht_struct = Tgsl_dht;
{ Create a new transform object for a given size
 * sampling array on the domain [0, xmax].
  }

function gsl_dht_alloc(size:Tsize_t):Pgsl_dht;cdecl;external;
function gsl_dht_new(size:Tsize_t; nu:Tdouble; xmax:Tdouble):Pgsl_dht;cdecl;external;
{ Recalculate a transform object for given values of nu, xmax.
 * You cannot change the size of the object since the internal
 * allocation is reused.
  }
function gsl_dht_init(t:Pgsl_dht; nu:Tdouble; xmax:Tdouble):longint;cdecl;external;
{ The n'th computed x sample point for a given transform.
 * 0 <= n <= size-1
  }
(* Const before type ignored *)
function gsl_dht_x_sample(t:Pgsl_dht; n:longint):Tdouble;cdecl;external;
{ The n'th computed k sample point for a given transform.
 * 0 <= n <= size-1
  }
(* Const before type ignored *)
function gsl_dht_k_sample(t:Pgsl_dht; n:longint):Tdouble;cdecl;external;
{ Free a transform object.
  }
procedure gsl_dht_free(t:Pgsl_dht);cdecl;external;
{ Perform a transform on a sampled array.
 * f_in[0] ... f_in[size-1] and similarly for f_out[]
  }
(* Const before type ignored *)
function gsl_dht_apply(t:Pgsl_dht; f_in:Pdouble; f_out:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_DHT_H__  }

implementation


end.
