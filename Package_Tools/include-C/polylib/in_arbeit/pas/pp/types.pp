
unit types;
interface

{
  Automatically converted by H2Pas 1.0.0 from types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    types.h
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
PBool  = ^Bool;
Pdword  = ^dword;
Penode  = ^enode;
Penode_type  = ^enode_type;
Penumeration  = ^enumeration;
Pevalue  = ^evalue;
Pinterval  = ^interval;
PLattice  = ^Lattice;
PLatticeUnion  = ^LatticeUnion;
Pmatrix  = ^matrix;
PParam_Domain  = ^Param_Domain;
PParam_Polyhedron  = ^Param_Polyhedron;
PParam_Vertex  = ^Param_Vertex;
PParam_Vertices  = ^Param_Vertices;
Ppolyhedron  = ^polyhedron;
PValue  = ^Value;
PVector  = ^Vector;
PZPolyhedron  = ^ZPolyhedron;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    This file is part of PolyLib.

    PolyLib is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PolyLib is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with PolyLib.  If not, see <http://www.gnu.org/licenses/>.
 }
{ types-polylib.h
     COPYRIGHT
          Both this software and its documentation are

              Copyright 1993, IRISA /Universite de Rennes I - France
              Copyright 1996,1997,1998, Doran Wilde and Vincent Loechner
              All rights reserved.

          Permission is granted to copy, use, and distribute
          for any commercial or noncommercial purpose under the terms
          of the GNU General Public license, version 2, June 1991
          (see file : LICENSING).
 }
{$ifndef _types_polylib_h_}
{$define _types_polylib_h_}
{$ifdef GNUMP}
{$include<gmp.h>}
{$endif}
{$include <limits.h>}
{********************** USER DEFINES ***************************** }
{ first parameter name char.   }

const
  FIRST_PARAMETER_NAME = 'P';  
{****************** END OF USER DEFINES ************************** }
  PCHAR = FIRST_PARAMETER_NAME-1;  
  MAXNOOFRAYS = 200;  
{$if defined(LINEAR_VALUE_IS_LONGLONG)}

const
  P_VALUE_FMT = '%4lld ';  
(*** was #elif ****){$else defined(LINEAR_VALUE_IS_LONG)}

const
  P_VALUE_FMT = '%4ld ';  
(*** was #elif ****){$else defined(LINEAR_VALUE_IS_CHARS)}

const
  P_VALUE_FMT = '%s ';  
(*** was #elif ****){$else defined(LINEAR_VALUE_IS_INT) }

const
  P_VALUE_FMT = '%4d ';  
{$else}
{ GNUMP  }

const
  P_VALUE_FMT = '%4s ';  
{$endif}
{ Used in lower_upper_bounds  }

const
  LB_INFINITY = 1;  
  UB_INFINITY = 2;  
{ MSB, TOP, and NEXT are defined over integer type, not on value type  }
{ Put a one in the most significant bit of an int (portable)  }

{ was #define dname def_expr }
function MSB : dword;  

{ Largest representable positive number  }
{ was #define dname def_expr }
function TOP : longint;  

{ Right shift the one bit in b and increment j if the last bit in b is one  }
{ Status of last Polyhedron operation  }
  var
    Pol_status : longint;cvar;external;
type
  PVector = ^TVector;
  TVector = record
      Size : dword;
      p : PValue;
    end;
{ needed to free the memory allocated by mpz_init  }

  Pmatrix = ^Tmatrix;
  Tmatrix = record
      NbRows : dword;
      NbColumns : dword;
      p : ^PValue;
      p_Init : PValue;
      p_Init_size : longint;
    end;

  Ppolyhedron = ^Tpolyhedron;
  Tpolyhedron = record
      Dimension : dword;
      NbConstraints : dword;
      NbRays : dword;
      NbEq : dword;
      NbBid : dword;
      Constraint : ^PValue;
      Ray : ^PValue;
      p_Init : PValue;
      p_Init_size : longint;
      next : Ppolyhedron;
      flags : dword;
    end;

const
  POL_INEQUALITIES = $00000001;  
  POL_FACETS = $00000002;  
  POL_POINTS = $00000004;  
  POL_VERTICES = $00000008;  
{ The flags field contains "valid" information,
 * i.e., the structure was created by PolyLib.
  }
  POL_VALID = $00000010;  
type
  Pinterval = ^Tinterval;
  Tinterval = record
      MaxN : TValue;
      MaxD : TValue;
      MinN : TValue;
      MinD : TValue;
      MaxI : longint;
      MinI : longint;
    end;
{ Each row is a coordinate of the vertex. The first   }
{ "m" values of each row are the coefficients of the  }
{ parameters. The (m+1)th value is the constant, the  }
{ The (m+2)th value is the common denominator.        }
{ Constraints on parameters (in Polyhedral format)    }
{ Bit array of facets defining the vertex.		 }
{ Pointer to the next structure  }

  PParam_Vertex = ^TParam_Vertex;
  TParam_Vertex = record
      Vertex : PMatrix;
      Domain : PMatrix;
      Facets : Pdword;
      next : PParam_Vertex;
    end;
  TParam_Vertices = TParam_Vertex;
  PParam_Vertices = ^TParam_Vertices;
{ Bit array of faces  }
{ Pointer to Domain (constraints on parameters)  }
{ Pointer to the next structure   }

  PParam_Domain = ^TParam_Domain;
  TParam_Domain = record
      F : Pdword;
      Domain : PPolyhedron;
      next : PParam_Domain;
    end;
{ Number of parameterized vertices             }
{ Pointer to the list of parameteric vertices  }
{ Pointer to the list of validity domains      }
{ Constraints referred to by V->Facets	    }
{ Lines/rays (non parametric)                  }

  PParam_Polyhedron = ^TParam_Polyhedron;
  TParam_Polyhedron = record
      nbV : longint;
      V : PParam_Vertices;
      D : PParam_Domain;
      Constraints : PMatrix;
      Rays : PMatrix;
    end;
{ Data structures for pseudo-polynomial  }

  Penode_type = ^Tenode_type;
  Tenode_type =  Longint;
  Const
    polynomial = 0;
    periodic = 1;
    evector = 2;
;
{ denominator  }
{ numerator (if denominator != 0)  }
{ pointer   (if denominator == 0)  }
type
  Pevalue = ^Tevalue;
  Tevalue = record
      d : TValue;
      x : record
          case longint of
            0 : ( n : TValue );
            1 : ( p : Penode );
          end;
    end;
{ polynomial or periodic or evector  }
{ number of attached pointers  }
{ parameter position  }
{ array of rational/pointer  }

  Penode = ^Tenode;
  Tenode = record
      _type : Tenode_type;
      size : longint;
      pos : longint;
      arr : array[0..0] of Tevalue;
    end;
{ contraints on the parameters      }
{ dimension = combined space        }
{ Ehrhart Polynomial, corresponding
	                            to parameter values inside the
                                    domain ValidityDomain below       }

  Penumeration = ^Tenumeration;
  Tenumeration = record
      ValidityDomain : PPolyhedron;
      EP : Tevalue;
      next : Penumeration;
    end;
{-----------------------------Example Usage------------------------------ }
{ enode *e                                                                }
{     e->type = polynomial     e->type = periodic   e->type = evector     }
{     e->size = degree+1       e->size = period     e->size = length      }
{     e->pos  = [1..nb_param]                                             }
{     e->arr[i].d = denominator (Value)                                   }
{     e->arr[i].x.p = pointer to another enode (if denominator is zero)   }
{     e->arr[i].x.n = numerator (Value) (if denominator is non-zero)      }
{------------------------------------------------------------------------ }
{------------------------------------------------------------------------ }
{ This representation has the following advantages:                       }
{   -- its dynamic, it can grow/shrink easily                             }
{   -- it is easy to evaluate for a given context (values of parameters)  }
{   -- it allows pseudo-polynomial to be reduced with rules               }
{   -- it can be constructed recursively                                  }
{------------------------------------------------------------------------ }
{ *********************** |Represnting Z-Polyhedron| *******************  }

  PBool = ^TBool;
  TBool =  Longint;
  Const
    False = 0;
    True = 1;
;
type
  PLattice = ^TLattice;
  TLattice = TMatrix;

  PLatticeUnion = ^TLatticeUnion;
  TLatticeUnion = record
      M : PLattice;
      next : PLatticeUnion;
    end;

  PZPolyhedron = ^TZPolyhedron;
  TZPolyhedron = record
      Lat : PLattice;
      P : PPolyhedron;
      next : PZPolyhedron;
    end;
{$endif}
{ _types_polylib_h_  }

implementation

{ was #define dname def_expr }
function MSB : dword;
  begin
    MSB:=dword((dword(1)) shl (((sizeof(longint))*8)-1));
  end;

{ was #define dname def_expr }
function TOP : longint;
  begin
    TOP:=longint(MSB-1);
  end;


end.
