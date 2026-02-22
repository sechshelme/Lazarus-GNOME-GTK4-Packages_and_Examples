{$IFDEF read_interface}


const
  qhDEFstat = 1;
  DEFqhstatT = 1;

procedure qh_allstatA(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatB(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatC(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatD(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatE(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatE2(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatF(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatG(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatH(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatI(qh: PqhT); cdecl; external libqhull_r;
procedure qh_allstatistics(qh: PqhT); cdecl; external libqhull_r;
procedure qh_collectstatistics(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initstatistics(qh: PqhT); cdecl; external libqhull_r;
function qh_newstats(qh: PqhT; idx: longint; nextindex: Plongint): TboolT; cdecl; external libqhull_r;
function qh_nostatistic(qh: PqhT; i: longint): TboolT; cdecl; external libqhull_r;
procedure qh_printallstatistics(qh: PqhT; fp: PFILE; _string: pchar); cdecl; external libqhull_r;
procedure qh_printstatistics(qh: PqhT; fp: PFILE; _string: pchar); cdecl; external libqhull_r;
procedure qh_printstatlevel(qh: PqhT; fp: PFILE; id: longint); cdecl; external libqhull_r;
procedure qh_printstats(qh: PqhT; fp: PFILE; idx: longint; nextindex: Plongint); cdecl; external libqhull_r;
function qh_stddev(qh: PqhT; num: longint; tot: TrealT; tot2: TrealT; ave: PrealT): TrealT; cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
