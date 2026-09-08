
unit xraylib_parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from xraylib_parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xraylib_parser.h
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
PcompoundData  = ^compoundData;
Pdouble  = ^double;
Plongint  = ^longint;
Pxrl_error  = ^xrl_error;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
Copyright (c) 2010-2016, Tom Schoonjans
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Tom Schoonjans ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Tom Schoonjans BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 }
{$ifndef XRAYLIB_PARSER_H}
{$define XRAYLIB_PARSER_H}
{$include "xraylib-error.h"}
{
 *
 * this header includes the prototype of a function designed to parse
 * chemical formulas and a structure definition which is used to store the information.
 *
  }
{
 * A compoundData structure will be used to store the results after parsing:
 * 	nElements: the number of different atoms present
 * 	nAtomsAll: the total number of atoms present in the compound
 * 	Elements: an array with length nElements that will contain the atomic
 * 	  numbers of the different elements present in the compound,
 * 	  in ascending order.
 *	massFractions: an array with length nElements that will contain
 *	  the atomic mass fractions of the different elements present in the compound,
 *	  in an order corresponding to the Elements array. The sum of the values
 *	  in this array is equal to 1.
 *	nAtoms: an array with nElements that will contain the number of atoms each element
 *	  has in the compound, in an order corresponding to the Elements array.
 *	molarMass: the molar mass of the compound, in g/mol
 *
 * For SiO2 this would yield a structure with contents:
 *  nElements: 2
 *  nAtomsAll: 3
 *  Elements: 8 14
 *  massFractions: 0.467465  0.532535
 *  nAtoms: 2 1
 *  molarMass: 60.09
 *
 *
  }
type
  PcompoundData = ^TcompoundData;
  TcompoundData = record
      nElements : longint;
      nAtomsAll : Tdouble;
      Elements : Plongint;
      massFractions : Pdouble;
      nAtoms : Pdouble;
      molarMass : Tdouble;
    end;

{
 * FreeCompoundData is used to free the memory allocated
 * by CompoundParser in a compoundData struct. It is recommended
 * to set the value of the struct to NULL after calling this function.
  }

procedure FreeCompoundData(para1:PcompoundData);cdecl;external;
{
 * The CompoundParser function will parse a string and will return
 * a pointer to a compoundData structure if successful, otherwise it will return a
 * NULL pointer. After usage, the struct can be freed with FreeCompoundData
  }
(* Const before type ignored *)
function CompoundParser(compoundString:Pchar; error:PPxrl_error):PcompoundData;cdecl;external;
{
 * The add_compound_data function will make calculate the composition
 * corresponding to the sum of the compositions of A and B, taking into
 * their weights, with weightA + weightB typically less than 1.0
 * Returns NULL pointer on error
  }
function add_compound_data(A:TcompoundData; weightA:Tdouble; B:TcompoundData; weightB:Tdouble):PcompoundData;cdecl;external;
{
 * The AtomicNumberToSymbol function returns a pointer to a string containing the element symbol.
 * If an error occurred, the NULL string is returned.
 * The string should be freed after usage with the xrlFree function
  }
function AtomicNumberToSymbol(Z:longint; error:PPxrl_error):Pchar;cdecl;external;
{
 * The SymbolToAtomicNumber function returns the atomic number that corresponds with element symbol
 * If the element does not exist, 0 is returned
  }
(* Const before type ignored *)
function SymbolToAtomicNumber(symbol:Pchar; error:PPxrl_error):longint;cdecl;external;
{
 *  xrlFree frees memory that was dynamically allocated by xraylib. For now it should only be used
 *  in combination with AtomicNumberToSymbol and add_compound_data
  }
procedure xrlFree(para1:pointer);cdecl;external;
{$endif}

implementation


end.
