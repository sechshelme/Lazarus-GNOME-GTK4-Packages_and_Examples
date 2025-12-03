unit cdt;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _CDT_H}

const
  _CDT_H = 1;  
{ C++ extern C conditionnal removed }
{	Public interface for the dictionary library
**
**      Written by Kiem-Phong Vo
 }
  CDT_VERSION = 20050420;  
{$include <stddef.h>	/* size_t */}
{$include <string.h>}
type
  Tdtlink_s = TDtlink_t;
  Tdthold_s = TDthold_t;
  Tdtdisc_s = TDtdisc_t;
  Tdtmethod_s = TDtmethod_t;
  Tdtdata_s = TDtdata_t;
  Tdt_s = TDt_t;
  Tdt_s = TDict_t;
{ for libdict compatibility  }
  Tdtstat_s = TDtstat_t;

  PDtmemory_f = ^TDtmemory_f;
  TDtmemory_f = function (para1:PDt_t; para2:pointer; para3:Tsize_t; para4:PDtdisc_t):pointer;cdecl;

  PDtsearch_f = ^TDtsearch_f;
  TDtsearch_f = function (para1:PDt_t; para2:pointer; para3:longint):pointer;cdecl;

  PDtmake_f = ^TDtmake_f;
  TDtmake_f = function (para1:PDt_t; para2:pointer; para3:PDtdisc_t):pointer;cdecl;

  TDtfree_f = procedure (para1:PDt_t; para2:pointer; para3:PDtdisc_t);cdecl;

  TDtcompar_f = function (para1:PDt_t; para2:pointer; para3:pointer; para4:PDtdisc_t):longint;cdecl;

  TDthash_f = function (para1:PDt_t; para2:pointer; para3:PDtdisc_t):dword;cdecl;

  TDtevent_f = function (para1:PDt_t; para2:longint; para3:pointer; para4:PDtdisc_t):longint;cdecl;
{ right child		 }
{ hash value		 }
{ left child		 }
  Pdtlink_s = ^Tdtlink_s;
  Tdtlink_s = record
      right : PDtlink_t;cdecl;
      hl : record
          case longint of
            0 : ( _hash : dword );
            1 : ( _left : PDtlink_t );
          end;
    end;

{ private structure to hold an object  }
{ header		 }
{ user object		 }
  Pdthold_s = ^Tdthold_s;
  Tdthold_s = record
      hdr : TDtlink_t;
      obj : pointer;
    end;

{ method to manipulate dictionary structure  }
{ search function	 }
{ type of operation	 }
  Pdtmethod_s = ^Tdtmethod_s;
  Tdtmethod_s = record
      searchf : TDtsearch_f;
      _type : longint;
    end;

{ stuff that may be in shared memory  }
{ type of dictionary			 }
{ finger to last search element	 }
{ hash table				 }
{ linked list				 }
{ number of hash slots			 }
{ number of objects			 }
{ number of nested loops		 }
{ min path before splay, always even	 }
{ for hash dt, > 0: fixed table size 	 }
  Pdtdata_s = ^Tdtdata_s;
  Tdtdata_s = record
      _type : longint;
      here : PDtlink_t;
      hh : record
          case longint of
            0 : ( _htab : ^PDtlink_t );
            1 : ( _head : PDtlink_t );
          end;
      ntab : longint;
      size : longint;
      loop : longint;
      minp : longint;
    end;

{ structure to hold methods that manipulate an object  }
{ where the key begins in an object	 }
{ key size and type			 }
{ offset to Dtlink_t field		 }
{ object constructor			 }
{ object destructor			 }
{ to compare two objects		 }
{ to compute hash value of an object	 }
{ to allocate/free memory		 }
{ to process events			 }
  Pdtdisc_s = ^Tdtdisc_s;
  Tdtdisc_s = record
      key : longint;
      size : longint;
      link : longint;
      makef : TDtmake_f;
      freef : TDtfree_f;
      comparf : TDtcompar_f;
      hashf : TDthash_f;
      memoryf : TDtmemory_f;
      eventf : TDtevent_f;
    end;

{ the dictionary structure itself  }
{ search function			 }
{ method to manipulate objs		 }
{ sharable data			 }
{ function to alloc/free memory	 }
{ dictionary method			 }
{ type information			 }
{ number of parent view dictionaries	 }
{ next on viewpath			 }
{ dictionary being walked		 }
{ for user's usage			 }
  Pdt_s = ^Tdt_s;
  Tdt_s = record
      searchf : TDtsearch_f;
      disc : PDtdisc_t;
      data : PDtdata_t;
      memoryf : TDtmemory_f;
      meth : PDtmethod_t;
      _type : longint;
      nview : longint;
      view : PDt_t;
      walk : PDt_t;
      user : pointer;
    end;

{ structure to get status of a dictionary  }
{ method type				 }
{ number of elements			 }
{ number of chains or levels		 }
{ max size of a chain or a level	 }
{ counts of chains or levels by size	 }
  Pdtstat_s = ^Tdtstat_s;
  Tdtstat_s = record
      dt_meth : longint;
      dt_size : longint;
      dt_n : longint;
      dt_max : longint;
      dt_count : Plongint;
    end;

{ flag set if the last search operation actually found the object  }

const
  DT_FOUND = 0100000;  
{ supported storage methods  }
{ set with unique elements		 }
  DT_SET = 0000001;  
{ multiset				 }
  DT_BAG = 0000002;  
{ ordered set (self-adjusting tree)	 }
  DT_OSET = 0000004;  
{ ordered multiset			 }
  DT_OBAG = 0000010;  
{ linked list				 }
  DT_LIST = 0000020;  
{ stack: insert/delete at top		 }
  DT_STACK = 0000040;  
{ queue: insert at top, delete at tail	 }
  DT_QUEUE = 0000100;  
{ deque: insert at top, append at tail	 }
  DT_DEQUE = 0000200;  
{ all currently supported methods	 }
  DT_METHODS = 0000377;  
{ asserts to dtdisc()  }
{ compare methods equivalent		 }
  DT_SAMECMP = 0000001;  
{ hash methods equivalent		 }
  DT_SAMEHASH = 0000002;  
{ types of search  }
{ insert object if not found		 }
  DT_INSERT = 0000001;  
{ delete object if found		 }
  DT_DELETE = 0000002;  
{ look for an object			 }
  DT_SEARCH = 0000004;  
{ look for next element		 }
  DT_NEXT = 0000010;  
{ find previous element		 }
  DT_PREV = 0000020;  
{ renewing an object			 }
  DT_RENEW = 0000040;  
{ clearing all objects			 }
  DT_CLEAR = 0000100;  
{ get first object			 }
  DT_FIRST = 0000200;  
{ get last object			 }
  DT_LAST = 0000400;  
{ find object matching key		 }
  DT_MATCH = 0001000;  
{ search using internal representation	 }
  DT_VSEARCH = 0002000;  
{ attach an object to the dictionary	 }
  DT_ATTACH = 0004000;  
{ detach an object from the dictionary	 }
  DT_DETACH = 0010000;  
{ used on Dtlist to append an object	 }
  DT_APPEND = 0020000;  
{ events  }
{ a dictionary is being opened		 }
  DT_OPEN = 1;  
{ a dictionary is being closed		 }
  DT_CLOSE = 2;  
{ discipline is about to be changed	 }
  DT_DISC = 3;  
{ method is about to be changed	 }
  DT_METH = 4;  
{ dtopen() is done			 }
  DT_ENDOPEN = 5;  
{ dtclose() is done			 }
  DT_ENDCLOSE = 6;  
{ setting hash table size		 }
  DT_HASHSIZE = 7;  
  var
    Dtset : PDtmethod_t;cvar;external libxxx;
    Dtbag : PDtmethod_t;cvar;external libxxx;
    Dtoset : PDtmethod_t;cvar;external libxxx;
    Dtobag : PDtmethod_t;cvar;external libxxx;
    Dtlist : PDtmethod_t;cvar;external libxxx;
    Dtstack : PDtmethod_t;cvar;external libxxx;
    Dtqueue : PDtmethod_t;cvar;external libxxx;
    Dtdeque : PDtmethod_t;cvar;external libxxx;
{ compatibility stuff; will go away  }
{$ifndef KPVDEL}
  var
    Dtorder : PDtmethod_t;cvar;external libxxx;
    Dttree : PDtmethod_t;cvar;external libxxx;
    Dthash : PDtmethod_t;cvar;external libxxx;
    _Dttree : TDtmethod_t;cvar;external libxxx;
    _Dthash : TDtmethod_t;cvar;external libxxx;
    _Dtlist : TDtmethod_t;cvar;external libxxx;
    _Dtqueue : TDtmethod_t;cvar;external libxxx;
    _Dtstack : TDtmethod_t;cvar;external libxxx;
{$endif}

function dtopen(para1:PDtdisc_t; para2:PDtmethod_t):PDt_t;cdecl;external libxxx;
function dtclose(para1:PDt_t):longint;cdecl;external libxxx;
function dtview(para1:PDt_t; para2:PDt_t):PDt_t;cdecl;external libxxx;
function dtdisc(dt:PDt_t; para2:PDtdisc_t; para3:longint):PDtdisc_t;cdecl;external libxxx;
function dtmethod(para1:PDt_t; para2:PDtmethod_t):PDtmethod_t;cdecl;external libxxx;
function dtflatten(para1:PDt_t):PDtlink_t;cdecl;external libxxx;
function dtextract(para1:PDt_t):PDtlink_t;cdecl;external libxxx;
function dtrestore(para1:PDt_t; para2:PDtlink_t):longint;cdecl;external libxxx;
function dtwalk(para1:PDt_t; para2:function (para1:PDt_t; para2:pointer; para3:pointer):longint; para3:pointer):longint;cdecl;external libxxx;
function dtrenew(para1:PDt_t; para2:pointer):pointer;cdecl;external libxxx;
function dtsize(para1:PDt_t):longint;cdecl;external libxxx;
function dtstat(para1:PDt_t; para2:PDtstat_t; para3:longint):longint;cdecl;external libxxx;
function dtstrhash(para1:dword; para2:pointer; para3:longint):dword;cdecl;external libxxx;
{ special search function for tree structure only  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _CDT_H  }

// === Konventiert am: 3-12-25 15:08:33 ===


implementation



end.
