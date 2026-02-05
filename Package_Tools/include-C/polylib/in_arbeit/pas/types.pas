unit types;

interface

uses
  fp_polylib64, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MAXNOOFRAYS = 200;

const
  LB_INFINITY = 1;
  UB_INFINITY = 2;

function MSB: dword;
function TOP: longint;

var
  Pol_status : longint;cvar;external libpolylib;

type
  TVector = record
    Size: dword;
    p: PValue;
  end;
  PVector = ^TVector;

  Tmatrix = record
    NbRows: dword;
    NbColumns: dword;
    p: ^PValue;
    p_Init: PValue;
    p_Init_size: longint;
  end;
  Pmatrix = ^Tmatrix;

  Ppolyhedron = ^Tpolyhedron;

  Tpolyhedron = record
    Dimension: dword;
    NbConstraints: dword;
    NbRays: dword;
    NbEq: dword;
    NbBid: dword;
    Constraint: ^PValue;
    Ray: ^PValue;
    p_Init: PValue;
    p_Init_size: longint;
    next: Ppolyhedron;
    flags: dword;
  end;

const
  POL_INEQUALITIES = $00000001;
  POL_FACETS = $00000002;
  POL_POINTS = $00000004;
  POL_VERTICES = $00000008;
  POL_VALID = $00000010;

type
  Tinterval = record
    MaxN: TValue;
    MaxD: TValue;
    MinN: TValue;
    MinD: TValue;
    MaxI: longint;
    MinI: longint;
  end;
  Pinterval = ^Tinterval;

  PParam_Vertex = ^TParam_Vertex;

  TParam_Vertex = record
    Vertex: PMatrix;
    Domain: PMatrix;
    Facets: Pdword;
    next: PParam_Vertex;
  end;

  TParam_Vertices = TParam_Vertex;
  PParam_Vertices = ^TParam_Vertices;

  PParam_Domain = ^TParam_Domain;

  TParam_Domain = record
    F: Pdword;
    Domain: PPolyhedron;
    next: PParam_Domain;
  end;

  TParam_Polyhedron = record
    nbV: longint;
    V: PParam_Vertices;
    D: PParam_Domain;
    Constraints: PMatrix;
    Rays: PMatrix;
  end;
  PParam_Polyhedron = ^TParam_Polyhedron;

type
  Penode_type = ^Tenode_type;
  Tenode_type = longint;

const
  polynomial = 0;
  periodic = 1;
  evector = 2;

type
  Penode = ^Tenode;

  Tevalue = record
    d: TValue;
    x: record
      case longint of
        0: (n: TValue);
        1: (p: Penode);
      end;
  end;
  Pevalue = ^Tevalue;

  Tenode = record
    _type: Tenode_type;
    size: longint;
    pos: longint;
    arr: array[0..0] of Tevalue;
  end;

  Penumeration = ^Tenumeration;

  Tenumeration = record
    ValidityDomain: PPolyhedron;
    EP: Tevalue;
    next: Penumeration;
  end;

  PBool = ^TBool;
  TBool = Boolean32;

type
  PLattice = ^TLattice;
  TLattice = TMatrix;

  PLatticeUnion = ^TLatticeUnion;

  TLatticeUnion = record
    M: PLattice;
    next: PLatticeUnion;
  end;

  PZPolyhedron = ^TZPolyhedron;

  TZPolyhedron = record
    Lat: PLattice;
    P: PPolyhedron;
    next: PZPolyhedron;
  end;

  // === Konventiert am: 5-2-26 19:36:24 ===


implementation


function MSB: dword;
begin
  MSB := dword((dword(1)) shl (((sizeof(longint)) * 8) - 1));
end;

function TOP: longint;
begin
  TOP := longint(MSB - 1);
end;


end.
