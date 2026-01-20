  {$IFDEF read_interface}


type
  PIDTYPE = ^TIDTYPE;
  TIDTYPE = uint64;

  PAgtag_t = type Pointer;
  PAgobj_t = type Pointer;
  PAgraph_t = type Pointer;
  PPAgraph_t = ^PAgraph_t;
  PAgnode_t = type Pointer;
  PAgedge_t = type Pointer;
  TAgdesc_t = byte;
  PAgdesc_t = ^TAgdesc_t;
  PAgmemdisc_t = type Pointer;
  PAgiddisc_t = type Pointer;
  PAgiodisc_t = type Pointer;
  PAgdisc_t = type Pointer;
  PAgdstate_t = type Pointer;
  PAgsym_t = type Pointer;
  PAgattr_t = type Pointer;
  PAgcbdisc_t = type Pointer;
  PAgcbstack_t = type Pointer;
  PAgclos_t = type Pointer;
  PAgrec_t = type Pointer;
  PAgdatadict_t = type Pointer;
  PAgedgepair_t = type Pointer;
  PAgsubnode_t = type Pointer;

const
  AGRAPH = 0;
  AGNODE_ = 1;
  AGOUTEDGE = 2;
  AGINEDGE = 3;
  AGEDGE_ = AGOUTEDGE;

type
  Tagobjfn_t = procedure(g: PAgraph_t; obj: PAgobj_t; arg: pointer); cdecl;
  Tagobjupdfn_t = procedure(g: PAgraph_t; obj: PAgobj_t; arg: pointer; sym: PAgsym_t); cdecl;

procedure agpushdisc(g: PAgraph_t; disc: PAgcbdisc_t; state: pointer); cdecl; external libcgraph;
function agpopdisc(g: PAgraph_t; disc: PAgcbdisc_t): longint; cdecl; external libcgraph;
function agcallbacks(g: PAgraph_t; flag: longint): longint; cdecl; external libcgraph;
function agopen(name: pchar; desc: TAgdesc_t; disc: PAgdisc_t): PAgraph_t; cdecl; external libcgraph;
function agclose(g: PAgraph_t): longint; cdecl; external libcgraph;
function agread(chan: pointer; disc: PAgdisc_t): PAgraph_t; cdecl; external libcgraph;
function agmemread(cp: pchar): PAgraph_t; cdecl; external libcgraph;
procedure agreadline(para1: longint); cdecl; external libcgraph;
procedure agsetfile(para1: pchar); cdecl; external libcgraph;
function agconcat(g: PAgraph_t; chan: pointer; disc: PAgdisc_t): PAgraph_t; cdecl; external libcgraph;
function agwrite(g: PAgraph_t; chan: pointer): longint; cdecl; external libcgraph;
function agisdirected(g: PAgraph_t): longint; cdecl; external libcgraph;
function agisundirected(g: PAgraph_t): longint; cdecl; external libcgraph;
function agisstrict(g: PAgraph_t): longint; cdecl; external libcgraph;
function agissimple(g: PAgraph_t): longint; cdecl; external libcgraph;
function agnode(g: PAgraph_t; name: pchar; createflag: longint): PAgnode_t; cdecl; external libcgraph;
function agidnode(g: PAgraph_t; id: TIDTYPE; createflag: longint): PAgnode_t; cdecl; external libcgraph;
function agsubnode(g: PAgraph_t; n: PAgnode_t; createflag: longint): PAgnode_t; cdecl; external libcgraph;
function agfstnode(g: PAgraph_t): PAgnode_t; cdecl; external libcgraph;
function agnxtnode(g: PAgraph_t; n: PAgnode_t): PAgnode_t; cdecl; external libcgraph;
function aglstnode(g: PAgraph_t): PAgnode_t; cdecl; external libcgraph;
function agprvnode(g: PAgraph_t; n: PAgnode_t): PAgnode_t; cdecl; external libcgraph;
function agsubrep(g: PAgraph_t; n: PAgnode_t): PAgsubnode_t; cdecl; external libcgraph;
function agnodebefore(u: PAgnode_t; v: PAgnode_t): longint; cdecl; external libcgraph;
function agedge(g: PAgraph_t; t: PAgnode_t; h: PAgnode_t; name: pchar; createflag: longint): PAgedge_t; cdecl; external libcgraph;
function agidedge(g: PAgraph_t; t: PAgnode_t; h: PAgnode_t; id: TIDTYPE; createflag: longint): PAgedge_t; cdecl; external libcgraph;
function agsubedge(g: PAgraph_t; e: PAgedge_t; createflag: longint): PAgedge_t; cdecl; external libcgraph;
function agfstin(g: PAgraph_t; n: PAgnode_t): PAgedge_t; cdecl; external libcgraph;
function agnxtin(g: PAgraph_t; e: PAgedge_t): PAgedge_t; cdecl; external libcgraph;
function agfstout(g: PAgraph_t; n: PAgnode_t): PAgedge_t; cdecl; external libcgraph;
function agnxtout(g: PAgraph_t; e: PAgedge_t): PAgedge_t; cdecl; external libcgraph;
function agfstedge(g: PAgraph_t; n: PAgnode_t): PAgedge_t; cdecl; external libcgraph;
function agnxtedge(g: PAgraph_t; e: PAgedge_t; n: PAgnode_t): PAgedge_t; cdecl; external libcgraph;
function agraphof(obj: pointer): PAgraph_t; cdecl; external libcgraph;
function agroot(obj: pointer): PAgraph_t; cdecl; external libcgraph;
function agcontains(para1: PAgraph_t; para2: pointer): longint; cdecl; external libcgraph;
function agnameof(para1: pointer): pchar; cdecl; external libcgraph;
function agrelabel(obj: pointer; name: pchar): longint; cdecl; external libcgraph;
function agrelabel_node(n: PAgnode_t; newname: pchar): longint; cdecl; external libcgraph;
function agdelete(g: PAgraph_t; obj: pointer): longint; cdecl; external libcgraph;
function agdelsubg(g: PAgraph_t; sub: PAgraph_t): longint; cdecl; external libcgraph;
function agdelnode(g: PAgraph_t; arg_n: PAgnode_t): longint; cdecl; external libcgraph;
function agdeledge(g: PAgraph_t; arg_e: PAgedge_t): longint; cdecl; external libcgraph;
function agobjkind(para1: pointer): longint; cdecl; external libcgraph;
function agstrdup(para1: PAgraph_t; para2: pchar): pchar; cdecl; external libcgraph;
function agstrdup_html(para1: PAgraph_t; para2: pchar): pchar; cdecl; external libcgraph;
function aghtmlstr(para1: pchar): longint; cdecl; external libcgraph;
function agstrbind(g: PAgraph_t; para2: pchar): pchar; cdecl; external libcgraph;
function agstrfree(para1: PAgraph_t; para2: pchar): longint; cdecl; external libcgraph;
function agcanon(para1: pchar; para2: longint): pchar; cdecl; external libcgraph;
function agstrcanon(para1: pchar; para2: pchar): pchar; cdecl; external libcgraph;
function agcanonStr(str: pchar): pchar; cdecl; external libcgraph;

function agattr(g: PAgraph_t; kind: longint; name: pchar; value: pchar): PAgsym_t; cdecl; external libcgraph;
function agattrsym(obj: pointer; name: pchar): PAgsym_t; cdecl; external libcgraph;
function agnxtattr(g: PAgraph_t; kind: longint; attr: PAgsym_t): PAgsym_t; cdecl; external libcgraph;
function agcopyattr(oldobj: pointer; newobj: pointer): longint; cdecl; external libcgraph;
function agbindrec(obj: pointer; name: pchar; size: dword; move_to_front: longint): pointer; cdecl; external libcgraph;
function aggetrec(obj: pointer; name: pchar; move_to_front: longint): PAgrec_t; cdecl; external libcgraph;
function agdelrec(obj: pointer; name: pchar): longint; cdecl; external libcgraph;
procedure aginit(g: PAgraph_t; kind: longint; rec_name: pchar; rec_size: longint; move_to_front: longint); cdecl; external libcgraph;
procedure agclean(g: PAgraph_t; kind: longint; rec_name: pchar); cdecl; external libcgraph;
function agget(obj: pointer; name: pchar): pchar; cdecl; external libcgraph;
function agxget(obj: pointer; sym: PAgsym_t): pchar; cdecl; external libcgraph;
function agset(obj: pointer; name: pchar; value: pchar): longint; cdecl; external libcgraph;
function agxset(obj: pointer; sym: PAgsym_t; value: pchar): longint; cdecl; external libcgraph;
function agsafeset(obj: pointer; name: pchar; value: pchar; def: pchar): longint; cdecl; external libcgraph;
function agsubg(g: PAgraph_t; name: pchar; cflag: longint): PAgraph_t; cdecl; external libcgraph;
function agidsubg(g: PAgraph_t; id: TIDTYPE; cflag: longint): PAgraph_t; cdecl; external libcgraph;
function agfstsubg(g: PAgraph_t): PAgraph_t; cdecl; external libcgraph;
function agnxtsubg(subg: PAgraph_t): PAgraph_t; cdecl; external libcgraph;
function agparent(g: PAgraph_t): PAgraph_t; cdecl; external libcgraph;
function agnnodes(g: PAgraph_t): longint; cdecl; external libcgraph;
function agnedges(g: PAgraph_t): longint; cdecl; external libcgraph;
function agnsubg(g: PAgraph_t): longint; cdecl; external libcgraph;
function agdegree(g: PAgraph_t; n: PAgnode_t; in_: longint; out_: longint): longint; cdecl; external libcgraph;
function agcountuniqedges(g: PAgraph_t; n: PAgnode_t; in_: longint; out_: longint): longint; cdecl; external libcgraph;
function agalloc(g: PAgraph_t; size: Tsize_t): pointer; cdecl; external libcgraph;
function agrealloc(g: PAgraph_t; ptr: pointer; oldsize: Tsize_t; size: Tsize_t): pointer; cdecl; external libcgraph;
procedure agfree(g: PAgraph_t; ptr: pointer); cdecl; external libcgraph;
function agheap(g: PAgraph_t): Pvmalloc_s; cdecl; external libcgraph;
procedure aginternalmapclearlocalnames(g: PAgraph_t); cdecl; external libcgraph;

type
  Pagerrlevel_t = ^Tagerrlevel_t;
  Tagerrlevel_t = longint;

const
  AGWARN = 0;
  AGERR_ = 1;
  AGMAX = 2;
  AGPREV = 3;

type
  Tagusererrf = function(para1: pchar): longint; cdecl;

function agseterr(para1: Tagerrlevel_t): Tagerrlevel_t; cdecl; external libcgraph;
function aglasterr: pchar; cdecl; external libcgraph;
function agerr(level: Tagerrlevel_t; fmt: pchar): longint; cdecl; varargs; external libcgraph;
procedure agerrorf(fmt: pchar; args: array of const); cdecl; external libcgraph;
procedure agerrorf(fmt: pchar); cdecl; external libcgraph;
procedure agwarningf(fmt: pchar; args: array of const); cdecl; external libcgraph;
procedure agwarningf(fmt: pchar); cdecl; external libcgraph;
function agerrors: longint; cdecl; external libcgraph;
function agreseterrors: longint; cdecl; external libcgraph;
function agseterrf(para1: Tagusererrf): Tagusererrf; cdecl; external libcgraph;

const
  TAILPORT_ID = 'tailport';
  HEADPORT_ID = 'headport';

var
  Agdirected: TAgdesc_t; cvar;external libcgraph;
  Agstrictdirected: TAgdesc_t; cvar;external libcgraph;
  Agundirected: TAgdesc_t; cvar;external libcgraph;
  Agstrictundirected: TAgdesc_t; cvar;external libcgraph;

procedure agflatten(g: PAgraph_t; flag: longint); cdecl; external libcgraph;

type
  PAgnoderef_t = type Pointer;
  PAgedgeref_t = type Pointer;

  // === Konventiert am: 3-12-25 15:08:30 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}


  {$ENDIF read_implementation}
