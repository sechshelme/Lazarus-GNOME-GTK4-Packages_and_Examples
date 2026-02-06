unit polyparam;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure Compute_PDomains(PD: PParam_Domain; nb_domains: longint; working_space: longint); cdecl; external libpolylib;
function GenParamPolyhedron(Pol: PPolyhedron; Rays: PMatrix): PParam_Polyhedron; cdecl; external libpolylib;
procedure Param_Domain_Free(PD: PParam_Domain); cdecl; external libpolylib;
procedure Param_Polyhedron_Free(P: PParam_Polyhedron); cdecl; external libpolylib;
procedure Param_Vertices_Free(PV: PParam_Vertices); cdecl; external libpolylib;
procedure Param_Vertices_Print(DST: PFILE; PV: PParam_Vertices; param_names: PPchar); cdecl; external libpolylib;
function PDomainDifference(Pol1: PPolyhedron; Pol2: PPolyhedron; NbMaxRays: dword): PPolyhedron; cdecl; external libpolylib;
function PDomainIntersection(Pol1: PPolyhedron; Pol2: PPolyhedron; NbMaxRays: dword): PPolyhedron; cdecl; external libpolylib;
function Polyhedron2Param_Domain(Din: PPolyhedron; Cin: PPolyhedron; working_space: longint): PParam_Polyhedron; cdecl; external libpolylib;
function Polyhedron2Param_SimplifiedDomain(Din: PPPolyhedron; Cin: PPolyhedron; working_space: longint; CEq: PPPolyhedron; CT: PPMatrix): PParam_Polyhedron; cdecl; external libpolylib;
function Polyhedron2Param_Vertices(Din: PPolyhedron; Cin: PPolyhedron; working_space: longint): PParam_Polyhedron; cdecl; external libpolylib;
procedure Print_Domain(DST: PFILE; D: PPolyhedron; param_names: PPchar); cdecl; external libpolylib;
procedure Print_Vertex(DST: PFILE; V: PMatrix; param_names: PPchar); cdecl; external libpolylib;
function VertexCT(V: PMatrix; CT: PMatrix): PMatrix; cdecl; external libpolylib;
procedure Param_Polyhedron_Scale_Integer(PP: PParam_Polyhedron; P: PPPolyhedron; det: PValue; MaxRays: dword); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:17 ===


implementation



end.
