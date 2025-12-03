
unit cgraph;
interface

{
  Automatically converted by H2Pas 1.0.0 from cgraph.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cgraph.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAgattr_s  = ^Agattr_s;
PAgcbdisc_s  = ^Agcbdisc_s;
PAgcbdisc_t  = ^Agcbdisc_t;
PAgcbstack_s  = ^Agcbstack_s;
PAgcbstack_t  = ^Agcbstack_t;
PAgclos_s  = ^Agclos_s;
PAgclos_t  = ^Agclos_t;
PAgdatadict_s  = ^Agdatadict_s;
PAgdesc_s  = ^Agdesc_s;
PAgdisc_s  = ^Agdisc_s;
PAgdisc_t  = ^Agdisc_t;
PAgdstate_s  = ^Agdstate_s;
PAgedge_s  = ^Agedge_s;
PAgedge_t  = ^Agedge_t;
PAgedgepair_s  = ^Agedgepair_s;
PAgedgeref_t  = ^Agedgeref_t;
Pagerrlevel_t  = ^agerrlevel_t;
PAgiddisc_s  = ^Agiddisc_s;
PAgiddisc_t  = ^Agiddisc_t;
PAgiodisc_s  = ^Agiodisc_s;
PAgiodisc_t  = ^Agiodisc_t;
PAgmemdisc_s  = ^Agmemdisc_s;
PAgmemdisc_t  = ^Agmemdisc_t;
PAgnode_s  = ^Agnode_s;
PAgnode_t  = ^Agnode_t;
PAgnoderef_t  = ^Agnoderef_t;
PAgobj_s  = ^Agobj_s;
PAgobj_t  = ^Agobj_t;
PAgraph_s  = ^Agraph_s;
PAgraph_t  = ^Agraph_t;
PAgrec_s  = ^Agrec_s;
PAgrec_t  = ^Agrec_t;
PAgsubnode_s  = ^Agsubnode_s;
PAgsubnode_t  = ^Agsubnode_t;
PAgsym_s  = ^Agsym_s;
PAgsym_t  = ^Agsym_t;
PAgtag_s  = ^Agtag_s;
Pchar  = ^char;
PDict_t  = ^Dict_t;
PDtlink_t  = ^Dtlink_t;
PIDTYPE  = ^IDTYPE;
Pvmalloc_s  = ^vmalloc_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$ $Revision$  }
{ vim:set shiftwidth=4 ts=8:  }
{************************************************************************
 * Copyright (c) 2011 AT&T Intellectual Property
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors: See CVS logs. Details at http://www.graphviz.org/
 ************************************************************************ }
{$ifndef ATT_GRAPH_H}
{$define ATT_GRAPH_H}
{$include <inttypes.h>}
{$include "cdt.h"}
{ C++ extern C conditionnal removed }
type
  PIDTYPE = ^TIDTYPE;
  TIDTYPE = Tuint64_t;
{ forward struct type declarations  }
  TAgtag_s = TAgtag_t;
  TAgobj_s = TAgobj_t;
{ generic object header  }
  TAgraph_s = TAgraph_t;
{ graph, subgraph (or hyperedge)  }
  TAgnode_s = TAgnode_t;
{ node (atom)  }
  TAgedge_s = TAgedge_t;
{ node pair  }
  TAgdesc_s = TAgdesc_t;
{ graph descriptor  }
  TAgmemdisc_s = TAgmemdisc_t;
{ memory allocator  }
  TAgiddisc_s = TAgiddisc_t;
{ object ID allocator  }
  TAgiodisc_s = TAgiodisc_t;
{ IO services  }
  TAgdisc_s = TAgdisc_t;
{ union of client discipline methods  }
  TAgdstate_s = TAgdstate_t;
{ client state (closures)  }
  TAgsym_s = TAgsym_t;
{ string attribute descriptors  }
  TAgattr_s = TAgattr_t;
{ string attribute container  }
  TAgcbdisc_s = TAgcbdisc_t;
{ client event callbacks  }
  TAgcbstack_s = TAgcbstack_t;
{ enclosing state for cbdisc  }
  TAgclos_s = TAgclos_t;
{ common fields for graph/subgs  }
  TAgrec_s = TAgrec_t;
{ generic runtime record  }
  TAgdatadict_s = TAgdatadict_t;
{ set of dictionaries per graph  }
  TAgedgepair_s = TAgedgepair_t;
{ the edge object  }
  TAgsubnode_s = TAgsubnode_t;
{ Header of a user record.  These records are attached by client programs
dynamically at runtime.  A unique string ID must be given to each record
attached to the same object.  Cgraph has functions to create, search for,
and delete these records.   The records are maintained in a circular list,
with obj->data pointing somewhere in the list.  The search function has
an option to lock this pointer on a given record.  The application must
be written so only one such lock is outstanding at a time.  }
{ following this would be any programmer-defined data  }
  PAgrec_s = ^TAgrec_s;
  TAgrec_s = record
      name : Pchar;
      next : PAgrec_t;
    end;

{ Object tag for graphs, nodes, and edges.  While there may be several structs
for a given node or edges, there is only one unique ID (per main graph).   }
{ see literal tags below  }
{ move-to-front lock, see above  }
{ attrs written (parity, write.c)  }
{ sequence no.  }
{ client  ID  }
  PAgtag_s = ^TAgtag_s;
  TAgtag_s = record
      flag0 : word;
      id : TIDTYPE;
    end;


const
  bm_TAgtag_s_objtype = $3;
  bp_TAgtag_s_objtype = 0;
  bm_TAgtag_s_mtflock = $4;
  bp_TAgtag_s_mtflock = 2;
  bm_TAgtag_s_attrwf = $8;
  bp_TAgtag_s_attrwf = 3;

function objtype(var a : TAgtag_s) : dword;
procedure set_objtype(var a : TAgtag_s; __objtype : dword);
function mtflock(var a : TAgtag_s) : dword;
procedure set_mtflock(var a : TAgtag_s; __mtflock : dword);
function attrwf(var a : TAgtag_s) : dword;
procedure set_attrwf(var a : TAgtag_s; __attrwf : dword);
function seq(var a : TAgtag_s) : dword;
procedure set_seq(var a : TAgtag_s; __seq : dword);
{ object tags  }
{ can't exceed 2 bits. see Agtag_t.  }

const
  AGRAPH = 0;  
  AGNODE = 1;  
  AGOUTEDGE = 2;  
{ (1 << 1) indicates an edge tag.    }
  AGINEDGE = 3;  
{ synonym in object kind args  }
  AGEDGE = AGOUTEDGE;  
{ a generic graph/node/edge header  }
type
  PAgobj_s = ^TAgobj_s;
  TAgobj_s = record
      tag : TAgtag_t;
      data : PAgrec_t;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function AGTAG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGTYPE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGID(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGSEQ(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGATTRWF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGDATA(obj : longint) : longint;

{ This is the node struct allocated per graph (or subgraph).  It resides
in the n_dict of the graph.  The node set is maintained by libdict, but
transparently to libgraph callers.  Every node may be given an optional
string name at its time of creation, or it is permissible to pass NIL(char*)
for the name.  }
{ the node-per-graph-or-subgraph record  }
{ must be first  }
{ the object  }
{ by node/ID for random access  }
{ by node/sequence for serial access  }
type
  PAgsubnode_s = ^TAgsubnode_s;
  TAgsubnode_s = record
      seq_link : TDtlink_t;
      id_link : TDtlink_t;
      node : PAgnode_t;
      in_id : PDtlink_t;
      out_id : PDtlink_t;
      in_seq : PDtlink_t;
      out_seq : PDtlink_t;
    end;

{ embedded for main graph  }
  PAgnode_s = ^TAgnode_s;
  TAgnode_s = record
      base : TAgobj_t;
      root : PAgraph_t;
      mainsub : TAgsubnode_t;
    end;

{ main graph only  }
{ the endpoint node  }
  PAgedge_s = ^TAgedge_s;
  TAgedge_s = record
      base : TAgobj_t;
      id_link : TDtlink_t;
      seq_link : TDtlink_t;
      node : PAgnode_t;
    end;

  PAgedgepair_s = ^TAgedgepair_s;
  TAgedgepair_s = record
      out : TAgedge_t;
      in : TAgedge_t;
    end;

{ graph descriptor  }
{ if edges are asymmetric  }
{ if multi-edges forbidden  }
{ if no loops  }
{ if this is the top level graph  }
{ if sets are flattened into lists in cdt  }
{ if a temporary subgraph  }
{ if string attr tables should be initialized  }
{ if may contain collapsed nodes  }
  PAgdesc_s = ^TAgdesc_s;
  TAgdesc_s = record
      flag0 : word;
    end;


const
  bm_TAgdesc_s_directed = $1;
  bp_TAgdesc_s_directed = 0;
  bm_TAgdesc_s_strict = $2;
  bp_TAgdesc_s_strict = 1;
  bm_TAgdesc_s_no_loop = $4;
  bp_TAgdesc_s_no_loop = 2;
  bm_TAgdesc_s_maingraph = $8;
  bp_TAgdesc_s_maingraph = 3;
  bm_TAgdesc_s_flatlock = $10;
  bp_TAgdesc_s_flatlock = 4;
  bm_TAgdesc_s_no_write = $20;
  bp_TAgdesc_s_no_write = 5;
  bm_TAgdesc_s_has_attrs = $40;
  bp_TAgdesc_s_has_attrs = 6;
  bm_TAgdesc_s_has_cmpnd = $80;
  bp_TAgdesc_s_has_cmpnd = 7;

function directed(var a : TAgdesc_s) : dword;
procedure set_directed(var a : TAgdesc_s; __directed : dword);
function strict(var a : TAgdesc_s) : dword;
procedure set_strict(var a : TAgdesc_s; __strict : dword);
function no_loop(var a : TAgdesc_s) : dword;
procedure set_no_loop(var a : TAgdesc_s; __no_loop : dword);
function maingraph(var a : TAgdesc_s) : dword;
procedure set_maingraph(var a : TAgdesc_s; __maingraph : dword);
function flatlock(var a : TAgdesc_s) : dword;
procedure set_flatlock(var a : TAgdesc_s; __flatlock : dword);
function no_write(var a : TAgdesc_s) : dword;
procedure set_no_write(var a : TAgdesc_s; __no_write : dword);
function has_attrs(var a : TAgdesc_s) : dword;
procedure set_has_attrs(var a : TAgdesc_s; __has_attrs : dword);
function has_cmpnd(var a : TAgdesc_s) : dword;
procedure set_has_cmpnd(var a : TAgdesc_s; __has_cmpnd : dword);
{ disciplines for external resources needed by libgraph  }
{ memory allocator  }
{ independent of other resources  }
type
  PAgmemdisc_s = ^TAgmemdisc_s;
  TAgmemdisc_s = record
      open : function (para1:PAgdisc_t):pointer;cdecl;
      alloc : function (state:pointer; req:Tsize_t):pointer;cdecl;
      resize : function (state:pointer; ptr:pointer; old:Tsize_t; req:Tsize_t):pointer;cdecl;
      free : procedure (state:pointer; ptr:pointer);cdecl;
      close : procedure (state:pointer);cdecl;
    end;

{ object ID allocator  }
{ associated with a graph  }
  PAgiddisc_s = ^TAgiddisc_s;
  TAgiddisc_s = record
      open : function (g:PAgraph_t; para2:PAgdisc_t):pointer;cdecl;
      map : function (state:pointer; objtype:longint; str:Pchar; id:PIDTYPE; createflag:longint):longint;cdecl;
      alloc : function (state:pointer; objtype:longint; id:TIDTYPE):longint;cdecl;
      free : procedure (state:pointer; objtype:longint; id:TIDTYPE);cdecl;
      print : function (state:pointer; objtype:longint; id:TIDTYPE):Pchar;cdecl;
      close : procedure (state:pointer);cdecl;
      idregister : procedure (state:pointer; objtype:longint; obj:pointer);cdecl;
    end;

(* Const before type ignored *)
{ sync  }
{ error messages?  }
  PAgiodisc_s = ^TAgiodisc_s;
  TAgiodisc_s = record
      afread : function (chan:pointer; buf:Pchar; bufsize:longint):longint;cdecl;
      putstr : function (chan:pointer; str:Pchar):longint;cdecl;
      flush : function (chan:pointer):longint;cdecl;
    end;

{ user's discipline  }
  PAgdisc_s = ^TAgdisc_s;
  TAgdisc_s = record
      mem : PAgmemdisc_t;
      id : PAgiddisc_t;
      io : PAgiodisc_t;
    end;

{ default resource disciplines  }
  var
    AgMemDisc : TAgmemdisc_t;cvar;external;
    AgIdDisc : TAgiddisc_t;cvar;external;
    AgIoDisc : TAgiodisc_t;cvar;external;
    AgDefaultDisc : TAgdisc_t;cvar;external;
{ IO must be initialized and finalized outside Cgraph,
     * and channels (FILES) are passed as void* arguments.  }
type
  PAgdstate_s = ^TAgdstate_s;
  TAgdstate_s = record
      mem : pointer;
      id : pointer;
    end;


  Tagobjfn_t = procedure (g:PAgraph_t; obj:PAgobj_t; arg:pointer);cdecl;

  Tagobjupdfn_t = procedure (g:PAgraph_t; obj:PAgobj_t; arg:pointer; sym:PAgsym_t);cdecl;
  PAgcbdisc_s = ^TAgcbdisc_s;
  TAgcbdisc_s = record
      graph : record
          ins : Tagobjfn_t;cdecl;
          mod : Tagobjupdfn_t;
          del : Tagobjfn_t;
        end;
      node : record
          ins : Tagobjfn_t;
          mod : Tagobjupdfn_t;
          del : Tagobjfn_t;
        end;
      edge : record
          ins : Tagobjfn_t;
          mod : Tagobjupdfn_t;
          del : Tagobjfn_t;
        end;
    end;

{ object event callbacks  }
{ methods  }
{ closure  }
{ kept in a stack, unlike other disciplines  }
  PAgcbstack_s = ^TAgcbstack_s;
  TAgcbstack_s = record
      f : PAgcbdisc_t;
      state : pointer;
      prev : PAgcbstack_t;
    end;

{ resource discipline functions  }
{ resource closures  }
{ shared string dict  }
{ local object sequence number counter  }
{ user and system callback function stacks  }
{ issue user callbacks or hold them?  }
  PAgclos_s = ^TAgclos_s;
  TAgclos_s = record
      disc : TAgdisc_t;
      state : TAgdstate_t;
      strdict : PDict_t;
      seq : array[0..2] of Tuint64_t;
      cb : PAgcbstack_t;
      callbacks_enabled : byte;
      lookup_by_name : array[0..2] of PDict_t;
      lookup_by_id : array[0..2] of PDict_t;
    end;

{ the node set in sequence  }
{ the node set indexed by ID  }
{ holders for edge sets  }
{ subgraphs - descendants  }
{ subgraphs - ancestors  }
{ shared resources  }
  PAgraph_s = ^TAgraph_s;
  TAgraph_s = record
      base : TAgobj_t;
      desc : TAgdesc_t;
      link : TDtlink_t;
      n_seq : PDict_t;
      n_id : PDict_t;
      e_seq : PDict_t;
      e_id : PDict_t;
      g_dict : PDict_t;
      parent : PAgraph_t;
      root : PAgraph_t;
      clos : PAgclos_t;
    end;


procedure agpushdisc(g:PAgraph_t; disc:PAgcbdisc_t; state:pointer);cdecl;external;
function agpopdisc(g:PAgraph_t; disc:PAgcbdisc_t):longint;cdecl;external;
function agcallbacks(g:PAgraph_t; flag:longint):longint;cdecl;external;
{ return prev value  }
{ graphs  }
function agopen(name:Pchar; desc:TAgdesc_t; disc:PAgdisc_t):PAgraph_t;cdecl;external;
function agclose(g:PAgraph_t):longint;cdecl;external;
function agread(chan:pointer; disc:PAgdisc_t):PAgraph_t;cdecl;external;
(* Const before type ignored *)
function agmemread(cp:Pchar):PAgraph_t;cdecl;external;
procedure agreadline(para1:longint);cdecl;external;
procedure agsetfile(para1:Pchar);cdecl;external;
function agconcat(g:PAgraph_t; chan:pointer; disc:PAgdisc_t):PAgraph_t;cdecl;external;
function agwrite(g:PAgraph_t; chan:pointer):longint;cdecl;external;
function agisdirected(g:PAgraph_t):longint;cdecl;external;
function agisundirected(g:PAgraph_t):longint;cdecl;external;
function agisstrict(g:PAgraph_t):longint;cdecl;external;
function agissimple(g:PAgraph_t):longint;cdecl;external;
{ nodes  }
function agnode(g:PAgraph_t; name:Pchar; createflag:longint):PAgnode_t;cdecl;external;
function agidnode(g:PAgraph_t; id:TIDTYPE; createflag:longint):PAgnode_t;cdecl;external;
function agsubnode(g:PAgraph_t; n:PAgnode_t; createflag:longint):PAgnode_t;cdecl;external;
function agfstnode(g:PAgraph_t):PAgnode_t;cdecl;external;
function agnxtnode(g:PAgraph_t; n:PAgnode_t):PAgnode_t;cdecl;external;
function aglstnode(g:PAgraph_t):PAgnode_t;cdecl;external;
function agprvnode(g:PAgraph_t; n:PAgnode_t):PAgnode_t;cdecl;external;
function agsubrep(g:PAgraph_t; n:PAgnode_t):PAgsubnode_t;cdecl;external;
function agnodebefore(u:PAgnode_t; v:PAgnode_t):longint;cdecl;external;
{ we have no shame  }
{ edges  }
function agedge(g:PAgraph_t; t:PAgnode_t; h:PAgnode_t; name:Pchar; createflag:longint):PAgedge_t;cdecl;external;
function agidedge(g:PAgraph_t; t:PAgnode_t; h:PAgnode_t; id:TIDTYPE; createflag:longint):PAgedge_t;cdecl;external;
function agsubedge(g:PAgraph_t; e:PAgedge_t; createflag:longint):PAgedge_t;cdecl;external;
function agfstin(g:PAgraph_t; n:PAgnode_t):PAgedge_t;cdecl;external;
function agnxtin(g:PAgraph_t; e:PAgedge_t):PAgedge_t;cdecl;external;
function agfstout(g:PAgraph_t; n:PAgnode_t):PAgedge_t;cdecl;external;
function agnxtout(g:PAgraph_t; e:PAgedge_t):PAgedge_t;cdecl;external;
function agfstedge(g:PAgraph_t; n:PAgnode_t):PAgedge_t;cdecl;external;
function agnxtedge(g:PAgraph_t; e:PAgedge_t; n:PAgnode_t):PAgedge_t;cdecl;external;
{ generic  }
function agraphof(obj:pointer):PAgraph_t;cdecl;external;
function agroot(obj:pointer):PAgraph_t;cdecl;external;
function agcontains(para1:PAgraph_t; para2:pointer):longint;cdecl;external;
function agnameof(para1:pointer):Pchar;cdecl;external;
function agrelabel(obj:pointer; name:Pchar):longint;cdecl;external;
{ scary  }
function agrelabel_node(n:PAgnode_t; newname:Pchar):longint;cdecl;external;
function agdelete(g:PAgraph_t; obj:pointer):longint;cdecl;external;
function agdelsubg(g:PAgraph_t; sub:PAgraph_t):longint;cdecl;external;
{ could be agclose  }
function agdelnode(g:PAgraph_t; arg_n:PAgnode_t):longint;cdecl;external;
function agdeledge(g:PAgraph_t; arg_e:PAgedge_t):longint;cdecl;external;
function agobjkind(para1:pointer):longint;cdecl;external;
{ strings  }
function agstrdup(para1:PAgraph_t; para2:Pchar):Pchar;cdecl;external;
function agstrdup_html(para1:PAgraph_t; para2:Pchar):Pchar;cdecl;external;
function aghtmlstr(para1:Pchar):longint;cdecl;external;
function agstrbind(g:PAgraph_t; para2:Pchar):Pchar;cdecl;external;
function agstrfree(para1:PAgraph_t; para2:Pchar):longint;cdecl;external;
function agcanon(para1:Pchar; para2:longint):Pchar;cdecl;external;
function agstrcanon(para1:Pchar; para2:Pchar):Pchar;cdecl;external;
function agcanonStr(str:Pchar):Pchar;cdecl;external;
{ manages its own buf  }
{ definitions for dynamic string attributes  }
{ dynamic string attributes  }
{ common data header  }
{ shared dict to interpret attr field  }
{ the attribute string values  }
type
  PAgattr_s = ^TAgattr_s;
  TAgattr_s = record
      h : TAgrec_t;
      dict : PDict_t;
      str : ^Pchar;
    end;

{ symbol in one of the above dictionaries  }
{ attribute's name  }
{ its default value for initialization  }
{ its index in attr[]  }
{ referent object type  }
{ immutable value  }
{ always print  }
  PAgsym_s = ^TAgsym_s;
  TAgsym_s = record
      link : TDtlink_t;
      name : Pchar;
      defval : Pchar;
      id : longint;
      kind : byte;
      fixed : byte;
      print : byte;
    end;

{ set of dictionaries per graph  }
{ installed in list of graph recs  }
  PAgdatadict_s = ^TAgdatadict_s;
  TAgdatadict_s = record
      h : TAgrec_t;
      dict : record
          n : PDict_t;
          e : PDict_t;
          g : PDict_t;
        end;
    end;


function agattr(g:PAgraph_t; kind:longint; name:Pchar; value:Pchar):PAgsym_t;cdecl;external;
function agattrsym(obj:pointer; name:Pchar):PAgsym_t;cdecl;external;
function agnxtattr(g:PAgraph_t; kind:longint; attr:PAgsym_t):PAgsym_t;cdecl;external;
function agcopyattr(oldobj:pointer; newobj:pointer):longint;cdecl;external;
function agbindrec(obj:pointer; name:Pchar; size:dword; move_to_front:longint):pointer;cdecl;external;
function aggetrec(obj:pointer; name:Pchar; move_to_front:longint):PAgrec_t;cdecl;external;
function agdelrec(obj:pointer; name:Pchar):longint;cdecl;external;
procedure aginit(g:PAgraph_t; kind:longint; rec_name:Pchar; rec_size:longint; move_to_front:longint);cdecl;external;
procedure agclean(g:PAgraph_t; kind:longint; rec_name:Pchar);cdecl;external;
function agget(obj:pointer; name:Pchar):Pchar;cdecl;external;
function agxget(obj:pointer; sym:PAgsym_t):Pchar;cdecl;external;
function agset(obj:pointer; name:Pchar; value:Pchar):longint;cdecl;external;
function agxset(obj:pointer; sym:PAgsym_t; value:Pchar):longint;cdecl;external;
function agsafeset(obj:pointer; name:Pchar; value:Pchar; def:Pchar):longint;cdecl;external;
{ defintions for subgraphs  }
function agsubg(g:PAgraph_t; name:Pchar; cflag:longint):PAgraph_t;cdecl;external;
{ constructor  }
function agidsubg(g:PAgraph_t; id:TIDTYPE; cflag:longint):PAgraph_t;cdecl;external;
{ constructor  }
function agfstsubg(g:PAgraph_t):PAgraph_t;cdecl;external;
function agnxtsubg(subg:PAgraph_t):PAgraph_t;cdecl;external;
function agparent(g:PAgraph_t):PAgraph_t;cdecl;external;
{ set cardinality  }
function agnnodes(g:PAgraph_t):longint;cdecl;external;
function agnedges(g:PAgraph_t):longint;cdecl;external;
function agnsubg(g:PAgraph_t):longint;cdecl;external;
function agdegree(g:PAgraph_t; n:PAgnode_t; in:longint; out:longint):longint;cdecl;external;
function agcountuniqedges(g:PAgraph_t; n:PAgnode_t; in:longint; out:longint):longint;cdecl;external;
{ memory  }
function agalloc(g:PAgraph_t; size:Tsize_t):pointer;cdecl;external;
function agrealloc(g:PAgraph_t; ptr:pointer; oldsize:Tsize_t; size:Tsize_t):pointer;cdecl;external;
procedure agfree(g:PAgraph_t; ptr:pointer);cdecl;external;
function agheap(g:PAgraph_t):Pvmalloc_s;cdecl;external;
{ an engineering compromise is a joy forever  }
procedure aginternalmapclearlocalnames(g:PAgraph_t);cdecl;external;
{ error handling  }
type
  Pagerrlevel_t = ^Tagerrlevel_t;
  Tagerrlevel_t =  Longint;
  Const
    AGWARN = 0;
    AGERR = 1;
    AGMAX = 2;
    AGPREV = 3;
;
type

  Tagusererrf = function (para1:Pchar):longint;cdecl;

function agseterr(para1:Tagerrlevel_t):Tagerrlevel_t;cdecl;external;
function aglasterr:Pchar;cdecl;external;
(* Const before type ignored *)
function agerr(level:Tagerrlevel_t; fmt:Pchar; args:array of const):longint;cdecl;external;
function agerr(level:Tagerrlevel_t; fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
procedure agerrorf(fmt:Pchar; args:array of const);cdecl;external;
procedure agerrorf(fmt:Pchar);cdecl;external;
(* Const before type ignored *)
procedure agwarningf(fmt:Pchar; args:array of const);cdecl;external;
procedure agwarningf(fmt:Pchar);cdecl;external;
function agerrors:longint;cdecl;external;
function agreseterrors:longint;cdecl;external;
function agseterrf(para1:Tagusererrf):Tagusererrf;cdecl;external;
{ data access macros  }
{ this assumes that e[0] is out and e[1] is inedge, see edgepair in edge.c   }
const
  TAILPORT_ID = 'tailport';  
  HEADPORT_ID = 'headport';  
  var
    Agdirected : TAgdesc_t;cvar;external;
    Agstrictdirected : TAgdesc_t;cvar;external;
    Agundirected : TAgdesc_t;cvar;external;
    Agstrictundirected : TAgdesc_t;cvar;external;
{ fast graphs  }

procedure agflatten(g:PAgraph_t; flag:longint);cdecl;external;
type
  PAgnoderef_t = ^TAgnoderef_t;
  TAgnoderef_t = TAgsubnode_t;

  PAgedgeref_t = ^TAgedgeref_t;
  TAgedgeref_t = TDtlink_t;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

function objtype(var a : TAgtag_s) : dword;
begin
  objtype:=(a.flag0 and bm_TAgtag_s_objtype) shr bp_TAgtag_s_objtype;
end;

procedure set_objtype(var a : TAgtag_s; __objtype : dword);
begin
  a.flag0:=a.flag0 or ((__objtype shl bp_TAgtag_s_objtype) and bm_TAgtag_s_objtype);
end;

function mtflock(var a : TAgtag_s) : dword;
begin
  mtflock:=(a.flag0 and bm_TAgtag_s_mtflock) shr bp_TAgtag_s_mtflock;
end;

procedure set_mtflock(var a : TAgtag_s; __mtflock : dword);
begin
  a.flag0:=a.flag0 or ((__mtflock shl bp_TAgtag_s_mtflock) and bm_TAgtag_s_mtflock);
end;

function attrwf(var a : TAgtag_s) : dword;
begin
  attrwf:=(a.flag0 and bm_TAgtag_s_attrwf) shr bp_TAgtag_s_attrwf;
end;

procedure set_attrwf(var a : TAgtag_s; __attrwf : dword);
begin
  a.flag0:=a.flag0 or ((__attrwf shl bp_TAgtag_s_attrwf) and bm_TAgtag_s_attrwf);
end;

function seq(var a : TAgtag_s) : dword;
begin
  seq:=(a.flag0 and bm_TAgtag_s_seq) shr bp_TAgtag_s_seq;
end;

procedure set_seq(var a : TAgtag_s; __seq : dword);
begin
  a.flag0:=a.flag0 or ((__seq shl bp_TAgtag_s_seq) and bm_TAgtag_s_seq);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGTAG(obj : longint) : longint;
begin
  AGTAG:=(PAgobj_t(obj))^.tag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGTYPE(obj : longint) : longint;
begin
  AGTYPE:=(AGTAG(obj)).objtype;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGID(obj : longint) : longint;
begin
  AGID:=(AGTAG(obj)).id;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGSEQ(obj : longint) : longint;
begin
  AGSEQ:=(AGTAG(obj)).seq;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGATTRWF(obj : longint) : longint;
begin
  AGATTRWF:=(AGTAG(obj)).attrwf;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AGDATA(obj : longint) : longint;
begin
  AGDATA:=(PAgobj_t(obj))^.data;
end;

function directed(var a : TAgdesc_s) : dword;
begin
  directed:=(a.flag0 and bm_TAgdesc_s_directed) shr bp_TAgdesc_s_directed;
end;

procedure set_directed(var a : TAgdesc_s; __directed : dword);
begin
  a.flag0:=a.flag0 or ((__directed shl bp_TAgdesc_s_directed) and bm_TAgdesc_s_directed);
end;

function strict(var a : TAgdesc_s) : dword;
begin
  strict:=(a.flag0 and bm_TAgdesc_s_strict) shr bp_TAgdesc_s_strict;
end;

procedure set_strict(var a : TAgdesc_s; __strict : dword);
begin
  a.flag0:=a.flag0 or ((__strict shl bp_TAgdesc_s_strict) and bm_TAgdesc_s_strict);
end;

function no_loop(var a : TAgdesc_s) : dword;
begin
  no_loop:=(a.flag0 and bm_TAgdesc_s_no_loop) shr bp_TAgdesc_s_no_loop;
end;

procedure set_no_loop(var a : TAgdesc_s; __no_loop : dword);
begin
  a.flag0:=a.flag0 or ((__no_loop shl bp_TAgdesc_s_no_loop) and bm_TAgdesc_s_no_loop);
end;

function maingraph(var a : TAgdesc_s) : dword;
begin
  maingraph:=(a.flag0 and bm_TAgdesc_s_maingraph) shr bp_TAgdesc_s_maingraph;
end;

procedure set_maingraph(var a : TAgdesc_s; __maingraph : dword);
begin
  a.flag0:=a.flag0 or ((__maingraph shl bp_TAgdesc_s_maingraph) and bm_TAgdesc_s_maingraph);
end;

function flatlock(var a : TAgdesc_s) : dword;
begin
  flatlock:=(a.flag0 and bm_TAgdesc_s_flatlock) shr bp_TAgdesc_s_flatlock;
end;

procedure set_flatlock(var a : TAgdesc_s; __flatlock : dword);
begin
  a.flag0:=a.flag0 or ((__flatlock shl bp_TAgdesc_s_flatlock) and bm_TAgdesc_s_flatlock);
end;

function no_write(var a : TAgdesc_s) : dword;
begin
  no_write:=(a.flag0 and bm_TAgdesc_s_no_write) shr bp_TAgdesc_s_no_write;
end;

procedure set_no_write(var a : TAgdesc_s; __no_write : dword);
begin
  a.flag0:=a.flag0 or ((__no_write shl bp_TAgdesc_s_no_write) and bm_TAgdesc_s_no_write);
end;

function has_attrs(var a : TAgdesc_s) : dword;
begin
  has_attrs:=(a.flag0 and bm_TAgdesc_s_has_attrs) shr bp_TAgdesc_s_has_attrs;
end;

procedure set_has_attrs(var a : TAgdesc_s; __has_attrs : dword);
begin
  a.flag0:=a.flag0 or ((__has_attrs shl bp_TAgdesc_s_has_attrs) and bm_TAgdesc_s_has_attrs);
end;

function has_cmpnd(var a : TAgdesc_s) : dword;
begin
  has_cmpnd:=(a.flag0 and bm_TAgdesc_s_has_cmpnd) shr bp_TAgdesc_s_has_cmpnd;
end;

procedure set_has_cmpnd(var a : TAgdesc_s; __has_cmpnd : dword);
begin
  a.flag0:=a.flag0 or ((__has_cmpnd shl bp_TAgdesc_s_has_cmpnd) and bm_TAgdesc_s_has_cmpnd);
end;


end.
