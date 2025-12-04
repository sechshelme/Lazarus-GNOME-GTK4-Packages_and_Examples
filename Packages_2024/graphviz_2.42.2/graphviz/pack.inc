{$IFDEF read_interface}


type
  Ppack_mode = ^Tpack_mode;
  Tpack_mode = longint;

const
  l_undef = 0;
  l_clust = 1;
  l_node = 2;
  l_graph = 3;
  l_array = 4;
  l_aspect = 5;

const
  PK_COL_MAJOR = 1 shl 0;
  PK_USER_VALS = 1 shl 1;
  PK_LEFT_ALIGN = 1 shl 2;
  PK_RIGHT_ALIGN = 1 shl 3;
  PK_TOP_ALIGN = 1 shl 4;
  PK_BOT_ALIGN = 1 shl 5;
  PK_INPUT_ORDER = 1 shl 6;

type
  Ppackval_t = ^Tpackval_t;
  Tpackval_t = dword;

  Tpack_info = record
    aspect: single;
    sz: longint;
    margin: dword;
    doSplines: longint;
    mode: Tpack_mode;
    fixed: Pboolean;
    vals: Ppackval_t;
    flags: longint;
  end;
  Ppack_info = ^Tpack_info;

function putRects(ng: longint; bbs: Pboxf; pinfo: Ppack_info): Ppoint; cdecl; external libgvc;
function packRects(ng: longint; bbs: Pboxf; pinfo: Ppack_info): longint; cdecl; external libgvc;
function putGraphs(para1: longint; para2: PPAgraph_t; para3: PAgraph_t; para4: Ppack_info): Ppoint; cdecl; external libgvc;
function packGraphs(para1: longint; para2: PPAgraph_t; para3: PAgraph_t; para4: Ppack_info): longint; cdecl; external libgvc;
function packSubgraphs(para1: longint; para2: PPAgraph_t; para3: PAgraph_t; para4: Ppack_info): longint; cdecl; external libgvc;
function pack_graph(ng: longint; gs: PPAgraph_t; root: PAgraph_t; fixed: Pboolean): longint; cdecl; external libgvc;
function shiftGraphs(para1: longint; para2: PPAgraph_t; para3: Ppoint; para4: PAgraph_t; para5: longint): longint; cdecl; external libgvc;
function getPackMode(g: PAgraph_t; dflt: Tpack_mode): Tpack_mode; cdecl; external libgvc;
function getPack(para1: PAgraph_t; not_def: longint; dflt: longint): longint; cdecl; external libgvc;
function getPackInfo(g: PAgraph_t; dflt: Tpack_mode; dfltMargin: longint; para4: Ppack_info): Tpack_mode; cdecl; external libgvc;
function getPackModeInfo(g: PAgraph_t; dflt: Tpack_mode; para3: Ppack_info): Tpack_mode; cdecl; external libgvc;
function parsePackModeInfo(p: pchar; dflt: Tpack_mode; pinfo: Ppack_info): Tpack_mode; cdecl; external libgvc;
function isConnected(para1: PAgraph_t): longint; cdecl; external libgvc;
function ccomps(para1: PAgraph_t; para2: Plongint; para3: pchar): PPAgraph_t; cdecl; external libgvc;
function cccomps(para1: PAgraph_t; para2: Plongint; para3: pchar): PPAgraph_t; cdecl; external libgvc;
function pccomps(para1: PAgraph_t; para2: Plongint; para3: pchar; para4: Pboolean): PPAgraph_t; cdecl; external libgvc;
function nodeInduce(para1: PAgraph_t): longint; cdecl; external libgvc;
function mapClust(para1: PAgraph_t): PAgraph_t; cdecl; external libgvc;

// === Konventiert am: 3-12-25 15:07:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
