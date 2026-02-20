unit qhull_ra;

interface

uses
  fp_qhull_r, libqhull_r_, user_r;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qhDEFqhulla = 1;

procedure qh_qhull(qh: PqhT); cdecl; external libqhull_r;
function qh_addpoint(qh: PqhT; furthest: PpointT; facet: PfacetT; checkdist: TboolT): TboolT; cdecl; external libqhull_r;
procedure qh_build_withrestart(qh: PqhT); cdecl; external libqhull_r;
function qh_buildcone(qh: PqhT; furthest: PpointT; facet: PfacetT; goodhorizon: longint; retryfacet: PPfacetT): PvertexT; cdecl; external libqhull_r;
function qh_buildcone_mergepinched(qh: PqhT; apex: PvertexT; facet: PfacetT; retryfacet: PPfacetT): TboolT; cdecl; external libqhull_r;
function qh_buildcone_onlygood(qh: PqhT; apex: PvertexT; goodhorizon: longint): TboolT; cdecl; external libqhull_r;
procedure qh_buildhull(qh: PqhT); cdecl; external libqhull_r;
procedure qh_buildtracing(qh: PqhT; furthest: PpointT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_errexit2(qh: PqhT; exitcode: longint; facet: PfacetT; otherfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_findhorizon(qh: PqhT; point: PpointT; facet: PfacetT; goodvisible: Plongint; goodhorizon: Plongint); cdecl; external libqhull_r;
function qh_nextfurthest(qh: PqhT; visible: PPfacetT): PpointT; cdecl; external libqhull_r;
procedure qh_partitionall(qh: PqhT; vertices: PsetT; points: PpointT; npoints: longint); cdecl; external libqhull_r;
procedure qh_partitioncoplanar(qh: PqhT; point: PpointT; facet: PfacetT; dist: PrealT; allnew: TboolT); cdecl; external libqhull_r;
procedure qh_partitionpoint(qh: PqhT; point: PpointT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_partitionvisible(qh: PqhT; allpoints: TboolT; numpoints: Plongint); cdecl; external libqhull_r;
procedure qh_joggle_restart(qh: PqhT; reason: pchar); cdecl; external libqhull_r;
procedure qh_printsummary(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;

procedure qh_appendprint(qh: PqhT; format: Tqh_PRINT); cdecl; external libqhull_r;
procedure qh_freebuild(qh: PqhT; allmem: TboolT); cdecl; external libqhull_r;
procedure qh_freebuffers(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initbuffers(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;

procedure qh_allstatA(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatB(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatC(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatD(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatE(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatE2(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatF(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatG(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatH(qh: PqhT); cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:14 ===


implementation



end.
