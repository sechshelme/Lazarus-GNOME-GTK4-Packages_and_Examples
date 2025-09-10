
unit mersenne;
interface

{
  Automatically converted by H2Pas 1.0.0 from mersenne.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mersenne.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef _TCOD_RANDOM_H}
{$define _TCOD_RANDOM_H}
{$include "mersenne_types.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }

function TCOD_random_get_instance:TTCOD_random_t;cdecl;external;
function TCOD_random_new(algo:TTCOD_random_algo_t):TTCOD_random_t;cdecl;external;
function TCOD_random_save(mersenne:TTCOD_random_t):TTCOD_random_t;cdecl;external;
procedure TCOD_random_restore(mersenne:TTCOD_random_t; backup:TTCOD_random_t);cdecl;external;
function TCOD_random_new_from_seed(algo:TTCOD_random_algo_t; seed:Tuint32_t):TTCOD_random_t;cdecl;external;
procedure TCOD_random_delete(mersenne:TTCOD_random_t);cdecl;external;
procedure TCOD_random_set_distribution(mersenne:TTCOD_random_t; distribution:TTCOD_distribution_t);cdecl;external;
function TCOD_random_get_int(mersenne:TTCOD_random_t; min:longint; max:longint):longint;cdecl;external;
function TCOD_random_get_float(mersenne:TTCOD_random_t; min:single; max:single):single;cdecl;external;
function TCOD_random_get_double(mersenne:TTCOD_random_t; min:Tdouble; max:Tdouble):Tdouble;cdecl;external;
function TCOD_random_get_int_mean(mersenne:TTCOD_random_t; min:longint; max:longint; mean:longint):longint;cdecl;external;
function TCOD_random_get_float_mean(mersenne:TTCOD_random_t; min:single; max:single; mean:single):single;cdecl;external;
function TCOD_random_get_double_mean(mersenne:TTCOD_random_t; min:Tdouble; max:Tdouble; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function TCOD_random_dice_new(s:Pchar):TTCOD_dice_t;cdecl;external;
function TCOD_random_dice_roll(mersenne:TTCOD_random_t; dice:TTCOD_dice_t):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_random_dice_roll_s(mersenne:TTCOD_random_t; s:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
