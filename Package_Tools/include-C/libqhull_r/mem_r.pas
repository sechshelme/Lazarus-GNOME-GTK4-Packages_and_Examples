unit mem_r;

interface

uses
  fp_qhull_r, libqhull_r_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  qhDEFmem = 1;
  DEFsetT = 1;
  DEFqhT = 1;
  qhmem_ERRmem = 4;
  qhmem_ERRqhull = 5;

type
  Pptr_intT = ^Tptr_intT;
  Tptr_intT = int64;

function qh_memalloc(qh: PqhT; insize: longint): pointer; cdecl; external libqhull_r;
procedure qh_memcheck(qh: PqhT); cdecl; external libqhull_r;
procedure qh_memfree(qh: PqhT; obj: pointer; insize: longint); cdecl; external libqhull_r;
procedure qh_memfreeshort(qh: PqhT; curlong: Plongint; totlong: Plongint); cdecl; external libqhull_r;
procedure qh_meminit(qh: PqhT; ferr: PFILE); cdecl; external libqhull_r;
procedure qh_meminitbuffers(qh: PqhT; tracelevel: longint; alignment: longint; numsizes: longint; bufsize: longint;
  bufinit: longint); cdecl; external libqhull_r;
procedure qh_memsetup(qh: PqhT); cdecl; external libqhull_r;
procedure qh_memsize(qh: PqhT; size: longint); cdecl; external libqhull_r;
procedure qh_memstatistics(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_memtotal(qh: PqhT; totlong: Plongint; curlong: Plongint; totshort: Plongint; curshort: Plongint;
  maxlong: Plongint; totbuffer: Plongint); cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:22 ===


implementation



end.
