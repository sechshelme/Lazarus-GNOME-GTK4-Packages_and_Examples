
unit gsl_rng;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_rng.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_rng.h
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
Pgsl_rng  = ^gsl_rng;
Pgsl_rng_type  = ^gsl_rng_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ rng/gsl_rng.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 James Theiler, Brian Gough
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
{$ifndef __GSL_RNG_H__}
{$define __GSL_RNG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
(* Const before type ignored *)
type
  Pgsl_rng_type = ^Tgsl_rng_type;
  Tgsl_rng_type = record
      name : Pchar;
      max : dword;
      min : dword;
      size : Tsize_t;
      set : procedure (state:pointer; seed:dword);cdecl;
      get : function (state:pointer):dword;cdecl;
      get_double : function (state:pointer):Tdouble;cdecl;
    end;
(* Const before type ignored *)

  Pgsl_rng = ^Tgsl_rng;
  Tgsl_rng = record
      _type : Pgsl_rng_type;
      state : pointer;
    end;
{ These structs also need to appear in default.c so you can select
   them via the environment variable GSL_RNG_TYPE  }
(* Const before type ignored *)
  var
    gsl_rng_borosh13 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_coveyou : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_cmrg : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_fishman18 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_fishman20 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_fishman2x : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_gfsr4 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_knuthran : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_knuthran2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_knuthran2002 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_lecuyer21 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_minstd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_mrg : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_mt19937 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_mt19937_1999 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_mt19937_1998 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_r250 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ran0 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ran1 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ran2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ran3 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_rand : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_rand48 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random128_bsd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random128_glibc2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random128_libc5 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random256_bsd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random256_glibc2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random256_libc5 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random32_bsd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random32_glibc2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random32_libc5 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random64_bsd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random64_glibc2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random64_libc5 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random8_bsd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random8_glibc2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random8_libc5 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random_bsd : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random_glibc2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_random_libc5 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_randu : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranf : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlux : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlux389 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlxd1 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlxd2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlxs0 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlxs1 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranlxs2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_ranmar : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_slatec : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_taus : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_taus2 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_taus113 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_transputer : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_tt800 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_uni : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_uni32 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_vax : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_waterman14 : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)
    gsl_rng_zuf : Pgsl_rng_type;cvar;external;
(* Const before type ignored *)

function gsl_rng_types_setup:^Pgsl_rng_type;cdecl;external;
(* Const before type ignored *)
  var
    gsl_rng_default : Pgsl_rng_type;cvar;external;
    gsl_rng_default_seed : dword;cvar;external;
(* Const before type ignored *)

function gsl_rng_alloc(T:Pgsl_rng_type):Pgsl_rng;cdecl;external;
(* Const before type ignored *)
function gsl_rng_memcpy(dest:Pgsl_rng; src:Pgsl_rng):longint;cdecl;external;
(* Const before type ignored *)
function gsl_rng_clone(r:Pgsl_rng):Pgsl_rng;cdecl;external;
procedure gsl_rng_free(r:Pgsl_rng);cdecl;external;
(* Const before type ignored *)
procedure gsl_rng_set(r:Pgsl_rng; seed:dword);cdecl;external;
(* Const before type ignored *)
function gsl_rng_max(r:Pgsl_rng):dword;cdecl;external;
(* Const before type ignored *)
function gsl_rng_min(r:Pgsl_rng):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_rng_name(r:Pgsl_rng):Pchar;cdecl;external;
function gsl_rng_fread(stream:PFILE; r:Pgsl_rng):longint;cdecl;external;
(* Const before type ignored *)
function gsl_rng_fwrite(stream:PFILE; r:Pgsl_rng):longint;cdecl;external;
(* Const before type ignored *)
function gsl_rng_size(r:Pgsl_rng):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_rng_state(r:Pgsl_rng):pointer;cdecl;external;
(* Const before type ignored *)
procedure gsl_rng_print_state(r:Pgsl_rng);cdecl;external;
(* Const before type ignored *)
function gsl_rng_env_setup:Pgsl_rng_type;cdecl;external;
(* Const before type ignored *)
function gsl_rng_get(r:Pgsl_rng):dword;cdecl;external;
(* Const before type ignored *)
function gsl_rng_uniform(r:Pgsl_rng):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rng_uniform_pos(r:Pgsl_rng):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rng_uniform_int(r:Pgsl_rng; n:dword):dword;cdecl;external;
{$endif}
{ __GSL_RNG_H__  }

implementation


end.
