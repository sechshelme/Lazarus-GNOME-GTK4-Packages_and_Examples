
unit namegen;
interface

{
  Automatically converted by H2Pas 1.0.0 from namegen.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    namegen.h
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
PTCOD_NameGen  = ^TCOD_NameGen;
PTCOD_namegen_t  = ^TCOD_namegen_t;
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
{
 * Mingos' NameGen
 * This file was written by Dominik "Mingos" Marczuk.
  }
{$ifndef _TCOD_NAMEGEN_H}
{$define _TCOD_NAMEGEN_H}
{$include "list.h"}
{$include "mersenne.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
{ the generator typedef  }
type
  PTCOD_NameGen = ^TTCOD_NameGen;
  TTCOD_NameGen = record
      {undefined structure}
    end;


  PTCOD_namegen_t = ^TTCOD_namegen_t;
  TTCOD_namegen_t = PTCOD_NameGen;
{ parse a file with syllable sets  }
(* Const before type ignored *)

procedure TCOD_namegen_parse(filename:Pchar; random:TTCOD_random_t);cdecl;external;
{ generate a name  }
(* Const before type ignored *)
function TCOD_namegen_generate(name:Pchar; allocate:Tbool):Pchar;cdecl;external;
{ generate a name using a custom generation rule  }
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_namegen_generate_custom(name:Pchar; rule:Pchar; allocate:Tbool):Pchar;cdecl;external;
{ retrieve the list of all available syllable set names  }
function TCOD_namegen_get_sets:TTCOD_list_t;cdecl;external;
{ delete a generator  }
procedure TCOD_namegen_destroy;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
