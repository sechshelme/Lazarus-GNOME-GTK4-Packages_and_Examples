unit ehrhart;

interface

uses
  fp_polylib64, types, arithmetique;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


var
  overflow_warning_flag : longint;cvar;external libpolylib;

procedure count_points(pos: longint; P: PPolyhedron; context: PValue; res: PValue); cdecl; external libpolylib;
procedure eadd(e1: Pevalue; res: Pevalue); cdecl; external libpolylib;
function ecopy(e: Penode): Penode; cdecl; external libpolylib;
procedure edot(v1: Penode; v2: Penode; res: Pevalue); cdecl; external libpolylib;
function new_enode(_type: Tenode_type; size: longint; pos: longint): Penode; cdecl; external libpolylib;
procedure free_evalue_refs(e: Pevalue); cdecl; external libpolylib;
function Polyhedron_Enumerate(P: PPolyhedron; C: PPolyhedron; MAXRAYS: dword; pname: PPchar): PEnumeration; cdecl; external libpolylib;
procedure print_enode(DST: PFILE; p: Penode; pname: PPchar); cdecl; external libpolylib;
procedure print_evalue(DST: PFILE; e: Pevalue; pname: PPchar); cdecl; external libpolylib;
procedure reduce_evalue(e: Pevalue); cdecl; external libpolylib;
procedure Enumeration_Free(en: PEnumeration); cdecl; external libpolylib;
function Ehrhart_Quick_Apx(M: PMatrix; C: PMatrix; Validity_Lattice: PPMatrix; MAXRAYS: dword): PEnumeration; cdecl; external libpolylib;
function Enumeration_zero(nbParms: dword; maxRays: dword): PEnumeration; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:47 ===


implementation



end.
