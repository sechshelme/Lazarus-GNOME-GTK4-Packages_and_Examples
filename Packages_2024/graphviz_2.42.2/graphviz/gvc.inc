{$IFDEF read_interface}


procedure gvToggle(para1: longint); cdecl; external libgvc;
function gvNEWcontext(builtins: Plt_symlist_t; demand_loading: longint): PGVC_t; cdecl; external libgvc;
function gvContext: PGVC_t; cdecl; external libgvc;
function gvContextPlugins(builtins: Plt_symlist_t; demand_loading: longint): PGVC_t; cdecl; external libgvc;
function gvcInfo(para1: PGVC_t): PPchar; cdecl; external libgvc;
function gvcVersion(para1: PGVC_t): pchar; cdecl; external libgvc;
function gvcBuildDate(para1: PGVC_t): pchar; cdecl; external libgvc;
function gvParseArgs(gvc: PGVC_t; argc: longint; argv: PPchar): longint; cdecl; external libgvc;
function gvNextInputGraph(gvc: PGVC_t): Pgraph_t; cdecl; external libgvc;
function gvPluginsGraph(gvc: PGVC_t): Pgraph_t; cdecl; external libgvc;
function gvLayout(gvc: PGVC_t; g: Pgraph_t; engine: pchar): longint; cdecl; external libgvc;
function gvLayoutJobs(gvc: PGVC_t; g: Pgraph_t): longint; cdecl; external libgvc;
procedure attach_attrs(g: Pgraph_t); cdecl; external libgvc;
function gvRender(gvc: PGVC_t; g: Pgraph_t; format: pchar; out_: PFILE): longint; cdecl; external libgvc;
function gvRenderFilename(gvc: PGVC_t; g: Pgraph_t; format: pchar; filename: pchar): longint; cdecl; external libgvc;
function gvRenderContext(gvc: PGVC_t; g: Pgraph_t; format: pchar; context: pointer): longint; cdecl; external libgvc;
function gvRenderData(gvc: PGVC_t; g: Pgraph_t; format: pchar; result: PPchar; length: Pdword): longint; cdecl; external libgvc;
procedure gvFreeRenderData(data: pchar); cdecl; external libgvc;
function gvRenderJobs(gvc: PGVC_t; g: Pgraph_t): longint; cdecl; external libgvc;
function gvFreeLayout(gvc: PGVC_t; g: Pgraph_t): longint; cdecl; external libgvc;
procedure gvFinalize(gvc: PGVC_t); cdecl; external libgvc;
function gvFreeContext(gvc: PGVC_t): longint; cdecl; external libgvc;
function gvPluginList(gvc: PGVC_t; kind: pchar; sz: Plongint; para4: pchar): Ppchar; cdecl; external libgvc;
procedure gvAddLibrary(gvc: PGVC_t; lib: Pgvplugin_library_t); cdecl; external libgvc;
function gvToolTred(g: Pgraph_t): longint; cdecl; external libgvc;

// === Konventiert am: 3-12-25 15:08:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
