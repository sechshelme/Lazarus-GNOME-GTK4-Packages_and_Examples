
unit qset;
interface

{
  Automatically converted by H2Pas 1.0.0 from qset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    qset.h
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
Pchar  = ^char;
PFILE  = ^FILE;
Plongint  = ^longint;
PsetelemT  = ^setelemT;
PsetT  = ^setT;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-set.htm"
  >-------------------------------</a><a name="TOP">-</a>

   qset.h
     header file for qset.c that implements set

   see qh-set.htm and qset.c

   only uses mem.c, malloc/free

   for error handling, writes message and calls
      qh_errexit(qhmem_ERRqhull, NULL, NULL);

   set operations satisfy the following properties:
    - sets have a max size, the actual size (if different) is stored at the end
    - every set is NULL terminated
    - sets may be sorted or unsorted, the caller must distinguish this

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/qset.h#4 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFset}

const
  qhDEFset = 1;  
{$include <stdio.h>}
{================= -structures- =============== }
{$ifndef DEFsetT}

const
  DEFsetT = 1;  
type
{ a set is a sorted or unsorted array of pointers  }
{$endif}
{ [jan'15] Decided not to use countT.  Most sets are small.  The code uses signed tests  }
{-<a                                      href="qh-set.htm#TOC"
>----------------------------------------</a><a name="setT">-</a>

setT
  a set or list of pointers with maximum size and actual size.

variations:
  unsorted, unique   -- a list of unique pointers with NULL terminator
                           user guarantees uniqueness
  sorted             -- a sorted list of unique pointers with NULL terminator
                           qset.c guarantees uniqueness
  unsorted           -- a list of pointers terminated with NULL
  indexed            -- an array of pointers with NULL elements

structure for set of n elements:

        --------------
        |  maxsize
        --------------
        |  e[0] - a pointer, may be NULL for indexed sets
        --------------
        |  e[1]

        --------------
        |  ...
        --------------
        |  e[n-1]
        --------------
        |  e[n] = NULL
        --------------
        |  ...
        --------------
        |  e[maxsize] - n+1 or NULL (determines actual size of set)
        --------------

 }
{-- setelemT -- internal type to allow both pointers and indices
 }
type
  PsetelemT = ^TsetelemT;
  TsetelemT = TsetelemT;
{ integer used for e[maxSize]  }
  PsetelemT = ^TsetelemT;
  TsetelemT = record
      case longint of
        0 : ( p : pointer );
        1 : ( i : longint );
      end;

{ maximum number of elements (except NULL)  }
{ array of pointers, tail is NULL  }
{ last slot (unless NULL) is actual size+1
                           e[maxsize]==NULL or e[e[maxsize]-1]==NULL  }
{ this may generate a warning since e[] contains
                           maxsize elements  }
  PsetT = ^TsetT;
  TsetT = record
      maxsize : longint;
      e : array[0..0] of TsetelemT;
    end;

{=========== -constants- ========================= }
{-<a                                 href="qh-set.htm#TOC"
  >-----------------------------------</a><a name="SETelemsize">-</a>

  SETelemsize
    size of a set element in bytes
 }

{ was #define dname def_expr }
function SETelemsize : longint;  

{======= prototypes in alphabetical order ============ }
procedure qh_setaddsorted(setp:PPsetT; elem:pointer);cdecl;external;
procedure qh_setaddnth(setp:PPsetT; nth:longint; newelem:pointer);cdecl;external;
procedure qh_setappend(setp:PPsetT; elem:pointer);cdecl;external;
procedure qh_setappend_set(setp:PPsetT; setA:PsetT);cdecl;external;
procedure qh_setappend2ndlast(setp:PPsetT; elem:pointer);cdecl;external;
(* Const before type ignored *)
procedure qh_setcheck(set:PsetT; tname:Pchar; id:dword);cdecl;external;
procedure qh_setcompact(set:PsetT);cdecl;external;
function qh_setcopy(set:PsetT; extra:longint):PsetT;cdecl;external;
function qh_setdel(set:PsetT; elem:pointer):pointer;cdecl;external;
function qh_setdellast(set:PsetT):pointer;cdecl;external;
function qh_setdelnth(set:PsetT; nth:longint):pointer;cdecl;external;
function qh_setdelnthsorted(set:PsetT; nth:longint):pointer;cdecl;external;
function qh_setdelsorted(set:PsetT; newelem:pointer):pointer;cdecl;external;
function qh_setduplicate(set:PsetT; elemsize:longint):PsetT;cdecl;external;
function qh_setendpointer(set:PsetT):^pointer;cdecl;external;
function qh_setequal(setA:PsetT; setB:PsetT):longint;cdecl;external;
function qh_setequal_except(setA:PsetT; skipelemA:pointer; setB:PsetT; skipelemB:pointer):longint;cdecl;external;
function qh_setequal_skip(setA:PsetT; skipA:longint; setB:PsetT; skipB:longint):longint;cdecl;external;
procedure qh_setfree(set:PPsetT);cdecl;external;
procedure qh_setfree2(setp:PPsetT; elemsize:longint);cdecl;external;
procedure qh_setfreelong(set:PPsetT);cdecl;external;
function qh_setin(set:PsetT; setelem:pointer):longint;cdecl;external;
function qh_setindex(set:PsetT; setelem:pointer):longint;cdecl;external;
procedure qh_setlarger(setp:PPsetT);cdecl;external;
function qh_setlarger_quick(setsize:longint; newsize:Plongint):longint;cdecl;external;
function qh_setlast(set:PsetT):pointer;cdecl;external;
function qh_setnew(size:longint):PsetT;cdecl;external;
function qh_setnew_delnthsorted(set:PsetT; size:longint; nth:longint; prepend:longint):PsetT;cdecl;external;
(* Const before type ignored *)
procedure qh_setprint(fp:PFILE; _string:Pchar; set:PsetT);cdecl;external;
procedure qh_setreplace(set:PsetT; oldelem:pointer; newelem:pointer);cdecl;external;
function qh_setsize(set:PsetT):longint;cdecl;external;
function qh_settemp(setsize:longint):PsetT;cdecl;external;
procedure qh_settempfree(set:PPsetT);cdecl;external;
procedure qh_settempfree_all;cdecl;external;
function qh_settemppop:PsetT;cdecl;external;
procedure qh_settemppush(set:PsetT);cdecl;external;
procedure qh_settruncate(set:PsetT; size:longint);cdecl;external;
function qh_setunique(set:PPsetT; elem:pointer):longint;cdecl;external;
procedure qh_setzero(set:PsetT; idx:longint; size:longint);cdecl;external;
{$endif}
{ qhDEFset  }

implementation

{ was #define dname def_expr }
function SETelemsize : longint;
  begin
    SETelemsize:=longint(sizeof(setelemT));
  end;


end.
