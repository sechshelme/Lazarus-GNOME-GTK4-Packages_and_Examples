unit libqhull_r_;

interface

uses
  fp_qhull_r, user_r;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qhDEFlibqhull = 1;

var
  qh_version : Pchar;cvar;external libqhull_r;
  qh_version2 : Pchar;cvar;external libqhull_r;

type
  TcoordT = TrealT;
  PcoordT = ^TcoordT;
  TpointT = TcoordT;
  PpointT = ^TpointT;

type
  Pqh_pointT = ^Tqh_pointT;
  Tqh_pointT = longint;

const
  qh_IDnone = -(3);
  qh_IDinterior = -(2);
  qh_IDunknown = -(1);

type
  TflagT = dword;
  TboolT = Boolean32;
  PboolT = ^TboolT;

const
  qh_False = False;
  qh_True = True;

type
  Pqh_CENTER = ^Tqh_CENTER;
  Tqh_CENTER = longint;

const
  qh_ASnone = 0;
  qh_ASvoronoi = 1;
  qh_AScentrum = 2;

type
  Pqh_PRINT = ^Tqh_PRINT;
  Tqh_PRINT = longint;

const
  qh_PRINTnone = 0;
  qh_PRINTarea = 1;
  qh_PRINTaverage = 2;
  qh_PRINTcoplanars = 3;
  qh_PRINTcentrums = 4;
  qh_PRINTfacets = 5;
  qh_PRINTfacets_xridge = 6;
  qh_PRINTgeom = 7;
  qh_PRINTids = 8;
  qh_PRINTinner = 9;
  qh_PRINTneighbors = 10;
  qh_PRINTnormals = 11;
  qh_PRINTouter = 12;
  qh_PRINTmaple = 13;
  qh_PRINTincidences = 14;
  qh_PRINTmathematica = 15;
  qh_PRINTmerges = 16;
  qh_PRINToff = 17;
  qh_PRINToptions = 18;
  qh_PRINTpointintersect = 19;
  qh_PRINTpointnearest = 20;
  qh_PRINTpoints = 21;
  qh_PRINTqhull = 22;
  qh_PRINTsize = 23;
  qh_PRINTsummary_ = 24;
  qh_PRINTtriangles = 25;
  qh_PRINTvertices = 26;
  qh_PRINTvneighbors = 27;
  qh_PRINTextremes = 28;
  qh_PRINTEND = 29;

  qh_ALL = True;
  qh_NOupper = True;
  qh_IScheckmax = True;
  qh_ISnewfacets = True;
  qh_RESETvisible = True;

  qh_ERRnone = 0;
  qh_ERRinput = 1;
  qh_ERRsingular = 2;
  qh_ERRprec = 3;
  qh_ERRmem = 4;
  qh_ERRqhull = 5;
  qh_ERRother = 6;
  qh_ERRtopology = 7;
  qh_ERRwide = 8;
  qh_ERRdebug = 9;

type
  PsetT = type Pointer;

const
  DEFqhT = 1;
  DEFsetT = 1;

type
  PfacetT = ^TfacetT;

  TfacetT = bitpacked record
    furthestdist: TcoordT;
    maxoutside: TcoordT;
    offset: TcoordT;
    normal: PcoordT;
    f: record
      case longint of
        0: (area: TrealT);
        1: (replace: PfacetT);
        2: (samecycle: PfacetT);
        3: (newcycle: PfacetT);
        4: (trivisible: PfacetT);
        5: (triowner: PfacetT);
      end;
    center: PcoordT;
    previous: PfacetT;
    next: PfacetT;
    vertices: PsetT;
    ridges: PsetT;
    neighbors: PsetT;
    outsideset: PsetT;
    coplanarset: PsetT;
    visitid: dword;
    id: dword;
    nummerge: 0..511;
    tricoplanar: 0..1;
    newfacet: 0..1;
    visible: 0..1;
    toporient: 0..1;
    simplicial: 0..1;
    seen: 0..1;
    seen2: 0..1;
    flipped: 0..1;
    upperdelaunay: 0..1;
    notfurthest: 0..1;
    good: 0..1;
    isarea: 0..1;
    dupridge: 0..1;
    mergeridge: 0..1;
    mergeridge2: 0..1;
    coplanarhorizon: 0..1;
    mergehorizon: 0..1;
    cycledone: 0..1;
    tested: 0..1;
    keepcentrum: 0..1;
    newmerge: 0..1;
    degenerate: 0..1;
    redundant: 0..1;
  end;

const
  qh_MAXnummerge = 511;

type
  TridgeT = bitpacked record
    vertices: PsetT;
    top: PfacetT;
    bottom: PfacetT;
    id: dword;
    seen: 0..1;
    tested: 0..1;
    nonconvex: 0..1;
    mergevertex: 0..1;
    mergevertex2: 0..1;
    simplicialtop: 0..1;
    simplicialbot: 0..1;
  end;
  PridgeT = ^TridgeT;

type
  PvertexT = ^TvertexT;

  TvertexT = bitpacked  record
    next: PvertexT;
    previous: PvertexT;
    point: PpointT;
    neighbors: PsetT;
    id: dword;
    visitid: dword;
    seen: 0..1;
    seen2: 0..1;
    deleted: 0..1;
    delridge: 0..1;
    newfacet: 0..1;
    partitioned: 0..1;
  end;

const
  QHULL_NON_REENTRANT = 0;
  QHULL_QH_POINTER = 1;
  QHULL_REENTRANT = 2;
  QHULL_LIB_TYPE = QHULL_REENTRANT;

type
  PqhT = ^TqhT;
  TqhT = record
      ALLpoints : TboolT;
      ALLOWshort : TboolT;
      ALLOWwarning : TboolT;
      ALLOWwide : TboolT;
      ANGLEmerge : TboolT;
      APPROXhull : TboolT;
      MINoutside : TrealT;
      ANNOTATEoutput : TboolT;
      ATinfinity : TboolT;
      AVOIDold : TboolT;
      BESToutside : TboolT;
      CDDinput : TboolT;
      CDDoutput : TboolT;
      CHECKduplicates : TboolT;
      CHECKfrequently : TboolT;
      premerge_cos : TrealT;
      postmerge_cos : TrealT;
      DELAUNAY : TboolT;
      DOintersections : TboolT;
      DROPdim : longint;
      FLUSHprint : TboolT;
      FORCEoutput : TboolT;
      GOODpoint : longint;
      GOODpointp : PpointT;
      GOODthreshold : TboolT;
      GOODvertex : longint;
      GOODvertexp : PpointT;
      HALFspace : TboolT;
      ISqhullQh : TboolT;
      IStracing : longint;
      KEEParea : longint;
      KEEPcoplanar : TboolT;
      KEEPinside : TboolT;
      KEEPmerge : longint;
      KEEPminArea : TrealT;
      MAXcoplanar : TrealT;
      MAXwide : longint;
      MERGEexact : TboolT;
      MERGEindependent : TboolT;
      MERGING : TboolT;
      premerge_centrum : TrealT;
      postmerge_centrum : TrealT;
      MERGEpinched : TboolT;
      MERGEvertices : TboolT;
      MINvisible : TrealT;
      NOnarrow : TboolT;
      NOnearinside : TboolT;
      NOpremerge : TboolT;
      ONLYgood : TboolT;
      ONLYmax : TboolT;
      PICKfurthest : TboolT;
      POSTmerge : TboolT;
      PREmerge : TboolT;
      PRINTcentrums : TboolT;
      PRINTcoplanar : TboolT;
      PRINTdim : longint;
      PRINTdots : TboolT;
      PRINTgood : TboolT;
      PRINTinner : TboolT;
      PRINTneighbors : TboolT;
      PRINTnoplanes : TboolT;
      PRINToptions1st : TboolT;
      PRINTouter : TboolT;
      PRINTprecision : TboolT;
      PRINTout : array[0..(qh_PRINTEND)-1] of Tqh_PRINT;
      PRINTridges : TboolT;
      PRINTspheres : TboolT;
      PRINTstatistics : TboolT;
      PRINTsummary : TboolT;
      PRINTtransparent : TboolT;
      PROJECTdelaunay : TboolT;
      PROJECTinput : longint;
      RANDOMdist : TboolT;
      RANDOMfactor : TrealT;
      RANDOMa : TrealT;
      RANDOMb : TrealT;
      RANDOMoutside : TboolT;
      REPORTfreq : longint;
      REPORTfreq2 : longint;
      RERUN : longint;
      ROTATErandom : longint;
      SCALEinput : TboolT;
      SCALElast : TboolT;
      SETroundoff : TboolT;
      SKIPcheckmax : TboolT;
      SKIPconvex : TboolT;
      SPLITthresholds : TboolT;
      STOPadd : longint;
      STOPcone : longint;
      STOPpoint : longint;
      TESTpoints : longint;
      TESTvneighbors : TboolT;
      TRACElevel : longint;
      TRACElastrun : longint;
      TRACEpoint : longint;
      TRACEdist : TrealT;
      TRACEmerge : longint;
      TRIangulate : TboolT;
      TRInormals : TboolT;
      UPPERdelaunay : TboolT;
      USEstdout : TboolT;
      VERIFYoutput : TboolT;
      VIRTUALmemory : TboolT;
      VORONOI : TboolT;
      AREAfactor : TrealT;
      DOcheckmax : TboolT;
      feasible_string : Pchar;
      feasible_point : PcoordT;
      GETarea : TboolT;
      KEEPnearinside : TboolT;
      hull_dim : longint;
      input_dim : longint;
      num_points : longint;
      first_point : PpointT;
      POINTSmalloc : TboolT;
      input_points : PpointT;
      input_malloc : TboolT;
      qhull_command : array[0..255] of char;
      qhull_commandsiz2 : longint;
      rbox_command : array[0..255] of char;
      qhull_options : array[0..511] of char;
      qhull_optionlen : longint;
      qhull_optionsiz : longint;
      qhull_optionsiz2 : longint;
      run_id : longint;
      VERTEXneighbors : TboolT;
      ZEROcentrum : TboolT;
      upper_threshold : PrealT;
      lower_threshold : PrealT;
      upper_bound : PrealT;
      lower_bound : PrealT;
      ANGLEround : TrealT;
      centrum_radius : TrealT;
      cos_max : TrealT;
      DISTround : TrealT;
      MAXabs_coord : TrealT;
      MAXlastcoord : TrealT;
      MAXoutside : TrealT;
      MAXsumcoord : TrealT;
      MAXwidth : TrealT;
      MINdenom_1 : TrealT;
      MINdenom : TrealT;
      MINdenom_1_2 : TrealT;
      MINdenom_2 : TrealT;
      MINlastcoord : TrealT;
      NEARzero : PrealT;
      NEARinside : TrealT;
      ONEmerge : TrealT;
      outside_err : TrealT;
      WIDEfacet : TrealT;
      NARROWhull : TboolT;
      qhull : array[0..(sizeof('qhull'))-1] of char;
      errexit : Tjmp_buf;
      jmpXtra : array[0..39] of char;
      restartexit : Tjmp_buf;
      jmpXtra2 : array[0..39] of char;
      fin : PFILE;
      fout : PFILE;
      ferr : PFILE;
      interior_point : PpointT;
      normal_size : longint;
      center_size : longint;
      TEMPsize : longint;
      facet_list : PfacetT;
      facet_tail : PfacetT;
      facet_next : PfacetT;
      newfacet_list : PfacetT;
      visible_list : PfacetT;
      num_visible : longint;
      tracefacet_id : dword;
      tracefacet : PfacetT;
      traceridge_id : dword;
      traceridge : PridgeT;
      tracevertex_id : dword;
      tracevertex : PvertexT;
      vertex_list : PvertexT;
      vertex_tail : PvertexT;
      newvertex_list : PvertexT;
      num_facets : longint;
      num_vertices : longint;
      num_outside : longint;
      num_good : longint;
      facet_id : dword;
      ridge_id : dword;
      vertex_id : dword;
      first_newfacet : dword;
      hulltime : dword;
      ALLOWrestart : TboolT;
      build_cnt : longint;
      CENTERtype : Tqh_CENTER;
      furthest_id : longint;
      last_errcode : longint;
      GOODclosest : PfacetT;
      coplanar_apex : PpointT;
      hasAreaVolume : TboolT;
      hasTriangulation : TboolT;
      isRenameVertex : TboolT;
      JOGGLEmax : TrealT;
      maxoutdone : TboolT;
      max_outside : TrealT;
      max_vertex : TrealT;
      min_vertex : TrealT;
      NEWfacets : TboolT;
      NEWtentative : TboolT;
      findbestnew : TboolT;
      findbest_notsharp : TboolT;
      NOerrexit : TboolT;
      PRINTcradius : TrealT;
      PRINTradius : TrealT;
      POSTmerging : TboolT;
      printoutvar : longint;
      printoutnum : longint;
      repart_facetid : dword;
      retry_addpoint : longint;
      QHULLfinished : TboolT;
      totarea : TrealT;
      totvol : TrealT;
      visit_id : dword;
      vertex_visit : dword;
      WAScoplanar : TboolT;
      ZEROall_ok : TboolT;
      facet_mergeset : PsetT;
      degen_mergeset : PsetT;
      vertex_mergeset : PsetT;
      hash_table : PsetT;
      other_points : PsetT;
      del_vertices : PsetT;
      gm_matrix : PcoordT;
      gm_row : ^PcoordT;
      line : Pchar;
      maxline : longint;
      half_space : PcoordT;
      temp_malloc : PcoordT;
      ERREXITcalled : TboolT;
      firstcentrum : TboolT;
      old_randomdist : TboolT;
      coplanarfacetset : PsetT;
      last_low : TrealT;
      last_high : TrealT;
      last_newhigh : TrealT;
      lastcpu : TrealT;
      lastfacets : longint;
      lastmerges : longint;
      lastplanes : longint;
      lastdist : longint;
      lastreport : dword;
      mergereport : longint;
      old_tempstack : PsetT;
      ridgeoutnum : longint;
      last_random : longint;
      rbox_errexit : Tjmp_buf;
      jmpXtra3 : array[0..39] of char;
      rbox_isinteger : longint;
      rbox_out_offset : double;
      cpp_object : pointer;
      cpp_other : pointer;
      cpp_user : pointer;
      pading:array[0..11023]of byte;
//      qhmem : TqhmemT;
//      qhstat : TqhstatT;
    end;

procedure qh_qhull(qh: PqhT); cdecl; external libqhull_r;
function qh_addpoint(qh: PqhT; furthest: PpointT; facet: PfacetT; checkdist: TboolT): TboolT; cdecl; external libqhull_r;
procedure qh_errexit2(qh: PqhT; exitcode: longint; facet: PfacetT; otherfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_printsummary(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;

procedure qh_errexit(qh: PqhT; exitcode: longint; facet: PfacetT; ridge: PridgeT); cdecl; external libqhull_r;
procedure qh_errprint(qh: PqhT; _string: pchar; atfacet: PfacetT; otherfacet: PfacetT; atridge: PridgeT; atvertex: PvertexT); cdecl; external libqhull_r;
function qh_new_qhull(qh: PqhT; dim: longint; numpoints: longint; points: PcoordT; ismalloc: TboolT; qhull_cmd: pchar; outfile: PFILE; errfile: PFILE): longint; cdecl; external libqhull_r;
procedure qh_printfacetlist(qh: PqhT; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printhelp_degenerate(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_internal(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_narrowhull(qh: PqhT; fp: PFILE; minangle: TrealT); cdecl; external libqhull_r;
procedure qh_printhelp_singular(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_topology(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_wide(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_user_memsizes(qh: PqhT); cdecl; external libqhull_r;

procedure qh_exit(exitcode: longint); cdecl; external libqhull_r;
procedure qh_fprintf_stderr(msgcode: longint; fmt: pchar; args: array of const); cdecl; external libqhull_r;
procedure qh_fprintf_stderr(msgcode: longint; fmt: pchar); cdecl; external libqhull_r;
procedure qh_free(mem: pointer); cdecl; external libqhull_r;
function qh_malloc(size: Tsize_t): pointer; cdecl; external libqhull_r;

procedure qh_fprintf(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar; args: array of const); cdecl; external libqhull_r;
procedure qh_fprintf(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar); cdecl; external libqhull_r;
procedure qh_fprintf_rbox(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar; args: array of const); cdecl; external libqhull_r;
procedure qh_fprintf_rbox(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar); cdecl; external libqhull_r;

function qh_findbest(qh: PqhT; point: PpointT; startfacet: PfacetT; bestoutside: TboolT; newfacets: TboolT; noupper: TboolT; dist: PrealT; isoutside: PboolT; numpart: Plongint): PfacetT; cdecl; external libqhull_r;
function qh_findbestnew(qh: PqhT; point: PpointT; startfacet: PfacetT; dist: PrealT; bestoutside: TboolT; isoutside: PboolT; numpart: Plongint): PfacetT; cdecl; external libqhull_r;
function qh_gram_schmidt(qh: PqhT; dim: longint; rows: PPrealT): TboolT; cdecl; external libqhull_r;
procedure qh_outerinner(qh: PqhT; facet: PfacetT; outerplane: PrealT; innerplane: PrealT); cdecl; external libqhull_r;
procedure qh_projectinput(qh: PqhT); cdecl; external libqhull_r;
procedure qh_randommatrix(qh: PqhT; buffer: PrealT; dim: longint; row: PPrealT); cdecl; external libqhull_r;
procedure qh_rotateinput(qh: PqhT; rows: PPrealT); cdecl; external libqhull_r;
procedure qh_scaleinput(qh: PqhT); cdecl; external libqhull_r;
procedure qh_setdelaunay(qh: PqhT; dim: longint; count: longint; points: PpointT); cdecl; external libqhull_r;
function qh_sethalfspace_all(qh: PqhT; dim: longint; count: longint; halfspaces: PcoordT; feasible: PpointT): PcoordT; cdecl; external libqhull_r;

function qh_clock(qh: PqhT): dword; cdecl; external libqhull_r;
procedure qh_checkflags(qh: PqhT; command: pchar; hiddenflags: pchar); cdecl; external libqhull_r;
procedure qh_clear_outputflags(qh: PqhT); cdecl; external libqhull_r;
procedure qh_freebuffers(qh: PqhT); cdecl; external libqhull_r;
procedure qh_freeqhull(qh: PqhT; allmem: TboolT); cdecl; external libqhull_r;
procedure qh_init_A(qh: PqhT; infile: PFILE; outfile: PFILE; errfile: PFILE; argc: longint; argv: PPchar); cdecl; external libqhull_r;
procedure qh_init_B(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;
procedure qh_init_qhull_command(qh: PqhT; argc: longint; argv: PPchar); cdecl; external libqhull_r;
procedure qh_initbuffers(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;
procedure qh_initflags(qh: PqhT; command: pchar); cdecl; external libqhull_r;
procedure qh_initqhull_buffers(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initqhull_globals(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;
procedure qh_initqhull_mem(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initqhull_outputflags(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initqhull_start(qh: PqhT; infile: PFILE; outfile: PFILE; errfile: PFILE); cdecl; external libqhull_r;
procedure qh_initqhull_start2(qh: PqhT; infile: PFILE; outfile: PFILE; errfile: PFILE); cdecl; external libqhull_r;
procedure qh_initthresholds(qh: PqhT; command: pchar); cdecl; external libqhull_r;
procedure qh_lib_check(qhullLibraryType: longint; qhTsize: longint; vertexTsize: longint; ridgeTsize: longint; facetTsize: longint; setTsize: longint; qhmemTsize: longint); cdecl; external libqhull_r;
procedure qh_option(qh: PqhT; option: pchar; i: Plongint; r: PrealT); cdecl; external libqhull_r;
procedure qh_zero(qh: PqhT; errfile: PFILE); cdecl; external libqhull_r;

procedure qh_dfacet(qh: PqhT; id: dword); cdecl; external libqhull_r;
procedure qh_dvertex(qh: PqhT; id: dword); cdecl; external libqhull_r;
procedure qh_printneighborhood(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetA: PfacetT; facetB: PfacetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_produce_output(qh: PqhT); cdecl; external libqhull_r;
function qh_readpoints(qh: PqhT; numpoints: Plongint; dimension: Plongint; ismalloc: PboolT): PcoordT; cdecl; external libqhull_r;

procedure qh_meminit(qh: PqhT; ferr: PFILE); cdecl; external libqhull_r;
procedure qh_memfreeshort(qh: PqhT; curlong: Plongint; totlong: Plongint); cdecl; external libqhull_r;

procedure qh_check_output(qh: PqhT); cdecl; external libqhull_r;
procedure qh_check_points(qh: PqhT); cdecl; external libqhull_r;
function qh_facetvertices(qh: PqhT; facetlist: PfacetT; facets: PsetT; allfacets: TboolT): PsetT; cdecl; external libqhull_r;
function qh_findbestfacet(qh: PqhT; point: PpointT; bestoutside: TboolT; bestdist: PrealT; isoutside: PboolT): PfacetT; cdecl; external libqhull_r;
function qh_nearvertex(qh: PqhT; facet: PfacetT; point: PpointT; bestdistp: PrealT): PvertexT; cdecl; external libqhull_r;
function qh_point(qh: PqhT; id: longint): PpointT; cdecl; external libqhull_r;
function qh_pointfacet(qh: PqhT): PsetT; cdecl; external libqhull_r;
function qh_pointid(qh: PqhT; point: PpointT): longint; cdecl; external libqhull_r;
function qh_pointvertex(qh: PqhT): PsetT; cdecl; external libqhull_r;
procedure qh_setvoronoi_all(qh: PqhT); cdecl; external libqhull_r;
procedure qh_triangulate(qh: PqhT); cdecl; external libqhull_r;

function qh_rboxpoints(qh: PqhT; rbox_command: pchar): longint; cdecl; external libqhull_r;
procedure qh_errexit_rbox(qh: PqhT; exitcode: longint); cdecl; external libqhull_r;

procedure qh_collectstatistics(qh: PqhT); cdecl; external libqhull_r;
procedure qh_printallstatistics(qh: PqhT; fp: PFILE; _string: pchar); cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:24 ===


implementation



end.
