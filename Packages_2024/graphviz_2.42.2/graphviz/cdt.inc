{$IFDEF read_interface}


type
  PDtlink_t = type Pointer;
  PDthold_t = type Pointer;
  PDtdisc_t = type Pointer;
  PDtmethod_t = type Pointer;
  PDtdata_t = type Pointer;
  PDt_t = type Pointer;
  PDict_t = type Pointer;
  PDtstat_t = type Pointer;

  TDtmemory_f = function(para1: PDt_t; para2: pointer; para3: Tsize_t; para4: PDtdisc_t): pointer; cdecl;
  TDtsearch_f = function(para1: PDt_t; para2: pointer; para3: longint): pointer; cdecl;
  TDtmake_f = function(para1: PDt_t; para2: pointer; para3: PDtdisc_t): pointer; cdecl;
  TDtfree_f = procedure(para1: PDt_t; para2: pointer; para3: PDtdisc_t); cdecl;
  TDtcompar_f = function(para1: PDt_t; para2: pointer; para3: pointer; para4: PDtdisc_t): longint; cdecl;
  TDthash_f = function(para1: PDt_t; para2: pointer; para3: PDtdisc_t): dword; cdecl;
  TDtevent_f = function(para1: PDt_t; para2: longint; para3: pointer; para4: PDtdisc_t): longint; cdecl;

const
  DT_FOUND = 0100000;
  DT_SET = 0000001;
  DT_BAG = 0000002;
  DT_OSET = 0000004;
  DT_OBAG = 0000010;
  DT_LIST = 0000020;
  DT_STACK = 0000040;
  DT_QUEUE = 0000100;
  DT_DEQUE = 0000200;
  DT_METHODS = 0000377;
  DT_SAMECMP = 0000001;
  DT_SAMEHASH = 0000002;
  DT_INSERT = 0000001;
  DT_DELETE = 0000002;
  DT_SEARCH = 0000004;
  DT_NEXT = 0000010;
  DT_PREV = 0000020;
  DT_RENEW = 0000040;
  DT_CLEAR = 0000100;
  DT_FIRST = 0000200;
  DT_LAST = 0000400;
  DT_MATCH = 0001000;
  DT_VSEARCH = 0002000;
  DT_ATTACH = 0004000;
  DT_DETACH = 0010000;
  DT_APPEND = 0020000;
  DT_OPEN = 1;
  DT_CLOSE = 2;
  DT_DISC = 3;
  DT_METH = 4;
  DT_ENDOPEN = 5;
  DT_ENDCLOSE = 6;
  DT_HASHSIZE = 7;

var
  Dtset: PDtmethod_t; cvar;external libcdt;
  Dtbag: PDtmethod_t; cvar;external libcdt;
  Dtoset: PDtmethod_t; cvar;external libcdt;
  Dtobag: PDtmethod_t; cvar;external libcdt;
  Dtlist: PDtmethod_t; cvar;external libcdt;
  Dtstack: PDtmethod_t; cvar;external libcdt;
  Dtqueue: PDtmethod_t; cvar;external libcdt;
  Dtdeque: PDtmethod_t; cvar;external libcdt;
  Dtorder: PDtmethod_t; cvar;external libcdt;
  Dttree: PDtmethod_t; cvar;external libcdt;
  Dthash: PDtmethod_t; cvar;external libcdt;

function dtopen(para1: PDtdisc_t; para2: PDtmethod_t): PDt_t; cdecl; external libcdt;
function dtclose(para1: PDt_t): longint; cdecl; external libcdt;
function dtview(para1: PDt_t; para2: PDt_t): PDt_t; cdecl; external libcdt;
function dtdisc(dt: PDt_t; para2: PDtdisc_t; para3: longint): PDtdisc_t; cdecl; external libcdt;
function dtmethod(para1: PDt_t; para2: PDtmethod_t): PDtmethod_t; cdecl; external libcdt;
function dtflatten(para1: PDt_t): PDtlink_t; cdecl; external libcdt;
function dtextract(para1: PDt_t): PDtlink_t; cdecl; external libcdt;
function dtrestore(para1: PDt_t; para2: PDtlink_t): longint; cdecl; external libcdt;

type
  dtwalk_func = function(para1: PDt_t; para2: pointer; para3: pointer): longint; cdecl;

function dtwalk(para1: PDt_t; para2: dtwalk_func; para3: pointer): longint; cdecl; external libcdt;
function dtrenew(para1: PDt_t; para2: pointer): pointer; cdecl; external libcdt;
function dtsize(para1: PDt_t): longint; cdecl; external libcdt;
function dtstat(para1: PDt_t; para2: PDtstat_t; para3: longint): longint; cdecl; external libcdt;
function dtstrhash(para1: dword; para2: pointer; para3: longint): dword; cdecl; external libcdt;

// === Konventiert am: 3-12-25 15:08:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
