{$IFDEF read_interface}


const
  qhDEFset = 1;

const
  SETelemsize: SizeInt = sizeof(TsetelemT);

procedure qh_setaddsorted(qh: PqhT; setp: PPsetT; elem: pointer); cdecl; external libqhull_r;
procedure qh_setaddnth(qh: PqhT; setp: PPsetT; nth: longint; newelem: pointer); cdecl; external libqhull_r;
procedure qh_setappend(qh: PqhT; setp: PPsetT; elem: pointer); cdecl; external libqhull_r;
procedure qh_setappend_set(qh: PqhT; setp: PPsetT; setA: PsetT); cdecl; external libqhull_r;
procedure qh_setappend2ndlast(qh: PqhT; setp: PPsetT; elem: pointer); cdecl; external libqhull_r;
procedure qh_setcheck(qh: PqhT; set_: PsetT; tname: pchar; id: dword); cdecl; external libqhull_r;
procedure qh_setcompact(qh: PqhT; set_: PsetT); cdecl; external libqhull_r;
function qh_setcopy(qh: PqhT; set_: PsetT; extra: longint): PsetT; cdecl; external libqhull_r;
function qh_setdel(set_: PsetT; elem: pointer): pointer; cdecl; external libqhull_r;
function qh_setdellast(set_: PsetT): pointer; cdecl; external libqhull_r;
function qh_setdelnth(qh: PqhT; set_: PsetT; nth: longint): pointer; cdecl; external libqhull_r;
function qh_setdelnthsorted(qh: PqhT; set_: PsetT; nth: longint): pointer; cdecl; external libqhull_r;
function qh_setdelsorted(set_: PsetT; newelem: pointer): pointer; cdecl; external libqhull_r;
function qh_setduplicate(qh: PqhT; set_: PsetT; elemsize: longint): PsetT; cdecl; external libqhull_r;
function qh_setendpointer(set_: PsetT): Ppointer; cdecl; external libqhull_r;
function qh_setequal(setA: PsetT; setB: PsetT): longint; cdecl; external libqhull_r;
function qh_setequal_except(setA: PsetT; skipelemA: pointer; setB: PsetT; skipelemB: pointer): longint; cdecl; external libqhull_r;
function qh_setequal_skip(setA: PsetT; skipA: longint; setB: PsetT; skipB: longint): longint; cdecl; external libqhull_r;
procedure qh_setfree(qh: PqhT; set_: PPsetT); cdecl; external libqhull_r;
procedure qh_setfree2(qh: PqhT; setp: PPsetT; elemsize: longint); cdecl; external libqhull_r;
procedure qh_setfreelong(qh: PqhT; set_: PPsetT); cdecl; external libqhull_r;
function qh_setin(set_: PsetT; setelem: pointer): longint; cdecl; external libqhull_r;
function qh_setindex(set_: PsetT; setelem: pointer): longint; cdecl; external libqhull_r;
procedure qh_setlarger(qh: PqhT; setp: PPsetT); cdecl; external libqhull_r;
function qh_setlarger_quick(qh: PqhT; setsize: longint; newsize: Plongint): longint; cdecl; external libqhull_r;
function qh_setlast(set_: PsetT): pointer; cdecl; external libqhull_r;
function qh_setnew(qh: PqhT; size: longint): PsetT; cdecl; external libqhull_r;
function qh_setnew_delnthsorted(qh: PqhT; set_: PsetT; size: longint; nth: longint; prepend: longint): PsetT; cdecl; external libqhull_r;
procedure qh_setprint(qh: PqhT; fp: PFILE; _string: pchar; set_: PsetT); cdecl; external libqhull_r;
procedure qh_setreplace(qh: PqhT; set_: PsetT; oldelem: pointer; newelem: pointer); cdecl; external libqhull_r;
function qh_setsize(qh: PqhT; set_: PsetT): longint; cdecl; external libqhull_r;
function qh_settemp(qh: PqhT; setsize: longint): PsetT; cdecl; external libqhull_r;
procedure qh_settempfree(qh: PqhT; set_: PPsetT); cdecl; external libqhull_r;
procedure qh_settempfree_all(qh: PqhT); cdecl; external libqhull_r;
function qh_settemppop(qh: PqhT): PsetT; cdecl; external libqhull_r;
procedure qh_settemppush(qh: PqhT; set_: PsetT); cdecl; external libqhull_r;
procedure qh_settruncate(qh: PqhT; set_: PsetT; size: longint); cdecl; external libqhull_r;
function qh_setunique(qh: PqhT; set_: PPsetT; elem: pointer): longint; cdecl; external libqhull_r;
procedure qh_setzero(qh: PqhT; set_: PsetT; idx: longint; size: longint); cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
