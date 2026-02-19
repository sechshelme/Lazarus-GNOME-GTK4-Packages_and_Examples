unit stat;

interface

uses
  fp_qhull, libqhull, user;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qhDEFstat = 1;
  qh_KEEPstatistics = 1;

type
  Tztypes = longint;

const
  zdoc = 0;
  zinc = 1;
  zadd = 2;
  zmax = 3;
  zmin = 4;
  ZTYPEreal = 5;
  wadd = 6;
  wmax = 7;
  wmin = 8;
  ZTYPEend = 9;

type
  TintrealT = record
    case longint of
      0: (i: longint);
      1: (r: TrealT);
  end;
  PintrealT = ^TintrealT;

type
  PqhstatT = type Pointer;

procedure qh_allstatA; cdecl; external libqhull;
procedure qh_allstatB; cdecl; external libqhull;
procedure qh_allstatC; cdecl; external libqhull;
procedure qh_allstatD; cdecl; external libqhull;
procedure qh_allstatE; cdecl; external libqhull;
procedure qh_allstatE2; cdecl; external libqhull;
procedure qh_allstatF; cdecl; external libqhull;
procedure qh_allstatG; cdecl; external libqhull;
procedure qh_allstatH; cdecl; external libqhull;
procedure qh_allstatI; cdecl; external libqhull;
procedure qh_allstatistics; cdecl; external libqhull;
procedure qh_collectstatistics; cdecl; external libqhull;
procedure qh_freestatistics; cdecl; external libqhull;
procedure qh_initstatistics; cdecl; external libqhull;
function qh_newstats(idx: longint; nextindex: Plongint): TboolT; cdecl; external libqhull;
function qh_nostatistic(i: longint): TboolT; cdecl; external libqhull;
procedure qh_printallstatistics(fp: PFILE; _string: pchar); cdecl; external libqhull;
procedure qh_printstatistics(fp: PFILE; _string: pchar); cdecl; external libqhull;
procedure qh_printstatlevel(fp: PFILE; id: longint); cdecl; external libqhull;
procedure qh_printstats(fp: PFILE; idx: longint; nextindex: Plongint); cdecl; external libqhull;
function qh_stddev(num: longint; tot: TrealT; tot2: TrealT; ave: PrealT): TrealT; cdecl; external libqhull;

// === Konventiert am: 18-2-26 16:48:01 ===


implementation



end.
