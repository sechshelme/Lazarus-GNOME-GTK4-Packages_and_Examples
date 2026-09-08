
unit xraylib_defs;
interface

{
  Automatically converted by H2Pas 1.0.0 from xraylib_defs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xraylib_defs.h
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
PCrystal_Array  = ^Crystal_Array;
PCrystal_Atom  = ^Crystal_Atom;
PCrystal_Struct  = ^Crystal_Struct;
PxrlComplex  = ^xrlComplex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
Copyright (c) 2011, 2012  David Sagan and Tom Schoonjans
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY David Sagan, Bruno Golosio, Antonio Brunetti, Manuel Sanchez del Rio, Tom Schoonjans and Teemu Ikonen ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANYONE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 }
{$ifndef XRAYLIB_DEFS_H}
{$define XRAYLIB_DEFS_H}

const
  ZMAX = 120;  
  MENDEL_MAX = 107;  
  CRYSTALARRAY_MAX = 512;  
  MAXFILENAMESIZE = 1000;  
  SHELLNUM = 28;  
  SHELLNUM_K = 31;  
  SHELLNUM_C = 29;  
  LINENUM = 383;  
  TRANSNUM = 15;  
  AUGERNUM = 996;  
  SHELLNUM_A = 9;  
{ Delta for size increase of Crystal_Array.crystal array  }
  N_NEW_CRYSTAL = 10;  
{ Structs  }
{ Complex number  }
{ Real part  }
{ Imaginary part  }
type
  PxrlComplex = ^TxrlComplex;
  TxrlComplex = record
      re : Tdouble;
      im : Tdouble;
    end;
{$ifndef c_abs}
{ this is giving a lot of trouble with python  }

function c_abs(x:TxrlComplex):Tdouble;cdecl;external;
{$endif}

function c_mul(x:TxrlComplex; y:TxrlComplex):TxrlComplex;cdecl;external;
{ Struct for an atom in a crystal.  }
{ Atomic number of atom.  }
{ Fractional contribution. Normally 1.0.  }
{ Atom position in fractions of the unit cell lengths.  }
type
  PCrystal_Atom = ^TCrystal_Atom;
  TCrystal_Atom = record
      Zatom : longint;
      fraction : Tdouble;
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;
{ Struct for a crystal.  }
{ Name of crystal.  }
{ Unit cell size in Angstroms.  }
{ Unit cell angles in degrees.  }
{ Unit cell volume in Angstroms^3.  }
{ Number of atoms.  }
{ Array of atoms in unit cell.  }

  PCrystal_Struct = ^TCrystal_Struct;
  TCrystal_Struct = record
      name : Pchar;
      a : Tdouble;
      b : Tdouble;
      c : Tdouble;
      alpha : Tdouble;
      beta : Tdouble;
      gamma : Tdouble;
      volume : Tdouble;
      n_atom : longint;
      atom : PCrystal_Atom;
    end;
{ Container struct to hold an array of CrystalStructs  }
{ Number of defined crystals.  }
{ Size of .crystal array malloc'd  }

  PCrystal_Array = ^TCrystal_Array;
  TCrystal_Array = record
      n_crystal : longint;
      n_alloc : longint;
      crystal : PCrystal_Struct;
    end;
{$endif}

implementation


end.
